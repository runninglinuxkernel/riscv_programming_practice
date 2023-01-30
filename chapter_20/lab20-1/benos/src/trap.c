#include "asm/csr.h"
#include "asm/ptregs.h"
#include "printk.h"
#include "io.h"
#include "type.h"
#include "asm/timer.h"
#include "asm/plic.h"
#include "irq.h"
#include "asm/syscall.h"
#include "asm/trap.h"
#include "asm/sbi.h"

extern void do_exception_vector(void);

struct fault_info {
	int (*fn)(struct pt_regs *regs, const char *name);
	const char *name;
};

void panic()
{
	printk("Kernel panic\n");
	while(1)
		;
}

void show_regs(struct pt_regs *regs)
{
	printk("sepc: %016lx ra : %016lx sp : %016lx\n",
		regs->sepc, regs->ra, regs->sp);
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
	printk(" t5 : %016lx t6 : %016lx\n",
		regs->t5, regs->t6);
}

static void do_trap_error(struct pt_regs *regs, const char *str)
{
	printk("Oops - %s\n", str);
	dump_stack(regs);
	show_regs(regs);
	printk("sstatus:0x%016lx  sbadaddr:0x%016lx  scause:0x%016lx\n",
			regs->sstatus, regs->sbadaddr, regs->scause);
	panic();
}

#define DO_ERROR_INFO(name)				\
int name(struct pt_regs *regs, const char *str)				\
{									\
	do_trap_error(regs, str);	\
	return 0;            \
}

DO_ERROR_INFO(do_trap_unknown);
DO_ERROR_INFO(do_trap_insn_misaligned);
DO_ERROR_INFO(do_trap_insn_fault);
DO_ERROR_INFO(do_trap_insn_illegal);
DO_ERROR_INFO(do_trap_load_misaligned);
DO_ERROR_INFO(do_trap_load_fault);
DO_ERROR_INFO(do_trap_store_misaligned);
DO_ERROR_INFO(do_trap_store_fault);
DO_ERROR_INFO(do_trap_ecall_u);
DO_ERROR_INFO(do_trap_ecall_s);
DO_ERROR_INFO(do_trap_break);
DO_ERROR_INFO(do_page_fault);

static const struct fault_info fault_info[] = {
	{do_trap_insn_misaligned, "Instruction address misaligned"},
	{do_trap_insn_fault, "Instruction access fault"},
	{do_trap_insn_illegal, "Illegal instruction"},
	{do_trap_break, "Breakpoint"},
	{do_trap_load_misaligned, "Load address misaligned"},
	{do_trap_load_fault, "Load access fault"},
	{do_trap_store_misaligned, "Store/AMO address misaligned"},
	{do_trap_store_fault, "Store/AMO access fault"},
	{do_trap_ecall_u, "Environment call from U-mode"},
	{do_trap_ecall_s, "Environment call from S-mode"},
	{do_trap_unknown, "unknown 10"},
	{do_trap_unknown, "unknown 11"},
	{do_page_fault, "Instruction page fault"},
	{do_page_fault, "Load page fault"},
	{do_trap_unknown, "unknown 14"},
	{do_page_fault, "Store/AMO page fault"},
};

static inline const struct fault_info *ec_to_fault_info(unsigned int scause)
{
	return fault_info + (scause & SCAUSE_EC);
}

#define INTERRUPT_CAUSE_SOFTWARE    1
#define INTERRUPT_CAUSE_TIMER       5
#define INTERRUPT_CAUSE_EXTERNAL    9

#define EXC_INST_MISALIGNED     0
#define EXC_INST_ACCESS         1
#define EXC_BREAKPOINT          3
#define EXC_LOAD_ACCESS         5
#define EXC_STORE_ACCESS        7
#define EXC_SYSCALL             8
#define EXC_INST_PAGE_FAULT     12
#define EXC_LOAD_PAGE_FAULT     13
#define EXC_STORE_PAGE_FAULT    15

static int vs_sbi_ecall_handle(unsigned int id, struct pt_regs *regs)
{
	int ret = 0;

	switch (id) {
	case SBI_EXIT_VM_TEST:
		printk("%s: running in HS mode\n", __func__);
		printk("hstatus 0x%lx\n", read_csr(CSR_HSTATUS));
		ret = 0;
		break;
	}

	/* 系统调用返回的是系统调用指令（例如ECALL指令）的下一条指令 */
	if (!ret)
		regs->sepc += 4;

	return ret;
}

int do_exception(struct pt_regs *regs, unsigned long scause)
{
	const struct fault_info *inf;
	unsigned long ecall_id = regs->a7;
	const char *msg = "trap handler failed";
	int ret = 0;

	//printk("%s, scause:0x%lx, sstatus=0x%lx\n", __func__, scause, regs->sstatus);

	if (is_interrupt_fault(scause)) {
		switch (scause &~ SCAUSE_INT) {
		case INTERRUPT_CAUSE_TIMER:
			handle_timer_irq();
			break;
		case INTERRUPT_CAUSE_EXTERNAL:
			plic_handle_irq(regs);
			break;
		case INTERRUPT_CAUSE_SOFTWARE:
		/* handle IPI */
			break;
		default:
			printk("unexpected interrupt cause");
			panic();
		}
	} else {
		switch (scause) {
		case EXC_SYSCALL:
			/*
			 * 这里要先让sepc加4个字节，否则clone/fork系统调用创建的子进程会有问题。
			 * 因为子进程拷贝父进程的regs，子进程的sepc没加4,子进程sret返回到
			 * 用户空间时导致处理器出问题。
			 */
			regs->sepc += 4;
			riscv_svc_handler(regs);
			break;
		 case CAUSE_VIRTUAL_SUPERVISOR_ECALL:
			ret = vs_sbi_ecall_handle(ecall_id, regs);
			msg = "virtual ecall handler failed";
			break;
		default:
			inf = ec_to_fault_info(scause);
			if (!inf->fn(regs, inf->name))
			return;
		}
	}

	if (ret) {
		printk("%s\n", msg);
		panic();
	}

	return ret;
}

static void hs_delegate_traps(void)
{
	unsigned long exceptions;

	exceptions = (1UL << CAUSE_MISALIGNED_FETCH) | (1UL << CAUSE_FETCH_PAGE_FAULT) |
                         (1UL << CAUSE_BREAKPOINT) | (1UL << CAUSE_LOAD_PAGE_FAULT) |
                         (1UL << CAUSE_STORE_PAGE_FAULT) | (1UL << CAUSE_USER_ECALL) |
			 (1UL << CAUSE_LOAD_ACCESS) | (1UL << CAUSE_STORE_ACCESS) |
			 (1UL << CAUSE_ILLEGAL_INSTRUCTION);

	write_csr(CSR_HEDELEG, exceptions);
}

void trap_init(void)
{
	hs_delegate_traps();

	write_csr(sscratch, 0);
	/* 设置异常向量表地址 */
	write_csr(stvec, do_exception_vector);
	printk("stvec=0x%x, 0x%x\n", read_csr(stvec), do_exception_vector);
	/* 使能所有中断 */
	write_csr(sie, -1);
}
