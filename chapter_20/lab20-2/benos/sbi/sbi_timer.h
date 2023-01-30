#ifndef	_SBI_TIMER_H
#define	_SBI_TIMER_H

void sbi_timer_process(void);
void clint_timer_event_start(unsigned long next_event);

#endif

