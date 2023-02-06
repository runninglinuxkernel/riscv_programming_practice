# 1 "src/boot.S"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_6\\lab6-3\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/boot.S"
.section ".text.boot"

.globl _start
_start:





       la t0, TEXT_ROM
       la t1, _text
       la t2, _etext
.L0:
 ld a5, (t0)
 sd a5, (t1)
 addi t1, t1, 8
 addi t0, t0, 8
 bltu t1, t2, .L0


 csrw sie, zero

 call __init_uart
 call print_asm


 la sp, stacks_start
 li t0, 4096
 add sp, sp, t0


 tail kernel_main

print_asm:

 mv s1, ra

 la a0, boot_string
 call put_string_uart


 mv ra, s1
 ret

.section .data
.align 12
.global stacks_start
stacks_start:
 .skip 4096

.section .rodata
.align 3
.globl boot_string
boot_string:
       .string "Booting at asm\n"
