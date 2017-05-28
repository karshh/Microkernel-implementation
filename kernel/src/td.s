	.file	"td.c"
	.text
	.align	2
	.global	messageInit
	.type	messageInit, %function
messageInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	@ lr needed for prologue
	mov	r3, r0
	mov	r2, r1
.L2:
	add	r2, r2, #1
	cmp	r2, #128
	strb	r1, [r3, #4]
	add	r3, r3, #1
	bne	.L2
	str	r1, [r0, #140]
	str	r1, [r0, #136]
	str	r1, [r0, #0]
	mov	r0, #1
	bx	lr
	.size	messageInit, .-messageInit
	.align	2
	.global	initInbox
	.type	initInbox, %function
initInbox:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	str	r3, [r0, #2304]
	str	r3, [r0, #2308]
	mov	r0, #1
	@ lr needed for prologue
	bx	lr
	.size	initInbox, .-initInbox
	.align	2
	.global	checkMail
	.type	checkMail, %function
checkMail:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	add	r0, r0, #44
	ldr	r3, [r0, #2308]
	mov	r4, r1
	add	r3, r3, #1
	cmp	r3, #15
	ldrle	r3, [r0, #2308]
	ldr	r2, [r0, #2304]
	addle	r5, r3, #1
	ldr	r3, [r0, #2308]
	movgt	r5, #0
	cmp	r2, r3
	moveq	r0, #0
	ldmeqfd	sp!, {r4, r5, pc}
	ldr	r3, [r0, #2308]
	add	r3, r3, r3, asl #3
	add	r3, r0, r3, asl #4
	ldr	r2, [r3, #140]
	str	r2, [r1, #140]
	ldr	r3, [r0, #2308]
	add	r3, r3, r3, asl #3
	ldr	r2, [r0, r3, asl #4]
	str	r2, [r1, #0]
	ldr	r3, [r0, #2308]
	add	r3, r3, r3, asl #3
	add	r3, r0, r3, asl #4
	ldr	lr, [r3, #136]
	cmp	lr, #0
	str	lr, [r1, #136]
	ble	.L17
	mov	ip, #0
.L19:
	ldr	r3, [r0, #2308]
	add	r1, r4, ip
	add	r3, r3, r3, asl #3
	add	r3, r0, r3, asl #4
	add	r3, r3, ip
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	add	ip, ip, #1
	cmp	lr, ip
	strb	r2, [r1, #4]
	bgt	.L19
.L17:
	str	r5, [r0, #2308]
	mov	r0, #1
	ldmfd	sp!, {r4, r5, pc}
	.size	checkMail, .-checkMail
	.align	2
	.global	putMail
	.type	putMail, %function
putMail:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r3, [r0, #2348]
	add	lr, r0, #44
	add	r3, r3, #1
	cmp	r3, #15
	ldrle	r3, [r0, #2348]
	movgt	r5, #0
	addle	r5, r3, #1
	ldr	r3, [lr, #2308]
	mov	r4, r1
	cmp	r5, r3
	moveq	r0, #0
	ldmeqfd	sp!, {r4, r5, pc}
	ldr	r3, [lr, #2304]
	ldr	r1, [r1, #140]
	add	r3, r3, r3, asl #3
	add	r3, lr, r3, asl #4
	str	r1, [r3, #140]
	ldr	r2, [lr, #2304]
	ldr	r1, [r4, #0]
	add	r2, r2, r2, asl #3
	str	r1, [lr, r2, asl #4]
	ldr	r3, [lr, #2304]
	ldr	r2, [r4, #136]
	add	r3, r3, r3, asl #3
	add	r3, lr, r3, asl #4
	str	r2, [r3, #136]
	ldr	r0, [r4, #136]
	cmp	r0, #0
	ble	.L29
	mov	ip, #0
.L31:
	ldr	r3, [lr, #2304]
	add	r1, r4, ip
	add	r3, r3, r3, asl #3
	add	r3, lr, r3, asl #4
	add	r3, r3, ip
	ldrb	r2, [r1, #4]	@ zero_extendqisi2
	add	ip, ip, #1
	cmp	ip, r0
	strb	r2, [r3, #4]
	blt	.L31
.L29:
	mov	r0, #1
	str	r5, [lr, #2304]
	ldmfd	sp!, {r4, r5, pc}
	.size	putMail, .-putMail
	.align	2
	.global	initTD
	.type	initTD, %function
initTD:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r3, #4
	mov	r5, #0
	str	r1, [r0, #16]
	str	r5, [r0, #20]
	str	r3, [r0, #28]
	add	r3, r3, #204
	str	r5, [r0, #32]
	mov	r4, r0
	str	r5, [r0, #4]
	str	r2, [r0, #0]
	str	r3, [r0, #8]
	str	r5, [r0, #24]
	str	r5, [r0, #36]
	str	r5, [r0, #40]
	str	r5, [r0, #12]
	add	r0, r0, #44
	bl	initInbox(PLT)
	cmp	r0, r5
	mov	r0, r5
	movne	r0, #1
	strne	r5, [r4, #2364]
	strne	r5, [r4, #2356]
	strne	r5, [r4, #2360]
	ldmfd	sp!, {r4, r5, pc}
	.size	initTD, .-initTD
	.ident	"GCC: (GNU) 4.0.2"
