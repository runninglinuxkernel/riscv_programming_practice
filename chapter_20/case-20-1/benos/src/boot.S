#include "asm/pgtable_hwdef.h"
#include "mm.h"
#include "asm/memory.h"
#include "sched.h"

.section ".text.boot"

.globl _start
_start:
	/* 关闭中断 */
	csrw sie, zero

	call __init_uart
	call print_asm

	/* 设置栈: init_task_union + THREAD_SIZE*/
	la sp, init_task_union
	li t0, THREAD_SIZE
	add sp, sp, t0
	la tp, init_task_union

	//call create_page_table
	//call enable_mmu_relocate

	/* 跳转到C语言 */
	tail kernel_main

print_asm:
        /*此时SP栈空间还没分配，把返回地址ra保存到临时寄存器中*/
	mv s1, ra

	la a0, boot_string
	call put_string_uart

	/*恢复返回地址ra*/
	mv ra, s1
	ret

.global create_page_table
create_page_table:
	addi sp, sp, -16
	sd ra, 8(sp)
        //mv s1, ra

	/*1. create identical mapping*/
	la a0, idmap_pg_dir
	la a1, idmap_pg_end
.loop1:
	sd x0, (a0)
	addi a0, a0, 8
	blt a0, a1, .loop1

	/* create idmap mapping */
	la t0, SECTION_MASK
	la t1, SECTION_SIZE
	li t2, 1

	la a0, idmap_pg_dir
	la a1, _text_boot
	and a1, a1, t0
	mv a2, a1
	li a3, DDR_END
	add a3, a3, t1
	sub a3, a3, t2
	and a3, a3, t0
	la a4, SECTION_KERNEL_RWX

	call  __create_section_mapping

	ld ra, 8(sp)
	addi sp, sp, 16
	//mv ra, s1
	ret

/*
   a0: page table base address
   a1: phys address
   a2: virt start address
   a3: virt end address
   a4: prot
 */
__create_section_mapping:
	addi sp, sp, -16
	sd ra, 8(sp)
	//mv s2, ra

	/* 1. find pgd entry, a5: pgd index (bytes) */
	srli t0, a2, PGDIR_SHIFT
	slli a5, t0, 3

	/*2. fill pgd entry, a6: pmd base address*/
	li t0, PAGE_SIZE
	add a6, a0, t0

	/* create pgd entry: pfn of pmd base addr + prot */
	srli t1, a6, PAGE_SHIFT /*PMD页表基地址的页帧号*/
	slli t1, t1, _PAGE_PFN_SHIFT /* 页帧号 左移10位，得到页表项的内容*/
	/* 页表项 加上 页面属性，得到 完整的页表项内容
	   _PAGE_TABLE表示指向下一级页表*/
	ori t1, t1, _PAGE_TABLE 

	/*write pgd entry into pgdp */
	add t2, a0, a5
	sd t1, (t2)

        /*3. fill pmd entry, a7: pmd index (bytes)*/
.loop2:
	/* 由vaddr来计算pmd索引值 */
	srli t0, a2, PMD_SHIFT
	li t1, PTRS_PER_PMD - 1
	and t0, t0, t1
	slli a7, t0, 3  /* pmd索引值 转换成 字节数*/

	/*create pmd entry: pfn of phys addr + prot */
	srli t1, a1, PAGE_SHIFT /* 得到物理地址pa的页帧号*/
	slli t1, t1, _PAGE_PFN_SHIFT /* 页帧号 左移10位，得到页表项的内容*/
	or t1, t1, a4 /* 页表项 加上 页面属性，得到 完整的页表项内容*/

	/* write pmd entry into pmdp*/
	add t2, a6, a7
	sd t1, (t2)

	la t1, SECTION_SIZE
	add a2, a2, t1
	add a1, a1, t1
	blt a2, a3, .loop2

	ld ra, 8(sp)
	addi sp, sp, 16
	///mv ra, s2
	ret

.section  .rodata
.align 3
.globl boot_string
boot_string:
       .string "Booting at asm\n"
