	.file	"rvv_test.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%u "
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	li	a0,100
	sd	ra,8(sp)
	sd	s0,0(sp)
	call	malloc
	mv	s0,a0
	li	a0,100
	call	malloc
	mv	a1,a0
	mv	a3,s0
	mv	a4,a0
	li	a5,100
	csrr	a2,vlenb
.L2:
	vsetvli	a6,a5,e8,m1,ta,mu
	vle8.v	v24,(a3)
	vadd.vi	v24,v24,8
	vse8.v	v24,(a4)
	sub	a5,a5,a6
	add	a3,a3,a2
	add	a4,a4,a2
	bne	a5,zero,.L2
	lui	a0,%hi(.LC0)
	addi	a0,a0,%lo(.LC0)
	call	printf
	ld	ra,8(sp)
	ld	s0,0(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (gbb25a476796) 12.0.1 20220505 (prerelease)"
