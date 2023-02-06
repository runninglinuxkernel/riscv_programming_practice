	.file	"sbi_trap.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	sbi_ecall_handle, @function
sbi_ecall_handle:
.LFB3:
	.file 1 "sbi/sbi_trap.c"
	.loc 1 8 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sd	a1,-48(s0)
	sw	a5,-36(s0)
	.loc 1 9 6
	sw	zero,-20(s0)
	.loc 1 11 2
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,1
	bne	a4,a5,.L2
	.loc 1 13 15
	ld	a5,-48(s0)
	ld	a5,80(a5)
	.loc 1 13 3
	sext.w	a5,a5
	mv	a0,a5
	call	putchar
	.loc 1 14 7
	sw	zero,-20(s0)
	.loc 1 15 3
	nop
.L2:
	.loc 1 19 5
	lw	a5,-20(s0)
	sext.w	a5,a5
	bne	a5,zero,.L3
	.loc 1 20 14
	ld	a5,-48(s0)
	ld	a5,0(a5)
	addi	a4,a5,4
	ld	a5,-48(s0)
	sd	a4,0(a5)
.L3:
	.loc 1 22 9
	lw	a5,-20(s0)
	.loc 1 23 1
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
	.size	sbi_ecall_handle, .-sbi_ecall_handle
	.align	2
	.globl	sbi_trap_handler
	.type	sbi_trap_handler, @function
sbi_trap_handler:
.LFB4:
	.loc 1 26 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-56(s0)
.LBB2:
	.loc 1 27 56
 #APP
# 27 "sbi/sbi_trap.c" 1
	csrr a5, mcause
# 0 "" 2
 #NO_APP
	mv	s1,a5
	.loc 1 27 127
	mv	a5,s1
.LBE2:
	.loc 1 27 16
	sd	a5,-40(s0)
	.loc 1 28 16
	ld	a5,-56(s0)
	ld	a5,136(a5)
	sd	a5,-48(s0)
	.loc 1 30 2
	ld	a4,-40(s0)
	li	a5,9
	bne	a4,a5,.L8
	.loc 1 32 3
	ld	a5,-48(s0)
	sext.w	a5,a5
	ld	a1,-56(s0)
	mv	a0,a5
	call	sbi_ecall_handle
	.loc 1 33 3
	j	.L7
.L8:
	.loc 1 35 3
	nop
.L7:
	.loc 1 37 1
	nop
	ld	ra,56(sp)
	.cfi_restore 1
	ld	s0,48(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	ld	s1,40(sp)
	.cfi_restore 9
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	sbi_trap_handler, .-sbi_trap_handler
	.align	2
	.globl	sbi_trap_init
	.type	sbi_trap_init, @function
sbi_trap_init:
.LFB5:
	.loc 1 42 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB3:
	.loc 1 44 19
	lla	a5,sbi_exception_vector
	sd	a5,-24(s0)
	.loc 1 44 64
	ld	a5,-24(s0)
 #APP
# 44 "sbi/sbi_trap.c" 1
	csrw mtvec, a5
# 0 "" 2
 #NO_APP
.LBE3:
.LBB4:
	.loc 1 46 19
	sd	zero,-32(s0)
	.loc 1 46 45
	ld	a5,-32(s0)
 #APP
# 46 "sbi/sbi_trap.c" 1
	csrw mie, a5
# 0 "" 2
 #NO_APP
.LBE4:
	.loc 1 47 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE5:
	.size	sbi_trap_init, .-sbi_trap_init
.Letext0:
	.file 2 "sbi/sbi_trap_regs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x305
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF9
	.byte	0xc
	.4byte	.LASF10
	.4byte	.LASF11
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF12
	.2byte	0x108
	.byte	0x2
	.byte	0xd
	.byte	0x8
	.4byte	0x1cd
	.byte	0x3
	.4byte	.LASF0
	.byte	0x2
	.byte	0xf
	.byte	0x10
	.4byte	0x1cd
	.byte	0
	.byte	0x4
	.string	"ra"
	.byte	0x2
	.byte	0x10
	.byte	0x10
	.4byte	0x1cd
	.byte	0x8
	.byte	0x4
	.string	"sp"
	.byte	0x2
	.byte	0x11
	.byte	0x10
	.4byte	0x1cd
	.byte	0x10
	.byte	0x4
	.string	"gp"
	.byte	0x2
	.byte	0x12
	.byte	0x10
	.4byte	0x1cd
	.byte	0x18
	.byte	0x4
	.string	"tp"
	.byte	0x2
	.byte	0x13
	.byte	0x10
	.4byte	0x1cd
	.byte	0x20
	.byte	0x4
	.string	"t0"
	.byte	0x2
	.byte	0x14
	.byte	0x10
	.4byte	0x1cd
	.byte	0x28
	.byte	0x4
	.string	"t1"
	.byte	0x2
	.byte	0x15
	.byte	0x10
	.4byte	0x1cd
	.byte	0x30
	.byte	0x4
	.string	"t2"
	.byte	0x2
	.byte	0x16
	.byte	0x10
	.4byte	0x1cd
	.byte	0x38
	.byte	0x4
	.string	"s0"
	.byte	0x2
	.byte	0x17
	.byte	0x10
	.4byte	0x1cd
	.byte	0x40
	.byte	0x4
	.string	"s1"
	.byte	0x2
	.byte	0x18
	.byte	0x10
	.4byte	0x1cd
	.byte	0x48
	.byte	0x4
	.string	"a0"
	.byte	0x2
	.byte	0x19
	.byte	0x10
	.4byte	0x1cd
	.byte	0x50
	.byte	0x4
	.string	"a1"
	.byte	0x2
	.byte	0x1a
	.byte	0x10
	.4byte	0x1cd
	.byte	0x58
	.byte	0x4
	.string	"a2"
	.byte	0x2
	.byte	0x1b
	.byte	0x10
	.4byte	0x1cd
	.byte	0x60
	.byte	0x4
	.string	"a3"
	.byte	0x2
	.byte	0x1c
	.byte	0x10
	.4byte	0x1cd
	.byte	0x68
	.byte	0x4
	.string	"a4"
	.byte	0x2
	.byte	0x1d
	.byte	0x10
	.4byte	0x1cd
	.byte	0x70
	.byte	0x4
	.string	"a5"
	.byte	0x2
	.byte	0x1e
	.byte	0x10
	.4byte	0x1cd
	.byte	0x78
	.byte	0x4
	.string	"a6"
	.byte	0x2
	.byte	0x1f
	.byte	0x10
	.4byte	0x1cd
	.byte	0x80
	.byte	0x4
	.string	"a7"
	.byte	0x2
	.byte	0x20
	.byte	0x10
	.4byte	0x1cd
	.byte	0x88
	.byte	0x4
	.string	"s2"
	.byte	0x2
	.byte	0x21
	.byte	0x10
	.4byte	0x1cd
	.byte	0x90
	.byte	0x4
	.string	"s3"
	.byte	0x2
	.byte	0x22
	.byte	0x10
	.4byte	0x1cd
	.byte	0x98
	.byte	0x4
	.string	"s4"
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.4byte	0x1cd
	.byte	0xa0
	.byte	0x4
	.string	"s5"
	.byte	0x2
	.byte	0x24
	.byte	0x10
	.4byte	0x1cd
	.byte	0xa8
	.byte	0x4
	.string	"s6"
	.byte	0x2
	.byte	0x25
	.byte	0x10
	.4byte	0x1cd
	.byte	0xb0
	.byte	0x4
	.string	"s7"
	.byte	0x2
	.byte	0x26
	.byte	0x10
	.4byte	0x1cd
	.byte	0xb8
	.byte	0x4
	.string	"s8"
	.byte	0x2
	.byte	0x27
	.byte	0x10
	.4byte	0x1cd
	.byte	0xc0
	.byte	0x4
	.string	"s9"
	.byte	0x2
	.byte	0x28
	.byte	0x10
	.4byte	0x1cd
	.byte	0xc8
	.byte	0x4
	.string	"s10"
	.byte	0x2
	.byte	0x29
	.byte	0x10
	.4byte	0x1cd
	.byte	0xd0
	.byte	0x4
	.string	"s11"
	.byte	0x2
	.byte	0x2a
	.byte	0x10
	.4byte	0x1cd
	.byte	0xd8
	.byte	0x4
	.string	"t3"
	.byte	0x2
	.byte	0x2b
	.byte	0x10
	.4byte	0x1cd
	.byte	0xe0
	.byte	0x4
	.string	"t4"
	.byte	0x2
	.byte	0x2c
	.byte	0x10
	.4byte	0x1cd
	.byte	0xe8
	.byte	0x4
	.string	"t5"
	.byte	0x2
	.byte	0x2d
	.byte	0x10
	.4byte	0x1cd
	.byte	0xf0
	.byte	0x4
	.string	"t6"
	.byte	0x2
	.byte	0x2e
	.byte	0x10
	.4byte	0x1cd
	.byte	0xf8
	.byte	0x5
	.4byte	.LASF1
	.byte	0x2
	.byte	0x30
	.byte	0x10
	.4byte	0x1cd
	.2byte	0x100
	.byte	0
	.byte	0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x7
	.4byte	.LASF2
	.byte	0x1
	.byte	0x29
	.byte	0x6
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x239
	.byte	0x8
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0x217
	.byte	0x9
	.string	"__v"
	.byte	0x1
	.byte	0x2c
	.byte	0x13
	.4byte	0x1cd
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xa
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.byte	0x9
	.string	"__v"
	.byte	0x1
	.byte	0x2e
	.byte	0x13
	.4byte	0x1cd
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	.LASF3
	.byte	0x1
	.byte	0x19
	.byte	0x6
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x2a5
	.byte	0xc
	.4byte	.LASF6
	.byte	0x1
	.byte	0x19
	.byte	0x2d
	.4byte	0x2a5
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xd
	.4byte	.LASF4
	.byte	0x1
	.byte	0x1b
	.byte	0x10
	.4byte	0x1cd
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xd
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1c
	.byte	0x10
	.4byte	0x1cd
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xa
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x9
	.string	"__v"
	.byte	0x1
	.byte	0x1b
	.byte	0x33
	.4byte	0x1cd
	.byte	0x1
	.byte	0x59
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x8
	.4byte	0x2d
	.byte	0xf
	.4byte	.LASF13
	.byte	0x1
	.byte	0x7
	.byte	0xc
	.4byte	0x2fa
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x2fa
	.byte	0x10
	.string	"id"
	.byte	0x1
	.byte	0x7
	.byte	0x2a
	.4byte	0x301
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0xc
	.4byte	.LASF6
	.byte	0x1
	.byte	0x7
	.byte	0x44
	.4byte	0x2a5
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x9
	.string	"ret"
	.byte	0x1
	.byte	0x9
	.byte	0x6
	.4byte	0x2fa
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x11
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x6
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
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
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
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
	.byte	0x3
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
	.byte	0x4
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
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
	.byte	0xa
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
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
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
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
.LASF13:
	.string	"sbi_ecall_handle"
.LASF11:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_8\\\\lab8-1\\\\benos"
.LASF5:
	.string	"ecall_id"
.LASF7:
	.string	"long unsigned int"
.LASF4:
	.string	"mcause"
.LASF9:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF12:
	.string	"sbi_trap_regs"
.LASF10:
	.string	"sbi/sbi_trap.c"
.LASF0:
	.string	"mepc"
.LASF2:
	.string	"sbi_trap_init"
.LASF8:
	.string	"unsigned int"
.LASF6:
	.string	"regs"
.LASF3:
	.string	"sbi_trap_handler"
.LASF1:
	.string	"mstatus"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
