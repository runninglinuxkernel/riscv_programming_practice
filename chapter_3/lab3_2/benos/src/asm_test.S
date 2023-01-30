.align 3
.globl my_test_data
my_test_data:
	.dword 0x12345678abcdabcd

#define MY_OFFSET -2048

.align 3
.global load_store_test
load_store_test:
	li t0, 0x80200000

	lb t1, (t0)
	lb t1, 4(t0)
	lb t1, -4(t0)
	ld t1, (t0)
	lb t1, 4(t0)

	lui t0, 0x80200
	lui t1, 0x40200

	la t0, my_test_data
	lla t1, my_test_data

	ret

.global pc_related_test
pc_related_test:
	auipc t0, 1
	addi t0, t0, MY_OFFSET
	ld t1, MY_OFFSET(t0)
	ret
