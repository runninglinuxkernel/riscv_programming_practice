使用spike+gdb+openocd调试代码

1. 首先编译代码
$ riscv64-unknown-elf-gcc -g -Og -T spike.lds -nostartfiles -o test test.S -march=rv64gcv

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

接下来就可以单步跑了。
19		csrs mstatus, t0
(gdb) s
21		lui	a4,%hi(data)
(gdb) s
22		flw	fa5,%lo(data)(a4)
(gdb) s
24		li t0, 4
(gdb) s
25		vsetvli t1, t0, e32, m1
(gdb) s
26		vfmv.v.f v0, fa5
(gdb) s
28		vfmacc.vf v1, fa5, v0
(gdb) info reg fa5
fa5            {float = 1, double = -nan(0xfffff3f800000)}	(raw 0xffffffff3f800000)
(gdb) s
30		lui	t0,%hi(save_data)
(gdb) info reg v0
v0             {b = {0x0, 0x0, 0x80, 0x3f, 0x0, 0x0, 0x80, 0x3f, 0x0, 0x0, 0x80, 0x3f, 0x0, 0x0, 0x80, 0x3f}, s = {0x0, 0x3f80, 0x0, 0x3f80, 0x0, 
    0x3f80, 0x0, 0x3f80}, w = {0x3f800000, 0x3f800000, 0x3f800000, 0x3f800000}, l = {0x3f8000003f800000, 0x3f8000003f800000}, q = {
    0x3f8000003f8000003f8000003f800000}}

注意事项：
1. 有一些limitition，比如只能一个main函数，main函数不能调printf等函数。
2. 调试浮点数，和vector扩展指令，需要打开mstatus相关的bit
