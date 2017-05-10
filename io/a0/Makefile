#
# Makefile for busy-wait IO tests
#
XCC     = gcc
AS	= as
LD      = ld
CFLAGS  = -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs: always generate a complete stack frame

LDFLAGS = -init main -Map a01.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib

all:  a01.s a01.elf

a01.s: a01.c a01.h
	$(XCC) -S $(CFLAGS) a01.c

a01.o: a01.s
	$(AS) $(ASFLAGS) -o a01.o a01.s

a01.elf: a01.o
	$(LD) $(LDFLAGS) -o $@ a01.o -lbwio -lgcc

clean:
	-rm -f a01.elf *.s *.o a01.map
