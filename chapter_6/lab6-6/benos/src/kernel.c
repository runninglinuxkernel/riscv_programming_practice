#include "uart.h"
#include "types.h"
#include "memset.h"
#include "printk.h"

extern char _bss[], _ebss[];

static long a = 5;
static long b = 10;

long data(void) {
  return a | b;
}

static void clean_bss(void)
{
	unsigned long start = (unsigned long)_bss;
	unsigned long end = (unsigned long)_ebss;
	unsigned size = end - start;

	memset((void *)start, 0, size);
}

void kernel_main(void)
{
	clean_bss();
	uart_init();
	uart_send_string("Welcome RISC-V!\r\n");
	init_printk_done();
	printk("printk init done\n");
	
	data();

	while(1)
		;

}
