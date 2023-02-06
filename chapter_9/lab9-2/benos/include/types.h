#ifndef __RISCV64_TYPES_H__
#define __RISCV64_TYPES_H__

#ifdef __cplusplus
extern "C" {
#endif

#define cacheline_aligned __attribute__((__aligned__(64)))

#define NULL ((void *)0)

typedef _Bool bool;

enum {
        false   = 0,
        true    = 1
};


typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long u64;

typedef signed char				s8_t;
typedef unsigned char			u8_t;

typedef signed short			s16_t;
typedef unsigned short			u16_t;

typedef signed int				s32_t;
typedef unsigned int			u32_t;

typedef signed long long		s64_t;
typedef unsigned long long		u64_t;

typedef signed long long		intmax_t;
typedef unsigned long long		uintmax_t;

typedef signed long	long		ptrdiff_t;
typedef signed long	long		intptr_t;
typedef unsigned long long		uintptr_t;

typedef unsigned long long		size_t;
typedef signed long	long		ssize_t;

typedef signed long				off_t;
typedef signed long long		loff_t;

typedef signed int				bool_t;
typedef unsigned long			irq_flags_t;

typedef unsigned long long		virtual_addr_t;
typedef unsigned long long		virtual_size_t;
typedef unsigned long long		physical_addr_t;
typedef unsigned long long		physical_size_t;

typedef struct {
	volatile int counter;
} atomic_t;

typedef struct {
	volatile int lock;
} spinlock_t;

#ifdef __cplusplus
}
#endif

#endif /* __RISCV64_TYPES_H__ */
