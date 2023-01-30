#ifndef _BENOS_CURRENT_H
#define _BENOS_CURRENT_H

static struct task_struct *get_current(void)
{
	register struct task_struct *tp __asm__("tp");
	return tp;
}

#define current get_current()

#endif
