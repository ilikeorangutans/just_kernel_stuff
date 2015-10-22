#ifndef INCLUDE_FB_H
#define INCLUDE_FB_H

#include <stddef.h>
#include <stdint.h>

void terminal_initialize();

size_t strlen(const char* str);

void terminal_writestring(const char* data);

#endif

