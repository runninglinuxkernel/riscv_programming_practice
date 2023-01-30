#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <time.h>

#define SIZE 128
static char a[SIZE];
static char b[SIZE];

int main(int argc, char* argv[])
{
	int i;

	/* 使用LD1/ST1指令来实现memcpy */
	for (i = 0; i < SIZE; i++)
		a[i] = i;

	memset(b, 0x0, SIZE);

	my_memcpy(&a, &b, SIZE);

	for (i = 0; i < SIZE; i++) {
		if (a[i] != b[i]) {
			printf("data[%d] error\n", i);
			return 0;
		}
	}

	printf("data is idential\n");

	return 0;
}
