/*
 * sys-uart.c
 *
 * Copyright(c) 2007-2022 Jianjun Jiang <8192542@qq.com>
 * Official site: http://xboot.org
 * Mobile phone: +86-18665388956
 * QQ: 8192542
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 */

#include <xboot.h>
#include "asm/plic.h"

void uart_init(void)
{
	virtual_addr_t addr;
	u32_t val;
#if 0
	/* Config GPIOE2 and GPIOE3 to txd0 and rxd0 */
	addr = 0x020000c0 + 0x0;
	val = read32(addr);
	val &= ~(0xf << ((2 & 0x7) << 2));
	val |= ((0x6 & 0xf) << ((2 & 0x7) << 2));
	write32(addr, val);

	val = read32(addr);
	val &= ~(0xf << ((3 & 0x7) << 2));
	val |= ((0x6 & 0xf) << ((3 & 0x7) << 2));
	write32(addr, val);
#else
        /* Config GPIOF2 and GPIOF4 to txd0 and rxd0 */
        addr = 0x02000000 + 0xf0;
        val = read32(addr);
        val &= ~(0xf << ((2 & 0x7) << 2));
        val |= ((0x3 & 0xf) << ((2 & 0x7) << 2));
        write32(addr, val);

        val = read32(addr);
        val &= ~(0xf << ((4 & 0x7) << 2));
        val |= ((0x3 & 0xf) << ((4 & 0x7) << 2));
        write32(addr, val);
#endif	
	/* Open the clock gate for uart0 */
	addr = 0x0200190c;
	val = read32(addr);
	val |= 1 << 0;
	write32(addr, val);

	/* Deassert uart0 reset */
	addr = 0x0200190c;
	val = read32(addr);
	val |= 1 << 16;
	write32(addr, val);

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
     *  UART_LCR  0x0C  // UART Line Control Register 
     *  UART_MCR  0x10  // Modem Control Register
     */
	addr = 0x02500000;
	write32(addr + 0x04, 0x0);

    /* bit[7:6] = 0b00, Rx FIFO接收到1个字符就触发中断
     * bit[5:4] = 0b11, Tx FIFO中数据少于二分之一时触发中断
     * bit[3] = 0, Mode 0
     * bit[2:1] = 0b00, 不复位FIFO, 汇编里也使用UART了, 不要破坏FIFO里原有的数据 
     * bit[0] = 1, 使能FIFO
     */
	write32(addr + 0x08, 0x31);  
	//write32(addr + 0x08, 0xf7);
	write32(addr + 0x10, 0x0);
	val = read32(addr + 0x0c);
	val |= (1 << 7);
	write32(addr + 0x0c, val);
	write32(addr + 0x00, 0xd & 0xff);
	write32(addr + 0x04, (0xd >> 8) & 0xff);
	val = read32(addr + 0x0c);
	val &= ~(1 << 7);

	write32(addr + 0x0c, val);
	val = read32(addr + 0x0c);
	val &= ~0x1f;
	val |= (0x3 << 0) | (0 << 2) | (0x0 << 3);
	write32(addr + 0x0c, val);

    /* bit[0] = 1, Enable Received Data Available Interrup */
	write32(addr + 0x04, 1);
}


char uart_recv ( void )
{
	virtual_addr_t addr = 0x02500000;

	while((read32(addr + 0x7c) & (0x1 << 3)) == 0);
	return read8(addr + 0x00);
}


void handle_uart_irq(void)
{
	char c;    
    extern int printk(const char *fmt, ...);

	c = uart_recv();
	if (c < 0)
		return;
	else if (c == '\r') {
		printk("%s occurred\n", __func__);
	}
}

void enable_uart_plic()
{
	/* TODO: using CPU0 now*/
	int cpu = 0;

	uart_init();

	//plic_enable_irq_for_hart(CPU_TO_M_HART(cpu), UART0_IRQ, 1);
	plic_enable_irq_for_hart(CPU_TO_S_HART(cpu), UART0_IRQ, 1);
}


