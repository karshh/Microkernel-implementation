#
# Makefile for busy-wait IO library
#
XCC     = gcc 
AS	= as
AR	= ar
LD	= ld
CFLAGS  = -I. -I../include
#CFLAGS  = -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float
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

SRC = buffer.o bwio.o
#bwio.o time.o icu.o pkstring.o dictionary.o buffer.o trackGraph.o td.o kernelHandler.o userRequestCall.o kernelRequestCall.o interruptHandler.o nameserver.o clockserver.o ioserver.o commandserver.o trainserver.o trackserver.o displayserver.o deathserver.o sensorserver.o usertasks.o controller.o ui.o


all: clean $(SRC) install
# new file preable
#.s: .c
#	$(XCC) -S $(CFLAGS) .c
#.o: .s
#	$(AS) $(ASFLAGS) -o .o .s

trackGraph.s: trackGraph.c
	$(XCC) -S $(CFLAGS) trackGraph.c
trackGraph.o: trackGraph.s
	$(AS) $(ASFLAGS) -o trackGraph.o trackGraph.s

buffer.o: buffer.c
	$(XCC) -S $(CFLAGS) -o buffer.o buffer.c
bwio.o: bwio.c
	$(XCC) -S $(CFLAGS) -o bwio.o bwio.c
main.o: main.c
	$(XCC) -S $(CFLAGS) -o main.o main.c
install: main.c bwio.c 
	$(XCC) main.c bwio.c buffer.c trackGraph.c $(CFLAGS) 
clean:
	-rm -f *.s *.a *.o *.map *.elf









