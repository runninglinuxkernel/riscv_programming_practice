#include "uart.h"

void kernel_main(void)
{
	uart_init();
	uart_send_string("Welcome GuestOS!\r\n");

	while (1) {
		;
	}
}
