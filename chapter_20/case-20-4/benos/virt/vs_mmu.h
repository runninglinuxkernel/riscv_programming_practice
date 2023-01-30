#ifndef _BENOS_VS_MMU_H_
#define _BENOS_VS_MMU_H_

void set_vs_mapping_page(unsigned long gva, unsigned long gpa);
void vs_paging_init(void);

#endif
