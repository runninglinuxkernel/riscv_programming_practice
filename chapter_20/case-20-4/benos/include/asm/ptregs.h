#ifndef __PTREGS_H__
#define __PTREGS_H__
/*
 * pt_regs栈框，用来保存中断现场或者异常现场
 *
 * pt_regs栈框通常位于进程的内核栈的顶部。
 * 保存内容：
 *    sepc
 *    x1 ~ x31 通用寄存器
 *    CSRs
 *
 * 一共需要保存36个寄存器，共288个字节
 */
struct pt_regs {
	/* 31个通用寄存器 + sepc */
	unsigned long sepc;
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
	/* Supervisor CSRs */
	unsigned long sstatus;
	unsigned long sbadaddr;
	unsigned long scause;
	unsigned long hstatus;
};

#endif /*__PTREGS_H__*/
