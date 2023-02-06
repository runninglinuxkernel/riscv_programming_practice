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
.LFB9:
	.file 1 "src/kernel.c"
	.loc 1 23 1
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
	.loc 1 27 9
	sw	zero,-20(s0)
	.loc 1 27 2
	j	.L2
.L5:
	.loc 1 28 24
	lla	a4,func_addr
	lw	a5,-20(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	ld	a5,0(a5)
	.loc 1 28 6
	ld	a4,-56(s0)
	beq	a4,a5,.L12
	.loc 1 27 34 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	.loc 1 27 16 discriminator 1
	lw	a4,-20(s0)
	lla	a5,func_num_syms
	ld	a5,0(a5)
	.loc 1 27 2 discriminator 1
	bltu	a4,a5,.L5
	.loc 1 32 9
	li	a5,0
	j	.L6
.L12:
	.loc 1 29 4
	nop
.L4:
	.loc 1 35 7
	lla	a5,func_string
	sd	a5,-32(s0)
	.loc 1 37 8
	lw	a5,-20(s0)
	sext.w	a5,a5
	bne	a5,zero,.L7
	.loc 1 38 13
	ld	a5,-32(s0)
	sd	a5,-40(s0)
	.loc 1 39 6
	j	.L8
.L7:
	.loc 1 43 7
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
	.loc 1 45 10
	ld	a5,-32(s0)
	lbu	a5,0(a5)
	.loc 1 45 9
	bne	a5,zero,.L9
	.loc 1 46 8
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sw	a5,-20(s0)
.L9:
	.loc 1 48 9
	lw	a5,-20(s0)
	sext.w	a5,a5
	bne	a5,zero,.L7
	.loc 1 49 8
	ld	a5,-32(s0)
	addi	a5,a5,1
	sd	a5,-32(s0)
	.loc 1 50 14
	ld	a5,-32(s0)
	sd	a5,-40(s0)
.L8:
	.loc 1 56 5
	ld	a2,-40(s0)
	ld	a1,-56(s0)
	lla	a0,.LC0
	call	printk
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
.LFE9:
	.size	print_func_name, .-print_func_name
	.align	2
	.type	my_memcpy_asm_test1, @function
my_memcpy_asm_test1:
.LFB10:
	.loc 1 69 1
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
	.loc 1 70 16
	sd	zero,-24(s0)
	.loc 1 71 16
	ld	a4,-40(s0)
	ld	a5,-56(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 73 2
	ld	a2,-32(s0)
	ld	a3,-48(s0)
	ld	a4,-24(s0)
	ld	a5,-40(s0)
 #APP
# 73 "src/kernel.c" 1
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
	.loc 1 82 1
	nop
	ld	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE10:
	.size	my_memcpy_asm_test1, .-my_memcpy_asm_test1
	.align	2
	.type	my_memcpy_asm_test2, @function
my_memcpy_asm_test2:
.LFB11:
	.loc 1 92 1
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
	.loc 1 93 16
	sd	zero,-24(s0)
	.loc 1 94 16
	ld	a4,-40(s0)
	ld	a5,-56(s0)
	add	a5,a4,a5
	sd	a5,-32(s0)
	.loc 1 96 2
	ld	a2,-32(s0)
	ld	a3,-48(s0)
	ld	a4,-24(s0)
	ld	a5,-40(s0)
 #APP
# 96 "src/kernel.c" 1
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
	.loc 1 105 1
	nop
	ld	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE11:
	.size	my_memcpy_asm_test2, .-my_memcpy_asm_test2
	.align	2
	.type	my_asm_orr, @function
my_asm_orr:
.LFB12:
	.loc 1 121 60
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	.loc 1 121 76
	sd	zero,-24(s0)
	.loc 1 121 85
	ld	a3,-40(s0)
	ld	a4,-48(s0)
	ld	a5,-24(s0)
 #APP
# 121 "src/kernel.c" 1
	ld a5, (a4)
 or a5, a5, a3
sd a5, (a4)

# 0 "" 2
 #NO_APP
	sd	a4,-48(s0)
	sd	a5,-24(s0)
	.loc 1 121 244
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE12:
	.size	my_asm_orr, .-my_asm_orr
	.align	2
	.type	my_asm_and, @function
my_asm_and:
.LFB13:
	.loc 1 122 60
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	.loc 1 122 76
	sd	zero,-24(s0)
	.loc 1 122 85
	ld	a3,-40(s0)
	ld	a4,-48(s0)
	ld	a5,-24(s0)
 #APP
# 122 "src/kernel.c" 1
	ld a5, (a4)
 and a5, a5, a3
sd a5, (a4)

# 0 "" 2
 #NO_APP
	sd	a4,-48(s0)
	sd	a5,-24(s0)
	.loc 1 122 245
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE13:
	.size	my_asm_and, .-my_asm_and
	.align	2
	.type	my_asm_add, @function
my_asm_add:
.LFB14:
	.loc 1 123 60
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	.loc 1 123 76
	sd	zero,-24(s0)
	.loc 1 123 85
	ld	a3,-40(s0)
	ld	a4,-48(s0)
	ld	a5,-24(s0)
 #APP
# 123 "src/kernel.c" 1
	ld a5, (a4)
 add a5, a5, a3
sd a5, (a4)

# 0 "" 2
 #NO_APP
	sd	a4,-48(s0)
	sd	a5,-24(s0)
	.loc 1 123 245
	nop
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
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
.LFB15:
	.loc 1 126 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 129 4
	li	a5,15
	sd	a5,-24(s0)
	.loc 1 130 2
	addi	a5,s0,-24
	mv	a1,a5
	li	a0,2
	call	my_asm_and
	.loc 1 131 2
	ld	a5,-24(s0)
	mv	a1,a5
	lla	a0,.LC1
	call	printk
	.loc 1 133 4
	li	a5,128
	sd	a5,-24(s0)
	.loc 1 134 2
	addi	a5,s0,-24
	mv	a1,a5
	li	a0,3
	call	my_asm_orr
	.loc 1 135 2
	ld	a5,-24(s0)
	mv	a1,a5
	lla	a0,.LC2
	call	printk
	.loc 1 137 4
	li	a5,3
	sd	a5,-24(s0)
	.loc 1 138 2
	addi	a5,s0,-24
	mv	a1,a5
	li	a0,2
	call	my_asm_add
	.loc 1 139 2
	ld	a5,-24(s0)
	mv	a1,a5
	lla	a0,.LC3
	call	printk
	.loc 1 140 1
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
.LFE15:
	.size	my_ops_test, .-my_ops_test
	.section	.rodata
	.align	3
.LC4:
	.string	"sstatus =0x%x\n"
	.text
	.align	2
	.type	test_sysregs, @function
test_sysregs:
.LFB16:
	.loc 1 143 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB2:
	.loc 1 146 39
 #APP
# 146 "src/kernel.c" 1
	csrr a5, sstatus
# 0 "" 2
 #NO_APP
	mv	ra,a5
	.loc 1 146 111
	mv	a5,ra
.LBE2:
	.loc 1 146 6
	sd	a5,-24(s0)
	.loc 1 148 2
	ld	a1,-24(s0)
	lla	a0,.LC4
	call	printk
	.loc 1 149 1
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
.LFE16:
	.size	test_sysregs, .-test_sysregs
	.section	.rodata
	.align	3
.LC5:
	.string	"%s: a = %d\n"
	.text
	.align	2
	.type	test_asm_goto, @function
test_asm_goto:
.LFB17:
	.loc 1 152 1
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
	.loc 1 153 2
	lw	a5,-20(s0)
 #APP
# 153 "src/kernel.c" 1
	addi a5, a5, -1
beqz a5, .L21

# 0 "" 2
	.loc 1 161 9
 #NO_APP
	li	a5,0
	j	.L22
.L21:
	.loc 1 164 2
	lw	a5,-20(s0)
	mv	a2,a5
	lla	a1,__func__.0
	lla	a0,.LC5
	call	printk
	.loc 1 165 9
	li	a5,1
.L22:
	.loc 1 166 1
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
.LFE17:
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
.LFB18:
	.loc 1 169 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 170 2
	li	a2,32
	li	a1,163840
	li	a0,131072
	call	my_memcpy_asm_test1
	.loc 1 171 5
	li	a2,32
	li	a1,163840
	li	a0,131072
	call	my_memcpy_asm_test2
	.loc 1 173 2
	li	a2,48
	li	a1,85
	li	a5,163840
	addi	a0,a5,2
	call	memset
	.loc 1 175 2
	call	my_ops_test
	.loc 1 177 2
	call	test_sysregs
	.loc 1 179 6
	li	a5,1
	sw	a5,-20(s0)
	.loc 1 180 6
	lw	a5,-20(s0)
	mv	a0,a5
	call	test_asm_goto
	mv	a5,a0
	.loc 1 180 5
	mv	a4,a5
	li	a5,1
	bne	a4,a5,.L24
	.loc 1 181 3
	lla	a0,.LC6
	call	printk
.L24:
	.loc 1 183 6
	sw	zero,-24(s0)
	.loc 1 184 6
	lw	a5,-24(s0)
	mv	a0,a5
	call	test_asm_goto
	mv	a5,a0
	.loc 1 184 5
	bne	a5,zero,.L26
	.loc 1 185 3
	lla	a0,.LC7
	call	printk
.L26:
	.loc 1 186 1
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
.LFB19:
	.loc 1 189 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 1 192 2
	call	load_store_test
	.loc 1 193 2
	call	shift_test
	.loc 1 194 2
	call	add_sub_test
	.loc 1 195 2
	call	branch_test
	.loc 1 197 2
	call	my_memcpy_test
	.loc 1 200 2
	li	a2,40
	li	a1,85
	li	a0,163840
	call	memset
	.loc 1 203 9
	li	a1,9
	li	a0,10
	call	compare_and_return
	sd	a0,-24(s0)
	.loc 1 204 5
	ld	a5,-24(s0)
	bne	a5,zero,.L28
	.loc 1 205 3
	lla	a0,.LC8
	call	uart_send_string
.L28:
	.loc 1 207 9
	li	a1,10
	li	a0,9
	call	compare_and_return
	sd	a0,-32(s0)
	.loc 1 208 5
	ld	a4,-32(s0)
	li	a5,-1
	bne	a4,a5,.L29
	.loc 1 209 3
	lla	a0,.LC8
	call	uart_send_string
.L29:
	.loc 1 211 9
	li	a1,9
	li	a0,0
	call	sel_test
	sd	a0,-24(s0)
	.loc 1 212 9
	li	a1,2
	li	a0,5
	call	sel_test
	sd	a0,-32(s0)
	.loc 1 214 2
	call	bl_test
	.loc 1 215 2
	lla	a0,.LC9
	call	uart_send_string
	.loc 1 217 9
	li	a1,5
	li	a0,5
	call	macro_test_1
	sd	a0,-24(s0)
	.loc 1 218 5
	ld	a4,-24(s0)
	li	a5,10
	bne	a4,a5,.L30
	.loc 1 219 3
	lla	a0,.LC10
	call	uart_send_string
.L30:
	.loc 1 221 9
	li	a1,5
	li	a0,5
	call	macro_test_2
	sd	a0,-32(s0)
	.loc 1 222 5
	ld	a5,-32(s0)
	bne	a5,zero,.L32
	.loc 1 223 3
	lla	a0,.LC11
	call	uart_send_string
.L32:
	.loc 1 224 1
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
.LFB20:
	.loc 1 233 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 234 2
	lla	a0,.LC12
	call	printk
	.loc 1 235 2
	lla	a1,_text_boot
	lla	a2,_etext_boot
	.loc 1 237 32
	lla	a4,_etext_boot
	lla	a5,_text_boot
	sub	a5,a4,a5
	.loc 1 235 2
	mv	a3,a5
	lla	a0,.LC13
	call	printk
	.loc 1 238 2
	lla	a1,_text
	lla	a2,_etext
	.loc 1 240 27
	lla	a4,_etext
	lla	a5,_text
	sub	a5,a4,a5
	.loc 1 238 2
	mv	a3,a5
	lla	a0,.LC14
	call	printk
	.loc 1 241 2
	lla	a1,_rodata
	lla	a2,_erodata
	.loc 1 243 29
	lla	a4,_erodata
	lla	a5,_rodata
	sub	a5,a4,a5
	.loc 1 241 2
	mv	a3,a5
	lla	a0,.LC15
	call	printk
	.loc 1 244 2
	lla	a1,_data
	lla	a2,_edata
	.loc 1 246 27
	lla	a4,_edata
	lla	a5,_data
	sub	a5,a4,a5
	.loc 1 244 2
	mv	a3,a5
	lla	a0,.LC16
	call	printk
	.loc 1 247 2
	lla	a1,_bss
	lla	a2,_ebss
	.loc 1 249 26
	lla	a4,_ebss
	lla	a5,_bss
	sub	a5,a4,a5
	.loc 1 247 2
	mv	a3,a5
	lla	a0,.LC17
	call	printk
	.loc 1 250 1
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
.LFE20:
	.size	print_mem, .-print_mem
	.align	2
	.type	clean_bss, @function
clean_bss:
.LFB21:
	.loc 1 253 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 1 254 16
	lla	a5,_bss
	sd	a5,-24(s0)
	.loc 1 255 16
	lla	a5,_ebss
	sd	a5,-32(s0)
	.loc 1 256 22
	ld	a5,-32(s0)
	sext.w	a4,a5
	ld	a5,-24(s0)
	sext.w	a5,a5
	.loc 1 256 11
	subw	a5,a4,a5
	sw	a5,-36(s0)
	.loc 1 258 2
	ld	a5,-24(s0)
	lwu	a4,-36(s0)
	mv	a2,a4
	li	a1,0
	mv	a0,a5
	call	memset
	.loc 1 259 1
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
.LFE21:
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
.LFB22:
	.loc 1 262 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 263 2
	call	clean_bss
	.loc 1 264 2
	call	uart_init
	.loc 1 265 2
	lla	a0,.LC18
	call	uart_send_string
	.loc 1 266 2
	call	init_printk_done
	.loc 1 267 2
	lla	a0,.LC19
	call	printk
	.loc 1 269 2
	call	asm_test
	.loc 1 270 2
	call	inline_asm_test
	.loc 1 273 2
	li	a5,8392704
	addi	a0,a5,-1920
	call	print_func_name
	.loc 1 274 2
	li	a5,8392704
	addi	a0,a5,-1952
	call	print_func_name
	.loc 1 275 2
	li	a5,8392704
	addi	a0,a5,-2048
	call	print_func_name
	.loc 1 277 2
	call	print_mem
.L36:
	.loc 1 279 8 discriminator 1
	j	.L36
	.cfi_endproc
.LFE22:
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
	.4byte	0x53d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF45
	.byte	0xc
	.4byte	.LASF46
	.4byte	.LASF47
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
	.byte	0x12
	.byte	0x16
	.4byte	0x73
	.byte	0x6
	.4byte	.LASF10
	.byte	0x1
	.byte	0x13
	.byte	0x16
	.4byte	0x6c
	.byte	0x6
	.4byte	.LASF11
	.byte	0x1
	.byte	0x14
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
	.byte	0x1
	.byte	0xe2
	.byte	0xd
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF14
	.byte	0x1
	.byte	0xe2
	.byte	0x1b
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF15
	.byte	0x1
	.byte	0xe3
	.byte	0xd
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF16
	.byte	0x1
	.byte	0xe3
	.byte	0x16
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF17
	.byte	0x1
	.byte	0xe4
	.byte	0xd
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF18
	.byte	0x1
	.byte	0xe4
	.byte	0x18
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF19
	.byte	0x1
	.byte	0xe5
	.byte	0xd
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF20
	.byte	0x1
	.byte	0xe5
	.byte	0x16
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF21
	.byte	0x1
	.byte	0xe6
	.byte	0xd
	.4byte	0xae
	.byte	0x6
	.4byte	.LASF22
	.byte	0x1
	.byte	0xe6
	.byte	0x15
	.4byte	0xae
	.byte	0x8
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x105
	.byte	0x6
	.8byte	.LFB22
	.8byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF29
	.byte	0x1
	.byte	0xfc
	.byte	0xd
	.8byte	.LFB21
	.8byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x199
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0xfe
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xb
	.string	"end"
	.byte	0x1
	.byte	0xff
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xc
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x100
	.byte	0xb
	.4byte	0x50
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0xd
	.4byte	.LASF49
	.byte	0x1
	.byte	0xe8
	.byte	0xd
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.byte	0xe
	.4byte	.LASF27
	.byte	0x1
	.byte	0xbc
	.byte	0x6
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x1f0
	.byte	0xa
	.4byte	.LASF25
	.byte	0x1
	.byte	0xbe
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xa
	.4byte	.LASF26
	.byte	0x1
	.byte	0xbe
	.byte	0x16
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xe
	.4byte	.LASF28
	.byte	0x1
	.byte	0xa8
	.byte	0x6
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x229
	.byte	0xb
	.string	"a"
	.byte	0x1
	.byte	0xb3
	.byte	0x6
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xb
	.string	"b"
	.byte	0x1
	.byte	0xb7
	.byte	0x6
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xf
	.4byte	.LASF38
	.byte	0x1
	.byte	0x97
	.byte	0xc
	.4byte	0x49
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x27c
	.byte	0x10
	.string	"a"
	.byte	0x1
	.byte	0x97
	.byte	0x1e
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x11
	.4byte	.LASF42
	.byte	0x1
	.byte	0xa3
	.byte	0x1
	.8byte	.L21
	.byte	0x12
	.4byte	.LASF50
	.4byte	0x28c
	.byte	0x9
	.byte	0x3
	.8byte	__func__.0
	.byte	0
	.byte	0x4
	.4byte	0xa9
	.4byte	0x28c
	.byte	0x13
	.4byte	0x6c
	.byte	0xd
	.byte	0
	.byte	0x7
	.4byte	0x27c
	.byte	0x9
	.4byte	.LASF30
	.byte	0x1
	.byte	0x8e
	.byte	0xd
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x2df
	.byte	0xb
	.string	"val"
	.byte	0x1
	.byte	0x90
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x14
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0xb
	.string	"__v"
	.byte	0x1
	.byte	0x92
	.byte	0x22
	.4byte	0x6c
	.byte	0x1
	.byte	0x51
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	.LASF31
	.byte	0x1
	.byte	0x7d
	.byte	0xd
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x30b
	.byte	0xb
	.string	"p"
	.byte	0x1
	.byte	0x7f
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x15
	.4byte	.LASF32
	.byte	0x1
	.byte	0x7b
	.byte	0x14
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x355
	.byte	0x16
	.4byte	.LASF33
	.byte	0x1
	.byte	0x7b
	.byte	0x2d
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x10
	.string	"p"
	.byte	0x1
	.byte	0x7b
	.byte	0x39
	.4byte	0x355
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xb
	.string	"tmp"
	.byte	0x1
	.byte	0x7b
	.byte	0x4c
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x17
	.byte	0x8
	.byte	0x15
	.4byte	.LASF34
	.byte	0x1
	.byte	0x7a
	.byte	0x14
	.8byte	.LFB13
	.8byte	.LFE13-.LFB13
	.byte	0x1
	.byte	0x9c
	.4byte	0x3a1
	.byte	0x16
	.4byte	.LASF33
	.byte	0x1
	.byte	0x7a
	.byte	0x2d
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x10
	.string	"p"
	.byte	0x1
	.byte	0x7a
	.byte	0x39
	.4byte	0x355
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xb
	.string	"tmp"
	.byte	0x1
	.byte	0x7a
	.byte	0x4c
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x15
	.4byte	.LASF35
	.byte	0x1
	.byte	0x79
	.byte	0x14
	.8byte	.LFB12
	.8byte	.LFE12-.LFB12
	.byte	0x1
	.byte	0x9c
	.4byte	0x3eb
	.byte	0x16
	.4byte	.LASF33
	.byte	0x1
	.byte	0x79
	.byte	0x2d
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x10
	.string	"p"
	.byte	0x1
	.byte	0x79
	.byte	0x39
	.4byte	0x355
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0xb
	.string	"tmp"
	.byte	0x1
	.byte	0x79
	.byte	0x4c
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0x5a
	.byte	0xd
	.8byte	.LFB11
	.8byte	.LFE11-.LFB11
	.byte	0x1
	.byte	0x9c
	.4byte	0x455
	.byte	0x10
	.string	"src"
	.byte	0x1
	.byte	0x5a
	.byte	0x2f
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x10
	.string	"dst"
	.byte	0x1
	.byte	0x5a
	.byte	0x42
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x16
	.4byte	.LASF24
	.byte	0x1
	.byte	0x5b
	.byte	0x11
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xb
	.string	"tmp"
	.byte	0x1
	.byte	0x5d
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xb
	.string	"end"
	.byte	0x1
	.byte	0x5e
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x15
	.4byte	.LASF37
	.byte	0x1
	.byte	0x43
	.byte	0xd
	.8byte	.LFB10
	.8byte	.LFE10-.LFB10
	.byte	0x1
	.byte	0x9c
	.4byte	0x4bf
	.byte	0x10
	.string	"src"
	.byte	0x1
	.byte	0x43
	.byte	0x2f
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x10
	.string	"dst"
	.byte	0x1
	.byte	0x43
	.byte	0x42
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x16
	.4byte	.LASF24
	.byte	0x1
	.byte	0x44
	.byte	0x11
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xb
	.string	"tmp"
	.byte	0x1
	.byte	0x46
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0xb
	.string	"end"
	.byte	0x1
	.byte	0x47
	.byte	0x10
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xf
	.4byte	.LASF39
	.byte	0x1
	.byte	0x16
	.byte	0xc
	.4byte	0x49
	.8byte	.LFB9
	.8byte	.LFE9-.LFB9
	.byte	0x1
	.byte	0x9c
	.4byte	0x53a
	.byte	0x16
	.4byte	.LASF40
	.byte	0x1
	.byte	0x16
	.byte	0x2a
	.4byte	0x6c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0xb
	.string	"i"
	.byte	0x1
	.byte	0x18
	.byte	0x6
	.4byte	0x49
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xb
	.string	"p"
	.byte	0x1
	.byte	0x19
	.byte	0x8
	.4byte	0x53a
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0xa
	.4byte	.LASF41
	.byte	0x1
	.byte	0x19
	.byte	0xc
	.4byte	0x53a
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x11
	.4byte	.LASF43
	.byte	0x1
	.byte	0x22
	.byte	0x1
	.8byte	.L4
	.byte	0x11
	.4byte	.LASF44
	.byte	0x1
	.byte	0x37
	.byte	0x1
	.8byte	.L8
	.byte	0
	.byte	0x18
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
	.byte	0x12
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
	.byte	0x13
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x18
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
.LASF40:
	.string	"addr"
.LASF49:
	.string	"print_mem"
.LASF22:
	.string	"_ebss"
.LASF32:
	.string	"my_asm_add"
.LASF37:
	.string	"my_memcpy_asm_test1"
.LASF38:
	.string	"test_asm_goto"
.LASF25:
	.string	"val1"
.LASF47:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_7\\\\lab7-6\\\\benos"
.LASF33:
	.string	"mask"
.LASF23:
	.string	"start"
.LASF43:
	.string	"found"
.LASF21:
	.string	"_bss"
.LASF28:
	.string	"inline_asm_test"
.LASF27:
	.string	"asm_test"
.LASF13:
	.string	"_text_boot"
.LASF50:
	.string	"__func__"
.LASF9:
	.string	"func_addr"
.LASF1:
	.string	"unsigned char"
.LASF20:
	.string	"_edata"
.LASF10:
	.string	"func_num_syms"
.LASF34:
	.string	"my_asm_and"
.LASF8:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF18:
	.string	"_erodata"
.LASF26:
	.string	"val2"
.LASF45:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF39:
	.string	"print_func_name"
.LASF35:
	.string	"my_asm_orr"
.LASF17:
	.string	"_rodata"
.LASF31:
	.string	"my_ops_test"
.LASF30:
	.string	"test_sysregs"
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
.LASF36:
	.string	"my_memcpy_asm_test2"
.LASF2:
	.string	"short int"
.LASF29:
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
.LASF42:
	.string	"label"
.LASF24:
	.string	"size"
.LASF41:
	.string	"string"
.LASF48:
	.string	"kernel_main"
.LASF46:
	.string	"src/kernel.c"
.LASF44:
	.string	"done"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
