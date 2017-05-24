# Assignment K1
____

| Submitters | ID |
| ------ | ------ |
| Paily Njarlangattil  | 20165196 |
| Utkarsh Sharma | 20467764 |

This section describes the operation of a program which demonstrates user task functions through context switches. 
After pulling the source code, or downloading the zip, the program will need to be compiled. 
```
$ cd k1/src
$ make
mv interruptHandler.s interruptHandler.si
rm -f *.s *.a *.o *.map *.elf
mv interruptHandler.si interruptHandler.s
[565]% make
mv interruptHandler.s interruptHandler.si
rm -f *.s *.a *.o *.map *.elf
mv interruptHandler.si interruptHandler.s
gcc -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float bwio.c
as -mcpu=arm920t -mapcs-32 -o bwio.o bwio.s
gcc -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float buffer.c
as -mcpu=arm920t -mapcs-32 -o buffer.o buffer.s
gcc -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float queue.c
as -mcpu=arm920t -mapcs-32 -o queue.o queue.s
gcc -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float td.c
as -mcpu=arm920t -mapcs-32 -o td.o td.s
gcc -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float kernelHandler.c
as -mcpu=arm920t -mapcs-32 -o kernelHandler.o kernelHandler.s
gcc -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float userRequestCall.c
as -mcpu=arm920t -mapcs-32 -o userRequestCall.o userRequestCall.s
gcc -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float kernelRequestCall.c
as -mcpu=arm920t -mapcs-32 -o kernelRequestCall.o kernelRequestCall.s
as -mcpu=arm920t -mapcs-32 -o interruptHandler.o interruptHandler.s
gcc -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float test.c
as -mcpu=arm920t -mapcs-32 -o test.o test.s
gcc -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float k1.c
as -mcpu=arm920t -mapcs-32 -o k1.o k1.s
ld -init main -Map m.map -N -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib -o test.elf bwio.o buffer.o queue.o td.o kernelHandler.o userRequestCall.o kernelRequestCall.o interruptHandler.o test.o -lgcc
ld -init main -Map m.map -N -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib -o k1.elf bwio.o buffer.o queue.o td.o kernelHandler.o userRequestCall.o kernelRequestCall.o interruptHandler.o k1.o -lgcc
cp test.elf /u/cs452/tftp/ARM/`whoami`/
cp k1.elf /u/cs452/tftp/ARM/`whoami`/
```

The executable k1.elf is moved to /u/cs452/tftp/ARM/`whoami`, where `whoami` is the username of the user. Alternatively, the executable can also be found in  k1/src/ , the location of the source code.
On Redboot, the execution command is the following:

```
Redboot> load –b 0x00218000 –h 10.15.167.5  ARM/`whoami`/k1.elf
Redboot> go
```

Here, `whoami` is the username of the user.
