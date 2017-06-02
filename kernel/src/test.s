	.file	"test.c"
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L4+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L4+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L4+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	userTask3, .-userTask3
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L19
.L18:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L19+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L19+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L19+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L19+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L19+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L19+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L19+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L17
.L8:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L19+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #3
	ldr	r3, .L19+36
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L9
	mov	r0, #1
	ldr	r3, .L19+40
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L7
.L9:
	ldr	r3, [fp, #-24]
	cmn	r3, #2
	bne	.L11
	mov	r0, #1
	ldr	r3, .L19+44
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L7
.L11:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L13
	mov	r0, #1
	ldr	r3, .L19+48
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L7
.L13:
	mov	r0, #1
	ldr	r3, .L19+52
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
.L7:
.L17:
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	ble	.L8
	mov	r0, #1
	ldr	r3, .L19+56
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	mov	r0, #1
	ldr	r3, .L19+60
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L20:
	.align	2
.L19:
	.word	_GLOBAL_OFFSET_TABLE_-(.L18+8)
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
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.size	userTask2, .-userTask2
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L34
.L33:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L34+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L34+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L34+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L34+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L34+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L34+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L34+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L32
.L23:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L34+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r0, [fp, #-20]
	ldr	r3, .L34+36
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L24
	mov	r0, #1
	ldr	r3, .L34+40
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L22
.L24:
	ldr	r3, [fp, #-24]
	cmn	r3, #2
	bne	.L26
	mov	r0, #1
	ldr	r3, .L34+44
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L22
.L26:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L28
	mov	r0, #1
	ldr	r3, .L34+48
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L22
.L28:
	mov	r0, #1
	ldr	r3, .L34+52
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
.L22:
.L32:
	ldr	r3, [fp, #-20]
	cmp	r3, #149
	ble	.L23
	mov	r0, #1
	ldr	r3, .L34+56
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	mov	r0, #1
	ldr	r3, .L34+60
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.L33+8)
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
	.section	.rodata
	.align	2
.LC30:
	.ascii	"Hi!\000"
	.align	2
.LC31:
	.ascii	"<%d>: Sending a message to %d: %s.\015\012\000"
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
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	ldr	sl, .L44
.L43:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	mov	r3, #2
	str	r3, [fp, #-36]
	ldr	r3, .L44+4
	add	r3, sl, r3
	str	r3, [fp, #-32]
	mov	r3, #4
	str	r3, [fp, #-28]
	mov	r3, #7
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L44+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-36]
	bl	bwprintf(PLT)
	sub	ip, fp, #47
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-32]
	ldr	r2, [fp, #-28]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmn	r3, #3
	bne	.L37
	mov	r0, #1
	ldr	r3, .L44+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-40]
	bl	bwprintf(PLT)
	b	.L39
.L37:
	ldr	r3, [fp, #-20]
	cmn	r3, #2
	bne	.L40
	mov	r0, #1
	ldr	r3, .L44+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-36]
	bl	bwprintf(PLT)
	b	.L39
.L40:
	sub	ip, fp, #47
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L44+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-40]
	mov	r3, ip
	bl	bwprintf(PLT)
.L39:
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L45:
	.align	2
.L44:
	.word	_GLOBAL_OFFSET_TABLE_-(.L43+8)
	.word	.LC30(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.size	userTask61, .-userTask61
	.section	.rodata
	.align	2
.LC35:
	.ascii	"<%d>: Requesting a message.\015\012\000"
	.align	2
.LC36:
	.ascii	"<%d>: Got the following message from %d: %s.\015\012"
	.ascii	"\000"
	.align	2
.LC37:
	.ascii	"Bye!\000"
	.align	2
.LC38:
	.ascii	"<%d>: Replying the following: %s.\015\012\000"
	.align	2
.LC39:
	.ascii	"<%d>: Exitting now.\015\012\000"
	.text
	.align	2
	.global	userTask62
	.type	userTask62, %function
userTask62:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	ldr	sl, .L49
.L48:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L49+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #5
	str	r3, [fp, #-28]
	sub	r3, fp, #36
	sub	r2, fp, #41
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-28]
	bl	Receive(PLT)
	ldr	ip, [fp, #-36]
	sub	r3, fp, #41
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L49+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	mov	r3, ip
	bl	bwprintf(PLT)
	ldr	r3, .L49+12
	add	r3, sl, r3
	str	r3, [fp, #-24]
	mov	r3, #5
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L49+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-36]
	mov	r0, r3
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	bl	Reply(PLT)
	mov	r0, #1
	ldr	r3, .L49+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L50:
	.align	2
.L49:
	.word	_GLOBAL_OFFSET_TABLE_-(.L48+8)
	.word	.LC35(GOTOFF)
	.word	.LC36(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	.LC38(GOTOFF)
	.word	.LC39(GOTOFF)
	.size	userTask62, .-userTask62
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L54
.L53:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L54+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #6
	ldr	r3, .L54+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L54+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mov	r0, #6
	ldr	r3, .L54+16
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L54+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L55:
	.align	2
.L54:
	.word	_GLOBAL_OFFSET_TABLE_-(.L53+8)
	.word	.LC40(GOTOFF)
	.word	userTask61(GOT)
	.word	.LC41(GOTOFF)
	.word	userTask62(GOT)
	.size	userTask60, .-userTask60
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L59
.L58:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L59+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L59+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L59+12
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L59+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L59+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L59+24
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L59+28
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L59+32
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L59+36
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L59+40
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L59+44
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L60:
	.align	2
.L59:
	.word	_GLOBAL_OFFSET_TABLE_-(.L58+8)
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
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L64
.L63:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L64+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L64+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L64+12
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L64+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L64+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L64+24
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L64+28
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L64+32
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L64+36
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L64+40
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L64+44
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L65:
	.align	2
.L64:
	.word	_GLOBAL_OFFSET_TABLE_-(.L63+8)
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
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L69
.L68:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L69+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L69+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L69+12
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L69+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L69+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L69+24
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L69+28
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L69+32
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L69+36
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L69+40
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L69+44
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L70:
	.align	2
.L69:
	.word	_GLOBAL_OFFSET_TABLE_-(.L68+8)
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
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L74
.L73:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mvn	r3, #0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L74+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	CreateNameServer(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L74+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-20]
	mov	r0, #2
	ldr	r3, .L74+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L74+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-20]
	mov	r0, #2
	ldr	r3, .L74+20
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L74+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-20]
	mov	r0, #2
	ldr	r3, .L74+24
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L74+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L75:
	.align	2
.L74:
	.word	_GLOBAL_OFFSET_TABLE_-(.L73+8)
	.word	NameServerTask(GOT)
	.word	.LC62(GOTOFF)
	.word	userTaskClient(GOT)
	.word	.LC63(GOTOFF)
	.word	userTaskClient1(GOT)
	.word	userTaskClient2(GOT)
	.size	userTask01, .-userTask01
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 9512
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #9472
	sub	sp, sp, #40
	ldr	sl, .L79
.L78:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L79+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	bl	initDictionary(PLT)
	ldr	r2, .L79+8
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	sub	r2, fp, #9472
	sub	r2, r2, #16
	sub	r2, r2, #40
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L79+12
	add	r3, sl, r3
	mov	r1, r3
	bl	searchDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L79+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L79+8
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	mov	r0, #1
	ldr	r3, .L79+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L79+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L79+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	addDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L79+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L79+28
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	addDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L79+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L79+36
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	addDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L79+40
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L79+44
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	addDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L79+48
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, .L79+8
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	sub	r2, fp, #9472
	sub	r2, r2, #16
	sub	r2, r2, #40
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L79+12
	add	r3, sl, r3
	mov	r1, r3
	bl	searchDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L79+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L79+8
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	mov	r0, #1
	ldr	r3, .L79+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, .L79+8
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	sub	r2, fp, #9472
	sub	r2, r2, #16
	sub	r2, r2, #40
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L79+28
	add	r3, sl, r3
	mov	r1, r3
	bl	searchDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L79+52
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L79+8
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	mov	r0, #1
	ldr	r3, .L79+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, .L79+8
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	sub	r2, fp, #9472
	sub	r2, r2, #16
	sub	r2, r2, #40
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L79+36
	add	r3, sl, r3
	mov	r1, r3
	bl	searchDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L79+56
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L79+8
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	mov	r0, #1
	ldr	r3, .L79+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, .L79+8
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	sub	r2, fp, #9472
	sub	r2, r2, #16
	sub	r2, r2, #40
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L79+44
	add	r3, sl, r3
	mov	r1, r3
	bl	searchDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L79+60
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L79+8
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	mov	r0, #1
	ldr	r3, .L79+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L79+36
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	addDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L79+64
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, .L79+8
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	sub	r2, fp, #9472
	sub	r2, r2, #16
	sub	r2, r2, #40
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L79+44
	add	r3, sl, r3
	mov	r1, r3
	bl	searchDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L79+60
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L79+8
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	mov	r0, #1
	ldr	r3, .L79+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #67
	strb	r3, [fp, #-17]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r3, .L79+68
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #3
	strb	r3, [fp, #-17]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r3, .L79+68
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #9
	strb	r3, [fp, #-17]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r3, .L79+68
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L80:
	.align	2
.L79:
	.word	_GLOBAL_OFFSET_TABLE_-(.L78+8)
	.word	.LC19(GOTOFF)
	.word	-9512
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
	.section	.rodata
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
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #68
	ldr	sl, .L84
.L83:
	add	sl, pc, sl
	sub	ip, fp, #80
	mov	r3, #64
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L84+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #64
	mov	r3, ip
	bl	Send(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L85:
	.align	2
.L84:
	.word	_GLOBAL_OFFSET_TABLE_-(.L83+8)
	.word	.LC79(GOTOFF)
	.size	testTaskSend64, .-testTaskSend64
	.section	.rodata
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
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #68
	ldr	sl, .L91
.L90:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-20]
	sub	r3, fp, #20
	sub	r2, fp, #84
	mov	r0, r3
	mov	r1, r2
	mov	r2, #64
	bl	Receive(PLT)
	mov	r3, r0
	cmp	r3, #0
	blt	.L87
	ldr	r3, [fp, #-20]
	mov	r0, r3
	ldr	r3, .L91+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #64
	bl	Reply(PLT)
.L87:
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L92:
	.align	2
.L91:
	.word	_GLOBAL_OFFSET_TABLE_-(.L90+8)
	.word	.LC80(GOTOFF)
	.size	testTaskReceive64, .-testTaskReceive64
	.align	2
	.global	testTaskGod64
	.type	testTaskGod64, %function
testTaskGod64:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L96
.L95:
	add	sl, pc, sl
	mov	r0, #6
	ldr	r3, .L96+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #6
	ldr	r3, .L96+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L97:
	.align	2
.L96:
	.word	_GLOBAL_OFFSET_TABLE_-(.L95+8)
	.word	testTaskReceive64(GOT)
	.word	testTaskSend64(GOT)
	.size	testTaskGod64, .-testTaskGod64
	.section	.rodata
	.align	2
.LC81:
	.ascii	"bbb\000"
	.text
	.align	2
	.global	testTaskSend4
	.type	testTaskSend4, %function
testTaskSend4:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L101
.L100:
	add	sl, pc, sl
	sub	ip, fp, #20
	mov	r3, #4
	str	r3, [sp, #0]
	mov	r0, #2
	ldr	r3, .L101+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L102:
	.align	2
.L101:
	.word	_GLOBAL_OFFSET_TABLE_-(.L100+8)
	.word	.LC81(GOTOFF)
	.size	testTaskSend4, .-testTaskSend4
	.section	.rodata
	.align	2
.LC82:
	.ascii	"aaa\000"
	.text
	.align	2
	.global	testTaskReceive4
	.type	testTaskReceive4, %function
testTaskReceive4:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L108
.L107:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-20]
	sub	r3, fp, #20
	sub	r2, fp, #24
	mov	r0, r3
	mov	r1, r2
	mov	r2, #4
	bl	Receive(PLT)
	mov	r3, r0
	cmp	r3, #0
	blt	.L104
	ldr	r3, [fp, #-20]
	mov	r0, r3
	ldr	r3, .L108+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #4
	bl	Reply(PLT)
.L104:
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L109:
	.align	2
.L108:
	.word	_GLOBAL_OFFSET_TABLE_-(.L107+8)
	.word	.LC82(GOTOFF)
	.size	testTaskReceive4, .-testTaskReceive4
	.align	2
	.global	testTaskGod4
	.type	testTaskGod4, %function
testTaskGod4:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L113
.L112:
	add	sl, pc, sl
	mov	r0, #6
	ldr	r3, .L113+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #6
	ldr	r3, .L113+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L114:
	.align	2
.L113:
	.word	_GLOBAL_OFFSET_TABLE_-(.L112+8)
	.word	testTaskSend4(GOT)
	.word	testTaskReceive4(GOT)
	.size	testTaskGod4, .-testTaskGod4
	.section	.rodata
	.align	2
.LC83:
	.ascii	"%d\015\012\000"
	.text
	.align	2
	.global	userinfinitiPass
	.type	userinfinitiPass, %function
userinfinitiPass:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L121
.L120:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L116
.L117:
	mov	r0, #1
	ldr	r3, .L121+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L116:
	ldr	r2, [fp, #-20]
	ldr	r3, .L121+8
	cmp	r2, r3
	ble	.L117
	bl	Exit(PLT)
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L122:
	.align	2
.L121:
	.word	_GLOBAL_OFFSET_TABLE_-(.L120+8)
	.word	.LC83(GOTOFF)
	.word	9999
	.size	userinfinitiPass, .-userinfinitiPass
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L129
.L128:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L129+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #31
	ldr	r3, .L129+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mrs r3, cpsr
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L129+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #100
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L129+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	mov	r0, #1
	ldr	r3, .L129+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L124
.L125:
	mov	r0, #1
	ldr	r3, .L129+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #0
	bl	AwaitEvent(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L129+24
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L124:
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	ble	.L125
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L130:
	.align	2
.L129:
	.word	_GLOBAL_OFFSET_TABLE_-(.L128+8)
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
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	mov	r0, #1
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L136
	mov	r1, #508
	mov	r2, #508
	bl	startTimer(PLT)
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L132
.L133:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L132:
	ldr	r2, [fp, #-16]
	ldr	r3, .L136+4
	cmp	r2, r3
	ble	.L133
	bl	Exit(PLT)
	ldmfd	sp, {r3, fp, sp, pc}
.L137:
	.align	2
.L136:
	.word	-2139029504
	.word	9999
	.size	taskTestInt2, .-taskTestInt2
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L141
.L140:
	add	sl, pc, sl
	MRC p15, 0, r0, c1, c0, 0 
ORR r0, r0, #0x1 <<12 
ORR r0, r0, #0x1 <<2 
MCR p15, 0, r0, c1, c0, 0 

	ldr	r3, .L141+4
	ldr	r3, [sl, r3]
	mov	r0, #5
	mov	r1, r3
	bl	kernelRun(PLT)
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L142:
	.align	2
.L141:
	.word	_GLOBAL_OFFSET_TABLE_-(.L140+8)
	.word	clockServer(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
