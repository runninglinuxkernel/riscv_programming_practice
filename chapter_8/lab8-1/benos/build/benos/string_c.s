	.file	"string.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
.LFB0:
	.file 1 "src/string.c"
	.loc 1 5 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	.loc 1 8 10
	ld	a5,-40(s0)
	sd	a5,-24(s0)
	.loc 1 8 2
	j	.L2
.L3:
	.loc 1 8 28 discriminator 3
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L2:
	.loc 1 8 15 discriminator 1
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	.loc 1 8 2 discriminator 1
	bne	a5,zero,.L3
	.loc 1 11 12
	ld	a4,-24(s0)
	ld	a5,-40(s0)
	sub	a5,a4,a5
	.loc 1 12 1
	mv	a0,a5
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	strlen, .-strlen
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
.LFB1:
	.loc 1 15 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	s0,56(sp)
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	.loc 1 16 8
	ld	a5,-40(s0)
	sd	a5,-24(s0)
	.loc 1 17 14
	ld	a5,-48(s0)
	sd	a5,-32(s0)
	.loc 1 19 8
	j	.L6
.L7:
	.loc 1 20 14
	ld	a4,-32(s0)
	addi	a5,a4,1
	sd	a5,-32(s0)
	.loc 1 20 7
	ld	a5,-24(s0)
	addi	a3,a5,1
	sd	a3,-24(s0)
	.loc 1 20 12
	lbu	a4,0(a4)
	.loc 1 20 10
	sb	a4,0(a5)
.L6:
	.loc 1 19 14
	ld	a5,-56(s0)
	addi	a4,a5,-1
	sd	a4,-56(s0)
	.loc 1 19 8
	bne	a5,zero,.L7
	.loc 1 21 9
	ld	a5,-40(s0)
	.loc 1 22 1
	mv	a0,a5
	ld	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	memcpy, .-memcpy
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x104
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
	.byte	0x2
	.byte	0x1c
	.4byte	0x39
	.byte	0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.byte	0x4
	.4byte	.LASF8
	.byte	0x1
	.byte	0xe
	.byte	0x7
	.4byte	0xac
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0xac
	.byte	0x5
	.4byte	.LASF0
	.byte	0x1
	.byte	0xe
	.byte	0x14
	.4byte	0xac
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x6
	.string	"src"
	.byte	0x1
	.byte	0xe
	.byte	0x26
	.4byte	0xae
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x5
	.4byte	.LASF1
	.byte	0x1
	.byte	0xe
	.byte	0x32
	.4byte	0x2d
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x7
	.string	"tmp"
	.byte	0x1
	.byte	0x10
	.byte	0x8
	.4byte	0xb5
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x7
	.string	"s"
	.byte	0x1
	.byte	0x11
	.byte	0xe
	.4byte	0xc7
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x8
	.byte	0x8
	.byte	0x9
	.byte	0x8
	.4byte	0xb4
	.byte	0xa
	.byte	0x9
	.byte	0x8
	.4byte	0xbb
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.byte	0xb
	.4byte	0xbb
	.byte	0x9
	.byte	0x8
	.4byte	0xc2
	.byte	0xc
	.4byte	.LASF9
	.byte	0x1
	.byte	0x4
	.byte	0x8
	.4byte	0x2d
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x6
	.string	"s"
	.byte	0x1
	.byte	0x4
	.byte	0x1b
	.4byte	0xc7
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x7
	.string	"sc"
	.byte	0x1
	.byte	0x6
	.byte	0xe
	.4byte	0xc7
	.byte	0x2
	.byte	0x91
	.byte	0x68
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
	.byte	0x3
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
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x8
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
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
.LASF5:
	.string	"src/string.c"
.LASF7:
	.string	"size_t"
.LASF6:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_8\\\\lab8-1\\\\benos"
.LASF4:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF0:
	.string	"dest"
.LASF2:
	.string	"long long unsigned int"
.LASF1:
	.string	"count"
.LASF8:
	.string	"memcpy"
.LASF3:
	.string	"char"
.LASF9:
	.string	"strlen"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
