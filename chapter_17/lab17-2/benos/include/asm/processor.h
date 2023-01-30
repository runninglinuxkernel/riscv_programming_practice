#ifndef	_BENOS_PROCESSOR_H
#define	_BENOS_PROCESSOR_H

#define _TIF_NEED_RESCHED       (1)

#define TASK_CPU_CONTEXT 0
#define TASK_TI_PREEMPT_COUNT 112
#define TASK_TI_NEED_RESCHED 116

#ifndef __ASSEMBLY__

/* 进程切换时候需要保存的上下文 */
struct cpu_context {
	unsigned long ra;
	unsigned long sp;	/* 栈指针 */

	/* 函数调用必须要保存的通用寄存器 */
	unsigned long s[12];	/* s[0] 是FP */
};

#endif

#endif

