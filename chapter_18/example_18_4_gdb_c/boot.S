.data
.align 2
wait:
	.word	1

.align  12
stacks:
	.skip 4096

.section ".text.startup"
.align	2
.global	main
main:
.loop:
	la a5, wait
	lw a6, (a5)
	bne a6,zero,.loop

	//enable FPU and Vector
	li t0, 0x00006000 | 0x600
	csrs mstatus, t0

	la sp, stacks + 4096

	call do_main
