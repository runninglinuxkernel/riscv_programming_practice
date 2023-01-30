#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>

static char *a = "i am learn riscv now";

#define SIZE 256

int main(void)
{
	char bufa[SIZE] = {0,};

	strcpy_asm(bufa, a);

	if (!strcmp(bufa, a))
		printf("string is idential\n");
	else
		printf("string is not idential\n");
}
