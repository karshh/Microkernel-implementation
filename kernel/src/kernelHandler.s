	.file	"kernelHandler.c"
	.text
	.align	2
	.global	getNextTID
	.type	getNextTID, %function
getNextTID:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #560]
	cmp	r3, #128
	bne	.L2
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L4
.L2:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #560]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #560]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #560]
	mov	r3, #0
	str	r3, [fp, #-24]
.L4:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	getNextTID, .-getNextTID
	.section	.rodata
	.align	2
.LC0:
	.ascii	"error getting TID\012\015\000"
	.align	2
.LC1:
	.ascii	"Kernel:failed to push TD %d on the queue\012\015\000"
	.text
	.align	2
	.global	initKernel
	.type	initKernel, %function
initKernel:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	ldr	sl, .L17
.L16:
	add	sl, pc, sl
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mov	r2, #40
	ldr	r3, .L17+4
	ldr	r3, [sl, r3]
	add	r3, r3, #2195456
	str	r3, [r2, #0]
	ldr	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [r2, #560]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	add	r3, r3, #6144
	add	r3, r3, #52
	add	r3, r3, #16777216
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #28
	add	r3, r2, r1
	and	r3, r3, #15
	rsb	r3, r1, r3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	rsb	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-32]
	ldr	r2, .L17+8
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L7
.L8:
	ldr	r3, [fp, #-32]
	add	r1, r3, #564
	ldr	r3, [fp, #-28]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	ldr	r2, [fp, #-28]
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-24]
	bl	initTD(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L7:
	ldr	r3, [fp, #-28]
	cmp	r3, #127
	ble	.L8
	ldr	r3, [fp, #-32]
	add	r3, r3, #16
	mov	r0, r3
	bl	queueInit(PLT)
	mov	r3, #0
	str	r3, [fp, #-28]
	sub	r3, fp, #28
	ldr	r0, [fp, #-32]
	mov	r1, r3
	bl	getNextTID(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L10
	mov	r0, #1
	ldr	r3, .L17+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-44]
	b	.L12
.L10:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-40]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-32]
	mov	r1, r2
	mvn	r2, #0
	ldr	r3, [fp, #-36]
	bl	setTask(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-20]
	bl	kernel_queuePush(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L13
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #16]
	mov	r0, #1
	ldr	r3, .L17+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #1
	str	r3, [fp, #-44]
	b	.L12
.L13:
	mov	r3, #0
	str	r3, [fp, #-44]
.L12:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L18:
	.align	2
.L17:
	.word	_GLOBAL_OFFSET_TABLE_-(.L16+8)
	.word	swiHandler(GOT)
	.word	16783428
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	initKernel, .-initKernel
	.align	2
	.global	kernelRun
	.type	kernelRun, %function
kernelRun:
	@ args = 0, pretend = 0, frame = 16783456
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	add	sp, sp, #-16777216
	sub	sp, sp, #6208
	sub	sp, sp, #32
	ldr	r3, .L25
	sub	r2, fp, #12
	str	r0, [r2, r3]
	ldr	r3, .L25+4
	sub	r0, fp, #12
	str	r1, [r0, r3]
	ldr	r3, .L25+8
	sub	r1, fp, #12
	add	r3, r1, r3
	ldr	r2, .L25
	ldr	ip, .L25+4
	mov	r0, r3
	sub	r3, fp, #12
	ldr	r1, [r3, r2]
	sub	r3, fp, #12
	ldr	r2, [r3, ip]
	bl	initKernel(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L24
	b	.L22
.L23:
	ldr	r3, .L25+12
	sub	r0, fp, #12
	ldr	r3, [r0, r3]
	ldr	r2, [r3, #4]
	ldr	r3, .L25+12
	sub	r1, fp, #12
	ldr	r3, [r1, r3]
	mov	r0, r2
	mov	r1, r3
	bl	activate(PLT)
	mov	r2, r0
	ldr	r3, .L25+16
	sub	r0, fp, #12
	add	ip, r0, r3
	mov	r3, r2
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	ldr	r3, .L25+12
	sub	r2, fp, #12
	ldr	r1, [r2, r3]
	ldr	r3, .L25+8
	sub	r0, fp, #12
	add	r3, r0, r3
	ldr	r2, .L25+16
	sub	r0, fp, #12
	add	r2, r0, r2
	mov	r0, r3
	bl	processRequest(PLT)
	ldr	r3, .L25+12
	sub	r1, fp, #12
	ldr	r2, [r1, r3]
	ldr	r3, .L25+8
	sub	r0, fp, #12
	add	r3, r0, r3
	mov	r0, r3
	mov	r1, r2
	bl	kernel_queuePush(PLT)
.L22:
	ldr	r3, .L25+8
	sub	r1, fp, #12
	add	r3, r1, r3
	ldr	r2, .L25+12
	sub	r0, fp, #12
	add	r2, r0, r2
	mov	r0, r3
	mov	r1, r2
	bl	kernel_queuePop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L23
.L24:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	-16783452
	.word	-16783456
	.word	-16783432
	.word	-16783436
	.word	-16783448
	.size	kernelRun, .-kernelRun
	.align	2
	.global	setTask
	.type	setTask, %function
setTask:
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r1, r3, #564
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #28]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #20]
	ldr	r3, [fp, #-32]
	cmn	r3, #1
	bne	.L28
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #24]
	b	.L30
.L28:
	ldr	r3, [fp, #-24]
	add	r1, r3, #564
	ldr	r2, [fp, #-32]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r2, r1, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #24]
.L30:
	ldr	r2, [fp, #-16]
	mov	r3, #2
	str	r3, [r2, #40]
	ldr	r2, [fp, #-16]
	mov	r3, #208
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #4]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #17
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, .L32
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, r2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	sub	r2, r3, #44
	ldr	r3, [fp, #4]
	add	r3, r3, #2195456
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	sub	r2, r3, #48
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	sub	r2, r3, #48
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L33:
	.align	2
.L32:
	.word	16783428
	.size	setTask, .-setTask
	.align	2
	.global	kernel_queuePush
	.type	kernel_queuePush, %function
kernel_queuePush:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #16
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	queuePush(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_queuePush, .-kernel_queuePush
	.align	2
	.global	kernel_queuePop
	.type	kernel_queuePop, %function
kernel_queuePop:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #16
	mov	r0, r3
	ldr	r1, [fp, #-20]
	bl	queuePop(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_queuePop, .-kernel_queuePop
	.ident	"GCC: (GNU) 4.0.2"
