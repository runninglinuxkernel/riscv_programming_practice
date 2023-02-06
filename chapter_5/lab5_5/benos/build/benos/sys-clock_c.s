	.file	"sys-clock.c"
	.option nopic
	.attribute arch, "rv64i2p0_m2p0_a2p0_f2p0_d2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.type	read32, @function
read32:
.LFB2:
	.file 1 "include/io.h"
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
	.globl	sdelay
	.type	sdelay, @function
sdelay:
.LFB14:
	.file 2 "src/sys-clock.c"
	.loc 2 40 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	s0,24(sp)
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sd	a0,-24(s0)
	.loc 2 48 5
	ld	a5,-24(s0)
	slli	a5,a5,10
	sd	a5,-24(s0)
	.loc 2 49 7
	nop
.L5:
	.loc 2 49 10 discriminator 1
	ld	a5,-24(s0)
	addi	a4,a5,-1
	sd	a4,-24(s0)
	.loc 2 49 7 discriminator 1
	bne	a5,zero,.L5
	.loc 2 53 1
	nop
	nop
	ld	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE14:
	.size	sdelay, .-sdelay
	.align	2
	.type	set_pll_cpux_axi, @function
set_pll_cpux_axi:
.LFB15:
	.loc 2 56 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 60 2
	li	a1,769
	li	a5,33562624
	addi	a0,a5,-768
	call	write32
	.loc 2 61 2
	li	a0,1
	call	sdelay
	.loc 2 64 8
	li	a0,33558528
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 65 6
	lw	a4,-20(s0)
	li	a5,-134217728
	addi	a5,a5,-1
	and	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 66 2
	lw	a5,-20(s0)
	mv	a1,a5
	li	a0,33558528
	call	write32
	.loc 2 69 8
	li	a0,33558528
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 70 6
	lw	a4,-20(s0)
	li	a5,1073741824
	or	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 71 2
	lw	a5,-20(s0)
	mv	a1,a5
	li	a0,33558528
	call	write32
	.loc 2 72 2
	li	a0,5
	call	sdelay
	.loc 2 75 8
	li	a0,33558528
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 76 6
	lw	a4,-20(s0)
	li	a5,-262144
	addi	a5,a5,252
	and	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 77 6
	lw	a4,-20(s0)
	li	a5,12288
	addi	a5,a5,-1792
	or	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 78 2
	lw	a5,-20(s0)
	mv	a1,a5
	li	a0,33558528
	call	write32
	.loc 2 81 8
	li	a0,33558528
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 82 6
	lw	a4,-20(s0)
	li	a5,536870912
	or	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 83 2
	lw	a5,-20(s0)
	mv	a1,a5
	li	a0,33558528
	call	write32
	.loc 2 86 8
	li	a0,33558528
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 87 6
	lw	a4,-20(s0)
	li	a5,-2147483648
	or	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 88 2
	lw	a5,-20(s0)
	mv	a1,a5
	li	a0,33558528
	call	write32
	.loc 2 91 7
	nop
.L7:
	.loc 2 91 10 discriminator 1
	li	a0,33558528
	call	read32
	mv	a5,a0
	sext.w	a5,a5
	.loc 2 91 41 discriminator 1
	mv	a4,a5
	li	a5,268435456
	and	a5,a4,a5
	sext.w	a5,a5
	.loc 2 91 7 discriminator 1
	beq	a5,zero,.L7
	.loc 2 92 2
	li	a0,20
	call	sdelay
	.loc 2 95 8
	li	a0,33558528
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 96 6
	lw	a4,-20(s0)
	li	a5,134217728
	or	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 97 2
	lw	a5,-20(s0)
	mv	a1,a5
	li	a0,33558528
	call	write32
	.loc 2 100 8
	li	a0,33558528
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 101 6
	lw	a4,-20(s0)
	li	a5,-536870912
	addi	a5,a5,-1
	and	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 102 2
	lw	a5,-20(s0)
	mv	a1,a5
	li	a0,33558528
	call	write32
	.loc 2 103 2
	li	a0,1
	call	sdelay
	.loc 2 106 8
	li	a5,33562624
	addi	a0,a5,-768
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 107 6
	lw	a4,-20(s0)
	li	a5,-117440512
	addi	a5,a5,-784
	and	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 108 6
	lw	a4,-20(s0)
	li	a5,83886080
	addi	a5,a5,256
	or	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 109 2
	lw	a5,-20(s0)
	mv	a1,a5
	li	a5,33562624
	addi	a0,a5,-768
	call	write32
	.loc 2 110 2
	li	a0,1
	call	sdelay
	.loc 2 111 1
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
	.size	set_pll_cpux_axi, .-set_pll_cpux_axi
	.align	2
	.type	set_pll_periph0, @function
set_pll_periph0:
.LFB16:
	.loc 2 114 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 118 5
	li	a5,33558528
	addi	a0,a5,32
	call	read32
	mv	a5,a0
	sext.w	a5,a5
	sext.w	a5,a5
	.loc 2 118 4
	blt	a5,zero,.L12
	.loc 2 122 8
	li	a5,33558528
	addi	a0,a5,1296
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 123 6
	lw	a4,-20(s0)
	li	a5,-50331648
	addi	a5,a5,-1
	and	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 124 2
	lwu	a4,-20(s0)
	li	a5,33558528
	addi	a1,a5,1296
	mv	a0,a4
	call	write32
	.loc 2 127 2
	li	a5,24576
	addi	a1,a5,768
	li	a5,33558528
	addi	a0,a5,32
	call	write32
	.loc 2 130 8
	li	a5,33558528
	addi	a0,a5,32
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 131 6
	lw	a4,-20(s0)
	li	a5,536870912
	or	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 132 2
	lw	a5,-20(s0)
	mv	a1,a5
	li	a5,33558528
	addi	a0,a5,32
	call	write32
	.loc 2 135 8
	li	a5,33558528
	addi	a0,a5,32
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 136 6
	lw	a4,-20(s0)
	li	a5,-2147483648
	or	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 137 2
	lw	a5,-20(s0)
	mv	a1,a5
	li	a5,33558528
	addi	a0,a5,32
	call	write32
	.loc 2 140 7
	nop
.L11:
	.loc 2 140 10 discriminator 1
	li	a5,33558528
	addi	a0,a5,32
	call	read32
	mv	a5,a0
	sext.w	a5,a5
	.loc 2 140 41 discriminator 1
	mv	a4,a5
	li	a5,268435456
	and	a5,a4,a5
	sext.w	a5,a5
	.loc 2 140 7 discriminator 1
	beq	a5,zero,.L11
	.loc 2 141 2
	li	a0,20
	call	sdelay
	.loc 2 144 8
	li	a5,33558528
	addi	a0,a5,32
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 145 6
	lw	a4,-20(s0)
	li	a5,-536870912
	addi	a5,a5,-1
	and	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 146 2
	lw	a5,-20(s0)
	mv	a1,a5
	li	a5,33558528
	addi	a0,a5,32
	call	write32
	j	.L8
.L12:
	.loc 2 119 3
	nop
.L8:
	.loc 2 147 1
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
	.size	set_pll_periph0, .-set_pll_periph0
	.align	2
	.type	set_ahb, @function
set_ahb:
.LFB17:
	.loc 2 150 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 151 2
	li	a1,2
	li	a5,33558528
	addi	a0,a5,1296
	call	write32
	.loc 2 152 34
	li	a5,33558528
	addi	a0,a5,1296
	call	read32
	mv	a5,a0
	sext.w	a5,a5
	.loc 2 152 2
	mv	a4,a5
	li	a5,50331648
	or	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	li	a5,33558528
	addi	a0,a5,1296
	call	write32
	.loc 2 153 2
	li	a0,1
	call	sdelay
	.loc 2 154 1
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
.LFE17:
	.size	set_ahb, .-set_ahb
	.align	2
	.type	set_apb, @function
set_apb:
.LFB18:
	.loc 2 157 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 158 2
	li	a1,258
	li	a5,33558528
	addi	a0,a5,1312
	call	write32
	.loc 2 159 49
	li	a5,33558528
	addi	a0,a5,1312
	call	read32
	mv	a5,a0
	sext.w	a5,a5
	.loc 2 159 2
	mv	a4,a5
	li	a5,50331648
	or	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	li	a5,33558528
	addi	a0,a5,1312
	call	write32
	.loc 2 160 2
	li	a0,1
	call	sdelay
	.loc 2 161 1
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
.LFE18:
	.size	set_apb, .-set_apb
	.align	2
	.type	set_dma, @function
set_dma:
.LFB19:
	.loc 2 164 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 166 34
	li	a5,33558528
	addi	a0,a5,1804
	call	read32
	mv	a5,a0
	sext.w	a5,a5
	.loc 2 166 2
	mv	a4,a5
	li	a5,65536
	or	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	li	a5,33558528
	addi	a0,a5,1804
	call	write32
	.loc 2 167 2
	li	a0,20
	call	sdelay
	.loc 2 169 34
	li	a5,33558528
	addi	a0,a5,1804
	call	read32
	mv	a5,a0
	sext.w	a5,a5
	.loc 2 169 2
	ori	a5,a5,1
	sext.w	a5,a5
	mv	a1,a5
	li	a5,33558528
	addi	a0,a5,1804
	call	write32
	.loc 2 170 1
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
.LFE19:
	.size	set_dma, .-set_dma
	.align	2
	.type	set_mbus, @function
set_mbus:
.LFB20:
	.loc 2 173 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	.loc 2 177 8
	li	a5,33558528
	addi	a0,a5,1344
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 178 6
	lw	a4,-20(s0)
	li	a5,1073741824
	or	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 179 2
	lw	a5,-20(s0)
	mv	a1,a5
	li	a5,33558528
	addi	a0,a5,1344
	call	write32
	.loc 2 180 2
	li	a0,1
	call	sdelay
	.loc 2 181 1
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
.LFE20:
	.size	set_mbus, .-set_mbus
	.align	2
	.type	set_module, @function
set_module:
.LFB21:
	.loc 2 184 1
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
	.loc 2 187 7
	ld	a0,-40(s0)
	call	read32
	mv	a5,a0
	sext.w	a5,a5
	.loc 2 187 5
	sext.w	a5,a5
	.loc 2 187 4
	blt	a5,zero,.L20
	.loc 2 189 9
	ld	a0,-40(s0)
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 190 3
	lw	a4,-20(s0)
	li	a5,-1073741824
	or	a5,a4,a5
	sext.w	a5,a5
	mv	a1,a5
	ld	a0,-40(s0)
	call	write32
	.loc 2 193 9
	ld	a0,-40(s0)
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 194 7
	lw	a4,-20(s0)
	li	a5,536870912
	or	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 195 3
	lw	a5,-20(s0)
	mv	a1,a5
	ld	a0,-40(s0)
	call	write32
	.loc 2 198 8
	nop
.L19:
	.loc 2 198 11 discriminator 1
	ld	a0,-40(s0)
	call	read32
	mv	a5,a0
	sext.w	a5,a5
	.loc 2 198 24 discriminator 1
	mv	a4,a5
	li	a5,268435456
	and	a5,a4,a5
	sext.w	a5,a5
	.loc 2 198 8 discriminator 1
	beq	a5,zero,.L19
	.loc 2 199 3
	li	a0,20
	call	sdelay
	.loc 2 202 9
	ld	a0,-40(s0)
	call	read32
	mv	a5,a0
	sw	a5,-20(s0)
	.loc 2 203 7
	lw	a4,-20(s0)
	li	a5,-536870912
	addi	a5,a5,-1
	and	a5,a4,a5
	sw	a5,-20(s0)
	.loc 2 204 3
	lw	a5,-20(s0)
	mv	a1,a5
	ld	a0,-40(s0)
	call	write32
.L20:
	.loc 2 206 1
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
	.size	set_module, .-set_module
	.align	2
	.globl	sys_clock_init
	.type	sys_clock_init, @function
sys_clock_init:
.LFB22:
	.loc 2 209 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 2 210 2
	call	set_pll_cpux_axi
	.loc 2 211 2
	call	set_pll_periph0
	.loc 2 212 2
	call	set_ahb
	.loc 2 213 2
	call	set_apb
	.loc 2 214 2
	call	set_dma
	.loc 2 215 2
	call	set_mbus
	.loc 2 216 2
	li	a5,33558528
	addi	a0,a5,32
	call	set_module
	.loc 2 217 2
	li	a5,33558528
	addi	a0,a5,64
	call	set_module
	.loc 2 218 2
	li	a5,33558528
	addi	a0,a5,72
	call	set_module
	.loc 2 219 2
	li	a5,33558528
	addi	a0,a5,88
	call	set_module
	.loc 2 220 2
	li	a5,33558528
	addi	a0,a5,120
	call	set_module
	.loc 2 221 2
	li	a5,33558528
	addi	a0,a5,128
	call	set_module
	.loc 2 222 1
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
.LFE22:
	.size	sys_clock_init, .-sys_clock_init
.Letext0:
	.file 3 "include/types.h"
	.file 4 "include/stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x25b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.byte	0x1
	.4byte	.LASF23
	.byte	0xc
	.4byte	.LASF24
	.4byte	.LASF25
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
	.byte	0x4
	.4byte	.LASF9
	.byte	0x3
	.byte	0xf
	.byte	0x16
	.4byte	0x5c
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
	.4byte	.LASF10
	.byte	0x3
	.byte	0x24
	.byte	0x1c
	.4byte	0x6a
	.byte	0x4
	.4byte	.LASF11
	.byte	0x4
	.byte	0x11
	.byte	0xf
	.4byte	0x50
	.byte	0x5
	.4byte	.LASF26
	.byte	0x2
	.byte	0xd0
	.byte	0x6
	.8byte	.LFB22
	.8byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.byte	0x6
	.4byte	.LASF12
	.byte	0x2
	.byte	0xb7
	.byte	0xd
	.8byte	.LFB21
	.8byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0xee
	.byte	0x7
	.4byte	.LASF19
	.byte	0x2
	.byte	0xb7
	.byte	0x27
	.4byte	0x7f
	.byte	0x2
	.byte	0x91
	.byte	0x58
	.byte	0x8
	.string	"val"
	.byte	0x2
	.byte	0xb9
	.byte	0xb
	.4byte	0x8b
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x6
	.4byte	.LASF13
	.byte	0x2
	.byte	0xac
	.byte	0xd
	.8byte	.LFB20
	.8byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x11c
	.byte	0x8
	.string	"val"
	.byte	0x2
	.byte	0xae
	.byte	0xb
	.4byte	0x8b
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x9
	.4byte	.LASF14
	.byte	0x2
	.byte	0xa3
	.byte	0xd
	.8byte	.LFB19
	.8byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF15
	.byte	0x2
	.byte	0x9c
	.byte	0xd
	.8byte	.LFB18
	.8byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF16
	.byte	0x2
	.byte	0x95
	.byte	0xd
	.8byte	.LFB17
	.8byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.byte	0x6
	.4byte	.LASF17
	.byte	0x2
	.byte	0x71
	.byte	0xd
	.8byte	.LFB16
	.8byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x198
	.byte	0x8
	.string	"val"
	.byte	0x2
	.byte	0x73
	.byte	0xb
	.4byte	0x8b
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x6
	.4byte	.LASF18
	.byte	0x2
	.byte	0x37
	.byte	0xd
	.8byte	.LFB15
	.8byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x1c6
	.byte	0x8
	.string	"val"
	.byte	0x2
	.byte	0x39
	.byte	0xb
	.4byte	0x8b
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0xa
	.4byte	.LASF27
	.byte	0x2
	.byte	0x27
	.byte	0x6
	.8byte	.LFB14
	.8byte	.LFE14-.LFB14
	.byte	0x1
	.byte	0x9c
	.4byte	0x1f3
	.byte	0xb
	.string	"us"
	.byte	0x2
	.byte	0x27
	.byte	0x1b
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0xc
	.4byte	.LASF20
	.byte	0x1
	.byte	0x28
	.byte	0x14
	.8byte	.LFB6
	.8byte	.LFE6-.LFB6
	.byte	0x1
	.byte	0x9c
	.4byte	0x230
	.byte	0x7
	.4byte	.LASF19
	.byte	0x1
	.byte	0x28
	.byte	0x2b
	.4byte	0x7f
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x7
	.4byte	.LASF21
	.byte	0x1
	.byte	0x28
	.byte	0x37
	.4byte	0x50
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0
	.byte	0xd
	.4byte	.LASF22
	.byte	0x1
	.byte	0x14
	.byte	0x15
	.4byte	0x50
	.8byte	.LFB2
	.8byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.byte	0x7
	.4byte	.LASF19
	.byte	0x1
	.byte	0x14
	.byte	0x2b
	.4byte	0x7f
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
	.byte	0x5
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0xb
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
	.byte	0xc
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
.LASF21:
	.string	"value"
.LASF18:
	.string	"set_pll_cpux_axi"
.LASF15:
	.string	"set_apb"
.LASF17:
	.string	"set_pll_periph0"
.LASF12:
	.string	"set_module"
.LASF20:
	.string	"write32"
.LASF19:
	.string	"addr"
.LASF13:
	.string	"set_mbus"
.LASF0:
	.string	"signed char"
.LASF1:
	.string	"unsigned char"
.LASF22:
	.string	"read32"
.LASF8:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF23:
	.string	"GNU C17 10.2.0 -mcmodel=medany -mabi=lp64 -march=rv64imafd -g -O0 -fno-PIE -fno-omit-frame-pointer"
.LASF25:
	.string	"E:\\\\d1s_projects\\\\riscv_programming_practice-for-dongshan\\\\chapter_5\\\\lab5_5\\\\benos"
.LASF9:
	.string	"u32_t"
.LASF10:
	.string	"virtual_addr_t"
.LASF4:
	.string	"unsigned int"
.LASF6:
	.string	"long long unsigned int"
.LASF14:
	.string	"set_dma"
.LASF27:
	.string	"sdelay"
.LASF5:
	.string	"long long int"
.LASF2:
	.string	"short int"
.LASF11:
	.string	"uint32_t"
.LASF7:
	.string	"long int"
.LASF24:
	.string	"src/sys-clock.c"
.LASF16:
	.string	"set_ahb"
.LASF26:
	.string	"sys_clock_init"
	.ident	"GCC: (Xuantie-900 elf newlib gcc Toolchain V2.6.1 B-20220906) 10.2.0"
