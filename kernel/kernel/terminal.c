#include <kernel/terminal.h>
#include <kernel/vga.h>

size_t strlen(const char* str) {
	size_t ret = 0;
	while ( str[ret] != 0 )
		ret++;
	return ret;
}

size_t terminal_row;
size_t terminal_column;
uint8_t terminal_color;

void terminal_initialize() {
  terminal_clear();
}

void terminal_clear() {
	terminal_row = 0;
	terminal_column = 0;
	terminal_color = make_color(COLOR_LIGHT_GREY, COLOR_BLACK);
	for (size_t y = 0; y < VGA_HEIGHT; y++) {
		for (size_t x = 0; x < VGA_WIDTH; x++) {
			const size_t index = y * VGA_WIDTH + x;
			VGA_MEMORY[index] = make_vgaentry(' ', terminal_color);
		}
	}
}

void terminal_putentryat(char c, uint8_t color, size_t x, size_t y) {
	const size_t index = y * VGA_WIDTH + x;
	VGA_MEMORY[index] = make_vgaentry(c, color);
}

void terminal_putchar(char c) {
	terminal_putentryat(c, terminal_color, terminal_column, terminal_row);
	if (++terminal_column == VGA_WIDTH) {
		terminal_column = 0;
		if (++terminal_row == VGA_HEIGHT) {
			terminal_row = 0;
		}
	}
}

void terminal_writestring(const char* data) {
	size_t datalen = strlen(data);
	for (size_t i = 0; i < datalen; i++) {
    const char c = data[i];
    if (c != '\n') {
	  	terminal_putchar(data[i]);
    } else {
      terminal_row++;
      terminal_column = 0;
    }
  }
}

