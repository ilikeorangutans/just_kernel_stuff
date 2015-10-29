
.PHONY: all kernel clean clean-all

all: kernel boot.iso

kernel: 
	$(MAKE) -w -C kernel

boot.iso: 
	mkdir -p iso/boot/grub
	cp kernel/kernel.bin iso/boot/kernel.bin
	grub-mkrescue -o boot.iso iso

run: boot.iso
	qemu-system-i386 -cdrom boot.iso

clean: 
	rm boot.iso

clean-all: clean
	$(MAKE) -w -C kernel clean
