# 1 "sbi/sbi_entry.S"
# 1 "E:\\d1s_projects\\riscv_programming_practice-for-dongshan\\chapter_8\\lab8-1\\benos//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sbi/sbi_entry.S"
# 1 "sbi/sbi_asm_offsets.h" 1
# 2 "sbi/sbi_entry.S" 2






.align 3
.global sbi_exception_vector
sbi_exception_vector:

 csrrw sp, mscratch, sp

 addi sp, sp, -(264)

 sd x1, 8(sp)
 sd x3, 24(sp)
 sd x5, 40(sp)
 sd x6, 48(sp)
 sd x7, 56(sp)
 sd x8, 64(sp)
 sd x9, 72(sp)
 sd x10, 80(sp)
 sd x11, 88(sp)
 sd x12, 96(sp)
 sd x13, 104(sp)
 sd x14, 112(sp)
 sd x15, 120(sp)
 sd x16, 128(sp)
 sd x17, 136(sp)
 sd x18, 144(sp)
 sd x19, 152(sp)
 sd x20, 160(sp)
 sd x21, 168(sp)
 sd x22, 176(sp)
 sd x23, 184(sp)
 sd x24, 192(sp)
 sd x25, 200(sp)
 sd x26, 208(sp)
 sd x27, 216(sp)
 sd x28, 224(sp)
 sd x29, 232(sp)
 sd x30, 240(sp)
 sd x31, 248(sp)


 csrr t0, mepc
 sd t0, 0(sp)


 csrr t0, mstatus
 sd t0, 256(sp)






 addi t0, sp, 264

 csrrw t0, mscratch, t0
 sd t0, 16(sp)


 mv a0, sp
 call sbi_trap_handler


 ld t0, 256(sp)
 csrw mstatus, t0

 ld t0, 0(sp)
 csrw mepc, t0

 ld x1, 8(sp)
 ld x3, 24(sp)
 ld x5, 40(sp)
 ld x6, 48(sp)
 ld x7, 56(sp)
 ld x8, 64(sp)
 ld x9, 72(sp)
 ld x10, 80(sp)
 ld x11, 88(sp)
 ld x12, 96(sp)
 ld x13, 104(sp)
 ld x14, 112(sp)
 ld x15, 120(sp)
 ld x16, 128(sp)
 ld x17, 136(sp)
 ld x18, 144(sp)
 ld x19, 152(sp)
 ld x20, 160(sp)
 ld x21, 168(sp)
 ld x22, 176(sp)
 ld x23, 184(sp)
 ld x24, 192(sp)
 ld x25, 200(sp)
 ld x26, 208(sp)
 ld x27, 216(sp)
 ld x28, 224(sp)
 ld x29, 232(sp)
 ld x30, 240(sp)
 ld x31, 248(sp)

 ld sp, 16(sp)
 mret
