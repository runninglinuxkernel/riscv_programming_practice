#ifndef __BENOS_BARRIER_H_
#define __BENOS_BARRIER_H_

static inline void hfence_gvma() {
    asm volatile(
        ".insn r 0x73, 0x0, 0x31, x0, x0, x0\n\t"
        ::: "memory");
}

static inline void hfence_vvma() {
    asm volatile(
        ".insn r 0x73, 0x0, 0x11, x0, x0, x0\n\t"
        ::: "memory");
}

static inline void hfence() {
	hfence_vvma();
	hfence_gvma();
}

#endif
