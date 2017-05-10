#
# Makefile for busy-wait IO tests
#
XCC     = gcc
AS	= as
LD      = ld
CFLAGS  = -c -fPIC -Wall -I. -I../../include -mcpu=arm920t -msoft-float
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs: always generate a complete stack frame

LDFLAGS = -init main -Map t2.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../../lib

all:  t2.s t2.elf

t2.s: t2.c t2.h
	$(XCC) -S $(CFLAGS) t2.c

t2.o: t2.s
	$(AS) $(ASFLAGS) -o t2.o t2.s

t2.elf: t2.o
	$(LD) $(LDFLAGS) -o $@ t2.o -lbwio -lgcc

clean:
	-rm -f t2.elf *.s *.o t2.map
