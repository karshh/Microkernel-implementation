	.file	"test.c"
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
	ldr	sl, .L4
	ldr	r1, .L4+4
.L3:
	add	sl, pc, sl
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	ldr	r1, .L4+8
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L4+12
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
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
	ldr	sl, .L23
	ldr	r1, .L23+4
.L19:
	add	sl, pc, sl
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r1, .L23+8
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	ldr	r1, .L23+12
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L23+16
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	ldr	r1, .L23+20
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L23+24
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L23+28
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r6, .L23+32
	ldr	r5, .L23+36
	mov	r4, #2
.L7:
	add	r1, sl, r6
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, [sl, r5]
	mov	r0, #3
	bl	Create(PLT)
	ldr	r1, .L23+40
	mov	r3, r0
	cmn	r3, #1
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	beq	.L20
	ldr	r1, .L23+44
	cmn	r3, #2
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	beq	.L20
	ldr	r1, .L23+48
	cmp	r3, #0
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	blt	.L22
.L20:
	bl	bwprintf(PLT)
	subs	r4, r4, #1
	bne	.L7
	ldr	r1, .L23+52
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	ldr	r1, .L23+56
	mov	r0, #1
	add	r1, sl, r1
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	bwprintf(PLT)
.L22:
	ldr	r1, .L23+60
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	b	.L20
.L24:
	.align	2
.L23:
	.word	_GLOBAL_OFFSET_TABLE_-(.L19+8)
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
	ldr	sl, .L41
	ldr	r1, .L41+4
.L38:
	add	sl, pc, sl
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r1, .L41+8
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	ldr	r1, .L41+12
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L41+16
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	ldr	r1, .L41+20
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L41+24
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L41+28
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldr	r6, .L41+32
	ldr	r5, .L41+36
	mov	r4, #0
	b	.L26
.L39:
	bl	bwprintf(PLT)
	cmp	r4, #150
	beq	.L40
.L26:
	add	r1, sl, r6
	mov	r0, #1
	add	r4, r4, #1
	bl	bwprintf(PLT)
	ldr	r1, [sl, r5]
	mov	r0, r4
	bl	Create(PLT)
	ldr	r1, .L41+40
	mov	r3, r0
	cmn	r3, #1
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	beq	.L39
	ldr	r1, .L41+44
	cmn	r3, #2
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	beq	.L39
	ldr	r1, .L41+48
	cmp	r3, #0
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	bge	.L39
	ldr	r1, .L41+52
	mov	r2, r3
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	cmp	r4, #150
	bne	.L26
.L40:
	ldr	r1, .L41+56
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	ldr	r1, .L41+60
	mov	r0, #1
	add	r1, sl, r1
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	bwprintf(PLT)
.L42:
	.align	2
.L41:
	.word	_GLOBAL_OFFSET_TABLE_-(.L38+8)
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
	ldr	sl, .L53
	sub	sp, sp, #12
.L50:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L53+4
	ldr	r1, .L53+8
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
	ldr	r1, .L53+12
	mov	ip, r0
	cmn	ip, #3
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, #1
	beq	.L51
	ldr	r1, .L53+16
	cmn	ip, #2
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, #1
	mov	r3, #2
	beq	.L52
	ldr	r1, .L53+20
	mov	r2, r5
	add	r1, sl, r1
	mov	r3, r6
	mov	r0, #1
	str	ip, [sp, #0]
	bl	bwprintf(PLT)
.L46:
	bl	Exit(PLT)
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L52:
	bl	bwprintf(PLT)
	b	.L46
.L51:
	bl	bwprintf(PLT)
	b	.L46
.L54:
	.align	2
.L53:
	.word	_GLOBAL_OFFSET_TABLE_-(.L50+8)
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
	ldr	sl, .L58
	sub	sp, sp, #16
.L57:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L58+4
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
	ldr	r1, .L58+8
	ldr	r3, [sp, #12]
	add	r1, sl, r1
	mov	r2, r5
	mov	r0, #1
	str	r4, [sp, #0]
	bl	bwprintf(PLT)
	ldr	r3, .L58+12
	ldr	r1, .L58+16
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
	ldr	r1, .L58+20
	mov	r2, r5
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, sl, pc}
.L59:
	.align	2
.L58:
	.word	_GLOBAL_OFFSET_TABLE_-(.L57+8)
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
	ldr	sl, .L63
.L62:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L63+4
	mov	r4, r0
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L63+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L63+12
	mov	r3, r0
	add	r5, sl, r2
	mov	r1, r5
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L63+16
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
.L64:
	.align	2
.L63:
	.word	_GLOBAL_OFFSET_TABLE_-(.L62+8)
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
	ldr	sl, .L68
.L67:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L68+4
	mov	r4, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L68+8
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L68+12
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r1, .L68+16
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L68+20
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L68+24
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L68+28
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L68+32
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L68+36
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L68+40
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L68+44
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, sl, lr}
	b	Exit(PLT)
.L69:
	.align	2
.L68:
	.word	_GLOBAL_OFFSET_TABLE_-(.L67+8)
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
	ldr	sl, .L73
.L72:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L73+4
	mov	r4, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L73+8
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L73+12
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r1, .L73+16
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L73+20
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L73+24
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L73+28
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L73+32
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L73+36
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L73+40
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L73+44
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, sl, lr}
	b	Exit(PLT)
.L74:
	.align	2
.L73:
	.word	_GLOBAL_OFFSET_TABLE_-(.L72+8)
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
	ldr	sl, .L78
.L77:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L78+4
	mov	r4, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	ldr	r1, .L78+8
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L78+12
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r1, .L78+16
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L78+20
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L78+24
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L78+28
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L78+32
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, .L78+36
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L78+40
	mov	r3, r0
	add	r1, sl, r1
	mov	r2, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L78+44
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, sl, lr}
	b	Exit(PLT)
.L79:
	.align	2
.L78:
	.word	_GLOBAL_OFFSET_TABLE_-(.L77+8)
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
	ldr	sl, .L83
.L82:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L83+4
	mov	r5, r0
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	CreateNameServer(PLT)
	ldr	r1, .L83+8
	mov	r2, r5
	mov	r3, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L83+12
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L83+16
	mov	r3, r0
	add	r4, sl, r2
	mov	r1, r4
	mov	r2, r5
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L83+20
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mov	r2, r5
	mov	r3, r0
	mov	r1, r4
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L83+24
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
.L84:
	.align	2
.L83:
	.word	_GLOBAL_OFFSET_TABLE_-(.L82+8)
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
	ldr	sl, .L88
	sub	sp, sp, #9472
.L87:
	add	sl, pc, sl
	sub	sp, sp, #36
	bl	MyTid(PLT)
	ldr	r3, .L88+4
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
	ldr	r3, .L88+8
	mov	r2, r5
	add	r6, sl, r3
	mov	r1, r6
	mov	r0, r4
	bl	searchDictionary(PLT)
	ldr	r3, .L88+12
	mov	r2, r0
	add	r3, sl, r3
	mov	r1, r3
	mov	r0, #1
	str	r3, [sp, #0]
	bl	bwprintf(PLT)
	ldr	r3, .L88+16
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
	ldr	r1, .L88+20
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L88+24
	mov	r2, #1
	add	r9, sl, r3
	mov	r1, r9
	mov	r0, r4
	bl	addDictionary(PLT)
	ldr	r1, .L88+28
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L88+32
	mov	r2, #1
	add	fp, sl, r3
	mov	r1, fp
	mov	r0, r4
	bl	addDictionary(PLT)
	ldr	r1, .L88+36
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L88+40
	mov	r2, #2
	add	r8, sl, r3
	mov	r1, r8
	mov	r0, r4
	bl	addDictionary(PLT)
	ldr	r1, .L88+44
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
	ldr	r1, .L88+48
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
	ldr	r1, .L88+52
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
	ldr	r3, .L88+56
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
	ldr	r1, .L88+60
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
	ldr	r3, .L88+64
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
.L89:
	.align	2
.L88:
	.word	_GLOBAL_OFFSET_TABLE_-(.L87+8)
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
	.ascii	"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
	.ascii	"bbbbbbbbbbbb\000"
	.text
	.align	2
	.global	testTaskSend64
	.type	testTaskSend64, %function
testTaskSend64:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L93
	ldr	r1, .L93+4
	sub	sp, sp, #68
.L92:
	add	sl, pc, sl
	mov	ip, #64
	add	r1, sl, r1
	mov	r2, ip
	add	r3, sp, #4
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	bl	Exit(PLT)
	add	sp, sp, #68
	ldmfd	sp!, {sl, pc}
.L94:
	.align	2
.L93:
	.word	_GLOBAL_OFFSET_TABLE_-(.L92+8)
	.word	.LC79(GOTOFF)
	.size	testTaskSend64, .-testTaskSend64
	.section	.rodata.str1.4
	.align	2
.LC80:
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
	ldr	sl, .L100
	sub	sp, sp, #68
	add	r0, sp, #68
	mov	r3, #0
.L99:
	add	sl, pc, sl
	mov	r1, sp
	mov	r2, #64
	str	r3, [r0, #-4]!
	bl	Receive(PLT)
	ldr	r1, .L100+4
	cmp	r0, #0
	add	r1, sl, r1
	mov	r2, #64
	ldrge	r0, [sp, #64]
	blge	Reply(PLT)
.L96:
	bl	Exit(PLT)
	add	sp, sp, #68
	ldmfd	sp!, {sl, pc}
.L101:
	.align	2
.L100:
	.word	_GLOBAL_OFFSET_TABLE_-(.L99+8)
	.word	.LC80(GOTOFF)
	.size	testTaskReceive64, .-testTaskReceive64
	.align	2
	.global	testTaskGod64
	.type	testTaskGod64, %function
testTaskGod64:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L105
	ldr	r3, .L105+4
.L104:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #6
	bl	Create(PLT)
	ldr	r3, .L105+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L106:
	.align	2
.L105:
	.word	_GLOBAL_OFFSET_TABLE_-(.L104+8)
	.word	testTaskSend64(GOT)
	.word	testTaskReceive64(GOT)
	.size	testTaskGod64, .-testTaskGod64
	.section	.rodata.str1.4
	.align	2
.LC81:
	.ascii	"bbb\000"
	.text
	.align	2
	.global	testTaskSend4
	.type	testTaskSend4, %function
testTaskSend4:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L110
	ldr	r1, .L110+4
	mov	ip, #4
	sub	sp, sp, #8
.L109:
	add	sl, pc, sl
	add	r1, sl, r1
	mov	r2, ip
	add	r3, sp, ip
	mov	r0, #2
	str	ip, [sp, #0]
	bl	Send(PLT)
	bl	Exit(PLT)
	add	sp, sp, #8
	ldmfd	sp!, {sl, pc}
.L111:
	.align	2
.L110:
	.word	_GLOBAL_OFFSET_TABLE_-(.L109+8)
	.word	.LC81(GOTOFF)
	.size	testTaskSend4, .-testTaskSend4
	.section	.rodata.str1.4
	.align	2
.LC82:
	.ascii	"aaa\000"
	.text
	.align	2
	.global	testTaskReceive4
	.type	testTaskReceive4, %function
testTaskReceive4:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L115
	sub	sp, sp, #8
	mov	r3, #0
	add	r0, sp, #8
.L114:
	add	sl, pc, sl
	str	r3, [r0, #-4]!
	mov	r1, sp
	mov	r2, #4
	bl	Receive(PLT)
	ldr	r1, .L115+4
	mov	r2, #4
	add	r1, sl, r1
	ldr	r0, [sp, #4]
	bl	Reply(PLT)
	bl	Exit(PLT)
	add	sp, sp, #8
	ldmfd	sp!, {sl, pc}
.L116:
	.align	2
.L115:
	.word	_GLOBAL_OFFSET_TABLE_-(.L114+8)
	.word	.LC82(GOTOFF)
	.size	testTaskReceive4, .-testTaskReceive4
	.align	2
	.global	testTaskGod4
	.type	testTaskGod4, %function
testTaskGod4:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L120
	ldr	r3, .L120+4
.L119:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #6
	bl	Create(PLT)
	ldr	r3, .L120+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L121:
	.align	2
.L120:
	.word	_GLOBAL_OFFSET_TABLE_-(.L119+8)
	.word	testTaskSend4(GOT)
	.word	testTaskReceive4(GOT)
	.size	testTaskGod4, .-testTaskGod4
	.section	.rodata.str1.4
	.align	2
.LC83:
	.ascii	"%d\015\012\000"
	.text
	.align	2
	.global	userinfinitiPass
	.type	userinfinitiPass, %function
userinfinitiPass:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L129
	ldr	r6, .L129+4
	ldr	r5, .L129+8
	mov	r4, #0
.L128:
	add	sl, pc, sl
.L123:
	mov	r2, r4
	mov	r0, #1
	add	r4, r4, #1
	add	r1, sl, r6
	bl	bwprintf(PLT)
	cmp	r4, r5
	bne	.L123
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	Exit(PLT)
.L130:
	.align	2
.L129:
	.word	_GLOBAL_OFFSET_TABLE_-(.L128+8)
	.word	.LC83(GOTOFF)
	.word	10000
	.size	userinfinitiPass, .-userinfinitiPass
	.section	.rodata.str1.4
	.align	2
.LC84:
	.ascii	"creating infiniPass \012\015\000"
	.align	2
.LC85:
	.ascii	"CPSR :%x\012\015\000"
	.align	2
.LC86:
	.ascii	"a :%d\012\015\000"
	.align	2
.LC87:
	.ascii	"taskTest try:%d\012\015\000"
	.align	2
.LC88:
	.ascii	"returned from await:%d\012\015\000"
	.text
	.align	2
	.global	taskTestInt
	.type	taskTestInt, %function
taskTestInt:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L138
	ldr	r1, .L138+4
.L137:
	add	sl, pc, sl
	sub	sp, sp, #4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L138+8
	mov	r0, #31
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mrs r3, cpsr
	ldr	r1, .L138+12
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L138+16
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
	ldr	r6, .L138+20
	ldr	r5, .L138+24
	mov	r4, #0
.L132:
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
	bne	.L132
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	Exit(PLT)
.L139:
	.align	2
.L138:
	.word	_GLOBAL_OFFSET_TABLE_-(.L137+8)
	.word	.LC84(GOTOFF)
	.word	userinfinitiPass(GOT)
	.word	.LC85(GOTOFF)
	.word	.LC86(GOTOFF)
	.word	.LC87(GOTOFF)
	.word	.LC88(GOTOFF)
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
	ldr	r0, .L145
	bl	startTimer(PLT)
	mov	r3, #0
	str	r3, [sp, #0]
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	ldr	r3, .L145+4
	cmp	r2, r3
	bgt	.L141
	mov	r1, r3
.L142:
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	cmp	r2, r1
	ble	.L142
.L141:
	add	sp, sp, #4
	ldr	lr, [sp], #4
	b	Exit(PLT)
.L146:
	.align	2
.L145:
	.word	-2139029504
	.word	9999
	.size	taskTestInt2, .-taskTestInt2
	.section	.rodata.str1.4
	.align	2
.LC89:
	.ascii	"ioServer\000"
	.align	2
.LC90:
	.ascii	"The trains controller switch should turn on and off"
	.ascii	" 3 times now..\015\012\000"
	.align	2
.LC91:
	.ascii	"\033[2J\000"
	.align	2
.LC92:
	.ascii	"Printing a long message:\015\012\015\012\000"
	.align	2
.LC93:
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
.LC94:
	.ascii	"Type something here --> \000"
	.text
	.align	2
	.global	testTaskIO1
	.type	testTaskIO1, %function
testTaskIO1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L151
	ldr	r3, .L151+4
.L150:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	Create(PLT)
	ldr	r0, .L151+8
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L151+12
	mov	r1, #1
	add	r2, sl, r2
	mov	r4, r0
	bl	Printf(PLT)
	ldr	r2, .L151+16
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
	ldr	r2, .L151+20
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L151+24
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L151+28
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
.L148:
	mov	r0, r4
	mov	r1, #1
	bl	Getc(PLT)
	mov	r1, #1
	mov	r2, r0
	mov	r0, r4
	bl	Putc(PLT)
	b	.L148
.L152:
	.align	2
.L151:
	.word	_GLOBAL_OFFSET_TABLE_-(.L150+8)
	.word	FirstUserTask(GOT)
	.word	.LC89(GOTOFF)
	.word	.LC90(GOTOFF)
	.word	.LC91(GOTOFF)
	.word	.LC92(GOTOFF)
	.word	.LC93(GOTOFF)
	.word	.LC94(GOTOFF)
	.size	testTaskIO1, .-testTaskIO1
	.align	2
	.global	kernelTest
	.type	kernelTest, %function
kernelTest:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L156
	ldr	r3, .L156+4
.L155:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	Create(PLT)
	ldr	r3, .L156+8
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L156+12
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L156+16
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L156+20
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L157:
	.align	2
.L156:
	.word	_GLOBAL_OFFSET_TABLE_-(.L155+8)
	.word	FirstUserTask(GOT)
	.word	displayGrid(GOT)
	.word	trainServer(GOT)
	.word	displayClock(GOT)
	.word	displaySensors(GOT)
	.size	kernelTest, .-kernelTest
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L161
.L160:
	add	sl, pc, sl
	MRC p15, 0, r0, c1, c0, 0 
ORR r0, r0, #0x1 <<12 
ORR r0, r0, #0x1 <<2 
MCR p15, 0, r0, c1, c0, 0 

	ldr	r3, .L161+4
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	kernelRun(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L162:
	.align	2
.L161:
	.word	_GLOBAL_OFFSET_TABLE_-(.L160+8)
	.word	FirstUserTask(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
