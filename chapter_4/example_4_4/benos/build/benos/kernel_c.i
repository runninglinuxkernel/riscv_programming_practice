# 1 "src/kernel.c"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_4\\example_4_4\\benos//"
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
# 1 "include/printk.h" 1



void init_printk_done(void);
int printk(const char *fmt, ...);
# 5 "src/kernel.c" 2

extern void dump_stack(void);

int add_c(int a, int b)
{
 dump_stack();
 return a + b;
}

int func1(void)
{
 int a = 1;
 int b = 2;

 return add_c(a, b);
}

void kernel_main(void)
{
 sys_clock_init();
 uart_init();
 init_printk_done();

 func1();

 while(1)
  ;

}
