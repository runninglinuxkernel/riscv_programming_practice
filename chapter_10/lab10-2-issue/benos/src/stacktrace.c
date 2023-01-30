#include "asm/ptregs.h"
#include "printk.h"
#include "type.h"

struct stackframe {
	unsigned long fp;
	unsigned long ra;
};

static bool print_trace_address(unsigned long pc, void *arg)
{
	print_symbol(pc);
	return false;
}

extern char _text[], _etext[];
static int kernel_text(unsigned long addr)
{
	if (addr >= (unsigned long)_text &&
	    addr < (unsigned long)_etext)
		return 1;

	return 0;
}

static void walk_stackframe(struct pt_regs *regs, bool (*fn)(unsigned long, void *),
		void *arg)
{
	unsigned long sp, pc, fp;
	struct stackframe *frame;
	unsigned long low;

	if (regs) {
		pc = regs->sepc;
		sp = regs->sp;
		fp = regs->s0;
	} else {
		const register unsigned long current_sp __asm__ ("sp");
		sp = current_sp;
		pc = (unsigned long)walk_stackframe;
		fp = (unsigned long)__builtin_frame_address(0);
	}

	while (1) {
		if (!kernel_text(pc) || (fn)(pc, arg))
			break;

		/* 检查fp是否有效 */
		low = sp + sizeof(struct stackframe);
		if ((fp < low || fp & 0x7))
			break;

		/*
		 * fp 指向上一级函数的栈底SP_p
		 * 减去16个字节，正好是struct stackframe
		 */
		frame = (struct stackframe *)(fp - 16);
		sp = fp;
		fp = frame->fp;

		pc = frame->ra - 0x4;
	}
}

void show_stack(struct pt_regs *regs)
{
	printk("Call Trace:\n");
	walk_stackframe(regs, print_trace_address, NULL);
}

void dump_stack(struct pt_regs *regs)
{
	show_stack(regs);
}
