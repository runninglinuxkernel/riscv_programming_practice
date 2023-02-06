.section ".text.boot"

.globl _start
_start:
	/* Boot head information for BROM */
	.long 0x0300006f
	.byte 'e', 'G', 'O', 'N', '.', 'B', 'T', '0'
	.long 0x12345678				/* checksum */
	.long __bin_size   				/* spl size */
	.long 0x30						/* boot header size */
	.long 0x30303033				/* boot header version */
	.long 0x00020000				/* return value */
	.long 0x00020000				/* run address */
	.long 0x0						/* eGON version */
	.byte 0x00, 0x00, 0x00, 0x00	/* platform information - 8byte */
	.byte 0x34, 0x2e, 0x30, 0x00

/*
 * The actual reset code
 */
reset:
	/* 关闭M模式的中断*/
	csrw mie, zero
	
        /* 设置栈, 栈的大小为4KB */
	la sp, stacks_start
	li t0, 4096
	add sp, sp, t0
	
	/* 
	   把M模式的SP设置到mscratch寄存器，
	   下次陷入到M模式可以获取SP
	 */
	csrw mscratch, sp

	/* 跳转到C语言 */
	tail sbi_main

.section .data
.align  12
.global stacks_start
stacks_start:
	.skip 4096
