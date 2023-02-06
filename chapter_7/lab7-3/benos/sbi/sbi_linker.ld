
OUTPUT_ARCH(riscv)
ENTRY(_start)

SECTIONS
{
	INCLUDE "sbi/sbi_base.ld"
	PROVIDE(__bin_size = bss_begin - text_begin);
}
