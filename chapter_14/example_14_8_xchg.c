#include <stdio.h>

static inline unsigned long xchg(volatile void *ptr, unsigned long new)
{
	unsigned long tmp;
	unsigned long result;

	asm volatile(
"1:	lr.d	%[result], (%[ptr])\n"
"	sc.d  %[tmp], %[new], (%[ptr])\n"
"	bnez	%[tmp], 1b\n"
	: [result]"+r" (result), [tmp]"+r" (tmp), [ptr]"+r" (ptr)
	: [new]"r" (new)
	: "memory");

	return result;
}

int main(void)
{
	unsigned long p = 0x1234;
	unsigned long old;

	old = xchg(&p, 0x1);
	printf("old 0x%lx, p 0x%lx\n", old, p);

}

