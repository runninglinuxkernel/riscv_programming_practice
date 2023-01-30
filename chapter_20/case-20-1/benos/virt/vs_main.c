#include "asm/csr.h"
#include "asm/sbi.h"

void vs_main()
{
	unsigned long val;

	val = read_csr(sstatus);
	val |= SSTATUS_SPP;
	write_csr(sstatus, val);

	val = read_csr(CSR_HSTATUS);
	val |= HSTATUS_SPV | HSTATUS_SPVP;
	write_csr(CSR_HSTATUS, val);

	printk("...entering VM...\n");
	jump_to_vs_mode();

	vs_trap_init();

	printk("running in VS mode\n");
	printk("sstatus 0x%lx\n", read_csr(sstatus));
	//printk("hstatus 0x%lx\n", read_csr(CSR_HSTATUS));
	//
	printk("...exit VM...\n");
	SBI_CALL_0(SBI_EXIT_VM_TEST);
	printk("...back to VM...\n");
	//printk("hstatus 0x%lx\n", read_csr(CSR_HSTATUS));

	while (1)
		;
}
