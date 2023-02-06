# 1 "src/memset.S"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_5\\lab5_5\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/memset.S"
.global __memset_16bytes_asm
__memset_16bytes_asm:
 li t0, 0
.loop:
 sd a1, (a0)
 sd a1, 8(a0)
 addi t0, t0, 16
 blt t0, a2, .loop

 ret
