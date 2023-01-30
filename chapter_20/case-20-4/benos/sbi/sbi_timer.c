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

void clint_timer_event_start(unsigned long next_event)
{
	/* Program CLINT Time Compare */
	writeq(next_event, VIRT_CLINT_TIMER_CMP);

	/* 清S模式的timer pending中断，然后使能M模式的timer中断 */
	csr_clear(mip, MIP_STIP);
	csr_set(mie, MIP_MTIP);
}

