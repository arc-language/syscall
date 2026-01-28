#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <linux/futex.h>
#include <sys/time.h>
#include <asm/prctl.h>
#include <sys/prctl.h>
#include <sched.h>
#include <string.h>
#include <errno.h>

// AsyncResult struct (16 bytes)
typedef struct {
    volatile int32_t ready; // 0 = pending, 1 = ready
    int32_t padding;        // alignment
    int64_t result;         // Return value
} AsyncResult;

// --- Helper Functions ---

long futex(volatile int32_t *uaddr, int futex_op, int val, 
          const struct timespec *timeout, int32_t *uaddr2, int val3) {
    return syscall(SYS_futex, uaddr, futex_op, val, timeout, uaddr2, val3);
}

AsyncResult* alloc_result() {
    AsyncResult* res = mmap(NULL, sizeof(AsyncResult), 
        PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    res->ready = 0;
    res->result = 0;
    return res;
}

int64_t await_task(AsyncResult* res) {
    while (__atomic_load_n(&res->ready, __ATOMIC_SEQ_CST) == 0) {
        // FUTEX_WAIT | FUTEX_PRIVATE_FLAG (128)
        futex(&res->ready, 0 | 128, 0, NULL, NULL, 0);
    }
    return res->result;
}

// --- Task 1 Logic ---
int task1_func(void* arg) {
    AsyncResult* my_res = (AsyncResult*)arg;
    
    printf("  [C-Task 1] Working (sleeping 2s)...\n");
    fflush(stdout); 
    
    sleep(2);
    
    printf("  [C-Task 1] Done.\n");
    fflush(stdout);

    // Write result
    my_res->result = 100;
    __atomic_store_n(&my_res->ready, 1, __ATOMIC_SEQ_CST);
    
    // FUTEX_WAKE | FUTEX_PRIVATE_FLAG (128)
    futex(&my_res->ready, 1 | 128, 1, NULL, NULL, 0);
    
    return 0;
}

// --- Task 2 Logic ---
int task2_func(void* arg) {
    AsyncResult* my_res = (AsyncResult*)arg;

    printf(" [C-Task 2] Waiting for Task 1...\n");
    fflush(stdout);

    // --- Spawn Task 1 (Nested) ---
    AsyncResult* t1_res = alloc_result();
    
    // Allocate Stack for T1
    size_t stack_size = 1024 * 1024;
    void* stack = mmap(NULL, stack_size, PROT_READ | PROT_WRITE, 
                       MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
    if (stack == MAP_FAILED) { perror("mmap stack t1"); exit(1); }
    void* stack_top = stack + stack_size;

    // Get FS Base (TLS)
    uint64_t fs_base;
    syscall(SYS_arch_prctl, ARCH_GET_FS, &fs_base);

    // Flags: VM | FS | FILES | SIGHAND | THREAD | SYSVSEM | SETTLS | PARENT_SETTID
    int flags = CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | 
                CLONE_THREAD | CLONE_SYSVSEM | CLONE_SETTLS | CLONE_PARENT_SETTID;
    
    pid_t tid = clone(task1_func, stack_top, flags, t1_res, NULL, (void*)fs_base, NULL);
    
    if (tid == -1) {
        printf(" [C-Task 2] Failed to clone Task 1: %s\n", strerror(errno));
        return 1;
    }

    // Await T1
    int64_t val = await_task(t1_res);
    
    printf(" [C-Task 2] Task 1 returned: %ld\n", val);
    fflush(stdout);

    // Complete Task 2
    my_res->result = 0; // success
    __atomic_store_n(&my_res->ready, 1, __ATOMIC_SEQ_CST);
    futex(&my_res->ready, 1 | 128, 1, NULL, NULL, 0);
    
    return 0;
}

// --- Main ---
int main() {
    printf("[C-Main] Spawning Task 2...\n");
    fflush(stdout);

    AsyncResult* t2_res = alloc_result();

    size_t stack_size = 1024 * 1024;
    void* stack = mmap(NULL, stack_size, PROT_READ | PROT_WRITE, 
                       MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
    void* stack_top = stack + stack_size;

    uint64_t fs_base;
    syscall(SYS_arch_prctl, ARCH_GET_FS, &fs_base);

    int flags = CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | 
                CLONE_THREAD | CLONE_SYSVSEM | CLONE_SETTLS | CLONE_PARENT_SETTID;

    pid_t tid = clone(task2_func, stack_top, flags, t2_res, NULL, (void*)fs_base, NULL);

    if (tid == -1) {
        printf("[C-Main] Clone failed: %s\n", strerror(errno));
        return 1;
    }

    printf("[C-Main] Task 2 spawned. Sleeping...\n");
    fflush(stdout);
    
    sleep(4);
    
    printf("[C-Main] Exiting.\n");
    return 0;
}