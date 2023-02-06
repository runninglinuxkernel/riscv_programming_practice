# 1 "src/kernel.c"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_5\\lab5_5\\benos//"
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
# 4 "src/kernel.c" 2
# 1 "include/memset.h" 1



# 1 "include/types.h" 1
# 5 "include/memset.h" 2

void *memset(void *s, int c, size_t count);
# 5 "src/kernel.c" 2

extern void load_store_test(void);
extern void shift_test(void);
extern void add_sub_test(void);
extern void branch_test(void);
extern void my_memcpy_test(void);
extern unsigned long compare_and_return(unsigned long a, unsigned long b);
extern unsigned long sel_test(unsigned long a, unsigned long b);
extern void bl_test();
extern unsigned long macro_test_1(long a, long b);
extern unsigned long macro_test_2(long a, long b);

extern unsigned long func_addr[];
extern unsigned long func_num_syms;
extern char func_string;

static int print_func_name(unsigned long addr)
{
 int i;
 char *p, *string;

 for (i = 0; i < func_num_syms; i++) {
  if (addr == func_addr[i])
   goto found;
 }

 return 0;

found:
    p = &func_string;

    if (i == 0) {
     string = p;
     goto done;
    }

    while (1) {
     p++;

     if (*p == '\0')
      i--;

     if (i == 0) {
      p++;
      string = p;
      break;
     }
    }

done:
    uart_send_string(string);
    uart_send_string("\n");

    return 0;
}

void asm_test(void)
{
 unsigned long val1, val2;

 load_store_test();
 shift_test();
 add_sub_test();
 branch_test();

 my_memcpy_test();


 memset((void *)0x21000, 0x55, 40);


 val1 = compare_and_return(10, 9);
 if (val1 == 0)
  uart_send_string("lab3-5: compare_and_return ok\n");

 val2 = compare_and_return(9, 10);
 if (val2 == 0xffffffffffffffff)
  uart_send_string("lab3-5: compare_and_return ok\n");

 val1 = sel_test(0, 9);
 val2 = sel_test(5, 2);

 bl_test();
 uart_send_string("lab3-7: branch test ok\n");

 val1 = macro_test_1(5, 5);
 if (val1 == 10)
  uart_send_string("lab5-5: macro_test_1 ok\n");

 val2 = macro_test_2(5, 5);
 if (val2 == 0)
  uart_send_string("lab5-5: macro_test_2 ok\n");
}

void kernel_main(void)
{

 uart_init();
 uart_send_string("Welcome RISC-V!\r\n");

 asm_test();


 print_func_name(0x800880);
 print_func_name(0x800860);
 print_func_name(0x800800);

 while (1) {
  ;
 }
}
