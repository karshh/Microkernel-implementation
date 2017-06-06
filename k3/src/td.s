	.file	"td.c"
	.text
	.align	2
	.global	messageInit
	.type	messageInit, %function
messageInit:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
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
	str	r3, [r2, #192]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #196]
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	initInbox, .-initInbox
	.align	2
	.global	checkMail
	.type	checkMail, %function
checkMail:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	add	r3, r3, #60
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #196]
	add	r3, r3, #1
	cmp	r3, #15
	bgt	.L6
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #196]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	b	.L8
.L6:
	mov	r3, #0
	str	r3, [fp, #-36]
.L8:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #192]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #196]
	cmp	r2, r3
	bne	.L9
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L11
.L9:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #196]
	ldr	r1, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #196]
	ldr	r1, [fp, #-20]
	mov	r0, #8
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #196]
	ldr	r1, [fp, #-20]
	mov	r0, #4
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #4]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #196]
	mov	r3, #1
	str	r3, [fp, #-32]
.L11:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	checkMail, .-checkMail
	.align	2
	.global	putMail
	.type	putMail, %function
putMail:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	add	r3, r3, #60
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #192]
	add	r3, r3, #1
	cmp	r3, #15
	bgt	.L14
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #192]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	b	.L16
.L14:
	mov	r3, #0
	str	r3, [fp, #-36]
.L16:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #196]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L17
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L19
.L17:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #192]
	ldr	r3, [fp, #-28]
	ldr	r0, [r3, #0]
	ldr	r1, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	str	r0, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #192]
	ldr	r3, [fp, #-28]
	ldr	r1, [r3, #8]
	ldr	r0, [fp, #-20]
	mov	ip, #8
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r0
	add	r3, r3, ip
	str	r1, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #192]
	ldr	r3, [fp, #-28]
	ldr	r1, [r3, #4]
	ldr	r0, [fp, #-20]
	mov	ip, #4
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r0
	add	r3, r3, ip
	str	r1, [r3, #0]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #192]
	mov	r3, #1
	str	r3, [fp, #-32]
.L19:
	ldr	r3, [fp, #-32]
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
	bne	.L22
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L24
.L22:
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #260]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #264]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #268]
	mov	r3, #1
	str	r3, [fp, #-28]
.L24:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	initTD, .-initTD
	.ident	"GCC: (GNU) 4.0.2"
