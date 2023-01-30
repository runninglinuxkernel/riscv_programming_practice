
.global rgb24_bgr24_asm
rgb24_bgr24_asm:
	li t2, 3
loop:
	vsetvli t0, a2, e8, ta, ma
	vlseg3e8.v v4, (a0)
	vmv1r.v v7, v4
	vmv1r.v v4, v6
	vmv1r.v v6, v7
	vsseg3e8.v v4, (a1)
	mul t0, t0, t2
	add a0, a0, t0
	add a1, a1, t0
	sub a2, a2, t0
	bnez a2, loop
	
	ret
