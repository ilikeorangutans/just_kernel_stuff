
.PHONY: all kernel clean clean-all libk sysroot

all: libk sysroot kernel boot.iso

libk: 
	$(MAKE) -w -C libc

kernel: 
	$(MAKE) -w -C kernel

sysroot:
	mkdir -p sysroot/usr/include
	mkdir -p sysroot/usr/lib
	cp -rv kernel/include/* sysroot/usr/include
	cp -v libc/libk.a sysroot/usr/lib/

boot.iso: kernel/kernel.bin
	mkdir -p iso/boot/grub
	cp kernel/kernel.bin iso/boot/kernel.bin
	grub-mkrescue -o boot.iso iso

run: boot.iso
	qemu-system-i386 -cdrom boot.iso

clean: 
	rm boot.iso

clean-all: clean
	$(MAKE) -w -C libc clean
	$(MAKE) -w -C kernel clean

