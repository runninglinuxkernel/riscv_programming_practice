#ifndef _BENOS_USR_SYSCALL_H_
#define  _BENOS_USR_SYSCALL_H_

extern unsigned long syscall(int nr, ...);

unsigned long malloc(void);

#endif
