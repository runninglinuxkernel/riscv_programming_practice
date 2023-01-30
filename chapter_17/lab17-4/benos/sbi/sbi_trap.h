#ifndef	_SBI_TRAP_H
#define	_SBI_TRAP_H

#define MCAUSE_IRQ (1UL << 63)

#define IRQ_S_SOFT  1
#define IRQ_S_TIMER 5
#define IRQ_S_EXT   9
#define IRQ_M_TIMER 7

#define MIP_SSIP (1UL << IRQ_S_SOFT)
#define MIP_STIP  (1UL << IRQ_S_TIMER)
#define MIP_SEIP  (1UL << IRQ_S_EXT)
#define MIP_MTIP  (1UL << IRQ_M_TIMER)

/* ===== Trap/Exception Causes ===== */
#define CAUSE_MISALIGNED_FETCH		0x0
#define CAUSE_FETCH_ACCESS		0x1
#define CAUSE_ILLEGAL_INSTRUCTION	0x2
#define CAUSE_BREAKPOINT		0x3
#define CAUSE_MISALIGNED_LOAD		0x4
#define CAUSE_LOAD_ACCESS		0x5
#define CAUSE_MISALIGNED_STORE		0x6
#define CAUSE_STORE_ACCESS		0x7
#define CAUSE_USER_ECALL		0x8
#define CAUSE_SUPERVISOR_ECALL		0x9
#define CAUSE_VIRTUAL_SUPERVISOR_ECALL	0xa
#define CAUSE_MACHINE_ECALL		0xb
#define CAUSE_FETCH_PAGE_FAULT		0xc
#define CAUSE_LOAD_PAGE_FAULT		0xd
#define CAUSE_STORE_PAGE_FAULT		0xf
#define CAUSE_FETCH_GUEST_PAGE_FAULT	0x14
#define CAUSE_LOAD_GUEST_PAGE_FAULT	0x15
#define CAUSE_VIRTUAL_INST_FAULT	0x16
#define CAUSE_STORE_GUEST_PAGE_FAULT	0x17

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
