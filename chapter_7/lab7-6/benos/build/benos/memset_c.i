# 1 "src/memset.c"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_7\\lab7-6\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/memset.c"
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
# 2 "src/memset.c" 2

extern void *__memset_16bytes_asm(void *s, unsigned long val, unsigned long count);

static void __memset_16bytes_inline_asm(void *p, unsigned long val,
  int count)
{
 int i = 0;

 asm volatile (
   "1: sd %[val], (%[p])\n"
   "sd %[val], 8(%[p])\n"
   "addi %[i], %[i], 16\n"
   "blt %[i], %[count], 1b"
   : [p] "+r" (p), [count]"+r" (count), [i]"+r" (i)
   : [val]"r" (val)
   : "memory"
       );
}

static void *__memset_1bytes(void *s, int c, size_t count)
{
 char *xs = s;

 while (count--)
  *xs++ = c;
 return s;
}

static void *__memset(char *s, int c, size_t count)
{
 char *p = s;
 unsigned long align = 16;
 size_t size, left = count;
 int n, i;
 unsigned long address = (unsigned long)p;
 unsigned long data = 0ULL;




 for (i = 0; i < 8; i++)
  data |= (((unsigned long)c) & 0xff) << (i * 8);


 if (address & (align - 1)) {
  size = address & (align - 1);
  size = align - size;
  __memset_1bytes(p, c, size);
  p = p + size;
  left = count - size;
 }


 if (left > align) {
  n = left / align;
  left = left % align;




  __memset_16bytes_inline_asm(p, data, 16*n);


  if (left)
   __memset_1bytes(p + 16*n, c, left);
 }

 return s;
}

void *memset(void *s, int c, size_t count)
{
 return __memset(s, c, count);
}
