#
# Makefile for busy-wait IO library
#
XCC     = gcc
AS	= as
AR	= ar
LD	= ld
CFLAGS  = -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float
# -g: include hooks for gdb
# -c: only compile
# -mcpu=arm920t: generate code for the 920t architecture
# -fpic: emit position-independent code
# -Wall: report all warnings
# -msoft-float: use software for floating point

ASFLAGS	= -mcpu=arm920t -mapcs-32
# -mapcs-32: always create a complete stack frame

ARFLAGS = rcs
LDFLAGS = -init main -Map m.map -N -T ../test/orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib

all: clean queue.o buffer.o #main.o main.elf install


buffer.s: buffer.c
	$(XCC) -S $(CFLAGS) buffer.c

buffer.o: buffer.s
	$(AS) $(ASFLAGS) -o buffer.o buffer.s

queue.s: queue.c
	$(XCC) -S $(CFLAGS) queue.c

queue.o: queue.s
	$(AS) $(ASFLAGS) -o queue.o queue.s


#main.s: main.c
#	$(XCC) -S $(CFLAGS) main.c

#main.o: main.s
#	$(AS) $(ASFLAGS) -o main.o main.s

#main.elf: main.o
#	$(LD) $(LDFLAGS) -o $@ buffer.o bwio.o port.o config.o karshio.o command.o time.o menu.o main.o -lgcc

#install: main.elf
#	cp main.elf /u/cs452/tftp/ARM/usharma/

clean:
	-rm -f *.s *.a *.o *.map
