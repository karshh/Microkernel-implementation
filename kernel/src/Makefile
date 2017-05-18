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
LDFLAGS = -init main -Map m.map -N -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib

all: clean bwio.o buffer.o queue.o userRequestCall.o kernelRequestCall.o interruptHandler.o test.o test.elf install

interruptHandler.s: interruptHandler.c
	$(XCC) -S $(CFLAGS) interruptHandler.c

interruptHandler.o: interruptHandler.s
	$(AS) $(ASFLAGS) -o interruptHandler.o interruptHandler.s

buffer.s: buffer.c
	$(XCC) -S $(CFLAGS) buffer.c

buffer.o: buffer.s
	$(AS) $(ASFLAGS) -o buffer.o buffer.s

userRequestCall.s: userRequestCall.c
	$(XCC) -S $(CFLAGS) userRequestCall.c

userRequestCall.o: userRequestCall.s
	$(AS) $(ASFLAGS) -o userRequestCall.o userRequestCall.s


kernelRequestCall.s: kernelRequestCall.c
	$(XCC) -S $(CFLAGS) kernelRequestCall.c

kernelRequestCall.o: kernelRequestCall.s
	$(AS) $(ASFLAGS) -o kernelRequestCall.o kernelRequestCall.s

queue.s: queue.c
	$(XCC) -S $(CFLAGS) queue.c

queue.o: queue.s
	$(AS) $(ASFLAGS) -o queue.o queue.s


bwio.s: bwio.c
	$(XCC) -S $(CFLAGS) bwio.c

bwio.o: bwio.s
	$(AS) $(ASFLAGS) -o bwio.o bwio.s

test.s: test.c
	$(XCC) -S $(CFLAGS) test.c

test.o: test.s
	$(AS) $(ASFLAGS) -o test.o test.s

test.elf: test.o
	$(LD) $(LDFLAGS) -o $@ bwio.o buffer.o queue.o userRequestCall.o kernelRequestCall.o interruptHandler.o test.o -lgcc

install: test.elf
	cp test.elf /u/cs452/tftp/ARM/`whoami`/

clean:
	-rm -f *.a *.o *.map *.elf
