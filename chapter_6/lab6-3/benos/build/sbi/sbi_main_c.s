	.file	"sbi_main.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	sbi_set_pmp
	.type	sbi_set_pmp, @function
sbi_set_pmp:
.LFB0:
	.file 1 "sbi/sbi_main.c"
	.loc 1 11 1
	.cfi_startproc
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	ra,88(sp)
	sd	s0,80(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,96
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sd	a1,-80(s0)
	sd	a2,-88(s0)
	sd	a3,-96(s0)
	sw	a5,-68(s0)
	.loc 1 17 5
	lw	a5,-68(s0)
	sext.w	a4,a5
	li	a5,8
	ble	a4,a5,.L2
	.loc 1 18 10
	li	a5,-1
	j	.L3
.L2:
	.loc 1 20 10
	ld	a0,-88(s0)
	call	log2roundup
	mv	a5,a0
	.loc 1 20 8
	sw	a5,-28(s0)
	.loc 1 21 5
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,1
	bgt	a4,a5,.L4
	.loc 1 22 10
	li	a5,-1
	j	.L3
.L4:
	.loc 1 24 10
	ld	a5,-80(s0)
	srli	a5,a5,2
	sd	a5,-24(s0)
	.loc 1 27 33
	lw	a5,-68(s0)
	sraiw	a5,a5,2
	sext.w	a5,a5
	.loc 1 27 22
	addiw	a5,a5,928
	sext.w	a5,a5
	.loc 1 27 13
	andi	a5,a5,-2
	sw	a5,-32(s0)
	.loc 1 28 31
	lw	a5,-68(s0)
	slliw	a5,a5,3
	sext.w	a5,a5
	.loc 1 28 15
	andi	a5,a5,56
	sw	a5,-36(s0)
	.loc 1 30 14
	lw	a5,-68(s0)
	addiw	a5,a5,944
	sw	a5,-40(s0)
	.loc 1 33 7
	ld	a5,-96(s0)
	andi	a5,a5,-25
	sd	a5,-96(s0)
	.loc 1 34 32
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,2
	bne	a4,a5,.L5
	.loc 1 34 32 is_stmt 0 discriminator 1
	li	a5,16
	j	.L6
.L5:
	.loc 1 34 32 discriminator 2
	li	a5,24
.L6:
	.loc 1 34 7 is_stmt 1 discriminator 4
	ld	a4,-96(s0)
	or	a5,a4,a5
	sd	a5,-96(s0)
	.loc 1 37 21 discriminator 4
	lw	a5,-36(s0)
	li	a4,255
	sll	a5,a4,a5
	.loc 1 37 10 discriminator 4
	not	a5,a5
	sd	a5,-48(s0)
	.loc 1 38 12 discriminator 4
	lw	a5,-32(s0)
	mv	a0,a5
	call	read_csr_num
	mv	a4,a0
	.loc 1 38 9 discriminator 4
	ld	a5,-48(s0)
	and	a5,a5,a4
	sd	a5,-56(s0)
	.loc 1 39 19 discriminator 4
	lw	a5,-36(s0)
	ld	a4,-96(s0)
	sll	a4,a4,a5
	.loc 1 39 38 discriminator 4
	ld	a5,-48(s0)
	not	a5,a5
	.loc 1 39 36 discriminator 4
	and	a5,a4,a5
	.loc 1 39 9 discriminator 4
	ld	a4,-56(s0)
	or	a5,a4,a5
	sd	a5,-56(s0)
	.loc 1 46 5 discriminator 4
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,2
	ble	a4,a5,.L7
	.loc 1 48 6
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,64
	bne	a4,a5,.L8
	.loc 1 49 12
	li	a5,-1
	sd	a5,-24(s0)
	j	.L7
.L8:
	.loc 1 55 30
	lw	a5,-28(s0)
	addiw	a5,a5,-2
	sext.w	a5,a5
	.loc 1 55 20
	mv	a4,a5
	li	a5,1
	sll	a5,a5,a4
	.loc 1 55 13
	addi	a5,a5,-1
	sd	a5,-64(s0)
	.loc 1 56 15
	ld	a5,-64(s0)
	not	a5,a5
	.loc 1 56 12
	ld	a4,-24(s0)
	and	a5,a4,a5
	sd	a5,-24(s0)
	.loc 1 57 25
	ld	a5,-64(s0)
	srli	a5,a5,1
	.loc 1 57 12
	ld	a4,-24(s0)
	or	a5,a4,a5
	sd	a5,-24(s0)
.L7:
	.loc 1 63 2
	lw	a5,-40(s0)
	ld	a1,-24(s0)
	mv	a0,a5
	call	write_csr_num
	.loc 1 64 2
	lw	a5,-32(s0)
	ld	a1,-56(s0)
	mv	a0,a5
	call	write_csr_num
	.loc 1 66 9
	li	a5,0
.L3:
	.loc 1 67 1
	mv	a0,a5
	ld	ra,88(sp)
	.cfi_restore 1
	ld	s0,80(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 96
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	sbi_set_pmp, .-sbi_set_pmp
	.align	2
	.globl	sbi_main
	.type	sbi_main, @function
sbi_main:
.LFB1:
	.loc 1 74 1
	.cfi_startproc
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	ra,88(sp)
	sd	s0,80(sp)
	sd	s1,72(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	.cfi_offset 9, -24
	addi	s0,sp,96
	.cfi_def_cfa 8, 0
	.loc 1 80 2
	li	a3,7
	li	a2,-1
	li	a1,0
	li	a0,0
	call	sbi_set_pmp
.LBB2:
	.loc 1 84 39
 #APP
# 84 "sbi/sbi_main.c" 1
	csrr a5, mstatus
# 0 "" 2
 #NO_APP
	mv	s1,a5
	.loc 1 84 111
	mv	a5,s1
.LBE2:
	.loc 1 84 6
	sd	a5,-40(s0)
	.loc 1 85 16
	ld	a4,-40(s0)
	li	a5,-8192
	addi	a5,a5,2047
	and	a4,a4,a5
	.loc 1 85 6
	li	a5,4096
	addi	a5,a5,-2048
	or	a5,a4,a5
	sd	a5,-40(s0)
	.loc 1 86 6
	ld	a5,-40(s0)
	andi	a5,a5,-129
	sd	a5,-40(s0)
.LBB3:
	.loc 1 87 19
	ld	a5,-40(s0)
	sd	a5,-48(s0)
	.loc 1 87 47
	ld	a5,-48(s0)
 #APP
# 87 "sbi/sbi_main.c" 1
	csrw mstatus, a5
# 0 "" 2
 #NO_APP
.LBE3:
.LBB4:
	.loc 1 90 19
	li	a5,139264
	sd	a5,-56(s0)
	.loc 1 90 51
	ld	a5,-56(s0)
 #APP
# 90 "sbi/sbi_main.c" 1
	csrw mepc, a5
# 0 "" 2
 #NO_APP
.LBE4:
.LBB5:
	.loc 1 91 19
	li	a5,131072
	sd	a5,-64(s0)
	.loc 1 91 51
	ld	a5,-64(s0)
 #APP
# 91 "sbi/sbi_main.c" 1
	csrw mtvec, a5
# 0 "" 2
 #NO_APP
.LBE5:
.LBB6:
	.loc 1 94 19
	li	a5,139264
	sd	a5,-72(s0)
	.loc 1 94 51
	ld	a5,-72(s0)
 #APP
# 94 "sbi/sbi_main.c" 1
	csrw stvec, a5
# 0 "" 2
 #NO_APP
.LBE6:
.LBB7:
	.loc 1 97 19
	sd	zero,-80(s0)
	.loc 1 97 45
	ld	a5,-80(s0)
 #APP
# 97 "sbi/sbi_main.c" 1
	csrw sie, a5
# 0 "" 2
 #NO_APP
.LBE7:
.LBB8:
	.loc 1 99 19
	sd	zero,-88(s0)
	.loc 1 99 45
	ld	a5,-88(s0)
 #APP
# 99 "sbi/sbi_main.c" 1
	csrw satp, a5
# 0 "" 2
 #NO_APP
.LBE8:
	.loc 1 102 2
 #APP
# 102 "sbi/sbi_main.c" 1
	mret
# 0 "" 2
	.loc 1 103 1
 #NO_APP
	nop
	ld	ra,88(sp)
	.cfi_restore 1
	ld	s0,80(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 96
	ld	s1,72(sp)
	.cfi_restore 9
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	sbi_main, .-sbi_main
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x242
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF13
	.byte	0xc
	.4byte	.LASF14
	.4byte	.LASF15
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF16
	.byte	0x1
	.byte	0x49
	.byte	0x6
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x15c
	.byte	0x3
	.string	"val"
	.byte	0x1
	.byte	0x4b
	.byte	0x10
	.4byte	0x15c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x4
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.4byte	0x7e
	.byte	0x3
	.string	"__v"
	.byte	0x1
	.byte	0x54
	.byte	0x22
	.4byte	0x15c
	.byte	0x1
	.byte	0x59
	.byte	0
	.byte	0x4
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.4byte	0xa3
	.byte	0x3
	.string	"__v"
	.byte	0x1
	.byte	0x57
	.byte	0x13
	.4byte	0x15c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0
	.byte	0x4
	.8byte	.LBB4
	.8byte	.LBE4-.LBB4
	.4byte	0xc8
	.byte	0x3
	.string	"__v"
	.byte	0x1
	.byte	0x5a
	.byte	0x13
	.4byte	0x15c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0x4
	.8byte	.LBB5
	.8byte	.LBE5-.LBB5
	.4byte	0xed
	.byte	0x3
	.string	"__v"
	.byte	0x1
	.byte	0x5b
	.byte	0x13
	.4byte	0x15c
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0
	.byte	0x4
	.8byte	.LBB6
	.8byte	.LBE6-.LBB6
	.4byte	0x113
	.byte	0x3
	.string	"__v"
	.byte	0x1
	.byte	0x5e
	.byte	0x13
	.4byte	0x15c
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0
	.byte	0x4
	.8byte	.LBB7
	.8byte	.LBE7-.LBB7
	.4byte	0x139
	.byte	0x3
	.string	"__v"
	.byte	0x1
	.byte	0x61
	.byte	0x13
	.4byte	0x15c
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0
	.byte	0x5
	.8byte	.LBB8
	.8byte	.LBE8-.LBB8
	.byte	0x3
	.string	"__v"
	.byte	0x1
	.byte	0x63
	.byte	0x13
	.4byte	0x15c
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.byte	0x7
	.4byte	.LASF17
	.byte	0x1
	.byte	0xa
	.byte	0x5
	.4byte	0x23e
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x23e
	.byte	0x8
	.4byte	.LASF0
	.byte	0x1
	.byte	0xa
	.byte	0x15
	.4byte	0x23e
	.byte	0x3
	.byte	0x91
	.byte	0xbc,0x7f
	.byte	0x8
	.4byte	.LASF1
	.byte	0x1
	.byte	0xa
	.byte	0x2c
	.4byte	0x15c
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x8
	.4byte	.LASF2
	.byte	0x1
	.byte	0xa
	.byte	0x41
	.4byte	0x15c
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x8
	.4byte	.LASF3
	.byte	0x1
	.byte	0xa
	.byte	0x55
	.4byte	0x15c
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x9
	.4byte	.LASF4
	.byte	0x1
	.byte	0xc
	.byte	0x6
	.4byte	0x23e
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x9
	.4byte	.LASF5
	.byte	0x1
	.byte	0xd
	.byte	0x6
	.4byte	0x23e
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x9
	.4byte	.LASF6
	.byte	0x1
	.byte	0xd
	.byte	0x12
	.4byte	0x23e
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x9
	.4byte	.LASF7
	.byte	0x1
	.byte	0xd
	.byte	0x20
	.4byte	0x23e
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x9
	.4byte	.LASF8
	.byte	0x1
	.byte	0xe
	.byte	0x10
	.4byte	0x15c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x9
	.4byte	.LASF9
	.byte	0x1
	.byte	0xe
	.byte	0x19
	.4byte	0x15c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x9
	.4byte	.LASF10
	.byte	0x1
	.byte	0xf
	.byte	0x10
	.4byte	0x15c
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x9
	.4byte	.LASF11
	.byte	0x1
	.byte	0xf
	.byte	0x1a
	.4byte	0x15c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
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
	.byte	0x3
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
	.byte	0x4
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
	.byte	0x5
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
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
	.byte	0x8
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
.LASF8:
	.string	"cfgmask"
.LASF3:
	.string	"prot"
.LASF6:
	.string	"pmpcfg_shift"
.LASF16:
	.string	"sbi_main"
.LASF7:
	.string	"pmpaddr_csr"
.LASF13:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF14:
	.string	"sbi/sbi_main.c"
.LASF11:
	.string	"pmpaddr"
.LASF9:
	.string	"pmpcfg"
.LASF0:
	.string	"reg_idx"
.LASF2:
	.string	"size"
.LASF12:
	.string	"long unsigned int"
.LASF1:
	.string	"start"
.LASF17:
	.string	"sbi_set_pmp"
.LASF15:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_6\\\\lab6-3\\\\benos"
.LASF4:
	.string	"order"
.LASF10:
	.string	"addrmask"
.LASF5:
	.string	"pmpcfg_csr"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
