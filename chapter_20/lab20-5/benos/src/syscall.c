#include <asm/syscall.h>
#include <uapi/syscall.h>
#include "fs.h"

static long sys_ni_syscall(struct pt_regs *regs)
{
	return -1;
}

static void invoke_syscall(struct pt_regs *regs, int syscall_no,
		int syscall_nr, const syscall_fn_t syscall_table[])
{
	long ret;
	syscall_fn_t fn;

	if (syscall_no < syscall_nr) {
		fn = syscall_table[syscall_no];
		ret = fn(regs);
	} else {
		ret = sys_ni_syscall(regs);
	}

	regs->a0 = ret;
}

static void riscv_syscall_common(struct pt_regs *regs, int syscall_no,
		int syscall_nr, const syscall_fn_t syscall_table[])
{
	//regs->orig_a0 = regs->a0;

	invoke_syscall(regs, syscall_no, syscall_nr, syscall_table);
}

/*
 * 处理系统调用
 * 参数： struct pt_regs *
 */
void riscv_svc_handler(struct pt_regs *regs)
{
	return riscv_syscall_common(regs, regs->a7,
			__NR_syscalls, syscall_table);
}

long __riscv_sys_open(struct pt_regs *regs)
{
	return sys_open((const char *)regs->a0,
			regs->a1, regs->a2);

}

long __riscv_sys_close(struct pt_regs *regs)
{
	return sys_close(regs->a0);

}

long __riscv_sys_read(struct pt_regs *regs)
{
	return sys_read(regs->a0, (char *)regs->a1,
			regs->a2);

}

long __riscv_sys_write(struct pt_regs *regs)
{
	return sys_write(regs->a0, (char *)regs->a1,
			regs->a2);

}

long __riscv_sys_clone(struct pt_regs *regs)
{
	return do_fork(regs->a0, regs->a1,
			regs->a2);
}

long __riscv_sys_malloc(struct pt_regs *regs)
{
	unsigned long addr;

	addr = get_free_page();
	if (!addr)
		return -1;

	return addr;
}

#define __SYSCALL(nr, sym) [nr] = (syscall_fn_t)__riscv_##sym,

/*
 * 创建一个系统调用表syscall_table
 * 每个表项是一个函数指针syscall_fn_t
 */
const syscall_fn_t syscall_table[__NR_syscalls] = {
	__SYSCALL(__NR_open, sys_open)
	__SYSCALL(__NR_close, sys_close)
	__SYSCALL(__NR_read, sys_read)
	__SYSCALL(__NR_write, sys_write)
	__SYSCALL(__NR_clone, sys_clone)
	__SYSCALL(__NR_malloc, sys_malloc)
};
