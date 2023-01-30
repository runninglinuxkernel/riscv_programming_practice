#include <stdio.h>

#if 0
static inline void atomic_add(int i, unsigned long *p)
{
	unsigned long result;

	asm volatile("# atomic_add\n"
"	amoadd.d %[result], %[i], (%[p])\n"
	: [result]"=&r"(result) , [p]"+r" (p)
	: [i]"r" (i)
	: "memory");
}
#else
static inline void atomic_add(int i, unsigned long *p)
{
	unsigned long result;

	asm volatile("# atomic_add\n"
"	amoadd.d %[result], %[i], %[p]\n"
	: [result]"=&r"(result) , [p]"+A" (*p)
	: [i]"r" (i)
	: "memory");
}
#endif


int main(void)
{
	unsigned long p = 0x1;

	atomic_add(0x3, &p);

	printf("atomic add: 0x%lx\n", p);
}

