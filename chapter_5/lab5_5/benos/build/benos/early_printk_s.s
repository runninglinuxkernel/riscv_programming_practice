# 1 "src/early_printk.S"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_5\\lab5_5\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "src/early_printk.S"

.align 2
.globl __init_uart
__init_uart:





 li t0, 0x02000000 + 0xf0
 lw t1, (t0)


 li t2, ~(0xf<<16 | 0xf<<8)
 and t1, t1, t2


 li t2, (0x3<<16 | 0x3<<8)
 or t1, t1, t2


 sw t1, (t0)






 li t0, 0x0200190c
 lw t1, (t0)
 ori t1, t1, 1
 sw t1, (t0)





 li t0, 0x0200190c
 lw t1, (t0)
 li t2, (1<<16)
 or t1, t1, t2
 sw t1, (t0)
# 59 "src/early_printk.S"
 li t0, 0x02500000


 sw x0, 0x04(t0)


 li t1, 0xf7
 sw t1, 0x08(t0)


 sw x0, 0x10(t0)


 lw t1, 0x0c(t0)
 ori t1, t1, (1<<7)
 sw t1, 0x0c(t0)



 li t2, 0xd & 0xff
 sw t2, (t0)
 li t2, (0xd>>8) & 0xff
 sw t2, 0x04(t0)


 xori t1, t1, (1<<7)
 sw t1, 0x0c(t0)


 lw t1, 0x0c(t0)
 li t2, ~0xf
 and t1, t1, t2
 li t2, (0x3 << 0) | (0 << 2) | (0x0 << 3)
 or t1, t1, t2
 sw t1, 0x0c(t0)

 ret

.global put_uart
put_uart:
 li t0, 0x02500000
.loop:

 lw t1, 0x7c(t0)
 andi t1, t1, (1<<1)
 beqz t1, .loop
 sb a0, (t0)

 ret

.global put_string_uart
put_string_uart:

 mv s8, ra
 mv a5, a0

.loop1:
 lbu a0,(a5)
 beqz a0, .L2
 call put_uart
 addi a5,a5,1
 j .loop1
.L2:

 mv ra, s8
 ret
