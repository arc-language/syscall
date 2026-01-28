#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <linux/futex.h>
#include <signal.h>
#include <sched.h>
#include <string.h>
#include <errno.h>
#include <stdint.h>
#include <ucontext.h>
#include <asm/prctl.h> 
#include <sys/prctl.h>

// Fix for missing constant in some envs
#ifndef ARCH_GET_FS
#define ARCH_GET_FS 0x1003
#endif

// --- Constants ---
#define STACK_SIZE (1024 * 1024) // 1 MB
#define PAGE_SIZE  4096
#define CHUNK_SIZE (64 * 1024)   // 64 KB initial/growth chunks
#define ALT_STACK_SIZE 4096      // Bottom 4KB reserved for Signal Handler

// --- AsyncResult Layout ---
typedef struct {
    volatile int32_t ready;
    int32_t padding;
    int64_t result;
} AsyncResult;

// --- Futex Helper ---
long futex(volatile int32_t *uaddr, int futex_op, int val, 
          const struct timespec *timeout, int32_t *uaddr2, int val3) {
    return syscall(SYS_futex, uaddr, futex_op, val, timeout, uaddr2, val3);
}

// --- Segfault Handler ---
void segfault_handler(int sig, siginfo_t *si, void *ctx_void) {
    ucontext_t *ctx = (ucontext_t*)ctx_void;
    void *fault_addr = si->si_addr;
    
    // Align down to page boundary
    uint64_t page_addr = (uint64_t)fault_addr & ~(PAGE_SIZE - 1);

    // Grow Stack: mprotect(PageAddr, 64KB, RW)
    if (mprotect((void*)page_addr, CHUNK_SIZE, PROT_READ | PROT_WRITE) != 0) {
        syscall(SYS_exit, 139);
    }
}

// --- Recursive Burner ---
int recursive_burn(int depth) {
    if (depth == 0) {
        printf("  [Stack] Reached bottom (depth 0)!\n");
        return 0;
    }
    if (depth % 1000 == 0) {
        // Approx 64 bytes per frame
        int used_kb = (5000 - depth) * 64 / 1024;
        printf("  [Stack] Depth: %d (approx %d KB used)\n", depth, used_kb);
        fflush(stdout);
    }
    return recursive_burn(depth - 1) + 0;
}

// --- Worker Thread ---
int worker_func(void* arg) {
    AsyncResult* res = (AsyncResult*)arg;

    // 1. Setup Alternate Signal Stack
    // In this C demo, we passed the stack_base via res->result
    void* stack_base = (void*)res->result; 
    
    stack_t ss;
    ss.ss_sp = stack_base;          // Bottom 4KB
    ss.ss_size = ALT_STACK_SIZE;
    ss.ss_flags = 0;
    if (sigaltstack(&ss, NULL) == -1) {
        perror("sigaltstack child");
        exit(1);
    }

    printf("[Worker] Stack Test Started.\n");
    fflush(stdout);

    // Reset result for actual usage
    res->result = 0;

    recursive_burn(5000);

    printf("[Worker] Passed.\n");
    fflush(stdout);

    res->result = 100;
    __atomic_store_n(&res->ready, 1, __ATOMIC_SEQ_CST);
    futex(&res->ready, 1 | 128, 1, NULL, NULL, 0); // WAKE_PRIVATE

    return 0;
}

// --- Main ---
int main() {
    // 1. Install Signal Handler Globally
    struct sigaction sa;
    memset(&sa, 0, sizeof(sa));
    sa.sa_flags = SA_SIGINFO | SA_ONSTACK | SA_RESTART;
    sa.sa_sigaction = segfault_handler;
    sigemptyset(&sa.sa_mask);
    if (sigaction(SIGSEGV, &sa, NULL) == -1) {
        perror("sigaction");
        exit(1);
    }

    printf("[C-Main] Spawning stack eater...\n");
    fflush(stdout);

    // 2. Allocate Result
    AsyncResult* res = mmap(NULL, sizeof(AsyncResult), PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
    
    // 3. Allocate 1MB Stack Region
    void* stack_base = mmap(NULL, STACK_SIZE, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_STACK, -1, 0);
    if (stack_base == MAP_FAILED) { perror("mmap stack"); exit(1); }
    
    void* stack_top = stack_base + STACK_SIZE;

    // 4. Commit Bottom 4KB (Alt Stack)
    mprotect(stack_base, ALT_STACK_SIZE, PROT_READ|PROT_WRITE);

    // 5. Commit Top 64KB (Initial Stack)
    void* initial_stack_start = stack_top - CHUNK_SIZE;
    mprotect(initial_stack_start, CHUNK_SIZE, PROT_READ|PROT_WRITE);

    // Hack: Pass stack_base to child via result struct
    res->result = (int64_t)stack_base;

    // 6. Clone
    uint64_t fs_base;
    syscall(SYS_arch_prctl, ARCH_GET_FS, &fs_base);

    // Flags: VM | FS | FILES | SIGHAND | THREAD | SYSVSEM | SETTLS | PARENT_SETTID
    int flags = CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | 
                CLONE_THREAD | 0x00040000 | CLONE_SETTLS | CLONE_PARENT_SETTID;

    pid_t tid = clone(worker_func, stack_top, flags, res, NULL, (void*)fs_base, NULL);

    if (tid == -1) {
        perror("clone");
        exit(1);
    }

    // 7. Await
    while (__atomic_load_n(&res->ready, __ATOMIC_SEQ_CST) == 0) {
        futex(&res->ready, 0 | 128, 0, NULL, NULL, 0); // WAIT_PRIVATE
    }

    printf("[C-Main] Task returned: %ld\n", res->result);
    return 0;
}