#include "uart.h"
#include "type.h"
#include "memset.h"
#include "printk.h"

extern void load_store_test(void);
extern void shift_test(void);
extern void add_sub_test(void);
extern void branch_test(void);
extern void my_memcpy_test(void);
extern unsigned long compare_and_return(unsigned long a, unsigned long b);
extern unsigned long sel_test(unsigned long a, unsigned long b); 
extern void bl_test();
extern unsigned long macro_test_1(long a, long b);
extern unsigned long macro_test_2(long a, long b);

extern unsigned long func_addr[];
extern unsigned long func_num_syms;
extern char func_string;

static int print_func_name(unsigned long addr)
{
	int i;
	char *p, *string;

	for (i = 0; i < func_num_syms; i++) {
		if (addr == func_addr[i])
			goto found;
	}

	return 0;

found:
    p = &func_string;

    while (1) {
    	p++;

    	if (*p == '\0')
    		i--;

    	if (i == 0) {
    		p++;
    		string = p;
		printk("<0x%lx> %s\n", addr, string);
    		break;
    	}
    }

    return 0;
}

void asm_test(void)
{
	unsigned long val1, val2;

	load_store_test();
	shift_test();
	add_sub_test();
	branch_test();

	my_memcpy_test();

	/*lab3-4: memset函数实现*/
	memset((void *)0x80210005, 0x55, 40);

	/*lab3-5:  条件跳转指令1*/
	val1 = compare_and_return(10, 9);
	if (val1 == 0)
		uart_send_string("lab3-5: compare_and_return ok\n");

	val2 = compare_and_return(9, 10);
	if (val2 == 0xffffffffffffffff)
		uart_send_string("lab3-5: compare_and_return ok\n");

	val1 = sel_test(0, 9);
	val2 = sel_test(5, 2);

	bl_test();
	uart_send_string("lab3-7: branch test ok\n");

	val1 = macro_test_1(5, 5);
	if (val1 == 10)
		uart_send_string("lab5-5: macro_test_1 ok\n");

	val2 = macro_test_2(5, 5);
	if (val2 == 0)
		uart_send_string("lab5-5: macro_test_2 ok\n");
}

/*
 * 让foo()函数链接到.fix段，让它离text段的offset大于1MB，从而构造一个超过21位地址范围的跳转
 */
extern void foo(void) __attribute__(( section( ".fix")));
void foo(void)
{
}

void kernel_main(void)
{
	uart_init();
	uart_send_string("Welcome RISC-V!\r\n");
	init_printk_done();
	printk("printk init done\n");

	asm_test();

	/* lab5-4：查表*/
	print_func_name(0x800880);

	foo();

	while (1) {
		;
	}
}
