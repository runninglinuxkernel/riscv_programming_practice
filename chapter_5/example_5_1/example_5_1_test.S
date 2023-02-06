.section .data
.align	3
my_data1:
	.word  100
my_data2:
	.word  50
print_data:
	.string "data: %d\n"

.section .text
.align	2
.global main
main:
	addi sp, sp, -16
	sd ra, 8(sp)

	lw t0, my_data1
	lw t1, my_data2
	add a1, t0, t1

	la a0, print_data
	call printf

	li a0, 0

	ld ra, 8(sp)
	addi sp, sp, 16
	ret


