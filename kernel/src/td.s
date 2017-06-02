	.file	"td.c"
	.text
	.align	2
	.global	messageInit
	.type	messageInit, %function
messageInit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r2, #4
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-16]
	cmp	r3, #127
	ble	.L3
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #136]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #140]
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	messageInit, .-messageInit
	.align	2
	.global	initInbox
	.type	initInbox, %function
initInbox:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #2304]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #2308]
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	initInbox, .-initInbox
	.align	2
	.global	checkMail
	.type	checkMail, %function
checkMail:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-28]
	add	r3, r3, #60
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2308]
	add	r3, r3, #1
	cmp	r3, #15
	bgt	.L9
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2308]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	b	.L11
.L9:
	mov	r3, #0
	str	r3, [fp, #-40]
.L11:
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #2304]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2308]
	cmp	r2, r3
	bne	.L12
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L14
.L12:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #2308]
	ldr	r1, [fp, #-24]
	mov	r0, #140
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #140]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #2308]
	ldr	r1, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #2308]
	ldr	r1, [fp, #-24]
	mov	r0, #136
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	str	r2, [r3, #136]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L15
.L16:
	ldr	lr, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #2308]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-24]
	mov	ip, #4
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r0
	add	r3, r3, r1
	add	r3, r3, ip
	ldrb	r3, [r3, #0]
	and	r1, r3, #255
	ldr	r3, [fp, #-32]
	mov	r2, #4
	add	r3, lr, r3
	add	r2, r3, r2
	mov	r3, r1
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L15:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #136]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bgt	.L16
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #2308]
	mov	r3, #1
	str	r3, [fp, #-36]
.L14:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	checkMail, .-checkMail
	.align	2
	.global	putMail
	.type	putMail, %function
putMail:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-28]
	add	r3, r3, #60
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2304]
	add	r3, r3, #1
	cmp	r3, #15
	bgt	.L20
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2304]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	b	.L22
.L20:
	mov	r3, #0
	str	r3, [fp, #-40]
.L22:
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #2308]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L23
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L25
.L23:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #2304]
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #140]
	ldr	r0, [fp, #-24]
	mov	ip, #140
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r0
	add	r3, r3, ip
	str	r1, [r3, #0]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #2304]
	ldr	r3, [fp, #-32]
	ldr	r0, [r3, #0]
	ldr	r1, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	str	r0, [r3, #0]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #2304]
	ldr	r3, [fp, #-32]
	ldr	r1, [r3, #136]
	ldr	r0, [fp, #-24]
	mov	ip, #136
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r0
	add	r3, r3, ip
	str	r1, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L26
.L27:
	ldr	r3, [fp, #-24]
	ldr	r0, [r3, #2304]
	ldr	lr, [fp, #-16]
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-32]
	mov	r2, #4
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [fp, #-24]
	mov	ip, #4
	mov	r3, r0
	mov	r3, r3, asl #3
	add	r3, r3, r0
	mov	r3, r3, asl #4
	add	r3, r3, r2
	add	r3, r3, lr
	add	r2, r3, ip
	mov	r3, r1
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L26:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #136]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bgt	.L27
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #2304]
	mov	r3, #1
	str	r3, [fp, #-36]
.L25:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	putMail, .-putMail
	.align	2
	.global	initTD
	.type	initTD, %function
initTD:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #32]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r2, [fp, #-16]
	mov	r3, #4
	str	r3, [r2, #44]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #48]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #12]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #80
	str	r3, [r2, #24]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #28]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #52]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r3, [fp, #-16]
	add	r3, r3, #60
	mov	r0, r3
	bl	initInbox(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L31
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L33
.L31:
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #2372]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #2376]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #2380]
	mov	r3, #1
	str	r3, [fp, #-28]
.L33:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	initTD, .-initTD
	.ident	"GCC: (GNU) 4.0.2"
