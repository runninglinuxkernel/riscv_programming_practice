#include <stdio.h>
#include <stdlib.h>

#define SIZE 10

static void swap_data(unsigned char *src, unsigned char *dst,unsigned int size)
{
	unsigned int len = 0;
	unsigned int tmp;

	asm volatile (
		"1: lhu a5, (%[src])\n"
		"sll a6, a5, 8\n"
		"srl a7, a5, 8\n"
		"or %[tmp], a6, a7\n"
		"sh %[tmp], (%[dst])\n"
		"addi %[src], %[src], 2\n"
		"addi %[dst], %[dst], 2\n"
		"addi %[len], %[len], 2\n"
		"bltu %[len], %[size], 1b\n"
		: [dst] "+r" (dst), [len] "+r"(len), [tmp] "+r" (tmp)
		: [src] "r" (src), [size] "r" (size)
		: "memory"
	);
}

int main(void)
{
	int i;
	unsigned char *bufa = malloc(SIZE);
	if (!bufa)
		return 0;

	unsigned char *bufb = malloc(SIZE);
	if (!bufb) {
		free(bufa);
		return 0;
	}
	
	for (i = 0; i < SIZE; i++) {
		bufa[i] = i;
		printf("%d ", bufa[i]);
	}
	printf("\n");
	
	//printf("%p \n", bufa);
	swap_data(bufa, bufb, SIZE);
	//printf("%p \n", bufa);

	for (i = 0; i < SIZE; i++)
		printf("%d ", bufb[i]);
	printf("\n");

	free(bufa);
	free(bufb);
	
	return 0;
}
