TARGET=i686-elf
CC=$(TARGET)-gcc
AS=$(TARGET)-as
AR=$(TARGET)-ar
CFLAGS=-Wall -std=c11 -O2 -Wextra -Iinclude
LIBK_CFLAGS=$(CFLAGS) -ffreestanding -fbuiltin

HEADERS=$(wildcard include/*.h)
OBJECTS:=\
stdio/printf.o\
stdio/putchar.o\
stdio/puts.o\
stdlib/abort.o\
string/memcmp.o\
string/memcpy.o\
string/memmove.o\
string/memset.o\
string/strlen.o\

LIBK_OBJS=$(OBJECTS:.o=.libk.o)

BINARIES=libk.a

.PHONY: all clean

all: $(BINARIES) $(HEADERS)

libk.a: $(LIBK_OBJS)
	$(AR) rcs $@ $(LIBK_OBJS)

%.libk.o: %.c
	$(CC) -c $< -o $@ $(LIBK_CFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm $(LIBK_OBJS) libk.a

