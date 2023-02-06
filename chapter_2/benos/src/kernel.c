#include "clock.h"
#include "uart.h"

void kernel_main(void)
{
    sys_clock_init();
	uart_init();

	while (1) {
        uart_send_string("Welcome RISC-V!\r\n");
		;
	}
}
