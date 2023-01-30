#ifndef _BENOS_USR_SYSCALL_H_
#define  _BENOS_USR_SYSCALL_H_

extern unsigned long syscall(int nr, ...);

unsigned long malloc(void);

extern int __clone(int (*fn)(void *arg), void *child_stack,
		int flags, void *arg);
extern unsigned long syscall(int nr, ...);

int clone(int (*fn)(void *arg), void *child_stack,
		int flags, void *arg);

#endif
