# Assignment K2
____

| Submitters | ID |
| ------ | ------ |
| Paily Njarlangattil  | 20165196 |
| Utkarsh Sharma | 20467764 |

This section describes the operation of a program which demonstrates message passing amongst user task functions. 
After pulling the source code, or downloading the zip, the program will need to be compiled.
```
$ cd k2/src
$ make
rm -f *.s *.a *.o *.map *.elf
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float bwio.c
as -mcpu=arm920t -mapcs-32 -o bwio.o bwio.s
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float debugtime.c
as -mcpu=arm920t -mapcs-32 -o debugtime.o debugtime.s
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float pkstring.c
as -mcpu=arm920t -mapcs-32 -o pkstring.o pkstring.s
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float dictionary.c
as -mcpu=arm920t -mapcs-32 -o dictionary.o dictionary.s
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float buffer.c
as -mcpu=arm920t -mapcs-32 -o buffer.o buffer.s
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float td.c
as -mcpu=arm920t -mapcs-32 -o td.o td.s
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float kernelHandler.c
as -mcpu=arm920t -mapcs-32 -o kernelHandler.o kernelHandler.s
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float userRequestCall.c
as -mcpu=arm920t -mapcs-32 -o userRequestCall.o userRequestCall.s
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float kernelRequestCall.c
as -mcpu=arm920t -mapcs-32 -o kernelRequestCall.o kernelRequestCall.s
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float interruptHandler.c
as -mcpu=arm920t -mapcs-32 -o interruptHandler.o interruptHandler.s
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float server.c
as -mcpu=arm920t -mapcs-32 -o server.o server.s
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float test.c
as -mcpu=arm920t -mapcs-32 -o test.o test.s
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float k1.c
as -mcpu=arm920t -mapcs-32 -o k1.o k1.s
ld -init main -Map m.map -N -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib -o test.elf bwio.o debugtime.o pkstring.o dictionary.o buffer.o td.o kernelHandler.o userRequestCall.o kernelRequestCall.o interruptHandler.o server.o test.o -lgcc
ld -init main -Map m.map -N -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib -o k1.elf bwio.o debugtime.o pkstring.o dictionary.o buffer.o td.o kernelHandler.o userRequestCall.o kernelRequestCall.o interruptHandler.o server.o k1.o -lgcc
gcc -O2 -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float k2.c
k2.c: In function 'referee':
k2.c:161: warning: dereferencing type-punned pointer will break strict-aliasing rules
k2.c:166: warning: dereferencing type-punned pointer will break strict-aliasing rules
as -mcpu=arm920t -mapcs-32 -o k2.o k2.s
ld -init main -Map m.map -N -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib -o k2.elf bwio.o debugtime.o pkstring.o dictionary.o buffer.o td.o kernelHandler.o userRequestCall.o kernelRequestCall.o interruptHandler.o server.o k2.o -lgcc
cp test.elf /u/cs452/tftp/ARM/`whoami`/
cp k1.elf /u/cs452/tftp/ARM/`whoami`/
cp k2.elf /u/cs452/tftp/ARM/`whoami`/

```

The executable k2.elf is moved to /u/cs452/tftp/ARM/`whoami`, where `whoami` is the username of the user. Alternatively, the executable can also be found in  k2/src/ , the location of the source code.
On Redboot, the execution command is the following:

```
Redboot> load –b 0x00218000 –h 10.15.167.5  ARM/`whoami`/k2.elf
Redboot> go
```

Here, `whoami` is the username of the user.
