# 1 "src/stacktrace.c"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_4\\example_4_4\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/stacktrace.c"
# 1 "include/printk.h" 1



void init_printk_done(void);
int printk(const char *fmt, ...);
# 2 "src/stacktrace.c" 2
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
# 3 "src/stacktrace.c" 2

struct stackframe {
 unsigned long s_fp;
 unsigned long s_ra;
};

extern char _text[], _etext[];
static int kernel_text(unsigned long addr)
{
 if (addr >= (unsigned long)_text &&
     addr < (unsigned long)_etext)
  return 1;

 return 0;
}

static void walk_stackframe(void )
{
 unsigned long sp, fp, pc;
 struct stackframe *frame;
 unsigned long low;

 const register unsigned long current_sp __asm__ ("sp");
 sp = current_sp;
 pc = (unsigned long)walk_stackframe;
 fp = (unsigned long)__builtin_frame_address(0);

 while (1) {
  if (!kernel_text(pc))
   break;


  low = sp + sizeof(struct stackframe);
  if ((fp < low || fp & 0xf))
   break;





  frame = (struct stackframe *)(fp - 16);
  sp = fp;
  fp = frame->s_fp;

  pc = frame->s_ra - 4;

  if (kernel_text(pc))
   printk("[0x%016lx - 0x%016lx]  pc 0x%016lx\r\n", sp, fp, pc);
 }
}

void dump_stack(void)
{
 printk("Call Frame:\r\n");
 walk_stackframe();
}
