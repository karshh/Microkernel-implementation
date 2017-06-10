	.file	"td.c"
	.text
	.align	2
	.global	messageInit
	.type	messageInit, %function
messageInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	str	r3, [r0, #0]
	str	r3, [r0, #4]
	str	r3, [r0, #8]
	mov	r0, #1
	@ lr needed for prologue
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
	str	r3, [r0, #192]
	str	r3, [r0, #196]
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
	str	lr, [sp, #-4]!
	add	r0, r0, #60
	ldr	r3, [r0, #196]
	mov	lr, #0
	add	r3, r3, #1
	cmp	r3, #15
	ldrle	r3, [r0, #196]
	ldr	r2, [r0, #192]
	addle	lr, r3, #1
	ldr	r3, [r0, #196]
	mov	ip, #0
	cmp	r2, r3
	beq	.L11
	ldr	r3, [r0, #196]
	mov	ip, #1
	add	r3, r3, r3, asl #1
	ldr	r2, [r0, r3, asl #2]
	str	r2, [r1, #0]
	ldr	r3, [r0, #196]
	add	r3, r3, r3, asl #1
	add	r3, r0, r3, asl #2
	ldr	r2, [r3, #8]
	str	r2, [r1, #8]
	ldr	r3, [r0, #196]
	add	r3, r3, r3, asl #1
	add	r3, r0, r3, asl #2
	ldr	r2, [r3, #4]
	str	lr, [r0, #196]
	str	r2, [r1, #4]
.L11:
	mov	r0, ip
	ldr	pc, [sp], #4
	.size	checkMail, .-checkMail
	.align	2
	.global	putMail
	.type	putMail, %function
putMail:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	add	lr, r0, #60
	ldr	r3, [lr, #192]
	mov	r4, #0
	add	r3, r3, #1
	cmp	r3, #15
	ldrle	r3, [lr, #192]
	mov	ip, r1
	addle	r4, r3, #1
	ldr	r3, [lr, #196]
	mov	r5, #0
	cmp	r4, r3
	beq	.L20
	ldr	r2, [lr, #192]
	ldr	r1, [r1, #0]
	add	r2, r2, r2, asl #1
	str	r1, [lr, r2, asl #2]
	ldr	r3, [lr, #192]
	ldr	r0, [ip, #8]
	add	r3, r3, r3, asl #1
	add	r3, lr, r3, asl #2
	str	r0, [r3, #8]
	ldr	r2, [lr, #192]
	ldr	ip, [ip, #4]
	add	r2, r2, r2, asl #1
	add	r2, lr, r2, asl #2
	str	ip, [r2, #4]
	mov	r5, #1
	str	r4, [lr, #192]
.L20:
	mov	r0, r5
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
	str	r1, [r0, #32]
	str	r5, [r0, #36]
	str	r3, [r0, #44]
	add	r3, r3, #76
	str	r5, [r0, #48]
	mov	r4, r0
	str	r5, [r0, #4]
	str	r2, [r0, #0]
	str	r5, [r0, #8]
	str	r5, [r0, #40]
	str	r5, [r0, #12]
	str	r5, [r0, #52]
	str	r5, [r0, #16]
	str	r5, [r0, #56]
	str	r5, [r0, #20]
	str	r3, [r0, #24]
	str	r5, [r0, #28]
	add	r0, r0, #60
	bl	initInbox(PLT)
	cmp	r0, r5
	mov	r0, r5
	movne	r0, #1
	strne	r5, [r4, #268]
	strne	r5, [r4, #260]
	strne	r5, [r4, #264]
	ldmfd	sp!, {r4, r5, pc}
	.size	initTD, .-initTD
	.ident	"GCC: (GNU) 4.0.2"
