#include "asm/csr.h"
#include "asm/sbi.h"
#include "printk.h"
#include "type.h"
#include "asm/timer.h"
#include "io.h"
#include "asm/clint.h"

unsigned long volatile cacheline_aligned vs_jiffies;

#define CLINT_TIMEBASE_FREQ 10000000
#define VS_HZ 50

#if 1
unsigned long vs_get_cycles(void)
{
	unsigned long n;

	asm volatile (
		"rdtime %0"
		: "=r" (n));
	return n;
}
#else
static inline unsigned long vs_get_cycles(void)
{
	unsigned long val = readq(VIRT_CLINT_TIMER_VAL);
	printk("vs get cycle %lu\n", val);
	return val;
}
#endif

static void reset_timer()
{
	csr_set(sie, SIE_STIE);
	sbi_set_timer(vs_get_cycles() + CLINT_TIMEBASE_FREQ/VS_HZ);
}

void vs_timer_init(void)
{
	reset_timer();
}

void vs_handle_timer_irq(void)
{
	csr_clear(sie, SIE_STIE);
	reset_timer();
	vs_jiffies++;
	printk("Virtual Core0 Timer interrupt received %lu\n", vs_jiffies);
}
