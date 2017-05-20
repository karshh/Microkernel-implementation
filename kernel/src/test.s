	.file	"test.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"USER TASK 3 ENTRY. REQUEST ID = %d\015\012\000"
	.align	2
.LC1:
	.ascii	"USER TASK 3 MIDDLE \015\012\000"
	.align	2
.LC2:
	.ascii	"USER TASK 3 EXIT, REQUESTING TID.\015\012\000"
	.align	2
.LC3:
	.ascii	"USER TASK 3 GOT TID = %d.\015\012\000"
	.align	2
.LC4:
	.ascii	"USER TASK 3 EXIT, REQUESTING Parent TID.\015\012\000"
	.align	2
.LC5:
	.ascii	"USER TASK 3 GOT Parent TID = %d.\015\012\000"
	.align	2
.LC6:
	.ascii	"USER TASK 3 EXIT, REQUESTING to get off the train.\015"
	.ascii	"\012\000"
	.text
	.align	2
	.global	userTask3
	.type	userTask3, %function
userTask3:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	mov	r2, r0
	mov	r0, #1
	ldr	r3, .L4+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L4+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L4+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r0, #1
	ldr	r3, .L4+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L4+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L4+24
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L4+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.size	userTask3, .-userTask3
	.section	.rodata
	.align	2
.LC7:
	.ascii	"USER TASK 2 ENTRY. REQUEST ID = %d\015\012\000"
	.align	2
.LC8:
	.ascii	"USER TASK 2 MIDDLE \015\012\000"
	.align	2
.LC9:
	.ascii	"USER TASK 2 EXIT, REQUESTING TID.\015\012\000"
	.align	2
.LC10:
	.ascii	"USER TASK 2 GOT TID = %d.\015\012\000"
	.align	2
.LC11:
	.ascii	"USER TASK 2 EXIT, REQUESTING Parent TID.\015\012\000"
	.align	2
.LC12:
	.ascii	"USER TASK 2 GOT Parent TID = %d.\015\012\000"
	.align	2
.LC13:
	.ascii	"USER TASK 2 EXIT, REQUESTING to Pass the train.\015"
	.ascii	"\012\000"
	.align	2
.LC14:
	.ascii	"USER TASK has had a nap but is awake  \015\012\000"
	.align	2
.LC15:
	.ascii	"USER TASK 2 EXIT, REQUESTING to birth a child.\015\012"
	.ascii	"\000"
	.align	2
.LC16:
	.ascii	"USER TASK 2' child never born. no father: %d.\015\012"
	.ascii	"\000"
	.align	2
.LC17:
	.ascii	"world is overpopulated. train gods refuse Task's 2 "
	.ascii	"offer: %d.\015\012\000"
	.align	2
.LC18:
	.ascii	"USER TASK 2 gave birth to a bouncing baby task name"
	.ascii	"d: %d.\015\012\000"
	.align	2
.LC19:
	.ascii	"USER TASK 2's fucked up when fucking: %d.\015\012\000"
	.align	2
.LC20:
	.ascii	"USER TASK 2 EXIT, REQUESTING to get off the train.\015"
	.ascii	"\012\000"
	.align	2
.LC21:
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
	mov	r2, r0
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
	mov	r0, #1
	ldr	r3, .L19+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L19+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L19+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L19+24
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L19+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L19+32
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
	ldr	r3, .L19+36
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L19+40
	ldr	r3, [sl, r3]
	add	r3, r3, #2195456
	mov	r0, #3
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L9
	mov	r0, #1
	ldr	r3, .L19+44
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
	ldr	r3, .L19+48
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
	ldr	r3, .L19+52
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L7
.L13:
	mov	r0, #1
	ldr	r3, .L19+56
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
	ldr	r3, .L19+60
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	mov	r0, #1
	ldr	r3, .L19+64
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L20:
	.align	2
.L19:
	.word	_GLOBAL_OFFSET_TABLE_-(.L18+8)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	userTask3(GOT)
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.size	userTask2, .-userTask2
	.section	.rodata
	.align	2
.LC22:
	.ascii	"USER TASK 1 ENTRY. REQUEST ID = %d\015\012\000"
	.align	2
.LC23:
	.ascii	"USER TASK 1 MIDDLE \015\012\000"
	.align	2
.LC24:
	.ascii	"USER TASK 1 EXIT, REQUESTING TID.\015\012\000"
	.align	2
.LC25:
	.ascii	"USER TASK 1 GOT TID = %d.\015\012\000"
	.align	2
.LC26:
	.ascii	"USER TASK 1 EXIT, REQUESTING Parent TID.\015\012\000"
	.align	2
.LC27:
	.ascii	"USER TASK 1 GOT Parent TID = %d.\015\012\000"
	.align	2
.LC28:
	.ascii	"USER TASK 1 EXIT, REQUESTING to Pass the train.\015"
	.ascii	"\012\000"
	.align	2
.LC29:
	.ascii	"USER TASK 1 EXIT, REQUESTING to birth a child.\015\012"
	.ascii	"\000"
	.align	2
.LC30:
	.ascii	"USER TASK 1' child never born. no father: %d.\015\012"
	.ascii	"\000"
	.align	2
.LC31:
	.ascii	"world is overpopulated. train gods refuse Task's 1o"
	.ascii	"ffer: %d.\015\012\000"
	.align	2
.LC32:
	.ascii	"USER TASK 1gave birth to a bouncing baby task named"
	.ascii	": %d.\015\012\000"
	.align	2
.LC33:
	.ascii	"USER TASK 1's fucked up when fucking: %d.\015\012\000"
	.align	2
.LC34:
	.ascii	"USER TASK 1 EXIT, REQUESTING to get off the train.\015"
	.ascii	"\012\000"
	.align	2
.LC35:
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
	mov	r2, r0
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
	mov	r0, #1
	ldr	r3, .L34+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L34+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L34+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L34+24
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L34+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L34+32
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
	ldr	r3, .L34+36
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L34+40
	ldr	r3, [sl, r3]
	add	r3, r3, #2195456
	mov	r0, #3
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmn	r3, #1
	bne	.L24
	mov	r0, #1
	ldr	r3, .L34+44
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
	ldr	r3, .L34+48
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
	ldr	r3, .L34+52
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
	b	.L22
.L28:
	mov	r0, #1
	ldr	r3, .L34+56
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	bwprintf(PLT)
.L22:
.L32:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	ble	.L23
	mov	r0, #1
	ldr	r3, .L34+60
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	mov	r0, #1
	ldr	r3, .L34+64
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.L33+8)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	userTask3(GOT)
	.word	.LC30(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	.LC35(GOTOFF)
	.size	userTask1, .-userTask1
	.align	2
	.global	user_contextswitch1
	.type	user_contextswitch1, %function
user_contextswitch1:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	swi 0
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	user_contextswitch1, .-user_contextswitch1
	.section	.rodata
	.align	2
.LC36:
	.ascii	"Kernel:Starting Run...\015\012\000"
	.align	2
.LC37:
	.ascii	"error getting TID\012\015\000"
	.align	2
.LC38:
	.ascii	"First Task sp%x\012\015\000"
	.align	2
.LC39:
	.ascii	"Kernel:Pushed TD %d on the queue\012\015\000"
	.align	2
.LC40:
	.ascii	"Kernel:Running task %d. \012\015\000"
	.align	2
.LC41:
	.ascii	"Kernel:Exiting..\012\015\000"
	.text
	.align	2
	.global	kernelTestRun
	.type	kernelTestRun, %function
kernelTestRun:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #48
	ldr	sl, .L48
.L47:
	add	sl, pc, sl
	str	r0, [fp, #-60]
	mov	r0, #1
	ldr	r3, .L48+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	r3, fp, #28
	ldr	r0, [fp, #-60]
	mov	r1, r3
	bl	getNextTID(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L39
	mov	r0, #1
	ldr	r3, .L48+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
.L39:
	ldr	r3, .L48+12
	ldr	r3, [sl, r3]
	add	r3, r3, #2195456
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-60]
	mov	r1, r2
	mvn	r2, #0
	mov	r3, #2
	bl	setTask(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L48+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r0, [fp, #-60]
	ldr	r1, [fp, #-20]
	bl	kernel_queuePush(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L41
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #16]
	mov	r0, #1
	ldr	r3, .L48+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
.L41:
	mov	r3, #1
	str	r3, [fp, #-40]
	b	.L43
.L44:
	ldr	r3, [fp, #-56]
	ldr	r2, [r3, #16]
	mov	r0, #1
	ldr	r3, .L48+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-56]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-56]
	mov	r0, r2
	mov	r1, r3
	bl	activate(PLT)
	mov	r3, r0
	sub	ip, fp, #52
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	ldr	r3, [fp, #-56]
	sub	r2, fp, #52
	ldr	r0, [fp, #-60]
	mov	r1, r3
	bl	processRequest(PLT)
	ldr	r3, [fp, #-56]
	ldr	r0, [fp, #-60]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
.L43:
	sub	r3, fp, #56
	ldr	r0, [fp, #-60]
	mov	r1, r3
	bl	kernel_queuePop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L44
	mov	r0, #1
	ldr	r3, .L48+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L49:
	.align	2
.L48:
	.word	_GLOBAL_OFFSET_TABLE_-(.L47+8)
	.word	.LC36(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	userTask1(GOT)
	.word	.LC38(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.word	.LC41(GOTOFF)
	.size	kernelTestRun, .-kernelTestRun
	.section	.rodata
	.align	2
.LC42:
	.ascii	"Kernel:Starting test...\015\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16783432
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	add	sp, sp, #-16777216
	sub	sp, sp, #6208
	sub	sp, sp, #8
	ldr	sl, .L53
.L52:
	add	sl, pc, sl
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mov	r2, #40
	ldr	r3, .L53+4
	ldr	r3, [sl, r3]
	add	r3, r3, #2195456
	str	r3, [r2, #0]
	mov	r0, #1
	ldr	r3, .L53+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, .L53+12
	sub	r2, fp, #16
	add	r3, r2, r3
	mov	r0, r3
	bl	initKernel(PLT)
	ldr	r3, .L53+12
	sub	r2, fp, #16
	add	r3, r2, r3
	mov	r0, r3
	bl	kernelTestRun(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L54:
	.align	2
.L53:
	.word	_GLOBAL_OFFSET_TABLE_-(.L52+8)
	.word	swiHandler(GOT)
	.word	.LC42(GOTOFF)
	.word	-16783432
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
