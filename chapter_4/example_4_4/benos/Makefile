GNU ?= riscv64-linux-gnu

COPS += -g -O0 -Wall -nostdlib -Iinclude -mcmodel=medany -mabi=lp64 -march=rv64imafdc -fno-PIE -fno-omit-frame-pointer -Wno-builtin-declaration-mismatch

##############
#  build benos
##############
BUILD_DIR = build_src
SRC_DIR = src

all : benos.bin mysbi.bin

# Check if verbosity is ON for build process
CMD_PREFIX_DEFAULT := @
ifeq ($(V), 1)
	CMD_PREFIX :=
else
	CMD_PREFIX := $(CMD_PREFIX_DEFAULT)
endif

clean :
	rm -rf $(BUILD_DIR) $(SBI_BUILD_DIR) *.bin  *.map *.elf

$(BUILD_DIR)/%_c.o: $(SRC_DIR)/%.c
	$(CMD_PREFIX)mkdir -p $(BUILD_DIR); echo " CC   $@" ; $(GNU)-gcc $(COPS) -c $< -o $@

$(BUILD_DIR)/%_s.o: $(SRC_DIR)/%.S
	$(CMD_PREFIX)mkdir -p $(BUILD_DIR); echo " AS   $@"; $(GNU)-gcc $(COPS) -c $< -o $@

C_FILES = $(wildcard $(SRC_DIR)/*.c)
ASM_FILES = $(wildcard $(SRC_DIR)/*.S)
OBJ_FILES = $(C_FILES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%_c.o)
OBJ_FILES += $(ASM_FILES:$(SRC_DIR)/%.S=$(BUILD_DIR)/%_s.o)

DEP_FILES = $(OBJ_FILES:%.o=%.d)
-include $(DEP_FILES)

benos.bin: $(SRC_DIR)/linker.ld $(OBJ_FILES)
	$(CMD_PREFIX)$(GNU)-ld -T $(SRC_DIR)/linker.ld -o $(BUILD_DIR)/benos.elf  $(OBJ_FILES) -Map benos.map; echo " LD $(BUILD_DIR)/benos.elf"
	$(CMD_PREFIX)$(GNU)-objcopy $(BUILD_DIR)/benos.elf -O binary benos.bin; echo " OBJCOPY benos.bin"
	$(CMD_PREFIX)cp $(BUILD_DIR)/benos.elf benos.elf

##############
#  build SBI
##############
SBI_BUILD_DIR = build_sbi
SBI_SRC_DIR = sbi
$(SBI_BUILD_DIR)/%_c.o: $(SBI_SRC_DIR)/%.c
	$(CMD_PREFIX)mkdir -p $(SBI_BUILD_DIR); echo " CC   $@" ; $(GNU)-gcc $(COPS) -c $< -o $@

$(SBI_BUILD_DIR)/%_s.o: $(SBI_SRC_DIR)/%.S
	$(CMD_PREFIX)mkdir -p $(SBI_BUILD_DIR); echo " AS   $@"; $(GNU)-gcc $(COPS) -c $< -o $@

SBI_C_FILES = $(wildcard $(SBI_SRC_DIR)/*.c)
SBI_ASM_FILES = $(wildcard $(SBI_SRC_DIR)/*.S)
SBI_OBJ_FILES = $(SBI_C_FILES:$(SBI_SRC_DIR)/%.c=$(SBI_BUILD_DIR)/%_c.o)
SBI_OBJ_FILES += $(SBI_ASM_FILES:$(SBI_SRC_DIR)/%.S=$(SBI_BUILD_DIR)/%_s.o) 

# DEP_FILES = $(SBI_OBJ_FILES:%.o=%.d)
# -include $(DEP_FILES)

mysbi.bin: $(SBI_SRC_DIR)/sbi_linker.ld $(SBI_OBJ_FILES) 
	$(CMD_PREFIX)$(GNU)-ld -T $(SBI_SRC_DIR)/sbi_linker.ld -o $(SBI_BUILD_DIR)/mysbi.elf  $(SBI_OBJ_FILES) -Map mysbi.map; echo " LD $(SBI_BUILD_DIR)/mysbi.elf"
	$(CMD_PREFIX)$(GNU)-objcopy $(SBI_BUILD_DIR)/mysbi.elf -O binary mysbi.bin; echo " OBJCOPY mysbi.bin"
	$(CMD_PREFIX)cp $(SBI_BUILD_DIR)/mysbi.elf mysbi.elf

##############
#  run qemu
##############

QEMU_FLAGS  += -nographic -machine virt -m 128M -bios mysbi.bin  -device loader,file=benos.bin,addr=0x80200000 

run:
	qemu-system-riscv64 $(QEMU_FLAGS) -kernel benos.elf
debug:
	qemu-system-riscv64 $(QEMU_FLAGS) -kernel benos.elf -S -s
