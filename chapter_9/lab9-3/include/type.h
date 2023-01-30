#ifndef _BENOS_TYPE_H
#define _BENOS_TYPE_H

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long u64;

typedef unsigned int size_t;

typedef _Bool bool;

#define NULL ((void *)0)

enum {
	false	= 0,
	true	= 1
};

#define cacheline_aligned __attribute__((__aligned__(64)))

#endif /*BENOS_TYPE_H*/
