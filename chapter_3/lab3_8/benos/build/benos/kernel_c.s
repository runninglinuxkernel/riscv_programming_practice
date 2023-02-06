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
	.string	"compare_and_return ok\r\n"
	.align	3
.LC1:
	.string	"compare_and_return fail\r\n"
	.align	3
.LC2:
	.string	"sel test ok\r\n"
	.align	3
.LC3:
	.string	"branch test done\r\n"
	.text
	.align	2
	.globl	asm_test
	.type	asm_test, @function
asm_test:
.LFB0:
	.file 1 "src/kernel.c"
	.loc 1 15 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 1 18 2
	call	load_store_test
	.loc 1 19 2
	call	pc_related_test
	.loc 1 20 2
	call	shift_test
	.loc 1 21 2
	call	add_sub_test
	.loc 1 22 9
	li	a1,9
	li	a0,10
	call	compare_and_return
	sd	a0,8(sp)
	.loc 1 23 11
	ld	a5,8(sp)
	bne	a5,zero,.L2
	.loc 1 24 16
	lla	a0,.LC0
	call	uart_send_string
	j	.L3
.L2:
	.loc 1 26 16
	lla	a0,.LC1
	call	uart_send_string
.L3:
	.loc 1 28 15
	li	a1,10
	li	a0,9
	call	compare_and_return
	sd	a0,0(sp)
	.loc 1 29 11
	ld	a4,0(sp)
	li	a5,-1
	bne	a4,a5,.L4
	.loc 1 30 16
	lla	a0,.LC0
	call	uart_send_string
	j	.L5
.L4:
	.loc 1 32 9
	lla	a0,.LC1
	call	uart_send_string
.L5:
	.loc 1 34 15
	li	a1,9
	li	a0,0
	call	sel_test
	sd	a0,8(sp)
	.loc 1 35 11
	ld	a4,8(sp)
	li	a5,11
	bne	a4,a5,.L6
	.loc 1 36 9
	lla	a0,.LC2
	call	uart_send_string
.L6:
	.loc 1 38 15
	li	a1,2
	li	a0,5
	call	sel_test
	sd	a0,0(sp)
	.loc 1 39 11
	ld	a4,0(sp)
	li	a5,1
	bne	a4,a5,.L7
	.loc 1 40 9
	lla	a0,.LC2
	call	uart_send_string
.L7:
	.loc 1 42 8
	call	my_memcpy_test
	.loc 1 43 8
	li	a2,40
	li	a1,85
	li	a0,131072
	call	memset
	.loc 1 45 8
	call	branch_test
	.loc 1 46 8
	lla	a0,.LC3
	call	uart_send_string
	.loc 1 47 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	asm_test, .-asm_test
	.section	.rodata
	.align	3
.LC4:
	.string	"Welcome RISC-V!\r\n"
	.text
	.align	2
	.globl	kernel_main
	.type	kernel_main, @function
kernel_main:
.LFB1:
	.loc 1 50 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	.cfi_offset 1, -8
	.loc 1 51 2
	call	sys_clock_init
	.loc 1 52 2
	call	uart_init
	.loc 1 53 2
	lla	a0,.LC4
	call	uart_send_string
	.loc 1 55 2
	call	asm_test
.L9:
	.loc 1 57 8 discriminator 1
	j	.L9
	.cfi_endproc
.LFE1:
	.size	kernel_main, .-kernel_main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xc3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF11
	.byte	0xc
	.4byte	.LASF12
	.4byte	.LASF13
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
	.4byte	.LASF14
	.byte	0x1
	.byte	0x31
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.byte	0x5
	.4byte	.LASF15
	.byte	0x1
	.byte	0xe
	.byte	0x6
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x6
	.4byte	.LASF9
	.byte	0x1
	.byte	0x10
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x6
	.4byte	.LASF10
	.byte	0x1
	.byte	0x10
	.byte	0x16
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
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
.LASF5:
	.string	"long long int"
.LASF4:
	.string	"unsigned int"
.LASF13:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_3\\\\lab3_8\\\\benos"
.LASF12:
	.string	"src/kernel.c"
.LASF8:
	.string	"long unsigned int"
.LASF9:
	.string	"val1"
.LASF6:
	.string	"long long unsigned int"
.LASF15:
	.string	"asm_test"
.LASF1:
	.string	"unsigned char"
.LASF7:
	.string	"long int"
.LASF14:
	.string	"kernel_main"
.LASF3:
	.string	"short unsigned int"
.LASF11:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fomit-frame-pointer"
.LASF10:
	.string	"val2"
.LASF2:
	.string	"short int"
.LASF0:
	.string	"signed char"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
