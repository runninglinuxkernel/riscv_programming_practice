#include "uart.h"

extern void load_store_test(void);

void asm_test(void)
{
	load_store_test();
}

void kernel_main(void)
{
	uart_init();
	uart_send_string("Welcome RISC-V!\r\n");

	asm_test();

	while (1) {
		;
	}
}
