#include "asm/csr.h"

#define FW_JUMP_ADDR 0x22000

extern unsigned long log2roundup(unsigned long x);
extern unsigned long read_csr_num(int csr_num);
extern void write_csr_num(int csr_num, unsigned long val);


int sbi_set_pmp(int reg_idx, unsigned long start, unsigned long size, unsigned long prot)
{
	int order;
	int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
	unsigned long cfgmask, pmpcfg;
	unsigned long addrmask, pmpaddr;

	if (reg_idx > MAX_CSR_PMP)
		return -1;

	order = log2roundup(size);
	if (order < PMP_SHIFT)
		return -1;

	pmpaddr = start >> PMP_SHIFT;

	/* 对于RV64，对应的cfg寄存器是pmpcfg0，pmpcfg2，pmpcfg4... */
	pmpcfg_csr   = (CSR_PMPCFG0 + (reg_idx >> 2)) & ~1;
	pmpcfg_shift = (reg_idx & 7) << 3;

	pmpaddr_csr = CSR_PMPADDR0 + reg_idx;

	/* 配置cfg中的A字段，NA4表示只有4bytes的区域 */
	prot &= ~PMP_A;
	prot |= (order == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;

	/* 配置cfg中的prot */
	cfgmask = ~(0xffUL << pmpcfg_shift);
	pmpcfg	= (read_csr_num(pmpcfg_csr) & cfgmask);
	pmpcfg |= ((prot << pmpcfg_shift) & ~cfgmask);

	/* 
	 * 配置PMP address
	 * 当oder == 2时，A使用PMP_A_NA4, pmpaddr直接使用start>>2
	 * 当oder > 2时，A使用PMP_A_NAPOT，需要重新配置pmpaddr
	 */
	if (order > PMP_SHIFT)
	{
		if (order == RISCV_XLEN) {
			pmpaddr = -1UL;
		} else {
			/*
			 * 若pmpaddr值为y...y01...1，设连续1的个数为n,
			 * 则该PMP entry所控制的地址空间为从y...y00...0开始的2^{n+3}个字�?			 * 参考RSIC-V手册
			 */ 
			addrmask = (1UL << (order - PMP_SHIFT)) - 1;
			pmpaddr	 &= ~addrmask;
			pmpaddr |= (addrmask >> 1);
		}
	}


	/* 写CSR寄存�?*/
	write_csr_num(pmpaddr_csr, pmpaddr);
	write_csr_num(pmpcfg_csr, pmpcfg);

	return 0;
}


/*
 * 运行在M模式
 */
void sbi_main(void)
{
	unsigned long val;

	/*
	 * 配置PMP
	 * 所有地址空间都可以访问	 */
	sbi_set_pmp(0, 0, -1UL, PMP_RWX);
    

	/* 设置跳转模式为S模式 */
	val = read_csr(mstatus);
	val = INSERT_FIELD(val, MSTATUS_MPP, PRV_S);
	val = INSERT_FIELD(val, MSTATUS_MPIE, 0);
	write_csr(mstatus, val);
    
	/* 设置M模式的Exception Program Counter，用于mret跳转 */
	write_csr(mepc, FW_JUMP_ADDR);
	write_csr(mtvec, 0x20000);
    
	/* 设置S模式异常向量表入口地址 */
	write_csr(stvec, FW_JUMP_ADDR);
    
	/* 关闭S模式的中断 */
	write_csr(sie, 0);
	/* 关闭S模式的页表换 */
	write_csr(satp, 0);

	/* 切换到S模式 */
	asm volatile("mret");
}
