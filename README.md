# Assignment K1
____

| Submitters | ID |
| ------ | ------ |
| Utkarsh Sharma | 20165196 |
| Paily Njarlangattil  | 20467764 |

This section describes the operation of a program which demonstrates user task functions through context switches. 
After pulling the source code, or downloading the zip, the program will need to be compiled. 
```
$ cd k1/src
$ make
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
gcc -S -c -fPIC -Wall -I. -I../include -mcpu=arm920t -msoft-float main.c
as -mcpu=arm920t -mapcs-32 -o main.o main.s
ld -init main -Map m.map -N -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib -o test.elf bwio.o buffer.o queue.o td.o kernelHandler.o userRequestCall.o kernelRequestCall.o interruptHandler.o test.o -lgcc
ld -init main -Map m.map -N -T orex.ld -L/u/wbcowan/gnuarm-4.0.2/lib/gcc/arm-elf/4.0.2 -L../lib -o main.elf bwio.o buffer.o queue.o td.o kernelHandler.o userRequestCall.o kernelRequestCall.o interruptHandler.o main.o -lgcc
cp test.elf /u/cs452/tftp/ARM/`whoami`/
cp main.elf /u/cs452/tftp/ARM/`whoami`/
```

The executable main.elf is moved to /u/cs452/tftp/ARM/`whoami`, where `whoami` is the username of the user. Alternatively, the executable can also be found in  k1/src/ , the location of the source code.
On Redboot, the execution command is the following:

```
Redboot> load –b 0x00218000 –h 10.15.167.5  ARM/`whoami`/main.elf
Redboot> go
```

Here, `whoami` is the username of the user.
