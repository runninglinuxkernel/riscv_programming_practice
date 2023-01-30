#include "asm/csr.h"
#include "asm/sbi.h"
#include "vs_mm.h"
#include "mm.h"
#include "asm/pgtable.h"
#include "asm/memory.h"
#include "asm/barrier.h"
#include "printk.h"
#include "mm.h"
//#include "vs_mmu.h"
#include "asm/irq.h"

#define STR(s)  #s
#define XSTR(s)  STR(s)

extern char vm_image_begin[];
extern char vm_image_size[];

#define VM_IMAGE(image) \
	asm(   \
	".pushsection .vm_image, \"ax\"\n" \
	".balign 4096\n"\
	".global vm_image_begin\n" \
	"vm_image_begin:\n"  \
	".incbin "XSTR(image)"\n" \
	".balign 4096\n"\
	".global vm_image_end\n" \
	"vm_image_end:\n"  \
	".global vm_image_size\n" \
	".set vm_image_size, vm_image_end - vm_image_begin\n" \
	".popsection");

VM_IMAGE(XSTR(gos.bin));

#define GUEST_BASE_ADDR 0x80200000UL

char vs_stack[PAGE_SIZE] __attribute__((aligned(PAGE_SIZE)));

extern void vs_trap_init(void);

void vs_main()
{
	unsigned long val;

	val = read_csr(sstatus);
	val |= SSTATUS_SPP;
	write_csr(sstatus, val);

	val = read_csr(CSR_HSTATUS);
	val |= HSTATUS_SPV | HSTATUS_SPVP;
	write_csr(CSR_HSTATUS, val);
	printk("hstatus 0x%lx\n", val);
	
	printk("vm_image_begin 0x%lx, size 0x%lx\n", (unsigned long)vm_image_begin, (unsigned long)vm_image_size);

	set_stage2_page_mapping(GUEST_BASE_ADDR, (unsigned long)vm_image_begin, (unsigned long)vm_image_size, PAGE_READ_EXEC);

	write_stage2_pg_reg();

	printk("...entering VM...\n");
	//riscv_vcpu_timer_init();

	jump_to_vs_mode(GUEST_BASE_ADDR);

	while (1)
		;
}
