	.file	"printk.c"
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
.LFB1:
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
.LFE1:
	.size	sbi_putchar, .-sbi_putchar
	.local	print_buf
	.comm	print_buf,256,8
	.local	log_buf
	.comm	log_buf,256,8
	.local	g_printk_status
	.comm	g_printk_status,4,4
	.section	.sdata,"aw"
	.align	3
	.type	g_record, @object
	.size	g_record, 8
g_record:
	.dword	log_buf
	.local	g_record_len
	.comm	g_record_len,8,8
	.text
	.align	2
	.type	scan_number, @function
scan_number:
.LFB3:
	.file 2 "src/printk.c"
	.loc 2 44 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	s0,40(sp)
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	.loc 2 45 6
	sw	zero,-20(s0)
	.loc 2 47 8
	j	.L3
.L5:
	.loc 2 48 7
	lw	a4,-20(s0)
	mv	a5,a4
	slliw	a5,a5,2
	addw	a5,a5,a4
	slliw	a5,a5,1
	sw	a5,-20(s0)
	.loc 2 49 18
	ld	a5,-40(s0)
	addi	a4,a5,1
	sd	a4,-40(s0)
	.loc 2 49 10
	lbu	a5,0(a5)
	sext.w	a5,a5
	.loc 2 49 22
	addiw	a5,a5,-48
	sext.w	a5,a5
	.loc 2 49 7
	lw	a4,-20(s0)
	addw	a5,a4,a5
	sw	a5,-20(s0)
.L3:
	.loc 2 47 11
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	.loc 2 47 8
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L4
	.loc 2 47 31 discriminator 1
	ld	a5,-40(s0)
	lbu	a5,0(a5)
	.loc 2 47 27 discriminator 1
	mv	a4,a5
	li	a5,57
	bleu	a4,a5,.L5
.L4:
	.loc 2 52 10
	ld	a5,-48(s0)
	lw	a4,-20(s0)
	sw	a4,0(a5)
	.loc 2 53 9
	ld	a5,-40(s0)
	.loc 2 54 1
	mv	a0,a5
	ld	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE3:
	.size	scan_number, .-scan_number
	.section	.rodata
	.align	3
.LC0:
	.string	"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	.align	3
.LC1:
	.string	"0123456789abcdefghijklmnopqrstuvwxyz"
	.text
	.align	2
	.type	number, @function
number:
.LFB4:
	.loc 2 58 1
	.cfi_startproc
	addi	sp,sp,-224
	.cfi_def_cfa_offset 224
	sd	s0,216(sp)
	.cfi_offset 8, -8
	addi	s0,sp,224
	.cfi_def_cfa 8, 0
	sd	a0,-200(s0)
	sd	a1,-208(s0)
	mv	a1,a2
	mv	a2,a3
	mv	a3,a4
	mv	a4,a5
	mv	a5,a1
	sw	a5,-212(s0)
	mv	a5,a2
	sw	a5,-216(s0)
	mv	a5,a3
	sw	a5,-220(s0)
	mv	a5,a4
	sw	a5,-224(s0)
	.loc 2 59 10
	sb	zero,-17(s0)
	.loc 2 62 14
	lla	a5,.LC0
	sd	a5,-32(s0)
	.loc 2 65 11
	lw	a5,-224(s0)
	andi	a5,a5,64
	sext.w	a5,a5
	.loc 2 65 5
	beq	a5,zero,.L8
	.loc 2 66 10
	lla	a5,.LC1
	sd	a5,-32(s0)
.L8:
	.loc 2 67 11
	lw	a5,-224(s0)
	andi	a5,a5,16
	sext.w	a5,a5
	.loc 2 67 5
	beq	a5,zero,.L9
	.loc 2 68 8
	lw	a5,-224(s0)
	andi	a5,a5,-2
	sw	a5,-224(s0)
.L9:
	.loc 2 69 5
	lw	a5,-212(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L10
	.loc 2 69 15 discriminator 1
	lw	a5,-212(s0)
	sext.w	a4,a5
	li	a5,36
	ble	a4,a5,.L11
.L10:
	.loc 2 70 10
	li	a5,0
	j	.L40
.L11:
	.loc 2 72 12
	lw	a5,-224(s0)
	andi	a5,a5,1
	sext.w	a5,a5
	.loc 2 72 4
	beq	a5,zero,.L13
	.loc 2 72 4 is_stmt 0 discriminator 1
	li	a5,48
	j	.L14
.L13:
	.loc 2 72 4 discriminator 2
	li	a5,32
.L14:
	.loc 2 72 4 discriminator 4
	sb	a5,-37(s0)
	.loc 2 74 11 is_stmt 1 discriminator 4
	lw	a5,-224(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	.loc 2 74 5 discriminator 4
	beq	a5,zero,.L15
	.loc 2 75 8
	ld	a5,-208(s0)
	sd	a5,-48(s0)
	.loc 2 76 6
	ld	a5,-48(s0)
	bge	a5,zero,.L16
	.loc 2 77 9
	li	a5,45
	sb	a5,-17(s0)
	.loc 2 78 10
	ld	a5,-48(s0)
	neg	a5,a5
	.loc 2 78 8
	sd	a5,-208(s0)
	j	.L15
.L16:
	.loc 2 79 19
	lw	a5,-224(s0)
	andi	a5,a5,4
	sext.w	a5,a5
	.loc 2 79 13
	beq	a5,zero,.L17
	.loc 2 80 9
	li	a5,43
	sb	a5,-17(s0)
	.loc 2 81 8
	lw	a5,-216(s0)
	addiw	a5,a5,-1
	sw	a5,-216(s0)
	j	.L15
.L17:
	.loc 2 82 19
	lw	a5,-224(s0)
	andi	a5,a5,8
	sext.w	a5,a5
	.loc 2 82 13
	beq	a5,zero,.L15
	.loc 2 83 9
	li	a5,32
	sb	a5,-17(s0)
	.loc 2 84 8
	lw	a5,-216(s0)
	addiw	a5,a5,-1
	sw	a5,-216(s0)
.L15:
	.loc 2 88 11
	lw	a5,-224(s0)
	andi	a5,a5,32
	sext.w	a5,a5
	.loc 2 88 5
	beq	a5,zero,.L18
	.loc 2 89 6
	lw	a5,-212(s0)
	sext.w	a4,a5
	li	a5,16
	bne	a4,a5,.L19
	.loc 2 90 9
	lw	a5,-216(s0)
	addiw	a5,a5,-2
	sw	a5,-216(s0)
	j	.L18
.L19:
	.loc 2 91 11
	lw	a5,-212(s0)
	sext.w	a4,a5
	li	a5,8
	bne	a4,a5,.L18
	.loc 2 92 8
	lw	a5,-216(s0)
	addiw	a5,a5,-1
	sw	a5,-216(s0)
.L18:
	.loc 2 95 4
	sw	zero,-36(s0)
	.loc 2 96 5
	ld	a5,-208(s0)
	bne	a5,zero,.L22
	.loc 2 97 8
	lw	a5,-36(s0)
	addiw	a4,a5,1
	sw	a4,-36(s0)
	.loc 2 97 12
	addi	a4,s0,-16
	add	a5,a4,a5
	li	a4,48
	sb	a4,-168(a5)
	j	.L21
.L23:
.LBB3:
	.loc 2 100 38
	lw	a5,-212(s0)
	sw	a5,-52(s0)
	.loc 2 100 106
	lwu	a5,-52(s0)
	ld	a4,-208(s0)
	remu	a5,a4,a5
	.loc 2 100 81
	sw	a5,-56(s0)
	.loc 2 100 147
	lwu	a5,-52(s0)
	.loc 2 100 122
	ld	a4,-208(s0)
	divu	a5,a4,a5
	sd	a5,-208(s0)
	.loc 2 100 157
	lw	a5,-56(s0)
.LBE3:
	.loc 2 100 23
	slli	a5,a5,32
	srli	a5,a5,32
	.loc 2 100 21
	ld	a4,-32(s0)
	add	a4,a4,a5
	.loc 2 100 9
	lw	a5,-36(s0)
	addiw	a3,a5,1
	sw	a3,-36(s0)
	.loc 2 100 21
	lbu	a4,0(a4)
	.loc 2 100 13
	addi	a3,s0,-16
	add	a5,a3,a5
	sb	a4,-168(a5)
.L22:
	.loc 2 99 9
	ld	a5,-208(s0)
	bne	a5,zero,.L23
.L21:
	.loc 2 101 5
	lw	a4,-36(s0)
	lw	a5,-220(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	ble	a4,a5,.L24
	.loc 2 102 13
	lw	a5,-36(s0)
	sw	a5,-220(s0)
.L24:
	.loc 2 103 7
	lw	a4,-216(s0)
	lw	a5,-220(s0)
	subw	a5,a4,a5
	sw	a5,-216(s0)
	.loc 2 104 12
	lw	a5,-224(s0)
	andi	a5,a5,17
	sext.w	a5,a5
	.loc 2 104 5
	bne	a5,zero,.L25
	.loc 2 105 9
	j	.L26
.L27:
	.loc 2 106 8
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 2 106 11
	li	a4,32
	sb	a4,0(a5)
.L26:
	.loc 2 105 14
	lw	a5,-216(s0)
	addiw	a4,a5,-1
	sw	a4,-216(s0)
	.loc 2 105 9
	bgt	a5,zero,.L27
.L25:
	.loc 2 107 5
	lbu	a5,-17(s0)
	andi	a5,a5,0xff
	beq	a5,zero,.L28
	.loc 2 108 7
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 2 108 10
	lbu	a4,-17(s0)
	sb	a4,0(a5)
.L28:
	.loc 2 110 11
	lw	a5,-224(s0)
	andi	a5,a5,32
	sext.w	a5,a5
	.loc 2 110 5
	beq	a5,zero,.L29
	.loc 2 111 6
	lw	a5,-212(s0)
	sext.w	a4,a5
	li	a5,8
	bne	a4,a5,.L30
	.loc 2 112 8
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 2 112 11
	li	a4,48
	sb	a4,0(a5)
	j	.L29
.L30:
	.loc 2 113 11
	lw	a5,-212(s0)
	sext.w	a4,a5
	li	a5,16
	bne	a4,a5,.L29
	.loc 2 114 8
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 2 114 11
	li	a4,48
	sb	a4,0(a5)
	.loc 2 115 8
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 2 115 11
	ld	a4,-32(s0)
	lbu	a4,33(a4)
	sb	a4,0(a5)
.L29:
	.loc 2 119 13
	lw	a5,-224(s0)
	andi	a5,a5,16
	sext.w	a5,a5
	.loc 2 119 5
	bne	a5,zero,.L34
	.loc 2 120 9
	j	.L32
.L33:
	.loc 2 121 8
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 2 121 11
	lbu	a4,-37(s0)
	sb	a4,0(a5)
.L32:
	.loc 2 120 14
	lw	a5,-216(s0)
	addiw	a4,a5,-1
	sw	a4,-216(s0)
	.loc 2 120 9
	bgt	a5,zero,.L33
	.loc 2 122 8
	j	.L34
.L35:
	.loc 2 123 7
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 2 123 10
	li	a4,48
	sb	a4,0(a5)
.L34:
	.loc 2 122 22
	lw	a5,-220(s0)
	addiw	a4,a5,-1
	sw	a4,-220(s0)
	.loc 2 122 8
	lw	a4,-36(s0)
	sext.w	a4,a4
	blt	a4,a5,.L35
	.loc 2 124 8
	j	.L36
.L37:
	.loc 2 125 7
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 2 125 15
	lw	a4,-36(s0)
	addi	a3,s0,-16
	add	a4,a3,a4
	lbu	a4,-168(a4)
	.loc 2 125 10
	sb	a4,0(a5)
.L36:
	.loc 2 124 10
	lw	a5,-36(s0)
	addiw	a4,a5,-1
	sw	a4,-36(s0)
	.loc 2 124 8
	bgt	a5,zero,.L37
	.loc 2 126 8
	j	.L38
.L39:
	.loc 2 127 7
	ld	a5,-200(s0)
	addi	a4,a5,1
	sd	a4,-200(s0)
	.loc 2 127 10
	li	a4,32
	sb	a4,0(a5)
.L38:
	.loc 2 126 13
	lw	a5,-216(s0)
	addiw	a4,a5,-1
	sw	a4,-216(s0)
	.loc 2 126 8
	bgt	a5,zero,.L39
	.loc 2 129 9
	ld	a5,-200(s0)
.L40:
	.loc 2 130 1 discriminator 1
	mv	a0,a5
	ld	s0,216(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 224
	addi	sp,sp,224
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE4:
	.size	number, .-number
	.section	.rodata
	.align	3
.LC2:
	.string	"<NULL>"
	.text
	.align	2
	.globl	myprintf
	.type	myprintf, @function
myprintf:
.LFB5:
	.loc 2 149 1
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
	sd	a3,-112(s0)
	sw	a5,-92(s0)
	.loc 2 162 6
	ld	a5,-88(s0)
	sd	a5,-24(s0)
	.loc 2 164 2
	j	.L42
.L99:
	.loc 2 165 7
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 165 6
	mv	a4,a5
	li	a5,37
	beq	a4,a5,.L43
	.loc 2 166 8
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 2 166 13
	ld	a4,-104(s0)
	lbu	a4,0(a4)
	.loc 2 166 11
	sb	a4,0(a5)
	.loc 2 167 4
	j	.L44
.L43:
	.loc 2 171 9
	sw	zero,-28(s0)
.L45:
	.loc 2 173 3
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
	.loc 2 174 11
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	addiw	a3,a5,-32
	sext.w	a4,a3
	li	a5,16
	bgtu	a4,a5,.L46
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lla	a5,.L48
	add	a5,a4,a5
	lw	a5,0(a5)
	sext.w	a4,a5
	lla	a5,.L48
	add	a5,a4,a5
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L48:
	.word	.L52-.L48
	.word	.L46-.L48
	.word	.L46-.L48
	.word	.L51-.L48
	.word	.L46-.L48
	.word	.L46-.L48
	.word	.L46-.L48
	.word	.L46-.L48
	.word	.L46-.L48
	.word	.L46-.L48
	.word	.L46-.L48
	.word	.L50-.L48
	.word	.L46-.L48
	.word	.L49-.L48
	.word	.L46-.L48
	.word	.L46-.L48
	.word	.L47-.L48
	.text
.L49:
	.loc 2 176 10
	lw	a5,-28(s0)
	ori	a5,a5,16
	sw	a5,-28(s0)
	.loc 2 177 4
	j	.L45
.L50:
	.loc 2 179 10
	lw	a5,-28(s0)
	ori	a5,a5,4
	sw	a5,-28(s0)
	.loc 2 180 4
	j	.L45
.L52:
	.loc 2 182 10
	lw	a5,-28(s0)
	ori	a5,a5,8
	sw	a5,-28(s0)
	.loc 2 183 4
	j	.L45
.L51:
	.loc 2 185 10
	lw	a5,-28(s0)
	ori	a5,a5,32
	sw	a5,-28(s0)
	.loc 2 186 4
	j	.L45
.L47:
	.loc 2 188 10
	lw	a5,-28(s0)
	ori	a5,a5,1
	sw	a5,-28(s0)
	.loc 2 189 4
	j	.L45
.L46:
	.loc 2 193 15
	li	a5,-1
	sw	a5,-76(s0)
	.loc 2 194 9
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 194 6
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L53
	.loc 2 194 26 discriminator 1
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 194 22 discriminator 1
	mv	a4,a5
	li	a5,57
	bgtu	a4,a5,.L53
	.loc 2 195 10
	addi	a5,s0,-76
	mv	a1,a5
	ld	a0,-104(s0)
	call	scan_number
	sd	a0,-104(s0)
	.loc 2 195 8
	j	.L54
.L53:
	.loc 2 196 14
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 196 13
	mv	a4,a5
	li	a5,42
	bne	a4,a5,.L54
	.loc 2 197 40
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	.loc 2 197 16
	sw	a5,-76(s0)
	.loc 2 198 20
	lw	a5,-76(s0)
	.loc 2 198 7
	bge	a5,zero,.L54
	.loc 2 199 19
	lw	a5,-76(s0)
	negw	a5,a5
	sext.w	a5,a5
	.loc 2 199 17
	sw	a5,-76(s0)
	.loc 2 200 11
	lw	a5,-28(s0)
	ori	a5,a5,16
	sw	a5,-28(s0)
.L54:
	.loc 2 205 13
	li	a5,-1
	sw	a5,-80(s0)
	.loc 2 206 7
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 206 6
	mv	a4,a5
	li	a5,46
	bne	a4,a5,.L55
	.loc 2 207 4
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
	.loc 2 208 10
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 208 7
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L56
	.loc 2 208 27 discriminator 1
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 208 23 discriminator 1
	mv	a4,a5
	li	a5,57
	bgtu	a4,a5,.L56
	.loc 2 209 11
	addi	a5,s0,-80
	mv	a1,a5
	ld	a0,-104(s0)
	call	scan_number
	sd	a0,-104(s0)
	.loc 2 209 9
	j	.L57
.L56:
	.loc 2 210 13
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 210 12
	mv	a4,a5
	li	a5,42
	bne	a4,a5,.L57
	.loc 2 211 39
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	.loc 2 211 15
	sw	a5,-80(s0)
.L57:
	.loc 2 212 18
	lw	a5,-80(s0)
	.loc 2 212 7
	bge	a5,zero,.L55
	.loc 2 213 15
	sw	zero,-80(s0)
.L55:
	.loc 2 220 13
	li	a5,-1
	sw	a5,-32(s0)
	.loc 2 221 7
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 221 6
	mv	a4,a5
	li	a5,104
	beq	a4,a5,.L58
	.loc 2 221 22 discriminator 1
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 221 19 discriminator 1
	mv	a4,a5
	li	a5,108
	beq	a4,a5,.L58
	.loc 2 221 37 discriminator 2
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 221 34 discriminator 2
	mv	a4,a5
	li	a5,76
	bne	a4,a5,.L59
.L58:
	.loc 2 222 16
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 222 14
	sw	a5,-32(s0)
	.loc 2 223 4
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
	.loc 2 225 7
	lw	a5,-32(s0)
	sext.w	a4,a5
	li	a5,108
	bne	a4,a5,.L59
	.loc 2 225 28 discriminator 1
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 225 25 discriminator 1
	mv	a4,a5
	li	a5,108
	bne	a4,a5,.L59
	.loc 2 226 15
	li	a5,76
	sw	a5,-32(s0)
	.loc 2 227 5
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
.L59:
	.loc 2 231 11
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	addiw	a3,a5,-88
	sext.w	a4,a3
	li	a5,32
	bgtu	a4,a5,.L60
	slli	a5,a3,32
	srli	a5,a5,32
	slli	a4,a5,2
	lla	a5,.L62
	add	a5,a4,a5
	lw	a5,0(a5)
	sext.w	a4,a5
	lla	a5,.L62
	add	a5,a4,a5
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L62:
	.word	.L70-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L69-.L62
	.word	.L68-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L68-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L67-.L62
	.word	.L66-.L62
	.word	.L65-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L64-.L62
	.word	.L60-.L62
	.word	.L63-.L62
	.word	.L60-.L62
	.word	.L60-.L62
	.word	.L61-.L62
	.text
.L69:
	.loc 2 234 16
	lw	a5,-28(s0)
	andi	a5,a5,16
	sext.w	a5,a5
	.loc 2 234 7
	bne	a5,zero,.L71
	.loc 2 235 11
	j	.L72
.L73:
	.loc 2 236 10
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 2 236 13
	li	a4,32
	sb	a4,0(a5)
.L72:
	.loc 2 235 12
	lw	a5,-76(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	.loc 2 235 11
	sw	a5,-76(s0)
	.loc 2 235 12
	lw	a5,-76(s0)
	.loc 2 235 11
	bgt	a5,zero,.L73
.L71:
	.loc 2 237 50
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a3,0(a5)
	.loc 2 237 8
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 2 237 13
	andi	a4,a3,0xff
	.loc 2 237 11
	sb	a4,0(a5)
	.loc 2 238 10
	j	.L74
.L75:
	.loc 2 239 9
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 2 239 12
	li	a4,32
	sb	a4,0(a5)
.L74:
	.loc 2 238 11
	lw	a5,-76(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	.loc 2 238 10
	sw	a5,-76(s0)
	.loc 2 238 11
	lw	a5,-76(s0)
	.loc 2 238 10
	bgt	a5,zero,.L75
	.loc 2 241 4
	j	.L44
.L64:
	.loc 2 245 6
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	sd	a5,-40(s0)
	.loc 2 246 7
	ld	a5,-40(s0)
	bne	a5,zero,.L76
	.loc 2 247 7
	lla	a5,.LC2
	sd	a5,-40(s0)
.L76:
	.loc 2 248 10
	ld	a0,-40(s0)
	call	strlen
	mv	a5,a0
	.loc 2 248 8
	sw	a5,-48(s0)
	.loc 2 249 18
	lw	a5,-80(s0)
	.loc 2 249 7
	bge	a5,zero,.L77
	.loc 2 250 15
	lw	a5,-48(s0)
	sw	a5,-80(s0)
	j	.L78
.L77:
	.loc 2 251 17
	lw	a4,-80(s0)
	.loc 2 251 12
	lw	a5,-48(s0)
	sext.w	a5,a5
	ble	a5,a4,.L78
	.loc 2 252 9
	lw	a5,-80(s0)
	sw	a5,-48(s0)
.L78:
	.loc 2 254 16
	lw	a5,-28(s0)
	andi	a5,a5,16
	sext.w	a5,a5
	.loc 2 254 7
	bne	a5,zero,.L79
	.loc 2 255 11
	j	.L80
.L81:
	.loc 2 256 10
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 2 256 13
	li	a4,32
	sb	a4,0(a5)
.L80:
	.loc 2 255 29
	lw	a5,-76(s0)
	addiw	a4,a5,-1
	sext.w	a4,a4
	sw	a4,-76(s0)
	.loc 2 255 11
	lw	a4,-48(s0)
	sext.w	a4,a4
	blt	a4,a5,.L81
.L79:
	.loc 2 257 11
	sw	zero,-44(s0)
	.loc 2 257 4
	j	.L82
.L83:
	.loc 2 258 16 discriminator 3
	ld	a4,-40(s0)
	addi	a5,a4,1
	sd	a5,-40(s0)
	.loc 2 258 9 discriminator 3
	ld	a5,-24(s0)
	addi	a3,a5,1
	sd	a3,-24(s0)
	.loc 2 258 14 discriminator 3
	lbu	a4,0(a4)
	.loc 2 258 12 discriminator 3
	sb	a4,0(a5)
	.loc 2 257 26 discriminator 3
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sw	a5,-44(s0)
.L82:
	.loc 2 257 4 discriminator 1
	lw	a4,-44(s0)
	lw	a5,-48(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L83
	.loc 2 259 10
	j	.L84
.L85:
	.loc 2 260 9
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 2 260 12
	li	a4,32
	sb	a4,0(a5)
.L84:
	.loc 2 259 28
	lw	a5,-76(s0)
	addiw	a4,a5,-1
	sext.w	a4,a4
	sw	a4,-76(s0)
	.loc 2 259 10
	lw	a4,-48(s0)
	sext.w	a4,a4
	blt	a4,a5,.L85
	.loc 2 261 4
	j	.L44
.L67:
	.loc 2 268 7
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	sd	a5,-72(s0)
	.loc 2 269 15
	ld	a4,-24(s0)
	ld	a5,-88(s0)
	sub	a5,a4,a5
	.loc 2 269 8
	andi	a4,a5,0xff
	ld	a5,-72(s0)
	sb	a4,0(a5)
	.loc 2 270 4
	j	.L44
.L65:
	.loc 2 276 20
	lw	a5,-76(s0)
	.loc 2 276 7
	mv	a4,a5
	li	a5,-1
	bne	a4,a5,.L86
	.loc 2 277 17
	li	a5,16
	sw	a5,-76(s0)
	.loc 2 278 11
	lw	a5,-28(s0)
	ori	a5,a5,1
	sw	a5,-28(s0)
.L86:
	.loc 2 281 42
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	.loc 2 280 10
	mv	a1,a5
	lw	a3,-76(s0)
	lw	a4,-80(s0)
	lw	a5,-28(s0)
	li	a2,16
	ld	a0,-24(s0)
	call	number
	sd	a0,-24(s0)
	.loc 2 283 4
	j	.L44
.L66:
	.loc 2 287 9
	li	a5,8
	sw	a5,-60(s0)
	.loc 2 288 4
	j	.L87
.L61:
	.loc 2 291 10
	lw	a5,-28(s0)
	ori	a5,a5,64
	sw	a5,-28(s0)
.L70:
	.loc 2 293 9
	li	a5,16
	sw	a5,-60(s0)
	.loc 2 294 4
	j	.L87
.L68:
	.loc 2 298 10
	lw	a5,-28(s0)
	ori	a5,a5,2
	sw	a5,-28(s0)
.L63:
	.loc 2 301 9
	li	a5,10
	sw	a5,-60(s0)
	.loc 2 302 4
	j	.L87
.L60:
	.loc 2 305 8
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 305 7
	mv	a4,a5
	li	a5,37
	beq	a4,a5,.L88
	.loc 2 306 9
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 2 306 12
	li	a4,37
	sb	a4,0(a5)
.L88:
	.loc 2 307 8
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 307 7
	beq	a5,zero,.L89
	.loc 2 308 9
	ld	a5,-24(s0)
	addi	a4,a5,1
	sd	a4,-24(s0)
	.loc 2 308 14
	ld	a4,-104(s0)
	lbu	a4,0(a4)
	.loc 2 308 12
	sb	a4,0(a5)
	.loc 2 311 4
	j	.L101
.L89:
	.loc 2 310 5
	ld	a5,-104(s0)
	addi	a5,a5,-1
	sd	a5,-104(s0)
.L101:
	.loc 2 311 4
	nop
.L87:
	.loc 2 314 6
	lw	a5,-32(s0)
	sext.w	a4,a5
	li	a5,76
	bne	a4,a5,.L91
	.loc 2 315 14
	lw	a5,-28(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	.loc 2 315 7
	beq	a5,zero,.L92
	.loc 2 316 33
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	.loc 2 316 9
	sd	a5,-56(s0)
	j	.L93
.L92:
	.loc 2 318 33
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	.loc 2 318 9
	sd	a5,-56(s0)
	j	.L93
.L91:
	.loc 2 319 13
	lw	a5,-32(s0)
	sext.w	a4,a5
	li	a5,104
	bne	a4,a5,.L94
	.loc 2 320 14
	lw	a5,-28(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	.loc 2 320 7
	beq	a5,zero,.L95
	.loc 2 321 40
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	.loc 2 321 11
	slliw	a5,a5,16
	sraiw	a5,a5,16
	.loc 2 321 9
	sd	a5,-56(s0)
	j	.L93
.L95:
	.loc 2 323 49
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	.loc 2 323 11
	slli	a5,a5,48
	srli	a5,a5,48
	.loc 2 323 9
	sd	a5,-56(s0)
	j	.L93
.L94:
	.loc 2 324 13
	lw	a5,-32(s0)
	sext.w	a4,a5
	li	a5,108
	bne	a4,a5,.L96
	.loc 2 325 14
	lw	a5,-28(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	.loc 2 325 7
	beq	a5,zero,.L97
	.loc 2 326 33
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	.loc 2 326 9
	sd	a5,-56(s0)
	j	.L93
.L97:
	.loc 2 328 9
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	ld	a5,0(a5)
	sd	a5,-56(s0)
	j	.L93
.L96:
	.loc 2 330 14
	lw	a5,-28(s0)
	andi	a5,a5,2
	sext.w	a5,a5
	.loc 2 330 7
	beq	a5,zero,.L98
	.loc 2 331 11
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	.loc 2 331 9
	sd	a5,-56(s0)
	j	.L93
.L98:
	.loc 2 333 33
	ld	a5,-112(s0)
	addi	a4,a5,8
	sd	a4,-112(s0)
	lw	a5,0(a5)
	.loc 2 333 9
	slli	a5,a5,32
	srli	a5,a5,32
	sd	a5,-56(s0)
.L93:
	.loc 2 335 9
	lw	a3,-76(s0)
	lw	a4,-80(s0)
	lw	a5,-28(s0)
	lw	a2,-60(s0)
	ld	a1,-56(s0)
	ld	a0,-24(s0)
	call	number
	sd	a0,-24(s0)
.L44:
	.loc 2 164 18
	ld	a5,-104(s0)
	addi	a5,a5,1
	sd	a5,-104(s0)
.L42:
	.loc 2 164 9 discriminator 1
	ld	a5,-104(s0)
	lbu	a5,0(a5)
	.loc 2 164 2 discriminator 1
	bne	a5,zero,.L99
	.loc 2 338 7
	ld	a5,-24(s0)
	sb	zero,0(a5)
	.loc 2 339 13
	ld	a4,-24(s0)
	ld	a5,-88(s0)
	sub	a5,a4,a5
	sext.w	a5,a5
	.loc 2 340 1
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
.LFE5:
	.size	myprintf, .-myprintf
	.align	2
	.globl	init_printk_done
	.type	init_printk_done, @function
init_printk_done:
.LFB6:
	.loc 2 343 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 346 18
	lla	a5,g_printk_status
	li	a4,1
	sw	a4,0(a5)
	.loc 2 348 9
	sd	zero,-24(s0)
	.loc 2 348 2
	j	.L103
.L104:
	.loc 2 349 22 discriminator 3
	lla	a4,log_buf
	ld	a5,-24(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 2 349 3 discriminator 3
	mv	a0,a5
	call	sbi_putchar
	.loc 2 348 33 discriminator 3
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L103:
	.loc 2 348 16 discriminator 1
	lla	a5,g_record_len
	ld	a5,0(a5)
	.loc 2 348 2 discriminator 1
	ld	a4,-24(s0)
	bltu	a4,a5,.L104
	.loc 2 351 11
	lla	a5,g_record
	lla	a4,log_buf
	sd	a4,0(a5)
	.loc 2 352 15
	lla	a5,g_record_len
	sd	zero,0(a5)
	.loc 2 353 1
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
.LFE6:
	.size	init_printk_done, .-init_printk_done
	.align	2
	.globl	printk
	.type	printk, @function
printk:
.LFB7:
	.loc 2 356 1
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	sd	ra,40(sp)
	sd	s0,32(sp)
	.cfi_offset 1, -72
	.cfi_offset 8, -80
	addi	s0,sp,48
	.cfi_def_cfa 8, 64
	sd	a0,-40(s0)
	sd	a1,8(s0)
	sd	a2,16(s0)
	sd	a3,24(s0)
	sd	a4,32(s0)
	sd	a5,40(s0)
	sd	a6,48(s0)
	sd	a7,56(s0)
	.loc 2 361 2
	addi	a5,s0,64
	sd	a5,-48(s0)
	ld	a5,-48(s0)
	addi	a5,a5,-56
	sd	a5,-32(s0)
	.loc 2 362 8
	ld	a5,-32(s0)
	mv	a3,a5
	ld	a2,-40(s0)
	li	a1,256
	lla	a0,print_buf
	call	myprintf
	mv	a5,a0
	sw	a5,-24(s0)
	.loc 2 366 22
	lla	a5,g_printk_status
	lw	a5,0(a5)
	.loc 2 366 5
	bne	a5,zero,.L106
	.loc 2 367 3
	lla	a5,g_record
	ld	a5,0(a5)
	lw	a4,-24(s0)
	mv	a2,a4
	lla	a1,print_buf
	mv	a0,a5
	call	memcpy
	.loc 2 368 22
	lw	a4,-24(s0)
	lla	a5,log_buf
	add	a4,a4,a5
	.loc 2 368 12
	lla	a5,g_record
	sd	a4,0(a5)
	.loc 2 369 16
	lw	a4,-24(s0)
	lla	a5,g_record_len
	ld	a5,0(a5)
	add	a4,a4,a5
	lla	a5,g_record_len
	sd	a4,0(a5)
	.loc 2 371 10
	li	a5,0
	j	.L113
.L106:
	.loc 2 374 9
	sw	zero,-20(s0)
	.loc 2 374 2
	j	.L108
.L112:
	.loc 2 375 22
	lla	a4,print_buf
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 2 375 12
	mv	a4,a5
	li	a5,10
	bne	a4,a5,.L109
	.loc 2 376 13
	li	a0,13
	call	sbi_putchar
.L109:
	.loc 2 377 24
	lla	a4,print_buf
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 2 377 3
	mv	a0,a5
	call	sbi_putchar
	.loc 2 378 9
	lw	a5,-20(s0)
	.loc 2 378 6
	mv	a4,a5
	li	a5,256
	bgtu	a4,a5,.L114
	.loc 2 374 24 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L108:
	.loc 2 374 2 discriminator 1
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L112
	j	.L111
.L114:
	.loc 2 379 4
	nop
.L111:
	.loc 2 381 9
	lw	a5,-24(s0)
.L113:
	.loc 2 382 1 discriminator 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	ld	s0,32(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 112
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE7:
	.size	printk, .-printk
.Letext0:
	.file 3 "include/stdarg.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x4c0
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF34
	.byte	0xc
	.4byte	.LASF35
	.4byte	.LASF36
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.4byte	.LASF37
	.byte	0x3
	.byte	0x8
	.byte	0x1b
	.4byte	0x39
	.byte	0x3
	.byte	0x8
	.4byte	.LASF38
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.byte	0x4
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.byte	0x4
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.byte	0x4
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.byte	0x6
	.4byte	0x95
	.4byte	0x95
	.byte	0x7
	.4byte	0x7e
	.byte	0xff
	.byte	0
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0x8
	.4byte	0x95
	.byte	0x9
	.4byte	.LASF10
	.byte	0x2
	.byte	0x9
	.byte	0xd
	.4byte	0x85
	.byte	0x9
	.byte	0x3
	.8byte	print_buf
	.byte	0x9
	.4byte	.LASF11
	.byte	0x2
	.byte	0xe
	.byte	0xd
	.4byte	0x85
	.byte	0x9
	.byte	0x3
	.8byte	log_buf
	.byte	0xa
	.4byte	.LASF39
	.byte	0x7
	.byte	0x4
	.4byte	0x62
	.byte	0x2
	.byte	0x10
	.byte	0x6
	.4byte	0xec
	.byte	0xb
	.4byte	.LASF12
	.byte	0
	.byte	0xb
	.4byte	.LASF13
	.byte	0x1
	.byte	0
	.byte	0x9
	.4byte	.LASF14
	.byte	0x2
	.byte	0x15
	.byte	0x1b
	.4byte	0xcd
	.byte	0x9
	.byte	0x3
	.8byte	g_printk_status
	.byte	0x9
	.4byte	.LASF15
	.byte	0x2
	.byte	0x16
	.byte	0xe
	.4byte	0x118
	.byte	0x9
	.byte	0x3
	.8byte	g_record
	.byte	0xc
	.byte	0x8
	.4byte	0x95
	.byte	0x9
	.4byte	.LASF16
	.byte	0x2
	.byte	0x17
	.byte	0x16
	.4byte	0x7e
	.byte	0x9
	.byte	0x3
	.8byte	g_record_len
	.byte	0xd
	.4byte	.LASF17
	.byte	0x2
	.2byte	0x163
	.byte	0x5
	.4byte	0x5b
	.8byte	.LFB7
	.8byte	.LFE7-.LFB7
	.byte	0x1
	.byte	0x9c
	.4byte	0x19b
	.byte	0xe
	.string	"fmt"
	.byte	0x2
	.2byte	0x163
	.byte	0x18
	.4byte	0x19b
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0xf
	.byte	0x10
	.string	"arg"
	.byte	0x2
	.2byte	0x165
	.byte	0xa
	.4byte	0x2d
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7f
	.byte	0x10
	.string	"len"
	.byte	0x2
	.2byte	0x166
	.byte	0x6
	.4byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x10
	.string	"i"
	.byte	0x2
	.2byte	0x167
	.byte	0x6
	.4byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0xac,0x7f
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x9c
	.byte	0x11
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x156
	.byte	0x6
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x1cf
	.byte	0x10
	.string	"i"
	.byte	0x2
	.2byte	0x158
	.byte	0x10
	.4byte	0x7e
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x12
	.4byte	.LASF18
	.byte	0x2
	.byte	0x93
	.byte	0x5
	.4byte	0x5b
	.8byte	.LFB5
	.8byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x2e5
	.byte	0x13
	.4byte	.LASF19
	.byte	0x2
	.byte	0x93
	.byte	0x14
	.4byte	0x118
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x13
	.4byte	.LASF20
	.byte	0x2
	.byte	0x93
	.byte	0x29
	.4byte	0x62
	.byte	0x3
	.byte	0x91
	.byte	0xa4,0x7f
	.byte	0x14
	.string	"fmt"
	.byte	0x2
	.byte	0x94
	.byte	0xf
	.4byte	0x19b
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0x14
	.string	"arg"
	.byte	0x2
	.byte	0x94
	.byte	0x1c
	.4byte	0x2d
	.byte	0x3
	.byte	0x91
	.byte	0x90,0x7f
	.byte	0x15
	.string	"pos"
	.byte	0x2
	.byte	0x96
	.byte	0x8
	.4byte	0x118
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x9
	.4byte	.LASF21
	.byte	0x2
	.byte	0x97
	.byte	0x6
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x9
	.4byte	.LASF22
	.byte	0x2
	.byte	0x98
	.byte	0x6
	.4byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x7f
	.byte	0x9
	.4byte	.LASF23
	.byte	0x2
	.byte	0x99
	.byte	0x6
	.4byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x9
	.4byte	.LASF24
	.byte	0x2
	.byte	0x9a
	.byte	0x6
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x15
	.string	"ip"
	.byte	0x2
	.byte	0x9b
	.byte	0x8
	.4byte	0x118
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x15
	.string	"s"
	.byte	0x2
	.byte	0x9c
	.byte	0x8
	.4byte	0x118
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x15
	.string	"i"
	.byte	0x2
	.byte	0x9d
	.byte	0x6
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x15
	.string	"len"
	.byte	0x2
	.byte	0x9e
	.byte	0x6
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x15
	.string	"num"
	.byte	0x2
	.byte	0x9f
	.byte	0x10
	.4byte	0x7e
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x9
	.4byte	.LASF25
	.byte	0x2
	.byte	0xa0
	.byte	0x6
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0x16
	.4byte	.LASF41
	.byte	0x2
	.byte	0xac
	.byte	0x1
	.8byte	.L45
	.byte	0
	.byte	0x17
	.4byte	.LASF32
	.byte	0x2
	.byte	0x38
	.byte	0xe
	.4byte	0x118
	.8byte	.LFB4
	.8byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0x3ef
	.byte	0x14
	.string	"str"
	.byte	0x2
	.byte	0x38
	.byte	0x1b
	.4byte	0x118
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7e
	.byte	0x14
	.string	"num"
	.byte	0x2
	.byte	0x38
	.byte	0x2e
	.4byte	0x7e
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7e
	.byte	0x13
	.4byte	.LASF25
	.byte	0x2
	.byte	0x38
	.byte	0x37
	.4byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0xac,0x7e
	.byte	0x13
	.4byte	.LASF20
	.byte	0x2
	.byte	0x38
	.byte	0x41
	.4byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7e
	.byte	0x13
	.4byte	.LASF23
	.byte	0x2
	.byte	0x38
	.byte	0x4b
	.4byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0xa4,0x7e
	.byte	0x13
	.4byte	.LASF26
	.byte	0x2
	.byte	0x39
	.byte	0x8
	.4byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0xa0,0x7e
	.byte	0x15
	.string	"c"
	.byte	0x2
	.byte	0x3b
	.byte	0x7
	.4byte	0x95
	.byte	0x2
	.byte	0x91
	.byte	0x5b
	.byte	0x9
	.4byte	.LASF27
	.byte	0x2
	.byte	0x3b
	.byte	0xa
	.4byte	0x95
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0x15
	.string	"tmp"
	.byte	0x2
	.byte	0x3b
	.byte	0x14
	.4byte	0x3ef
	.byte	0x3
	.byte	0x91
	.byte	0xc8,0x7e
	.byte	0x9
	.4byte	.LASF28
	.byte	0x2
	.byte	0x3c
	.byte	0x7
	.4byte	0x77
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x9
	.4byte	.LASF29
	.byte	0x2
	.byte	0x3e
	.byte	0xe
	.4byte	0x19b
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x15
	.string	"i"
	.byte	0x2
	.byte	0x3f
	.byte	0x6
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x18
	.8byte	.LBB3
	.8byte	.LBE3-.LBB3
	.byte	0x9
	.4byte	.LASF30
	.byte	0x2
	.byte	0x64
	.byte	0x26
	.4byte	0x62
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x9
	.4byte	.LASF31
	.byte	0x2
	.byte	0x64
	.byte	0x44
	.4byte	0x62
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0
	.byte	0x6
	.4byte	0x95
	.4byte	0x3ff
	.byte	0x7
	.4byte	0x7e
	.byte	0x7f
	.byte	0
	.byte	0x17
	.4byte	.LASF33
	.byte	0x2
	.byte	0x2b
	.byte	0x14
	.4byte	0x19b
	.8byte	.LFB3
	.8byte	.LFE3-.LFB3
	.byte	0x1
	.byte	0x9c
	.4byte	0x44f
	.byte	0x13
	.4byte	.LASF19
	.byte	0x2
	.byte	0x2b
	.byte	0x2c
	.4byte	0x19b
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x13
	.4byte	.LASF32
	.byte	0x2
	.byte	0x2b
	.byte	0x39
	.4byte	0x44f
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x15
	.string	"tmp"
	.byte	0x2
	.byte	0x2d
	.byte	0x6
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x5b
	.byte	0x19
	.4byte	.LASF42
	.byte	0x1
	.byte	0x24
	.byte	0x14
	.8byte	.LFB1
	.8byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.byte	0x14
	.string	"c"
	.byte	0x1
	.byte	0x24
	.byte	0x2e
	.4byte	0x46
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0x18
	.8byte	.LBB2
	.8byte	.LBE2-.LBB2
	.byte	0x15
	.string	"a0"
	.byte	0x1
	.byte	0x26
	.byte	0x1c
	.4byte	0x7e
	.byte	0x1
	.byte	0x5a
	.byte	0x15
	.string	"a1"
	.byte	0x1
	.byte	0x26
	.byte	0x57
	.4byte	0x7e
	.byte	0x1
	.byte	0x5b
	.byte	0x15
	.string	"a2"
	.byte	0x1
	.byte	0x26
	.byte	0x92
	.4byte	0x7e
	.byte	0x1
	.byte	0x5c
	.byte	0x15
	.string	"a7"
	.byte	0x1
	.byte	0x26
	.byte	0xcd
	.4byte	0x7e
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x4
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
	.byte	0x5
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
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x26
	.byte	0
	.byte	0x49
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
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0xb
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
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
	.byte	0xf
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
	.byte	0x2e
	.byte	0x1
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x19
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
.LASF24:
	.string	"qualifier"
.LASF38:
	.string	"__builtin_va_list"
.LASF22:
	.string	"field_width"
.LASF36:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_8\\\\lab8-1\\\\benos"
.LASF16:
	.string	"g_record_len"
.LASF13:
	.string	"PRINTK_STATUS_READY"
.LASF30:
	.string	"__base"
.LASF18:
	.string	"myprintf"
.LASF35:
	.string	"src/printk.c"
.LASF42:
	.string	"sbi_putchar"
.LASF37:
	.string	"va_list"
.LASF1:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF34:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF28:
	.string	"snum"
.LASF14:
	.string	"g_printk_status"
.LASF39:
	.string	"printk_status"
.LASF11:
	.string	"log_buf"
.LASF25:
	.string	"base"
.LASF4:
	.string	"unsigned int"
.LASF21:
	.string	"flags"
.LASF15:
	.string	"g_record"
.LASF6:
	.string	"long long unsigned int"
.LASF10:
	.string	"print_buf"
.LASF41:
	.string	"repeat"
.LASF32:
	.string	"number"
.LASF5:
	.string	"long long int"
.LASF23:
	.string	"precision"
.LASF9:
	.string	"char"
.LASF29:
	.string	"digits"
.LASF26:
	.string	"type"
.LASF2:
	.string	"short int"
.LASF17:
	.string	"printk"
.LASF33:
	.string	"scan_number"
.LASF12:
	.string	"PRINTK_STATUS_DOWN"
.LASF7:
	.string	"long int"
.LASF27:
	.string	"sign"
.LASF31:
	.string	"__rem"
.LASF0:
	.string	"signed char"
.LASF40:
	.string	"init_printk_done"
.LASF20:
	.string	"size"
.LASF19:
	.string	"string"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
