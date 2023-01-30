#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>

int strcmp(const char* str1, const char* str2) {
	char c1, c2;
	do {
		c1 = *str1++;
		c2 = *str2++;
	} while (c1 != '\0' && c1 == c2);
	
	return c1 - c2;
}

char *str1 = "RVV is good";
char *str2 = "RVV is good for us!";

int main(void)
{
	int ret; 

	ret = strcmp(str1, str2);
	printf("C: ret = %d\n", ret);

	ret = strcmp_asm(str1, str2);
	printf("ASM: ret =%d\n", ret);
}


