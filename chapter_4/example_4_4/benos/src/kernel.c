#include "clock.h"
#include "uart.h"
#include "memset.h"
#include "printk.h"

extern void dump_stack(void);

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
	sys_clock_init();
	uart_init();
	init_printk_done();

	func1();

	while(1)
		;

}
