# 1 "src/kernel.c"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_3\\lab3_8\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/kernel.c"
# 1 "include/clock.h" 1



void sys_clock_init(void);
# 2 "src/kernel.c" 2
# 1 "include/uart.h" 1



void uart_init ( void );
char uart_recv ( void );
void uart_send ( char c );
void uart_send_string(char* str);
# 3 "src/kernel.c" 2
# 1 "include/memset.h" 1



# 1 "include/types.h" 1







typedef signed char s8_t;
typedef unsigned char u8_t;

typedef signed short s16_t;
typedef unsigned short u16_t;

typedef signed int s32_t;
typedef unsigned int u32_t;

typedef signed long long s64_t;
typedef unsigned long long u64_t;

typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;

typedef signed long long ptrdiff_t;
typedef signed long long intptr_t;
typedef unsigned long long uintptr_t;

typedef unsigned long long size_t;
typedef signed long long ssize_t;

typedef signed long off_t;
typedef signed long long loff_t;

typedef signed int bool_t;
typedef unsigned long irq_flags_t;

typedef unsigned long long virtual_addr_t;
typedef unsigned long long virtual_size_t;
typedef unsigned long long physical_addr_t;
typedef unsigned long long physical_size_t;

typedef struct {
 volatile int counter;
} atomic_t;

typedef struct {
 volatile int lock;
} spinlock_t;
# 5 "include/memset.h" 2

void *memset(void *s, int c, size_t count);
# 4 "src/kernel.c" 2

extern void load_store_test(void);
extern void pc_related_test(void);
extern void shift_test(void);
extern void add_sub_test(void);
extern unsigned long compare_and_return(unsigned long a, unsigned long b);
extern unsigned long sel_test(unsigned long a, unsigned long b);
extern void my_memcpy_test(void);
extern void branch_test(void);

void asm_test(void)
{
 unsigned long val1, val2;

 load_store_test();
 pc_related_test();
 shift_test();
 add_sub_test();
 val1 = compare_and_return(10, 9);
       if (val1 == 0)
               uart_send_string("compare_and_return ok\r\n");
       else
               uart_send_string("compare_and_return fail\r\n");

       val2 = compare_and_return(9, 10);
       if (val2 == 0xffffffffffffffff)
               uart_send_string("compare_and_return ok\r\n");
       else
        uart_send_string("compare_and_return fail\r\n");

       val1 = sel_test(0, 9);
       if (val1 == 11)
        uart_send_string("sel test ok\r\n");

       val2 = sel_test(5, 2);
       if (val2 == 1)
        uart_send_string("sel test ok\r\n");

       my_memcpy_test();
       memset((void *)0x20000, 0x55, 40);

       branch_test();
       uart_send_string("branch test done\r\n");
}

void kernel_main(void)
{
 sys_clock_init();
 uart_init();
 uart_send_string("Welcome RISC-V!\r\n");

 asm_test();

 while (1) {
  ;
 }
}
