#include "asm/asm-offsets.h"
#include "asm/csr.h"

.macro kernel_entry
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

	csrr s1, sstatus
	sd s1, PT_SSTATUS(sp)

	/*保存sepc*/
	csrr s2, sepc
	sd s2, PT_SEPC(sp)
	
	/*保存sbadaddr*/
	csrr s3, sbadaddr
	sd s3, PT_SBADADDR(sp)

	/*保存scause*/
	csrr s4, scause
	sd s4, PT_SCAUSE(sp)

	/*保存ssratch*/
	csrr s5, sscratch
	sd s5, PT_TP(sp)

	/*保存SP*/
	addi s0, sp, PT_SIZE 
	sd s0, PT_SP(sp)
.endm

.macro kernel_exit
	ld a0, PT_SSTATUS(sp)
	csrw sstatus, a0

	ld a2, PT_SEPC(sp)
	csrw sepc, a2

	ld x1,  PT_RA(sp)
	ld x3,  PT_GP(sp)
	ld x4,  PT_TP(sp)
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

	ld x2,  PT_SP(sp)
.endm

/*
   vs_exception_vector必须4字节对齐
   否则写入stvec寄存器会不成功
 */
.align 2
.global vs_exception_vector
vs_exception_vector:
	kernel_entry

	csrw sscratch, x0

	la ra, ret_from_exception

	mv a0, sp /* pt_regs */
	mv a1, s4
	tail do_vs_exception

ret_from_exception:
	kernel_exit
	sret

.global jump_to_vs_mode
jump_to_vs_mode:
	la t0, 1f
	csrw sepc, t0
	sret
1:
	ret
