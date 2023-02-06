# 1 "src/asm_test.S"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_4\\example_4_4\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/asm_test.S"
.align 3
.globl my_test_data
my_test_data:
 .dword 0x12345678abcdabcd

.global load_store_test
load_store_test:
 li t0, 0x22000

 lb t1, (t0)
 lb t1, 4(t0)
 lb t1, -4(t0)
 ld t1, (t0)
 lb t1, 4(t0)

 la t0, my_test_data
 lla t1, my_test_data

 lui t0, 0x80200
 lui t1, 0x40200
 ret

.global shift_test
shift_test:
 li t0, 0x8000008a00000000
 srai a1, t0, 1
 srli t1, t0, 1

 li t0, 0x128000008a
 sraiw a2, t0, 1
 srliw t1, t0, 1
 slliw a3, t0, 1

 li t0, 0x124000008a
 sraiw a2, t0, 1
 srliw t1, t0, 1
 slliw a4, t0, 1
 ret

.global add_sub_test
add_sub_test:


 addi a1, t0, 0xfffffffffffff800

 li t0, 0x140200000
 li t1, 0x40000000

 addi a1, t0, 0x700
 addi a1, t0, 0xfffffffffffff800
 addiw a2, t0, 0x80

 add a3, t0, t1
 addw a4, t0, t1

 li t0, 0x180200000
 li t1, 0x200000

 sub a0, t0, t1
 subw a1, t0, t1
 ret

.globl add_test
add_test:
 add a0, a0, a1
 nop
 ret

.globl branch_test
branch_test:

 addi sp,sp,-8
 sd ra,(sp)

 li a0, 1
 li a1, 2

 call add_test
 nop


 ld ra,(sp)
 addi sp,sp,8
 ret


.global my_memcpy_test
my_memcpy_test:
 li t0, 0x20000
 li t1, 0x21000
 addi t2, t0, 32

.loop:
 ld t3, (t0)
 sd t3, (t1)
 addi t0, t0, 8
 addi t1, t1, 8
 blt t0, t2, .loop

 ret

.global compare_and_return
compare_and_return:
 bltu a0,a1,.L2
 li a5,0
 j .L3
.L2:
 li a5,-1
.L3:
 mv a0,a5
 ret


.global sel_test
sel_test:
 beqz a0, .L4
 addi a5, a1, -1
 j .L5
.L4:
 addi a5, a1, 2
.L5:
 mv a0, a5
 ret

.global bl_test
bl_test:
 addi sp,sp,-16
 sd ra, 8(sp)

 call sel_test

 ld ra, 8(sp)
 addi sp,sp,16
 ret




.align 3
.global func_addr
func_addr:
 .quad 0x800800
 .quad 0x800860
 .quad 0x800880

.align 3
.global func_string
func_string:
 .asciz "func_a"
 .asciz "func_b"
 .asciz "func_c"

.align 3
.global func_num_syms
func_num_syms:
 .quad 3





.align 3
.macro op_func op, a, b
        mv a0, \a
 mv a1, \b
 call op_\()\op
.endm

.align 3
.global op_1
op_1:
 add a0, a0, a1
 ret

.global op_2
op_2:
 sub a0, a0, a1
 ret

.global macro_test_1
macro_test_1:
 addi sp, sp, -16
 sd ra, 8(sp)

 mv t0, a0
 mv t1, a1

 op_func 1, t0, t1

 ld ra, 8(sp)
 addi sp, sp, 16
 ret

.global macro_test_2
macro_test_2:
 addi sp, sp, -16
 sd ra, 8(sp)

 mv t0, a0
 mv t1, a1

 op_func 2, t0, t1

 ld ra, 8(sp)
 addi sp, sp, 16
 ret
