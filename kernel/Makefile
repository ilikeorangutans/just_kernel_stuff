TARGET=i686-elf
CC=$(TARGET)-gcc
AS=$(TARGET)-as
CFLAGS=-c -Wall -std=c11 -ffreestanding -O2 -Wextra -Iinclude
ARCHDIR:=arch/i386

include arch/i386/make.config

OBJS:=\
$(KERNEL_ARCH_OBJS) \
kernel/kernel.o \
kernel/terminal.o \

OBJ_LINK_LIST:=\
$(OBJS) \

HEADERS=$(wildcard include/kernel/*.h)

.PHONY: all clean

all: kernel.bin $(HEADERS)

%.o: %.s
	$(AS) $< -o $@

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

kernel.bin: $(OBJ_LINK_LIST) $(ARCHDIR)/linker.ld $(HEADERS)
	$(CC) -T $(ARCHDIR)/linker.ld -o kernel.bin -ffreestanding -O2 -nostdlib $(OBJ_LINK_LIST) -lgcc

clean:
	rm -f $(OBJ_LINK_LIST) kernel.bin

