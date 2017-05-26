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
	.align	2
	.global	userTask11
	.type	userTask11, %function
userTask11:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L68
.L67:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r1, .L68+4
	mov	r2, r0
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L69:
	.align	2
.L68:
	.word	_GLOBAL_OFFSET_TABLE_-(.L67+8)
	.word	.LC19(GOTOFF)
	.size	userTask11, .-userTask11
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L73
	ldr	r3, .L73+4
.L72:
	add	sl, pc, sl
	mov	r0, #5
	ldr	r1, [sl, r3]
	bl	kernelRun(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L74:
	.align	2
.L73:
	.word	_GLOBAL_OFFSET_TABLE_-(.L72+8)
	.word	userTask11(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
