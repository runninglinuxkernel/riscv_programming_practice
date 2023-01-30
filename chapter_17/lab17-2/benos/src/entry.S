#include "asm/asm-offsets.h"
#include "asm/csr.h"
#include "mm.h"
#include "asm/processor.h"

.macro kernel_entry
	addi sp, sp, -(PT_SIZE)

	csrw sscratch, tp

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
   do_exception_vector必须4字节对齐
   否则写入stvec寄存器会不成功
 */
.align 2
.global do_exception_vector
do_exception_vector:
	/*保存异常（中断）现场*/
	kernel_entry

	la ra, ret_from_exception

	mv a0, sp /* pt_regs */
	mv a1, s4
	tail do_exception

ret_from_exception:
	ld s0, PT_SSTATUS(sp)
	csrc sstatus, SR_SIE
	/*判断是不是内核态触发的中断*/
	andi s0, s0, SR_SPP
	bnez s0, resume_kernel

resume_kernel:
        /*判断当前内核是否 处于 不可抢占状态，
	  preempt_count > 0表示不可抢占状态*/
	lw s0, TASK_TI_PREEMPT_COUNT(tp)
	bnez s0, restore_all
need_resched:
	/*判断是否要抢占当前进程*/
	lw s0, TASK_TI_NEED_RESCHED(tp)
	andi s0, s0, _TIF_NEED_RESCHED
	beqz s0, restore_all
	/*准备抢占当前进程*/
	call preempt_schedule_irq
	j need_resched
restore_all:
	/*恢复中断现场*/
	kernel_exit
	sret

.global trigger_load_access_fault
trigger_load_access_fault:
	li a0, 0x80000000
	ld a0, (a0)
	ret

.global enable_mmu_relocate
enable_mmu_relocate:
	la a2, idmap_pg_dir
	srl a2, a2, PAGE_SHIFT
	li a1, SATP_MODE_39
	or a2, a2, a1
	sfence.vma
	csrw sptbr, a2
	ret

/*
进程切换： 保存prev进程的上下文，并且恢复next进程
的上下文
 struct task_struct * cpu_switch_to(struct task_struct *prev,
	   struct task_struct *next);

需要保存的上下文： ra,sp,s0 ~s11
保存到进程的task_struct->cpu_context

通过a0寄存器返回prev进程的task_struct
 */
.align 2
.global cpu_switch_to
cpu_switch_to:
	li    a4,  TASK_CPU_CONTEXT
	add   a3, a0, a4
	add   a4, a1, a4

	/* 保存CPU上下文到prev进程的task_struct->cpu_context */
	sd ra, 0(a3)
	sd sp, 8(a3)
	sd s0, 16(a3)
	sd s1, 24(a3)
	sd s2, 32(a3)
	sd s3, 40(a3)
	sd s4, 48(a3)
	sd s5, 56(a3)
	sd s6, 64(a3)
	sd s7, 72(a3)
	sd s8, 80(a3)
	sd s9, 88(a3)
	sd s10, 96(a3)
	sd s11, 104(a3)

	/* 从next进程的task_struct->cpu_context中恢复上下文到CPU */
	ld ra, 0(a4)
	ld sp, 8(a4)
	ld s0, 16(a4)
	ld s1, 24(a4)
	ld s2, 32(a4)
	ld s3, 40(a4)
	ld s4, 48(a4)
	ld s5, 56(a4)
	ld s6, 64(a4)
	ld s7, 72(a4)
	ld s8, 80(a4)
	ld s9, 88(a4)
	ld s10, 96(a4)
	ld s11, 104(a4)

	/* tp point to task_struct*/
	move tp, a1

	ret

/*
 进程fork之后第一次内核线程
 */
.align 2
.global ret_from_kernel_thread
ret_from_kernel_thread:
          /* 第一次运行的进程来收拾prev进程
	   的烂摊子, 比如打开中断等*/
	call schedule_tail
	/* Call fn(arg) */
	la ra, ret_from_exception
	move a0, s1
	jr s0
