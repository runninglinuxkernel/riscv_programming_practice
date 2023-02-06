	.file	"kernel.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata
	.align	3
.LC0:
	.string	"\n"
	.text
	.align	2
	.type	print_func_name, @function
print_func_name:
.LFB0:
	.file 1 "src/kernel.c"
	.loc 1 22 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-56(s0)
	.loc 1 26 9
	sw	zero,-20(s0)
	.loc 1 26 2
	j	.L2
.L5:
	.loc 1 27 24
	lla	a4,func_addr
	lw	a5,-20(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 1 27 6
	ld	a4,-56(s0)
	beq	a4,a5,.L12
	.loc 1 26 34 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	.loc 1 26 16 discriminator 1
	lw	a4,-20(s0)
	lla	a5,func_num_syms
	ld	a5,0(a5)
	.loc 1 26 2 discriminator 1
	bltu	a4,a5,.L5
	.loc 1 31 9
	li	a5,0
	j	.L6
.L12:
	.loc 1 28 4
	nop
.L4:
	.loc 1 34 7
	lla	a5,func_string
	sd	a5,-32(s0)
	.loc 1 36 8
	lw	a5,-20(s0)
	sext.w	a5,a5
	bne	a5,zero,.L7
	.loc 1 37 13
	ld	a5,-32(s0)
	sd	a5,-40(s0)
	.loc 1 38 6
	j	.L8
.L7:
	.loc 1 42 7
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
	.loc 1 44 10
	ld	a5,-32(s0)
	lbu	a5,0(a5)
	.loc 1 44 9
	bne	a5,zero,.L9
	.loc 1 45 8
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sw	a5,-20(s0)
.L9:
	.loc 1 47 9
	lw	a5,-20(s0)
	sext.w	a5,a5
	bne	a5,zero,.L7
	.loc 1 48 8
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
	.loc 1 49 14
	ld	a5,-32(s0)
	sd	a5,-40(s0)
.L8:
	.loc 1 55 5
	ld	a0,-40(s0)
	call	uart_send_string
	.loc 1 56 5
	lla	a0,.LC0
	call	uart_send_string
	.loc 1 58 12
	li	a5,0
.L6:
	.loc 1 59 1
	mv	a0,a5
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	print_func_name, .-print_func_name
	.section	.rodata
	.align	3
.LC1:
	.string	"lab3-5: compare_and_return ok\n"
	.align	3
.LC2:
	.string	"lab3-7: branch test ok\n"
	.align	3
.LC3:
	.string	"lab5-5: macro_test_1 ok\n"
	.align	3
.LC4:
	.string	"lab5-5: macro_test_2 ok\n"
	.text
	.align	2
	.globl	asm_test
	.type	asm_test, @function
asm_test:
.LFB1:
	.loc 1 62 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 65 2
	call	load_store_test
	.loc 1 66 2
	call	shift_test
	.loc 1 67 2
	call	add_sub_test
	.loc 1 68 2
	call	branch_test
	.loc 1 70 2
	call	my_memcpy_test
	.loc 1 73 2
	li	a2,40
	li	a1,85
	li	a0,135168
	call	memset
	.loc 1 76 9
	li	a1,9
	li	a0,10
	call	compare_and_return
	sd	a0,-24(s0)
	.loc 1 77 5
	ld	a5,-24(s0)
	bne	a5,zero,.L14
	.loc 1 78 3
	lla	a0,.LC1
	call	uart_send_string
.L14:
	.loc 1 80 9
	li	a1,10
	li	a0,9
	call	compare_and_return
	sd	a0,-32(s0)
	.loc 1 81 5
	ld	a4,-32(s0)
	li	a5,-1
	bne	a4,a5,.L15
	.loc 1 82 3
	lla	a0,.LC1
	call	uart_send_string
.L15:
	.loc 1 84 9
	li	a1,9
	li	a0,0
	call	sel_test
	sd	a0,-24(s0)
	.loc 1 85 9
	li	a1,2
	li	a0,5
	call	sel_test
	sd	a0,-32(s0)
	.loc 1 87 2
	call	bl_test
	.loc 1 88 2
	lla	a0,.LC2
	call	uart_send_string
	.loc 1 90 9
	li	a1,5
	li	a0,5
	call	macro_test_1
	sd	a0,-24(s0)
	.loc 1 91 5
	ld	a4,-24(s0)
	li	a5,10
	bne	a4,a5,.L16
	.loc 1 92 3
	lla	a0,.LC3
	call	uart_send_string
.L16:
	.loc 1 94 9
	li	a1,5
	li	a0,5
	call	macro_test_2
	sd	a0,-32(s0)
	.loc 1 95 5
	ld	a5,-32(s0)
	bne	a5,zero,.L18
	.loc 1 96 3
	lla	a0,.LC4
	call	uart_send_string
.L18:
	.loc 1 97 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	asm_test, .-asm_test
	.section	.rodata
	.align	3
.LC5:
	.string	"Welcome RISC-V!\r\n"
	.text
	.align	2
	.globl	kernel_main
	.type	kernel_main, @function
kernel_main:
.LFB2:
	.loc 1 100 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 102 2
	call	uart_init
	.loc 1 103 2
	lla	a0,.LC5
	call	uart_send_string
	.loc 1 105 2
	call	asm_test
	.loc 1 108 2
	li	a5,8392704
	addi	a0,a5,-1920
	call	print_func_name
	.loc 1 109 2
	li	a5,8392704
	addi	a0,a5,-1952
	call	print_func_name
	.loc 1 110 2
	li	a5,8392704
	addi	a0,a5,-2048
	call	print_func_name
.L20:
	.loc 1 112 8 discriminator 1
	j	.L20
	.cfi_endproc
.LFE2:
	.size	kernel_main, .-kernel_main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x17e
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
	.4byte	0x7e
	.byte	0x5
	.byte	0
	.byte	0x6
	.4byte	.LASF9
	.byte	0x1
	.byte	0x11
	.byte	0x16
	.4byte	0x73
	.byte	0x6
	.4byte	.LASF10
	.byte	0x1
	.byte	0x12
	.byte	0x16
	.4byte	0x6c
	.byte	0x6
	.4byte	.LASF11
	.byte	0x1
	.byte	0x13
	.byte	0xd
	.4byte	0xa2
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x7
	.4byte	.LASF21
	.byte	0x1
	.byte	0x63
	.byte	0x6
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.byte	0x8
	.4byte	.LASF22
	.byte	0x1
	.byte	0x3d
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x100
	.byte	0x9
	.4byte	.LASF13
	.byte	0x1
	.byte	0x3f
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x9
	.4byte	.LASF14
	.byte	0x1
	.byte	0x3f
	.byte	0x16
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0x15
	.byte	0xc
	.4byte	0x49
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x17b
	.byte	0xb
	.4byte	.LASF24
	.byte	0x1
	.byte	0x15
	.byte	0x2a
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xc
	.string	"i"
	.byte	0x1
	.byte	0x17
	.byte	0x6
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xc
	.string	"p"
	.byte	0x1
	.byte	0x18
	.byte	0x8
	.4byte	0x17b
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x9
	.4byte	.LASF15
	.byte	0x1
	.byte	0x18
	.byte	0xc
	.4byte	0x17b
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xd
	.4byte	.LASF16
	.byte	0x1
	.byte	0x21
	.byte	0x1
	.8byte	.L4
	.byte	0xd
	.4byte	.LASF17
	.byte	0x1
	.byte	0x36
	.byte	0x1
	.8byte	.L8
	.byte	0
	.byte	0xe
	.byte	0x8
	.4byte	0xa2
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xa
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
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
.LASF16:
	.string	"found"
.LASF22:
	.string	"asm_test"
.LASF15:
	.string	"string"
.LASF24:
	.string	"addr"
.LASF9:
	.string	"func_addr"
.LASF1:
	.string	"unsigned char"
.LASF10:
	.string	"func_num_syms"
.LASF8:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF13:
	.string	"val1"
.LASF14:
	.string	"val2"
.LASF18:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF20:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_5\\\\lab5_5\\\\benos"
.LASF23:
	.string	"print_func_name"
.LASF4:
	.string	"unsigned int"
.LASF6:
	.string	"long long unsigned int"
.LASF5:
	.string	"long long int"
.LASF12:
	.string	"char"
.LASF2:
	.string	"short int"
.LASF7:
	.string	"long int"
.LASF11:
	.string	"func_string"
.LASF0:
	.string	"signed char"
.LASF21:
	.string	"kernel_main"
.LASF19:
	.string	"src/kernel.c"
.LASF17:
	.string	"done"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
