	.file	"sys-uart.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	read8, @function
read8:
.LFB0:
	.file 1 "include/io.h"
	.loc 1 11 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 12 12
	ld	a5,-24(s0)
	.loc 1 12 10
	lbu	a5,0(a5)
	andi	a5,a5,0xff
	.loc 1 13 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	read8, .-read8
	.align	2
	.type	read32, @function
read32:
.LFB2:
	.loc 1 21 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 1 22 12
	ld	a5,-24(s0)
	.loc 1 22 10
	lw	a5,0(a5)
	sext.w	a5,a5
	.loc 1 23 1
	mv	a0,a5
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	read32, .-read32
	.align	2
	.type	write32, @function
write32:
.LFB6:
	.loc 1 41 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	mv	a5,a1
	sw	a5,-28(s0)
	.loc 1 42 4
	ld	a5,-24(s0)
	.loc 1 42 30
	lw	a4,-28(s0)
	sw	a4,0(a5)
	.loc 1 43 1
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE6:
	.size	write32, .-write32
	.align	2
	.globl	uart_init
	.type	uart_init, @function
uart_init:
.LFB14:
	.file 2 "src/sys-uart.c"
	.loc 2 32 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 49 14
	li	a5,33554432
	addi	a5,a5,240
	sd	a5,-24(s0)
	.loc 2 50 15
	ld	a0,-24(s0)
	call	read32
	mv	a5,a0
	sw	a5,-28(s0)
	.loc 2 51 13
	lw	a4,-28(s0)
	li	a5,-4096
	addi	a5,a5,255
	and	a5,a4,a5
	sw	a5,-28(s0)
	.loc 2 52 13
	lw	a5,-28(s0)
	ori	a5,a5,768
	sw	a5,-28(s0)
	.loc 2 53 9
	lw	a5,-28(s0)
	mv	a1,a5
	ld	a0,-24(s0)
	call	write32
	.loc 2 55 15
	ld	a0,-24(s0)
	call	read32
	mv	a5,a0
	sw	a5,-28(s0)
	.loc 2 56 13
	lw	a4,-28(s0)
	li	a5,-983040
	addi	a5,a5,-1
	and	a5,a4,a5
	sw	a5,-28(s0)
	.loc 2 57 13
	lw	a4,-28(s0)
	li	a5,196608
	or	a5,a4,a5
	sw	a5,-28(s0)
	.loc 2 58 9
	lw	a5,-28(s0)
	mv	a1,a5
	ld	a0,-24(s0)
	call	write32
	.loc 2 61 7
	li	a5,33562624
	addi	a5,a5,-1780
	sd	a5,-24(s0)
	.loc 2 62 8
	ld	a0,-24(s0)
	call	read32
	mv	a5,a0
	sw	a5,-28(s0)
	.loc 2 63 6
	lw	a5,-28(s0)
	ori	a5,a5,1
	sw	a5,-28(s0)
	.loc 2 64 2
	lw	a5,-28(s0)
	mv	a1,a5
	ld	a0,-24(s0)
	call	write32
	.loc 2 67 7
	li	a5,33562624
	addi	a5,a5,-1780
	sd	a5,-24(s0)
	.loc 2 68 8
	ld	a0,-24(s0)
	call	read32
	mv	a5,a0
	sw	a5,-28(s0)
	.loc 2 69 6
	lw	a4,-28(s0)
	li	a5,65536
	or	a5,a4,a5
	sw	a5,-28(s0)
	.loc 2 70 2
	lw	a5,-28(s0)
	mv	a1,a5
	ld	a0,-24(s0)
	call	write32
	.loc 2 73 7
	li	a5,38797312
	sd	a5,-24(s0)
	.loc 2 74 2
	ld	a5,-24(s0)
	addi	a5,a5,4
	li	a1,0
	mv	a0,a5
	call	write32
	.loc 2 75 2
	ld	a5,-24(s0)
	addi	a5,a5,8
	li	a1,247
	mv	a0,a5
	call	write32
	.loc 2 76 2
	ld	a5,-24(s0)
	addi	a5,a5,16
	li	a1,0
	mv	a0,a5
	call	write32
	.loc 2 77 8
	ld	a5,-24(s0)
	addi	a5,a5,12
	mv	a0,a5
	call	read32
	mv	a5,a0
	sw	a5,-28(s0)
	.loc 2 78 6
	lw	a5,-28(s0)
	ori	a5,a5,128
	sw	a5,-28(s0)
	.loc 2 79 2
	ld	a5,-24(s0)
	addi	a5,a5,12
	lw	a4,-28(s0)
	mv	a1,a4
	mv	a0,a5
	call	write32
	.loc 2 80 2
	li	a1,13
	ld	a0,-24(s0)
	call	write32
	.loc 2 81 2
	ld	a5,-24(s0)
	addi	a5,a5,4
	li	a1,0
	mv	a0,a5
	call	write32
	.loc 2 82 8
	ld	a5,-24(s0)
	addi	a5,a5,12
	mv	a0,a5
	call	read32
	mv	a5,a0
	sw	a5,-28(s0)
	.loc 2 83 6
	lw	a5,-28(s0)
	andi	a5,a5,-129
	sw	a5,-28(s0)
	.loc 2 84 2
	ld	a5,-24(s0)
	addi	a5,a5,12
	lw	a4,-28(s0)
	mv	a1,a4
	mv	a0,a5
	call	write32
	.loc 2 85 8
	ld	a5,-24(s0)
	addi	a5,a5,12
	mv	a0,a5
	call	read32
	mv	a5,a0
	sw	a5,-28(s0)
	.loc 2 86 6
	lw	a5,-28(s0)
	andi	a5,a5,-32
	sw	a5,-28(s0)
	.loc 2 87 6
	lw	a5,-28(s0)
	ori	a5,a5,3
	sw	a5,-28(s0)
	.loc 2 88 2
	ld	a5,-24(s0)
	addi	a5,a5,12
	lw	a4,-28(s0)
	mv	a1,a4
	mv	a0,a5
	call	write32
	.loc 2 89 1
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
.LFE14:
	.size	uart_init, .-uart_init
	.align	2
	.globl	uart_send
	.type	uart_send, @function
uart_send:
.LFB15:
	.loc 2 92 1
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
	sb	a5,-33(s0)
	.loc 2 93 17
	li	a5,38797312
	sd	a5,-24(s0)
	.loc 2 95 7
	nop
.L8:
	.loc 2 95 9 discriminator 1
	ld	a5,-24(s0)
	addi	a5,a5,124
	mv	a0,a5
	call	read32
	mv	a5,a0
	sext.w	a5,a5
	.loc 2 95 29 discriminator 1
	andi	a5,a5,2
	sext.w	a5,a5
	.loc 2 95 7 discriminator 1
	beq	a5,zero,.L8
	.loc 2 96 2
	lbu	a5,-33(s0)
	sext.w	a5,a5
	mv	a1,a5
	ld	a0,-24(s0)
	call	write32
	.loc 2 97 1
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
.LFE15:
	.size	uart_send, .-uart_send
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB16:
	.loc 2 100 1
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
	.loc 2 101 2
	lw	a5,-20(s0)
	andi	a5,a5,0xff
	mv	a0,a5
	call	uart_send
	.loc 2 102 9
	lw	a5,-20(s0)
	.loc 2 103 1
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
.LFE16:
	.size	putchar, .-putchar
	.align	2
	.globl	uart_recv
	.type	uart_recv, @function
uart_recv:
.LFB17:
	.loc 2 106 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 107 17
	li	a5,38797312
	sd	a5,-24(s0)
	.loc 2 109 7
	nop
.L12:
	.loc 2 109 9 discriminator 1
	ld	a5,-24(s0)
	addi	a5,a5,124
	mv	a0,a5
	call	read32
	mv	a5,a0
	sext.w	a5,a5
	.loc 2 109 29 discriminator 1
	andi	a5,a5,8
	sext.w	a5,a5
	.loc 2 109 7 discriminator 1
	beq	a5,zero,.L12
	.loc 2 110 9
	ld	a0,-24(s0)
	call	read8
	mv	a5,a0
	.loc 2 111 1
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
	.size	uart_recv, .-uart_recv
	.align	2
	.globl	uart_send_string
	.type	uart_send_string, @function
uart_send_string:
.LFB18:
	.loc 2 114 1
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
	.loc 2 117 12
	sw	zero,-20(s0)
	.loc 2 117 5
	j	.L15
.L17:
	.loc 2 119 16
	lw	a5,-20(s0)
	ld	a4,-40(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 2 119 12
	mv	a4,a5
	li	a5,10
	bne	a4,a5,.L16
	.loc 2 120 13
	li	a0,13
	call	uart_send
.L16:
	.loc 2 121 29 discriminator 2
	lw	a5,-20(s0)
	ld	a4,-40(s0)
	add	a5,a4,a5
	.loc 2 121 9 discriminator 2
	lbu	a5,0(a5)
	mv	a0,a5
	call	uart_send
	.loc 2 117 34 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L15:
	.loc 2 117 20 discriminator 1
	lw	a5,-20(s0)
	ld	a4,-40(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 2 117 5 discriminator 1
	bne	a5,zero,.L17
	.loc 2 123 1
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
.LFE18:
	.size	uart_send_string, .-uart_send_string
	.align	2
	.type	vpf_str_to_num, @function
vpf_str_to_num:
.LFB19:
	.loc 2 126 1
	.cfi_startproc
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sd	s0,56(sp)
	.cfi_offset 8, -8
	addi	s0,sp,64
	.cfi_def_cfa 8, 0
	sd	a0,-56(s0)
	sd	a1,-64(s0)
	.loc 2 130 6
	sw	zero,-28(s0)
	.loc 2 131 8
	ld	a5,-56(s0)
	sd	a5,-24(s0)
	.loc 2 131 2
	j	.L19
.L24:
	.loc 2 133 10
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	.loc 2 133 20
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L20
	.loc 2 133 23 discriminator 1
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	.loc 2 133 20 discriminator 1
	mv	a4,a5
	li	a5,57
	bgtu	a4,a5,.L20
	.loc 2 133 20 is_stmt 0 discriminator 3
	li	a5,1
	j	.L21
.L20:
	.loc 2 133 20 discriminator 4
	li	a5,0
.L21:
	.loc 2 133 7 is_stmt 1 discriminator 6
	sw	a5,-32(s0)
	.loc 2 134 5 discriminator 6
	lw	a5,-32(s0)
	sext.w	a5,a5
	beq	a5,zero,.L26
	.loc 2 136 7 discriminator 2
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	sext.w	a5,a5
	.loc 2 136 5 discriminator 2
	addiw	a5,a5,-48
	sw	a5,-36(s0)
	.loc 2 137 7 discriminator 2
	lw	a4,-28(s0)
	mv	a5,a4
	slliw	a5,a5,2
	addw	a5,a5,a4
	slliw	a5,a5,1
	sw	a5,-28(s0)
	.loc 2 138 7 discriminator 2
	lw	a4,-28(s0)
	lw	a5,-36(s0)
	addw	a5,a4,a5
	sw	a5,-28(s0)
	.loc 2 131 30 discriminator 2
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L19:
	.loc 2 131 15 discriminator 1
	ld	a5,-56(s0)
	lbu	a5,0(a5)
	.loc 2 131 2 discriminator 1
	bne	a5,zero,.L24
	j	.L23
.L26:
	.loc 2 135 4
	nop
.L23:
	.loc 2 140 7
	ld	a5,-64(s0)
	lw	a4,-28(s0)
	sw	a4,0(a5)
	.loc 2 141 18
	ld	a4,-24(s0)
	ld	a5,-56(s0)
	sub	a5,a4,a5
	.loc 2 141 10
	sext.w	a5,a5
	.loc 2 142 1
	mv	a0,a5
	ld	s0,56(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 64
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE19:
	.size	vpf_str_to_num, .-vpf_str_to_num
	.align	2
	.type	vpf_num_to_str, @function
vpf_num_to_str:
.LFB20:
	.loc 2 145 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	mv	a5,a0
	mv	a4,a3
	sw	a5,-68(s0)
	mv	a5,a1
	sw	a5,-72(s0)
	mv	a5,a2
	sw	a5,-76(s0)
	mv	a5,a4
	sw	a5,-80(s0)
	.loc 2 150 8
	sw	zero,-28(s0)
	.loc 2 150 2
	j	.L28
.L29:
	.loc 2 151 10 discriminator 3
	lw	a5,-80(s0)
	andi	a4,a5,0xff
	lw	a5,-28(s0)
	addi	a3,s0,-16
	add	a5,a3,a5
	sb	a4,-48(a5)
	.loc 2 150 31 discriminator 3
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L28:
	.loc 2 150 15 discriminator 1
	lw	a5,-28(s0)
	.loc 2 150 2 discriminator 1
	mv	a4,a5
	li	a5,31
	bleu	a4,a5,.L29
	.loc 2 152 7
	li	a5,10
	sw	a5,-20(s0)
	.loc 2 153 4
	lw	a5,-72(s0)
	sext.w	a5,a5
	beq	a5,zero,.L30
	.loc 2 154 8
	li	a5,16
	sw	a5,-20(s0)
.L30:
	.loc 2 156 6
	sw	zero,-24(s0)
.L33:
	.loc 2 158 9
	lw	a4,-68(s0)
	lw	a5,-20(s0)
	remuw	a5,a4,a5
	sext.w	a5,a5
	.loc 2 158 5
	sw	a5,-32(s0)
	.loc 2 159 5
	lw	a5,-32(s0)
	sext.w	a4,a5
	li	a5,9
	ble	a4,a5,.L31
	.loc 2 160 22
	lw	a5,-32(s0)
	andi	a5,a5,0xff
	addiw	a5,a5,87
	andi	a4,a5,0xff
	.loc 2 160 13
	lw	a5,-24(s0)
	addi	a3,s0,-16
	add	a5,a3,a5
	sb	a4,-48(a5)
	j	.L32
.L31:
	.loc 2 162 17
	lw	a5,-32(s0)
	andi	a5,a5,0xff
	addiw	a5,a5,48
	andi	a4,a5,0xff
	.loc 2 162 13
	lw	a5,-24(s0)
	addi	a3,s0,-16
	add	a5,a3,a5
	sb	a4,-48(a5)
.L32:
	.loc 2 163 5
	lw	a4,-68(s0)
	lw	a5,-20(s0)
	divuw	a5,a4,a5
	sw	a5,-68(s0)
	.loc 2 164 6
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
	.loc 2 165 2
	lw	a5,-68(s0)
	sext.w	a5,a5
	bne	a5,zero,.L33
	.loc 2 167 4
	lw	a5,-76(s0)
	sext.w	a5,a5
	ble	a5,zero,.L34
	.loc 2 169 9
	lw	a5,-76(s0)
	.loc 2 169 5
	mv	a4,a5
	li	a5,31
	bleu	a4,a5,.L35
	.loc 2 170 7
	li	a5,31
	sw	a5,-76(s0)
.L35:
	.loc 2 171 5
	lw	a4,-24(s0)
	lw	a5,-76(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L34
	.loc 2 172 8
	lw	a5,-76(s0)
	sw	a5,-24(s0)
.L34:
	.loc 2 174 11
	lw	a5,-24(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	sb	zero,-48(a5)
	.loc 2 176 8
	lw	a5,-24(s0)
	addiw	a5,a5,-1
	sw	a5,-28(s0)
	.loc 2 176 2
	j	.L36
.L37:
	.loc 2 177 3 discriminator 3
	lw	a5,-28(s0)
	addi	a4,s0,-16
	add	a5,a4,a5
	lbu	a5,-48(a5)
	mv	a0,a5
	call	uart_send
	.loc 2 176 28 discriminator 3
	lw	a5,-28(s0)
	addiw	a5,a5,-1
	sw	a5,-28(s0)
.L36:
	.loc 2 176 2 discriminator 1
	lw	a5,-28(s0)
	sext.w	a5,a5
	bge	a5,zero,.L37
	.loc 2 178 1
	nop
	nop
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE20:
	.size	vpf_num_to_str, .-vpf_num_to_str
	.align	2
	.type	vpf, @function
vpf:
.LFB21:
	.loc 2 181 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	sd	a0,-72(s0)
	sd	a1,-80(s0)
	.loc 2 186 5
	li	a5,32
	sw	a5,-44(s0)
	.loc 2 187 8
	ld	a5,-72(s0)
	sd	a5,-24(s0)
	.loc 2 187 2
	j	.L39
.L49:
	.loc 2 189 5
	sw	zero,-36(s0)
	.loc 2 190 6
	sw	zero,-60(s0)
	.loc 2 191 7
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	.loc 2 191 5
	sw	a5,-48(s0)
	.loc 2 192 5
	ld	a5,-24(s0)
	sd	a5,-32(s0)
	.loc 2 193 6
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	.loc 2 193 5
	mv	a4,a5
	li	a5,37
	bne	a4,a5,.L40
	.loc 2 195 6
	ld	a5,-24(s0)
	sd	a5,-32(s0)
	.loc 2 196 5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	.loc 2 197 7
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	.loc 2 197 6
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L41
	.loc 2 197 20 discriminator 1
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	.loc 2 197 17 discriminator 1
	mv	a4,a5
	li	a5,57
	bgtu	a4,a5,.L41
	.loc 2 198 10
	addi	a5,s0,-60
	mv	a1,a5
	ld	a0,-24(s0)
	call	vpf_str_to_num
	mv	a5,a0
	mv	a4,a5
	.loc 2 198 7
	ld	a5,-24(s0)
	add	a5,a5,a4
	sd	a5,-24(s0)
.L41:
	.loc 2 199 8
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	.loc 2 199 6
	sw	a5,-36(s0)
.L40:
	.loc 2 201 5
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,100
	beq	a4,a5,.L42
	.loc 2 201 17 discriminator 1
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,120
	bne	a4,a5,.L43
.L42:
	.loc 2 203 8
	ld	a5,-80(s0)
	addi	a4,a5,8
	sd	a4,-80(s0)
	lw	a5,0(a5)
	sw	a5,-56(s0)
	.loc 2 204 4
	lw	a0,-56(s0)
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,120
	sub	a5,a4,a5
	seqz	a5,a5
	andi	a5,a5,0xff
	sext.w	a5,a5
	lw	a4,-60(s0)
	lw	a3,-44(s0)
	mv	a2,a4
	mv	a1,a5
	call	vpf_num_to_str
	j	.L44
.L43:
	.loc 2 208 10
	sw	zero,-40(s0)
	.loc 2 208 4
	j	.L45
.L46:
	.loc 2 209 16 discriminator 3
	lw	a5,-40(s0)
	ld	a4,-32(s0)
	add	a5,a4,a5
	.loc 2 209 5 discriminator 3
	lbu	a5,0(a5)
	mv	a0,a5
	call	uart_send
	.loc 2 208 29 discriminator 3
	lw	a5,-40(s0)
	addiw	a5,a5,1
	sw	a5,-40(s0)
.L45:
	.loc 2 208 17 discriminator 1
	lw	a4,-40(s0)
	.loc 2 208 22 discriminator 1
	ld	a3,-24(s0)
	ld	a5,-32(s0)
	sub	a5,a3,a5
	.loc 2 208 4 discriminator 1
	blt	a4,a5,.L46
	.loc 2 210 8
	lw	a5,-36(s0)
	sext.w	a5,a5
	beq	a5,zero,.L47
	.loc 2 210 8 is_stmt 0 discriminator 1
	lw	a5,-36(s0)
	andi	a5,a5,0xff
	j	.L48
.L47:
	.loc 2 210 8 discriminator 2
	lw	a5,-48(s0)
	andi	a5,a5,0xff
.L48:
	.loc 2 210 6 is_stmt 1 discriminator 4
	sb	a5,-49(s0)
	.loc 2 211 4 discriminator 4
	lbu	a5,-49(s0)
	mv	a0,a5
	call	uart_send
.L44:
	.loc 2 187 28 discriminator 2
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
.L39:
	.loc 2 187 15 discriminator 1
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	.loc 2 187 2 discriminator 1
	bne	a5,zero,.L49
	.loc 2 214 9
	li	a5,0
	.loc 2 215 1
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	vpf, .-vpf
	.align	2
	.globl	sys_uart_printf
	.type	sys_uart_printf, @function
sys_uart_printf:
.LFB22:
	.loc 2 218 1
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
	.loc 2 222 2
	addi	a5,s0,64
	sd	a5,-48(s0)
	ld	a5,-48(s0)
	addi	a5,a5,-56
	sd	a5,-24(s0)
	.loc 2 223 2
	ld	a5,-24(s0)
	mv	a1,a5
	ld	a0,-40(s0)
	call	vpf
	.loc 2 226 9
	li	a5,0
	.loc 2 227 1
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
.LFE22:
	.size	sys_uart_printf, .-sys_uart_printf
	.align	2
	.globl	print_hex
	.type	print_hex, @function
print_hex:
.LFB23:
	.loc 2 231 1
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
	sw	a5,-36(s0)
	.loc 2 235 5
	li	a0,48
	call	uart_send
	.loc 2 236 5
	li	a0,120
	call	uart_send
	.loc 2 238 12
	li	a5,7
	sw	a5,-20(s0)
	.loc 2 238 5
	j	.L54
.L57:
	.loc 2 240 23
	lw	a5,-20(s0)
	slliw	a5,a5,2
	sext.w	a5,a5
	.loc 2 240 19
	mv	a4,a5
	lw	a5,-36(s0)
	srlw	a5,a5,a4
	sext.w	a5,a5
	.loc 2 240 28
	sext.w	a5,a5
	.loc 2 240 14
	andi	a5,a5,15
	sw	a5,-24(s0)
	.loc 2 241 12
	lw	a5,-24(s0)
	sext.w	a4,a5
	li	a5,9
	bgt	a4,a5,.L55
	.loc 2 242 13
	lw	a5,-24(s0)
	andi	a5,a5,0xff
	addiw	a5,a5,48
	andi	a5,a5,0xff
	mv	a0,a5
	call	uart_send
	j	.L56
.L55:
	.loc 2 244 13
	lw	a5,-24(s0)
	andi	a5,a5,0xff
	addiw	a5,a5,55
	andi	a5,a5,0xff
	mv	a0,a5
	call	uart_send
.L56:
	.loc 2 238 26 discriminator 2
	lw	a5,-20(s0)
	addiw	a5,a5,-1
	sw	a5,-20(s0)
.L54:
	.loc 2 238 5 discriminator 1
	lw	a5,-20(s0)
	sext.w	a5,a5
	bge	a5,zero,.L57
	.loc 2 246 1
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
.LFE23:
	.size	print_hex, .-print_hex
.Letext0:
	.file 3 "include/types.h"
	.file 4 "include/stdarg.h"
	.file 5 "include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x4f5
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF31
	.byte	0xc
	.4byte	.LASF32
	.4byte	.LASF33
	.8byte	.Ltext0
	.8byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF4
	.byte	0x3
	.byte	0x9
	.byte	0x17
	.4byte	0x40
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
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF5
	.byte	0x3
	.byte	0xf
	.byte	0x16
	.4byte	0x68
	.byte	0x2
	.byte	0x4
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
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.byte	0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x24
	.byte	0x1c
	.4byte	0x76
	.byte	0x3
	.4byte	.LASF12
	.byte	0x4
	.byte	0x8
	.byte	0x1b
	.4byte	0xa3
	.byte	0x5
	.byte	0x8
	.4byte	.LASF34
	.byte	0x3
	.4byte	.LASF13
	.byte	0x5
	.byte	0x11
	.byte	0xf
	.4byte	0x5c
	.byte	0x6
	.4byte	.LASF18
	.byte	0x2
	.byte	0xe6
	.byte	0x6
	.8byte	.LFB23
	.8byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0xff
	.byte	0x7
	.string	"val"
	.byte	0x2
	.byte	0xe6
	.byte	0x1d
	.4byte	0x68
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x8
	.string	"i"
	.byte	0x2
	.byte	0xe8
	.byte	0x9
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x9
	.4byte	.LASF14
	.byte	0x2
	.byte	0xe9
	.byte	0x9
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xa
	.4byte	.LASF20
	.byte	0x2
	.byte	0xd9
	.byte	0x5
	.4byte	0x55
	.8byte	.LFB22
	.8byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x142
	.byte	0x7
	.string	"fmt"
	.byte	0x2
	.byte	0xd9
	.byte	0x22
	.4byte	0x142
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0xb
	.byte	0x8
	.string	"va"
	.byte	0x2
	.byte	0xdc
	.byte	0xa
	.4byte	0x97
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x14f
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.byte	0xd
	.4byte	0x148
	.byte	0xe
	.string	"vpf"
	.byte	0x2
	.byte	0xb4
	.byte	0xc
	.4byte	0x55
	.8byte	.LFB21
	.8byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x20f
	.byte	0x7
	.string	"fmt"
	.byte	0x2
	.byte	0xb4
	.byte	0x1d
	.4byte	0x142
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x7
	.string	"va"
	.byte	0x2
	.byte	0xb4
	.byte	0x2a
	.4byte	0x97
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x8
	.string	"p"
	.byte	0x2
	.byte	0xb6
	.byte	0xf
	.4byte	0x142
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x8
	.string	"q"
	.byte	0x2
	.byte	0xb6
	.byte	0x14
	.4byte	0x142
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x8
	.string	"f"
	.byte	0x2
	.byte	0xb7
	.byte	0x6
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x8
	.string	"c"
	.byte	0x2
	.byte	0xb7
	.byte	0x9
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x8
	.string	"vai"
	.byte	0x2
	.byte	0xb7
	.byte	0xc
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x8
	.string	"pl"
	.byte	0x2
	.byte	0xb7
	.byte	0x11
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0x8
	.string	"pc"
	.byte	0x2
	.byte	0xb7
	.byte	0x15
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x8
	.string	"i"
	.byte	0x2
	.byte	0xb7
	.byte	0x19
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x8
	.string	"t"
	.byte	0x2
	.byte	0xb8
	.byte	0x10
	.4byte	0x40
	.byte	0x2
	.byte	0x91
	.byte	0x4f
	.byte	0
	.byte	0xf
	.4byte	.LASF26
	.byte	0x2
	.byte	0x90
	.byte	0xd
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x2b1
	.byte	0x7
	.string	"a"
	.byte	0x2
	.byte	0x90
	.byte	0x25
	.4byte	0xa9
	.byte	0x3
	.byte	0x91
	.byte	0xbc,0x7f
	.byte	0x7
	.string	"ish"
	.byte	0x2
	.byte	0x90
	.byte	0x2c
	.4byte	0x55
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x7
	.string	"pl"
	.byte	0x2
	.byte	0x90
	.byte	0x35
	.4byte	0x55
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x7f
	.byte	0x7
	.string	"pc"
	.byte	0x2
	.byte	0x90
	.byte	0x3d
	.4byte	0x55
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x8
	.string	"buf"
	.byte	0x2
	.byte	0x92
	.byte	0x7
	.4byte	0x2b1
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x9
	.4byte	.LASF16
	.byte	0x2
	.byte	0x93
	.byte	0xb
	.4byte	0xa9
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x8
	.string	"idx"
	.byte	0x2
	.byte	0x94
	.byte	0x6
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x8
	.string	"i"
	.byte	0x2
	.byte	0x94
	.byte	0xb
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x8
	.string	"t"
	.byte	0x2
	.byte	0x94
	.byte	0xe
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0x10
	.4byte	0x148
	.4byte	0x2c1
	.byte	0x11
	.4byte	0x84
	.byte	0x1f
	.byte	0
	.byte	0x12
	.4byte	.LASF17
	.byte	0x2
	.byte	0x7d
	.byte	0xc
	.4byte	0x55
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x33a
	.byte	0x7
	.string	"fmt"
	.byte	0x2
	.byte	0x7d
	.byte	0x28
	.4byte	0x142
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x7
	.string	"num"
	.byte	0x2
	.byte	0x7d
	.byte	0x33
	.4byte	0x33a
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x8
	.string	"p"
	.byte	0x2
	.byte	0x7f
	.byte	0xf
	.4byte	0x142
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x8
	.string	"res"
	.byte	0x2
	.byte	0x80
	.byte	0x6
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x8
	.string	"d"
	.byte	0x2
	.byte	0x80
	.byte	0xb
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x8
	.string	"isd"
	.byte	0x2
	.byte	0x80
	.byte	0xe
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x55
	.byte	0x6
	.4byte	.LASF19
	.byte	0x2
	.byte	0x71
	.byte	0x6
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x37b
	.byte	0x7
	.string	"str"
	.byte	0x2
	.byte	0x71
	.byte	0x1d
	.4byte	0x37b
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x8
	.string	"i"
	.byte	0x2
	.byte	0x73
	.byte	0x9
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x148
	.byte	0xa
	.4byte	.LASF21
	.byte	0x2
	.byte	0x69
	.byte	0x6
	.4byte	0x148
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x3b3
	.byte	0x9
	.4byte	.LASF22
	.byte	0x2
	.byte	0x6b
	.byte	0x11
	.4byte	0x8b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xa
	.4byte	.LASF23
	.byte	0x2
	.byte	0x63
	.byte	0x5
	.4byte	0x55
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x3e3
	.byte	0x7
	.string	"c"
	.byte	0x2
	.byte	0x63
	.byte	0x11
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x6
	.4byte	.LASF24
	.byte	0x2
	.byte	0x5b
	.byte	0x6
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x41e
	.byte	0x7
	.string	"c"
	.byte	0x2
	.byte	0x5b
	.byte	0x15
	.4byte	0x148
	.byte	0x2
	.byte	0x91
	.byte	0x5f
	.byte	0x9
	.4byte	.LASF22
	.byte	0x2
	.byte	0x5d
	.byte	0x11
	.4byte	0x8b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x6
	.4byte	.LASF25
	.byte	0x2
	.byte	0x1f
	.byte	0x6
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x45b
	.byte	0x9
	.4byte	.LASF22
	.byte	0x2
	.byte	0x21
	.byte	0x11
	.4byte	0x8b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x8
	.string	"val"
	.byte	0x2
	.byte	0x22
	.byte	0x8
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0x13
	.4byte	.LASF27
	.byte	0x1
	.byte	0x28
	.byte	0x14
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x498
	.byte	0x14
	.4byte	.LASF22
	.byte	0x1
	.byte	0x28
	.byte	0x2b
	.4byte	0x8b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x14
	.4byte	.LASF28
	.byte	0x1
	.byte	0x28
	.byte	0x37
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0x12
	.4byte	.LASF29
	.byte	0x1
	.byte	0x14
	.byte	0x15
	.4byte	0x5c
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x4ca
	.byte	0x14
	.4byte	.LASF22
	.byte	0x1
	.byte	0x14
	.byte	0x2b
	.4byte	0x8b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x15
	.4byte	.LASF30
	.byte	0x1
	.byte	0xa
	.byte	0x14
	.4byte	0x34
	.8byte	.LFB0
	.8byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.byte	0x14
	.4byte	.LASF22
	.byte	0x1
	.byte	0xa
	.byte	0x29
	.4byte	0x8b
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
	.byte	0x4
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
	.byte	0x5
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0xb
	.byte	0x18
	.byte	0
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0x8
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
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
.LASF34:
	.string	"__builtin_va_list"
.LASF28:
	.string	"value"
.LASF22:
	.string	"addr"
.LASF25:
	.string	"uart_init"
.LASF12:
	.string	"va_list"
.LASF1:
	.string	"unsigned char"
.LASF29:
	.string	"read32"
.LASF10:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF18:
	.string	"print_hex"
.LASF31:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF11:
	.string	"virtual_addr_t"
.LASF19:
	.string	"uart_send_string"
.LASF17:
	.string	"vpf_str_to_num"
.LASF33:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_6\\\\lab6-3\\\\benos"
.LASF32:
	.string	"src/sys-uart.c"
.LASF16:
	.string	"base"
.LASF6:
	.string	"unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF23:
	.string	"putchar"
.LASF4:
	.string	"u8_t"
.LASF21:
	.string	"uart_recv"
.LASF20:
	.string	"sys_uart_printf"
.LASF7:
	.string	"long long int"
.LASF27:
	.string	"write32"
.LASF15:
	.string	"char"
.LASF14:
	.string	"bits"
.LASF24:
	.string	"uart_send"
.LASF2:
	.string	"short int"
.LASF26:
	.string	"vpf_num_to_str"
.LASF5:
	.string	"u32_t"
.LASF13:
	.string	"uint32_t"
.LASF9:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF30:
	.string	"read8"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
