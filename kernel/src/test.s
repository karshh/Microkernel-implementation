	.file	"test.c"
	.text
	.align	2
	.global	displayTrack
	.type	displayTrack, %function
displayTrack:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	bx	lr
	.size	displayTrack, .-displayTrack
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"USER TASK 3 EXIT, REQUESTING TID.\015\012\000"
	.align	2
.LC1:
	.ascii	"USER TASK 3 GOT TID = %d.\015\012\000"
	.align	2
.LC2:
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
	ldr	sl, .L6
	ldr	r1, .L6+4
.L5:
	add	sl, pc, sl
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	ldr	r1, .L6+8
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L6+12
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	userTask3, .-userTask3
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"USER TASK 2 MIDDLE \015\012\000"
	.align	2
.LC4:
	.ascii	"USER TASK 2 EXIT, REQUESTING TID.\015\012\000"
	.align	2
.LC5:
	.ascii	"USER TASK 2 GOT TID = %d.\015\012\000"
	.align	2
.LC6:
	.ascii	"USER TASK 2 EXIT, REQUESTING Parent TID.\015\012\000"
	.align	2
.LC7:
	.ascii	"USER TASK 2 GOT Parent TID = %d.\015\012\000"
	.align	2
.LC8:
	.ascii	"USER TASK 2 EXIT, REQUESTING to Pass the train.\015"
	.ascii	"\012\000"
	.align	2
.LC9:
	.ascii	"USER TASK has had a nap but is awake  \015\012\000"
	.align	2
.LC10:
	.ascii	"USER TASK 2 EXIT, REQUESTING to birth a child.\015\012"
	.ascii	"\000"
	.align	2
.LC11:
	.ascii	"USER TASK 2' child never born. no father: %d.\015\012"
	.ascii	"\000"
	.align	2
.LC12:
	.ascii	"world is overpopulated. train gods refuse Task's 2 "
	.ascii	"offer: %d.\015\012\000"
	.align	2
.LC13:
	.ascii	"USER TASK 2 gave birth to a bouncing baby task name"
	.ascii	"d: %d.\015\012\000"
	.align	2
.LC14:
	.ascii	"USER TASK 2's fucked up when fucking: %d.\015\012\000"
	.align	2
.LC15:
	.ascii	"USER TASK 2 EXIT, REQUESTING to get off the train.\015"
	.ascii	"\012\000"
	.align	2
.LC16:
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
	ldr	sl, .L25
	ldr	r1, .L25+4
.L21:
	add	sl, pc, sl
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r1, .L25+8
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	ldr	r1, .L25+12
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L25+16
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	ldr	r1, .L25+20
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L25+24
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L25+28
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r6, .L25+32
	ldr	r5, .L25+36
	mov	r4, #2
.L9:
	add	r1, sl, r6
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, [sl, r5]
	mov	r0, #3
	bl	Create(PLT)
	ldr	r1, .L25+40
	mov	r3, r0
	cmn	r3, #1
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	beq	.L22
	ldr	r1, .L25+44
	cmn	r3, #2
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	beq	.L22
	ldr	r1, .L25+48
	cmp	r3, #0
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	blt	.L24
.L22:
	bl	bwprintf(PLT)
	subs	r4, r4, #1
	bne	.L9
	ldr	r1, .L25+52
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	ldr	r1, .L25+56
	mov	r0, #1
	add	r1, sl, r1
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	bwprintf(PLT)
.L24:
	ldr	r1, .L25+60
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	b	.L22
.L26:
	.align	2
.L25:
	.word	_GLOBAL_OFFSET_TABLE_-(.L21+8)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	userTask3(GOT)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC14(GOTOFF)
	.size	userTask2, .-userTask2
	.section	.rodata.str1.4
	.align	2
.LC17:
	.ascii	"USER TASK 1 MIDDLE \015\012\000"
	.align	2
.LC18:
	.ascii	"USER TASK 1 EXIT, REQUESTING TID.\015\012\000"
	.align	2
.LC19:
	.ascii	"USER TASK 1 GOT TID = %d.\015\012\000"
	.align	2
.LC20:
	.ascii	"USER TASK 1 EXIT, REQUESTING Parent TID.\015\012\000"
	.align	2
.LC21:
	.ascii	"USER TASK 1 GOT Parent TID = %d.\015\012\000"
	.align	2
.LC22:
	.ascii	"USER TASK 1 EXIT, REQUESTING to Pass the train.\015"
	.ascii	"\012\000"
	.align	2
.LC23:
	.ascii	"USER TASK 1 EXIT, REQUESTING to birth a child.\015\012"
	.ascii	"\000"
	.align	2
.LC24:
	.ascii	"USER TASK 1' child never born. no father: %d.\015\012"
	.ascii	"\000"
	.align	2
.LC25:
	.ascii	"world is overpopulated. train gods refuse Task's 1o"
	.ascii	"ffer: %d.\015\012\000"
	.align	2
.LC26:
	.ascii	"USER TASK 1gave birth to a bouncing baby task named"
	.ascii	": %d.\015\012\000"
	.align	2
.LC27:
	.ascii	"USER TASK 1's fucked up when fucking: %d.\015\012\000"
	.align	2
.LC28:
	.ascii	"USER TASK 1 EXIT, REQUESTING to get off the train.\015"
	.ascii	"\012\000"
	.align	2
.LC29:
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
	ldr	sl, .L43
	ldr	r1, .L43+4
.L40:
	add	sl, pc, sl
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r1, .L43+8
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	ldr	r1, .L43+12
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L43+16
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	ldr	r1, .L43+20
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L43+24
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L43+28
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r6, .L43+32
	ldr	r5, .L43+36
	mov	r4, #0
	b	.L28
.L41:
	bl	bwprintf(PLT)
	cmp	r4, #150
	beq	.L42
.L28:
	add	r1, sl, r6
	mov	r0, #1
	add	r4, r4, #1
	bl	bwprintf(PLT)
	ldr	r1, [sl, r5]
	mov	r0, r4
	bl	Create(PLT)
	ldr	r1, .L43+40
	mov	r3, r0
	cmn	r3, #1
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	beq	.L41
	ldr	r1, .L43+44
	cmn	r3, #2
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	beq	.L41
	ldr	r1, .L43+48
	cmp	r3, #0
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	bge	.L41
	ldr	r1, .L43+52
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	cmp	r4, #150
	bne	.L28
.L42:
	ldr	r1, .L43+56
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	ldr	r1, .L43+60
	mov	r0, #1
	add	r1, sl, r1
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	bwprintf(PLT)
.L44:
	.align	2
.L43:
	.word	_GLOBAL_OFFSET_TABLE_-(.L40+8)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	userTask3(GOT)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC29(GOTOFF)
	.size	userTask1, .-userTask1
	.section	.rodata.str1.4
	.align	2
.LC30:
	.ascii	"<%d>: Sending a message to %d: %s.\015\012\000"
	.align	2
.LC31:
	.ascii	"Hi!\000"
	.align	2
.LC32:
	.ascii	"<%d>: Send-recieve-reply transaction failed.\015\012"
	.ascii	"\000"
	.align	2
.LC33:
	.ascii	"<%d>: Invalid Task %d.\015\012\000"
	.align	2
.LC34:
	.ascii	"<%d>: Got the following reply: %s[%d].\015\012\000"
	.text
	.align	2
	.global	userTask61
	.type	userTask61, %function
userTask61:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L55
	sub	sp, sp, #12
.L52:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L55+4
	ldr	r1, .L55+8
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
	ldr	r1, .L55+12
	mov	ip, r0
	cmn	ip, #3
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, #1
	beq	.L53
	ldr	r1, .L55+16
	cmn	ip, #2
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, #1
	mov	r3, #2
	beq	.L54
	ldr	r1, .L55+20
	mov	r2, r5
	add	r1, sl, r1
	mov	r3, r6
	mov	r0, #1
	str	ip, [sp, #0]
	bl	bwprintf(PLT)
.L48:
	bl	Exit(PLT)
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L54:
	bl	bwprintf(PLT)
	b	.L48
.L53:
	bl	bwprintf(PLT)
	b	.L48
.L56:
	.align	2
.L55:
	.word	_GLOBAL_OFFSET_TABLE_-(.L52+8)
	.word	.LC31(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.size	userTask61, .-userTask61
	.section	.rodata.str1.4
	.align	2
.LC35:
	.ascii	"<%d>: Requesting a message.\015\012\000"
	.align	2
.LC36:
	.ascii	"<%d>: Got the following message from %d: %s.\015\012"
	.ascii	"\000"
	.align	2
.LC37:
	.ascii	"<%d>: Replying the following: %s.\015\012\000"
	.align	2
.LC38:
	.ascii	"Bye!\000"
	.align	2
.LC39:
	.ascii	"<%d>: Exitting now.\015\012\000"
	.text
	.align	2
	.global	userTask62
	.type	userTask62, %function
userTask62:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L60
	sub	sp, sp, #16
.L59:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L60+4
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
	ldr	r1, .L60+8
	ldr	r3, [sp, #12]
	add	r1, sl, r1
	mov	r2, r5
	mov	r0, #1
	str	r4, [sp, #0]
	bl	bwprintf(PLT)
	ldr	r3, .L60+12
	ldr	r1, .L60+16
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
	ldr	r1, .L60+20
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, sl, pc}
.L61:
	.align	2
.L60:
	.word	_GLOBAL_OFFSET_TABLE_-(.L59+8)
	.word	.LC35(GOTOFF)
	.word	.LC36(GOTOFF)
	.word	.LC38(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	.LC39(GOTOFF)
	.size	userTask62, .-userTask62
	.section	.rodata.str1.4
	.align	2
.LC40:
	.ascii	"<%d>: Creating 2 children. \015\012\000"
	.align	2
.LC41:
	.ascii	"<%d>: Created %d. \015\012\000"
	.text
	.align	2
	.global	userTask60
	.type	userTask60, %function
userTask60:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L65
.L64:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L65+4
	mov	r4, r0
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L65+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L65+12
	mov	r3, r0
	add	r5, sl, r2
	mov	r1, r5
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L65+16
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
.L66:
	.align	2
.L65:
	.word	_GLOBAL_OFFSET_TABLE_-(.L64+8)
	.word	.LC40(GOTOFF)
	.word	userTask61(GOT)
	.word	.LC41(GOTOFF)
	.word	userTask62(GOT)
	.size	userTask60, .-userTask60
	.section	.rodata.str1.4
	.align	2
.LC42:
	.ascii	"<%d> got tid, now passing passing \012\015\000"
	.align	2
.LC43:
	.ascii	"<%d> finished passing Going to register name as TAS"
	.ascii	"K1 \012\015\000"
	.align	2
.LC44:
	.ascii	"TASK1\000"
	.align	2
.LC45:
	.ascii	"<%d> returned for register command. result:%d  \012"
	.ascii	"\015\000"
	.align	2
.LC46:
	.ascii	"<%d> searching for THE MAN \012\015\000"
	.align	2
.LC47:
	.ascii	"THE MAN\000"
	.align	2
.LC48:
	.ascii	"<%d>searched for THE MAN:%d \012\015\000"
	.align	2
.LC49:
	.ascii	"<%d> searching for TASK2 \012\015\000"
	.align	2
.LC50:
	.ascii	"TASK2\000"
	.align	2
.LC51:
	.ascii	"<%d>searched for TASK2:%d \012\015\000"
	.align	2
.LC52:
	.ascii	"<%d> exiting  \012\015\000"
	.text
	.align	2
	.global	userTaskClient
	.type	userTaskClient, %function
userTaskClient:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L70
.L69:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L70+4
	mov	r4, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L70+8
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L70+12
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r1, .L70+16
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L70+20
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L70+24
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L70+28
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L70+32
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L70+36
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L70+40
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L70+44
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, sl, lr}
	b	Exit(PLT)
.L71:
	.align	2
.L70:
	.word	_GLOBAL_OFFSET_TABLE_-(.L69+8)
	.word	.LC42(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	.LC45(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC48(GOTOFF)
	.word	.LC49(GOTOFF)
	.word	.LC50(GOTOFF)
	.word	.LC51(GOTOFF)
	.word	.LC52(GOTOFF)
	.size	userTaskClient, .-userTaskClient
	.section	.rodata.str1.4
	.align	2
.LC53:
	.ascii	"<%d> got tid, now passing \012\015\000"
	.align	2
.LC54:
	.ascii	"<%d> finished passing Going to register name as TAS"
	.ascii	"K2 \012\015\000"
	.align	2
.LC55:
	.ascii	"<%d> returned for register command. result: %d \012"
	.ascii	"\015\000"
	.align	2
.LC56:
	.ascii	"<%d> searching for TASK3 \012\015\000"
	.align	2
.LC57:
	.ascii	"TASK3\000"
	.align	2
.LC58:
	.ascii	"<%d>searched for TASK3:%d \012\015\000"
	.text
	.align	2
	.global	userTaskClient1
	.type	userTaskClient1, %function
userTaskClient1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L75
.L74:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L75+4
	mov	r4, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L75+8
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L75+12
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r1, .L75+16
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L75+20
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L75+24
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L75+28
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L75+32
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L75+36
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L75+40
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L75+44
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, sl, lr}
	b	Exit(PLT)
.L76:
	.align	2
.L75:
	.word	_GLOBAL_OFFSET_TABLE_-(.L74+8)
	.word	.LC53(GOTOFF)
	.word	.LC54(GOTOFF)
	.word	.LC50(GOTOFF)
	.word	.LC55(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC48(GOTOFF)
	.word	.LC56(GOTOFF)
	.word	.LC57(GOTOFF)
	.word	.LC58(GOTOFF)
	.word	.LC52(GOTOFF)
	.size	userTaskClient1, .-userTaskClient1
	.section	.rodata.str1.4
	.align	2
.LC59:
	.ascii	"<%d> finished passing Going to register name as TAS"
	.ascii	"K3 \012\015\000"
	.align	2
.LC60:
	.ascii	"<%d> searching for TASK1 \012\015\000"
	.align	2
.LC61:
	.ascii	"<%d>searched for TASK1:%d \012\015\000"
	.text
	.align	2
	.global	userTaskClient2
	.type	userTaskClient2, %function
userTaskClient2:
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
	.word	.LC53(GOTOFF)
	.word	.LC59(GOTOFF)
	.word	.LC57(GOTOFF)
	.word	.LC55(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC48(GOTOFF)
	.word	.LC60(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	.LC61(GOTOFF)
	.word	.LC52(GOTOFF)
	.size	userTaskClient2, .-userTaskClient2
	.section	.rodata.str1.4
	.align	2
.LC62:
	.ascii	"<%d>: Creating name server 1:%d. \015\012\000"
	.align	2
.LC63:
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
	ldr	sl, .L85
.L84:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L85+4
	mov	r5, r0
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	CreateNameServer(PLT)
	ldr	r1, .L85+8
	mov	r2, r5
	mov	r3, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L85+12
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L85+16
	mov	r3, r0
	add	r4, sl, r2
	mov	r1, r4
	mov	r2, r5
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L85+20
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mov	r2, r5
	mov	r3, r0
	mov	r1, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L85+24
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
.L86:
	.align	2
.L85:
	.word	_GLOBAL_OFFSET_TABLE_-(.L84+8)
	.word	NameServerTask(GOT)
	.word	.LC62(GOTOFF)
	.word	userTaskClient(GOT)
	.word	.LC63(GOTOFF)
	.word	userTaskClient1(GOT)
	.word	userTaskClient2(GOT)
	.size	userTask01, .-userTask01
	.section	.rodata.str1.4
	.align	2
.LC64:
	.ascii	"BOOK\000"
	.align	2
.LC65:
	.ascii	"Seaching empty dictionary for [BOOK]  %d.\015\012\000"
	.align	2
.LC66:
	.ascii	"Search results %d.\015\012\000"
	.align	2
.LC67:
	.ascii	"ADDING  [BOOK] for tid 1 %d.\015\012\000"
	.align	2
.LC68:
	.ascii	"BOOK1\000"
	.align	2
.LC69:
	.ascii	"ADDING  [BOOK1] for tid 1 %d.\015\012\000"
	.align	2
.LC70:
	.ascii	"BOOKW\000"
	.align	2
.LC71:
	.ascii	"ADDING  [BOOKW] for tid 1 %d.\015\012\000"
	.align	2
.LC72:
	.ascii	"BOOK2\000"
	.align	2
.LC73:
	.ascii	"ADDING  [BOOK2] for tid 2 %d.\015\012\000"
	.align	2
.LC74:
	.ascii	"Seaching dictionary for [BOOK1]  %d.\015\012\000"
	.align	2
.LC75:
	.ascii	"Seaching dictionary for [BOOKW]  %d.\015\012\000"
	.align	2
.LC76:
	.ascii	"Seaching dictionary for [BOOK2]  %d.\015\012\000"
	.align	2
.LC77:
	.ascii	"ADDING  [BOOKW] for tid 2 %d.\015\012\000"
	.align	2
.LC78:
	.ascii	"testing errors in C %d.\015\012\000"
	.text
	.align	2
	.global	userTask11
	.type	userTask11, %function
userTask11:
	@ args = 0, pretend = 0, frame = 9508
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L90
	sub	sp, sp, #9472
.L89:
	add	sl, pc, sl
	sub	sp, sp, #36
	bl	MyTid(PLT)
	ldr	r3, .L90+4
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
	ldr	r3, .L90+8
	mov	r2, r5
	add	r6, sl, r3
	mov	r1, r6
	mov	r0, r4
	bl	searchDictionary(PLT)
	ldr	r3, .L90+12
	mov	r2, r0
	add	r3, sl, r3
	mov	r1, r3
	mov	r0, #1
	str	r3, [sp, #0]
	bl	bwprintf(PLT)
	ldr	r3, .L90+16
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
	ldr	r1, .L90+20
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L90+24
	mov	r2, #1
	add	r9, sl, r3
	mov	r1, r9
	mov	r0, r4
	bl	addDictionary(PLT)
	ldr	r1, .L90+28
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L90+32
	mov	r2, #1
	add	fp, sl, r3
	mov	r1, fp
	mov	r0, r4
	bl	addDictionary(PLT)
	ldr	r1, .L90+36
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L90+40
	mov	r2, #2
	add	r8, sl, r3
	mov	r1, r8
	mov	r0, r4
	bl	addDictionary(PLT)
	ldr	r1, .L90+44
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
	ldr	r1, .L90+48
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
	ldr	r1, .L90+52
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
	ldr	r3, .L90+56
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
	ldr	r1, .L90+60
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
	ldr	r3, .L90+64
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
.L91:
	.align	2
.L90:
	.word	_GLOBAL_OFFSET_TABLE_-(.L89+8)
	.word	.LC19(GOTOFF)
	.word	.LC64(GOTOFF)
	.word	.LC65(GOTOFF)
	.word	.LC66(GOTOFF)
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
	.word	.LC78(GOTOFF)
	.size	userTask11, .-userTask11
	.section	.rodata.str1.4
	.align	2
.LC79:
	.ascii	"%d\015\012\000"
	.text
	.align	2
	.global	userinfinitiPass
	.type	userinfinitiPass, %function
userinfinitiPass:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L99
	ldr	r6, .L99+4
	ldr	r5, .L99+8
	mov	r4, #0
.L98:
	add	sl, pc, sl
.L93:
	mov	r2, r4
	mov	r0, #1
	add	r4, r4, #1
	add	r1, sl, r6
	bl	bwprintf(PLT)
	cmp	r4, r5
	bne	.L93
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	Exit(PLT)
.L100:
	.align	2
.L99:
	.word	_GLOBAL_OFFSET_TABLE_-(.L98+8)
	.word	.LC79(GOTOFF)
	.word	10000
	.size	userinfinitiPass, .-userinfinitiPass
	.section	.rodata.str1.4
	.align	2
.LC80:
	.ascii	"creating infiniPass \012\015\000"
	.align	2
.LC81:
	.ascii	"CPSR :%x\012\015\000"
	.align	2
.LC82:
	.ascii	"a :%d\012\015\000"
	.align	2
.LC83:
	.ascii	"taskTest try:%d\012\015\000"
	.align	2
.LC84:
	.ascii	"returned from await:%d\012\015\000"
	.text
	.align	2
	.global	taskTestInt
	.type	taskTestInt, %function
taskTestInt:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L108
	ldr	r1, .L108+4
.L107:
	add	sl, pc, sl
	sub	sp, sp, #4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L108+8
	mov	r0, #31
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mrs r3, cpsr
	ldr	r1, .L108+12
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L108+16
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
	ldr	r6, .L108+20
	ldr	r5, .L108+24
	mov	r4, #0
.L102:
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
	bne	.L102
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	Exit(PLT)
.L109:
	.align	2
.L108:
	.word	_GLOBAL_OFFSET_TABLE_-(.L107+8)
	.word	.LC80(GOTOFF)
	.word	userinfinitiPass(GOT)
	.word	.LC81(GOTOFF)
	.word	.LC82(GOTOFF)
	.word	.LC83(GOTOFF)
	.word	.LC84(GOTOFF)
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
	ldr	r0, .L115
	bl	startTimer(PLT)
	mov	r3, #0
	str	r3, [sp, #0]
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	ldr	r3, .L115+4
	cmp	r2, r3
	bgt	.L111
	mov	r1, r3
.L112:
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	cmp	r2, r1
	ble	.L112
.L111:
	add	sp, sp, #4
	ldr	lr, [sp], #4
	b	Exit(PLT)
.L116:
	.align	2
.L115:
	.word	-2139029504
	.word	9999
	.size	taskTestInt2, .-taskTestInt2
	.section	.rodata.str1.4
	.align	2
.LC85:
	.ascii	"ioServer\000"
	.align	2
.LC86:
	.ascii	"The trains controller switch should turn on and off"
	.ascii	" 3 times now..\015\012\000"
	.align	2
.LC87:
	.ascii	"\033[2J\000"
	.align	2
.LC88:
	.ascii	"Printing a long message:\015\012\015\012\000"
	.align	2
.LC89:
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
.LC90:
	.ascii	"Type something here --> \000"
	.text
	.align	2
	.global	testTaskIO1
	.type	testTaskIO1, %function
testTaskIO1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L121
	ldr	r3, .L121+4
.L120:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	Create(PLT)
	ldr	r0, .L121+8
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L121+12
	mov	r1, #1
	add	r2, sl, r2
	mov	r4, r0
	bl	Printf(PLT)
	ldr	r2, .L121+16
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
	ldr	r2, .L121+20
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L121+24
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L121+28
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
.L118:
	mov	r0, r4
	mov	r1, #1
	bl	Getc(PLT)
	mov	r1, #1
	mov	r2, r0
	mov	r0, r4
	bl	Putc(PLT)
	b	.L118
.L122:
	.align	2
.L121:
	.word	_GLOBAL_OFFSET_TABLE_-(.L120+8)
	.word	FirstUserTask(GOT)
	.word	.LC85(GOTOFF)
	.word	.LC86(GOTOFF)
	.word	.LC87(GOTOFF)
	.word	.LC88(GOTOFF)
	.word	.LC89(GOTOFF)
	.word	.LC90(GOTOFF)
	.size	testTaskIO1, .-testTaskIO1
	.align	2
	.global	kernelTest
	.type	kernelTest, %function
kernelTest:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L126
	ldr	r3, .L126+4
.L125:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	Create(PLT)
	ldr	r3, .L126+8
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L126+12
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L126+16
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L126+20
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L127:
	.align	2
.L126:
	.word	_GLOBAL_OFFSET_TABLE_-(.L125+8)
	.word	FirstUserTask(GOT)
	.word	displayGrid(GOT)
	.word	trainServer(GOT)
	.word	displayClock(GOT)
	.word	displaySensors(GOT)
	.size	kernelTest, .-kernelTest
	.section	.rodata.str1.4
	.align	2
.LC91:
	.ascii	"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
	.ascii	"bbbbbbbbbbbb\000"
	.align	2
.LC92:
	.ascii	"TEST FAILED!\015\012\000"
	.align	2
.LC93:
	.ascii	"Ticks taken to complete: %d\015\012\000"
	.text
	.align	2
	.global	testTaskSend64
	.type	testTaskSend64, %function
testTaskSend64:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L131
	mov	r1, #0
.L130:
	add	sl, pc, sl
	sub	sp, sp, #68
	mov	r2, r1
	mov	r3, r1
	ldr	r0, .L131+4
	bl	startTimer(PLT)
	bl	Pass(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	ldr	r1, .L131+8
	mov	ip, #64
	mov	r2, ip
	add	r3, sp, #4
	mov	r4, r0
	add	r1, sl, r1
	mov	r0, #2
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L131+12
	mvn	r0, r0
	add	r2, sl, r2
	mov	r1, #1
	mov	r0, r0, lsr #31
	bl	bwassert(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	ldr	r1, .L131+16
	rsb	r2, r4, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #68
	ldmfd	sp!, {r4, sl, pc}
.L132:
	.align	2
.L131:
	.word	_GLOBAL_OFFSET_TABLE_-(.L130+8)
	.word	-2139029404
	.word	.LC91(GOTOFF)
	.word	.LC92(GOTOFF)
	.word	.LC93(GOTOFF)
	.size	testTaskSend64, .-testTaskSend64
	.section	.rodata.str1.4
	.align	2
.LC94:
	.ascii	"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
	.ascii	"aaaaaaaaaaaa\000"
	.text
	.align	2
	.global	testTaskReceive64
	.type	testTaskReceive64, %function
testTaskReceive64:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L138
	sub	sp, sp, #68
	add	r0, sp, #68
	mov	r3, #0
.L137:
	add	sl, pc, sl
	mov	r1, sp
	mov	r2, #64
	str	r3, [r0, #-4]!
	bl	Receive(PLT)
	ldr	r1, .L138+4
	cmp	r0, #0
	add	r1, sl, r1
	mov	r2, #64
	ldrge	r0, [sp, #64]
	blge	Reply(PLT)
.L134:
	bl	Exit(PLT)
	add	sp, sp, #68
	ldmfd	sp!, {sl, pc}
.L139:
	.align	2
.L138:
	.word	_GLOBAL_OFFSET_TABLE_-(.L137+8)
	.word	.LC94(GOTOFF)
	.size	testTaskReceive64, .-testTaskReceive64
	.align	2
	.global	testTaskGod64
	.type	testTaskGod64, %function
testTaskGod64:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L143
	ldr	r3, .L143+4
.L142:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #6
	bl	Create(PLT)
	ldr	r3, .L143+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L144:
	.align	2
.L143:
	.word	_GLOBAL_OFFSET_TABLE_-(.L142+8)
	.word	testTaskSend64(GOT)
	.word	testTaskReceive64(GOT)
	.size	testTaskGod64, .-testTaskGod64
	.section	.rodata.str1.4
	.align	2
.LC95:
	.ascii	"My tid is %d\015\012\000"
	.align	2
.LC96:
	.ascii	"bbb\000"
	.text
	.align	2
	.global	testTaskSend4
	.type	testTaskSend4, %function
testTaskSend4:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L148
	sub	sp, sp, #8
.L147:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L148+4
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r1, #0
	mov	r2, r1
	mov	r3, r1
	ldr	r0, .L148+8
	bl	startTimer(PLT)
	bl	Pass(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	ldr	r1, .L148+12
	mov	ip, #4
	mov	r2, ip
	add	r3, sp, ip
	mov	r4, r0
	add	r1, sl, r1
	mov	r0, #2
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L148+16
	mvn	r0, r0
	add	r2, sl, r2
	mov	r1, #1
	mov	r0, r0, lsr #31
	bl	bwassert(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	ldr	r1, .L148+20
	rsb	r2, r4, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #8
	ldmfd	sp!, {r4, sl, pc}
.L149:
	.align	2
.L148:
	.word	_GLOBAL_OFFSET_TABLE_-(.L147+8)
	.word	.LC95(GOTOFF)
	.word	-2139029404
	.word	.LC96(GOTOFF)
	.word	.LC92(GOTOFF)
	.word	.LC93(GOTOFF)
	.size	testTaskSend4, .-testTaskSend4
	.section	.rodata.str1.4
	.align	2
.LC97:
	.ascii	"aaa\000"
	.text
	.align	2
	.global	testTaskReceive4
	.type	testTaskReceive4, %function
testTaskReceive4:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L155
	sub	sp, sp, #8
.L154:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L155+4
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r4, sp, #8
	mov	r3, #0
	str	r3, [r4, #-4]!
	bl	Pass(PLT)
	mov	r1, sp
	mov	r2, #4
	mov	r0, r4
	bl	Receive(PLT)
	ldr	r1, .L155+8
	cmp	r0, #0
	add	r1, sl, r1
	mov	r2, #4
	ldrge	r0, [sp, #4]
	blge	Reply(PLT)
.L151:
	bl	Exit(PLT)
	add	sp, sp, #8
	ldmfd	sp!, {r4, sl, pc}
.L156:
	.align	2
.L155:
	.word	_GLOBAL_OFFSET_TABLE_-(.L154+8)
	.word	.LC95(GOTOFF)
	.word	.LC97(GOTOFF)
	.size	testTaskReceive4, .-testTaskReceive4
	.align	2
	.global	testTaskGod4
	.type	testTaskGod4, %function
testTaskGod4:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L160
	ldr	r3, .L160+4
.L159:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #6
	bl	Create(PLT)
	ldr	r3, .L160+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L161:
	.align	2
.L160:
	.word	_GLOBAL_OFFSET_TABLE_-(.L159+8)
	.word	testTaskSend4(GOT)
	.word	testTaskReceive4(GOT)
	.size	testTaskGod4, .-testTaskGod4
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L165
.L164:
	add	sl, pc, sl
	MRC p15, 0, r0, c1, c0, 0 
ORR r0, r0, #0x1 <<12 
ORR r0, r0, #0x1 <<2 
MCR p15, 0, r0, c1, c0, 0 

	ldr	r3, .L165+4
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	kernelRun(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L166:
	.align	2
.L165:
	.word	_GLOBAL_OFFSET_TABLE_-(.L164+8)
	.word	FirstUserTask(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
