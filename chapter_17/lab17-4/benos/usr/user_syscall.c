#include <uapi/syscall.h>
#include "syscall.h"

unsigned long malloc(void)
{
	return syscall(__NR_malloc);
}
