#include "asm/csr.h"
#include "asm/sbi.h"
#include "printk.h"
#include "type.h"
#include "asm/timer.h"
#include "io.h"
#include "asm/clint.h"
#include "asm/trap.h"

unsigned long volatile cacheline_aligned jiffies;

unsigned long vcpu_time_delta;
unsigned long vcpu_next_cycle;
int vcpu_timer_init;

unsigned long riscv_vcpu_current_cycles()
{
	return get_cycles() + vcpu_time_delta; 
}

void riscv_vcpu_timer_event_start(unsigned long next_cycle)
{
	riscv_vcpu_clear_interrupt(IRQ_VS_TIMER);
	vcpu_next_cycle = next_cycle;
	vcpu_timer_init = 1;
}

void riscv_vcpu_set_interrupt(int intr)
{
	csr_set(CSR_HVIP, 1UL << intr);
}

void riscv_vcpu_clear_interrupt(int intr)
{
	csr_clear(CSR_HVIP, 1UL << intr);
}

void riscv_vcpu_check_timer_expired(void)
{
	unsigned long val;

	if (!vcpu_timer_init)
		return;
	val = riscv_vcpu_current_cycles();

	if (val < vcpu_next_cycle)
		return;

	//printk("val %lu next %lu\n", val, vcpu_next_cycle);
	riscv_vcpu_set_interrupt(IRQ_VS_TIMER);
	vcpu_timer_init = 0;
}

void riscv_vcpu_timer_init(void)
{
	vcpu_time_delta = 0;
	write_csr(CSR_HTIMEDELTA, vcpu_time_delta);
}

#if 0
unsigned long get_cycles(void)
{
	unsigned long n;

	asm volatile (
		"rdtime %0"
		: "=r" (n));
	return n;
}
#else
unsigned long get_cycles(void)
{
	return readq(VIRT_CLINT_TIMER_VAL);
}
#endif

void reset_timer()
{
	//printk("get cycles %llu\n", get_cycles());
	csr_set(sie, SIE_STIE);
	sbi_set_timer(get_cycles() + CLINT_TIMEBASE_FREQ/HZ);
}


void timer_init(void)
{
	reset_timer();
}

void handle_timer_irq(void)
{
	csr_clear(sie, SIE_STIE);
	riscv_vcpu_check_timer_expired();
	jiffies++;
	//printk("Core0 Timer interrupt received, jiffies=%lu, %lu\n", jiffies, get_cycles());
	tick_handle_periodic();
	reset_timer();
}
