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
#include "asm/irq.h"

char vs_stack[PAGE_SIZE] __attribute__((aligned(PAGE_SIZE)));

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
	printk("hstatus 0x%lx\n", val);
	
	gpa_addr = get_free_page();
	gva_addr = VS_MEM;

	*(unsigned long *)gpa_addr = 0x12345678;

	printk("gva 0x%lx, gpa 0x%lx  *gpa 0x%lx\n",
			gva_addr, gpa_addr, *(unsigned long *)gpa_addr);

	//set_stage2_page_mapping(gpa_addr, gpa_addr, PAGE_SIZE, PAGE_WRITE_EXEC);

	write_stage2_pg_reg();

	printk("...entering VM...\n");
	riscv_vcpu_timer_init();

	gpa_addr = jump_to_vs_mode((unsigned long)vs_stack + PAGE_SIZE, gpa_addr);

	vs_trap_init();

	vs_paging_init();
	gva_addr = VS_MEM;
	set_vs_mapping_page(gva_addr, gpa_addr);
	printk("running in VS mode\n");
	printk("sstatus 0x%lx\n", read_csr(sstatus));
	printk("*gva_ddr 0x%lx\n", *(unsigned long *)gva_addr);

	vs_timer_init();
	arch_local_irq_enable();

	while (1)
		;
}
