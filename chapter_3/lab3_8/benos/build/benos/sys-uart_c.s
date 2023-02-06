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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 1 12 12
	ld	a5,8(sp)
	.loc 1 12 10
	lbu	a5,0(a5)
	andi	a5,a5,0xff
	.loc 1 13 1
	mv	a0,a5
	addi	sp,sp,16
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	.loc 1 22 12
	ld	a5,8(sp)
	.loc 1 22 10
	lw	a5,0(a5)
	sext.w	a5,a5
	.loc 1 23 1
	mv	a0,a5
	addi	sp,sp,16
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
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	a0,8(sp)
	mv	a5,a1
	sw	a5,4(sp)
	.loc 1 42 4
	ld	a5,8(sp)
	.loc 1 42 30
	lw	a4,4(sp)
	sw	a4,0(a5)
	.loc 1 43 1
	nop
	addi	sp,sp,16
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
	.cfi_offset 1, -8
	.loc 2 49 14
	li	a5,33554432
	addi	a5,a5,240
	sd	a5,8(sp)
	.loc 2 50 15
	ld	a0,8(sp)
	call	read32
	mv	a5,a0
	sw	a5,4(sp)
	.loc 2 51 13
	lw	a4,4(sp)
	li	a5,-4096
	addi	a5,a5,255
	and	a5,a4,a5
	sw	a5,4(sp)
	.loc 2 52 13
	lw	a5,4(sp)
	ori	a5,a5,768
	sw	a5,4(sp)
	.loc 2 53 9
	lw	a5,4(sp)
	mv	a1,a5
	ld	a0,8(sp)
	call	write32
	.loc 2 55 15
	ld	a0,8(sp)
	call	read32
	mv	a5,a0
	sw	a5,4(sp)
	.loc 2 56 13
	lw	a4,4(sp)
	li	a5,-983040
	addi	a5,a5,-1
	and	a5,a4,a5
	sw	a5,4(sp)
	.loc 2 57 13
	lw	a4,4(sp)
	li	a5,196608
	or	a5,a4,a5
	sw	a5,4(sp)
	.loc 2 58 9
	lw	a5,4(sp)
	mv	a1,a5
	ld	a0,8(sp)
	call	write32
	.loc 2 61 7
	li	a5,33562624
	addi	a5,a5,-1780
	sd	a5,8(sp)
	.loc 2 62 8
	ld	a0,8(sp)
	call	read32
	mv	a5,a0
	sw	a5,4(sp)
	.loc 2 63 6
	lw	a5,4(sp)
	ori	a5,a5,1
	sw	a5,4(sp)
	.loc 2 64 2
	lw	a5,4(sp)
	mv	a1,a5
	ld	a0,8(sp)
	call	write32
	.loc 2 67 7
	li	a5,33562624
	addi	a5,a5,-1780
	sd	a5,8(sp)
	.loc 2 68 8
	ld	a0,8(sp)
	call	read32
	mv	a5,a0
	sw	a5,4(sp)
	.loc 2 69 6
	lw	a4,4(sp)
	li	a5,65536
	or	a5,a4,a5
	sw	a5,4(sp)
	.loc 2 70 2
	lw	a5,4(sp)
	mv	a1,a5
	ld	a0,8(sp)
	call	write32
	.loc 2 73 7
	li	a5,38797312
	sd	a5,8(sp)
	.loc 2 74 2
	ld	a5,8(sp)
	addi	a5,a5,4
	li	a1,0
	mv	a0,a5
	call	write32
	.loc 2 75 2
	ld	a5,8(sp)
	addi	a5,a5,8
	li	a1,247
	mv	a0,a5
	call	write32
	.loc 2 76 2
	ld	a5,8(sp)
	addi	a5,a5,16
	li	a1,0
	mv	a0,a5
	call	write32
	.loc 2 77 8
	ld	a5,8(sp)
	addi	a5,a5,12
	mv	a0,a5
	call	read32
	mv	a5,a0
	sw	a5,4(sp)
	.loc 2 78 6
	lw	a5,4(sp)
	ori	a5,a5,128
	sw	a5,4(sp)
	.loc 2 79 2
	ld	a5,8(sp)
	addi	a5,a5,12
	lw	a4,4(sp)
	mv	a1,a4
	mv	a0,a5
	call	write32
	.loc 2 80 2
	li	a1,13
	ld	a0,8(sp)
	call	write32
	.loc 2 81 2
	ld	a5,8(sp)
	addi	a5,a5,4
	li	a1,0
	mv	a0,a5
	call	write32
	.loc 2 82 8
	ld	a5,8(sp)
	addi	a5,a5,12
	mv	a0,a5
	call	read32
	mv	a5,a0
	sw	a5,4(sp)
	.loc 2 83 6
	lw	a5,4(sp)
	andi	a5,a5,-129
	sw	a5,4(sp)
	.loc 2 84 2
	ld	a5,8(sp)
	addi	a5,a5,12
	lw	a4,4(sp)
	mv	a1,a4
	mv	a0,a5
	call	write32
	.loc 2 85 8
	ld	a5,8(sp)
	addi	a5,a5,12
	mv	a0,a5
	call	read32
	mv	a5,a0
	sw	a5,4(sp)
	.loc 2 86 6
	lw	a5,4(sp)
	andi	a5,a5,-32
	sw	a5,4(sp)
	.loc 2 87 6
	lw	a5,4(sp)
	ori	a5,a5,3
	sw	a5,4(sp)
	.loc 2 88 2
	ld	a5,8(sp)
	addi	a5,a5,12
	lw	a4,4(sp)
	mv	a1,a4
	mv	a0,a5
	call	write32
	.loc 2 89 1
	nop
	ld	ra,24(sp)
	.cfi_restore 1
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
	.cfi_offset 1, -8
	mv	a5,a0
	sb	a5,15(sp)
	.loc 2 93 17
	li	a5,38797312
	sd	a5,24(sp)
	.loc 2 95 7
	nop
.L8:
	.loc 2 95 9 discriminator 1
	ld	a5,24(sp)
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
	lbu	a5,15(sp)
	sext.w	a5,a5
	mv	a1,a5
	ld	a0,24(sp)
	call	write32
	.loc 2 97 1
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE15:
	.size	uart_send, .-uart_send
	.align	2
	.globl	uart_recv
	.type	uart_recv, @function
uart_recv:
.LFB16:
	.loc 2 100 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	.cfi_offset 1, -8
	.loc 2 101 17
	li	a5,38797312
	sd	a5,8(sp)
	.loc 2 103 7
	nop
.L10:
	.loc 2 103 9 discriminator 1
	ld	a5,8(sp)
	addi	a5,a5,124
	mv	a0,a5
	call	read32
	mv	a5,a0
	sext.w	a5,a5
	.loc 2 103 29 discriminator 1
	andi	a5,a5,8
	sext.w	a5,a5
	.loc 2 103 7 discriminator 1
	beq	a5,zero,.L10
	.loc 2 104 9
	ld	a0,8(sp)
	call	read8
	mv	a5,a0
	.loc 2 105 1
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE16:
	.size	uart_recv, .-uart_recv
	.align	2
	.globl	uart_send_string
	.type	uart_send_string, @function
uart_send_string:
.LFB17:
	.loc 2 108 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	.loc 2 111 12
	sw	zero,28(sp)
	.loc 2 111 5
	j	.L13
.L14:
	.loc 2 112 29 discriminator 3
	lw	a5,28(sp)
	ld	a4,8(sp)
	add	a5,a4,a5
	.loc 2 112 9 discriminator 3
	lbu	a5,0(a5)
	mv	a0,a5
	call	uart_send
	.loc 2 111 34 discriminator 3
	lw	a5,28(sp)
	addiw	a5,a5,1
	sw	a5,28(sp)
.L13:
	.loc 2 111 20 discriminator 1
	lw	a5,28(sp)
	ld	a4,8(sp)
	add	a5,a4,a5
	lbu	a5,0(a5)
	.loc 2 111 5 discriminator 1
	bne	a5,zero,.L14
	.loc 2 113 1
	nop
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE17:
	.size	uart_send_string, .-uart_send_string
	.align	2
	.type	vpf_str_to_num, @function
vpf_str_to_num:
.LFB18:
	.loc 2 116 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 2 120 6
	sw	zero,36(sp)
	.loc 2 121 8
	ld	a5,8(sp)
	sd	a5,40(sp)
	.loc 2 121 2
	j	.L16
.L21:
	.loc 2 123 10
	ld	a5,40(sp)
	lbu	a5,0(a5)
	.loc 2 123 20
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L17
	.loc 2 123 23 discriminator 1
	ld	a5,40(sp)
	lbu	a5,0(a5)
	.loc 2 123 20 discriminator 1
	mv	a4,a5
	li	a5,57
	bgtu	a4,a5,.L17
	.loc 2 123 20 is_stmt 0 discriminator 3
	li	a5,1
	j	.L18
.L17:
	.loc 2 123 20 discriminator 4
	li	a5,0
.L18:
	.loc 2 123 7 is_stmt 1 discriminator 6
	sw	a5,32(sp)
	.loc 2 124 5 discriminator 6
	lw	a5,32(sp)
	sext.w	a5,a5
	beq	a5,zero,.L23
	.loc 2 126 7 discriminator 2
	ld	a5,40(sp)
	lbu	a5,0(a5)
	sext.w	a5,a5
	.loc 2 126 5 discriminator 2
	addiw	a5,a5,-48
	sw	a5,28(sp)
	.loc 2 127 7 discriminator 2
	lw	a4,36(sp)
	mv	a5,a4
	slliw	a5,a5,2
	addw	a5,a5,a4
	slliw	a5,a5,1
	sw	a5,36(sp)
	.loc 2 128 7 discriminator 2
	lw	a4,36(sp)
	lw	a5,28(sp)
	addw	a5,a4,a5
	sw	a5,36(sp)
	.loc 2 121 30 discriminator 2
	ld	a5,40(sp)
	addi	a5,a5,1
	sd	a5,40(sp)
.L16:
	.loc 2 121 15 discriminator 1
	ld	a5,8(sp)
	lbu	a5,0(a5)
	.loc 2 121 2 discriminator 1
	bne	a5,zero,.L21
	j	.L20
.L23:
	.loc 2 125 4
	nop
.L20:
	.loc 2 130 7
	ld	a5,0(sp)
	lw	a4,36(sp)
	sw	a4,0(a5)
	.loc 2 131 18
	ld	a4,40(sp)
	ld	a5,8(sp)
	sub	a5,a4,a5
	.loc 2 131 10
	sext.w	a5,a5
	.loc 2 132 1
	mv	a0,a5
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE18:
	.size	vpf_str_to_num, .-vpf_str_to_num
	.align	2
	.type	vpf_num_to_str, @function
vpf_num_to_str:
.LFB19:
	.loc 2 135 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	mv	a5,a0
	mv	a4,a3
	sw	a5,12(sp)
	mv	a5,a1
	sw	a5,8(sp)
	mv	a5,a2
	sw	a5,4(sp)
	mv	a5,a4
	sw	a5,0(sp)
	.loc 2 140 8
	sw	zero,52(sp)
	.loc 2 140 2
	j	.L25
.L26:
	.loc 2 141 10 discriminator 3
	lw	a5,0(sp)
	andi	a4,a5,0xff
	lw	a5,52(sp)
	addi	a3,sp,64
	add	a5,a3,a5
	sb	a4,-48(a5)
	.loc 2 140 31 discriminator 3
	lw	a5,52(sp)
	addiw	a5,a5,1
	sw	a5,52(sp)
.L25:
	.loc 2 140 15 discriminator 1
	lw	a5,52(sp)
	.loc 2 140 2 discriminator 1
	mv	a4,a5
	li	a5,31
	bleu	a4,a5,.L26
	.loc 2 142 7
	li	a5,10
	sw	a5,60(sp)
	.loc 2 143 4
	lw	a5,8(sp)
	sext.w	a5,a5
	beq	a5,zero,.L27
	.loc 2 144 8
	li	a5,16
	sw	a5,60(sp)
.L27:
	.loc 2 146 6
	sw	zero,56(sp)
.L30:
	.loc 2 148 9
	lw	a4,12(sp)
	lw	a5,60(sp)
	remuw	a5,a4,a5
	sext.w	a5,a5
	.loc 2 148 5
	sw	a5,48(sp)
	.loc 2 149 5
	lw	a5,48(sp)
	sext.w	a4,a5
	li	a5,9
	ble	a4,a5,.L28
	.loc 2 150 22
	lw	a5,48(sp)
	andi	a5,a5,0xff
	addiw	a5,a5,87
	andi	a4,a5,0xff
	.loc 2 150 13
	lw	a5,56(sp)
	addi	a3,sp,64
	add	a5,a3,a5
	sb	a4,-48(a5)
	j	.L29
.L28:
	.loc 2 152 17
	lw	a5,48(sp)
	andi	a5,a5,0xff
	addiw	a5,a5,48
	andi	a4,a5,0xff
	.loc 2 152 13
	lw	a5,56(sp)
	addi	a3,sp,64
	add	a5,a3,a5
	sb	a4,-48(a5)
.L29:
	.loc 2 153 5
	lw	a4,12(sp)
	lw	a5,60(sp)
	divuw	a5,a4,a5
	sw	a5,12(sp)
	.loc 2 154 6
	lw	a5,56(sp)
	addiw	a5,a5,1
	sw	a5,56(sp)
	.loc 2 155 2
	lw	a5,12(sp)
	sext.w	a5,a5
	bne	a5,zero,.L30
	.loc 2 157 4
	lw	a5,4(sp)
	sext.w	a5,a5
	ble	a5,zero,.L31
	.loc 2 159 9
	lw	a5,4(sp)
	.loc 2 159 5
	mv	a4,a5
	li	a5,31
	bleu	a4,a5,.L32
	.loc 2 160 7
	li	a5,31
	sw	a5,4(sp)
.L32:
	.loc 2 161 5
	lw	a4,56(sp)
	lw	a5,4(sp)
	sext.w	a4,a4
	sext.w	a5,a5
	bge	a4,a5,.L31
	.loc 2 162 8
	lw	a5,4(sp)
	sw	a5,56(sp)
.L31:
	.loc 2 164 11
	lw	a5,56(sp)
	addi	a4,sp,64
	add	a5,a4,a5
	sb	zero,-48(a5)
	.loc 2 166 8
	lw	a5,56(sp)
	addiw	a5,a5,-1
	sw	a5,52(sp)
	.loc 2 166 2
	j	.L33
.L34:
	.loc 2 167 3 discriminator 3
	lw	a5,52(sp)
	addi	a4,sp,64
	add	a5,a4,a5
	lbu	a5,-48(a5)
	mv	a0,a5
	call	uart_send
	.loc 2 166 28 discriminator 3
	lw	a5,52(sp)
	addiw	a5,a5,-1
	sw	a5,52(sp)
.L33:
	.loc 2 166 2 discriminator 1
	lw	a5,52(sp)
	sext.w	a5,a5
	bge	a5,zero,.L34
	.loc 2 168 1
	nop
	nop
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE19:
	.size	vpf_num_to_str, .-vpf_num_to_str
	.align	2
	.type	vpf, @function
vpf:
.LFB20:
	.loc 2 171 1
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	.cfi_offset 1, -8
	sd	a0,8(sp)
	sd	a1,0(sp)
	.loc 2 176 5
	li	a5,32
	sw	a5,36(sp)
	.loc 2 177 8
	ld	a5,8(sp)
	sd	a5,56(sp)
	.loc 2 177 2
	j	.L36
.L46:
	.loc 2 179 5
	sw	zero,44(sp)
	.loc 2 180 6
	sw	zero,20(sp)
	.loc 2 181 7
	ld	a5,56(sp)
	lbu	a5,0(a5)
	.loc 2 181 5
	sw	a5,32(sp)
	.loc 2 182 5
	ld	a5,56(sp)
	sd	a5,48(sp)
	.loc 2 183 6
	ld	a5,56(sp)
	lbu	a5,0(a5)
	.loc 2 183 5
	mv	a4,a5
	li	a5,37
	bne	a4,a5,.L37
	.loc 2 185 6
	ld	a5,56(sp)
	sd	a5,48(sp)
	.loc 2 186 5
	ld	a5,56(sp)
	addi	a5,a5,1
	sd	a5,56(sp)
	.loc 2 187 7
	ld	a5,56(sp)
	lbu	a5,0(a5)
	.loc 2 187 6
	mv	a4,a5
	li	a5,47
	bleu	a4,a5,.L38
	.loc 2 187 20 discriminator 1
	ld	a5,56(sp)
	lbu	a5,0(a5)
	.loc 2 187 17 discriminator 1
	mv	a4,a5
	li	a5,57
	bgtu	a4,a5,.L38
	.loc 2 188 10
	addi	a5,sp,20
	mv	a1,a5
	ld	a0,56(sp)
	call	vpf_str_to_num
	mv	a5,a0
	mv	a4,a5
	.loc 2 188 7
	ld	a5,56(sp)
	add	a5,a5,a4
	sd	a5,56(sp)
.L38:
	.loc 2 189 8
	ld	a5,56(sp)
	lbu	a5,0(a5)
	.loc 2 189 6
	sw	a5,44(sp)
.L37:
	.loc 2 191 5
	lw	a5,44(sp)
	sext.w	a4,a5
	li	a5,100
	beq	a4,a5,.L39
	.loc 2 191 17 discriminator 1
	lw	a5,44(sp)
	sext.w	a4,a5
	li	a5,120
	bne	a4,a5,.L40
.L39:
	.loc 2 193 8
	ld	a5,0(sp)
	addi	a4,a5,8
	sd	a4,0(sp)
	lw	a5,0(a5)
	sw	a5,24(sp)
	.loc 2 194 4
	lw	a0,24(sp)
	lw	a5,44(sp)
	sext.w	a4,a5
	li	a5,120
	sub	a5,a4,a5
	seqz	a5,a5
	andi	a5,a5,0xff
	sext.w	a5,a5
	lw	a4,20(sp)
	lw	a3,36(sp)
	mv	a2,a4
	mv	a1,a5
	call	vpf_num_to_str
	j	.L41
.L40:
	.loc 2 198 10
	sw	zero,40(sp)
	.loc 2 198 4
	j	.L42
.L43:
	.loc 2 199 16 discriminator 3
	lw	a5,40(sp)
	ld	a4,48(sp)
	add	a5,a4,a5
	.loc 2 199 5 discriminator 3
	lbu	a5,0(a5)
	mv	a0,a5
	call	uart_send
	.loc 2 198 29 discriminator 3
	lw	a5,40(sp)
	addiw	a5,a5,1
	sw	a5,40(sp)
.L42:
	.loc 2 198 17 discriminator 1
	lw	a4,40(sp)
	.loc 2 198 22 discriminator 1
	ld	a3,56(sp)
	ld	a5,48(sp)
	sub	a5,a3,a5
	.loc 2 198 4 discriminator 1
	blt	a4,a5,.L43
	.loc 2 200 8
	lw	a5,44(sp)
	sext.w	a5,a5
	beq	a5,zero,.L44
	.loc 2 200 8 is_stmt 0 discriminator 1
	lw	a5,44(sp)
	andi	a5,a5,0xff
	j	.L45
.L44:
	.loc 2 200 8 discriminator 2
	lw	a5,32(sp)
	andi	a5,a5,0xff
.L45:
	.loc 2 200 6 is_stmt 1 discriminator 4
	sb	a5,31(sp)
	.loc 2 201 4 discriminator 4
	lbu	a5,31(sp)
	mv	a0,a5
	call	uart_send
.L41:
	.loc 2 177 28 discriminator 2
	ld	a5,56(sp)
	addi	a5,a5,1
	sd	a5,56(sp)
.L36:
	.loc 2 177 15 discriminator 1
	ld	a5,56(sp)
	lbu	a5,0(a5)
	.loc 2 177 2 discriminator 1
	bne	a5,zero,.L46
	.loc 2 204 9
	li	a5,0
	.loc 2 205 1
	mv	a0,a5
	ld	ra,72(sp)
	.cfi_restore 1
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE20:
	.size	vpf, .-vpf
	.align	2
	.globl	sys_uart_printf
	.type	sys_uart_printf, @function
sys_uart_printf:
.LFB21:
	.loc 2 208 1
	.cfi_startproc
	addi	sp,sp,-112
	.cfi_def_cfa_offset 112
	sd	ra,40(sp)
	.cfi_offset 1, -72
	sd	a0,8(sp)
	sd	a1,56(sp)
	sd	a2,64(sp)
	sd	a3,72(sp)
	sd	a4,80(sp)
	sd	a5,88(sp)
	sd	a6,96(sp)
	sd	a7,104(sp)
	.loc 2 212 2
	addi	a5,sp,112
	sd	a5,0(sp)
	ld	a5,0(sp)
	addi	a5,a5,-56
	sd	a5,24(sp)
	.loc 2 213 2
	ld	a5,24(sp)
	mv	a1,a5
	ld	a0,8(sp)
	call	vpf
	.loc 2 216 9
	li	a5,0
	.loc 2 217 1
	mv	a0,a5
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,112
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	sys_uart_printf, .-sys_uart_printf
	.align	2
	.globl	print_hex
	.type	print_hex, @function
print_hex:
.LFB22:
	.loc 2 221 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sd	ra,40(sp)
	.cfi_offset 1, -8
	mv	a5,a0
	sw	a5,12(sp)
	.loc 2 225 5
	li	a0,48
	call	uart_send
	.loc 2 226 5
	li	a0,120
	call	uart_send
	.loc 2 228 12
	li	a5,7
	sw	a5,28(sp)
	.loc 2 228 5
	j	.L51
.L54:
	.loc 2 230 23
	lw	a5,28(sp)
	slliw	a5,a5,2
	sext.w	a5,a5
	.loc 2 230 19
	mv	a4,a5
	lw	a5,12(sp)
	srlw	a5,a5,a4
	sext.w	a5,a5
	.loc 2 230 28
	sext.w	a5,a5
	.loc 2 230 14
	andi	a5,a5,15
	sw	a5,24(sp)
	.loc 2 231 12
	lw	a5,24(sp)
	sext.w	a4,a5
	li	a5,9
	bgt	a4,a5,.L52
	.loc 2 232 13
	lw	a5,24(sp)
	andi	a5,a5,0xff
	addiw	a5,a5,48
	andi	a5,a5,0xff
	mv	a0,a5
	call	uart_send
	j	.L53
.L52:
	.loc 2 234 13
	lw	a5,24(sp)
	andi	a5,a5,0xff
	addiw	a5,a5,55
	andi	a5,a5,0xff
	mv	a0,a5
	call	uart_send
.L53:
	.loc 2 228 26 discriminator 2
	lw	a5,28(sp)
	addiw	a5,a5,-1
	sw	a5,28(sp)
.L51:
	.loc 2 228 5 discriminator 1
	lw	a5,28(sp)
	sext.w	a5,a5
	bge	a5,zero,.L54
	.loc 2 236 1
	nop
	nop
	ld	ra,40(sp)
	.cfi_restore 1
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	print_hex, .-print_hex
.Letext0:
	.file 3 "include/types.h"
	.file 4 "include/stdarg.h"
	.file 5 "include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x4c5
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
	.4byte	.LASF33
	.byte	0x3
	.4byte	.LASF13
	.byte	0x5
	.byte	0x11
	.byte	0xf
	.4byte	0x5c
	.byte	0x6
	.4byte	.LASF18
	.byte	0x2
	.byte	0xdc
	.byte	0x6
	.8byte	.LFB22
	.8byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0xff
	.byte	0x7
	.string	"val"
	.byte	0x2
	.byte	0xdc
	.byte	0x1d
	.4byte	0x68
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x8
	.string	"i"
	.byte	0x2
	.byte	0xde
	.byte	0x9
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x9
	.4byte	.LASF14
	.byte	0x2
	.byte	0xdf
	.byte	0x9
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xa
	.4byte	.LASF20
	.byte	0x2
	.byte	0xcf
	.byte	0x5
	.4byte	0x55
	.8byte	.LFB21
	.8byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x142
	.byte	0x7
	.string	"fmt"
	.byte	0x2
	.byte	0xcf
	.byte	0x22
	.4byte	0x142
	.byte	0x3
	.byte	0x91
	.byte	0x98,0x7f
	.byte	0xb
	.byte	0x8
	.string	"va"
	.byte	0x2
	.byte	0xd2
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
	.byte	0xaa
	.byte	0xc
	.4byte	0x55
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x20f
	.byte	0x7
	.string	"fmt"
	.byte	0x2
	.byte	0xaa
	.byte	0x1d
	.4byte	0x142
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x7
	.string	"va"
	.byte	0x2
	.byte	0xaa
	.byte	0x2a
	.4byte	0x97
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x8
	.string	"p"
	.byte	0x2
	.byte	0xac
	.byte	0xf
	.4byte	0x142
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x8
	.string	"q"
	.byte	0x2
	.byte	0xac
	.byte	0x14
	.4byte	0x142
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x8
	.string	"f"
	.byte	0x2
	.byte	0xad
	.byte	0x6
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x8
	.string	"c"
	.byte	0x2
	.byte	0xad
	.byte	0x9
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x8
	.string	"vai"
	.byte	0x2
	.byte	0xad
	.byte	0xc
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x8
	.string	"pl"
	.byte	0x2
	.byte	0xad
	.byte	0x11
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x44
	.byte	0x8
	.string	"pc"
	.byte	0x2
	.byte	0xad
	.byte	0x15
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x54
	.byte	0x8
	.string	"i"
	.byte	0x2
	.byte	0xad
	.byte	0x19
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x8
	.string	"t"
	.byte	0x2
	.byte	0xae
	.byte	0x10
	.4byte	0x40
	.byte	0x2
	.byte	0x91
	.byte	0x4f
	.byte	0
	.byte	0xf
	.4byte	.LASF25
	.byte	0x2
	.byte	0x86
	.byte	0xd
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x2b1
	.byte	0x7
	.string	"a"
	.byte	0x2
	.byte	0x86
	.byte	0x25
	.4byte	0xa9
	.byte	0x3
	.byte	0x91
	.byte	0xbc,0x7f
	.byte	0x7
	.string	"ish"
	.byte	0x2
	.byte	0x86
	.byte	0x2c
	.4byte	0x55
	.byte	0x3
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x7
	.string	"pl"
	.byte	0x2
	.byte	0x86
	.byte	0x35
	.4byte	0x55
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x7f
	.byte	0x7
	.string	"pc"
	.byte	0x2
	.byte	0x86
	.byte	0x3d
	.4byte	0x55
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0x8
	.string	"buf"
	.byte	0x2
	.byte	0x88
	.byte	0x7
	.4byte	0x2b1
	.byte	0x2
	.byte	0x91
	.byte	0x40
	.byte	0x9
	.4byte	.LASF16
	.byte	0x2
	.byte	0x89
	.byte	0xb
	.4byte	0xa9
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x8
	.string	"idx"
	.byte	0x2
	.byte	0x8a
	.byte	0x6
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x8
	.string	"i"
	.byte	0x2
	.byte	0x8a
	.byte	0xb
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x8
	.string	"t"
	.byte	0x2
	.byte	0x8a
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
	.byte	0x73
	.byte	0xc
	.4byte	0x55
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x33a
	.byte	0x7
	.string	"fmt"
	.byte	0x2
	.byte	0x73
	.byte	0x28
	.4byte	0x142
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x7
	.string	"num"
	.byte	0x2
	.byte	0x73
	.byte	0x33
	.4byte	0x33a
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x8
	.string	"p"
	.byte	0x2
	.byte	0x75
	.byte	0xf
	.4byte	0x142
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x8
	.string	"res"
	.byte	0x2
	.byte	0x76
	.byte	0x6
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x74
	.byte	0x8
	.string	"d"
	.byte	0x2
	.byte	0x76
	.byte	0xb
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x8
	.string	"isd"
	.byte	0x2
	.byte	0x76
	.byte	0xe
	.4byte	0x55
	.byte	0x2
	.byte	0x91
	.byte	0x70
	.byte	0
	.byte	0xc
	.byte	0x8
	.4byte	0x55
	.byte	0x6
	.4byte	.LASF19
	.byte	0x2
	.byte	0x6b
	.byte	0x6
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x37b
	.byte	0x7
	.string	"str"
	.byte	0x2
	.byte	0x6b
	.byte	0x1d
	.4byte	0x37b
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x8
	.string	"i"
	.byte	0x2
	.byte	0x6d
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
	.byte	0x63
	.byte	0x6
	.4byte	0x148
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x3b3
	.byte	0x9
	.4byte	.LASF22
	.byte	0x2
	.byte	0x65
	.byte	0x11
	.4byte	0x8b
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x6
	.4byte	.LASF23
	.byte	0x2
	.byte	0x5b
	.byte	0x6
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x3ee
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
	.4byte	.LASF24
	.byte	0x2
	.byte	0x1f
	.byte	0x6
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x42b
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
	.4byte	.LASF26
	.byte	0x1
	.byte	0x28
	.byte	0x14
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x468
	.byte	0x14
	.4byte	.LASF22
	.byte	0x1
	.byte	0x28
	.byte	0x2b
	.4byte	0x8b
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0x14
	.4byte	.LASF27
	.byte	0x1
	.byte	0x28
	.byte	0x37
	.4byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x74
	.byte	0
	.byte	0x12
	.4byte	.LASF28
	.byte	0x1
	.byte	0x14
	.byte	0x15
	.4byte	0x5c
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x49a
	.byte	0x14
	.4byte	.LASF22
	.byte	0x1
	.byte	0x14
	.byte	0x2b
	.4byte	0x8b
	.byte	0x2
	.byte	0x91
	.byte	0x78
	.byte	0
	.byte	0x15
	.4byte	.LASF29
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
	.byte	0x78
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
.LASF33:
	.string	"__builtin_va_list"
.LASF27:
	.string	"value"
.LASF22:
	.string	"addr"
.LASF26:
	.string	"write32"
.LASF30:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fomit-frame-pointer"
.LASF24:
	.string	"uart_init"
.LASF12:
	.string	"va_list"
.LASF1:
	.string	"unsigned char"
.LASF28:
	.string	"read32"
.LASF10:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF18:
	.string	"print_hex"
.LASF11:
	.string	"virtual_addr_t"
.LASF19:
	.string	"uart_send_string"
.LASF17:
	.string	"vpf_str_to_num"
.LASF5:
	.string	"u32_t"
.LASF31:
	.string	"src/sys-uart.c"
.LASF16:
	.string	"base"
.LASF6:
	.string	"unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF32:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_3\\\\lab3_8\\\\benos"
.LASF4:
	.string	"u8_t"
.LASF21:
	.string	"uart_recv"
.LASF20:
	.string	"sys_uart_printf"
.LASF7:
	.string	"long long int"
.LASF15:
	.string	"char"
.LASF14:
	.string	"bits"
.LASF23:
	.string	"uart_send"
.LASF2:
	.string	"short int"
.LASF25:
	.string	"vpf_num_to_str"
.LASF29:
	.string	"read8"
.LASF13:
	.string	"uint32_t"
.LASF9:
	.string	"long int"
.LASF0:
	.string	"signed char"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
