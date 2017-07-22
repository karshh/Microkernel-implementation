	.file	"test.c"
	.text
	.align	2
	.global	markedOutSensor
	.type	markedOutSensor, %function
markedOutSensor:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	@ lr needed for prologue
	bx	lr
	.size	markedOutSensor, .-markedOutSensor
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"E07\000"
	.align	2
.LC1:
	.ascii	"D07\000"
	.align	2
.LC2:
	.ascii	"E11\000"
	.align	2
.LC3:
	.ascii	"D10\000"
	.align	2
.LC4:
	.ascii	"A04\000"
	.align	2
.LC5:
	.ascii	"B16\000"
	.align	2
.LC6:
	.ascii	"E16\000"
	.align	2
.LC7:
	.ascii	"E01\000"
	.align	2
.LC8:
	.ascii	"C13\000"
	.align	2
.LC9:
	.ascii	"has path[%s] to [%s]: %d\012\015\000"
	.text
	.align	2
	.global	testTrackPathRevAndEX
	.type	testTrackPathRevAndEX, %function
testTrackPathRevAndEX:
	@ args = 0, pretend = 0, frame = 7212
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #7168
	sub	sp, sp, #56
	add	r5, sp, #56
	ldr	sl, .L6
	sub	r5, r5, #44
.L5:
	add	sl, pc, sl
	mov	r0, r5
	bl	TrackGraphInitA(PLT)
	ldr	r0, .L6+4
	add	r3, sp, #4096
	mov	r8, #0
	str	r8, [r3, #3124]
	add	r0, sl, r0
	bl	sensor2i(PLT)
	add	r3, sp, #4096
	str	r0, [r3, #3048]
	ldr	r3, .L6+8
	add	r6, sl, r3
	mov	r0, r6
	bl	sensor2i(PLT)
	add	r3, sp, #4096
	str	r0, [r3, #3044]
	ldr	r0, .L6+12
	add	r0, sl, r0
	bl	sensor2i(PLT)
	add	r3, sp, #4096
	str	r0, [r3, #3056]
	ldr	r0, .L6+16
	add	r0, sl, r0
	bl	sensor2i(PLT)
	add	r3, sp, #4096
	str	r0, [r3, #3052]
	ldr	r0, .L6+20
	add	r0, sl, r0
	bl	sensor2i(PLT)
	add	r3, sp, #4096
	str	r0, [r3, #3064]
	ldr	r0, .L6+24
	add	r0, sl, r0
	bl	sensor2i(PLT)
	add	r3, sp, #4096
	str	r0, [r3, #3060]
	ldr	r0, .L6+28
	add	r0, sl, r0
	bl	sensor2i(PLT)
	add	r3, sp, #4096
	str	r0, [r3, #3072]
	ldr	r0, .L6+32
	add	r0, sl, r0
	bl	sensor2i(PLT)
	add	r3, sp, #4096
	str	r0, [r3, #3068]
	ldr	r3, .L6+36
	add	r7, sl, r3
	mov	r0, r7
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, r6
	bl	sensor2i(PLT)
	add	r3, sp, #6528
	add	ip, sp, #7168
	add	lr, sp, #7104
	add	ip, ip, #52
	add	lr, lr, #36
	mov	r2, r0
	mov	r1, r4
	mov	r0, r5
	add	r3, r3, #12
	stmia	sp, {ip, lr}	@ phole stm
	str	r8, [sp, #8]
	bl	getShortestPathPlus(PLT)
	ldr	r1, .L6+40
	str	r0, [sp, #0]
	add	r1, sl, r1
	mov	r2, r7
	mov	r3, r6
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #56
	add	sp, sp, #7168
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.size	testTrackPathRevAndEX, .-testTrackPathRevAndEX
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"\033[10;45H       +___ O______O_+_______________+__"
	.ascii	"_____+\012\000"
	.align	2
.LC11:
	.ascii	"\033[11;45H           /      /                     "
	.ascii	"      \\\012\000"
	.align	2
.LC12:
	.ascii	"\033[12;45H     +___ O      O___+_____O_+___+_O___+"
	.ascii	"___+___O\012\000"
	.align	2
.LC13:
	.ascii	"\033[13;45H         /      /           +     +     "
	.ascii	"       |\012\000"
	.align	2
.LC14:
	.ascii	"\033[14;45H        +      +             + | +      "
	.ascii	"       |\012\000"
	.align	2
.LC15:
	.ascii	"\033[15;45H        |      |              O|O       "
	.ascii	"       | \012\000"
	.align	2
.LC16:
	.ascii	"\033[16;45H        |      |               |        "
	.ascii	"       | \012\000"
	.align	2
.LC17:
	.ascii	"\033[17;45H        |      |              O|O       "
	.ascii	"       | \012\000"
	.align	2
.LC18:
	.ascii	"\033[18;45H        +      +             + | +      "
	.ascii	"       |\012\000"
	.align	2
.LC19:
	.ascii	"\033[19;45H         \\      \\           +     +   "
	.ascii	"         |\012\000"
	.align	2
.LC20:
	.ascii	"\033[20;45H +___+___ O      O___+_____O_+___+_O___+"
	.ascii	"___+___O\012\000"
	.align	2
.LC21:
	.ascii	"\033[21;45H           \\      \\                   "
	.ascii	"        /\012\000"
	.align	2
.LC22:
	.ascii	"\033[22;45H    +___+___O      +___O_____+___+_____O"
	.ascii	"_____+\012\000"
	.align	2
.LC23:
	.ascii	"\033[23;45H             \\          \\             "
	.ascii	"/\012\000"
	.align	2
.LC24:
	.ascii	"\033[24;45H      +___+___O______+___O___________O__"
	.ascii	"_+         \012\000"
	.text
	.align	2
	.global	drawTrack
	.type	drawTrack, %function
drawTrack:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L11
	ldr	r2, .L11+4
.L10:
	add	sl, pc, sl
	add	r2, sl, r2
	mov	r1, #1
	mov	r4, r0
	bl	Printf(PLT)
	ldr	r2, .L11+8
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L11+12
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L11+16
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L11+20
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L11+24
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L11+28
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L11+32
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L11+36
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L11+40
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L11+44
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L11+48
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L11+52
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L11+56
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L11+60
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	ldmfd	sp!, {r4, sl, lr}
	b	Printf(PLT)
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC24(GOTOFF)
	.size	drawTrack, .-drawTrack
	.section	.rodata.str1.4
	.align	2
.LC25:
	.ascii	"USER TASK 3 EXIT, REQUESTING TID.\015\012\000"
	.align	2
.LC26:
	.ascii	"USER TASK 3 GOT TID = %d.\015\012\000"
	.align	2
.LC27:
	.ascii	"USER TASK 3 EXIT, REQUESTING to get off the train.\015"
	.ascii	"\012\000"
	.text
	.align	2
	.global	userTask3
	.type	userTask3, %function
userTask3:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L16
	ldr	r1, .L16+4
.L15:
	add	sl, pc, sl
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	ldr	r1, .L16+8
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L16+12
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L17:
	.align	2
.L16:
	.word	_GLOBAL_OFFSET_TABLE_-(.L15+8)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.size	userTask3, .-userTask3
	.section	.rodata.str1.4
	.align	2
.LC28:
	.ascii	"USER TASK 2 MIDDLE \015\012\000"
	.align	2
.LC29:
	.ascii	"USER TASK 2 EXIT, REQUESTING TID.\015\012\000"
	.align	2
.LC30:
	.ascii	"USER TASK 2 GOT TID = %d.\015\012\000"
	.align	2
.LC31:
	.ascii	"USER TASK 2 EXIT, REQUESTING Parent TID.\015\012\000"
	.align	2
.LC32:
	.ascii	"USER TASK 2 GOT Parent TID = %d.\015\012\000"
	.align	2
.LC33:
	.ascii	"USER TASK 2 EXIT, REQUESTING to Pass the train.\015"
	.ascii	"\012\000"
	.align	2
.LC34:
	.ascii	"USER TASK has had a nap but is awake  \015\012\000"
	.align	2
.LC35:
	.ascii	"USER TASK 2 EXIT, REQUESTING to birth a child.\015\012"
	.ascii	"\000"
	.align	2
.LC36:
	.ascii	"USER TASK 2' child never born. no father: %d.\015\012"
	.ascii	"\000"
	.align	2
.LC37:
	.ascii	"world is overpopulated. train gods refuse Task's 2 "
	.ascii	"offer: %d.\015\012\000"
	.align	2
.LC38:
	.ascii	"USER TASK 2 gave birth to a bouncing baby task name"
	.ascii	"d: %d.\015\012\000"
	.align	2
.LC39:
	.ascii	"USER TASK 2's fucked up when fucking: %d.\015\012\000"
	.align	2
.LC40:
	.ascii	"USER TASK 2 EXIT, REQUESTING to get off the train.\015"
	.ascii	"\012\000"
	.align	2
.LC41:
	.ascii	"USER TASK 2fucked up. Train don't stop here  \015\012"
	.ascii	"\000"
	.text
	.align	2
	.global	userTask2
	.type	userTask2, %function
userTask2:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L35
	ldr	r1, .L35+4
.L31:
	add	sl, pc, sl
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r1, .L35+8
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	ldr	r1, .L35+12
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L35+16
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	ldr	r1, .L35+20
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L35+24
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L35+28
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r6, .L35+32
	ldr	r5, .L35+36
	mov	r4, #2
.L19:
	add	r1, sl, r6
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, [sl, r5]
	mov	r0, #3
	bl	Create(PLT)
	ldr	r1, .L35+40
	mov	r3, r0
	cmn	r3, #1
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	beq	.L32
	ldr	r1, .L35+44
	cmn	r3, #2
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	beq	.L32
	ldr	r1, .L35+48
	cmp	r3, #0
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	blt	.L34
.L32:
	bl	bwprintf(PLT)
	subs	r4, r4, #1
	bne	.L19
	ldr	r1, .L35+52
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	ldr	r1, .L35+56
	mov	r0, #1
	add	r1, sl, r1
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	bwprintf(PLT)
.L34:
	ldr	r1, .L35+60
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	b	.L32
.L36:
	.align	2
.L35:
	.word	_GLOBAL_OFFSET_TABLE_-(.L31+8)
	.word	.LC28(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	.LC35(GOTOFF)
	.word	userTask3(GOT)
	.word	.LC36(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	.LC38(GOTOFF)
	.word	.LC40(GOTOFF)
	.word	.LC41(GOTOFF)
	.word	.LC39(GOTOFF)
	.size	userTask2, .-userTask2
	.section	.rodata.str1.4
	.align	2
.LC42:
	.ascii	"USER TASK 1 MIDDLE \015\012\000"
	.align	2
.LC43:
	.ascii	"USER TASK 1 EXIT, REQUESTING TID.\015\012\000"
	.align	2
.LC44:
	.ascii	"USER TASK 1 GOT TID = %d.\015\012\000"
	.align	2
.LC45:
	.ascii	"USER TASK 1 EXIT, REQUESTING Parent TID.\015\012\000"
	.align	2
.LC46:
	.ascii	"USER TASK 1 GOT Parent TID = %d.\015\012\000"
	.align	2
.LC47:
	.ascii	"USER TASK 1 EXIT, REQUESTING to Pass the train.\015"
	.ascii	"\012\000"
	.align	2
.LC48:
	.ascii	"USER TASK 1 EXIT, REQUESTING to birth a child.\015\012"
	.ascii	"\000"
	.align	2
.LC49:
	.ascii	"USER TASK 1' child never born. no father: %d.\015\012"
	.ascii	"\000"
	.align	2
.LC50:
	.ascii	"world is overpopulated. train gods refuse Task's 1o"
	.ascii	"ffer: %d.\015\012\000"
	.align	2
.LC51:
	.ascii	"USER TASK 1gave birth to a bouncing baby task named"
	.ascii	": %d.\015\012\000"
	.align	2
.LC52:
	.ascii	"USER TASK 1's fucked up when fucking: %d.\015\012\000"
	.align	2
.LC53:
	.ascii	"USER TASK 1 EXIT, REQUESTING to get off the train.\015"
	.ascii	"\012\000"
	.align	2
.LC54:
	.ascii	"USER TASK 1fucked up. Train don't stop here  \015\012"
	.ascii	"\000"
	.text
	.align	2
	.global	userTask1
	.type	userTask1, %function
userTask1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L53
	ldr	r1, .L53+4
.L50:
	add	sl, pc, sl
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r1, .L53+8
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	ldr	r1, .L53+12
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L53+16
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	ldr	r1, .L53+20
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L53+24
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L53+28
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r6, .L53+32
	ldr	r5, .L53+36
	mov	r4, #0
	b	.L38
.L51:
	bl	bwprintf(PLT)
	cmp	r4, #150
	beq	.L52
.L38:
	add	r1, sl, r6
	mov	r0, #1
	add	r4, r4, #1
	bl	bwprintf(PLT)
	ldr	r1, [sl, r5]
	mov	r0, r4
	bl	Create(PLT)
	ldr	r1, .L53+40
	mov	r3, r0
	cmn	r3, #1
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	beq	.L51
	ldr	r1, .L53+44
	cmn	r3, #2
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	beq	.L51
	ldr	r1, .L53+48
	cmp	r3, #0
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	bge	.L51
	ldr	r1, .L53+52
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	cmp	r4, #150
	bne	.L38
.L52:
	ldr	r1, .L53+56
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	ldr	r1, .L53+60
	mov	r0, #1
	add	r1, sl, r1
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	bwprintf(PLT)
.L54:
	.align	2
.L53:
	.word	_GLOBAL_OFFSET_TABLE_-(.L50+8)
	.word	.LC42(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	.LC45(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	.LC48(GOTOFF)
	.word	userTask3(GOT)
	.word	.LC49(GOTOFF)
	.word	.LC50(GOTOFF)
	.word	.LC51(GOTOFF)
	.word	.LC52(GOTOFF)
	.word	.LC53(GOTOFF)
	.word	.LC54(GOTOFF)
	.size	userTask1, .-userTask1
	.section	.rodata.str1.4
	.align	2
.LC55:
	.ascii	"<%d>: Sending a message to %d: %s.\015\012\000"
	.align	2
.LC56:
	.ascii	"Hi!\000"
	.align	2
.LC57:
	.ascii	"<%d>: Send-recieve-reply transaction failed.\015\012"
	.ascii	"\000"
	.align	2
.LC58:
	.ascii	"<%d>: Invalid Task %d.\015\012\000"
	.align	2
.LC59:
	.ascii	"<%d>: Got the following reply: %s[%d].\015\012\000"
	.text
	.align	2
	.global	userTask61
	.type	userTask61, %function
userTask61:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L65
	sub	sp, sp, #12
.L62:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L65+4
	ldr	r1, .L65+8
	add	r4, sl, r3
	mov	r2, r0
	mov	r5, r0
	add	r1, sl, r1
	mov	r0, #1
	mov	r3, #2
	add	r6, sp, #5
	str	r4, [sp, #0]
	bl	bwprintf(PLT)
	mov	ip, #7
	mov	r1, r4
	mov	r2, #4
	mov	r3, r6
	mov	r0, #2
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r1, .L65+12
	mov	ip, r0
	cmn	ip, #3
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, #1
	beq	.L63
	ldr	r1, .L65+16
	cmn	ip, #2
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, #1
	mov	r3, #2
	beq	.L64
	ldr	r1, .L65+20
	mov	r2, r5
	add	r1, sl, r1
	mov	r3, r6
	mov	r0, #1
	str	ip, [sp, #0]
	bl	bwprintf(PLT)
.L58:
	bl	Exit(PLT)
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L64:
	bl	bwprintf(PLT)
	b	.L58
.L63:
	bl	bwprintf(PLT)
	b	.L58
.L66:
	.align	2
.L65:
	.word	_GLOBAL_OFFSET_TABLE_-(.L62+8)
	.word	.LC56(GOTOFF)
	.word	.LC55(GOTOFF)
	.word	.LC57(GOTOFF)
	.word	.LC58(GOTOFF)
	.word	.LC59(GOTOFF)
	.size	userTask61, .-userTask61
	.section	.rodata.str1.4
	.align	2
.LC60:
	.ascii	"<%d>: Requesting a message.\015\012\000"
	.align	2
.LC61:
	.ascii	"<%d>: Got the following message from %d: %s.\015\012"
	.ascii	"\000"
	.align	2
.LC62:
	.ascii	"<%d>: Replying the following: %s.\015\012\000"
	.align	2
.LC63:
	.ascii	"Bye!\000"
	.align	2
.LC64:
	.ascii	"<%d>: Exitting now.\015\012\000"
	.text
	.align	2
	.global	userTask62
	.type	userTask62, %function
userTask62:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L70
	sub	sp, sp, #16
.L69:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L70+4
	mov	r5, r0
	add	r1, sl, r1
	mov	r2, r5
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r4, sp, #7
	add	r0, sp, #16
	mov	r3, #0
	mov	r1, r4
	str	r3, [r0, #-4]!
	mov	r2, #5
	bl	Receive(PLT)
	ldr	r1, .L70+8
	ldr	r3, [sp, #12]
	add	r1, sl, r1
	mov	r2, r5
	mov	r0, #1
	str	r4, [sp, #0]
	bl	bwprintf(PLT)
	ldr	r3, .L70+12
	ldr	r1, .L70+16
	add	r4, sl, r3
	mov	r3, r4
	add	r1, sl, r1
	mov	r2, r5
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r1, r4
	mov	r2, #5
	ldr	r0, [sp, #12]
	bl	Reply(PLT)
	ldr	r1, .L70+20
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, sl, pc}
.L71:
	.align	2
.L70:
	.word	_GLOBAL_OFFSET_TABLE_-(.L69+8)
	.word	.LC60(GOTOFF)
	.word	.LC61(GOTOFF)
	.word	.LC63(GOTOFF)
	.word	.LC62(GOTOFF)
	.word	.LC64(GOTOFF)
	.size	userTask62, .-userTask62
	.section	.rodata.str1.4
	.align	2
.LC65:
	.ascii	"<%d>: Creating 2 children. \015\012\000"
	.align	2
.LC66:
	.ascii	"<%d>: Created %d. \015\012\000"
	.text
	.align	2
	.global	userTask60
	.type	userTask60, %function
userTask60:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L75
.L74:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L75+4
	mov	r4, r0
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L75+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L75+12
	mov	r3, r0
	add	r5, sl, r2
	mov	r1, r5
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L75+16
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mov	r1, r5
	mov	r3, r0
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, r5, sl, lr}
	b	Exit(PLT)
.L76:
	.align	2
.L75:
	.word	_GLOBAL_OFFSET_TABLE_-(.L74+8)
	.word	.LC65(GOTOFF)
	.word	userTask61(GOT)
	.word	.LC66(GOTOFF)
	.word	userTask62(GOT)
	.size	userTask60, .-userTask60
	.section	.rodata.str1.4
	.align	2
.LC67:
	.ascii	"<%d> got tid, now passing passing \012\015\000"
	.align	2
.LC68:
	.ascii	"<%d> finished passing Going to register name as TAS"
	.ascii	"K1 \012\015\000"
	.align	2
.LC69:
	.ascii	"TASK1\000"
	.align	2
.LC70:
	.ascii	"<%d> returned for register command. result:%d  \012"
	.ascii	"\015\000"
	.align	2
.LC71:
	.ascii	"<%d> searching for THE MAN \012\015\000"
	.align	2
.LC72:
	.ascii	"THE MAN\000"
	.align	2
.LC73:
	.ascii	"<%d>searched for THE MAN:%d \012\015\000"
	.align	2
.LC74:
	.ascii	"<%d> searching for TASK2 \012\015\000"
	.align	2
.LC75:
	.ascii	"TASK2\000"
	.align	2
.LC76:
	.ascii	"<%d>searched for TASK2:%d \012\015\000"
	.align	2
.LC77:
	.ascii	"<%d> exiting  \012\015\000"
	.text
	.align	2
	.global	userTaskClient
	.type	userTaskClient, %function
userTaskClient:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L80
.L79:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L80+4
	mov	r4, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L80+8
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L80+12
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r1, .L80+16
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L80+20
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L80+24
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L80+28
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L80+32
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L80+36
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L80+40
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L80+44
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, sl, lr}
	b	Exit(PLT)
.L81:
	.align	2
.L80:
	.word	_GLOBAL_OFFSET_TABLE_-(.L79+8)
	.word	.LC67(GOTOFF)
	.word	.LC68(GOTOFF)
	.word	.LC69(GOTOFF)
	.word	.LC70(GOTOFF)
	.word	.LC71(GOTOFF)
	.word	.LC72(GOTOFF)
	.word	.LC73(GOTOFF)
	.word	.LC74(GOTOFF)
	.word	.LC75(GOTOFF)
	.word	.LC76(GOTOFF)
	.word	.LC77(GOTOFF)
	.size	userTaskClient, .-userTaskClient
	.section	.rodata.str1.4
	.align	2
.LC78:
	.ascii	"<%d> got tid, now passing \012\015\000"
	.align	2
.LC79:
	.ascii	"<%d> finished passing Going to register name as TAS"
	.ascii	"K2 \012\015\000"
	.align	2
.LC80:
	.ascii	"<%d> returned for register command. result: %d \012"
	.ascii	"\015\000"
	.align	2
.LC81:
	.ascii	"<%d> searching for TASK3 \012\015\000"
	.align	2
.LC82:
	.ascii	"TASK3\000"
	.align	2
.LC83:
	.ascii	"<%d>searched for TASK3:%d \012\015\000"
	.text
	.align	2
	.global	userTaskClient1
	.type	userTaskClient1, %function
userTaskClient1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L85
.L84:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L85+4
	mov	r4, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L85+8
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L85+12
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r1, .L85+16
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L85+20
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L85+24
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L85+28
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L85+32
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L85+36
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L85+40
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L85+44
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, sl, lr}
	b	Exit(PLT)
.L86:
	.align	2
.L85:
	.word	_GLOBAL_OFFSET_TABLE_-(.L84+8)
	.word	.LC78(GOTOFF)
	.word	.LC79(GOTOFF)
	.word	.LC75(GOTOFF)
	.word	.LC80(GOTOFF)
	.word	.LC71(GOTOFF)
	.word	.LC72(GOTOFF)
	.word	.LC73(GOTOFF)
	.word	.LC81(GOTOFF)
	.word	.LC82(GOTOFF)
	.word	.LC83(GOTOFF)
	.word	.LC77(GOTOFF)
	.size	userTaskClient1, .-userTaskClient1
	.section	.rodata.str1.4
	.align	2
.LC84:
	.ascii	"<%d> finished passing Going to register name as TAS"
	.ascii	"K3 \012\015\000"
	.align	2
.LC85:
	.ascii	"<%d> searching for TASK1 \012\015\000"
	.align	2
.LC86:
	.ascii	"<%d>searched for TASK1:%d \012\015\000"
	.text
	.align	2
	.global	userTaskClient2
	.type	userTaskClient2, %function
userTaskClient2:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L90
.L89:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L90+4
	mov	r4, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L90+8
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L90+12
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r1, .L90+16
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L90+20
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L90+24
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L90+28
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L90+32
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L90+36
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L90+40
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L90+44
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, sl, lr}
	b	Exit(PLT)
.L91:
	.align	2
.L90:
	.word	_GLOBAL_OFFSET_TABLE_-(.L89+8)
	.word	.LC78(GOTOFF)
	.word	.LC84(GOTOFF)
	.word	.LC82(GOTOFF)
	.word	.LC80(GOTOFF)
	.word	.LC71(GOTOFF)
	.word	.LC72(GOTOFF)
	.word	.LC73(GOTOFF)
	.word	.LC85(GOTOFF)
	.word	.LC69(GOTOFF)
	.word	.LC86(GOTOFF)
	.word	.LC77(GOTOFF)
	.size	userTaskClient2, .-userTaskClient2
	.section	.rodata.str1.4
	.align	2
.LC87:
	.ascii	"<%d>: Creating name server 1:%d. \015\012\000"
	.align	2
.LC88:
	.ascii	"<%d>: Creating child process that will request name"
	.ascii	" server <%d>. \015\012\000"
	.text
	.align	2
	.global	userTask01
	.type	userTask01, %function
userTask01:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L95
.L94:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L95+4
	mov	r5, r0
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	CreateNameServer(PLT)
	ldr	r1, .L95+8
	mov	r2, r5
	mov	r3, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L95+12
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L95+16
	mov	r3, r0
	add	r4, sl, r2
	mov	r1, r4
	mov	r2, r5
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L95+20
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mov	r2, r5
	mov	r3, r0
	mov	r1, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L95+24
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mov	r1, r4
	mov	r3, r0
	mov	r2, r5
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, r5, sl, lr}
	b	Exit(PLT)
.L96:
	.align	2
.L95:
	.word	_GLOBAL_OFFSET_TABLE_-(.L94+8)
	.word	NameServerTask(GOT)
	.word	.LC87(GOTOFF)
	.word	userTaskClient(GOT)
	.word	.LC88(GOTOFF)
	.word	userTaskClient1(GOT)
	.word	userTaskClient2(GOT)
	.size	userTask01, .-userTask01
	.section	.rodata.str1.4
	.align	2
.LC89:
	.ascii	"BOOK\000"
	.align	2
.LC90:
	.ascii	"Seaching empty dictionary for [BOOK]  %d.\015\012\000"
	.align	2
.LC91:
	.ascii	"Search results %d.\015\012\000"
	.align	2
.LC92:
	.ascii	"ADDING  [BOOK] for tid 1 %d.\015\012\000"
	.align	2
.LC93:
	.ascii	"BOOK1\000"
	.align	2
.LC94:
	.ascii	"ADDING  [BOOK1] for tid 1 %d.\015\012\000"
	.align	2
.LC95:
	.ascii	"BOOKW\000"
	.align	2
.LC96:
	.ascii	"ADDING  [BOOKW] for tid 1 %d.\015\012\000"
	.align	2
.LC97:
	.ascii	"BOOK2\000"
	.align	2
.LC98:
	.ascii	"ADDING  [BOOK2] for tid 2 %d.\015\012\000"
	.align	2
.LC99:
	.ascii	"Seaching dictionary for [BOOK1]  %d.\015\012\000"
	.align	2
.LC100:
	.ascii	"Seaching dictionary for [BOOKW]  %d.\015\012\000"
	.align	2
.LC101:
	.ascii	"Seaching dictionary for [BOOK2]  %d.\015\012\000"
	.align	2
.LC102:
	.ascii	"ADDING  [BOOKW] for tid 2 %d.\015\012\000"
	.align	2
.LC103:
	.ascii	"testing errors in C %d.\015\012\000"
	.text
	.align	2
	.global	userTask11
	.type	userTask11, %function
userTask11:
	@ args = 0, pretend = 0, frame = 9508
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L100
	sub	sp, sp, #9472
.L99:
	add	sl, pc, sl
	sub	sp, sp, #36
	bl	MyTid(PLT)
	ldr	r3, .L100+4
	add	r4, sp, #36
	add	r8, sl, r3
	sub	r4, r4, #32
	mov	r1, r8
	mov	r2, r0
	mov	fp, r0
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r5, sp, #9472
	mov	r0, r4
	bl	initDictionary(PLT)
	add	r5, r5, #36
	mvn	r3, #0
	str	r3, [r5, #-4]!
	ldr	r3, .L100+8
	mov	r2, r5
	add	r6, sl, r3
	mov	r1, r6
	mov	r0, r4
	bl	searchDictionary(PLT)
	ldr	r3, .L100+12
	mov	r2, r0
	add	r3, sl, r3
	mov	r1, r3
	mov	r0, #1
	str	r3, [sp, #0]
	bl	bwprintf(PLT)
	ldr	r3, .L100+16
	add	ip, sp, #8192
	add	r7, sl, r3
	ldr	r2, [ip, #1312]
	mov	r1, r7
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r2, fp
	mov	r1, r8
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r1, r6
	mov	r0, r4
	mov	r2, #1
	bl	addDictionary(PLT)
	ldr	r1, .L100+20
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L100+24
	mov	r2, #1
	add	r9, sl, r3
	mov	r1, r9
	mov	r0, r4
	bl	addDictionary(PLT)
	ldr	r1, .L100+28
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L100+32
	mov	r2, #1
	add	fp, sl, r3
	mov	r1, fp
	mov	r0, r4
	bl	addDictionary(PLT)
	ldr	r1, .L100+36
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L100+40
	mov	r2, #2
	add	r8, sl, r3
	mov	r1, r8
	mov	r0, r4
	bl	addDictionary(PLT)
	ldr	r1, .L100+44
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	mvn	ip, #0
	add	r3, sp, #8192
	str	ip, [r3, #1312]
	mov	r1, r6
	mov	r2, r5
	mov	r0, r4
	bl	searchDictionary(PLT)
	ldr	r1, [sp, #0]
	mov	r2, r0
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	mov	r1, r7
	ldr	r2, [r3, #1312]
	mov	r0, #1
	bl	bwprintf(PLT)
	mvn	r3, #0
	add	ip, sp, #8192
	str	r3, [ip, #1312]
	mov	r1, r9
	mov	r2, r5
	mov	r0, r4
	bl	searchDictionary(PLT)
	ldr	r1, .L100+48
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	add	ip, sp, #8192
	mov	r1, r7
	ldr	r2, [ip, #1312]
	mov	r0, #1
	bl	bwprintf(PLT)
	mvn	ip, #0
	add	r3, sp, #8192
	str	ip, [r3, #1312]
	mov	r1, fp
	mov	r2, r5
	mov	r0, r4
	bl	searchDictionary(PLT)
	ldr	r1, .L100+52
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	mov	r1, r7
	ldr	r2, [r3, #1312]
	mov	r0, #1
	bl	bwprintf(PLT)
	add	ip, sp, #8192
	mvn	r3, #0
	str	r3, [ip, #1312]
	mov	r1, r8
	mov	r2, r5
	mov	r0, r4
	bl	searchDictionary(PLT)
	ldr	r3, .L100+56
	mov	r2, r0
	add	r6, sl, r3
	mov	r1, r6
	mov	r0, #1
	bl	bwprintf(PLT)
	add	ip, sp, #8192
	ldr	r2, [ip, #1312]
	mov	r1, r7
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r1, fp
	mov	r0, r4
	mov	r2, #2
	bl	addDictionary(PLT)
	ldr	r1, .L100+60
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	mvn	ip, #0
	add	r3, sp, #8192
	str	ip, [r3, #1312]
	mov	r1, r8
	mov	r2, r5
	mov	r0, r4
	bl	searchDictionary(PLT)
	mov	r1, r6
	mov	r2, r0
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	mov	r1, r7
	ldr	r2, [r3, #1312]
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L100+64
	mov	r0, #1
	add	r4, sl, r3
	mov	r1, r4
	mov	r2, #67
	bl	bwprintf(PLT)
	mov	r1, r4
	mov	r0, #1
	mov	r2, #3
	bl	bwprintf(PLT)
	mov	r1, r4
	mov	r0, #1
	mov	r2, #246
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #292
	add	sp, sp, #9216
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L101:
	.align	2
.L100:
	.word	_GLOBAL_OFFSET_TABLE_-(.L99+8)
	.word	.LC44(GOTOFF)
	.word	.LC89(GOTOFF)
	.word	.LC90(GOTOFF)
	.word	.LC91(GOTOFF)
	.word	.LC92(GOTOFF)
	.word	.LC93(GOTOFF)
	.word	.LC94(GOTOFF)
	.word	.LC95(GOTOFF)
	.word	.LC96(GOTOFF)
	.word	.LC97(GOTOFF)
	.word	.LC98(GOTOFF)
	.word	.LC99(GOTOFF)
	.word	.LC100(GOTOFF)
	.word	.LC101(GOTOFF)
	.word	.LC102(GOTOFF)
	.word	.LC103(GOTOFF)
	.size	userTask11, .-userTask11
	.section	.rodata.str1.4
	.align	2
.LC104:
	.ascii	"%d\015\012\000"
	.text
	.align	2
	.global	userinfinitiPass
	.type	userinfinitiPass, %function
userinfinitiPass:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L109
	ldr	r6, .L109+4
	ldr	r5, .L109+8
	mov	r4, #0
.L108:
	add	sl, pc, sl
.L103:
	mov	r2, r4
	mov	r0, #1
	add	r4, r4, #1
	add	r1, sl, r6
	bl	bwprintf(PLT)
	cmp	r4, r5
	bne	.L103
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	Exit(PLT)
.L110:
	.align	2
.L109:
	.word	_GLOBAL_OFFSET_TABLE_-(.L108+8)
	.word	.LC104(GOTOFF)
	.word	10000
	.size	userinfinitiPass, .-userinfinitiPass
	.section	.rodata.str1.4
	.align	2
.LC105:
	.ascii	"creating infiniPass \012\015\000"
	.align	2
.LC106:
	.ascii	"CPSR :%x\012\015\000"
	.align	2
.LC107:
	.ascii	"a :%d\012\015\000"
	.align	2
.LC108:
	.ascii	"taskTest try:%d\012\015\000"
	.align	2
.LC109:
	.ascii	"returned from await:%d\012\015\000"
	.text
	.align	2
	.global	taskTestInt
	.type	taskTestInt, %function
taskTestInt:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L118
	ldr	r1, .L118+4
.L117:
	add	sl, pc, sl
	sub	sp, sp, #4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L118+8
	mov	r0, #31
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mrs r3, cpsr
	ldr	r1, .L118+12
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L118+16
	mov	r2, #100
	add	r4, sl, r3
	mov	r1, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	mov	r1, r4
	mov	r0, #1
	mov	r2, #100
	bl	bwprintf(PLT)
	ldr	r6, .L118+20
	ldr	r5, .L118+24
	mov	r4, #0
.L112:
	mov	r2, r4
	add	r1, sl, r6
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, #0
	bl	AwaitEvent(PLT)
	add	r4, r4, #1
	mov	r2, r0
	add	r1, sl, r5
	mov	r0, #1
	bl	bwprintf(PLT)
	cmp	r4, #2
	bne	.L112
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	Exit(PLT)
.L119:
	.align	2
.L118:
	.word	_GLOBAL_OFFSET_TABLE_-(.L117+8)
	.word	.LC105(GOTOFF)
	.word	userinfinitiPass(GOT)
	.word	.LC106(GOTOFF)
	.word	.LC107(GOTOFF)
	.word	.LC108(GOTOFF)
	.word	.LC109(GOTOFF)
	.size	taskTestInt, .-taskTestInt
	.align	2
	.global	taskTestInt2
	.type	taskTestInt2, %function
taskTestInt2:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r0, #1
	sub	sp, sp, #4
	bl	toggleTimer1Interrupt(PLT)
	mov	r1, #508
	mov	r2, r1
	mov	r3, #1
	ldr	r0, .L125
	bl	startTimer(PLT)
	mov	r3, #0
	str	r3, [sp, #0]
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	ldr	r3, .L125+4
	cmp	r2, r3
	bgt	.L121
	mov	r1, r3
.L122:
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	cmp	r2, r1
	ble	.L122
.L121:
	add	sp, sp, #4
	ldr	lr, [sp], #4
	b	Exit(PLT)
.L126:
	.align	2
.L125:
	.word	-2139029504
	.word	9999
	.size	taskTestInt2, .-taskTestInt2
	.section	.rodata.str1.4
	.align	2
.LC110:
	.ascii	"ioServer\000"
	.align	2
.LC111:
	.ascii	"The trains controller switch should turn on and off"
	.ascii	" 3 times now..\015\012\000"
	.align	2
.LC112:
	.ascii	"\033[2J\000"
	.align	2
.LC113:
	.ascii	"Printing a long message:\015\012\015\012\000"
	.align	2
.LC114:
	.ascii	"Contrary to popular belief, Lorem Ipsum is not simp"
	.ascii	"ly random text. It has roots in a piece of classica"
	.ascii	"l Latin literature from 45 BC, making it over 2000 "
	.ascii	"years old. Richard McClintock, a Latin professor at"
	.ascii	" Hampden-Sydney College in Virginia, looked up one "
	.ascii	"of the more obscure Latin words, consectetur, from "
	.ascii	"a Lorem Ipsum passage, and going through the cites "
	.ascii	"of the word in classical literature, discovered the"
	.ascii	" undoubtable source. Lorem Ipsum comes from section"
	.ascii	"s 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Ma"
	.ascii	"lorum\" (The Extremes of Good and Evil) by Cicero, "
	.ascii	"written in 45 BC. This book is a treatise on the th"
	.ascii	"eory of ethics, very popular during the Renaissance"
	.ascii	". The first line of Lorem Ipsum, \"Lorem ipsum dolo"
	.ascii	"r sit amet..\", comes from a line in section 1.10.3"
	.ascii	"2.\015\012\015\012\015\012\000"
	.align	2
.LC115:
	.ascii	"Type something here --> \000"
	.text
	.align	2
	.global	testTaskIO1
	.type	testTaskIO1, %function
testTaskIO1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L131
	ldr	r3, .L131+4
.L130:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	Create(PLT)
	ldr	r0, .L131+8
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L131+12
	mov	r1, #1
	add	r2, sl, r2
	mov	r4, r0
	bl	Printf(PLT)
	ldr	r2, .L131+16
	mov	r1, #1
	add	r2, sl, r2
	mov	r0, r4
	bl	Printf(PLT)
	mov	r1, #1
	mov	r2, #104
	mov	r0, r4
	bl	Putc(PLT)
	mov	r1, #1
	mov	r2, #101
	mov	r0, r4
	bl	Putc(PLT)
	mov	r1, #1
	mov	r2, #108
	mov	r0, r4
	bl	Putc(PLT)
	mov	r1, #1
	mov	r2, #108
	mov	r0, r4
	bl	Putc(PLT)
	mov	r1, #1
	mov	r2, #111
	mov	r0, r4
	bl	Putc(PLT)
	mov	r1, #1
	mov	r2, #119
	mov	r0, r4
	bl	Putc(PLT)
	mov	r1, #1
	mov	r2, #111
	mov	r0, r4
	bl	Putc(PLT)
	mov	r1, #1
	mov	r2, #114
	mov	r0, r4
	bl	Putc(PLT)
	mov	r1, #1
	mov	r2, #108
	mov	r0, r4
	bl	Putc(PLT)
	mov	r1, #1
	mov	r2, #100
	mov	r0, r4
	bl	Putc(PLT)
	mov	r1, #1
	mov	r2, #13
	mov	r0, r4
	bl	Putc(PLT)
	mov	r1, #1
	mov	r2, #10
	mov	r0, r4
	bl	Putc(PLT)
	ldr	r2, .L131+20
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L131+24
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L131+28
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
.L128:
	mov	r0, r4
	mov	r1, #1
	bl	Getc(PLT)
	mov	r1, #1
	mov	r2, r0
	mov	r0, r4
	bl	Putc(PLT)
	b	.L128
.L132:
	.align	2
.L131:
	.word	_GLOBAL_OFFSET_TABLE_-(.L130+8)
	.word	FirstUserTask(GOT)
	.word	.LC110(GOTOFF)
	.word	.LC111(GOTOFF)
	.word	.LC112(GOTOFF)
	.word	.LC113(GOTOFF)
	.word	.LC114(GOTOFF)
	.word	.LC115(GOTOFF)
	.size	testTaskIO1, .-testTaskIO1
	.align	2
	.global	kernelTest
	.type	kernelTest, %function
kernelTest:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L136
	ldr	r3, .L136+4
.L135:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	Create(PLT)
	ldr	r3, .L136+8
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L136+12
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L136+16
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L137:
	.align	2
.L136:
	.word	_GLOBAL_OFFSET_TABLE_-(.L135+8)
	.word	FirstUserTask(GOT)
	.word	displayGrid(GOT)
	.word	trainServer(GOT)
	.word	displayClock(GOT)
	.size	kernelTest, .-kernelTest
	.section	.rodata.str1.4
	.align	2
.LC116:
	.ascii	"Avg Time: %d \015\012\000"
	.text
	.align	2
	.global	testTaskPass3
	.type	testTaskPass3, %function
testTaskPass3:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L145
	ldr	r0, .L145+4
.L144:
	add	sl, pc, sl
	bl	stopTimer(PLT)
	mov	r1, #0
	ldr	r0, .L145+4
	mov	r2, r1
	mov	r3, r1
	bl	startTimer(PLT)
	ldr	r5, .L145+8
	mov	r6, #0
.L139:
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r4, r0
	bl	Pass(PLT)
	bl	Pass(PLT)
	bl	Pass(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	subs	r5, r5, #1
	rsb	r0, r4, r0
	add	r6, r6, r0
	bne	.L139
	ldr	r1, .L145+12
	mov	r2, r6
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	Exit(PLT)
.L146:
	.align	2
.L145:
	.word	_GLOBAL_OFFSET_TABLE_-(.L144+8)
	.word	-2139029404
	.word	10000
	.word	.LC116(GOTOFF)
	.size	testTaskPass3, .-testTaskPass3
	.section	.rodata.str1.4
	.align	2
.LC117:
	.ascii	"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
	.ascii	"bbbbbbbbbbbb\000"
	.align	2
.LC118:
	.ascii	"TEST FAILED!\015\012\000"
	.text
	.align	2
	.global	testTaskSend64
	.type	testTaskSend64, %function
testTaskSend64:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L154
	sub	sp, sp, #68
.L153:
	add	sl, pc, sl
	bl	Pass(PLT)
	ldr	r0, .L154+4
	bl	stopTimer(PLT)
	mov	r1, #0
	ldr	r0, .L154+4
	mov	r2, r1
	mov	r3, r1
	bl	startTimer(PLT)
	ldr	r5, .L154+8
	ldr	fp, .L154+12
	ldr	r9, .L154+16
	mov	r6, #0
	add	r8, sp, #4
	mov	r7, #64
.L148:
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r3, r8
	mov	r4, r0
	add	r1, sl, fp
	mov	r2, r7
	mov	r0, #2
	str	r7, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r9
	bl	bwassert(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	subs	r5, r5, #1
	rsb	r0, r4, r0
	add	r6, r6, r0
	bne	.L148
	ldr	r1, .L154+20
	mov	r2, r6
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #68
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L155:
	.align	2
.L154:
	.word	_GLOBAL_OFFSET_TABLE_-(.L153+8)
	.word	-2139029404
	.word	10000
	.word	.LC117(GOTOFF)
	.word	.LC118(GOTOFF)
	.word	.LC116(GOTOFF)
	.size	testTaskSend64, .-testTaskSend64
	.section	.rodata.str1.4
	.align	2
.LC119:
	.ascii	"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
	.ascii	"aaaaaaaaaaaa\000"
	.text
	.align	2
	.global	testTaskReceive64
	.type	testTaskReceive64, %function
testTaskReceive64:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L165
	sub	sp, sp, #68
.L164:
	add	sl, pc, sl
	mov	r4, #0
	add	r5, sp, #68
	str	r4, [r5, #-4]!
	bl	Pass(PLT)
	ldr	r7, .L165+4
	mov	r6, sp
.L157:
	mov	r1, sp
	mov	r2, #64
	mov	r0, r5
	bl	Receive(PLT)
	cmp	r0, #0
	add	r4, r4, #1
	add	r1, sl, r7
	mov	r2, #64
	ldrge	r0, [sp, #64]
	blge	Reply(PLT)
.L158:
	ldr	r3, .L165+8
	cmp	r4, r3
	bne	.L157
	bl	Exit(PLT)
	add	sp, sp, #68
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L166:
	.align	2
.L165:
	.word	_GLOBAL_OFFSET_TABLE_-(.L164+8)
	.word	.LC119(GOTOFF)
	.word	10000
	.size	testTaskReceive64, .-testTaskReceive64
	.align	2
	.global	testTaskGod64
	.type	testTaskGod64, %function
testTaskGod64:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L170
	ldr	r3, .L170+4
.L169:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #6
	bl	Create(PLT)
	ldr	r3, .L170+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L171:
	.align	2
.L170:
	.word	_GLOBAL_OFFSET_TABLE_-(.L169+8)
	.word	testTaskSend64(GOT)
	.word	testTaskReceive64(GOT)
	.size	testTaskGod64, .-testTaskGod64
	.section	.rodata.str1.4
	.align	2
.LC120:
	.ascii	"bbb\000"
	.align	2
.LC121:
	.ascii	"Avg Time1: %10d \015\012\000"
	.text
	.align	2
	.global	testTaskSend4
	.type	testTaskSend4, %function
testTaskSend4:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L179
	sub	sp, sp, #8
.L178:
	add	sl, pc, sl
	bl	Pass(PLT)
	ldr	r5, .L179+4
	ldr	fp, .L179+8
	ldr	r9, .L179+12
	mov	r6, #0
	add	r8, sp, #4
	mov	r7, #4
.L173:
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r3, r8
	mov	r4, r0
	add	r1, sl, fp
	mov	r2, r7
	mov	r0, #2
	str	r7, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r9
	bl	bwassert(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	subs	r5, r5, #1
	rsb	r0, r4, r0
	add	r6, r6, r0
	bne	.L173
	ldr	r1, .L179+16
	mov	r2, r6
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L180:
	.align	2
.L179:
	.word	_GLOBAL_OFFSET_TABLE_-(.L178+8)
	.word	10000
	.word	.LC120(GOTOFF)
	.word	.LC118(GOTOFF)
	.word	.LC121(GOTOFF)
	.size	testTaskSend4, .-testTaskSend4
	.section	.rodata.str1.4
	.align	2
.LC122:
	.ascii	"aaa\000"
	.text
	.align	2
	.global	testTaskReceive4
	.type	testTaskReceive4, %function
testTaskReceive4:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L190
	sub	sp, sp, #8
.L189:
	add	sl, pc, sl
	mov	r4, #0
	add	r5, sp, #8
	str	r4, [r5, #-4]!
	bl	Pass(PLT)
	ldr	r7, .L190+4
	mov	r6, sp
.L182:
	mov	r1, sp
	mov	r2, #4
	mov	r0, r5
	bl	Receive(PLT)
	cmp	r0, #0
	add	r4, r4, #1
	add	r1, sl, r7
	mov	r2, #4
	ldrge	r0, [sp, #4]
	blge	Reply(PLT)
.L183:
	ldr	r3, .L190+8
	cmp	r4, r3
	bne	.L182
	bl	Exit(PLT)
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L191:
	.align	2
.L190:
	.word	_GLOBAL_OFFSET_TABLE_-(.L189+8)
	.word	.LC122(GOTOFF)
	.word	10000
	.size	testTaskReceive4, .-testTaskReceive4
	.align	2
	.global	testTaskGod4
	.type	testTaskGod4, %function
testTaskGod4:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L195
	ldr	r3, .L195+4
.L194:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #6
	bl	Create(PLT)
	ldr	r3, .L195+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L196:
	.align	2
.L195:
	.word	_GLOBAL_OFFSET_TABLE_-(.L194+8)
	.word	testTaskSend4(GOT)
	.word	testTaskReceive4(GOT)
	.size	testTaskGod4, .-testTaskGod4
	.align	2
	.global	testTaskRSRend64
	.type	testTaskRSRend64, %function
testTaskRSRend64:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L204
	sub	sp, sp, #68
.L203:
	add	sl, pc, sl
	bl	Pass(PLT)
	ldr	r0, .L204+4
	bl	stopTimer(PLT)
	mov	r1, #0
	ldr	r0, .L204+4
	mov	r2, r1
	mov	r3, r1
	bl	startTimer(PLT)
	ldr	r5, .L204+8
	ldr	fp, .L204+12
	ldr	r9, .L204+16
	mov	r6, #0
	add	r8, sp, #4
	mov	r7, #64
.L198:
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r3, r8
	mov	r4, r0
	add	r1, sl, fp
	mov	r2, r7
	mov	r0, #1
	str	r7, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r9
	bl	bwassert(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	subs	r5, r5, #1
	rsb	r0, r4, r0
	add	r6, r6, r0
	bne	.L198
	ldr	r1, .L204+20
	mov	r2, r6
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #68
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L205:
	.align	2
.L204:
	.word	_GLOBAL_OFFSET_TABLE_-(.L203+8)
	.word	-2139029404
	.word	10000
	.word	.LC117(GOTOFF)
	.word	.LC118(GOTOFF)
	.word	.LC116(GOTOFF)
	.size	testTaskRSRend64, .-testTaskRSRend64
	.align	2
	.global	testTaskRSReceive64
	.type	testTaskRSReceive64, %function
testTaskRSReceive64:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L215
	sub	sp, sp, #68
.L214:
	add	sl, pc, sl
	mov	r4, #0
	add	r5, sp, #68
	str	r4, [r5, #-4]!
	bl	Pass(PLT)
	ldr	r7, .L215+4
	mov	r6, sp
.L207:
	mov	r1, sp
	mov	r2, #64
	mov	r0, r5
	bl	Receive(PLT)
	cmp	r0, #0
	add	r4, r4, #1
	add	r1, sl, r7
	mov	r2, #64
	ldrge	r0, [sp, #64]
	blge	Reply(PLT)
.L208:
	ldr	r3, .L215+8
	cmp	r4, r3
	bne	.L207
	bl	Exit(PLT)
	add	sp, sp, #68
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L216:
	.align	2
.L215:
	.word	_GLOBAL_OFFSET_TABLE_-(.L214+8)
	.word	.LC119(GOTOFF)
	.word	10000
	.size	testTaskRSReceive64, .-testTaskRSReceive64
	.align	2
	.global	testTaskGodRSR64
	.type	testTaskGodRSR64, %function
testTaskGodRSR64:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L220
	ldr	r3, .L220+4
.L219:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #6
	bl	Create(PLT)
	ldr	r3, .L220+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L221:
	.align	2
.L220:
	.word	_GLOBAL_OFFSET_TABLE_-(.L219+8)
	.word	testTaskRSReceive64(GOT)
	.word	testTaskRSRend64(GOT)
	.size	testTaskGodRSR64, .-testTaskGodRSR64
	.align	2
	.global	testTaskRSRend4
	.type	testTaskRSRend4, %function
testTaskRSRend4:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L229
	sub	sp, sp, #8
.L228:
	add	sl, pc, sl
	bl	Pass(PLT)
	ldr	r5, .L229+4
	ldr	fp, .L229+8
	ldr	r9, .L229+12
	mov	r6, #0
	add	r8, sp, #4
	mov	r7, #4
.L223:
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r3, r8
	mov	r4, r0
	add	r1, sl, fp
	mov	r2, r7
	mov	r0, #1
	str	r7, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r9
	bl	bwassert(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	subs	r5, r5, #1
	rsb	r0, r4, r0
	add	r6, r6, r0
	bne	.L223
	ldr	r1, .L229+16
	mov	r2, r6
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L230:
	.align	2
.L229:
	.word	_GLOBAL_OFFSET_TABLE_-(.L228+8)
	.word	10000
	.word	.LC120(GOTOFF)
	.word	.LC118(GOTOFF)
	.word	.LC116(GOTOFF)
	.size	testTaskRSRend4, .-testTaskRSRend4
	.align	2
	.global	testTaskRSReceive4
	.type	testTaskRSReceive4, %function
testTaskRSReceive4:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L240
	sub	sp, sp, #8
.L239:
	add	sl, pc, sl
	mov	r4, #0
	add	r5, sp, #8
	str	r4, [r5, #-4]!
	bl	Pass(PLT)
	ldr	r7, .L240+4
	mov	r6, sp
.L232:
	mov	r1, sp
	mov	r2, #4
	mov	r0, r5
	bl	Receive(PLT)
	cmp	r0, #0
	add	r4, r4, #1
	add	r1, sl, r7
	mov	r2, #4
	ldrge	r0, [sp, #4]
	blge	Reply(PLT)
.L233:
	ldr	r3, .L240+8
	cmp	r4, r3
	bne	.L232
	bl	Exit(PLT)
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L241:
	.align	2
.L240:
	.word	_GLOBAL_OFFSET_TABLE_-(.L239+8)
	.word	.LC122(GOTOFF)
	.word	10000
	.size	testTaskRSReceive4, .-testTaskRSReceive4
	.align	2
	.global	testTaskGodRSR4
	.type	testTaskGodRSR4, %function
testTaskGodRSR4:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L245
	ldr	r3, .L245+4
.L244:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #6
	bl	Create(PLT)
	ldr	r3, .L245+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L246:
	.align	2
.L245:
	.word	_GLOBAL_OFFSET_TABLE_-(.L244+8)
	.word	testTaskRSReceive4(GOT)
	.word	testTaskRSRend4(GOT)
	.size	testTaskGodRSR4, .-testTaskGodRSR4
	.section	.rodata.str1.4
	.align	2
.LC123:
	.ascii	"stringa:[%s]\012\015\000"
	.align	2
.LC124:
	.ascii	"stringb:[%s]\012\015\000"
	.align	2
.LC125:
	.ascii	"stringb:1 bytes:[%d]\012\015\000"
	.align	2
.LC126:
	.ascii	"stringb:64 bytes[%d]\012\015\000"
	.text
	.align	2
	.global	TESTold
	.type	TESTold, %function
TESTold:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L250
	ldr	r3, .L250+4
.L249:
	add	sl, pc, sl
	mov	r4, r0
	add	r8, sl, r3
	mov	r5, r1
	mov	r2, r4
	mov	r1, r8
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L250+8
	mov	r2, r5
	add	r7, sl, r3
	mov	r1, r7
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r5
	mov	r1, r4
	mov	r2, #0
	bl	pkmemcpy2(PLT)
	mov	r1, r8
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r2, r5
	mov	r1, r7
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r1, r4
	mov	r6, r0
	mov	r2, #1
	mov	r0, r5
	bl	pkmemcpy2(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	ldr	r1, .L250+12
	rsb	r2, r6, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r1, r8
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r2, r5
	mov	r1, r7
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r5
	mov	r1, r4
	mov	r2, #12
	bl	pkmemcpy2(PLT)
	mov	r1, r8
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r2, r5
	mov	r1, r7
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r5
	mov	r1, r4
	mov	r2, #24
	bl	pkmemcpy2(PLT)
	mov	r1, r8
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r2, r5
	mov	r1, r7
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r5
	mov	r1, r4
	mov	r2, #50
	bl	pkmemcpy2(PLT)
	mov	r1, r8
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r2, r5
	mov	r1, r7
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r1, r4
	mov	r9, r0
	mov	r2, #63
	mov	r0, r5
	bl	pkmemcpy2(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r1, r8
	mov	r6, r0
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r1, r7
	mov	r2, r5
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L250+16
	rsb	r2, r9, r6
	add	r1, sl, r1
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	b	bwprintf(PLT)
.L251:
	.align	2
.L250:
	.word	_GLOBAL_OFFSET_TABLE_-(.L249+8)
	.word	.LC123(GOTOFF)
	.word	.LC124(GOTOFF)
	.word	.LC125(GOTOFF)
	.word	.LC126(GOTOFF)
	.size	TESTold, .-TESTold
	.align	2
	.global	TESTnew
	.type	TESTnew, %function
TESTnew:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L255
	mov	r5, r0
.L254:
	add	sl, pc, sl
	mov	r4, r1
	mov	r2, #0
	mov	r0, r1
	mov	r1, r5
	bl	pkmemcpy(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r1, r5
	mov	r6, r0
	mov	r2, #1
	mov	r0, r4
	bl	pkmemcpy(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	ldr	r1, .L255+4
	rsb	r2, r6, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r4
	mov	r1, r5
	mov	r2, #3
	bl	pkmemcpy(PLT)
	mov	r0, r4
	mov	r1, r5
	mov	r2, #4
	bl	pkmemcpy(PLT)
	mov	r0, r4
	mov	r1, r5
	mov	r2, #12
	bl	pkmemcpy(PLT)
	mov	r0, r4
	mov	r1, r5
	mov	r2, #24
	bl	pkmemcpy(PLT)
	mov	r1, r5
	mov	r0, r4
	mov	r2, #50
	bl	pkmemcpy(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r1, r5
	mov	r6, r0
	mov	r2, #63
	mov	r0, r4
	bl	pkmemcpy(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	ldr	r1, .L255+8
	rsb	r2, r6, r0
	add	r1, sl, r1
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	bwprintf(PLT)
.L256:
	.align	2
.L255:
	.word	_GLOBAL_OFFSET_TABLE_-(.L254+8)
	.word	.LC125(GOTOFF)
	.word	.LC126(GOTOFF)
	.size	TESTnew, .-TESTnew
	.section	.rodata.str1.4
	.align	2
.LC127:
	.ascii	"stringa:[%d]\012\015\000"
	.align	2
.LC128:
	.ascii	"123456789012345678901234567890123456789012345678901"
	.ascii	"234567890ABCD\000"
	.text
	.align	2
	.global	testMemCpy
	.type	testMemCpy, %function
testMemCpy:
	@ args = 0, pretend = 0, frame = 76
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L276
	sub	sp, sp, #76
	mov	r3, #0
	mov	r6, sp
	mov	r2, #32
.L275:
	add	sl, pc, sl
.L258:
	strb	r2, [r3, r6]
	add	r3, r3, #1
	cmp	r3, #75
	bne	.L258
	mov	r5, #0
	mov	r3, r5
	ldr	r0, .L276+4
	mov	r1, r5
	mov	r2, r5
	strb	r5, [sp, #75]
	bl	startTimer(PLT)
	ldr	r3, .L276+8
	mov	r0, #1
	add	r4, sl, r3
	add	r9, sp, r0
	mov	r1, r4
	mov	r2, sp
	ldr	r7, .L276+12
	bl	bwprintf(PLT)
	mov	r2, r9
	mov	r1, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r8, .L276+16
	add	r0, sl, r7
	add	r0, r0, #1
	mov	r1, sp
	bl	TESTnew(PLT)
	mov	r0, #1
	add	r1, sl, r8
	mov	r2, sp
	bl	bwprintf(PLT)
	mov	r3, #32
.L260:
	strb	r3, [r5, r6]
	add	r5, r5, #1
	cmp	r5, #75
	bne	.L260
	add	r0, sl, r7
	add	r0, r0, #1
	mov	r1, r9
	mov	r4, #0
	strb	r4, [sp, #75]
	bl	TESTnew(PLT)
	mov	r0, #1
	add	r1, sl, r8
	mov	r2, sp
	bl	bwprintf(PLT)
	mov	r3, #32
.L262:
	strb	r3, [r4, r6]
	add	r4, r4, #1
	cmp	r4, #75
	bne	.L262
	add	r0, sl, r7
	add	r0, r0, #1
	add	r1, sp, #2
	sub	r4, r4, #75
	strb	r4, [sp, #75]
	bl	TESTnew(PLT)
	mov	r0, #1
	add	r1, sl, r8
	mov	r2, sp
	bl	bwprintf(PLT)
	mov	r3, #32
.L264:
	strb	r3, [r4, r6]
	add	r4, r4, #1
	cmp	r4, #75
	bne	.L264
	add	r0, sl, r7
	add	r1, sp, #3
	mov	r3, #0
	add	r0, r0, #1
	strb	r3, [sp, #75]
	bl	TESTnew(PLT)
	add	r1, sl, r8
	mov	r2, sp
	mov	r0, #1
	bl	bwprintf(PLT)
	add	sp, sp, #76
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L277:
	.align	2
.L276:
	.word	_GLOBAL_OFFSET_TABLE_-(.L275+8)
	.word	-2139029404
	.word	.LC127(GOTOFF)
	.word	.LC128(GOTOFF)
	.word	.LC123(GOTOFF)
	.size	testMemCpy, .-testMemCpy
	.section	.rodata.str1.4
	.align	2
.LC129:
	.ascii	"New Storage algos\015\012\000"
	.align	2
.LC130:
	.ascii	"<ClockServer>: DelayUntil storage error. Could not "
	.ascii	"put TD<%d> into storage.\015\012\000"
	.align	2
.LC131:
	.ascii	"Time: Insert %d \015\012\000"
	.align	2
.LC132:
	.ascii	"heap empty\015\012\000"
	.align	2
.LC133:
	.ascii	"Time: Delete %d \015\012\000"
	.align	2
.LC134:
	.ascii	"Total Time to fill and unfill %d \015\012\000"
	.text
	.align	2
	.global	testClockStorage2
	.type	testClockStorage2, %function
testClockStorage2:
	@ args = 0, pretend = 0, frame = 1040
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L298
	sub	sp, sp, #1040
.L293:
	add	sl, pc, sl
	mov	r0, sp
	bl	initStorage(PLT)
	ldr	r1, .L298+4
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r6, #0
	add	r9, sp, #1024
	ldr	r8, .L298+8
	mov	r7, sp
	mov	r5, r6
	add	r9, r9, #4
.L279:
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r4, r0
	mov	r0, #0
	str	r5, [sp, #1032]
	bl	getTicks4us(PLT)
	ldr	r3, .L298+12
	mov	r1, r9
	umull	ip, r2, r3, r0
	rsb	ip, r2, r0
	add	r2, r2, ip, lsr #1
	mov	r2, r2, lsr #5
	add	r3, r2, r2, asl #3
	add	r3, r2, r3, asl #2
	rsb	r2, r3, r0
	mov	r0, sp
	str	r2, [sp, #1028]
	bl	minHeapInsert(PLT)
	mov	r1, #1
	add	r2, sl, r8
	ldr	r3, [sp, #1032]
	bl	bwassert(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	add	r5, r5, #1
	rsb	r0, r4, r0
	cmp	r5, #125
	add	r6, r6, r0
	bne	.L279
	ldr	r1, .L298+16
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, r6
	bl	bwprintf(PLT)
	mov	r8, #0
	add	fp, sp, #1024
	mov	r5, r8
	add	fp, fp, #12
	b	.L281
.L297:
	ldr	r3, [sp, #1036]
	mov	r0, sp
	cmp	r3, #24
	bgt	.L295
	bl	minHeapDelete(PLT)
	cmp	r0, #0
	mov	r0, #0
	beq	.L296
	bl	getTicks4us(PLT)
	cmp	r5, #125
	rsb	r0, r4, r0
	add	r8, r8, r0
	beq	.L284
.L281:
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r1, fp
	mov	r4, r0
	mov	r0, sp
	bl	minHeapPeak(PLT)
	cmp	r0, #0
	add	r5, r5, #1
	mov	r1, r9
	bne	.L297
.L294:
	bl	getTicks4us(PLT)
	rsb	r0, r4, r0
	add	r8, r8, r0
.L284:
	ldr	r1, .L298+20
	mov	r2, r8
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L298+24
	add	r2, r8, r6
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #1040
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L295:
	mov	r0, #0
	b	.L294
.L296:
	ldr	r1, .L298+28
	add	r0, r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	b	.L284
.L299:
	.align	2
.L298:
	.word	_GLOBAL_OFFSET_TABLE_-(.L293+8)
	.word	.LC129(GOTOFF)
	.word	.LC130(GOTOFF)
	.word	-1160801971
	.word	.LC131(GOTOFF)
	.word	.LC133(GOTOFF)
	.word	.LC134(GOTOFF)
	.word	.LC132(GOTOFF)
	.size	testClockStorage2, .-testClockStorage2
	.section	.rodata.str1.4
	.align	2
.LC135:
	.ascii	"<UART1SendServer>: Receive error.\015\012\000"
	.align	2
.LC136:
	.ascii	"<Uart1SendServer>: Quiting.\015\012\000"
	.align	2
.LC137:
	.ascii	"1\000"
	.align	2
.LC138:
	.ascii	"count = %d\012\015\000"
	.align	2
.LC139:
	.ascii	"[%s] \012\015\000"
	.align	2
.LC140:
	.ascii	"<Uart1SendServer>: Illegal request code from userTa"
	.ascii	"sk <%d>.\015\012\000"
	.text
	.align	2
	.global	U2Test
	.type	U2Test, %function
U2Test:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r3, .L321
	sub	sp, sp, #80
	str	r3, [sp, #0]
	ldr	r3, .L321+4
	ldr	sl, .L321+8
	add	r5, sp, #80
	str	r3, [sp, #4]
	ldr	r6, .L321+12
	mvn	r3, #0
	ldr	r7, .L321+16
	ldr	fp, .L321+20
	ldr	r8, .L321+24
	str	r3, [r5, #-4]!
	add	r4, sp, #10
	add	r9, sp, #11
.L318:
	add	sl, pc, sl
.L319:
	mov	r1, r4
	mov	r2, #66
	mov	r0, r5
	bl	Receive(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r6
	bl	bwassert(PLT)
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	cmp	r3, #21
	beq	.L303
	cmp	r3, #81
	beq	.L320
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, r8
	ldr	r3, [sp, #76]
	bl	bwassert(PLT)
	b	.L319
.L320:
	ldr	r3, [sp, #0]
	mov	r0, #1
	add	r1, sl, r3
	bl	bwprintf(PLT)
	add	r1, sl, r7
	mov	r2, #2
	ldr	r0, [sp, #76]
	bl	Reply(PLT)
	bl	Exit(PLT)
.L303:
	ldrb	r2, [sp, #11]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L307
	mov	r2, r4
.L308:
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	add	r2, r2, #1
	cmp	r3, #0
	bne	.L308
	rsb	r2, r4, r2
.L307:
	add	r1, sl, fp
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, [sp, #4]
	mov	r2, r9
	add	r1, sl, r3
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, [sp, #76]
	add	r1, sl, r7
	mov	r2, #2
	bl	Reply(PLT)
	b	.L319
.L322:
	.align	2
.L321:
	.word	.LC136(GOTOFF)
	.word	.LC139(GOTOFF)
	.word	_GLOBAL_OFFSET_TABLE_-(.L318+8)
	.word	.LC135(GOTOFF)
	.word	.LC137(GOTOFF)
	.word	.LC138(GOTOFF)
	.word	.LC140(GOTOFF)
	.size	U2Test, .-U2Test
	.section	.rodata.str1.4
	.align	2
.LC141:
	.ascii	"Failed Create UART2TS Server.\012\015\000"
	.align	2
.LC142:
	.ascii	"C\000"
	.align	2
.LC143:
	.ascii	"CAMERA\000"
	.align	2
.LC144:
	.ascii	"123456789012345678901234567890123456789012345678901"
	.ascii	"234567890\000"
	.align	2
.LC145:
	.ascii	"123456789012345678901234567890123456789012345678901"
	.ascii	"2345678901\000"
	.align	2
.LC146:
	.ascii	"123456789012345678901234567890123456789012345678901"
	.ascii	"23456789012\000"
	.align	2
.LC147:
	.ascii	"123456789012345678901234567890123456789012345678901"
	.ascii	"234567890123\000"
	.align	2
.LC148:
	.ascii	"123456789012345678901234567890123456789012345678901"
	.ascii	"2345678901234\000"
	.align	2
.LC149:
	.ascii	"Under = 64\000"
	.align	2
.LC150:
	.ascii	"123456789012345678901234567890123456789012345678901"
	.ascii	"23456789012345\000"
	.align	2
.LC151:
	.ascii	"123456789012345678901234567890123456789012345678901"
	.ascii	"2345678901234A2345678901234567890123456789012345678"
	.ascii	"90123456789012345678901234ABCDE\000"
	.align	2
.LC152:
	.ascii	"Testing Putx\012\015\000"
	.align	2
.LC153:
	.ascii	"Testing Putx A\012\015\000"
	.align	2
.LC154:
	.ascii	"Testing Putx B\012\015\000"
	.align	2
.LC155:
	.ascii	"Testing Putr\012\015\000"
	.align	2
.LC156:
	.ascii	"putw\012\015\000"
	.align	2
.LC157:
	.ascii	"tmp\000"
	.align	2
.LC158:
	.ascii	"test printf numbers[%8x]TEST\012\015\000"
	.align	2
.LC159:
	.ascii	"test\000"
	.align	2
.LC160:
	.ascii	"test%c\000"
	.align	2
.LC161:
	.ascii	"test%c%%\000"
	.align	2
.LC162:
	.ascii	"test [%7s] !\000"
	.align	2
.LC163:
	.ascii	"string\000"
	.align	2
.LC164:
	.ascii	"test [%7s] %x  !\000"
	.align	2
.LC165:
	.ascii	"test [%7s] %x %d %d %u!\000"
	.align	2
.LC166:
	.ascii	"**********************************\000"
	.align	2
.LC167:
	.ascii	"Quiting\012\015\000"
	.align	2
.LC168:
	.ascii	"Q\000"
	.text
	.align	2
	.global	testPrintf
	.type	testPrintf, %function
testPrintf:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L326
	ldr	r3, .L326+4
.L325:
	add	sl, pc, sl
	sub	sp, sp, #20
	ldr	r1, [sl, r3]
	mov	r2, #3
	mov	r0, #1
	bl	CreateIOServer(PLT)
	ldr	r2, .L326+8
	mov	r5, r0
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r0, r5
	mov	r1, #1
	mov	r2, #67
	bl	Putc(PLT)
	ldr	r2, .L326+12
	mov	r1, #1
	add	r2, sl, r2
	mov	r0, r5
	bl	Putstr(PLT)
	ldr	r3, .L326+16
	mov	r1, #1
	add	r4, sl, r3
	mov	r2, r4
	mov	r0, r5
	bl	Putstr(PLT)
	mov	r2, r4
	mov	r0, r5
	mov	r1, #1
	bl	Putstr(PLT)
	ldr	r2, .L326+20
	mov	r1, #1
	add	r2, sl, r2
	mov	r0, r5
	bl	Putstr(PLT)
	ldr	r2, .L326+24
	mov	r1, #1
	add	r2, sl, r2
	mov	r0, r5
	bl	Putstr(PLT)
	ldr	r2, .L326+28
	mov	r1, #1
	add	r2, sl, r2
	mov	r0, r5
	bl	Putstr(PLT)
	ldr	r2, .L326+32
	mov	r1, #1
	add	r2, sl, r2
	mov	r0, r5
	bl	Putstr(PLT)
	ldr	r2, .L326+36
	mov	r1, #1
	add	r2, sl, r2
	mov	r0, r5
	bl	Putstr(PLT)
	ldr	r2, .L326+40
	mov	r1, #1
	add	r2, sl, r2
	mov	r0, r5
	bl	Putstr(PLT)
	ldr	r2, .L326+44
	mov	r1, #1
	add	r2, sl, r2
	mov	r0, r5
	bl	Putstr(PLT)
	ldr	r2, .L326+48
	mov	r1, #1
	add	r2, sl, r2
	mov	r0, r5
	bl	Putstr(PLT)
	ldr	r1, .L326+52
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r1, .L326+56
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r2, #65
	mov	r0, r5
	mov	r1, #1
	bl	Putx(PLT)
	ldr	r1, .L326+60
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r2, #66
	mov	r0, r5
	mov	r1, #1
	bl	Putx(PLT)
	ldr	r1, .L326+64
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r1, #1
	mov	r2, r1
	mov	r0, r5
	bl	Putr(PLT)
	mov	r1, #1
	mov	r2, r1
	mov	r0, r5
	bl	Putr(PLT)
	mov	r2, #2
	mov	r0, r5
	mov	r1, #1
	bl	Putr(PLT)
	ldr	r1, .L326+68
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	ip, .L326+72
	mov	r3, #87
	add	r4, sl, ip
	mov	r0, r5
	mov	r1, #1
	mov	r2, #10
	str	r4, [sp, #0]
	bl	Putw(PLT)
	ldr	r1, .L326+76
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, #10
	bl	bwprintf(PLT)
	ldr	r2, .L326+80
	mov	r0, r5
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L326+84
	mov	r0, r5
	add	r2, sl, r2
	mov	r1, #1
	mov	r3, #65
	bl	Printf(PLT)
	ldr	r2, .L326+88
	mov	r0, r5
	add	r2, sl, r2
	mov	r1, #1
	mov	r3, #65
	bl	Printf(PLT)
	ldr	r3, .L326+92
	ldr	r2, .L326+96
	add	r4, sl, r3
	add	r2, sl, r2
	mov	r0, r5
	mov	r3, r4
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L326+100
	mov	r0, r5
	add	r2, sl, r2
	mov	r3, r4
	mov	ip, #10
	mov	r1, #1
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r2, .L326+104
	mov	ip, #16
	mov	r3, r4
	add	r2, sl, r2
	mvn	r4, #15
	mov	r0, r5
	mov	r1, #1
	str	ip, [sp, #4]
	str	ip, [sp, #0]
	str	r4, [sp, #12]
	str	r4, [sp, #8]
	bl	Printf(PLT)
	ldr	r3, .L326+108
	mov	r0, r5
	add	r4, sl, r3
	mov	r2, r4
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L326+112
	mov	r0, r5
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	mov	r2, r4
	mov	r0, r5
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r1, .L326+116
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r1, .L326+120
	mov	ip, #2
	add	r1, sl, r1
	mov	r2, ip
	add	r3, sp, #20
	mov	r0, r5
	str	ip, [sp, #0]
	bl	Send(PLT)
	bl	Exit(PLT)
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, sl, pc}
.L327:
	.align	2
.L326:
	.word	_GLOBAL_OFFSET_TABLE_-(.L325+8)
	.word	U2Test(GOT)
	.word	.LC141(GOTOFF)
	.word	.LC142(GOTOFF)
	.word	.LC143(GOTOFF)
	.word	.LC144(GOTOFF)
	.word	.LC145(GOTOFF)
	.word	.LC146(GOTOFF)
	.word	.LC147(GOTOFF)
	.word	.LC148(GOTOFF)
	.word	.LC149(GOTOFF)
	.word	.LC150(GOTOFF)
	.word	.LC151(GOTOFF)
	.word	.LC152(GOTOFF)
	.word	.LC153(GOTOFF)
	.word	.LC154(GOTOFF)
	.word	.LC155(GOTOFF)
	.word	.LC156(GOTOFF)
	.word	.LC157(GOTOFF)
	.word	.LC158(GOTOFF)
	.word	.LC159(GOTOFF)
	.word	.LC160(GOTOFF)
	.word	.LC161(GOTOFF)
	.word	.LC163(GOTOFF)
	.word	.LC162(GOTOFF)
	.word	.LC164(GOTOFF)
	.word	.LC165(GOTOFF)
	.word	.LC166(GOTOFF)
	.word	.LC114(GOTOFF)
	.word	.LC167(GOTOFF)
	.word	.LC168(GOTOFF)
	.size	testPrintf, .-testPrintf
	.section	.rodata.str1.4
	.align	2
.LC169:
	.ascii	"poll: %d\012\015\000"
	.align	2
.LC170:
	.ascii	"average time: %d\012\015\000"
	.text
	.align	2
	.global	sensTest
	.type	sensTest, %function
sensTest:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L335
	ldr	r3, .L335+4
.L334:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	CreateNameServer(PLT)
	ldr	r3, .L335+8
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	CreateClockServer(PLT)
	ldr	r3, .L335+12
	mov	r0, #31
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L335+16
	mov	r0, #2
	ldr	r1, [sl, r3]
	mov	r2, r0
	bl	CreateIOServer(PLT)
	ldr	r3, .L335+20
	mov	r2, #1
	ldr	r1, [sl, r3]
	mov	r0, #2
	bl	CreateIOServer(PLT)
	ldr	r3, .L335+24
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mov	r5, #0
	ldr	r6, .L335+28
	mov	r4, r5
.L329:
	mov	r0, #0
	bl	getTicks4us(PLT)
	bl	getTicks4us(PLT)
	mov	r2, r4
	add	r5, r5, r0
	add	r4, r4, #1
	mov	r0, #1
	add	r1, sl, r6
	bl	bwprintf(PLT)
	cmp	r4, #100
	bne	.L329
	ldr	r3, .L335+32
	mov	r0, #1
	smull	r2, r1, r3, r5
	mov	r2, r5, asr #31
	rsb	r2, r2, r1, asr #5
	ldr	r1, .L335+36
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	Quit(PLT)
.L336:
	.align	2
.L335:
	.word	_GLOBAL_OFFSET_TABLE_-(.L334+8)
	.word	NameServerTask(GOT)
	.word	clockServer(GOT)
	.word	idleTask(GOT)
	.word	UART1_ReceiveServer(GOT)
	.word	UART1_SendServer(GOT)
	.word	commandServer(GOT)
	.word	.LC169(GOTOFF)
	.word	1374389535
	.word	.LC170(GOTOFF)
	.size	sensTest, .-sensTest
	.align	2
	.global	TrackGraphInit
	.type	TrackGraphInit, %function
TrackGraphInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	b	TrackGraphInitA(PLT)
	.size	TrackGraphInit, .-TrackGraphInit
	.section	.rodata.str1.4
	.align	2
.LC171:
	.ascii	"E13\000"
	.align	2
.LC172:
	.ascii	"C11\000"
	.align	2
.LC173:
	.ascii	"DEAD END.\015\012\000"
	.align	2
.LC174:
	.ascii	"Ans: \000"
	.align	2
.LC175:
	.ascii	" %d \000"
	.align	2
.LC176:
	.ascii	"\015\012Distance[length=%d]: \000"
	.align	2
.LC177:
	.ascii	"\015\012Total distance = %d\015\012\000"
	.align	2
.LC178:
	.ascii	"\015\012Beginning next sensor test.\015\012\000"
	.align	2
.LC179:
	.ascii	"A02\000"
	.align	2
.LC180:
	.ascii	"Next sensor from E06 is %c%d%d[distance=%d]\015\012"
	.ascii	"\000"
	.align	2
.LC181:
	.ascii	"Next sensor from sw10 is %c%d%d[distance=%d]\015\012"
	.ascii	"\000"
	.align	2
.LC182:
	.ascii	"Alt sensor from sw10 is %c%d%d[distance=%d]\015\012"
	.ascii	"\000"
	.align	2
.LC183:
	.ascii	"Commencing Djikstra's algorithm.\015\012\000"
	.align	2
.LC184:
	.ascii	"Finding path between %d and %d: \000"
	.align	2
.LC185:
	.ascii	"NOT FOUND.\015\012\000"
	.align	2
.LC186:
	.ascii	"FOUND.\015\012\000"
	.align	2
.LC187:
	.ascii	"A05\000"
	.align	2
.LC188:
	.ascii	"A01\000"
	.text
	.align	2
	.global	graphTestTask
	.type	graphTestTask, %function
graphTestTask:
	@ args = 0, pretend = 0, frame = 7364
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #7360
	sub	sp, sp, #12
	ldr	sl, .L388
	add	r7, sp, #76
	mov	r3, #0
	add	r1, sp, #4096
	sub	r7, r7, #52
.L381:
	add	sl, pc, sl
	str	r3, [r1, #3268]
	str	r3, [r1, #3272]
	str	r3, [r1, #3264]
	mov	r0, r7
	bl	TrackGraphInit(PLT)
	ldr	r0, .L388+4
	add	r8, sp, #6912
	add	r0, sl, r0
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, .L388+8
	add	r8, r8, #40
	add	r0, sl, r0
	bl	sensor2i(PLT)
	add	r9, sp, #7296
	mov	r2, r0
	add	r9, r9, #60
	mov	r1, r4
	mov	r0, r7
	mov	r3, r8
	str	r9, [sp, #0]
	bl	getShortestPath(PLT)
	cmp	r0, #0
	beq	.L383
.L340:
	ldr	r2, .L388+12
	mov	r0, #1
	add	r1, sl, r2
	str	r2, [sp, #20]
	bl	bwprintf(PLT)
	add	r3, sp, #4096
	ldr	r0, [r3, #3260]
	add	ip, sp, #4096
	sub	r3, r0, #1
	str	r3, [ip, #3268]
	ldr	r2, [ip, #3268]
	cmp	r2, #0
	blt	.L342
	ldr	r4, .L388+16
.L343:
	add	lr, sp, #4096
	ldr	r2, [lr, #3268]
	add	r1, sp, #7360
	add	r1, r1, #12
	add	r3, r1, r2, asl #2
	ldr	r2, [r3, #-420]
	mov	r0, #1
	add	r1, sl, r4
	bl	bwprintf(PLT)
	add	r2, sp, #4096
	ldr	r3, [r2, #3268]
	sub	r3, r3, #1
	str	r3, [r2, #3268]
	ldr	r2, [r2, #3268]
	cmp	r2, #0
	bge	.L343
	add	r3, sp, #4096
	ldr	r0, [r3, #3260]
.L342:
	add	fp, sp, #6528
	ldr	ip, .L388+20
	add	fp, fp, #24
	add	lr, sp, #7360
	add	lr, lr, #8
	mov	r2, r0
	mov	r1, r8
	mov	r3, fp
	mov	r0, r7
	str	ip, [sp, #16]
	str	lr, [sp, #8]
	str	lr, [sp, #0]
	bl	getEdgeInfo(PLT)
	ldr	r2, [sp, #16]
	add	r3, sp, #4096
	mov	r0, #1
	add	r1, sl, r2
	ldr	r2, [r3, #3272]
	bl	bwprintf(PLT)
	add	ip, sp, #4096
	mov	r3, #0
	str	r3, [ip, #3268]
	ldr	r2, [ip, #3268]
	ldr	r0, [ip, #3272]
	cmp	r0, r2
	bgt	.L384
.L344:
	mov	r2, #0
	add	r3, sp, #4096
	str	r2, [r3, #3268]
	ldr	r3, [r3, #3268]
	cmp	r3, r0
	movge	ip, r2
	bge	.L348
	mov	ip, r2
.L349:
	add	lr, sp, #4096
	ldr	r2, [lr, #3268]
	ldr	r3, [lr, #3268]
	add	lr, sp, #7360
	add	lr, lr, #12
	add	r1, lr, r2, asl #2
	add	r3, r3, #1
	add	r2, sp, #4096
	str	r3, [r2, #3268]
	ldr	r2, [r2, #3268]
	ldr	r3, [r1, #-820]
	cmp	r2, r0
	add	ip, ip, r3
	blt	.L349
.L348:
	ldr	r3, .L388+24
	mov	r2, ip
	add	r1, sl, r3
	mov	r0, #1
	str	r3, [sp, #12]
	bl	bwprintf(PLT)
	ldr	r1, .L388+28
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r0, .L388+32
	mov	r3, #0
	add	ip, sp, #4096
	str	r3, [ip, #3256]
	add	r0, sl, r0
	bl	sensor2i(PLT)
	add	r6, sp, #7296
	add	r6, r6, #56
	mov	r1, r0
	mov	r2, r6
	mov	r0, r7
	bl	findNextSensor(PLT)
	sub	r2, r0, #1
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #28
	add	ip, r2, r3
	and	ip, ip, #15
	ldr	r5, .L388+36
	rsb	ip, r3, ip
	add	ip, ip, #1
	smull	lr, r1, r5, ip
	mov	r3, ip, asr #31
	rsb	r3, r3, r1, asr #2
	add	r1, r3, r3, asl #2
	cmp	r2, #0
	sub	ip, ip, r1, asl #1
	addlt	r2, r0, #14
	str	ip, [sp, #0]
	ldr	r1, .L388+40
	add	ip, sp, #4096
	ldr	r4, [ip, #3256]
	mov	r2, r2, asr #4
	add	r1, sl, r1
	add	r2, r2, #65
	mov	r0, #1
	str	r4, [sp, #4]
	bl	bwprintf(PLT)
	mov	r0, #10
	bl	switch2i(PLT)
	mov	r2, r6
	mov	r1, r0
	mov	r0, r7
	bl	findNextSensor(PLT)
	sub	r2, r0, #1
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #28
	add	ip, r2, r3
	and	ip, ip, #15
	rsb	ip, r3, ip
	add	ip, ip, #1
	smull	lr, r1, r5, ip
	mov	r3, ip, asr #31
	rsb	r3, r3, r1, asr #2
	add	r1, r3, r3, asl #2
	cmp	r2, #0
	sub	ip, ip, r1, asl #1
	addlt	r2, r0, #14
	str	ip, [sp, #0]
	ldr	r1, .L388+44
	add	ip, sp, #4096
	ldr	r4, [ip, #3256]
	mov	r2, r2, asr #4
	add	r1, sl, r1
	add	r2, r2, #65
	mov	r0, #1
	str	r4, [sp, #4]
	bl	bwprintf(PLT)
	mov	r0, #10
	bl	switch2i(PLT)
	mov	r2, r6
	mov	r1, r0
	mov	r0, r7
	bl	findAltSensor(PLT)
	sub	r2, r0, #1
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #28
	add	ip, r2, r3
	and	ip, ip, #15
	rsb	ip, r3, ip
	add	ip, ip, #1
	smull	lr, r1, r5, ip
	mov	r3, ip, asr #31
	rsb	r3, r3, r1, asr #2
	add	r1, r3, r3, asl #2
	cmp	r2, #0
	sub	ip, ip, r1, asl #1
	addlt	r2, r0, #14
	str	ip, [sp, #0]
	ldr	r1, .L388+48
	add	ip, sp, #4096
	ldr	r4, [ip, #3256]
	mov	r2, r2, asr #4
	add	r2, r2, #65
	add	r1, sl, r1
	mov	r0, #1
	str	r4, [sp, #4]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	ldr	r1, .L388+52
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	add	lr, sp, #4096
	mov	r3, #1
	str	r3, [lr, #3268]
	ldr	r2, [lr, #3268]
	cmp	r2, #100
	bgt	.L350
	ldr	r4, .L388+56
	b	.L351
.L352:
	add	lr, sp, #4096
	ldr	r3, [lr, #3268]
	tst	r3, #15
	beq	.L385
.L357:
	add	r0, sp, #4096
	ldr	r3, [r0, #3268]
	add	r3, r3, #1
	str	r3, [r0, #3268]
	ldr	r2, [r0, #3268]
	cmp	r2, #100
	bgt	.L350
.L351:
	add	r0, sp, #4096
	mov	r3, #1
	str	r3, [r0, #3264]
	ldr	r2, [r0, #3264]
	cmp	r2, #100
	bgt	.L352
.L370:
	add	r1, sp, #4096
	ldr	r2, [r1, #3268]
	mov	r0, #1
	ldr	r3, [r1, #3264]
	add	r1, sl, r4
	bl	bwprintf(PLT)
	add	r2, sp, #4096
	ldr	r1, [r2, #3268]
	mov	r3, r8
	ldr	r2, [r2, #3264]
	mov	r0, r7
	str	r9, [sp, #0]
	bl	getShortestPathDjikstra(PLT)
	ldr	r1, .L388+60
	cmp	r0, #0
	add	r1, sl, r1
	mov	r0, #1
	ldrne	r1, .L388+64
	movne	r0, #1
	addne	r1, sl, r1
.L382:
	bl	bwprintf(PLT)
	add	ip, sp, #4096
	ldr	r3, [ip, #3264]
	add	r3, r3, #1
	str	r3, [ip, #3264]
	ldr	r2, [ip, #3264]
	cmp	r2, #100
	ble	.L370
	add	lr, sp, #4096
	ldr	r3, [lr, #3268]
	tst	r3, #15
	bne	.L357
.L385:
	mov	r0, #1
	bl	bwgetc(PLT)
	add	r0, sp, #4096
	ldr	r3, [r0, #3268]
	add	r3, r3, #1
	str	r3, [r0, #3268]
	ldr	r2, [r0, #3268]
	cmp	r2, #100
	ble	.L351
.L350:
	bl	Exit(PLT)
	ldr	r0, .L388+68
	add	r0, sl, r0
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, .L388+72
	add	r0, sl, r0
	bl	sensor2i(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r3, r8
	mov	r0, r7
	str	r9, [sp, #0]
	bl	getShortestPathDjikstra(PLT)
	cmp	r0, #0
	beq	.L386
.L359:
	ldr	r2, [sp, #20]
	mov	r0, #1
	add	r1, sl, r2
	bl	bwprintf(PLT)
	add	r3, sp, #4096
	ldr	r0, [r3, #3260]
	add	ip, sp, #4096
	sub	r3, r0, #1
	str	r3, [ip, #3268]
	ldr	r2, [ip, #3268]
	cmp	r2, #0
	blt	.L361
	ldr	r4, .L388+16
.L362:
	add	lr, sp, #4096
	ldr	r2, [lr, #3268]
	add	r1, sp, #7360
	add	r1, r1, #12
	add	r3, r1, r2, asl #2
	ldr	r2, [r3, #-420]
	mov	r0, #1
	add	r1, sl, r4
	bl	bwprintf(PLT)
	add	r2, sp, #4096
	ldr	r3, [r2, #3268]
	sub	r3, r3, #1
	str	r3, [r2, #3268]
	ldr	r2, [r2, #3268]
	cmp	r2, #0
	bge	.L362
	add	r3, sp, #4096
	ldr	r0, [r3, #3260]
.L361:
	ldr	ip, [sp, #8]
	mov	r2, r0
	mov	r1, r8
	mov	r3, fp
	mov	r0, r7
	str	ip, [sp, #0]
	bl	getEdgeInfo(PLT)
	ldr	lr, [sp, #16]
	add	r3, sp, #4096
	ldr	r2, [r3, #3272]
	mov	r0, #1
	add	r1, sl, lr
	bl	bwprintf(PLT)
	add	ip, sp, #4096
	mov	r3, #0
	str	r3, [ip, #3268]
	ldr	r2, [ip, #3268]
	ldr	r0, [ip, #3272]
	cmp	r2, r0
	blt	.L387
.L363:
	mov	r2, #0
	add	r3, sp, #4096
	str	r2, [r3, #3268]
	ldr	r3, [r3, #3268]
	cmp	r0, r3
	movle	ip, r2
	ble	.L367
	mov	ip, r2
.L368:
	add	lr, sp, #4096
	ldr	r2, [lr, #3268]
	ldr	r3, [lr, #3268]
	add	lr, sp, #7360
	add	lr, lr, #12
	add	r1, lr, r2, asl #2
	add	r3, r3, #1
	add	r2, sp, #4096
	str	r3, [r2, #3268]
	ldr	r2, [r2, #3268]
	ldr	r3, [r1, #-820]
	cmp	r0, r2
	add	ip, ip, r3
	bgt	.L368
.L367:
	ldr	r3, [sp, #12]
	mov	r2, ip
	add	r1, sl, r3
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #204
	add	sp, sp, #7168
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L383:
	ldr	r1, .L388+76
	add	r0, r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	b	.L340
.L387:
	ldr	r4, .L388+16
.L364:
	add	lr, sp, #4096
	ldr	r2, [lr, #3268]
	add	r1, sp, #7360
	add	r1, r1, #12
	add	r3, r1, r2, asl #2
	ldr	r2, [r3, #-820]
	mov	r0, #1
	add	r1, sl, r4
	bl	bwprintf(PLT)
	add	r2, sp, #4096
	ldr	r3, [r2, #3268]
	ldr	r0, [r2, #3272]
	add	r3, r3, #1
	str	r3, [r2, #3268]
	ldr	r2, [r2, #3268]
	cmp	r2, r0
	blt	.L364
	b	.L363
.L386:
	ldr	r1, .L388+76
	add	r0, r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	b	.L359
.L384:
	ldr	r4, .L388+16
.L345:
	add	lr, sp, #4096
	ldr	r2, [lr, #3268]
	add	r1, sp, #7360
	add	r1, r1, #12
	add	r3, r1, r2, asl #2
	ldr	r2, [r3, #-820]
	mov	r0, #1
	add	r1, sl, r4
	bl	bwprintf(PLT)
	add	r2, sp, #4096
	ldr	r3, [r2, #3268]
	ldr	r0, [r2, #3272]
	add	r3, r3, #1
	str	r3, [r2, #3268]
	ldr	r2, [r2, #3268]
	cmp	r0, r2
	bgt	.L345
	b	.L344
.L389:
	.align	2
.L388:
	.word	_GLOBAL_OFFSET_TABLE_-(.L381+8)
	.word	.LC171(GOTOFF)
	.word	.LC172(GOTOFF)
	.word	.LC174(GOTOFF)
	.word	.LC175(GOTOFF)
	.word	.LC176(GOTOFF)
	.word	.LC177(GOTOFF)
	.word	.LC178(GOTOFF)
	.word	.LC179(GOTOFF)
	.word	1717986919
	.word	.LC180(GOTOFF)
	.word	.LC181(GOTOFF)
	.word	.LC182(GOTOFF)
	.word	.LC183(GOTOFF)
	.word	.LC184(GOTOFF)
	.word	.LC185(GOTOFF)
	.word	.LC186(GOTOFF)
	.word	.LC187(GOTOFF)
	.word	.LC188(GOTOFF)
	.word	.LC173(GOTOFF)
	.size	graphTestTask, .-graphTestTask
	.section	.rodata.str1.4
	.align	2
.LC189:
	.ascii	"%c%d%d.nextNode:%c%d%d \000"
	.align	2
.LC190:
	.ascii	"%c%d%d.Inverse:%c%d%d\015\012\000"
	.text
	.align	2
	.global	graphTestTask2
	.type	graphTestTask2, %function
graphTestTask2:
	@ args = 0, pretend = 0, frame = 6560
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #6528
	sub	sp, sp, #48
	ldr	sl, .L399
	add	r0, sp, #48
.L397:
	add	sl, pc, sl
	sub	r0, r0, #4
	str	r0, [sp, #16]
	bl	TrackGraphInit(PLT)
	ldr	r2, .L399+4
	ldr	r3, .L399+8
	ldr	r1, .L399+12
	add	r6, sp, #4096
	str	r2, [sp, #32]
	str	r3, [sp, #28]
	mov	r2, #1
	mov	r3, #0
	str	r3, [r6, #2476]
	str	r2, [r6, #2476]
	mov	r2, r1
	str	r1, [sp, #20]
	b	.L391
.L393:
	add	r1, sp, #4096
	ldr	r3, [r1, #2476]
	ldr	r2, [sp, #20]
	add	r3, r3, #1
	str	r3, [r1, #2476]
.L391:
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r6, sp, #4096
	ldr	r3, [r6, #2476]
	cmp	r0, r3
	blt	.L398
	add	r0, sp, #4096
	ldr	r0, [r0, #2476]
	add	r1, sp, #4096
	add	r6, sp, #4096
	ldr	r3, [r1, #2476]
	str	r0, [sp, #36]
	ldr	r5, [r1, #2476]
	ldr	r0, [sp, #16]
	ldr	r7, [r1, #2476]
	ldr	r1, [r1, #2476]
	ldr	r2, [r6, #2476]
	add	r1, r0, r1, asl #6
	add	r2, r0, r2, asl #6
	ldr	r4, [r2, #16]
	ldr	ip, [r1, #16]
	sub	r3, r3, #1
	sub	r5, r5, #1
	sub	r4, r4, #1
	sub	ip, ip, #1
	mov	r0, r3, asr #31
	mov	r0, r0, lsr #28
	mov	r2, r5, asr #31
	mov	r1, r4, asr #31
	mov	lr, ip, asr #31
	mov	r2, r2, lsr #28
	mov	r1, r1, lsr #28
	mov	lr, lr, lsr #28
	add	r3, r3, r0
	add	r5, r5, r2
	add	r4, r4, r1
	add	ip, ip, lr
	and	r3, r3, #15
	rsb	r3, r0, r3
	and	r5, r5, #15
	ldr	r0, [sp, #16]
	and	r4, r4, #15
	and	ip, ip, #15
	rsb	r5, r2, r5
	rsb	r4, r1, r4
	rsb	ip, lr, ip
	ldr	r1, .L399+16
	add	r5, r5, #1
	add	r4, r4, #1
	add	r7, r0, r7, asl #6
	add	r3, r3, #1
	add	ip, ip, #1
	smull	r2, fp, r1, r5
	smull	r6, r9, r1, r4
	smull	r2, r8, r1, r3
	ldr	r6, [r7, #16]
	smull	r0, r7, r1, ip
	ldr	r1, [sp, #36]
	mov	r0, r4, asr #31
	subs	r2, r1, #1
	addmi	r2, r1, #14
	subs	lr, r6, #1
	mov	r1, r5, asr #31
	addmi	lr, r6, #14
	rsb	r1, r1, fp, asr #2
	ldr	r6, [sp, #32]
	rsb	r0, r0, r9, asr #2
	add	r1, r1, r1, asl #2
	add	r0, r0, r0, asl #2
	mov	r2, r2, asr #4
	mov	r3, r3, asr #31
	mov	lr, lr, asr #4
	mov	ip, ip, asr #31
	rsb	ip, ip, r7, asr #2
	sub	r5, r5, r1, asl #1
	sub	r4, r4, r0, asl #1
	add	lr, lr, #65
	add	r1, sl, r6
	rsb	r3, r3, r8, asr #2
	add	r2, r2, #65
	mov	r0, #1
	stmia	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #8]
	str	r4, [sp, #12]
	bl	bwprintf(PLT)
	add	r0, sp, #4096
	ldr	r0, [r0, #2476]
	add	r1, sp, #4096
	add	r6, sp, #4096
	ldr	r3, [r1, #2476]
	str	r0, [sp, #40]
	ldr	r5, [r1, #2476]
	ldr	r0, [sp, #16]
	ldr	r7, [r1, #2476]
	ldr	r1, [r1, #2476]
	ldr	r2, [r6, #2476]
	add	r1, r0, r1, asl #6
	add	r2, r0, r2, asl #6
	ldr	r4, [r2, #24]
	sub	r5, r5, #1
	sub	r4, r4, #1
	sub	r3, r3, #1
	ldr	ip, [r1, #24]
	mov	r2, r5, asr #31
	mov	r1, r4, asr #31
	mov	r0, r3, asr #31
	mov	r2, r2, lsr #28
	mov	r1, r1, lsr #28
	mov	r0, r0, lsr #28
	add	r5, r5, r2
	add	r4, r4, r1
	add	r3, r3, r0
	sub	ip, ip, #1
	and	r5, r5, #15
	and	r4, r4, #15
	and	r3, r3, #15
	rsb	r5, r2, r5
	mov	lr, ip, asr #31
	rsb	r4, r1, r4
	rsb	r3, r0, r3
	ldr	r1, .L399+16
	ldr	r0, [sp, #16]
	mov	lr, lr, lsr #28
	add	r5, r5, #1
	add	r3, r3, #1
	smull	r2, fp, r1, r5
	add	r7, r0, r7, asl #6
	add	ip, ip, lr
	smull	r0, r2, r1, r3
	and	ip, ip, #15
	add	r4, r4, #1
	rsb	ip, lr, ip
	smull	r6, r9, r1, r4
	ldr	r0, [sp, #40]
	add	ip, ip, #1
	ldr	r6, [r7, #24]
	str	r2, [sp, #24]
	smull	r2, r7, r1, ip
	mov	r1, r5, asr #31
	subs	r2, r0, #1
	rsb	r1, r1, fp, asr #2
	addmi	r2, r0, #14
	add	r1, r1, r1, asl #2
	subs	lr, r6, #1
	mov	r0, r4, asr #31
	addmi	lr, r6, #14
	sub	r5, r5, r1, asl #1
	ldr	r6, [sp, #28]
	ldr	r1, [sp, #24]
	rsb	r0, r0, r9, asr #2
	add	r0, r0, r0, asl #2
	mov	r2, r2, asr #4
	mov	r3, r3, asr #31
	mov	lr, lr, asr #4
	mov	ip, ip, asr #31
	rsb	r3, r3, r1, asr #2
	rsb	ip, ip, r7, asr #2
	sub	r4, r4, r0, asl #1
	add	lr, lr, #65
	mov	r0, #1
	add	r2, r2, #65
	add	r1, sl, r6
	stmia	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #8]
	str	r4, [sp, #12]
	bl	bwprintf(PLT)
	add	r0, sp, #4096
	ldr	r3, [r0, #2476]
	tst	r3, #15
	bne	.L393
	mov	r0, #1
	bl	bwgetc(PLT)
	b	.L393
.L398:
	bl	Exit(PLT)
	add	sp, sp, #2480
	add	sp, sp, #4096
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L400:
	.align	2
.L399:
	.word	_GLOBAL_OFFSET_TABLE_-(.L397+8)
	.word	.LC189(GOTOFF)
	.word	.LC190(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	1717986919
	.size	graphTestTask2, .-graphTestTask2
	.align	2
	.global	drawTrackB
	.type	drawTrackB, %function
drawTrackB:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	bx	lr
	.size	drawTrackB, .-drawTrackB
	.section	.rodata.str1.4
	.align	2
.LC191:
	.ascii	"after rply temp1 %c \012\015\000"
	.text
	.align	2
	.global	testStructS
	.type	testStructS, %function
testStructS:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	mov	r3, #0
	sub	sp, sp, #52
	mov	r2, #66
	ldr	sl, .L410
	strb	r3, [sp, #4]
	strb	r2, [sp, #5]
	add	r3, r3, #67
	add	r2, r2, #2
	strb	r2, [sp, #7]
	strb	r3, [sp, #6]
	sub	r2, r2, #67
	add	r1, sp, #12
.L409:
	add	sl, pc, sl
.L404:
	rsb	r3, r2, #11
	add	r2, r2, #1
	cmp	r2, #11
	str	r3, [r1, #-4]
	add	r1, r1, #4
	bne	.L404
	mov	ip, #48
	add	r1, sp, #4
	mov	r2, ip
	mov	r3, r1
	mov	lr, #81
	mov	r0, #1
	strb	lr, [sp, #48]
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r1, .L410+4
	mov	r0, #1
	add	r1, sl, r1
	ldrb	r2, [sp, #48]	@ zero_extendqisi2
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #52
	ldmfd	sp!, {sl, pc}
.L411:
	.align	2
.L410:
	.word	_GLOBAL_OFFSET_TABLE_-(.L409+8)
	.word	.LC191(GOTOFF)
	.size	testStructS, .-testStructS
	.section	.rodata.str1.4
	.align	2
.LC192:
	.ascii	"%c\012\015\000"
	.align	2
.LC193:
	.ascii	"temp1 %c \012\015\000"
	.align	2
.LC194:
	.ascii	"msg type 3rd %c \012\015\000"
	.align	2
.LC195:
	.ascii	"value[3]:%d \012\015\000"
	.text
	.align	2
	.global	testStructR
	.type	testStructR, %function
testStructR:
	@ args = 0, pretend = 0, frame = 116
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L419
	sub	sp, sp, #116
	add	r0, sp, #116
	mov	r3, #0
.L417:
	add	sl, pc, sl
	mov	r1, sp
	str	r3, [r0, #-4]!
	mov	r2, #64
	bl	Receive(PLT)
	ldr	r1, .L419+4
	cmp	r0, #0
	mov	r4, sp
	add	r1, sl, r1
	mov	r0, #1
	blt	.L413
	ldrb	r2, [sp, #0]	@ zero_extendqisi2
	bl	bwprintf(PLT)
	ldrb	r3, [sp, #0]	@ zero_extendqisi2
	add	r5, sp, #64
	cmp	r3, #0
	mov	r1, sp
	mov	r0, r5
	mov	r2, #48
	beq	.L418
.L413:
	bl	Exit(PLT)
	add	sp, sp, #116
	ldmfd	sp!, {r4, r5, sl, pc}
.L418:
	bl	pkmemcpy(PLT)
	ldr	r1, .L419+8
	ldrb	r2, [sp, #108]	@ zero_extendqisi2
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L419+12
	ldrb	r2, [sp, #66]	@ zero_extendqisi2
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L419+16
	ldr	r2, [sp, #80]
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r3, #88
	mov	r1, r5
	mov	r2, #48
	ldr	r0, [sp, #112]
	strb	r3, [sp, #108]
	bl	Reply(PLT)
	b	.L413
.L420:
	.align	2
.L419:
	.word	_GLOBAL_OFFSET_TABLE_-(.L417+8)
	.word	.LC192(GOTOFF)
	.word	.LC193(GOTOFF)
	.word	.LC194(GOTOFF)
	.word	.LC195(GOTOFF)
	.size	testStructR, .-testStructR
	.align	2
	.global	testStructPass
	.type	testStructPass, %function
testStructPass:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L424
	ldr	r3, .L424+4
.L423:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #6
	bl	Create(PLT)
	ldr	r3, .L424+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L425:
	.align	2
.L424:
	.word	_GLOBAL_OFFSET_TABLE_-(.L423+8)
	.word	testStructR(GOT)
	.word	testStructS(GOT)
	.size	testStructPass, .-testStructPass
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L429
.L428:
	add	sl, pc, sl
	MRC p15, 0, r0, c1, c0, 0 
ORR r0, r0, #0x1 <<30 
ORR r0, r0, #0x1 <<12 
ORR r0, r0, #0x1 <<2 
MCR p15, 0, r0, c1, c0, 0 

	ldr	r3, .L429+4
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	kernelRun(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L430:
	.align	2
.L429:
	.word	_GLOBAL_OFFSET_TABLE_-(.L428+8)
	.word	testTrackPathRevAndEX(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
