/* 假设ROM地址为0x8030000 */
TEXT_ROM = 0x80300000;

SECTIONS
{
	/*
        * 设置benos的加载入口地址为0x80200000
        *
        * 这里“.”表示location counter，当前位置
        */
	. = 0x80200000,

	/*
        * 这里是第一个段text.boot，起始地址就是0x80200000
	* 这个段存放了benos的第一条指令
        */
	_text_boot = .;
	.text.boot : { *(.text.boot) }
	_etext_boot = .;

	/*
        * text代码段
	* 假设代码段是在ROM中(LMA), 这时候运行地址VMA 不等于 加载地址LMA
        */
	. = ALIGN(8);
	_text = .;
	.text : AT(TEXT_ROM)
       {
               *(.text)
       }
	. = ALIGN(8);
	_etext = .;

	/*
        * 只读数据段
        */
	_rodata = .;
       .rodata : AT(ADDR(.rodata))
       {
               *(.rodata)
       }
       _erodata = .;

	/*
        * 数据段
        */
	_data = .;
	.data : { *(.data) }
	_edata = .;

	/*
        * bss段
        *
        * ALIGN(8)表示8个字节对齐
        * bss_begin的起始地址以8字节对齐
        */
	. = ALIGN(0x8);
	_bss = .;
	.bss : { *(.bss*) } 
	_ebss = .;
}

