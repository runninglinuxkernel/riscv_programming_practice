#include "clock.h"
#include "uart.h"

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
        sys_clock_init();
	uart_init();
	uart_send_string("Welcome RISC-V!\r\n");

	func1();

	while (1) {
		;
	}
}
