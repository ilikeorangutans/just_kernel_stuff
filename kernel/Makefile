TARGET=i686-elf
CC=$(TARGET)-gcc
AS=$(TARGET)-as
CFLAGS=-Wall -std=c11 -ffreestanding -O2 -Wextra -Iinclude --sysroot=../sysroot -isystem=/usr/include 
ARCHDIR:=arch/i386

include arch/i386/make.config

OBJS:=\
$(KERNEL_ARCH_OBJS) \
kernel/kernel.o \
kernel/terminal.o \

OBJ_LINK_LIST:=\
$(OBJS) \

HEADERS=$(wildcard include/kernel/*.h)
SOURCES=$(wildcard kernel/*.c)

LIBS=-nostdlib -lk -lgcc

.PHONY: all clean

all: kernel.bin $(HEADERS)

%.o: %.s
	$(AS) $< -o $@

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

kernel.bin: $(OBJ_LINK_LIST) $(ARCHDIR)/linker.ld $(HEADERS)
	$(CC) -T $(ARCHDIR)/linker.ld -o kernel.bin $(LIBS) $(OBJ_LINK_LIST) $(CFLAGS)

clean:
	rm -f $(OBJ_LINK_LIST) kernel.bin

format:
	clang-format -i $(HEADERS) $(SOURCES)

