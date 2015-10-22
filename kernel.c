#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include "fb.h"

void kernel_main() {

  terminal_initialize();

  terminal_writestring("Hello, World!\n");

}

