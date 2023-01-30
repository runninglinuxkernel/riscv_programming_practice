.global matrix_multiply_4x4_asm
matrix_multiply_4x4_asm:
	mv t3, a1
	li t0, 4

	/*加载A矩阵的数据到V0~V3*/
	vsetvli t1, t0, e32, m1
	slli t1, t1, 2
	vle32.v v0, (a0)
	add a0, a0, t1
	vle32.v v1, (a0)
	add a0, a0, t1
	vle32.v v2, (a0)
	add a0, a0, t1
	vle32.v v3, (a0)

	/*这些目标矢量寄存器需要清零*/
	vmv.v.i v8, 0
	vmv.v.i v9, 0
	vmv.v.i v10, 0
	vmv.v.i v11, 0
	
	/*计算C0: 第0列*/
	flw ft0, (t3)
	vfmacc.vf v8, ft0, v0
	flw ft1, 4(t3)
	vfmacc.vf v8, ft1, v1
	flw ft2, 8(t3)
	vfmacc.vf v8, ft2, v2
	flw ft3, 12(t3)
	vfmacc.vf v8, ft3, v3
	add t3, t3, 16

	/*计算C1: 第1列*/
	flw ft0, (t3)
	vfmacc.vf v9, ft0, v0
	flw ft1, 4(t3)
	vfmacc.vf v9, ft1, v1
	flw ft2, 8(t3)
	vfmacc.vf v9, ft2, v2
	flw ft3, 12(t3)
	vfmacc.vf v9, ft3, v3
	add t3, t3, 16

	/*计算C1: 第2列*/
	flw ft0, (t3)
	vfmacc.vf v10, ft0, v0
	flw ft1, 4(t3)
	vfmacc.vf v10, ft1, v1
	flw ft2, 8(t3)
	vfmacc.vf v10, ft2, v2
	flw ft3, 12(t3)
	vfmacc.vf v10, ft3, v3
	add t3, t3, 16

	/*计算C1: 第3列*/
	flw ft0, (t3)
	vfmacc.vf v11, ft0, v0
	flw ft1, 4(t3)
	vfmacc.vf v11, ft1, v1
	flw ft2, 8(t3)
	vfmacc.vf v11, ft2, v2
	flw ft3, 12(t3)
	vfmacc.vf v11, ft3, v3

	/*回写到C矩阵*/
	vsetvli t1, t0, e32, m1
	slli t1, t1, 2
	vse32.v v8, (a2)
	add a2, a2, t1
	vse32.v v9, (a2)
	add a2, a2, t1
	vse32.v v10, (a2)
	add a2, a2, t1
	vse32.v v11, (a2)

	ret
