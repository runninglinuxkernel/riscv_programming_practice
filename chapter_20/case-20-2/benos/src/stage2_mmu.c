#include "asm/csr.h"
#include "mm.h"
#include "asm/pgtable.h"
#include "asm/memory.h"
#include "asm/trap.h"
#include "asm/barrier.h"
#include "printk.h"
#include "asm/ptregs.h"

extern unsigned long early_pgtable_alloc(void);

char hs_pg_dir[PAGE_SIZE * 4] __attribute__((aligned(PAGE_SIZE *4)));

void set_stage2_page_mapping(unsigned long gpa, unsigned long hpa, unsigned long size, pgprot_t prot)
{
	__create_pgd_mapping((pgd_t *)hs_pg_dir, hpa, gpa, size, prot, early_pgtable_alloc, 0);
}

void write_stage2_pg_reg(void)
{
	unsigned long hsatp;
	hsatp = (((unsigned long)hs_pg_dir) >> PAGE_SHIFT) | HGATP_MODE_Sv39x4;
	write_csr(CSR_HGATP, hsatp);
	
	hfence();
	printk("write hgatp done\n");
}

static void setup_hg_page_table(unsigned long gpa, unsigned long hpa, unsigned long size, pgprot_t prot)
{
	__create_pgd_mapping((pgd_t *)hs_pg_dir, hpa, gpa, size, prot, early_pgtable_alloc, 0);
}

void stage2_page_fault(struct pt_regs *regs)
{
	unsigned long fault_addr;
	unsigned long htval, stval;
	unsigned long scause;

	htval = read_csr(CSR_HTVAL);
	stval = read_csr(stval);
	scause = read_csr(scause);

	fault_addr = (htval << 2) | (stval & 0x3);

	printk("stage2 fault addr 0x%lx, cause %lu\n", fault_addr, scause);

	fault_addr &= PAGE_MASK;

	setup_hg_page_table(fault_addr, fault_addr, PAGE_SIZE,
			(scause == CAUSE_STORE_GUEST_PAGE_FAULT) ? PAGE_WRITE_EXEC: PAGE_READ_EXEC);
	hfence();
}
