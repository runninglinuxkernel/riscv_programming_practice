# 1 "src/sys-uart.c"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_6\\lab6-3\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/sys-uart.c"
# 29 "src/sys-uart.c"
# 1 "include/xboot.h" 1







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
# 9 "include/xboot.h" 2
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
# 10 "include/xboot.h" 2
# 1 "include/stdarg.h" 1







typedef __builtin_va_list va_list;
# 11 "include/xboot.h" 2
# 1 "include/stddef.h" 1
# 40 "include/stddef.h"
enum {
 FALSE = 0,
 TRUE = 1,
};
# 12 "include/xboot.h" 2
# 1 "include/stdint.h" 1
# 10 "include/stdint.h"
typedef s8_t int8_t;
typedef u8_t uint8_t;

typedef s16_t int16_t;
typedef u16_t uint16_t;

typedef s32_t int32_t;
typedef u32_t uint32_t;

typedef s64_t int64_t;
typedef u64_t uint64_t;
# 13 "include/xboot.h" 2
# 1 "include/string.h" 1
# 10 "include/string.h"
void * memset(void * s, int c, size_t n);
void * memcpy(void * dest, const void * src, size_t len);
size_t strlen(const char *s);
# 14 "include/xboot.h" 2
# 1 "include/endian.h" 1
# 15 "include/xboot.h" 2
# 1 "include/byteorder.h" 1
# 10 "include/byteorder.h"
static inline u16_t __swab16(u16_t x)
{
 return ( (x<<8) | (x>>8) );
}

static inline u32_t __swab32(u32_t x)
{
 return ( (x<<24) | (x>>24) |
  ((x & (u32_t)0x0000ff00UL)<<8) |
  ((x & (u32_t)0x00ff0000UL)>>8) );
}

static inline u64_t __swab64(u64_t x)
{
 return ( (x<<56) | (x>>56) |
  ((x & (u64_t)0x000000000000ff00ULL)<<40) |
  ((x & (u64_t)0x0000000000ff0000ULL)<<24) |
  ((x & (u64_t)0x00000000ff000000ULL)<< 8) |
  ((x & (u64_t)0x000000ff00000000ULL)>> 8) |
  ((x & (u64_t)0x0000ff0000000000ULL)>>24) |
  ((x & (u64_t)0x00ff000000000000ULL)>>40) );
}





static inline u32_t __swahw32(u32_t x)
{
 return ( ((x & (u32_t)0x0000ffffUL)<<16) | ((x & (u32_t)0xffff0000UL)>>16) );
}





static inline u32_t __swahb32(u32_t x)
{
 return ( ((x & (u32_t)0x00ff00ffUL)<<8) | ((x & (u32_t)0xff00ff00UL)>>8) );
}
# 16 "include/xboot.h" 2
# 30 "src/sys-uart.c" 2

void uart_init(void)
{
 virtual_addr_t addr;
 u32_t val;
# 49 "src/sys-uart.c"
        addr = 0x02000000 + 0xf0;
        val = read32(addr);
        val &= ~(0xf << ((2 & 0x7) << 2));
        val |= ((0x3 & 0xf) << ((2 & 0x7) << 2));
        write32(addr, val);

        val = read32(addr);
        val &= ~(0xf << ((4 & 0x7) << 2));
        val |= ((0x3 & 0xf) << ((4 & 0x7) << 2));
        write32(addr, val);


 addr = 0x0200190c;
 val = read32(addr);
 val |= 1 << 0;
 write32(addr, val);


 addr = 0x0200190c;
 val = read32(addr);
 val |= 1 << 16;
 write32(addr, val);


 addr = 0x02500000;
 write32(addr + 0x04, 0x0);
 write32(addr + 0x08, 0xf7);
 write32(addr + 0x10, 0x0);
 val = read32(addr + 0x0c);
 val |= (1 << 7);
 write32(addr + 0x0c, val);
 write32(addr + 0x00, 0xd & 0xff);
 write32(addr + 0x04, (0xd >> 8) & 0xff);
 val = read32(addr + 0x0c);
 val &= ~(1 << 7);
 write32(addr + 0x0c, val);
 val = read32(addr + 0x0c);
 val &= ~0x1f;
 val |= (0x3 << 0) | (0 << 2) | (0x0 << 3);
 write32(addr + 0x0c, val);
}

void uart_send(char c)
{
 virtual_addr_t addr = 0x02500000;

 while((read32(addr + 0x7c) & (0x1 << 1)) == 0);
 write32(addr + 0x00, c);
}

int putchar(int c)
{
 uart_send(c);
 return c;
}

char uart_recv ( void )
{
 virtual_addr_t addr = 0x02500000;

 while((read32(addr + 0x7c) & (0x1 << 3)) == 0);
 return read8(addr + 0x00);
}

void uart_send_string(char* str)
{
    int i;

    for (i = 0; str[i] != '\0'; i++)
    {
        if (str[i] == '\n')
            uart_send('\r');
        uart_send((char) str[i]);
    }
}

static int vpf_str_to_num(const char * fmt, int * num)
{
 const char * p;
 int res, d, isd;

 res = 0;
 for(p = fmt; *fmt != '\0'; p++)
 {
  isd = (*p >= '0' && *p <= '9');
  if(!isd)
   break;
  d = *p - '0';
  res *= 10;
  res += d;
 }
 *num = res;
 return ((int)(p - fmt));
}

static void vpf_num_to_str(uint32_t a, int ish, int pl, int pc)
{
 char buf[32];
 uint32_t base;
 int idx, i, t;

 for(i = 0; i < sizeof(buf); i++)
  buf[i] = pc;
 base = 10;
 if(ish)
  base = 16;

 idx = 0;
 do {
  t = a % base;
  if(t >= 10)
   buf[idx] = t - 10 + 'a';
  else
   buf[idx] = t + '0';
  a /= base;
  idx++;
 } while (a > 0);

 if(pl > 0)
 {
  if(pl >= sizeof(buf))
   pl = sizeof(buf) - 1;
  if(idx < pl)
   idx = pl;
 }
 buf[idx] = '\0';

 for(i = idx - 1; i >= 0; i--)
  uart_send(buf[i]);
}

static int vpf(const char * fmt, va_list va)
{
 const char * p, * q;
 int f, c, vai, pl, pc, i;
 unsigned char t;

 pc = ' ';
 for(p = fmt; *p != '\0'; p++)
 {
  f = 0;
  pl = 0;
  c = *p;
  q = p;
  if(*p == '%')
  {
   q = p;
   p++;
   if(*p >= '0' && *p <= '9')
    p += vpf_str_to_num(p, &pl);
   f = *p;
  }
  if((f == 'd') || (f == 'x'))
  {
   vai = __builtin_va_arg(va, int);
   vpf_num_to_str(vai, f == 'x', pl, pc);
  }
  else
  {
   for(i = 0; i < (p - q); i++)
    uart_send(q[i]);
   t = (unsigned char)(f != 0 ? f : c);
   uart_send(t);
  }
 }
 return 0;
}

int sys_uart_printf(const char * fmt, ...)
{

 va_list va;

 __builtin_va_start(va, fmt);
 vpf(fmt, va);
 __builtin_va_end(va);

 return 0;
}


void print_hex(unsigned int val)
{
    int i;
    int bits;

    uart_send('0');
    uart_send('x');

    for (i = 7; i >=0 ; i--)
    {
        bits =(val>>(i*4)) & 0xf;
        if (bits < 10)
            uart_send('0' + bits);
        else
            uart_send('A' + bits - 10);
    }
}
