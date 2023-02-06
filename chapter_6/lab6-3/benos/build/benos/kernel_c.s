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
	.string	"<0x%lx> %s\n"
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
	ld	a2,-40(s0)
	ld	a1,-56(s0)
	lla	a0,.LC0
	call	printk
	.loc 1 57 12
	li	a5,0
.L6:
	.loc 1 58 1
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
	.loc 1 61 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 64 2
	call	load_store_test
	.loc 1 65 2
	call	shift_test
	.loc 1 66 2
	call	add_sub_test
	.loc 1 67 2
	call	branch_test
	.loc 1 69 2
	call	my_memcpy_test
	.loc 1 72 2
	li	a2,40
	li	a1,85
	li	a0,135168
	call	memset
	.loc 1 75 9
	li	a1,9
	li	a0,10
	call	compare_and_return
	sd	a0,-24(s0)
	.loc 1 76 5
	ld	a5,-24(s0)
	bne	a5,zero,.L14
	.loc 1 77 3
	lla	a0,.LC1
	call	uart_send_string
.L14:
	.loc 1 79 9
	li	a1,10
	li	a0,9
	call	compare_and_return
	sd	a0,-32(s0)
	.loc 1 80 5
	ld	a4,-32(s0)
	li	a5,-1
	bne	a4,a5,.L15
	.loc 1 81 3
	lla	a0,.LC1
	call	uart_send_string
.L15:
	.loc 1 83 9
	li	a1,9
	li	a0,0
	call	sel_test
	sd	a0,-24(s0)
	.loc 1 84 9
	li	a1,2
	li	a0,5
	call	sel_test
	sd	a0,-32(s0)
	.loc 1 86 2
	call	bl_test
	.loc 1 87 2
	lla	a0,.LC2
	call	uart_send_string
	.loc 1 89 9
	li	a1,5
	li	a0,5
	call	macro_test_1
	sd	a0,-24(s0)
	.loc 1 90 5
	ld	a4,-24(s0)
	li	a5,10
	bne	a4,a5,.L16
	.loc 1 91 3
	lla	a0,.LC3
	call	uart_send_string
.L16:
	.loc 1 93 9
	li	a1,5
	li	a0,5
	call	macro_test_2
	sd	a0,-32(s0)
	.loc 1 94 5
	ld	a5,-32(s0)
	bne	a5,zero,.L18
	.loc 1 95 3
	lla	a0,.LC4
	call	uart_send_string
.L18:
	.loc 1 96 1
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
	.string	"BenOS image layout:\n"
	.align	3
.LC6:
	.string	"  .text.boot: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC7:
	.string	"       .text: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC8:
	.string	"     .rodata: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC9:
	.string	"       .data: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC10:
	.string	"        .bss: 0x%08lx - 0x%08lx (%6ld B)\n"
	.text
	.align	2
	.type	print_mem, @function
print_mem:
.LFB2:
	.loc 1 105 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 106 2
	lla	a0,.LC5
	call	printk
	.loc 1 107 2
	lla	a1,_text_boot
	lla	a2,_etext_boot
	.loc 1 109 32
	lla	a4,_etext_boot
	lla	a5,_text_boot
	sub	a5,a4,a5
	.loc 1 107 2
	mv	a3,a5
	lla	a0,.LC6
	call	printk
	.loc 1 110 2
	lla	a1,_text
	lla	a2,_etext
	.loc 1 112 27
	lla	a4,_etext
	lla	a5,_text
	sub	a5,a4,a5
	.loc 1 110 2
	mv	a3,a5
	lla	a0,.LC7
	call	printk
	.loc 1 113 2
	lla	a1,_rodata
	lla	a2,_erodata
	.loc 1 115 29
	lla	a4,_erodata
	lla	a5,_rodata
	sub	a5,a4,a5
	.loc 1 113 2
	mv	a3,a5
	lla	a0,.LC8
	call	printk
	.loc 1 116 2
	lla	a1,_data
	lla	a2,_edata
	.loc 1 118 27
	lla	a4,_edata
	lla	a5,_data
	sub	a5,a4,a5
	.loc 1 116 2
	mv	a3,a5
	lla	a0,.LC9
	call	printk
	.loc 1 119 2
	lla	a1,_bss
	lla	a2,_ebss
	.loc 1 121 26
	lla	a4,_ebss
	lla	a5,_bss
	sub	a5,a4,a5
	.loc 1 119 2
	mv	a3,a5
	lla	a0,.LC10
	call	printk
	.loc 1 122 1
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
	.size	print_mem, .-print_mem
	.align	2
	.type	clean_bss, @function
clean_bss:
.LFB3:
	.loc 1 125 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 1 126 16
	lla	a5,_bss
	sd	a5,-24(s0)
	.loc 1 127 16
	lla	a5,_ebss
	sd	a5,-32(s0)
	.loc 1 128 22
	ld	a5,-32(s0)
	sext.w	a4,a5
	ld	a5,-24(s0)
	sext.w	a5,a5
	.loc 1 128 11
	subw	a5,a4,a5
	sw	a5,-36(s0)
	.loc 1 130 2
	ld	a5,-24(s0)
	lwu	a4,-36(s0)
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 1 131 1
	nop
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
	.size	clean_bss, .-clean_bss
	.section	.rodata
	.align	3
.LC11:
	.string	"Welcome RISC-V!\r\n"
	.align	3
.LC12:
	.string	"printk init done\n"
	.text
	.align	2
	.globl	kernel_main
	.type	kernel_main, @function
kernel_main:
.LFB4:
	.loc 1 134 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 135 2
	call	clean_bss
	.loc 1 136 2
	call	uart_init
	.loc 1 137 2
	lla	a0,.LC11
	call	uart_send_string
	.loc 1 138 2
	call	init_printk_done
	.loc 1 139 2
	lla	a0,.LC12
	call	printk
	.loc 1 141 2
	call	asm_test
	.loc 1 144 2
	li	a5,8392704
	addi	a0,a5,-1920
	call	print_func_name
	.loc 1 145 2
	li	a5,8392704
	addi	a0,a5,-1952
	call	print_func_name
	.loc 1 146 2
	li	a5,8392704
	addi	a0,a5,-2048
	call	print_func_name
	.loc 1 148 2
	call	print_mem
.L22:
	.loc 1 150 8 discriminator 1
	j	.L22
	.cfi_endproc
.LFE4:
	.size	kernel_main, .-kernel_main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x267
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF30
	.byte	0xc
	.4byte	.LASF31
	.4byte	.LASF32
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
	.byte	0x4
	.4byte	0xa2
	.4byte	0xb4
	.byte	0x5
	.byte	0
	.byte	0x6
	.4byte	.LASF13
	.byte	0x1
	.byte	0x62
	.byte	0xd
	.4byte	0xa9
	.byte	0x6
	.4byte	.LASF14
	.byte	0x1
	.byte	0x62
	.byte	0x1b
	.4byte	0xa9
	.byte	0x6
	.4byte	.LASF15
	.byte	0x1
	.byte	0x63
	.byte	0xd
	.4byte	0xa9
	.byte	0x6
	.4byte	.LASF16
	.byte	0x1
	.byte	0x63
	.byte	0x16
	.4byte	0xa9
	.byte	0x6
	.4byte	.LASF17
	.byte	0x1
	.byte	0x64
	.byte	0xd
	.4byte	0xa9
	.byte	0x6
	.4byte	.LASF18
	.byte	0x1
	.byte	0x64
	.byte	0x18
	.4byte	0xa9
	.byte	0x6
	.4byte	.LASF19
	.byte	0x1
	.byte	0x65
	.byte	0xd
	.4byte	0xa9
	.byte	0x6
	.4byte	.LASF20
	.byte	0x1
	.byte	0x65
	.byte	0x16
	.4byte	0xa9
	.byte	0x6
	.4byte	.LASF21
	.byte	0x1
	.byte	0x66
	.byte	0xd
	.4byte	0xa9
	.byte	0x6
	.4byte	.LASF22
	.byte	0x1
	.byte	0x66
	.byte	0x15
	.4byte	0xa9
	.byte	0x7
	.4byte	.LASF33
	.byte	0x1
	.byte	0x85
	.byte	0x6
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.byte	0x8
	.4byte	.LASF34
	.byte	0x1
	.byte	0x7c
	.byte	0xd
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x192
	.byte	0x9
	.4byte	.LASF23
	.byte	0x1
	.byte	0x7e
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xa
	.string	"end"
	.byte	0x1
	.byte	0x7f
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x9
	.4byte	.LASF24
	.byte	0x1
	.byte	0x80
	.byte	0xb
	.4byte	0x50
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0xb
	.4byte	.LASF35
	.byte	0x1
	.byte	0x68
	.byte	0xd
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	.LASF36
	.byte	0x1
	.byte	0x3c
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x1e9
	.byte	0x9
	.4byte	.LASF25
	.byte	0x1
	.byte	0x3e
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x9
	.4byte	.LASF26
	.byte	0x1
	.byte	0x3e
	.byte	0x16
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xd
	.4byte	.LASF37
	.byte	0x1
	.byte	0x15
	.byte	0xc
	.4byte	0x49
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x264
	.byte	0xe
	.4byte	.LASF38
	.byte	0x1
	.byte	0x15
	.byte	0x2a
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xa
	.string	"i"
	.byte	0x1
	.byte	0x17
	.byte	0x6
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xa
	.string	"p"
	.byte	0x1
	.byte	0x18
	.byte	0x8
	.4byte	0x264
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x9
	.4byte	.LASF27
	.byte	0x1
	.byte	0x18
	.byte	0xc
	.4byte	0x264
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xf
	.4byte	.LASF28
	.byte	0x1
	.byte	0x21
	.byte	0x1
	.8byte	.L4
	.byte	0xf
	.4byte	.LASF29
	.byte	0x1
	.byte	0x36
	.byte	0x1
	.8byte	.L8
	.byte	0
	.byte	0x10
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
	.byte	0x2e
	.byte	0
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
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
.LASF35:
	.string	"print_mem"
.LASF22:
	.string	"_ebss"
.LASF25:
	.string	"val1"
.LASF23:
	.string	"start"
.LASF28:
	.string	"found"
.LASF21:
	.string	"_bss"
.LASF36:
	.string	"asm_test"
.LASF13:
	.string	"_text_boot"
.LASF38:
	.string	"addr"
.LASF9:
	.string	"func_addr"
.LASF1:
	.string	"unsigned char"
.LASF20:
	.string	"_edata"
.LASF10:
	.string	"func_num_syms"
.LASF8:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF18:
	.string	"_erodata"
.LASF26:
	.string	"val2"
.LASF30:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF17:
	.string	"_rodata"
.LASF37:
	.string	"print_func_name"
.LASF32:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_6\\\\lab6-3\\\\benos"
.LASF4:
	.string	"unsigned int"
.LASF6:
	.string	"long long unsigned int"
.LASF16:
	.string	"_etext"
.LASF5:
	.string	"long long int"
.LASF12:
	.string	"char"
.LASF2:
	.string	"short int"
.LASF34:
	.string	"clean_bss"
.LASF7:
	.string	"long int"
.LASF19:
	.string	"_data"
.LASF11:
	.string	"func_string"
.LASF14:
	.string	"_etext_boot"
.LASF0:
	.string	"signed char"
.LASF15:
	.string	"_text"
.LASF24:
	.string	"size"
.LASF27:
	.string	"string"
.LASF33:
	.string	"kernel_main"
.LASF31:
	.string	"src/kernel.c"
.LASF29:
	.string	"done"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
