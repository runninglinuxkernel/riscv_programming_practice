#include "type.h"
#include "printk.h"

#define KSYM_NAME_LEN 128

/*
 *
 * 编译kallsyms过程, 由如下步骤：
 * 1） 先link一个.tmp_vmbenos1
 * 2） 读符号表，导出汇编文件：
 *     aarch64-linux-gnu-nm -n .tmp_vmbenos1 |
 *                          scripts/kallsyms > .tmp_kallsyms1.S
 *
 * 3)  编译汇编文件：
 *     aarch64-linux-gnu-gcc .tmp_kallsyms1.S -o .tmp_kallsyms1.o
 *
 * 4)  加上.tmp_kallsyms1.o，重新link一个新的.tmp_vmbenos2
 *     这个新的vmbenos包含了kallsyms本身的符号表
 * 5） 再导出一次汇编文件：
 *     aarch64-linux-gnu-nm -n .tmp_vmbenos2 |
 *                           scripts/kallsyms > .tmp_kallsyms2.S
 *
 * 6） 编译汇编文件：
 *     aarch64-linux-gnu-gcc .tmp_kallsyms2.S -o .tmp_kallsyms2.o
 *
 * 7） 最后，加上.tmp_kallsyms2.o来link成最终的benos。
 *
 * kallsyms表的查表过程。
 *
 * 1. 通过addr来查找kallsyms_addresses表，找到addr属于哪个函数的地址范围,
 *    从而得到addr对应该表的index。
 *    kallsyms_addresses表用来存储 每个函数在代码段的起始地址和结束地址。
 *
 * 2. kallsyms_names是用来存储信息的另外一个表。
 *    kallsyms_addresses表的每个表项， 在kallsyms_names对应的存储格式为：
 *
 *              [长度][内容]
 *
 *  由步骤1得到了index，从而可以找到该index在kallsyms_names的存储内容。
 *  由get_symbol_offset()函数来实现
 *
 *  3. kallsyms_names存储的内容，用来查询另外一个表kallsyms_token_index，
 *     kallsyms_token_index表里存储了另外一个表kallsyms_token_table的偏移。
 *     kallsyms_token_table表里存储了常用的函数名。
 */

/* symbol 和地址 对应的表 */
extern unsigned long kallsyms_addresses[] __attribute__((weak));

/* 有多少个symbol的表项 */
extern unsigned int kallsyms_num_syms __attribute__((weak));

/* 用来存储地址对应的函数名 */
extern u8 kallsyms_names[] __attribute__((weak));

/* 查表,类似一张自定义的ASCII码表 */
extern u8 kallsyms_token_table[] __attribute__((weak));
extern u16 kallsyms_token_index[] __attribute__((weak));

extern unsigned int kallsyms_markers[] __attribute__((weak));

extern char _stext[], _etext[];

static int is_kernel(unsigned long addr)
{
	if (addr >= (unsigned long)_stext &&
			addr <= (unsigned long)_etext)
		return 1;
	else
		return 0;
}

static unsigned int get_symbol_offset(unsigned long pos)
{
	const u8 *name;
	int i;

	name = &kallsyms_names[kallsyms_markers[pos>>8]];

	for (i = 0; i < (pos & 0xFF); i++)
		name = name + (*name) + 1;

	return name - kallsyms_names;
}

static unsigned int kallsyms_expand_symbol(unsigned int off, char *result)
{
	int len, skipped_first = 0;
	u8 *tptr, *data;

	data = &kallsyms_names[off];
	len = *data;
	data++;

	off += len + 1;

	while (len) {
		tptr = &kallsyms_token_table[kallsyms_token_index[*data]];
		data++;
		len--;

		while (*tptr) {
			if (skipped_first) {
				*result = *tptr;
				result++;
			} else
				skipped_first = 1;
			tptr++;
		}
	}

	*result = '\0';

	return off;
}

const char *kallsyms_lookup(unsigned long addr, unsigned long *symbolsize,
		unsigned long *offset, char *namebuf)
{
	unsigned long i, low, high, mid;

	namebuf[KSYM_NAME_LEN-1] = 0;
	namebuf[0] = 0;

	if (is_kernel(addr)) {
		unsigned long symbol_end = 0;

		/* do a binary search on the sorted kallsyms_addresses array */
		low = 0;
		high = kallsyms_num_syms;

		while (high - low > 1) {
			mid = (low + high)/2;
			if (kallsyms_addresses[mid] <= addr)
				low = mid;
			else
				high = mid;
		}

		/* get the name */
		kallsyms_expand_symbol(get_symbol_offset(low), namebuf);

		/* Search for next non-aliased symbol */
		for (i = low + 1; i < kallsyms_num_syms; i++) {
			if (kallsyms_addresses[i] > kallsyms_addresses[low]) {
				symbol_end = kallsyms_addresses[i];
				break;
			}
		}

		*symbolsize = symbol_end - kallsyms_addresses[low];
		*offset = addr - kallsyms_addresses[low];
		return namebuf;
	}

	return NULL;
}

void print_symbol(unsigned long addr)
{
	const char *name;
	unsigned long offset, size;
	char namebuf[KSYM_NAME_LEN];

	name = kallsyms_lookup(addr, &size, &offset, namebuf);
	if (!name)
		printk("[<0x%016lx>] ", addr);
	else {
		printk("[<0x%016lx>] ", addr);
		printk("%s+0x%lx/0x%lx\n", name, offset, size);
	}
}
