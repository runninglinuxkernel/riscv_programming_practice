#include "uart.h"
#include "type.h"
#include "memset.h"
#include "printk.h"

long a = 5;
long b = 10;

long data(void) {
  return a | b;
}

void kernel_main(void)
{
	uart_init();
	init_printk_done();

	data();

	while(1)
		;

}
