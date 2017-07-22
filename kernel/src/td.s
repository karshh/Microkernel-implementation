	.file	"td.c"
	.text
	.align	2
	.global	initTD
	.type	initTD, %function
initTD:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	str	r1, [r0, #68]
	str	r2, [r0, #0]
	mov	r1, #4
	mov	r2, #80
	str	r3, [r0, #32]
	str	r1, [r0, #80]
	str	r2, [r0, #60]
	str	r3, [r0, #76]
	str	r3, [r0, #72]
	str	r3, [r0, #84]
	str	r3, [r0, #4]
	str	r3, [r0, #56]
	str	r3, [r0, #64]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r3, [r0, #16]
	str	r3, [r0, #44]
	str	r3, [r0, #48]
	str	r3, [r0, #52]
	str	r3, [r0, #20]
	str	r3, [r0, #36]
	str	r3, [r0, #28]
	str	r3, [r0, #24]
	str	r3, [r0, #40]
	mov	r0, #1
	@ lr needed for prologue
	bx	lr
	.size	initTD, .-initTD
	.align	2
	.global	inbox_Push
	.type	inbox_Push, %function
inbox_Push:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #48]
	@ lr needed for prologue
	cmp	r2, #0
	mov	ip, r0
	beq	.L9
	mov	r3, #5
	str	r3, [r1, #84]
	sub	r3, r3, #5
	str	r1, [r2, #8]
	str	r3, [r1, #8]
	ldr	r3, [ip, #44]
	str	r1, [r0, #48]
	mov	r0, #1
	add	r3, r3, r0
	str	r2, [r1, #12]
	str	r3, [ip, #44]
	bx	lr
.L9:
	mov	r3, #5
	str	r3, [r1, #84]
	ldr	r3, [ip, #44]
	str	r1, [r0, #48]
	str	r1, [r0, #52]
	mov	r0, #1
	add	r3, r3, r0
	str	r2, [r1, #12]
	str	r2, [r1, #8]
	str	r3, [ip, #44]
	bx	lr
	.size	inbox_Push, .-inbox_Push
	.align	2
	.global	inbox_Pop
	.type	inbox_Pop, %function
inbox_Pop:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [r0, #52]
	cmp	lr, #0
	beq	.L11
	ldr	r2, [r0, #44]
	cmp	r2, #0
	beq	.L11
	ldr	ip, [lr, #8]
	sub	r2, r2, #1
	cmp	ip, #0
	movne	r3, #0
	strne	r3, [ip, #12]
	streq	ip, [r0, #48]
	streq	ip, [r0, #52]
	strne	ip, [r0, #52]
	mov	ip, #1
	mov	r3, #0
	str	r2, [r0, #44]
	mov	r0, ip
	str	r3, [lr, #8]
	str	r3, [lr, #12]
	str	lr, [r1, #0]
	ldr	pc, [sp], #4
.L11:
	mov	ip, #0
	mov	r0, ip
	ldr	pc, [sp], #4
	.size	inbox_Pop, .-inbox_Pop
	.ident	"GCC: (GNU) 4.0.2"
