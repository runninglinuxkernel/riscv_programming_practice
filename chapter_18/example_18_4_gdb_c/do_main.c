char bufa[16] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};

extern void asm_test(char *buf, int n);

void do_main(void)
{
	asm_test(bufa, 16);
}
