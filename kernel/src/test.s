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
	.ascii	"init dictionary\000"
	.align	2
.LC43:
	.ascii	"DOGOMYTE\000"
	.align	2
.LC44:
	.ascii	"search for DOGOMYTE %d \012\015\000"
	.align	2
.LC45:
	.ascii	"TID result %d \012\015\000"
	.align	2
.LC46:
	.ascii	"add DOGOMYTE for 100 %d \012\015\000"
	.align	2
.LC47:
	.ascii	"add DOGOMYTE for 100 (again) %d \012\015\000"
	.align	2
.LC48:
	.ascii	"add DOGOMYTE for 101 %d \012\015\000"
	.align	2
.LC49:
	.ascii	"FIRE\000"
	.align	2
.LC50:
	.ascii	"add FIRE for 102 %d \012\015\000"
	.align	2
.LC51:
	.ascii	"TRAIN\000"
	.align	2
.LC52:
	.ascii	"add TRAIN for 103 %d \012\015\000"
	.align	2
.LC53:
	.ascii	"search for FIRE %d \012\015\000"
	.align	2
.LC54:
	.ascii	"search for TRAIN%d \012\015\000"
	.align	2
.LC55:
	.ascii	"DRAGON\000"
	.align	2
.LC56:
	.ascii	"add DRAGON (replace name) for 103 %d \012\015\000"
	.align	2
.LC57:
	.ascii	"search for DRAGON%d \012\015\000"
	.align	2
.LC58:
	.ascii	"unregistered TID 102  \012\015\000"
	.text
	.align	2
	.global	userTaskName
	.type	userTaskName, %function
userTaskName:
	@ args = 0, pretend = 0, frame = 9512
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L68
	sub	sp, sp, #9472
	sub	sp, sp, #40
.L67:
	add	sl, pc, sl
	bl	MyTid(PLT)
	add	r5, sp, #40
	sub	r5, r5, #32
	mov	r4, r0
	mov	r0, r5
	bl	initDictionary(PLT)
	ldr	r1, .L68+4
	mov	r2, r4
	add	r1, sl, r1
	mov	r3, #0
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r4, sp, #9472
	ldr	r3, .L68+8
	add	r4, r4, #40
	mvn	r8, #0
	str	r8, [r4, #-4]!
	add	r6, sl, r3
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	bl	searchDictionary(PLT)
	ldr	r3, .L68+12
	mov	r2, r0
	add	fp, sl, r3
	mov	r1, fp
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	ldr	r2, [r3, #1316]
	ldr	r3, .L68+16
	mov	r0, #1
	add	r7, sl, r3
	mov	r1, r7
	bl	bwprintf(PLT)
	mov	r1, r6
	mov	r0, r5
	mov	r2, #100
	bl	addDictionary(PLT)
	ldr	r1, .L68+20
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r1, r6
	mov	r0, r5
	mov	r2, #100
	bl	addDictionary(PLT)
	ldr	r1, .L68+24
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r1, r6
	mov	r0, r5
	mov	r2, #101
	bl	addDictionary(PLT)
	ldr	r1, .L68+28
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L68+32
	mov	r2, #102
	add	r3, sl, r3
	mov	r1, r3
	mov	r0, r5
	str	r3, [sp, #4]
	bl	addDictionary(PLT)
	ldr	r1, .L68+36
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L68+40
	mov	r2, #103
	add	r9, sl, r3
	mov	r1, r9
	mov	r0, r5
	bl	addDictionary(PLT)
	ldr	r1, .L68+44
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	str	r8, [r3, #1316]
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	bl	searchDictionary(PLT)
	mov	r1, fp
	mov	r2, r0
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	mov	r1, r7
	ldr	r2, [r3, #1316]
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	ldr	r1, [sp, #4]
	mov	r2, r4
	str	r8, [r3, #1316]
	mov	r0, r5
	bl	searchDictionary(PLT)
	ldr	r3, .L68+48
	mov	r2, r0
	add	r3, sl, r3
	mov	r1, r3
	mov	r0, #1
	str	r3, [sp, #0]
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	mov	r1, r7
	ldr	r2, [r3, #1316]
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	mov	r1, r9
	mov	r2, r4
	str	r8, [r3, #1316]
	mov	r0, r5
	bl	searchDictionary(PLT)
	ldr	r3, .L68+52
	mov	r2, r0
	add	fp, sl, r3
	mov	r1, fp
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	mov	r1, r7
	ldr	r2, [r3, #1316]
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L68+56
	mov	r2, #103
	add	r6, sl, r3
	mov	r1, r6
	mov	r0, r5
	bl	addDictionary(PLT)
	ldr	r1, .L68+60
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	str	r8, [r3, #1316]
	mov	r1, r9
	mov	r2, r4
	mov	r0, r5
	bl	searchDictionary(PLT)
	mov	r1, fp
	mov	r2, r0
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	mov	r1, r7
	ldr	r2, [r3, #1316]
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	str	r8, [r3, #1316]
	mov	r1, r6
	mov	r2, r4
	mov	r0, r5
	bl	searchDictionary(PLT)
	ldr	r1, .L68+64
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	mov	r1, r7
	ldr	r2, [r3, #1316]
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	str	r8, [r3, #1316]
	ldr	r1, [sp, #4]
	mov	r2, r4
	mov	r0, r5
	bl	searchDictionary(PLT)
	ldr	r1, [sp, #0]
	mov	r2, r0
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	ldr	r2, [r3, #1316]
	mov	r1, r7
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r5
	mov	r1, #102
	bl	deleteDictionary(PLT)
	ldr	r1, .L68+68
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	str	r8, [r3, #1316]
	ldr	r1, [sp, #4]
	mov	r2, r4
	mov	r0, r5
	bl	searchDictionary(PLT)
	ldr	r1, [sp, #0]
	mov	r2, r0
	mov	r0, #1
	bl	bwprintf(PLT)
	add	r3, sp, #8192
	mov	r1, r7
	mov	r0, #1
	ldr	r2, [r3, #1316]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #296
	add	sp, sp, #9216
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
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
	.word	.LC53(GOTOFF)
	.word	.LC54(GOTOFF)
	.word	.LC55(GOTOFF)
	.word	.LC56(GOTOFF)
	.word	.LC57(GOTOFF)
	.word	.LC58(GOTOFF)
	.size	userTaskName, .-userTaskName
	.align	2
	.global	userTask11
	.type	userTask11, %function
userTask11:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L73
.L72:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L73+4
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L74:
	.align	2
.L73:
	.word	_GLOBAL_OFFSET_TABLE_-(.L72+8)
	.word	.LC19(GOTOFF)
	.size	userTask11, .-userTask11
	.section	.rodata.str1.4
	.align	2
.LC59:
	.ascii	"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
	.ascii	"bbbbbbbbbbbb\000"
	.align	2
.LC60:
	.ascii	"Time: %d\015\012\000"
	.text
	.align	2
	.global	testTaskSend64
	.type	testTaskSend64, %function
testTaskSend64:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L80
	ldr	r1, .L80+4
	sub	sp, sp, #68
.L79:
	add	sl, pc, sl
	mov	ip, #64
	add	r1, sl, r1
	mov	r2, ip
	add	r3, sp, #4
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	cmp	r0, #0
	blt	.L76
	bl	getTime(PLT)
	ldr	r1, .L80+8
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
.L76:
	bl	Exit(PLT)
	add	sp, sp, #68
	ldmfd	sp!, {sl, pc}
.L81:
	.align	2
.L80:
	.word	_GLOBAL_OFFSET_TABLE_-(.L79+8)
	.word	.LC59(GOTOFF)
	.word	.LC60(GOTOFF)
	.size	testTaskSend64, .-testTaskSend64
	.section	.rodata.str1.4
	.align	2
.LC61:
	.ascii	"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
	.ascii	"aaaaaaaaaaaa\000"
	.text
	.align	2
	.global	testTaskReceive64
	.type	testTaskReceive64, %function
testTaskReceive64:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L87
	sub	sp, sp, #68
	mov	r3, #0
	add	r4, sp, #68
.L86:
	add	sl, pc, sl
	str	r3, [r4, #-4]!
	bl	startTime(PLT)
	mov	r1, sp
	mov	r2, #64
	mov	r0, r4
	bl	Receive(PLT)
	ldr	r1, .L87+4
	cmp	r0, #0
	add	r1, sl, r1
	mov	r2, #64
	ldrge	r0, [sp, #64]
	blge	Reply(PLT)
.L83:
	bl	Exit(PLT)
	add	sp, sp, #68
	ldmfd	sp!, {r4, sl, pc}
.L88:
	.align	2
.L87:
	.word	_GLOBAL_OFFSET_TABLE_-(.L86+8)
	.word	.LC61(GOTOFF)
	.size	testTaskReceive64, .-testTaskReceive64
	.align	2
	.global	testTaskGod64
	.type	testTaskGod64, %function
testTaskGod64:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L92
	ldr	r3, .L92+4
.L91:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #6
	bl	Create(PLT)
	ldr	r3, .L92+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L93:
	.align	2
.L92:
	.word	_GLOBAL_OFFSET_TABLE_-(.L91+8)
	.word	testTaskReceive64(GOT)
	.word	testTaskSend64(GOT)
	.size	testTaskGod64, .-testTaskGod64
	.section	.rodata.str1.4
	.align	2
.LC62:
	.ascii	"bbb\000"
	.align	2
.LC63:
	.ascii	"%d\015\012\000"
	.text
	.align	2
	.global	testTaskSend4
	.type	testTaskSend4, %function
testTaskSend4:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L99
	ldr	r1, .L99+4
	mov	ip, #4
	sub	sp, sp, #8
.L98:
	add	sl, pc, sl
	add	r1, sl, r1
	mov	r2, ip
	add	r3, sp, ip
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	cmp	r0, #0
	blt	.L95
	bl	getTime(PLT)
	ldr	r1, .L99+8
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
.L95:
	bl	Exit(PLT)
	add	sp, sp, #8
	ldmfd	sp!, {sl, pc}
.L100:
	.align	2
.L99:
	.word	_GLOBAL_OFFSET_TABLE_-(.L98+8)
	.word	.LC62(GOTOFF)
	.word	.LC63(GOTOFF)
	.size	testTaskSend4, .-testTaskSend4
	.section	.rodata.str1.4
	.align	2
.LC64:
	.ascii	"aaa\000"
	.text
	.align	2
	.global	testTaskReceive4
	.type	testTaskReceive4, %function
testTaskReceive4:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L106
	sub	sp, sp, #8
	mov	r3, #0
	add	r4, sp, #8
.L105:
	add	sl, pc, sl
	str	r3, [r4, #-4]!
	bl	startTime(PLT)
	mov	r1, sp
	mov	r2, #4
	mov	r0, r4
	bl	Receive(PLT)
	ldr	r1, .L106+4
	cmp	r0, #0
	add	r1, sl, r1
	mov	r2, #4
	ldrge	r0, [sp, #4]
	blge	Reply(PLT)
.L102:
	bl	Exit(PLT)
	add	sp, sp, #8
	ldmfd	sp!, {r4, sl, pc}
.L107:
	.align	2
.L106:
	.word	_GLOBAL_OFFSET_TABLE_-(.L105+8)
	.word	.LC64(GOTOFF)
	.size	testTaskReceive4, .-testTaskReceive4
	.align	2
	.global	testTaskGod4
	.type	testTaskGod4, %function
testTaskGod4:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L111
	ldr	r3, .L111+4
.L110:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #6
	bl	Create(PLT)
	ldr	r3, .L111+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L112:
	.align	2
.L111:
	.word	_GLOBAL_OFFSET_TABLE_-(.L110+8)
	.word	testTaskReceive4(GOT)
	.word	testTaskSend4(GOT)
	.size	testTaskGod4, .-testTaskGod4
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L116
.L115:
	add	sl, pc, sl
	MRC p15, 0, r0, c1, c0, 0 
ORR r0, r0, #0x1 <<12 
ORR r0, r0, #0x1 <<2 
MCR p15, 0, r0, c1, c0, 0 

	ldr	r3, .L116+4
	mov	r0, #5
	ldr	r1, [sl, r3]
	bl	kernelRun(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L117:
	.align	2
.L116:
	.word	_GLOBAL_OFFSET_TABLE_-(.L115+8)
	.word	testTaskGod4(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
