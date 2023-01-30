#ifndef _ASM_RISCV_IRQ_H
#define _ASM_RISCV_IRQ_H

#include "asm/csr.h"

extern void handle_uart_irq(void);

/* enable interrupts */
static inline void arch_local_irq_enable(void)
{
	csr_set(sstatus, SR_SIE);
}

/* disable interrupts */
static inline void arch_local_irq_disable(void)
{
	csr_clear(sstatus, SR_SIE);
}

static inline void enable_external_irq(void)
{
	csr_set(sie, SIE_SEIE);
}

#endif /*_ASM_RISCV_IRQ_H*/
