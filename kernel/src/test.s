	.file	"test.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"USER TASK 1 ENTRY\015\012\000"
	.align	2
.LC1:
	.ascii	"USER TASK 1 MIDDLE \015\012\000"
	.align	2
.LC2:
	.ascii	"USER TASK 1 EXIT, REQUESTING TID.\015\012\000"
	.text
	.align	2
	.global	userTask1
	.type	userTask1, %function
userTask1:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
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
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	userTask1, .-userTask1
	.align	2
	.type	processRequest, %function
processRequest:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	beq	.L8
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	beq	.L9
	b	.L10
.L8:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
	mov	r0, #1
	mov	r1, #82
	bl	bwputc(PLT)
	b	.L10
.L9:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
.L10:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	processRequest, .-processRequest
	.section	.rodata
	.align	2
.LC3:
	.ascii	"Pushed TD %d on the queue\012\015\000"
	.align	2
.LC4:
	.ascii	"FAIL, TASK %d IS NOT READY OR ACTIVE. \012\015\000"
	.align	2
.LC5:
	.ascii	"Request for task %d recieved\012\015\000"
	.align	2
.LC6:
	.ascii	"Wrong request type recieved [%d]. \012\015\000"
	.align	2
.LC7:
	.ascii	"SUCCESS! TID: %d \012\015\000"
	.align	2
.LC8:
	.ascii	"Exiting..\012\015\000"
	.text
	.align	2
	.global	kernelTestRun
	.type	kernelTestRun, %function
kernelTestRun:
	@ args = 0, pretend = 0, frame = 456
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #456
	ldr	sl, .L23
.L22:
	add	sl, pc, sl
	sub	r3, fp, #428
	mov	r0, r3
	bl	queueInit(PLT)
	mov	r3, #1
	str	r3, [fp, #-444]
	mov	r3, #0
	str	r3, [fp, #-440]
	mov	r3, #1
	str	r3, [fp, #-436]
	mov	r3, #1
	str	r3, [fp, #-432]
	mov	r3, #208
	str	r3, [fp, #-452]
	mvn	r3, #0
	str	r3, [fp, #-456]
	mov	r3, #0
	str	r3, [fp, #-468]
	mvn	r3, #0
	str	r3, [fp, #-464]
	mov	r3, #27262976
	str	r3, [fp, #-460]
	ldr	r3, [fp, #-460]
	sub	r2, r3, #44
	ldr	r3, .L23+4
	ldr	r3, [sl, r3]
	add	r3, r3, #2195456
	str	r3, [r2, #0]
	ldr	r3, [fp, #-460]
	sub	r2, r3, #48
	ldr	r3, [fp, #-452]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-460]
	sub	r3, r3, #48
	str	r3, [fp, #-460]
	ldr	ip, [fp, #-436]
	sub	r3, fp, #428
	sub	r2, fp, #460
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	queuePush(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L12
	ldr	r3, [fp, #-444]
	mov	r0, #1
	ldr	r2, .L23+8
	add	r2, sl, r2
	mov	r1, r2
	mov	r2, r3
	bl	bwprintf(PLT)
.L12:
	sub	r3, fp, #428
	sub	r2, fp, #472
	mov	r0, r3
	mov	r1, r2
	bl	queuePop(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L14
	ldr	r3, [fp, #-472]
	ldr	r3, [r3, #28]
	cmp	r3, #1
	beq	.L16
	ldr	r3, [fp, #-472]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L16
	ldr	r3, [fp, #-472]
	ldr	r2, [r3, #16]
	mov	r0, #1
	ldr	r3, .L23+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L14
.L16:
	ldr	r3, [fp, #-472]
	mov	r2, r3
	sub	r3, fp, #468
	mov	r0, r3
	mov	r1, r2
	bl	activate(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-472]
	ldr	r2, [r3, #16]
	mov	r0, #1
	ldr	r3, .L23+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	cmp	r3, #1
	beq	.L19
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L23+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L14
.L19:
	ldr	r3, [fp, #-472]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	processRequest(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #4]
	mov	r0, #1
	ldr	r3, .L23+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
.L14:
	mov	r0, #1
	ldr	r3, .L23+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L24:
	.align	2
.L23:
	.word	_GLOBAL_OFFSET_TABLE_-(.L22+8)
	.word	userTask1(GOT)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.size	kernelTestRun, .-kernelTestRun
	.section	.rodata
	.align	2
.LC9:
	.ascii	"Starting test...\015\012\000"
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
	ldr	sl, .L28
.L27:
	add	sl, pc, sl
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mov	r2, #40
	ldr	r3, .L28+4
	ldr	r3, [sl, r3]
	add	r3, r3, #2195456
	str	r3, [r2, #0]
	mov	r0, #1
	ldr	r3, .L28+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	kernelTestRun(PLT)
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L29:
	.align	2
.L28:
	.word	_GLOBAL_OFFSET_TABLE_-(.L27+8)
	.word	swiHandler(GOT)
	.word	.LC9(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
