.global __memset_16bytes_asm
__memset_16bytes_asm:
	li t0, 0
.loop:
	sd a1, (a0)
	sd a1, 8(a0)
	addi t0, t0, 16
	blt t0, a2, .loop

	ret
