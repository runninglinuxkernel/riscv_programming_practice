#include "uart.h"

void kernel_main(void)
{
	uart_init();
	uart_send_string("Welcome RISC-V!\r\n");

	while (1) {
		;
	}
}
