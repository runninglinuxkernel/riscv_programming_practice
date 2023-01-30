#include "asm/csr.h"
#include "asm/sbi.h"
#include "printk.h"
#include "type.h"
#include "asm/timer.h"
#include "io.h"
#include "asm/clint.h"

unsigned long volatile cacheline_aligned jiffies;

#if 0
static inline unsigned long get_cycles(void)
{
	unsigned long n;

	asm volatile (
		"rdtime %0"
		: "=r" (n));
	return n;
}
#else
static inline unsigned long get_cycles(void)
{
	return readq(VIRT_CLINT_TIMER_VAL);
}
#endif

void reset_timer()
{
	//printk("get cycles %llu\n", get_cycles());
	sbi_set_timer(get_cycles() + CLINT_TIMEBASE_FREQ/HZ);
	csr_set(sie, SIE_STIE);
}


void timer_init(void)
{
	reset_timer();
}

void handle_timer_irq(void)
{
	csr_clear(sie, SIE_STIE);
	reset_timer();
	jiffies++;
	//printk("Core0 Timer interrupt received, jiffies=%lu\r\n", jiffies);
	tick_handle_periodic();
	//csr_set(sie, SIE_STIE);
}
