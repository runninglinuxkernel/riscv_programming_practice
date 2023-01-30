#ifndef __BENOS_UAPI_SYSCALL_H
#define __BENOS_UAPI_SYSCALL_H

#define __NR_open 0
//__SYSCALL(__NR_open, sys_open)

#define __NR_close 1
//__SYSCALL(__NR_close, sys_close)

#define __NR_read 2
//__SYSCALL(__NR_read, sys_read)

#define __NR_write 3
//__SYSCALL(__NR_write, sys_write)

#define __NR_clone 4
//__SYSCALL(__NR_clone, sys_clone)
//
#define __NR_malloc 5

#define __NR_syscalls 6

#endif
