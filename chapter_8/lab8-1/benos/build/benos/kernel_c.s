	.file	"kernel.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	sbi_putchar, @function
sbi_putchar:
.LFB10:
	.file 1 "include/asm/sbi.h"
	.loc 1 37 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-17(s0)
.LBB2:
	.loc 1 38 44
	lbu	a5,-17(s0)
	.loc 1 38 28
	mv	a0,a5
	.loc 1 38 87
	li	a1,0
	.loc 1 38 146
	li	a2,0
	.loc 1 38 205
	li	a7,1
	.loc 1 38 243
 #APP
# 38 "include/asm/sbi.h" 1
	ecall
# 0 "" 2
 #NO_APP
.LBE2:
	.loc 1 39 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	sbi_putchar, .-sbi_putchar
	.align	2
	.type	sbi_put_string, @function
sbi_put_string:
.LFB11:
	.loc 1 42 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	.loc 1 45 9
	sw	zero,-20(s0)
	.loc 1 45 2
	j	.L3
.L4:
	.loc 1 46 25 discriminator 3
	lw	a5,-20(s0)
	ld	a4,-40(s0)
	add	a5,a4,a5
	.loc 1 46 3 discriminator 3
	lbu	a5,0(a5)
	mv	a0,a5
	call	sbi_putchar
	.loc 1 45 31 discriminator 3
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L3:
	.loc 1 45 17 discriminator 1
	lw	a5,-20(s0)
	ld	a4,-40(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 1 45 2 discriminator 1
	bne	a5,zero,.L4
	.loc 1 47 1
	nop
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
.LFE11:
	.size	sbi_put_string, .-sbi_put_string
	.section	.rodata
	.align	3
.LC0:
	.string	"<0x%lx> %s\n"
	.text
	.align	2
	.type	print_func_name, @function
print_func_name:
.LFB12:
	.file 2 "src/kernel.c"
	.loc 2 24 1
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
	.loc 2 28 9
	sw	zero,-20(s0)
	.loc 2 28 2
	j	.L6
.L9:
	.loc 2 29 24
	lla	a4,func_addr
	lw	a5,-20(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 2 29 6
	ld	a4,-56(s0)
	beq	a4,a5,.L16
	.loc 2 28 34 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L6:
	.loc 2 28 16 discriminator 1
	lw	a4,-20(s0)
	lla	a5,func_num_syms
	ld	a5,0(a5)
	.loc 2 28 2 discriminator 1
	bltu	a4,a5,.L9
	.loc 2 33 9
	li	a5,0
	j	.L10
.L16:
	.loc 2 30 4
	nop
.L8:
	.loc 2 36 7
	lla	a5,func_string
	sd	a5,-32(s0)
	.loc 2 38 8
	lw	a5,-20(s0)
	sext.w	a5,a5
	bne	a5,zero,.L11
	.loc 2 39 13
	ld	a5,-32(s0)
	sd	a5,-40(s0)
	.loc 2 40 6
	j	.L12
.L11:
	.loc 2 44 7
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
	.loc 2 46 10
	ld	a5,-32(s0)
	lbu	a5,0(a5)
	.loc 2 46 9
	bne	a5,zero,.L13
	.loc 2 47 8
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sw	a5,-20(s0)
.L13:
	.loc 2 49 9
	lw	a5,-20(s0)
	sext.w	a5,a5
	bne	a5,zero,.L11
	.loc 2 50 8
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
	.loc 2 51 14
	ld	a5,-32(s0)
	sd	a5,-40(s0)
.L12:
	.loc 2 57 5
	ld	a2,-40(s0)
	ld	a1,-56(s0)
	lla	a0,.LC0
	call	printk
	.loc 2 59 12
	li	a5,0
.L10:
	.loc 2 60 1
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
.LFE12:
	.size	print_func_name, .-print_func_name
	.align	2
	.type	my_memcpy_asm_test1, @function
my_memcpy_asm_test1:
.LFB13:
	.loc 2 70 1
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
	.loc 2 71 16
	sd	zero,-24(s0)
	.loc 2 72 16
	ld	a4,-40(s0)
	ld	a5,-56(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 2 74 2
	ld	a2,-32(s0)
	ld	a3,-48(s0)
	ld	a4,-24(s0)
	ld	a5,-40(s0)
 #APP
# 74 "src/kernel.c" 1
	1: ld a4, (a5)
sd a4, (a3)
addi a3, a3, 8
addi a5, a5, 8
blt a5, a2, 1b
# 0 "" 2
 #NO_APP
	sd	a3,-48(s0)
	sd	a4,-24(s0)
	sd	a5,-40(s0)
	.loc 2 83 1
	nop
	ld	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	my_memcpy_asm_test1, .-my_memcpy_asm_test1
	.align	2
	.type	my_memcpy_asm_test2, @function
my_memcpy_asm_test2:
.LFB14:
	.loc 2 93 1
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
	.loc 2 94 16
	sd	zero,-24(s0)
	.loc 2 95 16
	ld	a4,-40(s0)
	ld	a5,-56(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 2 97 2
	ld	a2,-32(s0)
	ld	a3,-48(s0)
	ld	a4,-24(s0)
	ld	a5,-40(s0)
 #APP
# 97 "src/kernel.c" 1
	1: ld a4, (a5)
sd a4, (a3)
addi a3, a3, 8
addi a5, a5, 8
blt a5, a2, 1b
# 0 "" 2
 #NO_APP
	sd	a3,-48(s0)
	sd	a4,-24(s0)
	sd	a5,-40(s0)
	.loc 2 106 1
	nop
	ld	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	my_memcpy_asm_test2, .-my_memcpy_asm_test2
	.align	2
	.type	my_asm_orr, @function
my_asm_orr:
.LFB15:
	.loc 2 122 60
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	.loc 2 122 76
	sd	zero,-24(s0)
	.loc 2 122 85
	ld	a3,-40(s0)
	ld	a4,-48(s0)
	ld	a5,-24(s0)
 #APP
# 122 "src/kernel.c" 1
	ld a5, (a4)
 or a5, a5, a3
sd a5, (a4)

# 0 "" 2
 #NO_APP
	sd	a4,-48(s0)
	sd	a5,-24(s0)
	.loc 2 122 244
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	my_asm_orr, .-my_asm_orr
	.align	2
	.type	my_asm_and, @function
my_asm_and:
.LFB16:
	.loc 2 123 60
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	.loc 2 123 76
	sd	zero,-24(s0)
	.loc 2 123 85
	ld	a3,-40(s0)
	ld	a4,-48(s0)
	ld	a5,-24(s0)
 #APP
# 123 "src/kernel.c" 1
	ld a5, (a4)
 and a5, a5, a3
sd a5, (a4)

# 0 "" 2
 #NO_APP
	sd	a4,-48(s0)
	sd	a5,-24(s0)
	.loc 2 123 245
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
	.size	my_asm_and, .-my_asm_and
	.align	2
	.type	my_asm_add, @function
my_asm_add:
.LFB17:
	.loc 2 124 60
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	.loc 2 124 76
	sd	zero,-24(s0)
	.loc 2 124 85
	ld	a3,-40(s0)
	ld	a4,-48(s0)
	ld	a5,-24(s0)
 #APP
# 124 "src/kernel.c" 1
	ld a5, (a4)
 add a5, a5, a3
sd a5, (a4)

# 0 "" 2
 #NO_APP
	sd	a4,-48(s0)
	sd	a5,-24(s0)
	.loc 2 124 245
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE17:
	.size	my_asm_add, .-my_asm_add
	.section	.rodata
	.align	3
.LC1:
	.string	"test and: p=0x%x\n"
	.align	3
.LC2:
	.string	"test orr: p=0x%x\n"
	.align	3
.LC3:
	.string	"test add: p=0x%x\n"
	.text
	.align	2
	.type	my_ops_test, @function
my_ops_test:
.LFB18:
	.loc 2 127 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 130 4
	li	a5,15
	sd	a5,-24(s0)
	.loc 2 131 2
	addi	a5,s0,-24
	mv	a1,a5
	li	a0,2
	call	my_asm_and
	.loc 2 132 2
	ld	a5,-24(s0)
	mv	a1,a5
	lla	a0,.LC1
	call	printk
	.loc 2 134 4
	li	a5,128
	sd	a5,-24(s0)
	.loc 2 135 2
	addi	a5,s0,-24
	mv	a1,a5
	li	a0,3
	call	my_asm_orr
	.loc 2 136 2
	ld	a5,-24(s0)
	mv	a1,a5
	lla	a0,.LC2
	call	printk
	.loc 2 138 4
	li	a5,3
	sd	a5,-24(s0)
	.loc 2 139 2
	addi	a5,s0,-24
	mv	a1,a5
	li	a0,2
	call	my_asm_add
	.loc 2 140 2
	ld	a5,-24(s0)
	mv	a1,a5
	lla	a0,.LC3
	call	printk
	.loc 2 141 1
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
.LFE18:
	.size	my_ops_test, .-my_ops_test
	.section	.rodata
	.align	3
.LC4:
	.string	"sstatus =0x%x\n"
	.text
	.align	2
	.type	test_sysregs, @function
test_sysregs:
.LFB19:
	.loc 2 144 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB3:
	.loc 2 147 39
 #APP
# 147 "src/kernel.c" 1
	csrr a5, sstatus
# 0 "" 2
 #NO_APP
	mv	ra,a5
	.loc 2 147 111
	mv	a5,ra
.LBE3:
	.loc 2 147 6
	sd	a5,-24(s0)
	.loc 2 149 2
	ld	a1,-24(s0)
	lla	a0,.LC4
	call	printk
	.loc 2 150 1
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
.LFE19:
	.size	test_sysregs, .-test_sysregs
	.section	.rodata
	.align	3
.LC5:
	.string	"%s: a = %d\n"
	.text
	.align	2
	.type	test_asm_goto, @function
test_asm_goto:
.LFB20:
	.loc 2 153 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 154 2
	lw	a5,-20(s0)
 #APP
# 154 "src/kernel.c" 1
	addi a5, a5, -1
beqz a5, .L25

# 0 "" 2
	.loc 2 162 9
 #NO_APP
	li	a5,0
	j	.L26
.L25:
	.loc 2 165 2
	lw	a5,-20(s0)
	mv	a2,a5
	lla	a1,__func__.0
	lla	a0,.LC5
	call	printk
	.loc 2 166 9
	li	a5,1
.L26:
	.loc 2 167 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE20:
	.size	test_asm_goto, .-test_asm_goto
	.section	.rodata
	.align	3
.LC6:
	.string	"asm_goto: return 1\n"
	.align	3
.LC7:
	.string	"asm_goto: b is not 1\n"
	.text
	.align	2
	.globl	inline_asm_test
	.type	inline_asm_test, @function
inline_asm_test:
.LFB21:
	.loc 2 170 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 171 2
	li	a2,32
	li	a1,172032
	li	a0,131072
	call	my_memcpy_asm_test1
	.loc 2 172 5
	li	a2,32
	li	a1,172032
	li	a0,131072
	call	my_memcpy_asm_test2
	.loc 2 174 2
	li	a2,48
	li	a1,85
	li	a5,172032
	addi	a0,a5,2
	call	memset
	.loc 2 176 2
	call	my_ops_test
	.loc 2 178 2
	call	test_sysregs
	.loc 2 180 6
	li	a5,1
	sw	a5,-20(s0)
	.loc 2 181 6
	lw	a5,-20(s0)
	mv	a0,a5
	call	test_asm_goto
	mv	a5,a0
	.loc 2 181 5
	mv	a4,a5
	li	a5,1
	bne	a4,a5,.L28
	.loc 2 182 3
	lla	a0,.LC6
	call	printk
.L28:
	.loc 2 184 6
	sw	zero,-24(s0)
	.loc 2 185 6
	lw	a5,-24(s0)
	mv	a0,a5
	call	test_asm_goto
	mv	a5,a0
	.loc 2 185 5
	bne	a5,zero,.L30
	.loc 2 186 3
	lla	a0,.LC7
	call	printk
.L30:
	.loc 2 187 1
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
.LFE21:
	.size	inline_asm_test, .-inline_asm_test
	.section	.rodata
	.align	3
.LC8:
	.string	"lab3-5: compare_and_return ok\n"
	.align	3
.LC9:
	.string	"lab3-7: branch test ok\n"
	.align	3
.LC10:
	.string	"lab5-5: macro_test_1 ok\n"
	.align	3
.LC11:
	.string	"lab5-5: macro_test_2 ok\n"
	.text
	.align	2
	.globl	asm_test
	.type	asm_test, @function
asm_test:
.LFB22:
	.loc 2 190 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 193 2
	call	load_store_test
	.loc 2 194 2
	call	shift_test
	.loc 2 195 2
	call	add_sub_test
	.loc 2 196 2
	call	branch_test
	.loc 2 198 2
	call	my_memcpy_test
	.loc 2 201 2
	li	a2,40
	li	a1,85
	li	a0,172032
	call	memset
	.loc 2 204 9
	li	a1,9
	li	a0,10
	call	compare_and_return
	sd	a0,-24(s0)
	.loc 2 205 5
	ld	a5,-24(s0)
	bne	a5,zero,.L32
	.loc 2 206 3
	lla	a0,.LC8
	call	printk
.L32:
	.loc 2 208 9
	li	a1,10
	li	a0,9
	call	compare_and_return
	sd	a0,-32(s0)
	.loc 2 209 5
	ld	a4,-32(s0)
	li	a5,-1
	bne	a4,a5,.L33
	.loc 2 210 3
	lla	a0,.LC8
	call	printk
.L33:
	.loc 2 212 9
	li	a1,9
	li	a0,0
	call	sel_test
	sd	a0,-24(s0)
	.loc 2 213 9
	li	a1,2
	li	a0,5
	call	sel_test
	sd	a0,-32(s0)
	.loc 2 215 2
	call	bl_test
	.loc 2 216 2
	lla	a0,.LC9
	call	printk
	.loc 2 218 9
	li	a1,5
	li	a0,5
	call	macro_test_1
	sd	a0,-24(s0)
	.loc 2 219 5
	ld	a4,-24(s0)
	li	a5,10
	bne	a4,a5,.L34
	.loc 2 220 3
	lla	a0,.LC10
	call	printk
.L34:
	.loc 2 222 9
	li	a1,5
	li	a0,5
	call	macro_test_2
	sd	a0,-32(s0)
	.loc 2 223 5
	ld	a5,-32(s0)
	bne	a5,zero,.L36
	.loc 2 224 3
	lla	a0,.LC11
	call	printk
.L36:
	.loc 2 225 1
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
.LFE22:
	.size	asm_test, .-asm_test
	.section	.rodata
	.align	3
.LC12:
	.string	"BenOS image layout:\n"
	.align	3
.LC13:
	.string	"  .text.boot: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC14:
	.string	"       .text: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC15:
	.string	"     .rodata: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC16:
	.string	"       .data: 0x%08lx - 0x%08lx (%6ld B)\n"
	.align	3
.LC17:
	.string	"        .bss: 0x%08lx - 0x%08lx (%6ld B)\n"
	.text
	.align	2
	.type	print_mem, @function
print_mem:
.LFB23:
	.loc 2 234 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 235 2
	lla	a0,.LC12
	call	printk
	.loc 2 236 2
	lla	a1,_text_boot
	lla	a2,_etext_boot
	.loc 2 238 32
	lla	a4,_etext_boot
	lla	a5,_text_boot
	sub	a5,a4,a5
	.loc 2 236 2
	mv	a3,a5
	lla	a0,.LC13
	call	printk
	.loc 2 239 2
	lla	a1,_text
	lla	a2,_etext
	.loc 2 241 27
	lla	a4,_etext
	lla	a5,_text
	sub	a5,a4,a5
	.loc 2 239 2
	mv	a3,a5
	lla	a0,.LC14
	call	printk
	.loc 2 242 2
	lla	a1,_rodata
	lla	a2,_erodata
	.loc 2 244 29
	lla	a4,_erodata
	lla	a5,_rodata
	sub	a5,a4,a5
	.loc 2 242 2
	mv	a3,a5
	lla	a0,.LC15
	call	printk
	.loc 2 245 2
	lla	a1,_data
	lla	a2,_edata
	.loc 2 247 27
	lla	a4,_edata
	lla	a5,_data
	sub	a5,a4,a5
	.loc 2 245 2
	mv	a3,a5
	lla	a0,.LC16
	call	printk
	.loc 2 248 2
	lla	a1,_bss
	lla	a2,_ebss
	.loc 2 250 26
	lla	a4,_ebss
	lla	a5,_bss
	sub	a5,a4,a5
	.loc 2 248 2
	mv	a3,a5
	lla	a0,.LC17
	call	printk
	.loc 2 251 1
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
.LFE23:
	.size	print_mem, .-print_mem
	.align	2
	.type	clean_bss, @function
clean_bss:
.LFB24:
	.loc 2 254 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 2 255 16
	lla	a5,_bss
	sd	a5,-24(s0)
	.loc 2 256 16
	lla	a5,_ebss
	sd	a5,-32(s0)
	.loc 2 257 22
	ld	a5,-32(s0)
	sext.w	a4,a5
	ld	a5,-24(s0)
	sext.w	a5,a5
	.loc 2 257 11
	subw	a5,a4,a5
	sw	a5,-36(s0)
	.loc 2 259 2
	ld	a5,-24(s0)
	lwu	a4,-36(s0)
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 2 260 1
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
.LFE24:
	.size	clean_bss, .-clean_bss
	.section	.rodata
	.align	3
.LC18:
	.string	"Welcome RISC-V!\r\n"
	.align	3
.LC19:
	.string	"printk init done\n"
	.text
	.align	2
	.globl	kernel_main
	.type	kernel_main, @function
kernel_main:
.LFB25:
	.loc 2 263 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 264 2
	call	clean_bss
	.loc 2 265 2
	lla	a0,.LC18
	call	sbi_put_string
	.loc 2 266 2
	call	init_printk_done
	.loc 2 267 2
	lla	a0,.LC19
	call	printk
	.loc 2 269 2
	call	asm_test
	.loc 2 270 2
	call	inline_asm_test
	.loc 2 273 2
	li	a5,8392704
	addi	a0,a5,-1920
	call	print_func_name
	.loc 2 274 2
	li	a5,8392704
	addi	a0,a5,-1952
	call	print_func_name
	.loc 2 275 2
	li	a5,8392704
	addi	a0,a5,-2048
	call	print_func_name
	.loc 2 277 2
	call	print_mem
.L40:
	.loc 2 279 8 discriminator 1
	j	.L40
	.cfi_endproc
.LFE25:
	.size	kernel_main, .-kernel_main
	.section	.rodata
	.align	3
	.type	__func__.0, @object
	.size	__func__.0, 14
__func__.0:
	.string	"test_asm_goto"
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x5e7
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF46
	.byte	0xc
	.4byte	.LASF47
	.4byte	.LASF48
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
	.byte	0x2
	.byte	0x13
	.byte	0x16
	.4byte	0x73
	.byte	0x6
	.4byte	.LASF10
	.byte	0x2
	.byte	0x14
	.byte	0x16
	.4byte	0x6c
	.byte	0x6
	.4byte	.LASF11
	.byte	0x2
	.byte	0x15
	.byte	0xd
	.4byte	0xa2
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x7
	.4byte	0xa2
	.byte	0x4
	.4byte	0xa2
	.4byte	0xb9
	.byte	0x5
	.byte	0
	.byte	0x6
	.4byte	.LASF13
	.byte	0x2
	.byte	0xe3
	.byte	0xd
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF14
	.byte	0x2
	.byte	0xe3
	.byte	0x1b
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF15
	.byte	0x2
	.byte	0xe4
	.byte	0xd
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF16
	.byte	0x2
	.byte	0xe4
	.byte	0x16
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF17
	.byte	0x2
	.byte	0xe5
	.byte	0xd
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF18
	.byte	0x2
	.byte	0xe5
	.byte	0x18
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF19
	.byte	0x2
	.byte	0xe6
	.byte	0xd
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF20
	.byte	0x2
	.byte	0xe6
	.byte	0x16
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF21
	.byte	0x2
	.byte	0xe7
	.byte	0xd
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF22
	.byte	0x2
	.byte	0xe7
	.byte	0x15
	.4byte	0xae
	.byte	0x8
	.4byte	.LASF49
	.byte	0x2
	.2byte	0x106
	.byte	0x6
	.8byte	.LFB25
	.8byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF29
	.byte	0x2
	.byte	0xfd
	.byte	0xd
	.8byte	.LFB24
	.8byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x19a
	.byte	0xa
	.4byte	.LASF23
	.byte	0x2
	.byte	0xff
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xb
	.string	"end"
	.byte	0x2
	.2byte	0x100
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xc
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x101
	.byte	0xb
	.4byte	0x50
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0xd
	.4byte	.LASF50
	.byte	0x2
	.byte	0xe9
	.byte	0xd
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.byte	0xe
	.4byte	.LASF27
	.byte	0x2
	.byte	0xbd
	.byte	0x6
	.8byte	.LFB22
	.8byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x1f1
	.byte	0xa
	.4byte	.LASF25
	.byte	0x2
	.byte	0xbf
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xa
	.4byte	.LASF26
	.byte	0x2
	.byte	0xbf
	.byte	0x16
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xe
	.4byte	.LASF28
	.byte	0x2
	.byte	0xa9
	.byte	0x6
	.8byte	.LFB21
	.8byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x22a
	.byte	0xf
	.string	"a"
	.byte	0x2
	.byte	0xb4
	.byte	0x6
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xf
	.string	"b"
	.byte	0x2
	.byte	0xb8
	.byte	0x6
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x10
	.4byte	.LASF38
	.byte	0x2
	.byte	0x98
	.byte	0xc
	.4byte	0x49
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x27d
	.byte	0x11
	.string	"a"
	.byte	0x2
	.byte	0x98
	.byte	0x1e
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x12
	.4byte	.LASF42
	.byte	0x2
	.byte	0xa4
	.byte	0x1
	.8byte	.L25
	.byte	0x13
	.4byte	.LASF51
	.4byte	0x28d
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0
	.byte	0x4
	.4byte	0xa9
	.4byte	0x28d
	.byte	0x14
	.4byte	0x6c
	.byte	0xd
	.byte	0
	.byte	0x7
	.4byte	0x27d
	.byte	0x9
	.4byte	.LASF30
	.byte	0x2
	.byte	0x8f
	.byte	0xd
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x2e0
	.byte	0xf
	.string	"val"
	.byte	0x2
	.byte	0x91
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x15
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0xf
	.string	"__v"
	.byte	0x2
	.byte	0x93
	.byte	0x22
	.4byte	0x6c
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	.LASF31
	.byte	0x2
	.byte	0x7e
	.byte	0xd
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x30c
	.byte	0xf
	.string	"p"
	.byte	0x2
	.byte	0x80
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x16
	.4byte	.LASF32
	.byte	0x2
	.byte	0x7c
	.byte	0x14
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x356
	.byte	0x17
	.4byte	.LASF33
	.byte	0x2
	.byte	0x7c
	.byte	0x2d
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x11
	.string	"p"
	.byte	0x2
	.byte	0x7c
	.byte	0x39
	.4byte	0x356
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xf
	.string	"tmp"
	.byte	0x2
	.byte	0x7c
	.byte	0x4c
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x18
	.byte	0x8
	.byte	0x16
	.4byte	.LASF34
	.byte	0x2
	.byte	0x7b
	.byte	0x14
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x3a2
	.byte	0x17
	.4byte	.LASF33
	.byte	0x2
	.byte	0x7b
	.byte	0x2d
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x11
	.string	"p"
	.byte	0x2
	.byte	0x7b
	.byte	0x39
	.4byte	0x356
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xf
	.string	"tmp"
	.byte	0x2
	.byte	0x7b
	.byte	0x4c
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x16
	.4byte	.LASF35
	.byte	0x2
	.byte	0x7a
	.byte	0x14
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x3ec
	.byte	0x17
	.4byte	.LASF33
	.byte	0x2
	.byte	0x7a
	.byte	0x2d
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x11
	.string	"p"
	.byte	0x2
	.byte	0x7a
	.byte	0x39
	.4byte	0x356
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xf
	.string	"tmp"
	.byte	0x2
	.byte	0x7a
	.byte	0x4c
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x16
	.4byte	.LASF36
	.byte	0x2
	.byte	0x5b
	.byte	0xd
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x456
	.byte	0x11
	.string	"src"
	.byte	0x2
	.byte	0x5b
	.byte	0x2f
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x11
	.string	"dst"
	.byte	0x2
	.byte	0x5b
	.byte	0x42
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x17
	.4byte	.LASF24
	.byte	0x2
	.byte	0x5c
	.byte	0x11
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xf
	.string	"tmp"
	.byte	0x2
	.byte	0x5e
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xf
	.string	"end"
	.byte	0x2
	.byte	0x5f
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x16
	.4byte	.LASF37
	.byte	0x2
	.byte	0x44
	.byte	0xd
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x4c0
	.byte	0x11
	.string	"src"
	.byte	0x2
	.byte	0x44
	.byte	0x2f
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x11
	.string	"dst"
	.byte	0x2
	.byte	0x44
	.byte	0x42
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x17
	.4byte	.LASF24
	.byte	0x2
	.byte	0x45
	.byte	0x11
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xf
	.string	"tmp"
	.byte	0x2
	.byte	0x47
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xf
	.string	"end"
	.byte	0x2
	.byte	0x48
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x10
	.4byte	.LASF39
	.byte	0x2
	.byte	0x17
	.byte	0xc
	.4byte	0x49
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x53b
	.byte	0x17
	.4byte	.LASF40
	.byte	0x2
	.byte	0x17
	.byte	0x2a
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xf
	.string	"i"
	.byte	0x2
	.byte	0x19
	.byte	0x6
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xf
	.string	"p"
	.byte	0x2
	.byte	0x1a
	.byte	0x8
	.4byte	0x53b
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xa
	.4byte	.LASF41
	.byte	0x2
	.byte	0x1a
	.byte	0xc
	.4byte	0x53b
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x12
	.4byte	.LASF43
	.byte	0x2
	.byte	0x23
	.byte	0x1
	.8byte	.L8
	.byte	0x12
	.4byte	.LASF44
	.byte	0x2
	.byte	0x38
	.byte	0x1
	.8byte	.L12
	.byte	0
	.byte	0x19
	.byte	0x8
	.4byte	0xa2
	.byte	0x9
	.4byte	.LASF45
	.byte	0x1
	.byte	0x29
	.byte	0x14
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x57c
	.byte	0x11
	.string	"str"
	.byte	0x1
	.byte	0x29
	.byte	0x29
	.4byte	0x53b
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0xf
	.string	"i"
	.byte	0x1
	.byte	0x2b
	.byte	0x6
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x1a
	.4byte	.LASF52
	.byte	0x1
	.byte	0x24
	.byte	0x14
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.byte	0x11
	.string	"c"
	.byte	0x1
	.byte	0x24
	.byte	0x2e
	.4byte	0x34
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0x15
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0xf
	.string	"a0"
	.byte	0x1
	.byte	0x26
	.byte	0x1c
	.4byte	0x6c
	.byte	0x1
	.byte	0x5a
	.byte	0xf
	.string	"a1"
	.byte	0x1
	.byte	0x26
	.byte	0x57
	.4byte	0x6c
	.byte	0x1
	.byte	0x5b
	.byte	0xf
	.string	"a2"
	.byte	0x1
	.byte	0x26
	.byte	0x92
	.4byte	0x6c
	.byte	0x1
	.byte	0x5c
	.byte	0xf
	.string	"a7"
	.byte	0x1
	.byte	0x26
	.byte	0xcd
	.4byte	0x6c
	.byte	0x1
	.byte	0x61
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
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
	.byte	0xb
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
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
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x49
	.byte	0x13
	.byte	0x34
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x18
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
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
.LASF27:
	.string	"asm_test"
.LASF40:
	.string	"addr"
.LASF13:
	.string	"_text_boot"
.LASF37:
	.string	"my_memcpy_asm_test1"
.LASF36:
	.string	"my_memcpy_asm_test2"
.LASF2:
	.string	"short int"
.LASF21:
	.string	"_bss"
.LASF50:
	.string	"print_mem"
.LASF20:
	.string	"_edata"
.LASF49:
	.string	"kernel_main"
.LASF14:
	.string	"_etext_boot"
.LASF15:
	.string	"_text"
.LASF9:
	.string	"func_addr"
.LASF48:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_8\\\\lab8-1\\\\benos"
.LASF5:
	.string	"long long int"
.LASF22:
	.string	"_ebss"
.LASF11:
	.string	"func_string"
.LASF7:
	.string	"long int"
.LASF41:
	.string	"string"
.LASF47:
	.string	"src/kernel.c"
.LASF19:
	.string	"_data"
.LASF30:
	.string	"test_sysregs"
.LASF29:
	.string	"clean_bss"
.LASF39:
	.string	"print_func_name"
.LASF38:
	.string	"test_asm_goto"
.LASF1:
	.string	"unsigned char"
.LASF44:
	.string	"done"
.LASF0:
	.string	"signed char"
.LASF6:
	.string	"long long unsigned int"
.LASF4:
	.string	"unsigned int"
.LASF25:
	.string	"val1"
.LASF26:
	.string	"val2"
.LASF32:
	.string	"my_asm_add"
.LASF45:
	.string	"sbi_put_string"
.LASF51:
	.string	"__func__"
.LASF23:
	.string	"start"
.LASF3:
	.string	"short unsigned int"
.LASF10:
	.string	"func_num_syms"
.LASF12:
	.string	"char"
.LASF35:
	.string	"my_asm_orr"
.LASF17:
	.string	"_rodata"
.LASF8:
	.string	"long unsigned int"
.LASF43:
	.string	"found"
.LASF24:
	.string	"size"
.LASF42:
	.string	"label"
.LASF18:
	.string	"_erodata"
.LASF33:
	.string	"mask"
.LASF31:
	.string	"my_ops_test"
.LASF34:
	.string	"my_asm_and"
.LASF52:
	.string	"sbi_putchar"
.LASF46:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF16:
	.string	"_etext"
.LASF28:
	.string	"inline_asm_test"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
