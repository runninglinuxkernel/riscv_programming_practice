#ifndef _ASM_RISCV_PLIC_H
#define _ASM_RISCV_PLIC_H

#include "asm/ptregs.h"

#define MAX_PLIC_IRQS 53

#define UART0_IRQ (10)

#define PLIC_BASE 0xc000000UL
#define PLIC_END 0x10000000UL

#define PLIC_ENBL_OFF 0x2000UL
#define PLIC_CLAIMCMPLT_OFF 0x200000UL

/* 设置每个中断的优先级 */
#define PLIC_PRIORITY(id) (PLIC_BASE + (id) * 4)

/* 每个中断的pending位，一个bit表示一个中断 */
#define PLIC_PENDING(id) (PLIC_BASE + 0x1000 + ((id) / 32) * 4)

/* 中断使能位: 每个处理器核心都有对应的中断使能位*/
#define PLIC_MENABLE(hart) (PLIC_BASE + 0x2000 + (hart) * 0x80)

/* 设置每个处理器中每个中断的优先级threshold，当中断优先级大于threshold才会触发中断 */
#define PLIC_MTHRESHOLD(hart) (PLIC_BASE + 0x200000 + (hart) * 0x1000)

/* Interrupt Claim Process*/
#define PLIC_MCLAIM(hart) (PLIC_BASE + 0x200004 + (hart) * 0x1000)

/* Interrupt Completion*/
#define PLIC_MCOMPLETE(hart) (PLIC_BASE + 0x200004 + (hart) * 0x1000)

int plic_init();
void plic_set_prority(int hwirq, int pro);
void plic_enable_irq(int cpu, int hwirq, int enable);
void plic_handle_irq(struct pt_regs *regs);

#endif /* _ASM_RISCV_PLIC_H */
