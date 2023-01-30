#include "asm/csr.h"
#include "asm/sbi.h"
#include "vs_mm.h"
#include "mm.h"
#include "asm/pgtable.h"
#include "asm/memory.h"
#include "asm/barrier.h"
#include "printk.h"
#include "mm.h"
#include "vs_mmu.h"

extern void vs_trap_init(void);

void vs_main()
{
	unsigned long val;
	unsigned long gpa_addr, gva_addr;
       
	val = read_csr(sstatus);
	val |= SSTATUS_SPP;
	write_csr(sstatus, val);

	val = read_csr(CSR_HSTATUS);
	val |= HSTATUS_SPV | HSTATUS_SPVP;
	write_csr(CSR_HSTATUS, val);
	
	gpa_addr = get_free_page();
	gva_addr = VS_MEM;

	*(unsigned long *)gpa_addr = 0x12345678;

	printk("gva_addr 0x%lx, gpa_addr 0x%lx  *gpa_addr 0x%lx\n",
			gva_addr, gpa_addr, *(unsigned long *)gpa_addr);

	write_stage2_pg_reg();

	printk("...entering VM...\n");
	jump_to_vs_mode();

	vs_trap_init();

	vs_paging_init();
	set_vs_mapping_page(gva_addr, gpa_addr);
	printk("running in VS mode\n");
	printk("sstatus 0x%lx\n", read_csr(sstatus));
	printk("*gva_ddr 0x%lx\n", *(unsigned long *)gva_addr);

	printk("...exit VM...\n");
	SBI_CALL_0(SBI_EXIT_VM_TEST);
	printk("...back to VM...\n");

	while (1)
		;
}
