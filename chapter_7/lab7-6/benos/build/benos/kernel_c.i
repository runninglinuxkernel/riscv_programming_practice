# 1 "src/kernel.c"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_7\\lab7-6\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/kernel.c"
# 1 "include/uart.h" 1



void uart_init ( void );
char uart_recv ( void );
void uart_send ( char c );
void uart_send_string(char* str);
# 2 "src/kernel.c" 2
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
# 3 "src/kernel.c" 2
# 1 "include/memset.h" 1



# 1 "include/types.h" 1
# 5 "include/memset.h" 2

void *memset(void *s, int c, size_t count);
# 4 "src/kernel.c" 2
# 1 "include/printk.h" 1



void init_printk_done(void);
int printk(const char *fmt, ...);
# 5 "src/kernel.c" 2
# 1 "include/io.h" 1
# 10 "include/io.h"
static inline u8_t read8(virtual_addr_t addr)
{
 return( *((volatile u8_t *)(addr)) );
}

static inline u16_t read16(virtual_addr_t addr)
{
 return( *((volatile u16_t *)(addr)) );
}

static inline u32_t read32(virtual_addr_t addr)
{
 return( *((volatile u32_t *)(addr)) );
}

static inline u64_t read64(virtual_addr_t addr)
{
 return( *((volatile u64_t *)(addr)) );
}

static inline void write8(virtual_addr_t addr, u8_t value)
{
 *((volatile u8_t *)(addr)) = value;
}

static inline void write16(virtual_addr_t addr, u16_t value)
{
 *((volatile u16_t *)(addr)) = value;
}

static inline void write32(virtual_addr_t addr, u32_t value)
{
 *((volatile u32_t *)(addr)) = value;
}

static inline void write64(virtual_addr_t addr, u64_t value)
{
 *((volatile u64_t *)(addr)) = value;
}
# 66 "include/io.h"
static inline void delay(unsigned int n)
{
 while(n--)
  ;
}
# 6 "src/kernel.c" 2

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
    printk("<0x%lx> %s\n", addr, string);

    return 0;
}







static void my_memcpy_asm_test1(unsigned long src, unsigned long dst,
  unsigned long size)
{
 unsigned long tmp = 0;
 unsigned long end = src + size;

 asm volatile (
   "1: ld %1, (%2)\n"
   "sd %1, (%0)\n"
   "addi %0, %0, 8\n"
   "addi %2, %2, 8\n"
   "blt %2, %3, 1b"
   : "+r" (dst), "+r" (tmp), "+r" (src)
   : "r" (end)
   : "memory");
}







static void my_memcpy_asm_test2(unsigned long src, unsigned long dst,
  unsigned long size)
{
 unsigned long tmp = 0;
 unsigned long end = src + size;

 asm volatile (
   "1: ld %[tmp], (%[src])\n"
   "sd %[tmp], (%[dst])\n"
   "addi %[dst], %[dst], 8\n"
   "addi %[src], %[src], 8\n"
   "blt %[src], %[end], 1b"
   : [dst] "+r" (dst), [tmp] "+r" (tmp), [src] "+r" (src)
   : [end] "r" (end)
   : "memory");
}
# 121 "src/kernel.c"
static inline void my_asm_orr(unsigned long mask, void *p) { unsigned long tmp = 0; asm volatile ( "ld %[tmp], (%[p])\n" " ""or"" %[tmp], %[tmp], %[mask]\n" "sd %[tmp], (%[p])\n" : [p] "+r"(p), [tmp]"+r" (tmp) : [mask]"r" (mask) : "memory" ); }
static inline void my_asm_and(unsigned long mask, void *p) { unsigned long tmp = 0; asm volatile ( "ld %[tmp], (%[p])\n" " ""and"" %[tmp], %[tmp], %[mask]\n" "sd %[tmp], (%[p])\n" : [p] "+r"(p), [tmp]"+r" (tmp) : [mask]"r" (mask) : "memory" ); }
static inline void my_asm_add(unsigned long mask, void *p) { unsigned long tmp = 0; asm volatile ( "ld %[tmp], (%[p])\n" " ""add"" %[tmp], %[tmp], %[mask]\n" "sd %[tmp], (%[p])\n" : [p] "+r"(p), [tmp]"+r" (tmp) : [mask]"r" (mask) : "memory" ); }

static void my_ops_test(void)
{
 unsigned long p;

 p = 0xf;
 my_asm_and(0x2, &p);
 printk("test and: p=0x%x\n", p);

 p = 0x80;
 my_asm_orr(0x3, &p);
 printk("test orr: p=0x%x\n", p);

 p = 0x3;
 my_asm_add(0x2, &p);
 printk("test add: p=0x%x\n", p);
}

static void test_sysregs(void)
{
 unsigned long val;

 val = ({ register unsigned long __v; __asm__ __volatile__ ("csrr %0, " "sstatus" : "=r" (__v) : : "memory"); __v; });

 printk("sstatus =0x%x\n", val);
}

static int test_asm_goto(int a)
{
 asm goto (
   "addi %0, %0, -1\n"
   "beqz %0, %l[label]\n"
   :
   : "r" (a)
   : "memory"
   : label);

 return 0;

label:
 printk("%s: a = %d\n", __func__, a);
 return 1;
}

void inline_asm_test(void)
{
 my_memcpy_asm_test1(0x20000, 0x28000, 32);
    my_memcpy_asm_test2(0x20000, 0x28000, 32);

 memset((void *)0x28002, 0x55, 48);

 my_ops_test();

 test_sysregs();

 int a = 1;
 if (test_asm_goto(a) == 1)
  printk("asm_goto: return 1\n");

 int b = 0;
 if (test_asm_goto(b) == 0)
  printk("asm_goto: b is not 1\n");
}

void asm_test(void)
{
 unsigned long val1, val2;

 load_store_test();
 shift_test();
 add_sub_test();
 branch_test();

 my_memcpy_test();


 memset((void *)0x28000, 0x55, 40);


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

extern char _text_boot[], _etext_boot[];
extern char _text[], _etext[];
extern char _rodata[], _erodata[];
extern char _data[], _edata[];
extern char _bss[], _ebss[];

static void print_mem(void)
{
 printk("BenOS image layout:\n");
 printk("  .text.boot: 0x%08lx - 0x%08lx (%6ld B)\n",
   (unsigned long)_text_boot, (unsigned long)_etext_boot,
   (unsigned long)(_etext_boot - _text_boot));
 printk("       .text: 0x%08lx - 0x%08lx (%6ld B)\n",
   (unsigned long)_text, (unsigned long)_etext,
   (unsigned long)(_etext - _text));
 printk("     .rodata: 0x%08lx - 0x%08lx (%6ld B)\n",
   (unsigned long)_rodata, (unsigned long)_erodata,
   (unsigned long)(_erodata - _rodata));
 printk("       .data: 0x%08lx - 0x%08lx (%6ld B)\n",
   (unsigned long)_data, (unsigned long)_edata,
   (unsigned long)(_edata - _data));
 printk("        .bss: 0x%08lx - 0x%08lx (%6ld B)\n",
   (unsigned long)_bss, (unsigned long)_ebss,
   (unsigned long)(_ebss - _bss));
}

static void clean_bss(void)
{
 unsigned long start = (unsigned long)_bss;
 unsigned long end = (unsigned long)_ebss;
 unsigned size = end - start;

 memset((void *)start, 0, size);
}

void kernel_main(void)
{
 clean_bss();
 uart_init();
 uart_send_string("Welcome RISC-V!\r\n");
 init_printk_done();
 printk("printk init done\n");

 asm_test();
 inline_asm_test();


 print_func_name(0x800880);
 print_func_name(0x800860);
 print_func_name(0x800800);

 print_mem();

 while (1) {
  ;
 }
}
