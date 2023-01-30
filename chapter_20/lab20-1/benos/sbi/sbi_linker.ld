
OUTPUT_ARCH(riscv)
ENTRY(_start)

SECTIONS
{
	INCLUDE "sbi/sbi_base.ld"
}
