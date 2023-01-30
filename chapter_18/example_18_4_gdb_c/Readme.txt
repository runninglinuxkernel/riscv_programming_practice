
使用spike+gdb+openocd调试代码C代码或者汇编代码

1. 首先编译代码
$ make
或者
$ riscv64-unknown-elf-gcc -g -Og -T spike.lds -nostartfiles -o test boot.S test.c matrix.S -march=rv64gcv

2. 启动spike
$ spike --rbb-port=1234 -m0x10000000:0x20000 --isa=rv64gcv test

3. 新建一个终端，启动openocd
$ openocd -f spike.cfg

4. 使用gdb 调试
$ riscv64-unknown-elf-gdb test

连接remote 之后，它会自动停在 main函数入口的 loop里。
(gdb) target remote localhost:3333
Remote debugging using localhost:3333
main () at test.S:14
14		lw	a5,%lo(wait)(a4)

然后单步到“bne	a6,zero,.L2”这条指令，然后通过set命令设置a6寄存器为0，然后就可以跳出loop循环
(gdb) set $a6=0
(gdb) s
18		li t0, 0x00006000 | 0x600
(gdb) s

接下来就可以设置断点了：

gdb) b matrix_multiply_4x4_asm
Breakpoint 1 at 0x100100ec: file matrix.S, line 3.
(gdb) c
Continuing.

Breakpoint 1, matrix_multiply_4x4_asm () at matrix.S:3
3		mv t3, a1
(gdb)


注意事项：
1. 调试浮点数，和vector扩展指令，需要打开mstatus相关的bit
2. spike的lds文件必须设置正常，否则不能停在wait里。

	这样设置是错误的。
  .text.startup : { *(.text.startup) }
  .text : { *(.text) }

  正常设置应该为：
  .text : { *(.text.startup) }
  .text : { *(.text) }
  .data : { *(.data) }


这样确保main函数链接到0x10010000地址中

$ riscv64-unknown-elf-readelf -s test
    15: 0000000000000000     0 FILE    LOCAL  DEFAULT  ABS /tmp/ccNhlNvo.o
    16: 0000000010012000     0 NOTYPE  LOCAL  DEFAULT    4 stacks
    17: 0000000000000000     0 FILE    LOCAL  DEFAULT  ABS test.c
    18: 00000000100100ec     0 NOTYPE  GLOBAL DEFAULT    1 matrix_multiply_[...]
    19: 00000000100101e0    34 OBJECT  GLOBAL DEFAULT    3 text
    20: 0000000010011000     4 OBJECT  GLOBAL DEFAULT    4 wait
    21: 0000000010010026   102 FUNC    GLOBAL DEFAULT    1 matrix_multiply_c
    22: 0000000010010000    38 FUNC    GLOBAL DEFAULT    1 main
    23: 000000001001008c    96 FUNC    GLOBAL DEFAULT    1 do_main
