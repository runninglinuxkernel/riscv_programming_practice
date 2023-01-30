#include "uapi/syscall.h"

/*
  syscall (int nr, ...)

  RISC-V使用a0-a6来传递参数，其中a7用来传递系统调用号
  返回值通过a0传递

  RISC-V system calls take between 0 and 7 arguments. On entry here nr
  is in a0 and any other system call arguments are in register a1..a7.

  For kernel entry we need to move the system call nr to a7 then
  load the remaining arguments to register.
 */
.global syscall
syscall:
	move     t0, a0
	move     a0, a1
	move     a1, a2
	move     a2, a3
	move     a3, a4
	move     a4, a5
	move     a5, a6
	move     a6, a7
	move     a7, t0
	ecall
	ret

/*
   int clone(int (*fn)(void *arg),     a0
            void *child_stack,         a1
	    int flags,                 a2
	    void *arg)                 a3
 */
.align  2
.global __clone
__clone:
	/*把fn和arg保存到child_stack栈里面*/
	addi a1, a1, -16
	sd a0, (a1)
	sd a3, 8(a1)

	/* call syscall*/
	move a0, a2

	li     a7, __NR_clone
	scall

	/*
	  1. 父进程返回时，返回值为 子进程（线程）的pid
	  2. 而子进程返回时， 返回值为0.
	  由于子进程在do_fork期间，直接 把 父进程的
	  pt_regs栈框拷贝过来的, 因此把pt_regs->sepc和
	  pt_regs->sstatus也拷贝了父进程的， 所以当子进程
	  从内核态返回到用户空间时, 它也是返回到 这里。

	  子进程返回路径：
	  调度器选择子进程 ->
	      进程切换到子进程->
		    ret_from_fork->
		       ret_to_usr->
		               返回到此
	 */
	beqz a0, thread_start
	ret

.align 2
thread_start:
	/* 从child_stack栈取出fn和arg */
	ld a1, (sp)
	ld a0, 8(sp)

	/* 调用clone的回调函数fn() */
	jalr   a1

	/* exit */
	ret
