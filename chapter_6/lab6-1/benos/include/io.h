#ifndef __IO_H__
#define __IO_H__

#ifdef __cplusplus
extern "C" {
#endif

#include <types.h>

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

#define __arch_getl(a)			(*(volatile unsigned int *)(a))
#define __arch_putl(v,a)		(*(volatile unsigned int *)(a) = (v))

#define __arch_getb(a)			(*(volatile unsigned char *)(a))
#define __arch_putb(v,a)		(*(volatile unsigned char *)(a) = (v))

#define dmb()		__asm__ __volatile__ ("" : : : "memory")
#define __iormb()	dmb()
#define __iowmb()	dmb()

#define readl(c)	({ unsigned int  __v = __arch_getl(c); __iormb(); __v; })
#define writel(v,c)	({ unsigned int  __v = v; __iowmb(); __arch_putl(__v,c);})

#define readb(c)	({ unsigned char  __v = __arch_getb(c); __iormb(); __v; })
#define writeb(v,c)	({ unsigned char  __v = v; __iowmb(); __arch_putb(__v,c);})

static inline void delay(unsigned int n)
{
	while(n--)
		;
}


#ifdef __cplusplus
}
#endif

#endif /* __IO_H__ */
