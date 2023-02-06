# 1 "sbi/sbi_lib.c"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_7\\lab7-6\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sbi/sbi_lib.c"
# 1 "include/asm/csr.h" 1
# 2 "sbi/sbi_lib.c" 2




unsigned long read_csr_num(int csr_num)
{
 unsigned long ret = 0;

 switch (csr_num) {
 case 0x3a0:
  ret = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "0x3a0" : "=r" (__v) : : "memory"); __v; });
  break;
 case 0x3b0:
  ret = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "0x3b0" : "=r" (__v) : : "memory"); __v; });
  break;
 case 0x3b1:
  ret = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "0x3b1" : "=r" (__v) : : "memory"); __v; });
  break;
 case 0x3b2:
  ret = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "0x3b2" : "=r" (__v) : : "memory"); __v; });
  break;
 case 0x3b3:
  ret = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "0x3b3" : "=r" (__v) : : "memory"); __v; });
  break;
 case 0x3b4:
  ret = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "0x3b4" : "=r" (__v) : : "memory"); __v; });
  break;
 case 0x3b5:
  ret = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "0x3b5" : "=r" (__v) : : "memory"); __v; });
  break;
 case 0x3b6:
  ret = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "0x3b6" : "=r" (__v) : : "memory"); __v; });
  break;
 case 0x3b7:
  ret = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "0x3b7" : "=r" (__v) : : "memory"); __v; });
  break;
 default:
  break;
 };

 return ret;
}

void write_csr_num(int csr_num, unsigned long val)
{
 switch (csr_num) {
 case 0x3a0:
  ({ unsigned long __v = (unsigned long)(val); __asm__ __volatile__ ("csrw ""0x3a0"", %0" : : "rK" (__v) : "memory"); });
  break;
 case 0x3b0:
  ({ unsigned long __v = (unsigned long)(val); __asm__ __volatile__ ("csrw ""0x3b0"", %0" : : "rK" (__v) : "memory"); });
  break;
 case 0x3b1:
  ({ unsigned long __v = (unsigned long)(val); __asm__ __volatile__ ("csrw ""0x3b1"", %0" : : "rK" (__v) : "memory"); });
  break;
 case 0x3b2:
  ({ unsigned long __v = (unsigned long)(val); __asm__ __volatile__ ("csrw ""0x3b2"", %0" : : "rK" (__v) : "memory"); });
  break;
 case 0x3b3:
  ({ unsigned long __v = (unsigned long)(val); __asm__ __volatile__ ("csrw ""0x3b3"", %0" : : "rK" (__v) : "memory"); });
  break;
 case 0x3b4:
  ({ unsigned long __v = (unsigned long)(val); __asm__ __volatile__ ("csrw ""0x3b4"", %0" : : "rK" (__v) : "memory"); });
  break;
 case 0x3b5:
  ({ unsigned long __v = (unsigned long)(val); __asm__ __volatile__ ("csrw ""0x3b5"", %0" : : "rK" (__v) : "memory"); });
  break;
 case 0x3b6:
  ({ unsigned long __v = (unsigned long)(val); __asm__ __volatile__ ("csrw ""0x3b6"", %0" : : "rK" (__v) : "memory"); });
  break;
 case 0x3b7:
  ({ unsigned long __v = (unsigned long)(val); __asm__ __volatile__ ("csrw ""0x3b7"", %0" : : "rK" (__v) : "memory"); });
  break;
 default:
  break;
 };
}

unsigned long log2roundup(unsigned long x)
{
 unsigned long ret = 0;

 while (ret < 64) {
  if (x <= (1UL << ret))
   break;
  ret++;
 }

 return ret;
}
