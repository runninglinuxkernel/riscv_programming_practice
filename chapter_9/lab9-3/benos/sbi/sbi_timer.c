#include "io.h"
#include "sbi_trap.h"
#include "asm/csr.h"
#include "asm/clint.h"

void sbi_timer_process(void)
{
	/* 关闭M模式timer的中断，然后设置S模式的timer pending中断*/
	csr_clear(mie, MIP_MTIP);
	csr_set(mip, MIP_STIP);
}

unsigned long sbi_get_timer_val(void)
{
	unsigned long cnt;
	 __asm__ __volatile__("csrr %0, time\n" : "=r"(cnt) :: "memory");
	return cnt;
}


void clint_timer_event_start(unsigned long next_event)
{
	/* Program CLINT Time Compare */
    /* D1S里TIMER_CMP寄存器有2个: CMP High, CMP Low
     * 不能一次性写64位数据
     * 要分为2次,每次写32位数据
     */
	//writeq(next_event, VIRT_CLINT_TIMER_CMP);
	writel(next_event, VIRT_CLINT_TIMER_CMP);          // 低32位
	writel(next_event>>32, VIRT_CLINT_TIMER_CMP + 4);  // 高32位

	/* 清S模式的timer pending中断，然后使能M模式的timer中断 */
	csr_clear(mip, MIP_STIP);
	csr_set(mie, MIP_MTIP);
}

