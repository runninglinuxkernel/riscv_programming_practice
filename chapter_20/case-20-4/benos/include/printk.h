#ifndef	_PRINTK_H
#define	_PRINTK_H

void init_printk_done(void (*fn)(char c));

int printk(const char *fmt, ...);

struct pt_regs;
void print_symbol(unsigned long addr);
void panic(void);
void dump_stack(struct pt_regs *regs);

#endif /*_PRINTK_H*/

