OUTPUT_ARCH( "riscv" )

SECTIONS
{
  . = 0x10010000;
  .text : { *(.text.startup) }
  .text : { *(.text) }
  .data : { *(.data) }
}
