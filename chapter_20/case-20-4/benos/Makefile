GNU ?= riscv64-linux-gnu

COPS += -save-temps=obj -g -O0 -Wall -nostdlib -Iinclude -mcmodel=medany -mabi=lp64 -march=rv64imafd -fno-PIE -fno-omit-frame-pointer -Wno-builtin-declaration-mismatch

AOPS += -D__ASSEMBLY__

board ?= qemu

ifeq ($(board), qemu)
COPS += -DCONFIG_BOARD_QEMU
else ifeq ($(board), nemu)
COPS += -DCONFIG_BOARD_NEMU
endif

##############
#  build benos
##############
BUILD_ROOT= build
BUILD_DIR = $(BUILD_ROOT)/benos
SRC_DIR = src
LIB_DIR = lib
BUILD_LIB_DIR = $(BUILD_ROOT)/lib
USR_DIR = usr
BUILD_USR_DIR = $(BUILD_ROOT)/usr
VIRT_DIR = virt
BUILD_VIRT_DIR = $(BUILD_ROOT)/virt

all : clean benos.bin mysbi.bin benos_payload.bin

# Check if verbosity is ON for build process
CMD_PREFIX_DEFAULT := @
ifeq ($(V), 1)
	CMD_PREFIX :=
else
	CMD_PREFIX := $(CMD_PREFIX_DEFAULT)
endif

clean :
	rm -rf $(BUILD_ROOT)  *.bin  *.map *.elf

$(BUILD_DIR)/%_c.o: $(SRC_DIR)/%.c
	$(CMD_PREFIX)mkdir -p $(BUILD_DIR); echo " CC   $@" ; $(GNU)-gcc $(COPS) -c $< -o $@

$(BUILD_DIR)/%_s.o: $(SRC_DIR)/%.S
	$(CMD_PREFIX)mkdir -p $(BUILD_DIR); echo " AS   $@"; $(GNU)-gcc $(COPS) $(AOPS) -c $< -o $@

$(BUILD_LIB_DIR)/%_c.o: $(LIB_DIR)/%.c
	$(CMD_PREFIX)mkdir -p $(BUILD_LIB_DIR); echo " CC   $@" ; $(GNU)-gcc $(COPS) -c $< -o $@

$(BUILD_USR_DIR)/%_c.o: $(USR_DIR)/%.c
	$(CMD_PREFIX)mkdir -p $(BUILD_USR_DIR); echo " CC   $@" ; $(GNU)-gcc $(COPS) -c $< -o $@

$(BUILD_USR_DIR)/%_s.o: $(USR_DIR)/%.S
	$(CMD_PREFIX)mkdir -p $(BUILD_USR_DIR); echo " AS   $@"; $(GNU)-gcc $(COPS) $(AOPS) -c $< -o $@

$(BUILD_VIRT_DIR)/%_c.o: $(VIRT_DIR)/%.c
	$(CMD_PREFIX)mkdir -p $(BUILD_VIRT_DIR); echo " CC   $@" ; $(GNU)-gcc $(COPS) -c $< -o $@

$(BUILD_VIRT_DIR)/%_s.o: $(VIRT_DIR)/%.S
	$(CMD_PREFIX)mkdir -p $(BUILD_VIRT_DIR); echo " AS   $@"; $(GNU)-gcc $(COPS) $(AOPS) -c $< -o $@
	
C_FILES = $(wildcard $(SRC_DIR)/*.c)
LIB_FILES = $(wildcard $(LIB_DIR)/*.c)
ASM_FILES = $(wildcard $(SRC_DIR)/*.S)
USR_C_FILES = $(wildcard $(USR_DIR)/*.c)
USR_A_FILES = $(wildcard $(USR_DIR)/*.S)
VIRT_C_FILES = $(wildcard $(VIRT_DIR)/*.c)
VIRT_A_FILES = $(wildcard $(VIRT_DIR)/*.S)

OBJ_FILES = $(C_FILES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%_c.o)
OBJ_FILES += $(ASM_FILES:$(SRC_DIR)/%.S=$(BUILD_DIR)/%_s.o)
OBJ_FILES += $(LIB_FILES:$(LIB_DIR)/%.c=$(BUILD_LIB_DIR)/%_c.o)
OBJ_FILES += $(USR_C_FILES:$(USR_DIR)/%.c=$(BUILD_USR_DIR)/%_c.o)
OBJ_FILES += $(USR_A_FILES:$(USR_DIR)/%.S=$(BUILD_USR_DIR)/%_s.o)
OBJ_FILES += $(VIRT_C_FILES:$(VIRT_DIR)/%.c=$(BUILD_VIRT_DIR)/%_c.o)
OBJ_FILES += $(VIRT_A_FILES:$(VIRT_DIR)/%.S=$(BUILD_VIRT_DIR)/%_s.o)

DEP_FILES = $(OBJ_FILES:%.o=%.d)
-include $(DEP_FILES)

# The finally linked kernel.
benos.bin: $(SRC_DIR)/linker.ld $(OBJ_FILES)
	$(CMD_PREFIX)gcc scripts/kallsyms/kallsyms.c -o scripts/kallsyms/kallsyms; echo " CC kallsyms"
	$(CMD_PREFIX)$(GNU)-ld -T $(SRC_DIR)/linker.ld -o .tmp_vmbenos1 $(OBJ_FILES); echo " LD .tmp_vmbenos1"
	$(CMD_PREFIX)$(GNU)-nm .tmp_vmbenos1 | scripts/kallsyms/kallsyms > .tmp_kallsyms1.S ; echo " NM .tmp_kallsyms1.S"
	$(CMD_PREFIX)$(GNU)-gcc $(COPS) -c -o .tmp_kallsyms1.o .tmp_kallsyms1.S; echo " CC .tmp_kallsyms1.o" 
	$(CMD_PREFIX)$(GNU)-ld -T $(SRC_DIR)/linker.ld -o .tmp_vmbenos2 $(OBJ_FILES) .tmp_kallsyms1.o; echo " LD .tmp_vmbenos2"
	$(CMD_PREFIX)$(GNU)-nm .tmp_vmbenos2 | scripts/kallsyms/kallsyms > .tmp_kallsyms2.S; echo " NM .tmp_kallsyms2.S"
	$(CMD_PREFIX)$(GNU)-gcc $(COPS) -c -o .tmp_kallsyms2.o .tmp_kallsyms2.S; echo " CC .tmp_kallsyms2.o"

	$(CMD_PREFIX)$(GNU)-ld -T $(SRC_DIR)/linker.ld -o $(BUILD_DIR)/benos.elf  $(OBJ_FILES) .tmp_kallsyms2.o -Map benos.map; echo " LD $(BUILD_DIR)/benos.elf"
	$(CMD_PREFIX)$(GNU)-objcopy $(BUILD_DIR)/benos.elf -O binary benos.bin; echo " OBJCOPY benos.bin"
	$(CMD_PREFIX)cp $(BUILD_DIR)/benos.elf benos.elf

##############
#  build SBI
##############
SBI_BUILD_DIR = $(BUILD_ROOT)/sbi
SBI_SRC_DIR = sbi
$(SBI_BUILD_DIR)/%_c.o: $(SBI_SRC_DIR)/%.c
	$(CMD_PREFIX)mkdir -p $(SBI_BUILD_DIR); echo " CC   $@" ; $(GNU)-gcc $(COPS) -c $< -o $@

$(SBI_BUILD_DIR)/%_s.o: $(SBI_SRC_DIR)/%.S
	$(CMD_PREFIX)mkdir -p $(SBI_BUILD_DIR); echo " AS   $@"; $(GNU)-gcc $(COPS) -c $< -o $@

SBI_C_FILES = $(wildcard $(SBI_SRC_DIR)/*.c)
SBI_ASM_FILES = $(wildcard $(SBI_SRC_DIR)/*.S)
SBI_OBJ_FILES = $(SBI_C_FILES:$(SBI_SRC_DIR)/%.c=$(SBI_BUILD_DIR)/%_c.o)
SBI_OBJ_FILES += $(SBI_ASM_FILES:$(SBI_SRC_DIR)/%.S=$(SBI_BUILD_DIR)/%_s.o) 
SBI_OBJ_FILES += $(LIB_FILES:$(LIB_DIR)/%.c=$(BUILD_LIB_DIR)/%_c.o)

# DEP_FILES = $(SBI_OBJ_FILES:%.o=%.d)
# -include $(DEP_FILES)

mysbi.bin: $(SBI_SRC_DIR)/sbi_linker.ld $(SBI_OBJ_FILES) 
	$(CMD_PREFIX)$(GNU)-ld -T $(SBI_SRC_DIR)/sbi_linker.ld -o $(SBI_BUILD_DIR)/mysbi.elf  $(SBI_OBJ_FILES) -Map mysbi.map; echo " LD $(SBI_BUILD_DIR)/mysbi.elf"
	$(CMD_PREFIX)$(GNU)-objcopy $(SBI_BUILD_DIR)/mysbi.elf -O binary mysbi.bin; echo " OBJCOPY mysbi.bin"
	$(CMD_PREFIX)cp $(SBI_BUILD_DIR)/mysbi.elf mysbi.elf

######################
#  build benos payload
######################
benos_payload.bin: $(SBI_SRC_DIR)/sbi_linker_payload.ld $(SBI_OBJ_FILES) $(OBJ_FILES)
	$(CMD_PREFIX)$(GNU)-ld -T $(SBI_SRC_DIR)/sbi_linker_payload.ld -o $(SBI_BUILD_DIR)/benos_payload.elf  $(SBI_OBJ_FILES) -Map benos_payload.map; echo " LD $(SBI_BUILD_DIR)/benos_payload.elf"
	$(CMD_PREFIX)$(GNU)-objcopy $(SBI_BUILD_DIR)/benos_payload.elf -O binary benos_payload.bin; echo " OBJCOPY benos_payload.bin"
	$(CMD_PREFIX)cp $(SBI_BUILD_DIR)/benos_payload.elf benos_payload.elf

##############
#  run qemu
##############
ifeq ($(board), qemu)
QEMU = qemu-system-riscv64-7.0
QEMU_FLAGS  += -nographic -machine virt -m 128M 
QEMU_BIOS = -bios mysbi.bin  -device loader,file=benos.bin,addr=0x80200000 
run:
	$(QEMU) $(QEMU_FLAGS) $(QEMU_BIOS) -kernel benos.elf
debug:
	$(QEMU) $(QEMU_FLAGS) $(QEMU_BIOS) -kernel benos.elf -S -s
payload:
	$(QEMU) $(QEMU_FLAGS) -bios none -device loader,file=benos_payload.bin,addr=0x80000000

else ifeq ($(board), nemu)
run:
	riscv64-nemu-interpreter -b benos_payload.bin
debug:
	riscv64-nemu-interpreter benos_payload.bin
endif
