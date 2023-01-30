#include "uart.h"
#include "type.h"
#include "memset.h"
#include "printk.h"

int add_c(int a, int b)
{
	dump_stack();
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
	uart_init();
	init_printk_done();

	func1();

	while(1)
		;

}
