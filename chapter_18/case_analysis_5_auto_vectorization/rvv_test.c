#include <stdio.h>
#include <stdlib.h>

static void test(unsigned char *src, unsigned char *dst, unsigned long count)
{
	unsigned long i;

	for (i = 0; i < count; i++)
		*dst++ = *src++ + 8;
}

#define DATA_SIZE (100)

int main(int argc, char* argv[])
{
	unsigned char *src = malloc(DATA_SIZE);
	unsigned char *dst = malloc(DATA_SIZE);

        test(src, dst, DATA_SIZE);	

	printf("%u ", dst);
	return 0;
}
