# 1 "sbi/sbi_trap.c"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_8\\lab8-1\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sbi/sbi_trap.c"
# 1 "include/asm/sbi.h" 1
# 31 "include/asm/sbi.h"
static inline void sbi_set_timer(unsigned long stime_value)
{
 ({ register unsigned long a0 asm ("a0") = (unsigned long)(stime_value); register unsigned long a1 asm ("a1") = (unsigned long)(0); register unsigned long a2 asm ("a2") = (unsigned long)(0); register unsigned long a7 asm ("a7") = (unsigned long)(0); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });
}

static inline void sbi_putchar(unsigned char c)
{
 ({ register unsigned long a0 asm ("a0") = (unsigned long)(c); register unsigned long a1 asm ("a1") = (unsigned long)(0); register unsigned long a2 asm ("a2") = (unsigned long)(0); register unsigned long a7 asm ("a7") = (unsigned long)(0x1); asm volatile ("ecall" : "+r" (a0) : "r" (a1), "r" (a2), "r" (a7) : "memory"); a0; });
}

static inline void sbi_put_string(char *str)
{
 int i;

 for (i = 0; str[i] != '\0'; i++)
  sbi_putchar((char) str[i]);
}
# 2 "sbi/sbi_trap.c" 2
# 1 "include/asm/csr.h" 1
# 3 "sbi/sbi_trap.c" 2
# 1 "include/uart.h" 1



void uart_init ( void );
char uart_recv ( void );
void uart_send ( char c );
void uart_send_string(char* str);
int putchar(int c);
# 4 "sbi/sbi_trap.c" 2
# 1 "sbi/sbi_trap_regs.h" 1
# 13 "sbi/sbi_trap_regs.h"
struct sbi_trap_regs {

 unsigned long mepc;
 unsigned long ra;
 unsigned long sp;
 unsigned long gp;
 unsigned long tp;
 unsigned long t0;
 unsigned long t1;
 unsigned long t2;
 unsigned long s0;
 unsigned long s1;
 unsigned long a0;
 unsigned long a1;
 unsigned long a2;
 unsigned long a3;
 unsigned long a4;
 unsigned long a5;
 unsigned long a6;
 unsigned long a7;
 unsigned long s2;
 unsigned long s3;
 unsigned long s4;
 unsigned long s5;
 unsigned long s6;
 unsigned long s7;
 unsigned long s8;
 unsigned long s9;
 unsigned long s10;
 unsigned long s11;
 unsigned long t3;
 unsigned long t4;
 unsigned long t5;
 unsigned long t6;

 unsigned long mstatus;
};
# 5 "sbi/sbi_trap.c" 2
# 1 "sbi/sbi_trap.h" 1





void sbi_trap_init(void);
void sbi_trap_handler(struct sbi_trap_regs *regs);
# 6 "sbi/sbi_trap.c" 2

static int sbi_ecall_handle(unsigned int id, struct sbi_trap_regs *regs)
{
 int ret = 0;

 switch (id) {
 case 0x1:
  putchar(regs->a0);
  ret = 0;
  break;
 }


 if (!ret)
  regs->mepc += 4;

 return ret;
}

void sbi_trap_handler(struct sbi_trap_regs *regs)
{
 unsigned long mcause = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "mcause" : "=r" (__v) : : "memory"); __v; });
 unsigned long ecall_id = regs->a7;

 switch (mcause) {
 case 0x9:
  sbi_ecall_handle(ecall_id, regs);
  break;
 default:
  break;
 }
}

extern void sbi_exception_vector(void);

void sbi_trap_init(void)
{

 ({ unsigned long __v = (unsigned long)(sbi_exception_vector); __asm__ __volatile__ ("csrw ""mtvec"", %0" : : "rK" (__v) : "memory"); });

 ({ unsigned long __v = (unsigned long)(0); __asm__ __volatile__ ("csrw ""mie"", %0" : : "rK" (__v) : "memory"); });
}
