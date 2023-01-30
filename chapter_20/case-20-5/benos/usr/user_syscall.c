#include <uapi/syscall.h>
#include "syscall.h"

int clone(int (*fn)(void *arg), void *child_stack,
		int flags, void *arg)
{

	return __clone(fn, child_stack, flags, arg);
}

unsigned long malloc(void)
{
	return syscall(__NR_malloc);
}
