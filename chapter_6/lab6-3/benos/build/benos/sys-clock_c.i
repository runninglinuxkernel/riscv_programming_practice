# 1 "src/sys-clock.c"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_6\\lab6-3\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/sys-clock.c"
# 29 "src/sys-clock.c"
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
# 30 "src/sys-clock.c" 2
# 1 "include/d1/reg-ccu.h" 1
# 31 "src/sys-clock.c" 2
# 39 "src/sys-clock.c"
void sdelay(unsigned long us)
{







 us = us << 10;
 while(us--)
  ;


}

static void set_pll_cpux_axi(void)
{
 uint32_t val;


 write32((0x02001000) + (0xd00), (0 << 24) | (3 << 8) | (1 << 0));
 sdelay(1);


 val = read32((0x02001000) + (0x000));
 val &= ~(1 << 27);
 write32((0x02001000) + (0x000), val);


 val = read32((0x02001000) + (0x000));
 val |= (1 << 30);
 write32((0x02001000) + (0x000), val);
 sdelay(5);


 val = read32((0x02001000) + (0x000));
 val &= ~((0x3 << 16) | (0xff << 8) | (0x3 << 0));
 val |= (41 << 8);
 write32((0x02001000) + (0x000), val);


 val = read32((0x02001000) + (0x000));
 val |= (1 << 29);
 write32((0x02001000) + (0x000), val);


 val = read32((0x02001000) + (0x000));
 val |= (1 << 31);
 write32((0x02001000) + (0x000), val);


 while(!(read32((0x02001000) + (0x000)) & (0x1 << 28)));
 sdelay(20);


 val = read32((0x02001000) + (0x000));
 val |= (1 << 27);
 write32((0x02001000) + (0x000), val);


 val = read32((0x02001000) + (0x000));
 val &= ~(1 << 29);
 write32((0x02001000) + (0x000), val);
 sdelay(1);


 val = read32((0x02001000) + (0xd00));
 val &= ~(0x07 << 24 | 0x3 << 8 | 0xf << 0);
 val |= (0x05 << 24 | 0x1 << 8);
 write32((0x02001000) + (0xd00), val);
 sdelay(1);
}

static void set_pll_periph0(void)
{
 uint32_t val;


 if(read32((0x02001000) + (0x020)) & (1 << 31))
  return;


 val = read32((0x02001000) + (0x510));
 val &= (~(0x3 << 24));
 write32(val, (0x02001000) + (0x510));


 write32((0x02001000) + (0x020), 0x63 << 8);


 val = read32((0x02001000) + (0x020));
 val |= (1 << 29);
 write32((0x02001000) + (0x020), val);


 val = read32((0x02001000) + (0x020));
 val |= (1 << 31);
 write32((0x02001000) + (0x020), val);


 while(!(read32((0x02001000) + (0x020)) & (0x1 << 28)));
 sdelay(20);


 val = read32((0x02001000) + (0x020));
 val &= ~(1 << 29);
 write32((0x02001000) + (0x020), val);
}

static void set_ahb(void)
{
 write32((0x02001000) + (0x510), (2 << 0) | (0 << 8));
 write32((0x02001000) + (0x510), read32((0x02001000) + (0x510)) | (0x03 << 24));
 sdelay(1);
}

static void set_apb(void)
{
 write32((0x02001000) + (0x520), (2 << 0) | (1 << 8));
 write32((0x02001000) + (0x520), (0x03 << 24) | read32((0x02001000) + (0x520)));
 sdelay(1);
}

static void set_dma(void)
{

 write32((0x02001000) + (0x70c), read32((0x02001000) + (0x70c)) | (1 << 16));
 sdelay(20);

 write32((0x02001000) + (0x70c), read32((0x02001000) + (0x70c)) | (1 << 0));
}

static void set_mbus(void)
{
 uint32_t val;


 val = read32((0x02001000) + (0x540));
 val |= (0x1 << 30);
 write32((0x02001000) + (0x540), val);
 sdelay(1);
}

static void set_module(virtual_addr_t addr)
{
 uint32_t val;

 if(!(read32(addr) & (1 << 31)))
 {
  val = read32(addr);
  write32(addr, val | (1 << 31) | (1 << 30));


  val = read32(addr);
  val |= (1 << 29);
  write32(addr, val);


  while(!(read32(addr) & (0x1 << 28)));
  sdelay(20);


  val = read32(addr);
  val &= ~(1 << 29);
  write32(addr, val);
 }
}

void sys_clock_init(void)
{
 set_pll_cpux_axi();
 set_pll_periph0();
 set_ahb();
 set_apb();
 set_dma();
 set_mbus();
 set_module((0x02001000) + (0x020));
 set_module((0x02001000) + (0x040));
 set_module((0x02001000) + (0x048));
 set_module((0x02001000) + (0x058));
 set_module((0x02001000) + (0x078));
 set_module((0x02001000) + (0x080));
}
