#ifndef	_MM_H
#define	_MM_H

#define PAGE_SHIFT	 		12
#define TABLE_SHIFT 			9

#define PAGE_SIZE   			(1 << PAGE_SHIFT)	
#define PAGE_MASK (~(PAGE_SIZE-1))

/* to align the pointer to the (next) page boundary */
#define PAGE_ALIGN(addr) (((addr)+PAGE_SIZE-1)&PAGE_MASK)
#define PAGE_ALIGN_UP(addr)  PAGE_ALIGN(addr)
#define PAGE_ALIGN_DOWN(addr) (addr & PAGE_MASK)

#define PFN_DOWN(x)	((x) >> PAGE_SHIFT)

#ifndef __ASSEMBLER__
void paging_init(void);
void enable_mmu_relocate(void);

unsigned long get_free_page(void);
void free_page(unsigned long p);
void mem_init(unsigned long start_mem, unsigned long end_mem);
#endif

#endif  /*_MM_H */
