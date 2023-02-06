#include <stdio.h>

static int test_asm_goto(int a)
{
	asm goto (
			"addi %0, %0, -1\n"
			"beqz %0, %l[label]\n"
			:
			: "r" (a)
			: "memory"
			: label);

	return 0;

label:
	printf("%s: a = %d\n", __func__, a);
	return 1;
}


int main(void)
{
	int a = 1;
	if (test_asm_goto(a) == 1)
		printf("return 1\n");

	int b = 0;
	if (test_asm_goto(b) == 0)
		printf("b is not 1\n");
}

