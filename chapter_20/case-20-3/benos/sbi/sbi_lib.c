#include "asm/csr.h"

/*
 * 暂时支持8个pmpcfpg
 */
unsigned long read_csr_num(int csr_num)
{
	unsigned long ret = 0;

	switch (csr_num) {
	case CSR_PMPCFG0:
		ret = read_csr(CSR_PMPCFG0);
		break;
	case CSR_PMPADDR0:
		ret = read_csr(CSR_PMPADDR0);
		break;
	case CSR_PMPADDR1:
		ret = read_csr(CSR_PMPADDR1);
		break;
	case CSR_PMPADDR2:
		ret = read_csr(CSR_PMPADDR2);
		break;
	case CSR_PMPADDR3:
		ret = read_csr(CSR_PMPADDR3);
		break;
	case CSR_PMPADDR4:
		ret = read_csr(CSR_PMPADDR4);
		break;
	case CSR_PMPADDR5:
		ret = read_csr(CSR_PMPADDR5);
		break;
	case CSR_PMPADDR6:
		ret = read_csr(CSR_PMPADDR6);
		break;
	case CSR_PMPADDR7:
		ret = read_csr(CSR_PMPADDR7);
		break;
	default:
		break;
	};

	return ret;
}

void write_csr_num(int csr_num, unsigned long val)
{
	switch (csr_num) {
	case CSR_PMPCFG0:
		write_csr(CSR_PMPCFG0, val);
		break;
	case CSR_PMPADDR0:
		write_csr(CSR_PMPADDR0, val);
		break;
	case CSR_PMPADDR1:
		write_csr(CSR_PMPADDR1, val);
		break;
	case CSR_PMPADDR2:
		write_csr(CSR_PMPADDR2, val);
		break;
	case CSR_PMPADDR3:
		write_csr(CSR_PMPADDR3, val);
		break;
	case CSR_PMPADDR4:
		write_csr(CSR_PMPADDR4, val);
		break;
	case CSR_PMPADDR5:
		write_csr(CSR_PMPADDR5, val);
		break;
	case CSR_PMPADDR6:
		write_csr(CSR_PMPADDR6, val);
		break;
	case CSR_PMPADDR7:
		write_csr(CSR_PMPADDR7, val);
		break;
	default:
		break;
	};
}

unsigned long log2roundup(unsigned long x)
{
	unsigned long ret = 0;

	while (ret < RISCV_XLEN) {
		if (x <= (1UL << ret))
			break;
		ret++;
	}

	return ret;
}
