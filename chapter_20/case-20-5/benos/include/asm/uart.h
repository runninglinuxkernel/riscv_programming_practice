#ifndef	_UART_H
#define	_UART_H

#define UART        0x10000000
#define UART_SIZE   4096

/* THR:transmitter holding register */
#define UART_DAT    (UART+0x00) /* 数据寄存器*/
#define UART_IER    (UART+0x01) /* 中断使能寄存器*/
#define UART_IIR    (UART+0x02) /* 中断标识寄存器 (read only)*/
#define UART_FCR    (UART+0x02) /* FIFO控制寄存器 (write only)*/
#define UART_LCR    (UART+0x03) /* 线路控制寄存器*/
#define UART_MCR    (UART+0x04) /* MODEN控制寄存器*/
#define UART_LSR    (UART+0x05) /* 线路状态寄存器*/
#define UART_MSR    (UART+0x06) /* MODEN状态寄存器*/

#define UART_DLL (UART+0x00)  /*预分频寄存器低8位*/
#define UART_DLM (UART+0x01)  /*预分频寄存器高8位*/

#define UART_LSR_ERROR   0x80  /* 出错 */
#define UART_LSR_EMPTY    0x40  /* 传输FIFO和移位寄存器为空 */
#define UART_LSR_TFE	    0x20  /* 传输FIFO为空 */
#define UART_LSR_BI	    0x10  /* 传输被打断 */
#define UART_LSR_FE	    0x08  /* 接收到没有停止位的帧 */
#define UART_LSR_PE	    0x04  /* 奇偶校验错误位 */
#define UART_LSR_OE	    0x02  /* 数据溢出 */
#define UART_LSR_DR	    0x01  /* FIFO有数据 */

#endif  /*_UART_H */
