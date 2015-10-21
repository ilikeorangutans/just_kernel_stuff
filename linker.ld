/* bootloader will look for this image and start executing at this symbol */
ENTRY(_start)

/* All the sections in the kernel image */
SECTIONS 
{
  /* load sections at 1MB? */
  . = 1M;

  /* Multiboot header! */
  .text BLOCK(4K) : ALIGN(4K)
  {
    *(.multiboot)
    *(.text)
  }

  .rodata BLOCK(4K) : ALIGN(4K)
  {
    *(.rodata)
  }

  .data BLOCK(4K) : ALIGN(4K)
  {
    *(.data)
  }

  .bss BLOCK(4K) : ALIGN(4K) 
  {
    *(COMMON)
    *(.bss)
    *(.bootstrap_stack)
  }
}
