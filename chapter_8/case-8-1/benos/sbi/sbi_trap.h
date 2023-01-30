#ifndef	_SBI_TRAP_H
#define	_SBI_TRAP_H

#define CAUSE_SUPERVISOR_ECALL	0x9

void sbi_trap_init(void);
void sbi_trap_handler(struct sbi_trap_regs *regs);

#endif
