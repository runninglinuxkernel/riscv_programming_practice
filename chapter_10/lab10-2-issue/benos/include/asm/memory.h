#ifndef	_ASM_MEMORY_H
#define	_ASM_MEMORY_H

#include "mm.h"

#define DDR_BASE 0x80000000UL
#define TOTAL_MEMORY (16 * 0x100000UL)

#define DDR_END (DDR_BASE + TOTAL_MEMORY)

#endif
