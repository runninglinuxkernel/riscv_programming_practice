int add_c(int a, int b)
{
	return a + b;
}

int func1(void)
{
	int a = 1;
	int b = 2;

	return add_c(a, b);
}

void kernel_main(void)
{
	func1();
}
