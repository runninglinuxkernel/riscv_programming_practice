	.file	"memset.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	__memset_16bytes_inline_asm, @function
__memset_16bytes_inline_asm:
.LFB0:
	.file 1 "src/memset.c"
	.loc 1 7 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	s0,56(sp)
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	mv	a5,a2
	sw	a5,-52(s0)
	.loc 1 8 6
	sw	zero,-20(s0)
	.loc 1 10 2
	ld	a2,-48(s0)
	ld	a3,-40(s0)
	lw	a4,-52(s0)
	lw	a5,-20(s0)
 #APP
# 10 "src/memset.c" 1
	1: sd a2, (a3)
sd a2, 8(a3)
addi a5, a5, 16
blt a5, a4, 1b
# 0 "" 2
 #NO_APP
	sd	a3,-40(s0)
	sw	a4,-52(s0)
	sw	a5,-20(s0)
	.loc 1 19 1
	nop
	ld	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	__memset_16bytes_inline_asm, .-__memset_16bytes_inline_asm
	.align	2
	.type	__memset_1bytes, @function
__memset_1bytes:
.LFB1:
	.loc 1 22 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	s0,56(sp)
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	mv	a5,a1
	sd	a2,-56(s0)
	sw	a5,-44(s0)
	.loc 1 23 8
	ld	a5,-40(s0)
	sd	a5,-24(s0)
	.loc 1 25 8
	j	.L3
.L4:
	.loc 1 26 6
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 1 26 9
	lw	a4,-44(s0)
	andi	a4,a4,0xff
	sb	a4,0(a5)
.L3:
	.loc 1 25 14
	ld	a5,-56(s0)
	addi	a4,a5,-1
	sd	a4,-56(s0)
	.loc 1 25 8
	bne	a5,zero,.L4
	.loc 1 27 9
	ld	a5,-40(s0)
	.loc 1 28 1
	mv	a0,a5
	ld	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	__memset_1bytes, .-__memset_1bytes
	.align	2
	.type	__memset, @function
__memset:
.LFB2:
	.loc 1 31 1
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	sd	ra,104(sp)
	sd	s0,96(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,112
	.cfi_def_cfa 8, 0
	sd	a0,-88(s0)
	mv	a5,a1
	sd	a2,-104(s0)
	sw	a5,-92(s0)
	.loc 1 32 8
	ld	a5,-88(s0)
	sd	a5,-24(s0)
	.loc 1 33 16
	li	a5,16
	sd	a5,-56(s0)
	.loc 1 34 15
	ld	a5,-104(s0)
	sd	a5,-32(s0)
	.loc 1 36 16
	ld	a5,-24(s0)
	sd	a5,-64(s0)
	.loc 1 37 16
	sd	zero,-48(s0)
	.loc 1 42 9
	sw	zero,-36(s0)
	.loc 1 42 2
	j	.L7
.L8:
	.loc 1 43 31 discriminator 3
	lw	a5,-92(s0)
	andi	a5,a5,255
	.loc 1 43 45 discriminator 3
	lw	a4,-36(s0)
	slliw	a4,a4,3
	sext.w	a4,a4
	.loc 1 43 39 discriminator 3
	sll	a5,a5,a4
	.loc 1 43 8 discriminator 3
	ld	a4,-48(s0)
	or	a5,a4,a5
	sd	a5,-48(s0)
	.loc 1 42 22 discriminator 3
	lw	a5,-36(s0)
	addiw	a5,a5,1
	sw	a5,-36(s0)
.L7:
	.loc 1 42 2 discriminator 1
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,7
	ble	a4,a5,.L8
	.loc 1 46 23
	ld	a5,-56(s0)
	addi	a4,a5,-1
	.loc 1 46 14
	ld	a5,-64(s0)
	and	a5,a4,a5
	.loc 1 46 5
	beq	a5,zero,.L9
	.loc 1 48 27
	ld	a5,-56(s0)
	addi	a5,a5,-1
	.loc 1 48 8
	ld	a4,-64(s0)
	and	a5,a4,a5
	sd	a5,-72(s0)
	.loc 1 49 8
	ld	a4,-56(s0)
	ld	a5,-72(s0)
	sub	a5,a4,a5
	sd	a5,-72(s0)
	.loc 1 50 3
	lw	a5,-92(s0)
	ld	a2,-72(s0)
	mv	a1,a5
	ld	a0,-24(s0)
	call	__memset_1bytes
	.loc 1 51 5
	ld	a4,-24(s0)
	ld	a5,-72(s0)
	add	a5,a4,a5
	sd	a5,-24(s0)
	.loc 1 52 8
	ld	a4,-104(s0)
	ld	a5,-72(s0)
	sub	a5,a4,a5
	sd	a5,-32(s0)
.L9:
	.loc 1 56 5
	ld	a4,-32(s0)
	ld	a5,-56(s0)
	bleu	a4,a5,.L10
	.loc 1 57 12
	ld	a4,-32(s0)
	ld	a5,-56(s0)
	divu	a5,a4,a5
	.loc 1 57 5
	sw	a5,-76(s0)
	.loc 1 58 8
	ld	a4,-32(s0)
	ld	a5,-56(s0)
	remu	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 63 3
	lw	a5,-76(s0)
	slliw	a5,a5,4
	sext.w	a5,a5
	mv	a2,a5
	ld	a1,-48(s0)
	ld	a0,-24(s0)
	call	__memset_16bytes_inline_asm
	.loc 1 66 6
	ld	a5,-32(s0)
	beq	a5,zero,.L10
	.loc 1 67 26
	lw	a5,-76(s0)
	slliw	a5,a5,4
	sext.w	a5,a5
	mv	a4,a5
	.loc 1 67 22
	ld	a5,-24(s0)
	add	a5,a5,a4
	.loc 1 67 4
	lw	a4,-92(s0)
	ld	a2,-32(s0)
	mv	a1,a4
	mv	a0,a5
	call	__memset_1bytes
.L10:
	.loc 1 70 9
	ld	a5,-88(s0)
	.loc 1 71 1
	mv	a0,a5
	ld	ra,104(sp)
	.cfi_restore 1
	ld	s0,96(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 112
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	__memset, .-__memset
	.align	2
	.globl	memset
	.type	memset, @function
memset:
.LFB3:
	.loc 1 74 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	mv	a5,a1
	sd	a2,-40(s0)
	sw	a5,-28(s0)
	.loc 1 75 9
	lw	a5,-28(s0)
	ld	a2,-40(s0)
	mv	a1,a5
	ld	a0,-24(s0)
	call	__memset
	mv	a5,a0
	.loc 1 76 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	memset, .-memset
.Letext0:
	.file 2 "include/types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x247
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF18
	.byte	0xc
	.4byte	.LASF19
	.4byte	.LASF20
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.byte	0x4
	.4byte	.LASF21
	.byte	0x2
	.byte	0x1b
	.byte	0x1c
	.4byte	0x5e
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.byte	0x5
	.4byte	.LASF22
	.byte	0x1
	.byte	0x49
	.byte	0x7
	.4byte	0xcb
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0xcb
	.byte	0x6
	.string	"s"
	.byte	0x1
	.byte	0x49
	.byte	0x14
	.4byte	0xcb
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x6
	.string	"c"
	.byte	0x1
	.byte	0x49
	.byte	0x1b
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0x49
	.byte	0x25
	.4byte	0x65
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0
	.byte	0x8
	.byte	0x8
	.byte	0x9
	.4byte	.LASF16
	.byte	0x1
	.byte	0x1e
	.byte	0xe
	.4byte	0xcb
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x190
	.byte	0x6
	.string	"s"
	.byte	0x1
	.byte	0x1e
	.byte	0x1d
	.4byte	0x190
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x6
	.string	"c"
	.byte	0x1
	.byte	0x1e
	.byte	0x24
	.4byte	0x49
	.byte	0x3
	.byte	0x91
	.byte	0xa4,0x7f
	.byte	0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0x1e
	.byte	0x2e
	.4byte	0x65
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0xa
	.string	"p"
	.byte	0x1
	.byte	0x20
	.byte	0x8
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xb
	.4byte	.LASF10
	.byte	0x1
	.byte	0x21
	.byte	0x10
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xb
	.4byte	.LASF11
	.byte	0x1
	.byte	0x22
	.byte	0x9
	.4byte	0x65
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0xb
	.4byte	.LASF12
	.byte	0x1
	.byte	0x22
	.byte	0xf
	.4byte	0x65
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xa
	.string	"n"
	.byte	0x1
	.byte	0x23
	.byte	0x6
	.4byte	0x49
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x7f
	.byte	0xa
	.string	"i"
	.byte	0x1
	.byte	0x23
	.byte	0x9
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0xb
	.4byte	.LASF13
	.byte	0x1
	.byte	0x24
	.byte	0x10
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0xb
	.4byte	.LASF14
	.byte	0x1
	.byte	0x25
	.byte	0x10
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x196
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.byte	0xd
	.4byte	.LASF17
	.byte	0x1
	.byte	0x15
	.byte	0xe
	.4byte	0xcb
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x1f7
	.byte	0x6
	.string	"s"
	.byte	0x1
	.byte	0x15
	.byte	0x24
	.4byte	0xcb
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x6
	.string	"c"
	.byte	0x1
	.byte	0x15
	.byte	0x2b
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0x15
	.byte	0x35
	.4byte	0x65
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xa
	.string	"xs"
	.byte	0x1
	.byte	0x17
	.byte	0x8
	.4byte	0x190
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xe
	.4byte	.LASF23
	.byte	0x1
	.byte	0x5
	.byte	0xd
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x6
	.string	"p"
	.byte	0x1
	.byte	0x5
	.byte	0x2f
	.4byte	0xcb
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x6
	.string	"val"
	.byte	0x1
	.byte	0x5
	.byte	0x40
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0x6
	.byte	0x7
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0xa
	.string	"i"
	.byte	0x1
	.byte	0x8
	.byte	0x6
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x6c
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
	.byte	0x3
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
	.byte	0x4
	.byte	0x16
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
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x2e
	.byte	0x1
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
	.byte	0x34
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
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x2e
	.byte	0x1
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
	.byte	0xe
	.byte	0x2e
	.byte	0x1
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
.LASF21:
	.string	"size_t"
.LASF10:
	.string	"align"
.LASF19:
	.string	"src/memset.c"
.LASF12:
	.string	"left"
.LASF14:
	.string	"data"
.LASF20:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_4\\\\example_4_4\\\\benos"
.LASF16:
	.string	"__memset"
.LASF1:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF18:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF22:
	.string	"memset"
.LASF17:
	.string	"__memset_1bytes"
.LASF4:
	.string	"unsigned int"
.LASF13:
	.string	"address"
.LASF6:
	.string	"long long unsigned int"
.LASF5:
	.string	"long long int"
.LASF15:
	.string	"char"
.LASF9:
	.string	"count"
.LASF2:
	.string	"short int"
.LASF7:
	.string	"long int"
.LASF23:
	.string	"__memset_16bytes_inline_asm"
.LASF0:
	.string	"signed char"
.LASF11:
	.string	"size"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
