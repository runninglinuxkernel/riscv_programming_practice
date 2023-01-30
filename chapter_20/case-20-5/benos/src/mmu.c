#include "asm/pgtable.h"
#include "asm/memory.h"
#include "mm.h"
#include "memset.h"
#include "asm/memory.h"
#include "asm/plic.h"
#include "asm/uart.h"
#include "printk.h"
#include "asm/clint.h"

extern char idmap_pg_dir[];

extern char _text_boot[], _etext_boot[];
extern char _text[], _etext[];

static void alloc_init_pte(pmd_t *pmdp, unsigned long addr,
		unsigned long end, unsigned long phys,
		pgprot_t prot,
		unsigned long (*alloc_pgtable)(void),
		unsigned long flags)
{
	pmd_t pmd = *pmdp;
	pte_t *ptep;

	/*pmd表项内容为空，说明对应的PTE页表还没建立*/
	if (pmd_none(pmd)) {
		unsigned long pte_phys;

		/*分配一个page，用于PTE页表*/
		pte_phys = alloc_pgtable();
		/* 由PTE基地址来回填pmdp表项 */
		set_pmd(pmdp, pfn_pmd(PFN_DOWN(pte_phys), PAGE_TABLE));
		pmd = *pmdp;
	}

	/*由pmd表项和虚拟地址va，能找到对应的PTE表项*/
	ptep = get_ptep_from_pmdp(pmdp, addr);
	do {
		/* 设置PTE*/
		set_pte(ptep, pfn_pte(PFN_DOWN(phys), prot));
		phys += PAGE_SIZE;
	} while (ptep++, addr += PAGE_SIZE, addr != end);
}

static void alloc_init_pmd(pgd_t *pgdp, unsigned long addr,
		unsigned long end, unsigned long phys,
		pgprot_t prot,
		unsigned long (*alloc_pgtable)(void),
		unsigned long flags)
{
	pgd_t pgd = *pgdp;
	pmd_t *pmdp;
	unsigned long next;

	/*pgd表项内容为空，说明对应的PMD页表还没建立*/
	if (pgd_none(pgd)) {
		unsigned long pmd_phys;

		/*分配一个page，用于PMD页表*/
		pmd_phys = alloc_pgtable();
		/* 由PMD基地址来回填pgdp表项 */
		set_pgd(pgdp, pfn_pgd(PFN_DOWN(pmd_phys), PAGE_TABLE));
		pgd = *pgdp;
	}

	/*由pgd表项和虚拟地址va，能找到对应的PMD表项*/
	pmdp = get_pmdp_from_pgdp(pgdp, addr);
	do {
		next = pmd_addr_end(addr, end);

		alloc_init_pte(pmdp, addr, next, phys,
					prot,  alloc_pgtable, flags);

		phys += next - addr;
	} while (pmdp++, addr = next, addr != end);
}

/*
 * 分配一个page用于各级页表
 */
unsigned long early_pgtable_alloc(void)
{
	unsigned long phys;

	phys = get_free_page();
	memset((void *)phys, 0, PAGE_SIZE);

	return phys;
}

/*
 * __create_pgd_mapping: 创建页表
 *
 * pgdir: PGD页表的基地址
 * phys: 物理地址PA
 * virt: 虚拟地址VA
 * size: 映射的大小
 * prot: 页表项PTE的属性
 * alloc_pgtable: 分配各级页表的分配函数
 * flags: 标志位
 */
void __create_pgd_mapping(pgd_t *pgdir, unsigned long phys,
		unsigned long virt, unsigned long size,
		pgprot_t prot,
		unsigned long (*alloc_pgtable)(void),
		unsigned long flags)
{
	/* 由虚拟地址va和PGD基地址，找到对应PGD表项 */
	pgd_t *pgdp = pgd_offset_raw(pgdir, virt);
	unsigned long addr, end, next;

	phys &= PAGE_MASK;
	addr = virt & PAGE_MASK;
	end = PAGE_ALIGN(virt + size);

	do {
		/* 找到pgd表项管辖的范围*/
		next = pgd_addr_end(addr, end);
		alloc_init_pmd(pgdp, addr, next, phys,
				prot, alloc_pgtable, flags);
		phys += next - addr;
	} while (pgdp++, addr = next, addr != end);
}

static void create_identical_mapping(void)
{
	unsigned long start;
	unsigned long end;

	/*map text*/
	start = (unsigned long)_text_boot;
	end = (unsigned long)_etext;
	__create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
			end - start, PAGE_KERNEL_READ_EXEC,
			early_pgtable_alloc,
			0);

	//printk("map text done\n");

	/*map memory*/
	start = PAGE_ALIGN((unsigned long)_etext);
	end = DDR_END;
	__create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
			end - start, PAGE_KERNEL,
			early_pgtable_alloc,
			0);
	//printk("map memory done\n");
}

static void create_mmio_mapping(void)
{
	unsigned long start;
	unsigned long end;

#ifdef CONFIG_BOARD_QEMU
	/*map PLIC*/
	start = PLIC_BASE;
	end = PLIC_END;
	__create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
			end - start, PAGE_KERNEL,
			early_pgtable_alloc,
			0);
#endif

	/*map CLINT*/
	start = VIRT_CLINT_ADDR;
	__create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
			VIRT_CLINT_SIZE, PAGE_KERNEL,
			early_pgtable_alloc,
			0);

	/*map UART0*/
	start = UART;
	__create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
			UART_SIZE, PAGE_KERNEL,
			early_pgtable_alloc,
			0);

	/*map CLINT*/
	start = VIRT_CLINT_ADDR;
	__create_pgd_mapping((pgd_t *)idmap_pg_dir, start, start,
			VIRT_CLINT_SIZE, PAGE_KERNEL,
			early_pgtable_alloc,
			0);
}

void paging_init(void)
{
	//memset(idmap_pg_dir, 0, PAGE_SIZE);
	//create_identical_mapping();
	create_mmio_mapping();

	//enable_mmu_relocate();
}
