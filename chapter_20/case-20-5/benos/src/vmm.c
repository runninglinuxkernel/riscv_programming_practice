
unsigned long hlvwu(unsigned long addr)
{
    unsigned long value;
    asm volatile(
        ".insn r 0x73, 0x4, 0x34, %0, %1, x1\n\t"
        : "=r"(value): "r"(addr) : "memory", "x1");
    return value;
}

unsigned long hlvxwu(unsigned long addr)
{
    unsigned long value;
    asm volatile(
        ".insn r 0x73, 0x4, 0x34, %0, %1, x3\n\t"
        : "=r"(value): "r"(addr) : "memory", "x3");
    return value;
}

void hsvw(unsigned long addr, unsigned long value)
{
    asm volatile(
        ".insn r 0x73, 0x4, 0x35, x0, %1, %0\n\t"
        : "+r"(value): "r"(addr) : "memory");
}
