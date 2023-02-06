
.align 2
.globl __init_uart
__init_uart:
	/* Config GPIOF2 and GPIOF4 to txd0 and rxd0 
	 * PF_CFG0, bit[19:16]=0b0011, GPIOF4用作rxd0
	 *          bit[11:8] =0b0011, GPIOF2用作txd0
	 */
	/* 读PF_CFG0 */
	li t0, 0x02000000 + 0xf0
	lw t1, (t0)	
	
	/* 清除bit[19:16], bit[11:8] */
	li t2, ~(0xf<<16 | 0xf<<8)
	and t1, t1, t2
	
	/* 设置bit[19:16], bit[11:8]为0b0011 */
	li t2, (0x3<<16 | 0x3<<8)
	or t1, t1, t2
	
	/* 写PF_CFG0 */
	sw t1, (t0)
	
	
	/* Open the clock gate for uart0 
	 * UART_BGR_REG, UART Bus Gating Rest Register
	 * bit1: UART0_GATING, 0-Mask, 1-Pass
	 */
	li t0, 0x0200190c
	lw t1, (t0)
	ori t1, t1, 1
	sw t1, (t0)
	
	/* Deassert uart0 reset
	 * UART_BGR_REG, UART Bus Gating Rest Register
	 * bit16: UART0_RST, 0-Assert, 1- De-assert
	 */
	li t0, 0x0200190c
	lw t1, (t0)
	li t2, (1<<16)
	or t1, t1, t2
	sw t1, (t0)
	
	/* Config uart0 to 115200-8-1-0 
	 * UART0寄存器基地址: 0x02500000
	 * 下面列出的寄存器有些偏移地址是一样的, 
	 * 通过其他寄存器来决定访问同一个偏移地址时访问的是哪个寄存器
	 *   UART_LCR[7] = 0, 偏移地址0对应 UART_RBR/UART_THR, 偏移地址0x4对应 UART_IER
	 *   UART_LCR[7] = 1, 偏移地址0对应 UART_DLL, 偏移地址0x4对应 UART_DLH
	 * 偏移地址:
	 *  UART_THR  0x00  // 发送寄存器
	 *  UART_RBR  0x00  // 接收寄存器
	 *  UART_DLL  0x00  // Divisor Latch Low Register
	 *  UART_IER  0x04  // 中断使能寄存器
	 *  UART_DLH  0x04  // Divisor Latch High Register
	 *  UART_FCR  0x08  // FIFO Control Register
	 *  UART_MCR  0x10  // Modem Control Register
	 */
	li t0, 0x02500000
	
	// 禁止UART0中断
	sw x0, 0x04(t0)  

	// 使能FIFO
	li t1, 0xf1
	sw t1, 0x08(t0)
	
	// 不使用流量控制
	sw x0, 0x10(t0)
	
	// 设置UART_LCR[7] = 1 以便设置波特率
	lw t1, 0x0c(t0)
	ori t1, t1, (1<<7)
	sw t1, 0x0c(t0)
	
	// 设置UART_DLL, UART_DLH
#define DIVISOR_VAL 0xd
	li t2, DIVISOR_VAL & 0xff
	sw t2, (t0)
	li t2, (DIVISOR_VAL>>8) & 0xff
	sw t2, 0x04(t0)
	
	// 设置UART_LCR[7] = 0
	xori t1, t1, (1<<7)
	sw t1, 0x0c(t0)
	
	// 设置UART_LCR, 8-1-0 (8个数据位,1个停止位,0个校验位)
	lw t1, 0x0c(t0)
	li t2, ~0xf
	and t1, t1, t2
	li t2, (0x3 << 0) | (0 << 2) | (0x0 << 3)
	or t1, t1, t2
	sw t1, 0x0c(t0)		

	ret

.global put_uart
put_uart:
	li t0, 0x02500000
.loop:
    /* UART_USR: 偏移地址0x7c, UART状态寄存器 */
	lw t1, 0x7c(t0)
	andi	t1, t1, (1<<1)
	beqz t1, .loop
	sb a0, (t0)

	ret

.global put_string_uart
put_string_uart:
	/*此时SP栈空间还没分配，把返回地址ra保存到临时寄存器中*/
	mv s8, ra
	mv a5, a0

.loop1:
	lbu a0,(a5)
	beqz  a0, .L2 
	call put_uart
	addi a5,a5,1
	j .loop1
.L2:
	/*恢复返回地址ra*/
	mv ra, s8
	ret
