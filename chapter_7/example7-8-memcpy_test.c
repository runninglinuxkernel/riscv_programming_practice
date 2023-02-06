#include <stdio.h>
#include <string.h>
#include <stdlib.h>

static void my_memcpy_asm_test(unsigned long src, unsigned long dst,
		unsigned long size)
{
	unsigned long tmp = 0;
	unsigned long end = src + size;

	asm volatile (
			"1: ld %1, (%2)\n"
			"sd %1, (%0)\n"
			"addi %0, %0, 8\n"
			"addi %2, %2, 8\n"
			"blt %2, %3, 1b"
			: "+r" (dst), "+r" (tmp), "+r" (src)
			: "r" (end)
			: "memory");
}

#define SIZE 8*100

int main()
{
	int i;

	char *src = malloc(SIZE);
	char *dst = malloc(SIZE);

	if (!src || !dst)
		return 0;

	printf("0x%lx 0x%lx\n", (long)src, (long)dst);

	for (i = 0; i < SIZE; i+=8)
		*(unsigned long *)(src + i) = 0x55;

	my_memcpy_asm_test((unsigned long)src, (unsigned long)dst, SIZE);

	for (i = 0; i < SIZE; i+=8) {
		if (*(unsigned long *)(dst + i) != 0x55) {
			printf("data error %lx, i %d\n", (unsigned long)(dst + i), i);
			goto free;
		}
	}

	printf("test done\n");

free:
	free(src);
	free(dst);
	return 0;
}
