#include <stdio.h>

static inline unsigned long cmpxchg(volatile void *ptr, unsigned long old, unsigned long new)
{
	unsigned long tmp;
	unsigned long result;

	asm volatile(
"1:	lr.d	%[result], (%[ptr])\n"
"       bne  %[result], %[old], 2f\n"
"	sc.d  %[tmp], %[new], (%[ptr])\n"
"	bnez	%[tmp], 1b\n"
"       2:\n"
	: [result]"+r" (result), [tmp]"+r" (tmp), [ptr]"+r" (ptr)
	: [new]"r" (new), [old]"r"(old)
	: "memory");

	return result;
}

int main(void)
{
	unsigned long p = 0x1234;
	unsigned long old;

	old = cmpxchg(&p, 0x1, 0x5);
	printf("old 0x%lx, p 0x%lx\n", old, p);

	old = cmpxchg(&p, 0x1234, 0x5);
	printf("old 0x%lx, p 0x%lx\n", old, p);
}

