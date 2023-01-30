#include "asm/uart.h"
#include "io.h"
#include "asm/plic.h"
#include "asm/sbi.h"
#include "printk.h"

void uart_send(char c)
{
	while((readb(UART_LSR) & UART_LSR_EMPTY) == 0)
		;

	writeb(c, UART_DAT);
}

char uart_get(void)
{
	if (readb(UART_LSR) & UART_LSR_DR)
		return readb(UART_DAT);
	else
		return -1;
}

void uart_send_string(char *str)
{
	int i;

	for (i = 0; str[i] != '\0'; i++)
		uart_send((char) str[i]);
}

void putchar(char c)
{
       if (c == '\n')
               uart_send('\r');
       uart_send(c);
}

static unsigned int uart16550_clock = 1843200;   // a common base clock
#define UART_DEFAULT_BAUD  115200

void uart_init(void)
{
	unsigned int divisor = uart16550_clock / (16 * UART_DEFAULT_BAUD);

	/* disable interrupt */
	writeb(0, UART_IER);

	/* Enable DLAB (set baud rate divisor)*/
	writeb(0x80, UART_LCR);
	writeb((unsigned char)divisor, UART_DLL);
	writeb((unsigned char)(divisor >> 8), UART_DLM);

	/*8 bits, no parity, one stop bit*/
	writeb(0x3, UART_LCR);

	/* 使能FIFO，清空FIFO，设置14字节threshold*/
	writeb(0xc7, UART_FCR);

	/* 使能接收缓冲区满中断*/
	writeb(0x1, UART_IER);
}

