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

SRC = bwio.o time.o icu.o pkstring.o dictionary.o buffer.o trackGraph.o td.o kernelHandler.o userRequestCall.o kernelRequestCall.o interruptHandler.o server.o controller.o ui.o


all: clean $(SRC) install

# new file preable
#.s: .c
#	$(XCC) -S $(CFLAGS) .c
#.o: .s
#	$(AS) $(ASFLAGS) -o .o .s
controller.s: controller.c
	$(XCC) -S $(CFLAGS) controller.c
controller.o: controller.s
	$(AS) $(ASFLAGS) -o controller.o controller.s

trackGraph.s: trackGraph.c
	$(XCC) -S $(CFLAGS) trackGraph.c
trackGraph.o: trackGraph.s
	$(AS) $(ASFLAGS) -o trackGraph.o trackGraph.s

ui.s: ui.c
	$(XCC) -S $(CFLAGS) ui.c

ui.o: ui.s
	$(AS) $(ASFLAGS) -o ui.o ui.s

icu.s: icu.c
	$(XCC) -S $(CFLAGS) icu.c

icu.o: icu.s
	$(AS) $(ASFLAGS) -o icu.o icu.s

time.s: time.c
	$(XCC) -S $(CFLAGS) time.c

time.o: time.s
	$(AS) $(ASFLAGS) -o time.o time.s

kernelHandler.s: kernelHandler.c
	$(XCC) -S $(CFLAGS) kernelHandler.c

kernelHandler.o: kernelHandler.s
	$(AS) $(ASFLAGS) -o kernelHandler.o kernelHandler.s

pkstring.s: pkstring.c
	$(XCC) -S $(CFLAGS) pkstring.c
pkstring.o: pkstring.s
	$(AS) $(ASFLAGS) -o pkstring.o pkstring.s

dictionary.s: dictionary.c
	$(XCC) -S $(CFLAGS) dictionary.c
dictionary.o: dictionary.s
	$(AS) $(ASFLAGS) -o dictionary.o dictionary.s


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

server.s: server.c
	$(XCC) -S $(CFLAGS) server.c
server.o: server.s
	$(AS) $(ASFLAGS) -o server.o server.s


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

k3.s: k3.c
	$(XCC) -S $(CFLAGS) k3.c

k3.o: k3.s
	$(AS) $(ASFLAGS) -o k3.o k3.s

k4.s: k4.c
	$(XCC) -S $(CFLAGS) k4.c

k4.o: k4.s
	$(AS) $(ASFLAGS) -o k4.o k4.s

trackA.s: trackA.c
	$(XCC) -S $(CFLAGS) trackA.c

trackA.o: trackA.s
	$(AS) $(ASFLAGS) -o trackA.o trackA.s

trackB.s: trackB.c
	$(XCC) -S $(CFLAGS) trackB.c

trackB.o: trackB.s
	$(AS) $(ASFLAGS) -o trackB.o trackB.s

test.elf:test.o
	$(LD) $(LDFLAGS) -o $@ $(SRC) test.o -lgcc

k1.elf: k1.o
	$(LD) $(LDFLAGS) -o $@ $(SRC) k1.o -lgcc

k2.elf: k2.o
	$(LD) $(LDFLAGS) -o $@ $(SRC) k2.o -lgcc

k3.elf: k3.o
	$(LD) $(LDFLAGS) -o $@ $(SRC) k3.o -lgcc

k4.elf: k4.o
	$(LD) $(LDFLAGS) -o $@ $(SRC) k4.o -lgcc

trackA.elf: trackA.o
	$(LD) $(LDFLAGS) -o $@ $(SRC) trackA.o -lgcc

trackB.elf: trackB.o
	$(LD) $(LDFLAGS) -o $@ $(SRC) trackB.o -lgcc


install: test.elf trackA.elf trackB.elf
	cp test.elf /u/cs452/tftp/ARM/`whoami`/
	cp trackA.elf /u/cs452/tftp/ARM/`whoami`/
	cp trackB.elf /u/cs452/tftp/ARM/`whoami`/

clean:
	-rm -f *.s *.a *.o *.map *.elf









