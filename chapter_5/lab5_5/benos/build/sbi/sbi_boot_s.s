# 1 "sbi/sbi_boot.S"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_5\\lab5_5\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sbi/sbi_boot.S"
.section ".text.boot"

.globl _start
_start:

 .long 0x0300006f
 .byte 'e', 'G', 'O', 'N', '.', 'B', 'T', '0'
 .long 0x12345678
 .long __bin_size
 .long 0x30
 .long 0x30303033
 .long 0x00020000
 .long 0x00020000
 .long 0x0
 .byte 0x00, 0x00, 0x00, 0x00
 .byte 0x34, 0x2e, 0x30, 0x00




reset:

 la sp, stacks_start
 li t0, 4096
 add sp, sp, t0


 tail sbi_main

.section .data
.align 12
.global stacks_start
stacks_start:
 .skip 4096
