#include "asm/uart.h"
#include "io.h"
#include "asm/ptregs.h"
#include "asm/plic.h"
#include "virt.h"

#define VUART_BASE 0x10000000
#define VUART_SIZE 0x1000

#define COMPRESSED_INS(ins) (!((ins & 3) == 3))
#define INS_OPCODE(ins) ((ins)&0x7f)
#define LD_OPCODE (0x03)
#define SD_OPCODE (0x23)
#define INS_FUNCT3(ins) ((ins >> 12) & 0x7)

#define INS_RS2(ins) (((ins) >> 20) & 0x1f)
#define INS_RD(ins) (((ins) >> 7) & 0x1f)

static int check_uart_mmio_range(unsigned long addr)
{
	if (addr >= VUART_BASE && addr <= (VUART_BASE + VUART_SIZE))
		return 1;
	else
		return 0;
}

static int check_plic_mmio_range(unsigned long addr)
{
	if (addr >= PLIC_BASE && addr <= PLIC_END)
		return 1;
	else
		return 0;
}

int check_emul_mmio_range(unsigned long addr)
{
	if (check_uart_mmio_range(addr) || check_plic_mmio_range(addr))
		return 1;
	else
		return 0;
}

unsigned long emul_readreg(struct pt_regs *regs, int reg)
{
    if ((reg <= 0) || (reg > 31))
	    return 0;

    return *(unsigned long *)((unsigned long)regs + reg * 8);
}

void emul_writereg(struct pt_regs *regs, int reg, unsigned long val)
{
    if ((reg <= 0) || (reg > 31))
	    return;

    *(unsigned long *)((unsigned long)regs + reg * 8) = val;
}

void emu_mmio_rw_reg64(struct emu_mmio_access *emu_mmio)
{
	unsigned long val;

	if (emu_mmio->write) {
		val = emul_readreg(emu_mmio->regs, emu_mmio->reg);
		writeq(val, emu_mmio->addr);
	} else {
		val = readq(emu_mmio->addr);
		emul_writereg(emu_mmio->regs, emu_mmio->reg, val);
	}
}

void emu_mmio_ro_reg64(struct emu_mmio_access *emu_mmio)
{
	unsigned long val;

	if (emu_mmio->write)
		return;

	val = readq(emu_mmio->addr);
	emul_writereg(emu_mmio->regs, emu_mmio->reg, val);
}

void emu_mmio_w_reg64(struct emu_mmio_access *emu_mmio)
{
	unsigned long val;

	if (!emu_mmio->write)
		return;

	val = emul_readreg(emu_mmio->regs, emu_mmio->reg);
	writeq(val, emu_mmio->addr);
}

void emu_mmio_rw_reg32(struct emu_mmio_access *emu_mmio)
{
	unsigned int val;

	if (emu_mmio->write) {
		val = emul_readreg(emu_mmio->regs, emu_mmio->reg);
		writel(val, emu_mmio->addr);
	} else {
		val = readl(emu_mmio->addr);
		emul_writereg(emu_mmio->regs, emu_mmio->reg, val);
	}
}

void emu_mmio_ro_reg32(struct emu_mmio_access *emu_mmio)
{
	unsigned int val;

	if (emu_mmio->write)
		return;

	val = readl(emu_mmio->addr);
	emul_writereg(emu_mmio->regs, emu_mmio->reg, val);
}

void emu_mmio_w_reg32(struct emu_mmio_access *emu_mmio)
{
	unsigned int val;

	if (!emu_mmio->write)
		return;

	val = emul_readreg(emu_mmio->regs, emu_mmio->reg);
	writel(val, emu_mmio->addr);
}

void emu_mmio_rw_reg8(struct emu_mmio_access *emu_mmio)
{
	unsigned char val;

	if (emu_mmio->write) {
		val = emul_readreg(emu_mmio->regs, emu_mmio->reg);
		writeb(val, emu_mmio->addr);
	} else {
		val = readb(emu_mmio->addr);
		emul_writereg(emu_mmio->regs, emu_mmio->reg, val);
	}
}

void emu_mmio_ro_reg8(struct emu_mmio_access *emu_mmio)
{
	unsigned char val;

	if (emu_mmio->write)
		return;

	val = readb(emu_mmio->addr);
	emul_writereg(emu_mmio->regs, emu_mmio->reg, val);
}

void emu_mmio_w_reg8(struct emu_mmio_access *emu_mmio)
{
	unsigned char val;

	if (!emu_mmio->write)
		return;

	val = emul_readreg(emu_mmio->regs, emu_mmio->reg);
	writeb(val, emu_mmio->addr);
}

int emu_uart(struct emu_mmio_access *emu_mmio)
{
	switch (emu_mmio->addr) {
	case UART_LSR:
		emu_mmio_ro_reg8(emu_mmio);
		break;
	case UART_DAT:
		emu_mmio_rw_reg8(emu_mmio);
		break;	
	}

	return 0;

}

int emul_device(unsigned long fault_addr, unsigned long ins_val, struct pt_regs *regs)
{
	struct emu_mmio_access emu_mmio;
	int funct3;

	if (COMPRESSED_INS(ins_val)) {
		printk("not support compressed instruction yet\n");
		return -1;
	}

	if (INS_OPCODE(ins_val) != LD_OPCODE &&
			INS_OPCODE(ins_val) != SD_OPCODE)
		return -1;

	emu_mmio.addr = fault_addr;
	emu_mmio.regs = regs;

	funct3 = INS_FUNCT3(ins_val);
	switch (funct3 & 0x3) {
	case 0:
		emu_mmio.width = 1;
		break;
	case 1:
		emu_mmio.width = 2;
		break;
	case 2:
		emu_mmio.width = 4;
		break;
	case 3:
		emu_mmio.width = 8;
		break;
	}

	emu_mmio.write = (INS_OPCODE(ins_val) == SD_OPCODE);

	emu_mmio.reg = emu_mmio.write ? INS_RS2(ins_val) : INS_RD(ins_val);
	emu_mmio.sign_ext = !(funct3 & 0x4);

	if (check_uart_mmio_range(fault_addr))
		emu_uart(&emu_mmio);
	else if (check_plic_mmio_range(fault_addr))
		emu_plic(&emu_mmio);
}
