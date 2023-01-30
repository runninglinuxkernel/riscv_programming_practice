#include "virt.h"
#include "io.h"
#include "asm/plic.h"
#include "asm/trap.h"
#include "asm/csr.h"

extern int vhwirq;

int emu_plic_basic(struct emu_mmio_access *emu_mmio)
{
	unsigned long addr = emu_mmio->addr;
	int reg = (addr >> 12) & 0x3;

	switch (reg) {
	case 0: // PLIC_PRIORITY
		emu_mmio_rw_reg32(emu_mmio);
		break;
	case 1: //PLIC_PENDING
		emu_mmio_ro_reg32(emu_mmio);
		break;
	case 2: //PLIC_MENABLE
		emu_mmio_rw_reg32(emu_mmio);
		break;
	}

	return 0;
}

static void emu_mmio_plic_claim(struct emu_mmio_access *emu_mmio)
{
	unsigned int val;

	if (emu_mmio->write) {
		vhwirq = 0;
	} else {
		emul_writereg(emu_mmio->regs, emu_mmio->reg, vhwirq);
	}
}

static void emu_plic_claim(struct emu_mmio_access *emu_mmio)
{
	unsigned long addr = emu_mmio->addr;
	int reg = addr & 0xf;

	switch (reg) {
	case 0: //PLIC_MTHRESHOLD
		emu_mmio_rw_reg32(emu_mmio);
		break;
	case 4: //PLIC_MCLAIM
		emu_mmio_plic_claim(emu_mmio);
		break;
	}
}

int emu_plic(struct emu_mmio_access *emu_mmio) 
{
	if (emu_mmio->addr > PLIC_BASE + PLIC_CLAIMCMPLT_OFF)
		emu_plic_claim(emu_mmio);
	else
		emu_plic_basic(emu_mmio);

	return 0;
}
