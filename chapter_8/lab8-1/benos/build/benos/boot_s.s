# 1 "src/boot.S"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_8\\lab8-1\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/boot.S"
.section ".text.boot"

.globl _start
_start:

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
       .string "\r\nBooting at asm\r\n"
