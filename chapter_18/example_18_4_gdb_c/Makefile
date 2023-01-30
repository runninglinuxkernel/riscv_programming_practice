GNU ?= riscv64-unknown-elf

COPS = -g -O0 -T spike.lds -nostartfiles -march=rv64gcv

all : test

%_c.o:%.c
	$(GNU)-gcc $(COPS) -c $< -o $@

%_s.o:%.S
	$(GNU)-gcc $(COPS) -c $< -o $@

C_FILES = $(wildcard *.c)
ASM_FILES = $(wildcard *.S)
OBJ_FILES = $(C_FILES:%.c=%_c.o)
OBJ_FILES += $(ASM_FILES:%.S=%_s.o)

test: $(OBJ_FILES)
	$(GNU)-gcc -o test  $(OBJ_FILES) $(COPS)

clean:
	rm *.o
	rm test

debug:
	spike --rbb-port=1234 -m0x10000000:0x20000 --isa=rv64gcv test
