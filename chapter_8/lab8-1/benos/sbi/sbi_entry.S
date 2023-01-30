#include "sbi_asm_offsets.h"

/*
   sbi_exception_vector 
   M模式的异常向量入口
   8字节对齐
 */
.align 3
.global sbi_exception_vector
sbi_exception_vector:
	/* 从mscratch获取M模式的sp，把S模式的SP保存到mscratch*/
	csrrw sp, mscratch, sp

	addi sp, sp, -(PT_SIZE)

	sd x1,  PT_RA(sp)
	sd x3,  PT_GP(sp)
	sd x5,  PT_T0(sp)
	sd x6,  PT_T1(sp)
	sd x7,  PT_T2(sp)
	sd x8,  PT_S0(sp)
	sd x9,  PT_S1(sp)
	sd x10, PT_A0(sp)
	sd x11, PT_A1(sp)
	sd x12, PT_A2(sp)
	sd x13, PT_A3(sp)
	sd x14, PT_A4(sp)
	sd x15, PT_A5(sp)
	sd x16, PT_A6(sp)
	sd x17, PT_A7(sp)
	sd x18, PT_S2(sp)
	sd x19, PT_S3(sp)
	sd x20, PT_S4(sp)
	sd x21, PT_S5(sp)
	sd x22, PT_S6(sp)
	sd x23, PT_S7(sp)
	sd x24, PT_S8(sp)
	sd x25, PT_S9(sp)
	sd x26, PT_S10(sp)
	sd x27, PT_S11(sp)
	sd x28, PT_T3(sp)
	sd x29, PT_T4(sp)
	sd x30, PT_T5(sp)
	sd x31, PT_T6(sp)

	/*保存mepc*/
	csrr t0, mepc
	sd t0, PT_MEPC(sp)

	/*保存mstatus*/
	csrr t0, mstatus
	sd t0, PT_MSTATUS(sp)

	/*
	   这里有两个目的:
	   1. 保存S模式的SP保存到 sbi_trap_regs->sp
	   2. 把M模式的SP保存到mscratch, 以便下次陷入到M模式时候可以得到SP
	 */
	addi t0, sp, PT_SIZE /* 此时的SP为M模式的SP, mscratch保存的是S模式的SP */
	/* 把M模式的SP保存到mscratch，把S模式的SP保存到 栈框sbi_trap_regs->sp里*/
	csrrw   t0, mscratch, t0
	sd t0, PT_SP(sp)

	/* 调用C语言的sbi_trap_handler */
	mv a0, sp /* sbi_trap_regs */
	call sbi_trap_handler

	/* save context*/
	ld t0, PT_MSTATUS(sp)
	csrw mstatus, t0

	ld t0, PT_MEPC(sp)
	csrw mepc, t0

	ld x1,  PT_RA(sp)
	ld x3,  PT_GP(sp)
	ld x5,  PT_T0(sp)
	ld x6,  PT_T1(sp)
	ld x7,  PT_T2(sp)
	ld x8,  PT_S0(sp)
	ld x9,  PT_S1(sp)
	ld x10, PT_A0(sp)
	ld x11, PT_A1(sp)
	ld x12, PT_A2(sp)
	ld x13, PT_A3(sp)
	ld x14, PT_A4(sp)
	ld x15, PT_A5(sp)
	ld x16, PT_A6(sp)
	ld x17, PT_A7(sp)
	ld x18, PT_S2(sp)
	ld x19, PT_S3(sp)
	ld x20, PT_S4(sp)
	ld x21, PT_S5(sp)
	ld x22, PT_S6(sp)
	ld x23, PT_S7(sp)
	ld x24, PT_S8(sp)
	ld x25, PT_S9(sp)
	ld x26, PT_S10(sp)
	ld x27, PT_S11(sp)
	ld x28, PT_T3(sp)
	ld x29, PT_T4(sp)
	ld x30, PT_T5(sp)
	ld x31, PT_T6(sp)

	ld sp,  PT_SP(sp)
	mret
