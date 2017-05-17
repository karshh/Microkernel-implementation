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
	str	r3, [r2, #512]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #516]
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
	ldr	r3, [r3, #512]
	add	r3, r3, #1
	cmp	r3, #127
	bgt	.L4
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #512]
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
	ldr	r2, [r3, #516]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L7
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L9
.L7:
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #512]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [r2, r1, asl #2]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #512]
	mov	r3, #1
	str	r3, [fp, #-28]
.L9:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
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
	ldr	r3, [r3, #516]
	add	r3, r3, #1
	cmp	r3, #127
	bgt	.L12
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #516]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	b	.L14
.L12:
	mov	r3, #0
	str	r3, [fp, #-32]
.L14:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #512]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #516]
	cmp	r2, r3
	bne	.L15
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L17
.L15:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #516]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, r2, asl #2]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #516]
	mov	r3, #1
	str	r3, [fp, #-28]
.L17:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
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
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #512]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #516]
	cmp	r2, r3
	bne	.L20
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L22
.L20:
	mov	r3, #0
	str	r3, [fp, #-20]
.L22:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
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
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #512]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #516]
	cmp	r2, r3
	bne	.L25
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L27
.L25:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #512]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #516]
	cmp	r2, r3
	ble	.L28
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #512]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #516]
	rsb	r2, r3, r2
	str	r2, [fp, #-20]
	b	.L27
.L28:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #512]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #516]
	rsb	r3, r3, r2
	add	r3, r3, #128
	str	r3, [fp, #-20]
.L27:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	bufferLength, .-bufferLength
	.ident	"GCC: (GNU) 4.0.2"
