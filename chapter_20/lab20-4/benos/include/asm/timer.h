#ifndef _ASM_TIMER_H
#define _ASM_TIMER_H

#define CLINT_TIMEBASE_FREQ 10000000
#define HZ 100

void handle_timer_irq(void);
void timer_init(void);
unsigned long get_cycles(void);

#endif /* _ASM_TIMER_H*/
