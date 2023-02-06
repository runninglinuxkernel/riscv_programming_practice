	.file	"sbi_lib.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	read_csr_num
	.type	read_csr_num, @function
read_csr_num:
.LFB0:
	.file 1 "sbi/sbi_lib.c"
	.loc 1 7 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	sd	s1,32(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-36(s0)
	.loc 1 8 16
	sd	zero,-24(s0)
	lw	a5,-36(s0)
	addiw	a3,a5,-928
	sext.w	a4,a3
	li	a5,23
	bgtu	a4,a5,.L15
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lla	a5,.L4
	add	a5,a4,a5
	lw	a5,0(a5)
	sext.w	a4,a5
	lla	a5,.L4
	add	a5,a4,a5
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L4:
	.word	.L12-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L15-.L4
	.word	.L11-.L4
	.word	.L10-.L4
	.word	.L9-.L4
	.word	.L8-.L4
	.word	.L7-.L4
	.word	.L6-.L4
	.word	.L5-.L4
	.word	.L3-.L4
	.text
.L12:
.LBB2:
	.loc 1 12 40
 #APP
# 12 "sbi/sbi_lib.c" 1
	csrr a5, 0x3a0
# 0 "" 2
 #NO_APP
	mv	s1,a5
	.loc 1 12 110
	mv	a5,s1
.LBE2:
	.loc 1 12 7
	sd	a5,-24(s0)
	.loc 1 13 3
	j	.L13
.L11:
.LBB3:
	.loc 1 15 40
 #APP
# 15 "sbi/sbi_lib.c" 1
	csrr a5, 0x3b0
# 0 "" 2
 #NO_APP
	mv	s1,a5
	.loc 1 15 110
	mv	a5,s1
.LBE3:
	.loc 1 15 7
	sd	a5,-24(s0)
	.loc 1 16 3
	j	.L13
.L10:
.LBB4:
	.loc 1 18 40
 #APP
# 18 "sbi/sbi_lib.c" 1
	csrr a5, 0x3b1
# 0 "" 2
 #NO_APP
	mv	s1,a5
	.loc 1 18 110
	mv	a5,s1
.LBE4:
	.loc 1 18 7
	sd	a5,-24(s0)
	.loc 1 19 3
	j	.L13
.L9:
.LBB5:
	.loc 1 21 40
 #APP
# 21 "sbi/sbi_lib.c" 1
	csrr a5, 0x3b2
# 0 "" 2
 #NO_APP
	mv	s1,a5
	.loc 1 21 110
	mv	a5,s1
.LBE5:
	.loc 1 21 7
	sd	a5,-24(s0)
	.loc 1 22 3
	j	.L13
.L8:
.LBB6:
	.loc 1 24 40
 #APP
# 24 "sbi/sbi_lib.c" 1
	csrr a5, 0x3b3
# 0 "" 2
 #NO_APP
	mv	s1,a5
	.loc 1 24 110
	mv	a5,s1
.LBE6:
	.loc 1 24 7
	sd	a5,-24(s0)
	.loc 1 25 3
	j	.L13
.L7:
.LBB7:
	.loc 1 27 40
 #APP
# 27 "sbi/sbi_lib.c" 1
	csrr a5, 0x3b4
# 0 "" 2
 #NO_APP
	mv	s1,a5
	.loc 1 27 110
	mv	a5,s1
.LBE7:
	.loc 1 27 7
	sd	a5,-24(s0)
	.loc 1 28 3
	j	.L13
.L6:
.LBB8:
	.loc 1 30 40
 #APP
# 30 "sbi/sbi_lib.c" 1
	csrr a5, 0x3b5
# 0 "" 2
 #NO_APP
	mv	s1,a5
	.loc 1 30 110
	mv	a5,s1
.LBE8:
	.loc 1 30 7
	sd	a5,-24(s0)
	.loc 1 31 3
	j	.L13
.L5:
.LBB9:
	.loc 1 33 40
 #APP
# 33 "sbi/sbi_lib.c" 1
	csrr a5, 0x3b6
# 0 "" 2
 #NO_APP
	mv	s1,a5
	.loc 1 33 110
	mv	a5,s1
.LBE9:
	.loc 1 33 7
	sd	a5,-24(s0)
	.loc 1 34 3
	j	.L13
.L3:
.LBB10:
	.loc 1 36 40
 #APP
# 36 "sbi/sbi_lib.c" 1
	csrr a5, 0x3b7
# 0 "" 2
 #NO_APP
	mv	s1,a5
	.loc 1 36 110
	mv	a5,s1
.LBE10:
	.loc 1 36 7
	sd	a5,-24(s0)
	.loc 1 37 3
	j	.L13
.L15:
	.loc 1 39 3
	nop
.L13:
	.loc 1 42 9
	ld	a5,-24(s0)
	.loc 1 43 1
	mv	a0,a5
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	ld	s1,32(sp)
	.cfi_restore 9
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	read_csr_num, .-read_csr_num
	.align	2
	.globl	write_csr_num
	.type	write_csr_num, @function
write_csr_num:
.LFB1:
	.loc 1 46 1
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	sd	s0,104(sp)
	.cfi_offset 8, -8
	addi	s0,sp,112
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sd	a1,-112(s0)
	sw	a5,-100(s0)
	lw	a5,-100(s0)
	addiw	a3,a5,-928
	sext.w	a4,a3
	li	a5,23
	bgtu	a4,a5,.L29
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lla	a5,.L19
	add	a5,a4,a5
	lw	a5,0(a5)
	sext.w	a4,a5
	lla	a5,.L19
	add	a5,a4,a5
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L19:
	.word	.L27-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L29-.L19
	.word	.L26-.L19
	.word	.L25-.L19
	.word	.L24-.L19
	.word	.L23-.L19
	.word	.L22-.L19
	.word	.L21-.L19
	.word	.L20-.L19
	.word	.L18-.L19
	.text
.L27:
.LBB11:
	.loc 1 49 20
	ld	a5,-112(s0)
	sd	a5,-88(s0)
	.loc 1 49 48
	ld	a5,-88(s0)
 #APP
# 49 "sbi/sbi_lib.c" 1
	csrw 0x3a0, a5
# 0 "" 2
 #NO_APP
.LBE11:
	.loc 1 50 3
	j	.L28
.L26:
.LBB12:
	.loc 1 52 20
	ld	a5,-112(s0)
	sd	a5,-80(s0)
	.loc 1 52 48
	ld	a5,-80(s0)
 #APP
# 52 "sbi/sbi_lib.c" 1
	csrw 0x3b0, a5
# 0 "" 2
 #NO_APP
.LBE12:
	.loc 1 53 3
	j	.L28
.L25:
.LBB13:
	.loc 1 55 20
	ld	a5,-112(s0)
	sd	a5,-72(s0)
	.loc 1 55 48
	ld	a5,-72(s0)
 #APP
# 55 "sbi/sbi_lib.c" 1
	csrw 0x3b1, a5
# 0 "" 2
 #NO_APP
.LBE13:
	.loc 1 56 3
	j	.L28
.L24:
.LBB14:
	.loc 1 58 20
	ld	a5,-112(s0)
	sd	a5,-64(s0)
	.loc 1 58 48
	ld	a5,-64(s0)
 #APP
# 58 "sbi/sbi_lib.c" 1
	csrw 0x3b2, a5
# 0 "" 2
 #NO_APP
.LBE14:
	.loc 1 59 3
	j	.L28
.L23:
.LBB15:
	.loc 1 61 20
	ld	a5,-112(s0)
	sd	a5,-56(s0)
	.loc 1 61 48
	ld	a5,-56(s0)
 #APP
# 61 "sbi/sbi_lib.c" 1
	csrw 0x3b3, a5
# 0 "" 2
 #NO_APP
.LBE15:
	.loc 1 62 3
	j	.L28
.L22:
.LBB16:
	.loc 1 64 20
	ld	a5,-112(s0)
	sd	a5,-48(s0)
	.loc 1 64 48
	ld	a5,-48(s0)
 #APP
# 64 "sbi/sbi_lib.c" 1
	csrw 0x3b4, a5
# 0 "" 2
 #NO_APP
.LBE16:
	.loc 1 65 3
	j	.L28
.L21:
.LBB17:
	.loc 1 67 20
	ld	a5,-112(s0)
	sd	a5,-40(s0)
	.loc 1 67 48
	ld	a5,-40(s0)
 #APP
# 67 "sbi/sbi_lib.c" 1
	csrw 0x3b5, a5
# 0 "" 2
 #NO_APP
.LBE17:
	.loc 1 68 3
	j	.L28
.L20:
.LBB18:
	.loc 1 70 20
	ld	a5,-112(s0)
	sd	a5,-32(s0)
	.loc 1 70 48
	ld	a5,-32(s0)
 #APP
# 70 "sbi/sbi_lib.c" 1
	csrw 0x3b6, a5
# 0 "" 2
 #NO_APP
.LBE18:
	.loc 1 71 3
	j	.L28
.L18:
.LBB19:
	.loc 1 73 20
	ld	a5,-112(s0)
	sd	a5,-24(s0)
	.loc 1 73 48
	ld	a5,-24(s0)
 #APP
# 73 "sbi/sbi_lib.c" 1
	csrw 0x3b7, a5
# 0 "" 2
 #NO_APP
.LBE19:
	.loc 1 74 3
	j	.L28
.L29:
	.loc 1 76 3
	nop
.L28:
	.loc 1 78 1
	nop
	ld	s0,104(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 112
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	write_csr_num, .-write_csr_num
	.align	2
	.globl	log2roundup
	.type	log2roundup, @function
log2roundup:
.LFB2:
	.loc 1 81 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	.loc 1 82 16
	sd	zero,-24(s0)
	.loc 1 84 8
	j	.L31
.L34:
	.loc 1 85 17
	ld	a5,-24(s0)
	sext.w	a5,a5
	mv	a4,a5
	li	a5,1
	sll	a5,a5,a4
	.loc 1 85 6
	ld	a4,-40(s0)
	bleu	a4,a5,.L36
	.loc 1 87 6
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L31:
	.loc 1 84 8
	ld	a4,-24(s0)
	li	a5,63
	bleu	a4,a5,.L34
	j	.L33
.L36:
	.loc 1 86 4
	nop
.L33:
	.loc 1 90 9
	ld	a5,-24(s0)
	.loc 1 91 1
	mv	a0,a5
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	log2roundup, .-log2roundup
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x37f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF4
	.byte	0xc
	.4byte	.LASF5
	.4byte	.LASF6
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0x50
	.byte	0xf
	.4byte	0x6c
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x6c
	.byte	0x3
	.string	"x"
	.byte	0x1
	.byte	0x50
	.byte	0x29
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x4
	.string	"ret"
	.byte	0x1
	.byte	0x52
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2d
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x1fe
	.byte	0x7
	.4byte	.LASF0
	.byte	0x1
	.byte	0x2d
	.byte	0x18
	.4byte	0x1fe
	.byte	0x3
	.byte	0x91
	.byte	0x9c,0x7f
	.byte	0x3
	.string	"val"
	.byte	0x1
	.byte	0x2d
	.byte	0x2f
	.4byte	0x6c
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x7f
	.byte	0x8
	.8byte	.LBB11
	.8byte	.LBE11-.LBB11
	.4byte	0xd7
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x31
	.byte	0x14
	.4byte	0x6c
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0
	.byte	0x8
	.8byte	.LBB12
	.8byte	.LBE12-.LBB12
	.4byte	0xfd
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x34
	.byte	0x14
	.4byte	0x6c
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0
	.byte	0x8
	.8byte	.LBB13
	.8byte	.LBE13-.LBB13
	.4byte	0x123
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x37
	.byte	0x14
	.4byte	0x6c
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0
	.byte	0x8
	.8byte	.LBB14
	.8byte	.LBE14-.LBB14
	.4byte	0x148
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x3a
	.byte	0x14
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0
	.byte	0x8
	.8byte	.LBB15
	.8byte	.LBE15-.LBB15
	.4byte	0x16d
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x3d
	.byte	0x14
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0x8
	.8byte	.LBB16
	.8byte	.LBE16-.LBB16
	.4byte	0x192
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x40
	.byte	0x14
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0x8
	.8byte	.LBB17
	.8byte	.LBE17-.LBB17
	.4byte	0x1b7
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x43
	.byte	0x14
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x8
	.8byte	.LBB18
	.8byte	.LBE18-.LBB18
	.4byte	0x1dc
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x46
	.byte	0x14
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x9
	.8byte	.LBB19
	.8byte	.LBE19-.LBB19
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x49
	.byte	0x14
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0xb
	.4byte	.LASF3
	.byte	0x1
	.byte	0x6
	.byte	0xf
	.4byte	0x6c
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x7
	.4byte	.LASF0
	.byte	0x1
	.byte	0x6
	.byte	0x20
	.4byte	0x1fe
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x4
	.string	"ret"
	.byte	0x1
	.byte	0x8
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x8
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x265
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0xc
	.byte	0x23
	.4byte	0x6c
	.byte	0x1
	.byte	0x59
	.byte	0
	.byte	0x8
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x289
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0xf
	.byte	0x23
	.4byte	0x6c
	.byte	0x1
	.byte	0x59
	.byte	0
	.byte	0x8
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0x2ad
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x12
	.byte	0x23
	.4byte	0x6c
	.byte	0x1
	.byte	0x59
	.byte	0
	.byte	0x8
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.4byte	0x2d1
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x15
	.byte	0x23
	.4byte	0x6c
	.byte	0x1
	.byte	0x59
	.byte	0
	.byte	0x8
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0x2f5
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x18
	.byte	0x23
	.4byte	0x6c
	.byte	0x1
	.byte	0x59
	.byte	0
	.byte	0x8
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.4byte	0x319
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x1b
	.byte	0x23
	.4byte	0x6c
	.byte	0x1
	.byte	0x59
	.byte	0
	.byte	0x8
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.4byte	0x33d
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x1e
	.byte	0x23
	.4byte	0x6c
	.byte	0x1
	.byte	0x59
	.byte	0
	.byte	0x8
	.8byte	.LBB9
	.8byte	.LBE9-.LBB9
	.4byte	0x361
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x21
	.byte	0x23
	.4byte	0x6c
	.byte	0x1
	.byte	0x59
	.byte	0
	.byte	0x9
	.8byte	.LBB10
	.8byte	.LBE10-.LBB10
	.byte	0x4
	.string	"__v"
	.byte	0x1
	.byte	0x24
	.byte	0x23
	.4byte	0x6c
	.byte	0x1
	.byte	0x59
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x8
	.byte	0
	.2byte	0
	.2byte	0
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.8byte	0
	.8byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF1:
	.string	"long unsigned int"
.LASF5:
	.string	"sbi/sbi_lib.c"
.LASF7:
	.string	"log2roundup"
.LASF4:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF3:
	.string	"read_csr_num"
.LASF2:
	.string	"write_csr_num"
.LASF6:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_6\\\\lab6-3\\\\benos"
.LASF0:
	.string	"csr_num"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
