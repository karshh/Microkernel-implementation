	.file	"test.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"USER TASK 1 ENTRY. REQUEST ID = %d\015\012\000"
	.align	2
.LC1:
	.ascii	"USER TASK 1 MIDDLE \015\012\000"
	.align	2
.LC2:
	.ascii	"USER TASK 1 EXIT, REQUESTING TID.\015\012\000"
	.align	2
.LC3:
	.ascii	"USER TASK 1 GOT TID = %d.\015\012\000"
	.align	2
.LC4:
	.ascii	"USER TASK 1 EXIT, REQUESTING Parent TID.\015\012\000"
	.align	2
.LC5:
	.ascii	"USER TASK 1 GOT Parent TID = %d.\015\012\000"
	.text
	.align	2
	.global	userTask1
	.type	userTask1, %function
userTask1:
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
.LC6:
	.ascii	"Kernel:Pushed TD %d on the queue\012\015\000"
	.align	2
.LC7:
	.ascii	"Kernel:Running task %d. \012\015\000"
	.align	2
.LC8:
	.ascii	"Kernel:Exiting..\012\015\000"
	.text
	.align	2
	.global	kernelTestRun
	.type	kernelTestRun, %function
kernelTestRun:
	@ args = 0, pretend = 0, frame = 452
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #452
	ldr	sl, .L16
.L15:
	add	sl, pc, sl
	sub	r3, fp, #424
	mov	r0, r3
	bl	queueInit(PLT)
	ldr	r3, .L16+4
	str	r3, [fp, #-440]
	mov	r3, #123
	str	r3, [fp, #-436]
	mov	r3, #1
	str	r3, [fp, #-432]
	mov	r3, #1
	str	r3, [fp, #-428]
	mov	r3, #208
	str	r3, [fp, #-448]
	mvn	r3, #0
	str	r3, [fp, #-452]
	mov	r3, #2
	str	r3, [fp, #-460]
	mov	r3, #4194304
	str	r3, [fp, #-456]
	ldr	r3, [fp, #-456]
	sub	r2, r3, #44
	ldr	r3, .L16+8
	ldr	r3, [sl, r3]
	add	r3, r3, #2195456
	str	r3, [r2, #0]
	ldr	r3, [fp, #-456]
	sub	r2, r3, #48
	ldr	r3, [fp, #-448]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-456]
	sub	r3, r3, #48
	str	r3, [fp, #-456]
	ldr	ip, [fp, #-432]
	sub	r3, fp, #424
	sub	r2, fp, #456
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	queuePush(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L11
	ldr	r3, [fp, #-440]
	mov	r0, #1
	ldr	r2, .L16+12
	add	r2, sl, r2
	mov	r1, r2
	mov	r2, r3
	bl	bwprintf(PLT)
	b	.L11
.L12:
	ldr	r3, [fp, #-468]
	ldr	r2, [r3, #16]
	mov	r0, #1
	ldr	r3, .L16+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-468]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-468]
	mov	r0, r2
	mov	r1, r3
	bl	activate(PLT)
	mov	r3, r0
	ldr	r3, [r3, #0]
	str	r3, [fp, #-464]
	ldr	r3, [fp, #-468]
	sub	r2, fp, #464
	mov	r0, r3
	mov	r1, r2
	bl	processRequest(PLT)
	ldr	r2, [fp, #-468]
	ldr	r3, [fp, #-468]
	ldr	ip, [r3, #24]
	sub	r3, fp, #424
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	queuePush(PLT)
.L11:
	sub	r3, fp, #424
	sub	r2, fp, #468
	mov	r0, r3
	mov	r1, r2
	bl	queuePop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L12
	mov	r0, #1
	ldr	r3, .L16+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L17:
	.align	2
.L16:
	.word	_GLOBAL_OFFSET_TABLE_-(.L15+8)
	.word	1234
	.word	userTask1(GOT)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.size	kernelTestRun, .-kernelTestRun
	.section	.rodata
	.align	2
.LC9:
	.ascii	"Kernel:Starting test...\015\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L21
.L20:
	add	sl, pc, sl
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mov	r2, #40
	ldr	r3, .L21+4
	ldr	r3, [sl, r3]
	add	r3, r3, #2195456
	str	r3, [r2, #0]
	mov	r0, #1
	ldr	r3, .L21+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	kernelTestRun(PLT)
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	_GLOBAL_OFFSET_TABLE_-(.L20+8)
	.word	swiHandler(GOT)
	.word	.LC9(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
