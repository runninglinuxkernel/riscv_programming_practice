#ifndef	_SBI_TRAP_H
#define	_SBI_TRAP_H

#include "asm/trap.h"

#define MCAUSE_IRQ (1UL << 63)

#define IRQ_S_SOFT  1
#define IRQ_S_TIMER 5
#define IRQ_S_EXT   9
#define IRQ_M_TIMER 7

#define MIP_SSIP (1UL << IRQ_S_SOFT)
#define MIP_STIP  (1UL << IRQ_S_TIMER)
#define MIP_SEIP  (1UL << IRQ_S_EXT)
#define MIP_MTIP  (1UL << IRQ_M_TIMER)

/*
 * sbi_trap_regs栈框，用来保存中断现场或者异常现场
 *
 * sbi_regs栈框通常位于进程的内核栈的顶部。
 * 保存内容：
 *    sepc
 *    x1 ~ x31 通用寄存器
 *    CSRs
 *
 * 一共需要保存33个寄存器，共264个字节
 */
struct sbi_trap_regs {
	/* 31个通用寄存器 + sepc */
	unsigned long mepc;
	unsigned long ra;
	unsigned long sp;
	unsigned long gp;
	unsigned long tp;
	unsigned long t0;
	unsigned long t1;
	unsigned long t2;
	unsigned long s0;
	unsigned long s1;
	unsigned long a0;
	unsigned long a1;
	unsigned long a2;
	unsigned long a3;
	unsigned long a4;
	unsigned long a5;
	unsigned long a6;
	unsigned long a7;
	unsigned long s2;
	unsigned long s3;
	unsigned long s4;
	unsigned long s5;
	unsigned long s6;
	unsigned long s7;
	unsigned long s8;
	unsigned long s9;
	unsigned long s10;
	unsigned long s11;
	unsigned long t3;
	unsigned long t4;
	unsigned long t5;
	unsigned long t6;
	/* mstatus register state */
	unsigned long mstatus;
};

void sbi_trap_init(void);
void sbi_trap_handler(struct sbi_trap_regs *regs);
void delegate_traps();

#endif
