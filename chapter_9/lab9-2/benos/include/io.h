
#ifndef _P_IO_H
#define _P_BASE_H

#if 1
#define __arch_getl(a)			(*(volatile unsigned int *)(a))
#define __arch_putl(v,a)		(*(volatile unsigned int *)(a) = (v))

#define __arch_getb(a)			(*(volatile unsigned char *)(a))
#define __arch_putb(v,a)		(*(volatile unsigned char *)(a) = (v))

#define __arch_getq(a)			(*(volatile unsigned long *)(a))
#define __arch_putq(v,a)		(*(volatile unsigned long *)(a) = (v))

#define dmb()		__asm__ __volatile__ ("" : : : "memory")
#define __iormb()	dmb()
#define __iowmb()	dmb()

#define readl(c)	({ unsigned int  __v = __arch_getl(c); __iormb(); __v; })
#define writel(v,c)	({ unsigned int  __v = v; __iowmb(); __arch_putl(__v,c);})

#define readb(c)	({ unsigned char  __v = __arch_getb(c); __iormb(); __v; })
#define writeb(v,c)	({ unsigned char  __v = v; __iowmb(); __arch_putb(__v,c);})

#define readq(c)	({ unsigned long  __v = __arch_getq(c); __iormb(); __v; })
#define writeq(v,c)	({ unsigned long  __v = v; __iowmb(); __arch_putq(__v,c);})
#else
static inline void writel(unsigned int value, unsigned int addr)
{
	*(volatile unsigned int *)addr = value;
}

static inline unsigned int readl(unsigned int addr)
{
	return *(volatile unsigned int *)addr;
}
#endif

static inline void delay(unsigned int n)
{
	while(n--)
		;
}

#endif
