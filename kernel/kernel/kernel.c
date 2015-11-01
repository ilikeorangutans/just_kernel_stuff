#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <kernel/terminal.h>

void kernel_init() {}

void kernel_main() {

  terminal_initialize();

  terminal_writestring("--< Kernel >--\n");

  for (int i = 0; i < 50; i++) {
    terminal_writestring("Hello, World!\n");
  }
}
