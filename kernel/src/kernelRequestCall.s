	.file	"kernelRequestCall.c"
	.text
	.align	2
	.global	kernel_MyTid
	.type	kernel_MyTid, %function
kernel_MyTid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #16]
	mov	r3, r0
	mov	r0, #1
	@ lr needed for prologue
	str	r2, [r3, #4]
	bx	lr
	.size	kernel_MyTid, .-kernel_MyTid
	.align	2
	.global	kernel_MyParentTid
	.type	kernel_MyParentTid, %function
kernel_MyParentTid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #20]
	mov	r3, r0
	mov	r0, #1
	@ lr needed for prologue
	str	r2, [r3, #4]
	bx	lr
	.size	kernel_MyParentTid, .-kernel_MyParentTid
	.align	2
	.global	kernel_Pass
	.type	kernel_Pass, %function
kernel_Pass:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	str	r3, [r0, #4]
	mov	r0, #1
	@ lr needed for prologue
	bx	lr
	.size	kernel_Pass, .-kernel_Pass
	.align	2
	.global	kernel_Exit
	.type	kernel_Exit, %function
kernel_Exit:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #4
	mov	r3, #4
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	sub	r3, r3, #1
	str	r2, [r0, #28]
	mov	r2, #0
	str	r3, [r0, #32]
	str	r2, [r0, #4]
	mov	r0, #1
	@ lr needed for prologue
	add	sp, sp, #4
	bx	lr
	.size	kernel_Exit, .-kernel_Exit
	.align	2
	.global	kernel_Reply
	.type	kernel_Reply, %function
kernel_Reply:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r4, r1
	ldr	r1, [r1, #4]
	sub	sp, sp, #4
	cmp	r1, #127
	mov	r5, r0
	mov	r7, r2
	bhi	.L10
	add	r3, r1, r1, asl #3
	add	r3, r1, r3, asl #2
	add	lr, r2, r3, asl #6
	ldr	r2, [lr, #32]
	cmp	r2, #3
	beq	.L10
	ldr	r3, [lr, #32]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [lr, #32]
	ldr	r6, [r4, #12]
	cmp	r3, #5
	beq	.L15
	ldr	r3, [lr, #32]
	cmp	r3, #6
	mvnne	r3, #2
	strne	r3, [r0, #4]
	bne	.L14
.L15:
	mov	r2, #0
	str	r2, [sp, #0]
	str	r2, [sp, #0]
	ldr	r3, [sp, #0]
	cmp	r6, r3
	ble	.L18
	ldr	r2, [lr, #2360]
	ldr	r3, [sp, #0]
	cmp	r2, r3
	ble	.L18
.L26:
	ldr	ip, [sp, #0]
	ldr	r0, [r4, #8]
	ldr	r3, [sp, #0]
	ldr	r1, [lr, #2356]
	ldrb	r2, [r0, r3]	@ zero_extendqisi2
	strb	r2, [r1, ip]
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	cmp	r2, r6
	bge	.L18
	ldr	r2, [lr, #2360]
	ldr	r3, [sp, #0]
	cmp	r3, r2
	blt	.L26
.L18:
	ldr	r3, [lr, #2360]
	cmp	r6, r3
	movle	r3, #0
	strle	r3, [r5, #4]
	strle	r6, [lr, #4]
	bgt	.L30
.L24:
	mov	r3, #1
	str	r3, [lr, #32]
	mov	r0, r7
	mov	r1, lr
	bl	kernel_queuePush(PLT)
	b	.L14
.L10:
	mvn	r3, #1
	str	r3, [r5, #4]
.L14:
	mov	r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L30:
	ldr	r1, [lr, #2360]
	ldr	r3, [lr, #2356]
	mvn	r0, #0
	add	r3, r3, r1
	mov	r2, #0
	strb	r2, [r3, #-1]
	str	r0, [r5, #4]
	str	r0, [lr, #4]
	b	.L24
	.size	kernel_Reply, .-kernel_Reply
	.align	2
	.global	kernel_Create
	.type	kernel_Create, %function
kernel_Create:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r6, [r1, #4]
	mov	r4, r0
	cmp	r6, #31
	sub	sp, sp, #8
	mvnhi	r3, #0
	add	ip, sp, #8
	mov	r7, r1
	mov	r5, r2
	mov	r0, r2
	strhi	r3, [r4, #4]
	bls	.L38
.L34:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L38:
	mov	r3, #0
	str	r3, [ip, #-4]!
	mov	r1, ip
	bl	getNextTID(PLT)
	cmp	r0, #0
	mov	r3, r6
	mvnne	r3, #1
	mov	r0, r5
	strne	r3, [r4, #4]
	bne	.L34
	ldr	r1, [sp, #4]
	ldr	ip, [r7, #8]
	str	r1, [r4, #4]
	ldr	r2, [r4, #16]
	str	ip, [sp, #0]
	bl	setTask(PLT)
	mov	r1, r0
	mov	r0, r5
	bl	kernel_queuePush(PLT)
	b	.L34
	.size	kernel_Create, .-kernel_Create
	.align	2
	.global	processMail
	.type	processMail, %function
processMail:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	add	ip, r0, r0, asl #3
	add	r0, r0, ip, asl #2
	add	r4, r1, r0, asl #6
	sub	sp, sp, #4
	mov	r6, r1
	mov	r0, r4
	mov	r1, r2
	mov	r7, r3
	mov	r5, r2
	bl	checkMail(PLT)
	cmp	r0, #0
	moveq	r3, #4
	streq	r3, [r4, #32]
	beq	.L42
	ldr	r3, [r5, #0]
	mov	r1, #0
	add	r2, r3, r3, asl #3
	add	r3, r3, r2, asl #2
	add	r3, r6, r3, asl #6
	mov	r2, #6
	str	r2, [r3, #32]
	str	r1, [sp, #0]
	str	r1, [sp, #0]
	ldr	r1, [r5, #136]
	ldr	r3, [sp, #0]
	cmp	r3, r1
	bge	.L43
.L54:
	ldr	r2, [r4, #2360]
	ldr	r3, [sp, #0]
	cmp	r2, r3
	ble	.L43
	ldr	r0, [sp, #0]
	ldr	r3, [sp, #0]
	ldr	r1, [r4, #2356]
	add	r3, r3, r5
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	strb	r2, [r1, r0]
	ldr	r3, [sp, #0]
	ldr	r1, [r5, #136]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	cmp	r1, r2
	bgt	.L54
.L43:
	ldr	r3, [r4, #2360]
	cmp	r3, r1
	ldrlt	r1, [r4, #2360]
	ldrlt	r3, [r4, #2356]
	movlt	r2, #0
	addlt	r3, r3, r1
	mvnlt	r1, #0
	strltb	r2, [r3, #-1]
	strge	r1, [r4, #4]
	strlt	r1, [r4, #4]
	ldr	r1, [r5, #0]
	ldr	r2, [r4, #2364]
	mov	r3, #1
	cmp	r7, #0
	str	r1, [r2, #0]
	str	r3, [r4, #32]
	bne	.L55
.L42:
	mov	r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L55:
	mov	r0, r6
	mov	r1, r4
	bl	kernel_queuePush(PLT)
	b	.L42
	.size	processMail, .-processMail
	.align	2
	.global	kernel_Receive
	.type	kernel_Receive, %function
kernel_Receive:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	ip, [r1, #12]
	ldr	lr, [r1, #4]
	str	ip, [r0, #2360]
	ldr	r4, [r0, #16]
	ldr	ip, [r1, #8]
	str	lr, [r0, #2364]
	str	ip, [r0, #2356]
	mov	r1, r2
	mov	r0, r4
	mov	r2, r3
	mov	r3, #0
	ldmfd	sp!, {r4, lr}
	b	processMail(PLT)
	.size	kernel_Receive, .-kernel_Receive
	.align	2
	.global	kernel_Send
	.type	kernel_Send, %function
kernel_Send:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, [r1, #4]
	sub	sp, sp, #4
	cmp	r4, #127
	mov	ip, r1
	mov	r5, r0
	mov	r8, r2
	mov	r6, r3
	ldr	lr, [r1, #12]
	ldr	r7, [r1, #20]
	bhi	.L59
	mov	r9, r4, asl #3
	add	r3, r9, r4
	add	r3, r4, r3, asl #2
	add	r3, r2, r3, asl #6
	ldr	r2, [r3, #32]
	cmp	r2, #3
	beq	.L59
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L59
	ldr	r3, [r0, #16]
	cmp	r4, r3
	beq	.L79
	cmp	r7, #128
	cmple	lr, #128
	movle	r2, #0
	movgt	r2, #1
	bgt	.L79
	str	r2, [sp, #0]
	str	r2, [sp, #0]
	ldr	r3, [sp, #0]
	str	r2, [r6, #0]
	cmp	r3, #127
	bgt	.L67
	mov	r1, r2
.L68:
	ldr	r3, [sp, #0]
	add	r3, r3, r6
	strb	r1, [r3, #4]
	ldr	r2, [sp, #0]
	add	r2, r2, #1
	str	r2, [sp, #0]
	ldr	r3, [sp, #0]
	cmp	r3, #127
	ble	.L68
.L67:
	mov	r3, #0
	str	r3, [r6, #136]
	str	r3, [r6, #140]
	ldr	r1, [r5, #16]
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	str	r1, [r6, #0]
	cmp	lr, r2
	str	r4, [r6, #140]
	str	lr, [r6, #136]
	bgt	.L76
.L69:
	add	r3, r9, r4
	ldr	r1, [ip, #16]
	add	r3, r4, r3, asl #2
	add	r9, r8, r3, asl #6
	mov	r2, #0
	str	r2, [r5, #2360]
	str	r1, [r5, #2356]
	str	r7, [r5, #2360]
	mov	r0, r9
	mov	r1, r6
	bl	putMail(PLT)
	cmp	r0, #0
	beq	.L79
	ldr	r3, [r9, #32]
	cmp	r3, #4
	movne	r3, #5
	strne	r3, [r5, #32]
	bne	.L63
	mov	r0, r4
	mov	r1, r8
	mov	r2, r6
	sub	r3, r3, #3
	bl	processMail(PLT)
	b	.L63
.L59:
	mvn	r3, #1
	str	r3, [r5, #4]
.L63:
	mov	r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L76:
	ldr	r1, [sp, #0]
	ldr	r0, [ip, #8]
	ldr	r3, [sp, #0]
	add	r1, r1, r6
	ldrb	r2, [r0, r3]	@ zero_extendqisi2
	strb	r2, [r1, #4]
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	cmp	lr, r2
	bgt	.L76
	b	.L69
.L79:
	mvn	r3, #2
	str	r3, [r5, #4]
	b	.L63
	.size	kernel_Send, .-kernel_Send
	.align	2
	.global	processRequest
	.type	processRequest, %function
processRequest:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, r2
	ldr	r2, [r2, #0]
	mov	lr, r0
	sub	r2, r2, #1
	cmp	r2, #7
	addls	pc, pc, r2, asl #2
	b	.L81
	.p2align 2
.L90:
	b	.L82
	b	.L83
	b	.L84
	b	.L85
	b	.L86
	b	.L87
	b	.L88
	b	.L89
.L81:
	mov	r0, #0
	ldr	pc, [sp], #4
.L89:
	mov	r0, r1
	mov	r2, lr
	mov	r1, ip
	ldr	lr, [sp], #4
	b	kernel_Reply(PLT)
.L88:
	mov	r0, r1
	mov	r2, lr
	mov	r1, ip
	ldr	lr, [sp], #4
	b	kernel_Receive(PLT)
.L87:
	mov	r0, r1
	mov	r2, lr
	mov	r1, ip
	ldr	lr, [sp], #4
	b	kernel_Send(PLT)
.L86:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_Exit(PLT)
.L85:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_Pass(PLT)
.L84:
	mov	r0, r1
	mov	r2, lr
	mov	r1, ip
	ldr	lr, [sp], #4
	b	kernel_Create(PLT)
.L83:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_MyParentTid(PLT)
.L82:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_MyTid(PLT)
	.size	processRequest, .-processRequest
	.ident	"GCC: (GNU) 4.0.2"
