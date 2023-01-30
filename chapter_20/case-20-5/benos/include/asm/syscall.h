#ifndef _BENOS_ASM_SYSCALL_H
#define _BENOS_ASM_SYSCALL_H

#include <sched.h>

typedef long (*syscall_fn_t)(struct pt_regs *);

extern const syscall_fn_t syscall_table[];

void riscv_svc_handler(struct pt_regs *regs);

#endif
