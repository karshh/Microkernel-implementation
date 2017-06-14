	.file	"test.c"
	.text
	.align	2
	.global	displayTrack
	.type	displayTrack, %function
displayTrack:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	ldmfd	sp, {fp, sp, pc}
	.size	displayTrack, .-displayTrack
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
	ldr	sl, .L6
.L5:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L6+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L6+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L6+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
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
	ldr	sl, .L21
.L20:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L21+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L21+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L21+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L21+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L21+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L21+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L21+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L19
.L10:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L21+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #3
	ldr	r3, .L21+36
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L11
	mov	r0, #1
	ldr	r3, .L21+40
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L9
.L11:
	ldr	r3, [fp, #-24]
	cmn	r3, #2
	bne	.L13
	mov	r0, #1
	ldr	r3, .L21+44
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L9
.L13:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L15
	mov	r0, #1
	ldr	r3, .L21+48
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L9
.L15:
	mov	r0, #1
	ldr	r3, .L21+52
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
.L9:
.L19:
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	ble	.L10
	mov	r0, #1
	ldr	r3, .L21+56
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	mov	r0, #1
	ldr	r3, .L21+60
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	_GLOBAL_OFFSET_TABLE_-(.L20+8)
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
	ldr	sl, .L36
.L35:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L36+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L36+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L36+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L36+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L36+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L36+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L36+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L34
.L25:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L36+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r0, [fp, #-20]
	ldr	r3, .L36+36
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L26
	mov	r0, #1
	ldr	r3, .L36+40
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L24
.L26:
	ldr	r3, [fp, #-24]
	cmn	r3, #2
	bne	.L28
	mov	r0, #1
	ldr	r3, .L36+44
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L24
.L28:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L30
	mov	r0, #1
	ldr	r3, .L36+48
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L24
.L30:
	mov	r0, #1
	ldr	r3, .L36+52
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
.L24:
.L34:
	ldr	r3, [fp, #-20]
	cmp	r3, #149
	ble	.L25
	mov	r0, #1
	ldr	r3, .L36+56
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	mov	r0, #1
	ldr	r3, .L36+60
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L37:
	.align	2
.L36:
	.word	_GLOBAL_OFFSET_TABLE_-(.L35+8)
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
	ldr	sl, .L46
.L45:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	mov	r3, #2
	str	r3, [fp, #-36]
	ldr	r3, .L46+4
	add	r3, sl, r3
	str	r3, [fp, #-32]
	mov	r3, #4
	str	r3, [fp, #-28]
	mov	r3, #7
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L46+8
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
	bne	.L39
	mov	r0, #1
	ldr	r3, .L46+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-40]
	bl	bwprintf(PLT)
	b	.L41
.L39:
	ldr	r3, [fp, #-20]
	cmn	r3, #2
	bne	.L42
	mov	r0, #1
	ldr	r3, .L46+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-36]
	bl	bwprintf(PLT)
	b	.L41
.L42:
	sub	ip, fp, #47
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L46+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-40]
	mov	r3, ip
	bl	bwprintf(PLT)
.L41:
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L47:
	.align	2
.L46:
	.word	_GLOBAL_OFFSET_TABLE_-(.L45+8)
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
	ldr	sl, .L51
.L50:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L51+4
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
	ldr	r3, .L51+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	mov	r3, ip
	bl	bwprintf(PLT)
	ldr	r3, .L51+12
	add	r3, sl, r3
	str	r3, [fp, #-24]
	mov	r3, #5
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L51+16
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
	ldr	r3, .L51+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L52:
	.align	2
.L51:
	.word	_GLOBAL_OFFSET_TABLE_-(.L50+8)
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
	ldr	sl, .L56
.L55:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L56+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #6
	ldr	r3, .L56+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L56+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mov	r0, #6
	ldr	r3, .L56+16
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L56+12
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L57:
	.align	2
.L56:
	.word	_GLOBAL_OFFSET_TABLE_-(.L55+8)
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
	ldr	sl, .L61
.L60:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L61+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L61+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L61+12
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L61+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L61+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L61+24
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L61+28
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L61+32
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L61+36
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L61+40
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L61+44
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L62:
	.align	2
.L61:
	.word	_GLOBAL_OFFSET_TABLE_-(.L60+8)
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
	ldr	sl, .L66
.L65:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L66+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L66+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L66+12
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L66+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L66+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L66+24
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L66+28
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L66+32
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L66+36
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L66+40
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L66+44
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L67:
	.align	2
.L66:
	.word	_GLOBAL_OFFSET_TABLE_-(.L65+8)
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
	ldr	sl, .L71
.L70:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L71+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L71+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L71+12
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L71+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L71+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L71+24
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L71+28
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L71+32
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldr	r3, .L71+36
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L71+40
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L71+44
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L72:
	.align	2
.L71:
	.word	_GLOBAL_OFFSET_TABLE_-(.L70+8)
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
	ldr	sl, .L76
.L75:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mvn	r3, #0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L76+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	CreateNameServer(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L76+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-20]
	mov	r0, #2
	ldr	r3, .L76+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L76+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-20]
	mov	r0, #2
	ldr	r3, .L76+20
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L76+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-20]
	mov	r0, #2
	ldr	r3, .L76+24
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L76+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L77:
	.align	2
.L76:
	.word	_GLOBAL_OFFSET_TABLE_-(.L75+8)
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
	ldr	sl, .L81
.L80:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L81+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	bl	initDictionary(PLT)
	ldr	r2, .L81+8
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
	ldr	r3, .L81+12
	add	r3, sl, r3
	mov	r1, r3
	bl	searchDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L81+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L81+8
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	mov	r0, #1
	ldr	r3, .L81+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L81+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L81+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	addDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L81+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L81+28
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	addDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L81+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L81+36
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	addDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L81+40
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L81+44
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	addDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L81+48
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, .L81+8
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
	ldr	r3, .L81+12
	add	r3, sl, r3
	mov	r1, r3
	bl	searchDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L81+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L81+8
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	mov	r0, #1
	ldr	r3, .L81+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, .L81+8
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
	ldr	r3, .L81+28
	add	r3, sl, r3
	mov	r1, r3
	bl	searchDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L81+52
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L81+8
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	mov	r0, #1
	ldr	r3, .L81+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, .L81+8
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
	ldr	r3, .L81+36
	add	r3, sl, r3
	mov	r1, r3
	bl	searchDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L81+56
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L81+8
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	mov	r0, #1
	ldr	r3, .L81+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, .L81+8
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
	ldr	r3, .L81+44
	add	r3, sl, r3
	mov	r1, r3
	bl	searchDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L81+60
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L81+8
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	mov	r0, #1
	ldr	r3, .L81+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #36
	mov	r0, r3
	ldr	r3, .L81+36
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	addDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L81+64
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, .L81+8
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
	ldr	r3, .L81+44
	add	r3, sl, r3
	mov	r1, r3
	bl	searchDictionary(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L81+60
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L81+8
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	mov	r0, #1
	ldr	r3, .L81+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #67
	strb	r3, [fp, #-17]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r3, .L81+68
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #3
	strb	r3, [fp, #-17]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r3, .L81+68
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #9
	strb	r3, [fp, #-17]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r3, .L81+68
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L82:
	.align	2
.L81:
	.word	_GLOBAL_OFFSET_TABLE_-(.L80+8)
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
	ldr	sl, .L89
.L88:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L84
.L85:
	mov	r0, #1
	ldr	r3, .L89+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L84:
	ldr	r2, [fp, #-20]
	ldr	r3, .L89+8
	cmp	r2, r3
	ble	.L85
	bl	Exit(PLT)
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L90:
	.align	2
.L89:
	.word	_GLOBAL_OFFSET_TABLE_-(.L88+8)
	.word	.LC79(GOTOFF)
	.word	9999
	.size	userinfinitiPass, .-userinfinitiPass
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L97
.L96:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L97+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #31
	ldr	r3, .L97+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mrs r3, cpsr
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L97+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #100
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L97+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	mov	r0, #1
	ldr	r3, .L97+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L92
.L93:
	mov	r0, #1
	ldr	r3, .L97+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #0
	bl	AwaitEvent(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L97+24
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L92:
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	ble	.L93
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L98:
	.align	2
.L97:
	.word	_GLOBAL_OFFSET_TABLE_-(.L96+8)
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
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	mov	r0, #1
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L104
	mov	r1, #508
	mov	r2, #508
	mov	r3, #1
	bl	startTimer(PLT)
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L100
.L101:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L100:
	ldr	r2, [fp, #-16]
	ldr	r3, .L104+4
	cmp	r2, r3
	ble	.L101
	bl	Exit(PLT)
	ldmfd	sp, {r3, fp, sp, pc}
.L105:
	.align	2
.L104:
	.word	-2139029504
	.word	9999
	.size	taskTestInt2, .-taskTestInt2
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L110
.L109:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L110+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	ldr	r3, .L110+8
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L110+12
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L110+16
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	mov	r2, #104
	bl	Putc(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	mov	r2, #101
	bl	Putc(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	mov	r2, #108
	bl	Putc(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	mov	r2, #108
	bl	Putc(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	mov	r2, #111
	bl	Putc(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	mov	r2, #119
	bl	Putc(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	mov	r2, #111
	bl	Putc(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	mov	r2, #114
	bl	Putc(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	mov	r2, #108
	bl	Putc(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	mov	r2, #100
	bl	Putc(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	mov	r2, #13
	bl	Putc(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	mov	r2, #10
	bl	Putc(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L110+20
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L110+24
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L110+28
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
.L107:
	ldr	r0, [fp, #-20]
	mov	r1, #1
	bl	Getc(PLT)
	mov	r3, r0
	ldr	r0, [fp, #-20]
	mov	r1, #1
	mov	r2, r3
	bl	Putc(PLT)
	b	.L107
.L111:
	.align	2
.L110:
	.word	_GLOBAL_OFFSET_TABLE_-(.L109+8)
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
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L115
.L114:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L115+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #3
	ldr	r3, .L115+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #3
	ldr	r3, .L115+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #3
	ldr	r3, .L115+16
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #4
	ldr	r3, .L115+20
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L116:
	.align	2
.L115:
	.word	_GLOBAL_OFFSET_TABLE_-(.L114+8)
	.word	FirstUserTask(GOT)
	.word	displayGrid(GOT)
	.word	trainServer(GOT)
	.word	displayClock(GOT)
	.word	displaySensors(GOT)
	.size	kernelTest, .-kernelTest
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #76
	ldr	sl, .L120
.L119:
	add	sl, pc, sl
	ldr	r0, .L120+4
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	bl	startTimer(PLT)
	bl	Pass(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	sub	ip, fp, #88
	mov	r3, #64
	str	r3, [sp, #0]
	mov	r0, #2
	ldr	r3, .L120+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #64
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L120+12
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	rsb	r2, r3, r2
	mov	r0, #1
	ldr	r3, .L120+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L121:
	.align	2
.L120:
	.word	_GLOBAL_OFFSET_TABLE_-(.L119+8)
	.word	-2139029404
	.word	.LC91(GOTOFF)
	.word	.LC92(GOTOFF)
	.word	.LC93(GOTOFF)
	.size	testTaskSend64, .-testTaskSend64
	.section	.rodata
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
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #68
	ldr	sl, .L127
.L126:
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
	blt	.L123
	ldr	r3, [fp, #-20]
	mov	r0, r3
	ldr	r3, .L127+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #64
	bl	Reply(PLT)
.L123:
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L128:
	.align	2
.L127:
	.word	_GLOBAL_OFFSET_TABLE_-(.L126+8)
	.word	.LC94(GOTOFF)
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
	ldr	sl, .L132
.L131:
	add	sl, pc, sl
	mov	r0, #6
	ldr	r3, .L132+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #6
	ldr	r3, .L132+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L133:
	.align	2
.L132:
	.word	_GLOBAL_OFFSET_TABLE_-(.L131+8)
	.word	testTaskSend64(GOT)
	.word	testTaskReceive64(GOT)
	.size	testTaskGod64, .-testTaskGod64
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L137
.L136:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L137+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r0, .L137+8
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	bl	startTimer(PLT)
	bl	Pass(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	sub	ip, fp, #28
	mov	r3, #4
	str	r3, [sp, #0]
	mov	r0, #2
	ldr	r3, .L137+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L137+16
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r0, #0
	bl	getTicks4us(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	rsb	r2, r3, r2
	mov	r0, #1
	ldr	r3, .L137+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L138:
	.align	2
.L137:
	.word	_GLOBAL_OFFSET_TABLE_-(.L136+8)
	.word	.LC95(GOTOFF)
	.word	-2139029404
	.word	.LC96(GOTOFF)
	.word	.LC92(GOTOFF)
	.word	.LC93(GOTOFF)
	.size	testTaskSend4, .-testTaskSend4
	.section	.rodata
	.align	2
.LC97:
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
	ldr	sl, .L144
.L143:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L144+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	bl	Pass(PLT)
	sub	r3, fp, #20
	sub	r2, fp, #24
	mov	r0, r3
	mov	r1, r2
	mov	r2, #4
	bl	Receive(PLT)
	mov	r3, r0
	cmp	r3, #0
	blt	.L140
	ldr	r3, [fp, #-20]
	mov	r0, r3
	ldr	r3, .L144+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #4
	bl	Reply(PLT)
.L140:
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L145:
	.align	2
.L144:
	.word	_GLOBAL_OFFSET_TABLE_-(.L143+8)
	.word	.LC95(GOTOFF)
	.word	.LC97(GOTOFF)
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
	ldr	sl, .L149
.L148:
	add	sl, pc, sl
	mov	r0, #6
	ldr	r3, .L149+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #6
	ldr	r3, .L149+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L150:
	.align	2
.L149:
	.word	_GLOBAL_OFFSET_TABLE_-(.L148+8)
	.word	testTaskSend4(GOT)
	.word	testTaskReceive4(GOT)
	.size	testTaskGod4, .-testTaskGod4
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L154
.L153:
	add	sl, pc, sl
	MRC p15, 0, r0, c1, c0, 0 
ORR r0, r0, #0x1 <<12 
ORR r0, r0, #0x1 <<2 
MCR p15, 0, r0, c1, c0, 0 

	ldr	r3, .L154+4
	ldr	r3, [sl, r3]
	mov	r0, #2
	mov	r1, r3
	bl	kernelRun(PLT)
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L155:
	.align	2
.L154:
	.word	_GLOBAL_OFFSET_TABLE_-(.L153+8)
	.word	testTaskGod64(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
