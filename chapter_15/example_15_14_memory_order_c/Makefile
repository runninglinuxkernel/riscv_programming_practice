GNU ?= gcc

COPS = -g -O2 -lpthread
AOPS = -g -O2 

all : test

%_c.o:%.c
	$(GNU) $(COPS) -c $< -o $@

%_s.o:%.S
	$(GNU) $(AOPS) -c $< -o $@

C_FILES = $(wildcard *.c)
ASM_FILES = $(wildcard *.S)
OBJ_FILES = $(C_FILES:%.c=%_c.o)
OBJ_FILES += $(ASM_FILES:%.S=%_s.o)

test: $(OBJ_FILES)
	$(GNU) -o test  $(OBJ_FILES) $(COPS)

clean:
	rm *.o
	rm test

