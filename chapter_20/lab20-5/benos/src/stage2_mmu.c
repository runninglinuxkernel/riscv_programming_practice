#include "asm/csr.h"
#include "mm.h"
#include "asm/pgtable.h"
#include "asm/memory.h"
#include "asm/trap.h"
#include "asm/barrier.h"
#include "printk.h"
#include "asm/ptregs.h"
#include "asm/vmm.h"
#include "virt.h"
#include "memset.h"

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
	unsigned long new_page;

	htval = read_csr(CSR_HTVAL);
	stval = read_csr(stval);
	scause = read_csr(scause);

	fault_addr = (htval << 2) | (stval & 0x3);

	//printk("stage2 fault addr 0x%lx, cause %lu, writeable %d\n",
	//		fault_addr, scause, scause == CAUSE_STORE_GUEST_PAGE_FAULT ? 1 : 0);

	/*
	 * 如果虚拟机缺页地址为MMIO range，那么VMM为该MMIO读写操作进行模拟，然后返回
	 * 注意返回到虚拟机的下一个指令。
	 *
	 * 目前VMM支持的模拟MMIO只有UART。
	 */
	if (scause == CAUSE_LOAD_GUEST_PAGE_FAULT ||
			scause == CAUSE_STORE_GUEST_PAGE_FAULT) {
		unsigned long ins_addr = read_csr(sepc);
		unsigned long ins_value = hlvxwu(ins_addr);
		//unsigned long htinst = read_csr(CSR_HTINST);
		//printk("ins_addr 0x%lx ins_val 0x%lx htinst 0x%lx\n", ins_addr, ins_value, htinst);
		if (check_emul_mmio_range(fault_addr)) {
			emul_device(fault_addr, ins_value, regs);
			regs->sepc += 4;
			return ;
		}
	}

	/*
	 * 为虚拟机分配一个新的页面，并建立第二阶段映射，GPA -> HPA的映射
	 */
	fault_addr &= PAGE_MASK;
	new_page = get_free_page();
	memset((void *)new_page, 0, PAGE_SIZE);

	setup_hg_page_table(fault_addr, new_page, PAGE_SIZE,
			(scause == CAUSE_STORE_GUEST_PAGE_FAULT) ? PAGE_WRITE_EXEC: PAGE_READ_EXEC);
	hfence();
}
