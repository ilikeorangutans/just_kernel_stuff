TARGET=i686-elf
CC=$(TARGET)-gcc
AS=$(TARGET)-as
CFLAGS=-c -Wall -std=gnu99 -ffreestanding -O2 -Wextra

SOURCES=kernel.c
OBJECTS=kernel.o

all: $(SOURCES) boot.iso

$(OBJECTS): $(SOURCES)
	$(CC) $(CFLAGS) $< -o $@ 

kernel.bin: boot.o $(OBJECTS) linker.ld
	$(CC) -T linker.ld -o kernel.bin -ffreestanding -O2 -nostdlib boot.o $(OBJECTS) -lgcc

boot.iso: kernel.bin
	cp kernel.bin iso/boot/kernel.bin
	grub-mkrescue -o boot.iso iso

clean: 
	rm *.o *.bin *.iso

boot.o: boot.s
	$(AS) boot.s -o boot.o

run: boot.iso
	qemu-system-i386 -cdrom boot.iso

