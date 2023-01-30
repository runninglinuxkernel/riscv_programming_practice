#include "uart.h"
#include "type.h"
#include "memset.h"

extern void load_store_test(void);
extern void pc_related_test(void);
extern void shift_test(void);
extern void add_sub_test(void);
extern unsigned long compare_and_return(unsigned long a, unsigned long b);
extern unsigned long sel_test(unsigned long a, unsigned long b);
extern void my_memcpy_test(void);
extern void branch_test(void);

void asm_test(void)
{
	unsigned long val1, val2;

	load_store_test();
	pc_related_test();
	shift_test();
	add_sub_test();

	val1 = compare_and_return(10, 9);
       if (val1 == 0)
               uart_send_string("compare_and_return ok\n");
       else 
               uart_send_string("compare_and_return fail\n");

       val2 = compare_and_return(9, 10);
       if (val2 == 0xffffffffffffffff)
               uart_send_string("compare_and_return ok\n");
       else
	       uart_send_string("compare_and_return fail\n");

       val1 = sel_test(0, 9);
       if (val1 == 11)
	       uart_send_string("sel test ok\n");

       val2 = sel_test(5, 2);
       if (val2 == 1)
	       uart_send_string("sel test ok\n");

       my_memcpy_test();
       memset((void *)0x80210005, 0x55, 40);

       branch_test();
       uart_send_string("branch test done\n");
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
