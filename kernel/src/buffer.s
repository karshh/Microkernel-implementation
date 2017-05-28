	.file	"buffer.c"
	.text
	.align	2
	.global	circularBufferInit
	.type	circularBufferInit, %function
circularBufferInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	str	r3, [r0, #128]
	str	r3, [r0, #132]
	mov	r0, #1
	@ lr needed for prologue
	bx	lr
	.size	circularBufferInit, .-circularBufferInit
	.align	2
	.global	addToBuffer
	.type	addToBuffer, %function
addToBuffer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #128]
	mov	r2, #0
	add	r3, r3, #1
	cmp	r3, #31
	ldrle	r3, [r1, #128]
	mov	ip, r0
	addle	r2, r3, #1
	ldr	r3, [r1, #132]
	mov	r0, #0
	cmp	r2, r3
	ldrne	r3, [r1, #128]
	movne	r0, #1
	@ lr needed for prologue
	strne	r2, [r1, #128]
	strne	ip, [r1, r3, asl #2]
	bx	lr
	.size	addToBuffer, .-addToBuffer
	.align	2
	.global	getFromBuffer
	.type	getFromBuffer, %function
getFromBuffer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r1, #132]
	str	lr, [sp, #-4]!
	add	r3, r3, #1
	cmp	r3, #31
	ldrle	r3, [r1, #132]
	mov	lr, #0
	ldr	r2, [r1, #128]
	addle	lr, r3, #1
	ldr	r3, [r1, #132]
	mov	ip, r0
	cmp	r2, r3
	mov	r0, #0
	ldreq	pc, [sp], #4
	ldr	r2, [r1, #132]
	mov	r0, #1
	ldr	r3, [r1, r2, asl #2]
	str	lr, [r1, #132]
	str	r3, [ip, #0]
	ldr	pc, [sp], #4
	.size	getFromBuffer, .-getFromBuffer
	.align	2
	.global	isBufferEmpty
	.type	isBufferEmpty, %function
isBufferEmpty:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #128]
	ldr	r0, [r0, #132]
	@ lr needed for prologue
	cmp	r3, r0
	movne	r0, #0
	moveq	r0, #1
	bx	lr
	.size	isBufferEmpty, .-isBufferEmpty
	.align	2
	.global	bufferLength
	.type	bufferLength, %function
bufferLength:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #128]
	ldr	r3, [r0, #132]
	@ lr needed for prologue
	cmp	r2, r3
	mov	r1, #0
	beq	.L25
	ldr	r2, [r0, #128]
	ldr	r3, [r0, #132]
	cmp	r2, r3
	ldrle	r3, [r0, #128]
	ldrle	r2, [r0, #132]
	ldrgt	r2, [r0, #128]
	ldrgt	r3, [r0, #132]
	rsble	r3, r2, r3
	rsbgt	r1, r3, r2
	addle	r1, r3, #32
.L25:
	mov	r0, r1
	bx	lr
	.size	bufferLength, .-bufferLength
	.ident	"GCC: (GNU) 4.0.2"
