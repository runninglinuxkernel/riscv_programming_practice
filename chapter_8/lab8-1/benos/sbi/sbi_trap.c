#include "asm/sbi.h"
#include "asm/csr.h"
#include "uart.h"
#include "sbi_trap_regs.h"
#include "sbi_trap.h"

static int sbi_ecall_handle(unsigned int id, struct sbi_trap_regs *regs)
{
	int ret = 0;

	switch (id) {
	case SBI_CONSOLE_PUTCHAR:
		putchar(regs->a0);
		ret = 0;
		break;
	}

	/* 系统调用返回的是系统调用指令（例如ECALL指令）的下一条指令 */
	if (!ret)
		regs->mepc += 4;

	return ret;
}

void sbi_trap_handler(struct sbi_trap_regs *regs)
{
	unsigned long mcause = read_csr(mcause);
	unsigned long ecall_id = regs->a7;

	switch (mcause) {
	case CAUSE_SUPERVISOR_ECALL:
		sbi_ecall_handle(ecall_id, regs);
		break;
	default:
		break;
	}
}

extern void sbi_exception_vector(void);

void sbi_trap_init(void)
{
	/* 设置异常向量表地址 */
	write_csr(mtvec, sbi_exception_vector);
	/* 关闭所有中断 */
	write_csr(mie, 0);
}
