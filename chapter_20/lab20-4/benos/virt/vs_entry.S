#include "asm/asm-offsets.h"
#include "asm/csr.h"
#include "asm/processor.h"

/*
     void jump_to_vs_mode(unsigned long addr)
*/
.global jump_to_vs_mode
jump_to_vs_mode:
	/*
	   马上要跳到 虚拟机中
	   1. 把HS模式的sp保存到 task_struct->kernel_sp中
	   2. 把tp保存到HS模式的sscratch中，下次从虚拟机陷入时候，能找到tp
	 */
	sd sp, TASK_TI_KERNEL_SP(tp)
	csrw sscratch, tp
	csrw sepc, a0
	sret
