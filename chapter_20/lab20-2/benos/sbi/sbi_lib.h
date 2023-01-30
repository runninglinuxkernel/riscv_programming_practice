#ifndef __SBI_LIB_H__
#define __SBI_LIB_H__

unsigned long read_csr_num(int csr_num);
void write_csr_num(int csr_num, unsigned long val);
unsigned long log2roundup(unsigned long x);

#endif
