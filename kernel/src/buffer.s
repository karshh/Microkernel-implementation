	.file	"buffer.c"
	.text
	.align	2
	.global	circularBufferInit
	.type	circularBufferInit, %function
circularBufferInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L3
	mov	r1, #0
	mov	r3, #16384
	str	r1, [r0, r3]
	str	r1, [r0, r2]
	mov	r0, #1
	@ lr needed for prologue
	bx	lr
.L4:
	.align	2
.L3:
	.word	16388
	.size	circularBufferInit, .-circularBufferInit
	.align	2
	.global	addToBuffer
	.type	addToBuffer, %function
addToBuffer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #16384
	ldr	r3, [r1, r2]
	mov	ip, #0
	add	r3, r3, #1
	cmp	r3, #4096
	ldrlt	r3, [r1, r2]
	stmfd	sp!, {r4, lr}
	addlt	ip, r3, #1
	ldr	r3, .L13
	mov	lr, #16384
	ldr	r2, [r1, r3]
	mov	r4, r0
	cmp	ip, r2
	ldrne	r3, [r1, lr]
	mov	r0, #0
	movne	r0, #1
	strne	ip, [r1, lr]
	strne	r4, [r1, r3, asl #2]
	ldmfd	sp!, {r4, pc}
.L14:
	.align	2
.L13:
	.word	16388
	.size	addToBuffer, .-addToBuffer
	.align	2
	.global	getFromBuffer
	.type	getFromBuffer, %function
getFromBuffer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r2, .L24
	ldr	lr, .L24
	ldr	r3, [r1, r2]
	mov	ip, r1
	add	r3, r3, #1
	cmp	r3, #4096
	ldrlt	r3, [r1, r2]
	mov	r5, #0
	addlt	r5, r3, #1
	mov	r3, #16384
	ldr	r1, [r1, r3]
	ldr	r2, [ip, lr]
	mov	r4, r0
	cmp	r1, r2
	mov	r0, #0
	ldmeqfd	sp!, {r4, r5, pc}
	ldr	r2, [ip, lr]
	mov	r0, #1
	ldr	r3, [ip, r2, asl #2]
	str	r3, [r4, #0]
	str	r5, [ip, lr]
	ldmfd	sp!, {r4, r5, pc}
.L25:
	.align	2
.L24:
	.word	16388
	.size	getFromBuffer, .-getFromBuffer
	.align	2
	.global	isBufferEmpty
	.type	isBufferEmpty, %function
isBufferEmpty:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L28
	mov	r3, #16384
	ldr	r1, [r0, r3]
	ldr	r0, [r0, r2]
	@ lr needed for prologue
	cmp	r1, r0
	movne	r0, #0
	moveq	r0, #1
	bx	lr
.L29:
	.align	2
.L28:
	.word	16388
	.size	isBufferEmpty, .-isBufferEmpty
	.align	2
	.global	bufferLength
	.type	bufferLength, %function
bufferLength:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, .L37
	mov	ip, #16384
	ldr	r2, [r0, ip]
	ldr	r3, [r0, lr]
	mov	r1, #0
	cmp	r2, r3
	beq	.L33
	ldr	r2, [r0, ip]
	ldr	r3, [r0, lr]
	cmp	r2, r3
	ldrle	r3, [r0, ip]
	ldrle	r2, [r0, lr]
	ldrgt	r2, [r0, ip]
	ldrgt	r3, [r0, lr]
	rsble	r3, r2, r3
	rsbgt	r1, r3, r2
	addle	r1, r3, #4096
.L33:
	mov	r0, r1
	ldr	pc, [sp], #4
.L38:
	.align	2
.L37:
	.word	16388
	.size	bufferLength, .-bufferLength
	.align	2
	.global	circularBufferInitB
	.type	circularBufferInitB, %function
circularBufferInitB:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L41
	mov	r1, #0
	mov	r3, #102400
	str	r1, [r0, r3]
	str	r1, [r0, r2]
	mov	r0, #1
	@ lr needed for prologue
	bx	lr
.L42:
	.align	2
.L41:
	.word	102404
	.size	circularBufferInitB, .-circularBufferInitB
	.align	2
	.global	addToBufferB
	.type	addToBufferB, %function
addToBufferB:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #102400
	ldr	r3, [r1, r2]
	mov	ip, #0
	add	r3, r3, #1
	cmp	r3, r2
	ldrlt	r3, [r1, r2]
	stmfd	sp!, {r4, lr}
	addlt	ip, r3, #1
	ldr	r3, .L51
	mov	lr, #102400
	ldr	r2, [r1, r3]
	and	r4, r0, #255
	cmp	ip, r2
	ldrne	r3, [r1, lr]
	mov	r0, #0
	movne	r0, #1
	strne	ip, [r1, lr]
	strneb	r4, [r1, r3]
	ldmfd	sp!, {r4, pc}
.L52:
	.align	2
.L51:
	.word	102404
	.size	addToBufferB, .-addToBufferB
	.align	2
	.global	getFromBufferB
	.type	getFromBufferB, %function
getFromBufferB:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r2, .L61
	ldr	lr, .L61
	ldr	r3, [r1, r2]
	mov	ip, r1
	add	r3, r3, #1
	cmp	r3, #102400
	ldrlt	r3, [r1, r2]
	mov	r5, #0
	addlt	r5, r3, #1
	mov	r3, #102400
	ldr	r1, [r1, r3]
	ldr	r2, [ip, lr]
	mov	r4, r0
	cmp	r1, r2
	mov	r0, #0
	ldmeqfd	sp!, {r4, r5, pc}
	ldr	r2, [ip, lr]
	mov	r0, #1
	ldrb	r3, [ip, r2]	@ zero_extendqisi2
	strb	r3, [r4, #0]
	str	r5, [ip, lr]
	ldmfd	sp!, {r4, r5, pc}
.L62:
	.align	2
.L61:
	.word	102404
	.size	getFromBufferB, .-getFromBufferB
	.align	2
	.global	isBufferEmptyB
	.type	isBufferEmptyB, %function
isBufferEmptyB:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L65
	mov	r3, #102400
	ldr	r1, [r0, r3]
	ldr	r0, [r0, r2]
	@ lr needed for prologue
	cmp	r1, r0
	movne	r0, #0
	moveq	r0, #1
	bx	lr
.L66:
	.align	2
.L65:
	.word	102404
	.size	isBufferEmptyB, .-isBufferEmptyB
	.align	2
	.global	bufferLengthB
	.type	bufferLengthB, %function
bufferLengthB:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, .L74
	mov	ip, #102400
	ldr	r2, [r0, ip]
	ldr	r3, [r0, lr]
	mov	r1, #0
	cmp	r2, r3
	beq	.L70
	ldr	r2, [r0, ip]
	ldr	r3, [r0, lr]
	cmp	r2, r3
	ldrle	r3, [r0, ip]
	ldrle	r2, [r0, lr]
	ldrgt	r2, [r0, ip]
	ldrgt	r3, [r0, lr]
	rsble	r3, r2, r3
	rsbgt	r1, r3, r2
	addle	r1, r3, #102400
.L70:
	mov	r0, r1
	ldr	pc, [sp], #4
.L75:
	.align	2
.L74:
	.word	102404
	.size	bufferLengthB, .-bufferLengthB
	.ident	"GCC: (GNU) 4.0.2"
