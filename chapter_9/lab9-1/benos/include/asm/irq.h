#ifndef _ASM_RISCV_IRQ_H
#define _ASM_RISCV_IRQ_H

#include "asm/csr.h"

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

#endif /*_ASM_RISCV_IRQ_H*/
