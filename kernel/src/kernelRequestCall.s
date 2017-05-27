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
	ldr	r3, [r1, #4]
	mov	r7, r2
	add	r2, r3, r3, asl #3
	add	r3, r3, r2, asl #1
	add	lr, r7, r3, asl #6
	ldr	r2, [lr, #32]
	sub	sp, sp, #4
	cmp	r2, #5
	mov	r4, r1
	mov	r6, r0
	ldr	r5, [r1, #12]
	beq	.L10
	ldr	r3, [lr, #32]
	cmp	r3, #6
	mvnne	r3, #2
	strne	r3, [r0, #4]
	beq	.L10
.L13:
	mov	r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L10:
	mov	r2, #0
	str	r2, [sp, #0]
	str	r2, [sp, #0]
	ldr	r3, [sp, #0]
	cmp	r5, r3
	bgt	.L24
.L14:
	ldr	r3, [lr, #1208]
	cmp	r5, r3
	movle	r3, #0
	strle	r3, [r6, #4]
	strle	r5, [lr, #4]
	ble	.L20
	ldr	r1, [lr, #1208]
	ldr	r3, [lr, #1204]
	mvn	r0, #0
	add	r3, r3, r1
	mov	r2, #0
	strb	r2, [r3, #-1]
	str	r0, [r6, #4]
	str	r0, [lr, #4]
.L20:
	mov	r3, #1
	str	r3, [lr, #32]
	mov	r0, r7
	mov	r1, lr
	bl	kernel_queuePush(PLT)
	b	.L13
.L24:
	ldr	r2, [lr, #1208]
	ldr	r3, [sp, #0]
	cmp	r2, r3
	ble	.L14
	ldr	ip, [sp, #0]
	ldr	r0, [r4, #8]
	ldr	r3, [sp, #0]
	ldr	r1, [lr, #1204]
	ldrb	r2, [r0, r3]	@ zero_extendqisi2
	strb	r2, [r1, ip]
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	cmp	r2, r5
	blt	.L24
	b	.L14
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
	bls	.L33
.L29:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L33:
	mov	r3, #0
	str	r3, [ip, #-4]!
	mov	r1, ip
	bl	getNextTID(PLT)
	cmp	r0, #0
	mov	r3, r6
	mvnne	r3, #1
	mov	r0, r5
	strne	r3, [r4, #4]
	bne	.L29
	ldr	r1, [sp, #4]
	ldr	ip, [r7, #8]
	str	r1, [r4, #4]
	ldr	r2, [r4, #16]
	str	ip, [sp, #0]
	bl	setTask(PLT)
	mov	r1, r0
	mov	r0, r5
	bl	kernel_queuePush(PLT)
	b	.L29
	.size	kernel_Create, .-kernel_Create
	.align	2
	.global	processMail
	.type	processMail, %function
processMail:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	add	ip, r0, r0, asl #3
	add	r0, r0, ip, asl #1
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
	beq	.L37
	mov	r3, #0
	str	r3, [sp, #0]
	str	r3, [sp, #0]
	ldr	r1, [r5, #136]
	ldr	r3, [sp, #0]
	cmp	r3, r1
	bge	.L38
.L49:
	ldr	r2, [r4, #1208]
	ldr	r3, [sp, #0]
	cmp	r2, r3
	ble	.L38
	ldr	r0, [sp, #0]
	ldr	r3, [sp, #0]
	ldr	r1, [r4, #1204]
	add	r3, r3, r5
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	strb	r2, [r1, r0]
	ldr	r3, [sp, #0]
	ldr	r1, [r5, #136]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	cmp	r1, r2
	bgt	.L49
.L38:
	ldr	r3, [r4, #1208]
	cmp	r3, r1
	ldrlt	r1, [r4, #1208]
	ldrlt	r3, [r4, #1204]
	movlt	r2, #0
	addlt	r3, r3, r1
	mvnlt	r1, #0
	strltb	r2, [r3, #-1]
	strge	r1, [r4, #4]
	strlt	r1, [r4, #4]
	ldr	r1, [r5, #0]
	ldr	r2, [r4, #1212]
	mov	r3, #1
	cmp	r7, #0
	str	r1, [r2, #0]
	str	r3, [r4, #32]
	bne	.L50
.L37:
	mov	r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L50:
	mov	r0, r6
	mov	r1, r4
	bl	kernel_queuePush(PLT)
	b	.L37
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
	str	ip, [r0, #1208]
	ldr	r4, [r0, #16]
	ldr	ip, [r1, #8]
	str	lr, [r0, #1212]
	str	ip, [r0, #1204]
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, [r1, #4]
	mov	r5, r0
	cmp	r4, #127
	mov	r8, r2
	mov	r6, r3
	ldr	lr, [r1, #12]
	ldr	r7, [r1, #20]
	bhi	.L54
	mov	r9, r4, asl #3
	add	r3, r9, r4
	add	r3, r4, r3, asl #1
	add	r3, r2, r3, asl #6
	ldr	r2, [r3, #32]
	cmp	r2, #3
	beq	.L54
	ldr	r3, [r3, #32]
	cmp	r3, #0
	beq	.L54
	ldr	r3, [r0, #16]
	cmp	r4, r3
	beq	.L75
	cmp	r7, #128
	cmple	lr, #128
	movle	r3, #0
	movgt	r3, #1
	bgt	.L75
	ldr	r0, [r6, #136]
	str	r3, [r6, #0]
	cmp	r0, #0
	ble	.L62
	mov	r2, r3
	mov	ip, r3
.L64:
	add	r3, r6, r2
	add	r2, r2, #1
	cmp	r2, r0
	strb	ip, [r3, #4]
	blt	.L64
.L62:
	mov	r0, #0
	str	r0, [r6, #140]
	str	r0, [r6, #136]
	ldr	r3, [r5, #16]
	cmp	lr, r0
	str	r3, [r6, #0]
	str	r4, [r6, #140]
	str	lr, [r6, #136]
	ble	.L65
	mov	r0, r6
	mov	ip, #0
.L67:
	ldr	r3, [r1, #8]
	ldrb	r2, [r3, ip]	@ zero_extendqisi2
	add	ip, ip, #1
	cmp	lr, ip
	strb	r2, [r0, #4]
	add	r0, r0, #1
	bne	.L67
.L65:
	add	r3, r9, r4
	ldr	r1, [r1, #16]
	add	r3, r4, r3, asl #1
	add	r9, r8, r3, asl #6
	mov	r2, #0
	str	r2, [r5, #1208]
	str	r1, [r5, #1204]
	str	r7, [r5, #1208]
	mov	r0, r9
	mov	r1, r6
	bl	putMail(PLT)
	cmp	r0, #0
	beq	.L75
	ldr	r3, [r9, #32]
	cmp	r3, #4
	movne	r3, #6
	strne	r3, [r5, #32]
	bne	.L58
	add	r3, r3, #1
	str	r3, [r5, #32]
	mov	r0, r4
	mov	r1, r8
	mov	r2, r6
	sub	r3, r3, #4
	bl	processMail(PLT)
	b	.L58
.L54:
	mvn	r3, #1
	str	r3, [r5, #4]
.L58:
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L75:
	mvn	r3, #2
	mov	r0, #1
	str	r3, [r5, #4]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
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
	b	.L77
	.p2align 2
.L86:
	b	.L78
	b	.L79
	b	.L80
	b	.L81
	b	.L82
	b	.L83
	b	.L84
	b	.L85
.L77:
	mov	r0, #0
	ldr	pc, [sp], #4
.L85:
	mov	r0, r1
	mov	r2, lr
	mov	r1, ip
	ldr	lr, [sp], #4
	b	kernel_Reply(PLT)
.L84:
	mov	r0, r1
	mov	r2, lr
	mov	r1, ip
	ldr	lr, [sp], #4
	b	kernel_Receive(PLT)
.L83:
	mov	r0, r1
	mov	r2, lr
	mov	r1, ip
	ldr	lr, [sp], #4
	b	kernel_Send(PLT)
.L82:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_Exit(PLT)
.L81:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_Pass(PLT)
.L80:
	mov	r0, r1
	mov	r2, lr
	mov	r1, ip
	ldr	lr, [sp], #4
	b	kernel_Create(PLT)
.L79:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_MyParentTid(PLT)
.L78:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_MyTid(PLT)
	.size	processRequest, .-processRequest
	.ident	"GCC: (GNU) 4.0.2"
