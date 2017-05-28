#
# Makefile for busy-wait IO library
#
XCC     = gcc -O2
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

all: clean bwio.o debugtime.o pkstring.o buffer.o td.o kernelHandler.o userRequestCall.o kernelRequestCall.o interruptHandler.o test.o k1.o k2.o test.elf k1.elf k2.elf install

# new file preable
#.s: .c
#	$(XCC) -S $(CFLAGS) .c
#.o: .s
#	$(AS) $(ASFLAGS) -o .o .s
debugtime.s: debugtime.c
	$(XCC) -S $(CFLAGS) debugtime.c

debugtime.o: debugtime.s
	$(AS) $(ASFLAGS) -o debugtime.o debugtime.s

kernelHandler.s: kernelHandler.c
	$(XCC) -S $(CFLAGS) kernelHandler.c

kernelHandler.o: kernelHandler.s
	$(AS) $(ASFLAGS) -o kernelHandler.o kernelHandler.s

pkstring.s: pkstring.c
	$(XCC) -S $(CFLAGS) pkstring.c
pkstring.o: pkstring.s
	$(AS) $(ASFLAGS) -o pkstring.o pkstring.s

td.s: td.c
	$(XCC) -S $(CFLAGS) td.c
td.o: td.s
	$(AS) $(ASFLAGS) -o td.o td.s

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

k1.s: k1.c
	$(XCC) -S $(CFLAGS) k1.c

k1.o: k1.s
	$(AS) $(ASFLAGS) -o k1.o k1.s

k2.s: k2.c
	$(XCC) -S $(CFLAGS) k2.c

k2.o: k2.s
	$(AS) $(ASFLAGS) -o k2.o k2.s

test.elf: test.o
	$(LD) $(LDFLAGS) -o $@ bwio.o debugtime.o pkstring.o buffer.o td.o kernelHandler.o userRequestCall.o kernelRequestCall.o interruptHandler.o test.o -lgcc

k1.elf: k1.o
	$(LD) $(LDFLAGS) -o $@ bwio.o debugtime.o pkstring.o buffer.o td.o kernelHandler.o userRequestCall.o kernelRequestCall.o interruptHandler.o k1.o -lgcc

k2.elf: k1.o
	$(LD) $(LDFLAGS) -o $@ bwio.o debugtime.o pkstring.o buffer.o td.o kernelHandler.o userRequestCall.o kernelRequestCall.o interruptHandler.o k2.o -lgcc


install: test.elf k1.elf
	cp test.elf /u/cs452/tftp/ARM/`whoami`/
	cp k1.elf /u/cs452/tftp/ARM/`whoami`/
	cp k2.elf /u/cs452/tftp/ARM/`whoami`/

clean:
	-rm -f *.s *.a *.o *.map *.elf
