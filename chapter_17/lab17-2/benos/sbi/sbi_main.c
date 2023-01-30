#include "asm/csr.h"
//#include "asm/sbi.h"
#include "uart.h"
#include "sbi_trap.h"
#include "printk.h"
#include "sbi_lib.h"

#define FW_JUMP_ADDR 0x80200000

#define BANNER \
"	                                            ___   ___\n"\
"    //   ) )                    //   ) )  //   ) )    / /\n" \
"   //___/ /   ___       __     ((        //___/ /    / /\n"\
"  / __  (   //___) ) //   ) )    \\      / __  (     / /\n"\
" //    ) ) //       //   / /       ) ) //    ) )   / /\n" \
"//____/ / ((____   //   / / ((___ / / //____/ / __/ /___\n"


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

	printk("%s: start: 0x%lx order %d prot 0x%lx\n", __func__, start, order, prot);

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
			 * 则该PMP entry所控制的地址空间为从y...y00...0开始的2^{n+3}个字节
			 * 参考RSIC-V手册
			 */ 
			addrmask = (1UL << (order - PMP_SHIFT)) - 1;
			pmpaddr	 &= ~addrmask;
			pmpaddr |= (addrmask >> 1);
		}
	}

	printk("%s: pmpaddr: 0x%lx  pmpcfg 0x%lx, cfs_csr 0x%x addr_csr 0x%x\n",
			__func__, pmpaddr, pmpcfg, pmpcfg_csr, pmpaddr_csr);

	/* 写CSR寄存器 */
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

	uart_init();

	init_printk_done(putchar);
	printk(BANNER);

	sbi_trap_init();

	/*
	 * 配置PMP
	 * 所有地址空间都可以访问
	 */
	sbi_set_pmp(0, 0, -1UL, PMP_RWX);
	sbi_set_pmp(1, 0x80000000, 0x40000, PMP_RWX);

	/* 设置跳转模式为S模式 */
	val = read_csr(mstatus);
	val = INSERT_FIELD(val, MSTATUS_MPP, PRV_S);
	val = INSERT_FIELD(val, MSTATUS_MPIE, 0);
	write_csr(mstatus, val);

	delegate_traps();

	/* 设置M模式的Exception Program Counter，用于mret跳转 */
	write_csr(mepc, FW_JUMP_ADDR);
	/* 设置S模式异常向量表入口*/
	write_csr(stvec, FW_JUMP_ADDR);
	/* 关闭S模式的中断*/
	write_csr(sie, 0);
	/* 关闭S模式的页表转换 */
	write_csr(satp, 0);

	/* 切换到S模式 */
	asm volatile("mret");
}
