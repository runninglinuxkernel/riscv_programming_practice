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

.global shift_test
shift_test:
	li t0, 0x8000008a00000000
	srai a1, t0, 1
	srli t1, t0, 1

	li t0, 0x128000008a
	sraiw a2, t0, 1
	srliw t1, t0, 1
	slliw a3, t0, 1

	li t0, 0x124000008a
	sraiw a2, t0, 1
	srliw t1, t0, 1
	slliw a4, t0, 1
	ret

.global add_sub_test
add_sub_test:
	/* 这是一条错误指令*/
	//addi a1, t0, 0x800
	addi a1, t0, 0xfffffffffffff800

	li t0, 0x140200000
	li t1, 0x40000000

	addi a1, t0, 0x700
	addi a1, t0, 0xfffffffffffff800
	addiw a2, t0, 0x80

	add a3, t0, t1
	addw a4, t0, t1

	li t0, 0x180200000
	li t1, 0x200000
	
	sub a0, t0, t1
	subw a1, t0, t1
	ret

.global compare_and_return
compare_and_return:
	bltu	a0,a1,.L2
	li	a5,0
	j	.L3
.L2:
	li	a5,-1
.L3:
	mv	a0,a5
	ret

.global sel_test
sel_test:
	beqz a0, .L4
	addi a5, a1, -1
	j .L5
.L4:
	addi a5, a1, 2
.L5:
	mv a0, a5
	ret

.global my_memcpy_test
my_memcpy_test:
	li t0, 0x80200000
	li t1, 0x80210000
	addi t2, t0, 32

.loop:
	ld t3, (t0)
	sd t3, (t1)
	addi t0, t0, 8
	addi t1, t1, 8
	blt t0, t2, .loop

	ret

.globl add_test
add_test:
	add a0, a0, a1
	nop
	ret

.globl branch_test
branch_test:
	/*把返回地址ra寄存器保存到栈里*/
	addi	sp,sp,-8
	sd	ra,(sp)

	li a0, 1
	li a1, 2
	/* 调用add_test子函数 */
	call add_test
	nop

	/* 从栈中恢复ra返回地址*/
	ld	ra,(sp)
	addi	sp,sp,8
	ret
