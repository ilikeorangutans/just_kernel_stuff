#ifndef INCLUDE_FB_H
#define INCLUDE_FB_H

#include <stddef.h>
#include <stdint.h>

void terminal_initialize();

void terminal_writestring(const char* data);

void terminal_clear();

#endif

