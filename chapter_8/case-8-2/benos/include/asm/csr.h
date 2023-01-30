#ifndef _ASM_RISCV_CSR_H
#define _ASM_RISCV_CSR_H

#define INSERT_FIELD(val, which, fieldval) \
	(((val) & ~(which)) | ((fieldval) * ((which) & ~((which)-1))))

#define PRV_U				(0UL)
#define PRV_S				(1UL)
#define PRV_M				(3UL)

#define MSTATUS_MPP_SHIFT	11
#define MSTATUS_MPP	(3UL << MSTATUS_MPP_SHIFT)
#define MSTATUS_MPIE	0x00000080UL

/* Status register flags */
#define SR_SIE  0x2UL /* Supervisor Interrupt Enable */
#define SR_SPIE 0x20UL /* Previous Supervisor IE */
#define SR_SPP 0x100UL /* Previously Supervisor */
#define SR_SUM	0x40000UL /* Supervisor may access User Memory */
#define SR_FS  0x6000UL /* Floating-point Status */
#define SR_XS  0x00018000UL /* Extension Status */

#define SCAUSE_INT (1UL << 63)
#define is_interrupt_fault(reg) (reg & SCAUSE_INT)

#define SCAUSE_EC (0xf) /* 目前支持15个异常*/

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
	__asm__ __volatile__ ("csrr %0, " #csr			\
			      : "=r" (__v) :			\
			      : "memory");			\
	__v;							\
})

#define write_csr(csr, val)					\
({								\
	unsigned long __v = (unsigned long)(val);		\
	__asm__ __volatile__ ("csrw " #csr ", %0"		\
			      : : "rK" (__v)			\
			      : "memory");			\
})

#endif /*_ASM_RISCV_CSR_H*/
