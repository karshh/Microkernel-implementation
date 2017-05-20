	.file	"queue.c"
	.text
	.align	2
	.global	queueInit
	.type	queueInit, %function
queueInit:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r3, #408
	mov	r0, r3
	bl	circularBufferInit(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L2
	ldr	r3, [fp, #-20]
	mov	r0, r3
	bl	circularBufferInit(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L2
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L5
.L2:
	mov	r3, #0
	str	r3, [fp, #-32]
.L5:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L6
	ldr	r3, [fp, #-20]
	add	r3, r3, #136
	mov	r0, r3
	bl	circularBufferInit(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L6
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L9
.L6:
	mov	r3, #0
	str	r3, [fp, #-28]
.L9:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [fp, #-20]
	add	r3, r3, #272
	mov	r0, r3
	bl	circularBufferInit(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L10
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L13
.L10:
	mov	r3, #0
	str	r3, [fp, #-24]
.L13:
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	queueInit, .-queueInit
	.align	2
	.global	queuePush
	.type	queuePush, %function
queuePush:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #28]
	sub	r3, r3, #1
	cmp	r3, #3
	addls	pc, pc, r3, asl #2
	b	.L16
	.p2align 2
.L21:
	b	.L17
	b	.L18
	b	.L19
	b	.L20
.L17:
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	addToBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L22
.L18:
	ldr	r3, [fp, #-16]
	add	r3, r3, #136
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	addToBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L22
.L19:
	ldr	r3, [fp, #-16]
	add	r3, r3, #272
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	addToBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L22
.L20:
	ldr	r3, [fp, #-16]
	add	r3, r3, #408
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	addToBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	b	.L22
.L16:
	mov	r3, #0
	str	r3, [fp, #-24]
.L22:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	queuePush, .-queuePush
	.align	2
	.global	queuePriorityPop
	.type	queuePriorityPop, %function
queuePriorityPop:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	cmp	r3, #3
	addls	pc, pc, r3, asl #2
	b	.L25
	.p2align 2
.L30:
	b	.L26
	b	.L27
	b	.L28
	b	.L29
.L26:
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	getFromBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	b	.L31
.L27:
	ldr	r3, [fp, #-16]
	add	r3, r3, #136
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	getFromBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	b	.L31
.L28:
	ldr	r3, [fp, #-16]
	add	r3, r3, #272
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	getFromBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	b	.L31
.L29:
	ldr	r3, [fp, #-16]
	add	r3, r3, #408
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	getFromBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	b	.L31
.L25:
	mov	r3, #0
	str	r3, [fp, #-28]
.L31:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	queuePriorityPop, .-queuePriorityPop
	.align	2
	.global	queuePop
	.type	queuePop, %function
queuePop:
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
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	mov	r2, #1
	bl	queuePriorityPop(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L34
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L36
.L34:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	mov	r2, #2
	bl	queuePriorityPop(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L37
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L36
.L37:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	mov	r2, #3
	bl	queuePriorityPop(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-28]
.L36:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	queuePop, .-queuePop
	.ident	"GCC: (GNU) 4.0.2"
