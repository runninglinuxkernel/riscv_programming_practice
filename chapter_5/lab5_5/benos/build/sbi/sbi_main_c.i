# 1 "sbi/sbi_main.c"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_5\\lab5_5\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sbi/sbi_main.c"
# 1 "include/asm/csr.h" 1
# 2 "sbi/sbi_main.c" 2



extern unsigned long log2roundup(unsigned long x);
extern unsigned long read_csr_num(int csr_num);
extern void write_csr_num(int csr_num, unsigned long val);


int sbi_set_pmp(int reg_idx, unsigned long start, unsigned long size, unsigned long prot)
{
 int order;
 int pmpcfg_csr, pmpcfg_shift, pmpaddr_csr;
 unsigned long cfgmask, pmpcfg;
 unsigned long addrmask, pmpaddr;

 if (reg_idx > 8)
  return -1;

 order = log2roundup(size);
 if (order < 2)
  return -1;

 pmpaddr = start >> 2;


 pmpcfg_csr = (0x3a0 + (reg_idx >> 2)) & ~1;
 pmpcfg_shift = (reg_idx & 7) << 3;

 pmpaddr_csr = 0x3b0 + reg_idx;


 prot &= ~0x18UL;
 prot |= (order == 2) ? 0x10UL : 0x18UL;


 cfgmask = ~(0xffUL << pmpcfg_shift);
 pmpcfg = (read_csr_num(pmpcfg_csr) & cfgmask);
 pmpcfg |= ((prot << pmpcfg_shift) & ~cfgmask);






 if (order > 2)
 {
  if (order == 64) {
   pmpaddr = -1UL;
  } else {




   addrmask = (1UL << (order - 2)) - 1;
   pmpaddr &= ~addrmask;
   pmpaddr |= (addrmask >> 1);
  }
 }



 write_csr_num(pmpaddr_csr, pmpaddr);
 write_csr_num(pmpcfg_csr, pmpcfg);

 return 0;
}





void sbi_main(void)
{
 unsigned long val;




 sbi_set_pmp(0, 0, -1UL, (0x01UL | 0x02UL | 0x04UL));



 val = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "mstatus" : "=r" (__v) : : "memory"); __v; });
 val = (((val) & ~((3UL << 11))) | (((1UL)) * (((3UL << 11)) & ~(((3UL << 11))-1))));
 val = (((val) & ~(0x00000080UL)) | ((0) * ((0x00000080UL) & ~((0x00000080UL)-1))));
 ({ unsigned long __v = (unsigned long)(val); __asm__ __volatile__ ("csrw ""mstatus"", %0" : : "rK" (__v) : "memory"); });


 ({ unsigned long __v = (unsigned long)(0x22000); __asm__ __volatile__ ("csrw ""mepc"", %0" : : "rK" (__v) : "memory"); });
 ({ unsigned long __v = (unsigned long)(0x20000); __asm__ __volatile__ ("csrw ""mtvec"", %0" : : "rK" (__v) : "memory"); });


 ({ unsigned long __v = (unsigned long)(0x22000); __asm__ __volatile__ ("csrw ""stvec"", %0" : : "rK" (__v) : "memory"); });


 ({ unsigned long __v = (unsigned long)(0); __asm__ __volatile__ ("csrw ""sie"", %0" : : "rK" (__v) : "memory"); });

 ({ unsigned long __v = (unsigned long)(0); __asm__ __volatile__ ("csrw ""satp"", %0" : : "rK" (__v) : "memory"); });


 asm volatile("mret");
}
