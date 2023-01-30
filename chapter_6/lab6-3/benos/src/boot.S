.section ".text.boot"

.globl _start
_start:
       /*
          假设代码段存储在ROM中(LMA)，而ROM的地址在0x80300000

          我们需要把代码段 从加载地址(LMA)拷贝到 运行地址(VMA)
        */
       la t0, TEXT_ROM
       la t1, _text
       la t2, _etext
.L0:
	ld  a5, (t0)
	sd a5, (t1)
	addi t1, t1, 8
	addi t0, t0, 8
	bltu t1, t2, .L0

	/* 关闭中断 */
	csrw sie, zero

	call __init_uart
	call print_asm

	/* 设置栈, 栈的大小为4KB */
	la sp, stacks_start
	li t0, 4096
	add sp, sp, t0

	/* 跳转到C语言 */
	tail kernel_main

print_asm:
        /*此时SP栈空间还没分配，把返回地址ra保存到临时寄存器中*/
	mv s1, ra

	la a0, boot_string
	call put_string_uart

	/*恢复返回地址ra*/
	mv ra, s1
	ret

.section .data
.align  12
.global stacks_start
stacks_start:
	.skip 4096

.section  .rodata
.align 3
.globl boot_string
boot_string:
       .string "Booting at asm\n"

