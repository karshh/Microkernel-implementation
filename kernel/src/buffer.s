	.file	"buffer.c"
	.text
	.align	2
	.global	circularBufferInit
	.type	circularBufferInit, %function
circularBufferInit:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #2048]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #2052]
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	circularBufferInit, .-circularBufferInit
	.align	2
	.global	addToBuffer
	.type	addToBuffer, %function
addToBuffer:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2048]
	add	r2, r3, #1
	ldr	r3, .L11
	cmp	r2, r3
	bgt	.L4
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2048]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	b	.L6
.L4:
	mov	r3, #0
	str	r3, [fp, #-32]
.L6:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #2052]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L7
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L9
.L7:
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #2048]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [r2, r1, asl #2]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #2048]
	mov	r3, #1
	str	r3, [fp, #-28]
.L9:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	511
	.size	addToBuffer, .-addToBuffer
	.align	2
	.global	getFromBuffer
	.type	getFromBuffer, %function
getFromBuffer:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2052]
	add	r2, r3, #1
	ldr	r3, .L21
	cmp	r2, r3
	bgt	.L14
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2052]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	b	.L16
.L14:
	mov	r3, #0
	str	r3, [fp, #-32]
.L16:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #2048]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2052]
	cmp	r2, r3
	bne	.L17
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L19
.L17:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #2052]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #2052]
	mov	r3, #1
	str	r3, [fp, #-28]
.L19:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	511
	.size	getFromBuffer, .-getFromBuffer
	.ident	"GCC: (GNU) 4.0.2"
