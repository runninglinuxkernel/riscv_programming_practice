#include "asm/sbi.h"
#include "asm/csr.h"
#include "uart.h"
#include "sbi_trap.h"
#include "sbi_error.h"
#include "printk.h"
#include "sbi_timer.h"
#include "asm/plic.h"
#include "asm/irq.h"
#include "io.h"

void sbi_panic()
{
	printk("sbi panic\n");
	while(1)
		;
}

static void sbi_trap_error(struct sbi_trap_regs *regs, const char *msg, int rc)
{
	printk("%s: %s (error %d)\n", __func__, msg, rc);
	printk("mcause: %016lx  mtval: %016lx \n",
		   read_csr(mcause), read_csr(mtval));

	printk("mepc: %016lx mstatus : %016lx\n",
		regs->mepc, regs->mstatus);
	printk(" gp : %016lx tp : %016lx t0 : %016lx\n",
		regs->gp, regs->tp, regs->t0);
	printk(" t1 : %016lx t2 : %016lx t3 : %016lx\n",
		regs->t1, regs->t2, regs->s0);
	printk(" s1 : %016lx a0 : %016lx a1 : %016lx\n",
		regs->s1, regs->a0, regs->a1);
	printk(" a2 : %016lx a3 : %016lx a4 : %016lx\n",
		regs->a2, regs->a3, regs->a4);
	printk(" a5 : %016lx a6 : %016lx a7 : %016lx\n",
		regs->a5, regs->a6, regs->a7);
	printk(" s2 : %016lx s3 : %016lx s4 : %016lx\n",
		regs->s2, regs->s3, regs->s4);
	printk(" s5 : %016lx s6 : %016lx s7 : %016lx\n",
		regs->s5, regs->s6, regs->s7);
	printk(" s8 : %016lx s9 : %016lx s10: %016lx\n",
		regs->s8, regs->s9, regs->s10);
	printk(" s11: %016lx t3 : %016lx t4: %016lx\n",
		regs->s11, regs->t3, regs->t4);
	printk(" t5 : %016lx t6 : %016lx sp: %016lx\n",
		regs->t5, regs->t6, regs->sp);
	printk(" ra: %016lx\n",
		regs->ra);

	sbi_panic();
}

static int sbi_ecall_handle(unsigned int id, struct sbi_trap_regs *regs)
{
	int ret = 0;

	switch (id) {
	case SBI_SET_TIMER:
		clint_timer_event_start(regs->a0);
		ret = 0;
		break;
    case SBI_GET_TIMER:
        regs->a0 = sbi_get_timer_val();
        ret = 0;
        break;
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

void sbi_plic_handle_irq(struct sbi_trap_regs *regs)
{
	int hwirq;
	/*TODO: only CPU0 handle it*/
	int hart = CPU_TO_M_HART(0);

	unsigned long claim_reg = PLIC_MCLAIM(hart);

    printk("sbi_plic_handle_irq\n");

	csr_clear(mie, MIE_MEIE);

	while((hwirq = readl(claim_reg))) {
		if (hwirq == UART0_IRQ)
			sbi_handle_uart_irq();

		writel(hwirq, claim_reg);
	}
	csr_set(mie, MIE_MEIE);
}

void sbi_trap_handler(struct sbi_trap_regs *regs)
{
	unsigned long mcause = read_csr(mcause);
	unsigned long ecall_id = regs->a7;
	int rc = SBI_ENOTSUPP;
	const char *msg = "trap handler failed";

	if (mcause & MCAUSE_IRQ) {
		mcause &=~ MCAUSE_IRQ;
		switch (mcause) {
		case IRQ_M_TIMER:
			sbi_timer_process();
            //printk("sbi_timer_process\n");
			break;
        case IRQ_M_EXT:
            sbi_plic_handle_irq(regs);
            break;
		default:
			msg = "unhandled external interrupt";
			goto trap_error;
		}
		return;
	}

	switch (mcause) {
	case CAUSE_SUPERVISOR_ECALL:
		rc = sbi_ecall_handle(ecall_id, regs);
		msg = "ecall handler failed";
		break;
	case CAUSE_LOAD_ACCESS:
	case CAUSE_STORE_ACCESS:
		msg = "load store access failed";
		break;
	default:
		break;
	}

trap_error:
	if (rc) {
		sbi_trap_error(regs, msg, rc);
	}
}

void delegate_traps(void)
{
	unsigned long interrupts;
	unsigned long exceptions;

	interrupts = MIP_SSIP | MIP_STIP | MIP_SEIP;
	//interrupts = MIP_SSIP | MIP_STIP;
	exceptions = (1UL << CAUSE_MISALIGNED_FETCH) | (1UL << CAUSE_FETCH_PAGE_FAULT) |
                         (1UL << CAUSE_BREAKPOINT) | (1UL << CAUSE_LOAD_PAGE_FAULT) |
                         (1UL << CAUSE_STORE_PAGE_FAULT) | (1UL << CAUSE_USER_ECALL) |
			 (1UL << CAUSE_LOAD_ACCESS) | (1UL << CAUSE_STORE_ACCESS) |
			 (1UL << CAUSE_ILLEGAL_INSTRUCTION) | (1UL << CAUSE_FETCH_ACCESS) | (1UL << CAUSE_MISALIGNED_LOAD);

	 write_csr(mideleg, interrupts);
	 write_csr(medeleg, exceptions);
}

extern void sbi_exception_vector(void);

void sbi_trap_init(void)
{
	/* 设置异常向量表地址 */
	write_csr(mtvec, sbi_exception_vector);
	/* 使能所有中断 */
	write_csr(mie, -1);
    
    printk("sbi_trap_init mie = 0x%lx\n", read_csr(mie));
}