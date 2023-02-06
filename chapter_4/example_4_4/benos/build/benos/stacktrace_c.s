	.file	"stacktrace.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	kernel_text, @function
kernel_text:
.LFB0:
	.file 1 "src/stacktrace.c"
	.loc 1 11 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 12 14
	lla	a5,_text
	.loc 1 12 5
	ld	a4,-24(s0)
	bltu	a4,a5,.L2
	.loc 1 13 13 discriminator 1
	lla	a5,_etext
	.loc 1 12 35 discriminator 1
	ld	a4,-24(s0)
	bgeu	a4,a5,.L2
	.loc 1 14 10
	li	a5,1
	j	.L3
.L2:
	.loc 1 16 9
	li	a5,0
.L3:
	.loc 1 17 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	kernel_text, .-kernel_text
	.section	.rodata
	.align	3
.LC0:
	.string	"[0x%016lx - 0x%016lx]  pc 0x%016lx\r\n"
	.text
	.align	2
	.type	walk_stackframe, @function
walk_stackframe:
.LFB1:
	.loc 1 20 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	.loc 1 26 5
	sd	sp,-24(s0)
	.loc 1 27 5
	lla	a5,walk_stackframe
	sd	a5,-40(s0)
	.loc 1 28 22
	mv	a5,s0
	.loc 1 28 5
	sd	a5,-32(s0)
.L8:
	.loc 1 31 8
	ld	a0,-40(s0)
	call	kernel_text
	mv	a5,a0
	.loc 1 31 6
	beq	a5,zero,.L10
	.loc 1 35 7
	ld	a5,-24(s0)
	addi	a5,a5,16
	sd	a5,-48(s0)
	.loc 1 36 6
	ld	a4,-32(s0)
	ld	a5,-48(s0)
	bltu	a4,a5,.L11
	.loc 1 36 23 discriminator 1
	ld	a5,-32(s0)
	andi	a5,a5,15
	.loc 1 36 17 discriminator 1
	bne	a5,zero,.L11
	.loc 1 43 36
	ld	a5,-32(s0)
	addi	a5,a5,-16
	.loc 1 43 9
	sd	a5,-56(s0)
	.loc 1 44 6
	ld	a5,-32(s0)
	sd	a5,-24(s0)
	.loc 1 45 6
	ld	a5,-56(s0)
	ld	a5,0(a5)
	sd	a5,-32(s0)
	.loc 1 47 13
	ld	a5,-56(s0)
	ld	a5,8(a5)
	.loc 1 47 6
	addi	a5,a5,-4
	sd	a5,-40(s0)
	.loc 1 49 7
	ld	a0,-40(s0)
	call	kernel_text
	mv	a5,a0
	.loc 1 49 6
	beq	a5,zero,.L8
	.loc 1 50 4
	ld	a3,-40(s0)
	ld	a2,-32(s0)
	ld	a1,-24(s0)
	lla	a0,.LC0
	call	printk
	.loc 1 31 6
	j	.L8
.L10:
	.loc 1 32 4
	nop
.L11:
	.loc 1 52 1
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	walk_stackframe, .-walk_stackframe
	.section	.rodata
	.align	3
.LC1:
	.string	"Call Frame:\r\n"
	.text
	.align	2
	.globl	dump_stack
	.type	dump_stack, @function
dump_stack:
.LFB2:
	.loc 1 55 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 56 2
	lla	a0,.LC1
	call	printk
	.loc 1 57 2
	call	walk_stackframe
	.loc 1 58 1
	nop
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	dump_stack, .-dump_stack
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x18a
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
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.byte	0x4
	.4byte	0x6c
	.byte	0x5
	.4byte	.LASF21
	.byte	0x10
	.byte	0x1
	.byte	0x4
	.byte	0x8
	.4byte	0xa0
	.byte	0x6
	.4byte	.LASF9
	.byte	0x1
	.byte	0x5
	.byte	0x10
	.4byte	0x6c
	.byte	0
	.byte	0x6
	.4byte	.LASF10
	.byte	0x1
	.byte	0x6
	.byte	0x10
	.4byte	0x6c
	.byte	0x8
	.byte	0
	.byte	0x7
	.4byte	0xab
	.4byte	0xab
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0x9
	.4byte	.LASF12
	.byte	0x1
	.byte	0x9
	.byte	0xd
	.4byte	0xa0
	.byte	0x9
	.4byte	.LASF13
	.byte	0x1
	.byte	0x9
	.byte	0x16
	.4byte	0xa0
	.byte	0xa
	.4byte	.LASF22
	.byte	0x1
	.byte	0x36
	.byte	0x6
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.byte	0xb
	.4byte	.LASF16
	.byte	0x1
	.byte	0x13
	.byte	0xd
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x159
	.byte	0xc
	.string	"sp"
	.byte	0x1
	.byte	0x15
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xc
	.string	"fp"
	.byte	0x1
	.byte	0x15
	.byte	0x14
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xc
	.string	"pc"
	.byte	0x1
	.byte	0x15
	.byte	0x18
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xd
	.4byte	.LASF14
	.byte	0x1
	.byte	0x16
	.byte	0x15
	.4byte	0x159
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xc
	.string	"low"
	.byte	0x1
	.byte	0x17
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xd
	.4byte	.LASF15
	.byte	0x1
	.byte	0x19
	.byte	0x1f
	.4byte	0x73
	.byte	0x1
	.byte	0x52
	.byte	0
	.byte	0xe
	.byte	0x8
	.4byte	0x78
	.byte	0xf
	.4byte	.LASF17
	.byte	0x1
	.byte	0xa
	.byte	0xc
	.4byte	0x49
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x10
	.4byte	.LASF23
	.byte	0x1
	.byte	0xa
	.byte	0x26
	.4byte	0x6c
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x2e
	.byte	0
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0xd
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
	.byte	0xe
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0
	.byte	0
	.byte	0x10
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
.LASF10:
	.string	"s_ra"
.LASF19:
	.string	"src/stacktrace.c"
.LASF20:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_4\\\\example_4_4\\\\benos"
.LASF23:
	.string	"addr"
.LASF1:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF9:
	.string	"s_fp"
.LASF18:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF15:
	.string	"current_sp"
.LASF16:
	.string	"walk_stackframe"
.LASF4:
	.string	"unsigned int"
.LASF21:
	.string	"stackframe"
.LASF6:
	.string	"long long unsigned int"
.LASF22:
	.string	"dump_stack"
.LASF13:
	.string	"_etext"
.LASF17:
	.string	"kernel_text"
.LASF5:
	.string	"long long int"
.LASF11:
	.string	"char"
.LASF2:
	.string	"short int"
.LASF7:
	.string	"long int"
.LASF14:
	.string	"frame"
.LASF0:
	.string	"signed char"
.LASF12:
	.string	"_text"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
