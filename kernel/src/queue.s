	.file	"queue.c"
	.text
	.align	2
	.global	queueInit
	.type	queueInit, %function
queueInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	bl	circularBufferInit(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L2
	ldr	r3, [fp, #-16]
	add	r3, r3, #520
	mov	r0, r3
	bl	circularBufferInit(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L2
	ldr	r3, [fp, #-16]
	add	r3, r3, #1040
	mov	r0, r3
	bl	circularBufferInit(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L2
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L6
.L2:
	mov	r3, #0
	str	r3, [fp, #-20]
.L6:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	queueInit, .-queueInit
	.align	2
	.global	queuePush
	.type	queuePush, %function
queuePush:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L9
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	addToBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	b	.L11
.L9:
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	bne	.L12
	ldr	r3, [fp, #-16]
	add	r3, r3, #520
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	addToBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L14
.L12:
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	bne	.L15
	ldr	r3, [fp, #-16]
	add	r3, r3, #1040
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	addToBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	b	.L17
.L15:
	mov	r3, #0
	str	r3, [fp, #-28]
.L17:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
.L14:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-36]
.L11:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	queuePush, .-queuePush
	.align	2
	.global	queuePriorityPop
	.type	queuePriorityPop, %function
queuePriorityPop:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #1
	bne	.L20
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	getFromBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	b	.L22
.L20:
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	bne	.L23
	ldr	r3, [fp, #-16]
	add	r3, r3, #520
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	getFromBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L25
.L23:
	ldr	r3, [fp, #-24]
	cmp	r3, #3
	bne	.L26
	ldr	r3, [fp, #-16]
	add	r3, r3, #1040
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	getFromBuffer(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	b	.L28
.L26:
	mov	r3, #0
	str	r3, [fp, #-28]
.L28:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
.L25:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-36]
.L22:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	queuePriorityPop, .-queuePriorityPop
	.align	2
	.global	queuePop
	.type	queuePop, %function
queuePop:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r2, #1
	bl	queuePriorityPop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L31
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r2, #2
	bl	queuePriorityPop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L31
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r2, #3
	bl	queuePriorityPop(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L34
.L31:
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L35
.L34:
	mov	r3, #0
	str	r3, [fp, #-24]
.L35:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	queuePop, .-queuePop
	.ident	"GCC: (GNU) 4.0.2"
