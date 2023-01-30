#include "asm/uart.h"

.align 2
.globl __init_uart
__init_uart:
	/* disable interrupt */
	la t0, UART_IER
	sb x0, (t0)

	/* Enable DLAB (set baud rate divisor)*/
	la t0, UART_LCR
	li t1, 0x80
	sb t1, (t0)

	la t0, UART_DLL
	li t1, 1
	sb t1, (t0)

	la t0, UART_DLM
	sb x0, (t0)

	/*8 bits, no parity, one stop bit*/
	la t0, UART_LCR
	li t1, 3
	sb t1, (t0)

	/* 使能FIFO，清空FIFO，设置14字节threshold*/
	la t0, UART_FCR
	li t1, 0xc7
	sb t1, (t0)

	ret

.global put_uart
put_uart:
.loop:
	la t0, UART_LSR
	lbu t1, (t0)

	andi	t1,t1, 0x40
	beqz t1, .loop

	la t0, UART_DAT
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
