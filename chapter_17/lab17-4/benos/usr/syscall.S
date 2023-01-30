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
