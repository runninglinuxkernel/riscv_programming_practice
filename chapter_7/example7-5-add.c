#include <stdio.h>

int add(int i, int j)
{
    int res = 0;

    asm volatile (
    "add %[result], %[input_i], %[input_j]"
    : [result] "=r" (res)
    : [input_i] "r" (i), [input_j] "r" (j)
    );

    return res;
}

int main(void)
{
	int a = 5;
	int b =6;

	printf("result=%d\n", add(a, b));
}

