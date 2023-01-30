#ifndef __BENOS_VIRT_H_
#define __BENOS_VIRT_H_

struct emu_mmio_access {
	struct pt_regs *regs;
	unsigned long addr;
	int write;
	int sign_ext;
	int width;
	int reg;
};


int check_emul_mmio_range(unsigned long addr);
int emul_device(unsigned long fault_addr, unsigned long ins_val,
		struct pt_regs *regs);
unsigned long emul_readreg(struct pt_regs *regs, int reg);
void emul_writereg(struct pt_regs *regs, int reg, unsigned long val);

void emu_mmio_rw_reg64(struct emu_mmio_access *emu_mmio);
void emu_mmio_ro_reg64(struct emu_mmio_access *emu_mmio);
void emu_mmio_w_reg64(struct emu_mmio_access *emu_mmio);
void emu_mmio_rw_reg32(struct emu_mmio_access *emu_mmio);
void emu_mmio_ro_reg32(struct emu_mmio_access *emu_mmio);
void emu_mmio_w_reg32(struct emu_mmio_access *emu_mmio);
void emu_mmio_rw_reg8(struct emu_mmio_access *emu_mmio);
void emu_mmio_ro_reg8(struct emu_mmio_access *emu_mmio);
void emu_mmio_w_reg8(struct emu_mmio_access *emu_mmio);

#endif
