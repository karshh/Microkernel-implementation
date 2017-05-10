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

LDFLAGS = -init main -Map t3.map -N  -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../../lib

all:  t3.s t3.elf

t3.s: t3.c t3.h
	$(XCC) -S $(CFLAGS) t3.c

t3.o: t3.s
	$(AS) $(ASFLAGS) -o t3.o t3.s

t3.elf: t3.o
	$(LD) $(LDFLAGS) -o $@ t3.o -lbwio -lgcc

clean:
	-rm -f t3.elf *.s *.o t3.map
