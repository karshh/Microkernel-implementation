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
	ldr	r1, [fp, #-16]
	mov	r2, #16384
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-16]
	ldr	r2, .L3
	mov	r3, #0
	str	r3, [r1, r2]
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L4:
	.align	2
.L3:
	.word	16388
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
	ldr	r2, [fp, #-24]
	mov	r3, #16384
	ldr	r3, [r2, r3]
	add	r2, r3, #1
	ldr	r3, .L13
	cmp	r2, r3
	bgt	.L6
	ldr	r3, [fp, #-24]
	mov	r2, #16384
	ldr	r3, [r3, r2]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	b	.L8
.L6:
	mov	r3, #0
	str	r3, [fp, #-32]
.L8:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, .L13+4
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L9
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L11
.L9:
	ldr	r2, [fp, #-24]
	mov	r3, #16384
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [r2, r1, asl #2]
	ldr	r1, [fp, #-24]
	mov	r2, #16384
	ldr	r3, [fp, #-16]
	str	r3, [r1, r2]
	mov	r3, #1
	str	r3, [fp, #-28]
.L11:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L14:
	.align	2
.L13:
	.word	4095
	.word	16388
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
	ldr	r2, [fp, #-24]
	ldr	r3, .L23
	ldr	r3, [r2, r3]
	add	r2, r3, #1
	ldr	r3, .L23+4
	cmp	r2, r3
	bgt	.L16
	ldr	r3, [fp, #-24]
	ldr	r2, .L23
	ldr	r3, [r3, r2]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	b	.L18
.L16:
	mov	r3, #0
	str	r3, [fp, #-32]
.L18:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	mov	r3, #16384
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L23
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L19
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L21
.L19:
	ldr	r2, [fp, #-24]
	ldr	r3, .L23
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r1, [fp, #-24]
	ldr	r2, .L23
	ldr	r3, [fp, #-16]
	str	r3, [r1, r2]
	mov	r3, #1
	str	r3, [fp, #-28]
.L21:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L24:
	.align	2
.L23:
	.word	16388
	.word	4095
	.size	getFromBuffer, .-getFromBuffer
	.align	2
	.global	isBufferEmpty
	.type	isBufferEmpty, %function
isBufferEmpty:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #16384
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-16]
	ldr	r3, .L30
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L26
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L28
.L26:
	mov	r3, #0
	str	r3, [fp, #-20]
.L28:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L31:
	.align	2
.L30:
	.word	16388
	.size	isBufferEmpty, .-isBufferEmpty
	.align	2
	.global	bufferLength
	.type	bufferLength, %function
bufferLength:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #16384
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-16]
	ldr	r3, .L39
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L33
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L35
.L33:
	ldr	r2, [fp, #-16]
	mov	r3, #16384
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-16]
	ldr	r3, .L39
	ldr	r3, [r2, r3]
	cmp	r1, r3
	ble	.L36
	ldr	r2, [fp, #-16]
	mov	r3, #16384
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-16]
	ldr	r3, .L39
	ldr	r3, [r2, r3]
	rsb	r1, r3, r1
	str	r1, [fp, #-20]
	b	.L35
.L36:
	ldr	r2, [fp, #-16]
	mov	r3, #16384
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-16]
	ldr	r3, .L39
	ldr	r3, [r2, r3]
	rsb	r3, r3, r1
	add	r3, r3, #4096
	str	r3, [fp, #-20]
.L35:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L40:
	.align	2
.L39:
	.word	16388
	.size	bufferLength, .-bufferLength
	.ident	"GCC: (GNU) 4.0.2"
