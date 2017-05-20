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
	.align	2
	.global	initKernel
	.type	initKernel, %function
initKernel:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #560]
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r3, #6144
	add	r3, r3, #52
	add	r3, r3, #16777216
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #28
	add	r3, r2, r1
	and	r3, r3, #15
	rsb	r3, r1, r3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	rsb	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-24]
	ldr	r2, .L11
	ldr	r3, [fp, #-16]
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L7
.L8:
	ldr	r3, [fp, #-24]
	add	r1, r3, #564
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	mov	r0, r3
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-16]
	bl	initTD(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L7:
	ldr	r3, [fp, #-20]
	cmp	r3, #127
	ble	.L8
	ldr	r3, [fp, #-24]
	add	r3, r3, #16
	mov	r0, r3
	bl	queueInit(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	16783428
	.size	initKernel, .-initKernel
	.align	2
	.global	kernelRun
	.type	kernelRun, %function
kernelRun:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-32]
	b	.L14
.L15:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	mov	r0, r2
	mov	r1, r3
	bl	activate(PLT)
	mov	r3, r0
	sub	ip, fp, #28
	ldmia	r3, {r0, r1, r2}
	stmia	ip, {r0, r1, r2}
	ldr	r3, [fp, #-16]
	sub	r2, fp, #28
	ldr	r0, [fp, #-32]
	mov	r1, r3
	bl	processRequest(PLT)
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-32]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
.L14:
	sub	r3, fp, #16
	ldr	r0, [fp, #-32]
	mov	r1, r3
	bl	kernel_queuePop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L15
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
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
	bne	.L19
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #24]
	b	.L21
.L19:
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
.L21:
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
	ldr	r3, .L23
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
.L24:
	.align	2
.L23:
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
