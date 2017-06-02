	.file	"kernelHandler.c"
	.text
	.align	2
	.global	getNextTID
	.type	getNextTID, %function
getNextTID:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	sub	r3, fp, #16
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	free_Pop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L2
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L4
.L2:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-28]
.L4:
	ldr	r3, [fp, #-28]
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
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	ldr	sl, .L20
.L19:
	add	sl, pc, sl
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	str	r2, [fp, #-44]
	bl	disableInterrupts(PLT)
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	bl	initHandlers(PLT)
	ldr	r1, [fp, #-36]
	ldr	r2, .L20+4
	mov	r3, #0
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r1, [fp, #-36]
	ldr	r2, .L20+8
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L20+12
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L20+16
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L20+20
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L20+24
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r3, [fp, #-36]
	add	r3, r3, #303104
	add	r3, r3, #2336
	add	r3, r3, #16777216
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #28
	add	r3, r2, r1
	and	r3, r3, #15
	rsb	r3, r1, r3
	mov	r2, r3
	ldr	r3, [fp, #-28]
	rsb	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r1, [fp, #-36]
	ldr	r2, .L20+28
	ldr	r3, [fp, #-28]
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L7
.L8:
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r2, [fp, #-32]
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-28]
	bl	initTD(PLT)
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	free_Push(PLT)
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L7:
	ldr	r3, [fp, #-32]
	cmp	r3, #127
	ble	.L8
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L10
.L11:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-36]
	ldr	r1, .L20+32
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-36]
	ldr	r1, .L20+36
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L10:
	ldr	r3, [fp, #-24]
	cmp	r3, #31
	ble	.L11
	ldr	r1, [fp, #-36]
	ldr	r2, .L20+40
	mov	r3, #0
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-32]
	sub	r3, fp, #32
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	getNextTID(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L13
	mov	r0, #1
	ldr	r3, .L20+44
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-48]
	b	.L15
.L13:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r2
	mvn	r2, #0
	ldr	r3, [fp, #-40]
	bl	setTask(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L16
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #32]
	mov	r0, #1
	ldr	r3, .L20+48
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #1
	str	r3, [fp, #-48]
	b	.L15
.L16:
	mov	r3, #0
	str	r3, [fp, #-48]
.L15:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L21:
	.align	2
.L20:
	.word	_GLOBAL_OFFSET_TABLE_-(.L19+8)
	.word	305420
	.word	305412
	.word	305416
	.word	305424
	.word	305428
	.word	305432
	.word	305436
	.word	305152
	.word	305280
	.word	305408
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	initKernel, .-initKernel
	.section	.rodata
	.align	2
.LC2:
	.ascii	"PROCESS request failed!\012\015\000"
	.text
	.align	2
	.global	kernelRun
	.type	kernelRun, %function
kernelRun:
	@ args = 0, pretend = 0, frame = 17082836
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #17039360
	sub	sp, sp, #43264
	sub	sp, sp, #212
	ldr	sl, .L34
.L33:
	add	sl, pc, sl
	ldr	r3, .L34+4
	sub	r2, fp, #16
	str	r0, [r2, r3]
	ldr	r3, .L34+8
	sub	r0, fp, #16
	str	r1, [r0, r3]
	ldr	r3, .L34+12
	sub	r1, fp, #16
	add	r3, r1, r3
	ldr	r2, .L34+4
	ldr	ip, .L34+8
	mov	r0, r3
	sub	r3, fp, #16
	ldr	r1, [r3, r2]
	sub	r3, fp, #16
	ldr	r2, [r3, ip]
	bl	initKernel(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L32
	ldr	r2, .L34+16
	mov	r3, #0
	sub	r0, fp, #16
	str	r3, [r0, r2]
	b	.L25
.L26:
	ldr	r3, .L34+16
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	mov	r3, #1
	str	r3, [r2, #48]
	ldr	r3, .L34+16
	sub	r2, fp, #16
	ldr	r1, [r2, r3]
	ldr	r3, .L34+12
	ldr	r2, .L34+20
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r3, .L34+16
	sub	r1, fp, #16
	ldr	r3, [r1, r3]
	str	r3, [fp, #-20]
	ldr	r3, .L34+12
	ldr	r2, .L34+20
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	activate(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, .L34+12
	sub	r1, fp, #16
	add	r3, r1, r3
	ldr	ip, .L34+24
	sub	r2, fp, #16
	add	ip, r2, ip
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	processRequest(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L27
	mov	r0, #1
	ldr	r3, .L34+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L29
.L27:
	ldr	r3, .L34+16
	sub	r0, fp, #16
	ldr	r3, [r0, r3]
	ldr	r3, [r3, #48]
	cmp	r3, #1
	bne	.L30
	ldr	r3, .L34+16
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	ldr	r3, .L34+12
	sub	r0, fp, #16
	add	r3, r0, r3
	mov	r0, r3
	mov	r1, r2
	bl	kernel_queuePush(PLT)
.L30:
	ldr	r3, .L34+12
	ldr	r2, .L34+20
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
.L25:
	ldr	r3, .L34+12
	sub	r2, fp, #16
	add	r3, r2, r3
	ldr	r2, .L34+16
	sub	r0, fp, #16
	add	r2, r0, r2
	mov	r0, r3
	mov	r1, r2
	bl	kernel_queuePop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L26
.L29:
	bl	disableInterrupts(PLT)
.L32:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.L33+8)
	.word	-17082832
	.word	-17082836
	.word	-17082680
	.word	-17082828
	.word	305420
	.word	-17082824
	.word	.LC2(GOTOFF)
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
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #44]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #36]
	ldr	r3, [fp, #-32]
	cmn	r3, #1
	bne	.L37
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #40]
	b	.L39
.L37:
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-32]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r2, r1, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #40]
.L39:
	ldr	r2, [fp, #-16]
	mov	r3, #2
	str	r3, [r2, #48]
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #4]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #17
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, .L41
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
	ldr	r3, [r3, #24]
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
.L42:
	.align	2
.L41:
	.word	305436
	.size	setTask, .-setTask
	.align	2
	.global	kernel_queuePush
	.type	kernel_queuePush, %function
kernel_queuePush:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #44]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	ldr	r1, .L48
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L44
	mov	r2, #1
	ldr	r3, [fp, #-28]
	mov	r3, r2, asl r3
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	ldr	r3, .L48+4
	ldr	r0, [r2, r3]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #0
	mov	r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, .L48+4
	ldr	r3, [r2, r3]
	eor	r2, r1, r3
	ldr	r3, [fp, #-24]
	and	r3, r2, r3
	eor	r1, r0, r3
	ldr	r2, [fp, #-32]
	ldr	r3, .L48+4
	str	r1, [r2, r3]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	ldr	r1, .L48
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	ldr	r1, .L48+8
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #52]
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r2, [fp, #-36]
	mov	r3, #2
	str	r3, [r2, #48]
	b	.L46
.L44:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	ldr	r1, .L48
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #52]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #56]
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #52]
	ldr	r2, [fp, #-36]
	mov	r3, #2
	str	r3, [r2, #48]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	ldr	r1, .L48
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
.L46:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L49:
	.align	2
.L48:
	.word	305152
	.word	305408
	.word	305280
	.size	kernel_queuePush, .-kernel_queuePush
	.align	2
	.global	free_Push
	.type	free_Push, %function
free_Push:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r2, .L55
	ldr	r3, [r3, r2]
	cmp	r3, #0
	bne	.L51
	ldr	r1, [fp, #-20]
	ldr	r2, .L55
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L55+4
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #52]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #48]
	b	.L53
.L51:
	ldr	r2, [fp, #-20]
	ldr	r3, .L55
	ldr	r3, [r2, r3]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #52]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #56]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #52]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #48]
	ldr	r1, [fp, #-20]
	ldr	r2, .L55
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
.L53:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L56:
	.align	2
.L55:
	.word	305412
	.word	305416
	.size	free_Push, .-free_Push
	.align	2
	.global	kernel_queuePop_priority
	.type	kernel_queuePop_priority, %function
kernel_queuePop_priority:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L65
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L58
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L60
.L58:
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L65
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #52]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L61
	ldr	r2, [fp, #-40]
	mov	r3, #1
	mov	r3, r3, asl r2
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	ldr	r3, .L65+4
	ldr	r0, [r2, r3]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	mov	r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, .L65+4
	ldr	r3, [r2, r3]
	eor	r2, r1, r3
	ldr	r3, [fp, #-20]
	and	r3, r2, r3
	eor	r1, r0, r3
	ldr	r2, [fp, #-32]
	ldr	r3, .L65+4
	str	r1, [r2, r3]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L65
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L65+8
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	b	.L63
.L61:
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L65
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
.L63:
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #52]
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-44]
.L60:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L66:
	.align	2
.L65:
	.word	305280
	.word	305408
	.word	305152
	.size	kernel_queuePop_priority, .-kernel_queuePop_priority
	.align	2
	.global	free_Pop
	.type	free_Pop, %function
free_Pop:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldr	r2, .L75
	ldr	r3, [r3, r2]
	cmp	r3, #0
	bne	.L68
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L70
.L68:
	ldr	r2, [fp, #-24]
	ldr	r3, .L75
	ldr	r3, [r2, r3]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #52]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L71
	ldr	r1, [fp, #-24]
	ldr	r2, .L75
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L75+4
	mov	r3, #0
	str	r3, [r1, r2]
	b	.L73
.L71:
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r1, [fp, #-24]
	ldr	r2, .L75
	ldr	r3, [fp, #-16]
	str	r3, [r1, r2]
.L73:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #52]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-32]
.L70:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L76:
	.align	2
.L75:
	.word	305416
	.word	305412
	.size	free_Pop, .-free_Pop
	.align	2
	.global	kernel_queuePop
	.type	kernel_queuePop, %function
kernel_queuePop:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r3, .L93
	ldr	r3, [r2, r3]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L78
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L80
.L78:
	ldr	r3, [fp, #-20]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L81
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L83
.L81:
	mov	r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L84
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #16
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #16
	str	r3, [fp, #-16]
.L84:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L86
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #8
	str	r3, [fp, #-16]
.L86:
	ldr	r3, [fp, #-20]
	and	r3, r3, #15
	cmp	r3, #0
	bne	.L88
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #4
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	str	r3, [fp, #-16]
.L88:
	ldr	r3, [fp, #-20]
	and	r3, r3, #3
	cmp	r3, #0
	bne	.L90
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	str	r3, [fp, #-16]
.L90:
	ldr	r3, [fp, #-20]
	and	r2, r3, #1
	ldr	r3, [fp, #-16]
	rsb	r3, r2, r3
	str	r3, [fp, #-16]
.L83:
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	kernel_queuePop_priority(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
.L80:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L94:
	.align	2
.L93:
	.word	305408
	.size	kernel_queuePop, .-kernel_queuePop
	.ident	"GCC: (GNU) 4.0.2"
