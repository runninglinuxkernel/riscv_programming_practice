	.section	.rodata
	.align	3
.string:
	.string	"data: %d %d %d %d %d %d %d %d %d %d\n"

data:
	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, -1

	.text
	.align	2

.global	main
main:
        /*栈往下扩展48字节*/
	addi	sp,sp,-48

	/*保存main函数的返回地址ra到栈里*/
	sd	ra,40(sp)

	/* a0传递第一个参数：.string字符串 */
	la	a0, .string

	/* a1 - a7 传递printf()前7个参数 */
	li	a1,1
	li	a2,2
	li	a3,3
	li	a4,4
	li	a5,5
	li	a6,6
	li	a7,7

	/* printf()第8-10个参数通过栈来传递*/
	li	t0,8
	sd	t0,0(sp)
	li	t0,9
	sd	t0,8(sp)
	li	t0,-1
	sd	t0,16(sp)

	/* 调printf()函数 */
	call printf

	/* 从栈中恢复ra返回地址*/
	ld	ra,40(sp)
	/* 设置main函数返回值为0*/
	li	a0,0
	/* SP回到原点*/
	addi	sp,sp,48
	ret
