#include "uart.h"
#include "asm/irq.h"
#include "gos.h"
#include "memset.h"
#include "printk.h"

extern char bss_begin[], bss_end[];
static void clean_bss(void)
{
	unsigned long start = (unsigned long)bss_begin;
	unsigned long end = (unsigned long)bss_end;
	unsigned size = end - start;

	memset((void *)start, 0, size);
}

void kernel_main(void)
{
	clean_bss();
	uart_init();
	uart_send_string("Welcome GuestOS!\r\n");
	init_printk_done(putchar);
	printk("printk init done\n");
	
	vs_trap_init();
	//vs_timer_init();
	plic_init();
	enable_uart_plic();
	arch_local_irq_enable();

	while (1) {
		;
	}
}
