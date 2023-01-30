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

kernel_entry_func:
	addi sp, sp, -(PT_SIZE)

	/* 不用从把ra保存到栈里，此时的ra不是中断现场发生时的ra*/
//	sd x1,  PT_RA(sp)
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

	/*
	   禁止管理员访问用户内存
	   关闭FPU
	 */
	li t0, SR_SUM | SR_FS
	csrrc s1, sstatus, t0
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

	ret

kernel_exit_func:
	ld a0, PT_SSTATUS(sp)
	csrw sstatus, a0

	ld a2, PT_SEPC(sp)
	csrw sepc, a2

	/* 不用从栈中 取出 ra*/
//	ld x1,  PT_RA(sp)
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

	ret

/*
   do_exception_vector必须4字节对齐
   否则写入stvec寄存器会不成功
 */
.align 2
.global do_exception_vector
do_exception_vector:
	/*
	 先把中断现场发生时的ra寄存器保存到栈里，
	 否则调用kernel_entry函数来保存中断现场，ra寄存器已经被破环

	 这里先让sp减去16，分配一个专用的栈空间来保存中断现场的ra，
	 然后保存 ra到 sp+8的地方
	 */
	addi sp, sp, -16
	sd ra, 8(sp)
	/*调用保存中断现场的函数*/
	call kernel_entry_func

	csrw sscratch, x0

	la ra, ret_from_exception

	mv a0, sp /* pt_regs */
	mv a1, s4
	tail do_exception

ret_from_exception:
restore_all:
	call kernel_exit_func
	/*
	   中断返回现场之前，从专门的栈空间里取出 中断现场时的ra
	 */
	ld ra, 8(sp)
	addi sp, sp, 16
	sret

.global trigger_load_access_fault
trigger_load_access_fault:
	li a0, 0x70000000
	ld a0, (a0)
	ret
