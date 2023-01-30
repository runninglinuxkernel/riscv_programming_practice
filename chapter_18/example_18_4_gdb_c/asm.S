.global asm_test
asm_test:
	vsetvli t1, a1, e8

	vle8.v v0, (a0)
	vadd.vv v2, v0, v0

	ret
