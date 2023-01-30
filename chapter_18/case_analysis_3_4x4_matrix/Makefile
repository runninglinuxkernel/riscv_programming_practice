GNU ?= riscv64-unknown-elf

COPS = -g -march=rv64gcv --static

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
	$(GNU)-gcc -o test  $(OBJ_FILES)

clean:
	rm *.o
	rm test

run:
	spike --varch=vlen:128,elen:32 --isa=rv64gcv pk test
