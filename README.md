# syscall

This repository contains the core low-level system call interfaces for the **Arc programming language**. It serves as the foundation for the Arc standard library, providing the necessary primitives to interact with the underlying operating system kernel.

## Platform Support

This package is designed to house system call implementations for all supported operating systems and architectures. It abstracts the specific Kernel ABI mechanisms while exposing direct access to system resources.

Planned and supported platforms include:
*   **Linux** (amd64, arm64, riscv64)
*   **macOS / Darwin** (amd64, arm64)
*   **Windows** (amd64)
*   **BSD** variants

*Currently, the examples below demonstrate the **Linux/AMD64** implementation.*

## Design & Pattern

### Return Values
Unlike C, where `errno` is a thread-local global, system calls in this package use a tuple return pattern. Functions return the **result** and the **error code** directly.

```arc
// func name(args...) (result, errno)
```

*   **Success:** `errno` is `0`.
*   **Failure:** `errno` contains the positive error code (e.g., `EACCES`, `ENOENT`), and `result` indicates the failure state (usually `-1`).

### Data Structures
Kernel structures (such as `TimeSpec`, `Stat`, `SockAddr`) are defined as native Arc structs, ensuring memory layout compatibility with the operating system.

## Examples (Linux AMD64)

### 1. Basic File I/O
Writing directly to Standard Output (File Descriptor 1).

```arc
namespace main

import "github.com/arc-language/syscall/linux/amd64"

func main() int32 {
    let msg: string = "Hello from Kernel!\n"
    
    // write(fd, buffer, length) -> (bytes_written, errno)
    let (n, err) = syscall.write(1, cast<*byte>(msg), 19)

    if err != 0 {
        return 1
    }
    return 0
}
```

### 2. Process Management
Using `fork`, `execve`, and `wait4` to manage processes.

```arc
namespace main

import "github.com/arc-language/syscall/linux/amd64"

extern c { func printf(*byte, ...) int32 }

func main() int32 {
    // Clone the process
    let (pid, err) = syscall.fork()

    if err != 0 {
        return 1
    }

    if pid == 0 {
        // --- Child Process ---
        let cmd: string = "/bin/ls"
        let argv: [2]string = {cmd, null}
        
        // execve replaces the current process image
        syscall.execve(cmd, &argv[0], null)
        syscall.exit(1)
    }

    // --- Parent Process ---
    let status: int32 = 0
    // Wait for the child to finish
    syscall.wait4(pid, &status, 0, null)
    
    return 0
}
```

### 3. Networking (TCP)
A low-level example of creating a socket, setting options, binding, and listening.

```arc
namespace main

import "github.com/arc-language/syscall/linux/amd64"

func main() int32 {
    // 1. Create Socket (AF_INET = 2, SOCK_STREAM = 1)
    let (sockfd, err) = syscall.socket(syscall.AF_INET, syscall.SOCK_STREAM, 0)
    if err != 0 { return 1 }

    // 2. Set SO_REUSEADDR
    let opt: int32 = 1
    syscall.setsockopt(sockfd, syscall.SOL_SOCKET, syscall.SO_REUSEADDR, cast<*byte>(&opt), 4)

    // 3. Bind to Port 8080
    // Port 8080 in Big Endian is 36895
    let addr: syscall.SockAddrIn = {
        sin_family: 2,
        sin_port: 36895, 
        sin_addr: 0, // 0.0.0.0
        sin_zero: {0, 0, 0, 0, 0, 0, 0, 0}
    }

    let (bind_res, bind_err) = syscall.bind(sockfd, cast<*syscall.SockAddr>(&addr), 16)
    if bind_err != 0 { return 1 }

    // 4. Listen
    syscall.listen(sockfd, 128)

    // Clean up
    syscall.close(sockfd)
    return 0
}
```

## Capability Summary

This module provides comprehensive access to kernel subsystems:

| Domain | Key Capabilities |
| :--- | :--- |
| **File I/O** | `open`, `close`, `read`, `write`, `lseek`, `pread`/`pwrite` |
| **Filesystem** | `stat`, `mkdir`, `chmod`, `chown`, `rename`, `link`/`unlink` |
| **Memory** | `mmap`, `munmap`, `mprotect`, `mremap`, `brk` |
| **Network** | BSD Sockets (`socket`, `connect`, `bind`, `listen`, `accept`, `send`/`recv`) |
| **Process** | `fork`, `clone`, `execve`, `wait4`, `exit`, `getpid` |
| **Signals** | `rt_sigaction`, `kill`, `pause`, `alarm` |
| **Time** | `nanosleep`, `gettimeofday`, `clock_gettime` |
| **Epoll** | `epoll_create`, `epoll_ctl`, `epoll_wait` (Linux specific) |