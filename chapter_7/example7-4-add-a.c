#include <stdio.h>

static inline void my_atomic_add(unsigned long val, void *p)
{
	unsigned long tmp;
	int result;
	asm volatile (
			"1: lr.d %0, %2\n"
			"add %0, %0, %3\n"
			"sc.d.rl %1, %0, %2\n"
			"bnez %1, 1b\n"
			: "+r" (tmp), "+r"(result), "+A"(*(unsigned long *)p)
			: "r" (val)
			: "memory"
		     );
}

int main(void)
{
	unsigned long p = 0;

	my_atomic_add(2, &p);

	printf("atomic add: counter=%ld\n", p);

}

