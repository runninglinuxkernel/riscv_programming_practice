#include <stdio.h>

static inline void atomic_add(int i, unsigned long *p)
{
	unsigned long tmp;
	int result;

	asm volatile("# atomic_add\n"
"1:	lr.d	%[tmp], (%[p])\n"
"	add	%[tmp], %[i], %[tmp]\n"
"	sc.d	%[result], %[tmp], (%[p])\n"
"	bnez	%[result], 1b\n"
	: [result]"=&r" (result), [tmp]"=&r" (tmp), [p]"+r" (p)
	: [i]"r" (i)
	: "memory");
}

int main(void)
{
	unsigned long p = 0;

	atomic_add(5, &p);

	printf("atomic add: %ld\n", p);
}

