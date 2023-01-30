.data 
.align 3
string:
	.ascii "hello RVV!\n"

.text
.align 2
.globl main
main:
	addi    sp,sp,-16

 	vsetivli t0, 10, e8 
	la a1, string
	vle8.v v1, (a1)
	
	# print the string
	la a0, string
	sd ra,8(sp)
	call printf
	ld ra,8(sp)
	
	li a0, 0
	addi    sp,sp,16
	ret
