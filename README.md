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

The executable k3.elf is moved to /u/cs452/tftp/ARM/`whoami`, where `whoami` is the username of the user. Alternatively, the executable can also be found in  k3/src/ , the location of the source code.
On Redboot, the execution command is the following:

```
Redboot> load –b 0x00218000 –h 10.15.167.5  ARM/`whoami`/k3.elf
Redboot> go
```

Here, `whoami` is the username of the user.

