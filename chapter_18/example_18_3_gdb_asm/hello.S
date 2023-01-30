.data 
wait:
	.word	1

.align 3
string:
	.ascii "hello RVV!\n"

.text
.align 2
.global main
main:
loop:
	la a5, wait
	lw a6, (a5)
	bne a6,zero,loop

	//enable FPU and Vector
	li t0, 0x00006000 | 0x600
	csrs mstatus, t0

	addi    sp,sp,-16

 	vsetivli t0, 10, e8 
	la a1, string
	vle8.v v1, (a1)
	
	li a0, 0
	addi    sp,sp,16
	ret
