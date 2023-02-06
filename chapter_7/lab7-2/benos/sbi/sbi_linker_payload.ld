OUTPUT_ARCH(riscv)
ENTRY(_start)

SECTIONS
{
	INCLUDE "sbi/sbi_base.ld"

	. = 0x22000;
	
	.payload :
	{
		PROVIDE(_payload_start = .);
		*(.payload)
		. = ALIGN(8);
		PROVIDE(_payload_end = .);
	}
	PROVIDE(__bin_size = _payload_end - text_begin);

}

