#ifndef _ASM_RISCV_CSR_H
#define _ASM_RISCV_CSR_H

#define RISCV_XLEN 64

#define INSERT_FIELD(val, which, fieldval) \
	(((val) & ~(which)) | ((fieldval) * ((which) & ~((which)-1))))

#define PRV_U				(0UL)
#define PRV_S				(1UL)
#define PRV_M				(3UL)

#define MSTATUS_MPP_SHIFT	11
#define MSTATUS_MPP	(3UL << MSTATUS_MPP_SHIFT)
#define MSTATUS_MPIE	0x00000080UL

/* Status register flags */
#define SSTATUS_SPP_SHIFT	8
#define SSTATUS_SPP	(1UL << SSTATUS_SPP_SHIFT)

#define SR_SIE  0x2UL /* Supervisor Interrupt Enable */
#define SR_SPIE 0x20UL /* Previous Supervisor IE */
#define SR_SPP 0x100UL /* Previously Supervisor */
#define SR_SUM	0x40000UL /* Supervisor may access User Memory */
#define SR_FS  0x6000UL /* Floating-point Status */
#define SR_XS  0x00018000UL /* Extension Status */

/* 中断使能 */
#define SIE_SSIE 0x2UL /* IPI软中断使能 */
#define SIE_STIE 0x20UL /* 时钟中断使能 */
#define SIE_SEIE 0x200UL /* IRQ外部中断使能 */

#define SCAUSE_INT (1UL << 63)
#define is_interrupt_fault(reg) (reg & SCAUSE_INT)

#define SCAUSE_EC (0xf) /* 目前支持15个异常*/

#define SATP_MODE_39 (1UL << 63)

/* VS csr */
#define CSR_VSSTATUS 0x200
#define CSR_VSIE 0x204
#define CSR_VSTVEC 0x205
#define CSR_VSSCRATCH 0x240
#define CSR_VSEPC 0x241
#define CSR_VSCAUSE 0x242
#define CSR_VSTVAL 0x243
#define CSR_VSIP 0x244
#define CSR_VSATP 0x280

/* HS csr */
#define CSR_HSTATUS 0x600
#define HSTATUS_SPV_SHIFT	7
#define HSTATUS_SPV	(1UL << HSTATUS_SPV_SHIFT)

#define HSTATUS_SPVP_SHIFT	8
#define HSTATUS_SPVP	(1UL << HSTATUS_SPVP_SHIFT)

#define CSR_HEDELEG 0x602
#define CSR_HIDELEG 0x603
#define CSR_HIE 0x604
#define CSR_HTIMEDELTA 0x605
#define CSR_HTIMEDELTAH 0x615
#define CSR_HCOUNTEREN 0x606
#define CSR_HGEIE 0x607
#define CSR_HTVAL 0x643
#define CSR_HIP 0x644
#define CSR_HVIP 0x645
#define CSR_HTINST 0x64A
#define CSR_HGATP 0x680
#define HGATP_MODE_Sv39x4 (8UL << 60)

#define CSR_HGEIP 0xE07

/* Machine Memory Protection
 * 暂时支持8个pmpcfg
*/
#define MAX_CSR_PMP     8

#define CSR_PMPCFG0	0x3a0
#define CSR_PMPADDR0	0x3b0
#define CSR_PMPADDR1	0x3b1
#define CSR_PMPADDR2	0x3b2
#define CSR_PMPADDR3	0x3b3
#define CSR_PMPADDR4	0x3b4
#define CSR_PMPADDR5	0x3b5
#define CSR_PMPADDR6	0x3b6
#define CSR_PMPADDR7	0x3b7

#define PMP_R	0x01UL
#define PMP_W	0x02UL
#define PMP_X	0x04UL
#define PMP_A	0x18UL
#define PMP_A_TOR 0x08UL
#define PMP_A_NA4 0x10UL
#define PMP_A_NAPOT 0x18UL
#define PMP_L	 0x80UL
#define PMP_RWX (PMP_R | PMP_W | PMP_X)
#define PMP_SHIFT 2

#ifdef __ASSEMBLY__
#define __ASM_STR(x)	x
#else
#define __ASM_STR(x)	#x
#endif

#ifndef __ASSEMBLY__

/*
 * 在带参数的宏，#号作为一个预处理运算符,
 * 可以把记号转换成字符串
 *
 * 下面这句话会在预编译阶段变成：
 *  asm volatile("csrr %0, " "reg" : "=r" (__val)); __val; });
 */
#define read_csr(csr)						\
({								\
	register unsigned long __v;				\
	__asm__ __volatile__ ("csrr %0, "  __ASM_STR(csr)			\
			      : "=r" (__v) :			\
			      : "memory");			\
	__v;							\
})

#define write_csr(csr, val)					\
({								\
	unsigned long __v = (unsigned long)(val);		\
	__asm__ __volatile__ ("csrw "__ASM_STR(csr)", %0"		\
			      : : "rK" (__v)			\
			      : "memory");			\
})

#define csr_set(csr, val)					\
({								\
	unsigned long __v = (unsigned long)(val);		\
	__asm__ __volatile__ ("csrs "__ASM_STR(csr)", %0"		\
			      : : "rK" (__v)			\
			      : "memory");			\
})

#define csr_clear(csr, val)					\
({								\
	unsigned long __v = (unsigned long)(val);		\
	__asm__ __volatile__ ("csrc "__ASM_STR(csr)", %0"		\
			      : : "rK" (__v)			\
			      : "memory");			\
})

#endif

#endif /*_ASM_RISCV_CSR_H*/
