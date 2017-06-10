	.file	"kernelRequestCall.c"
	.text
	.align	2
	.global	kernel_MyTid
	.type	kernel_MyTid, %function
kernel_MyTid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #32]
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
	ldr	r2, [r0, #36]
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
	str	r2, [r0, #44]
	mov	r2, #0
	str	r3, [r0, #48]
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
	sub	sp, sp, #4
	cmp	r3, #127
	mov	r4, r1
	mov	r5, r0
	mov	r7, r2
	bhi	.L10
	add	r3, r3, r3, asl #4
	add	lr, r2, r3, asl #4
	ldr	r2, [lr, #48]
	cmp	r2, #3
	beq	.L10
	ldr	r3, [lr, #48]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [lr, #48]
	ldr	r6, [r1, #12]
	cmp	r3, #5
	beq	.L15
	ldr	r3, [lr, #48]
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
	ldr	r2, [lr, #264]
	ldr	r3, [sp, #0]
	cmp	r2, r3
	ble	.L18
.L26:
	ldr	ip, [sp, #0]
	ldr	r0, [r4, #8]
	ldr	r3, [sp, #0]
	ldr	r1, [lr, #260]
	ldrb	r2, [r0, r3]	@ zero_extendqisi2
	strb	r2, [r1, ip]
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	cmp	r2, r6
	bge	.L18
	ldr	r2, [lr, #264]
	ldr	r3, [sp, #0]
	cmp	r3, r2
	blt	.L26
.L18:
	ldr	r3, [lr, #264]
	cmp	r6, r3
	movle	r3, #0
	strle	r3, [r5, #4]
	strle	r6, [lr, #4]
	bgt	.L30
.L24:
	mov	r3, #1
	str	r3, [lr, #48]
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
	ldr	r1, [lr, #264]
	ldr	r3, [lr, #260]
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
	ldr	r2, [r4, #32]
	str	ip, [sp, #0]
	bl	setTask(PLT)
	mov	r1, r0
	mov	r0, r5
	bl	kernel_queuePush(PLT)
	b	.L34
	.size	kernel_Create, .-kernel_Create
	.align	2
	.global	kernel_CreateIOServer
	.type	kernel_CreateIOServer, %function
kernel_CreateIOServer:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r6, [r1, #4]
	sub	sp, sp, #8
	cmp	r6, #31
	mvnhi	r3, #0
	ldr	ip, .L49
	mov	r7, r1
	mov	r4, r2
	mov	r5, r0
	strhi	r3, [r0, #4]
	bhi	.L42
	ldr	r3, [r2, ip]
	add	r1, sp, #8
	cmn	r3, #1
	mov	r0, r2
	beq	.L43
	ldr	r3, [r2, ip]
	add	r3, r3, r3, asl #4
	add	r3, r2, r3, asl #4
	ldr	r2, [r3, #48]
	cmp	r2, #3
	mvnne	r3, #2
	strne	r3, [r5, #4]
	beq	.L43
.L42:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L43:
	mov	r3, #0
	str	r3, [r1, #-4]!
	bl	getNextTID(PLT)
	cmp	r0, #0
	mov	r3, r6
	mvnne	r3, #1
	mov	r0, r4
	strne	r3, [r5, #4]
	bne	.L42
	ldr	r1, [sp, #4]
	ldr	ip, [r7, #8]
	str	r1, [r5, #4]
	ldr	r2, [r5, #32]
	str	ip, [sp, #0]
	bl	setTask(PLT)
	mov	r1, r0
	mov	r0, r4
	bl	kernel_queuePush(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, .L49
	str	r2, [r4, r3]
	b	.L42
.L50:
	.align	2
.L49:
	.word	35096
	.size	kernel_CreateIOServer, .-kernel_CreateIOServer
	.align	2
	.global	kernel_CreateClockServer
	.type	kernel_CreateClockServer, %function
kernel_CreateClockServer:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r6, [r1, #4]
	sub	sp, sp, #8
	cmp	r6, #31
	mvnhi	r3, #0
	ldr	ip, .L61
	mov	r7, r1
	mov	r4, r2
	mov	r5, r0
	strhi	r3, [r0, #4]
	bhi	.L54
	ldr	r3, [r2, ip]
	add	r1, sp, #8
	cmn	r3, #1
	mov	r0, r2
	beq	.L55
	ldr	r3, [r2, ip]
	add	r3, r3, r3, asl #4
	add	r3, r2, r3, asl #4
	ldr	r2, [r3, #48]
	cmp	r2, #3
	mvnne	r3, #2
	strne	r3, [r5, #4]
	beq	.L55
.L54:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L55:
	mov	r3, #0
	str	r3, [r1, #-4]!
	bl	getNextTID(PLT)
	cmp	r0, #0
	mov	r3, r6
	mvnne	r3, #1
	mov	r0, r4
	strne	r3, [r5, #4]
	bne	.L54
	ldr	r1, [sp, #4]
	ldr	ip, [r7, #8]
	str	r1, [r5, #4]
	ldr	r2, [r5, #32]
	str	ip, [sp, #0]
	bl	setTask(PLT)
	mov	r1, r0
	mov	r0, r4
	bl	kernel_queuePush(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, .L61
	str	r2, [r4, r3]
	b	.L54
.L62:
	.align	2
.L61:
	.word	35092
	.size	kernel_CreateClockServer, .-kernel_CreateClockServer
	.align	2
	.global	kernel_CreateNameServer
	.type	kernel_CreateNameServer, %function
kernel_CreateNameServer:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r6, [r1, #4]
	sub	sp, sp, #8
	cmp	r6, #31
	mvnhi	r3, #0
	ldr	ip, .L73
	mov	r7, r1
	mov	r4, r2
	mov	r5, r0
	strhi	r3, [r0, #4]
	bhi	.L66
	ldr	r3, [r2, ip]
	add	r1, sp, #8
	cmn	r3, #1
	mov	r0, r2
	beq	.L67
	ldr	r3, [r2, ip]
	add	r3, r3, r3, asl #4
	add	r3, r2, r3, asl #4
	ldr	r2, [r3, #48]
	cmp	r2, #3
	mvnne	r3, #2
	strne	r3, [r5, #4]
	beq	.L67
.L66:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L67:
	mov	r3, #0
	str	r3, [r1, #-4]!
	bl	getNextTID(PLT)
	cmp	r0, #0
	mov	r3, r6
	mvnne	r3, #1
	mov	r0, r4
	strne	r3, [r5, #4]
	bne	.L66
	ldr	r1, [sp, #4]
	ldr	ip, [r7, #8]
	str	r1, [r5, #4]
	ldr	r2, [r5, #32]
	str	ip, [sp, #0]
	bl	setTask(PLT)
	mov	r1, r0
	mov	r0, r4
	bl	kernel_queuePush(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, .L73
	str	r2, [r4, r3]
	b	.L66
.L74:
	.align	2
.L73:
	.word	35088
	.size	kernel_CreateNameServer, .-kernel_CreateNameServer
	.global	__udivsi3
	.align	2
	.global	kernel_IdlePercentage
	.type	kernel_IdlePercentage, %function
kernel_IdlePercentage:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r3, .L77
	mov	r5, r0
	mov	r0, #0
	ldr	r4, [r1, r3]
	bl	getTicks4(PLT)
	add	r4, r4, r4, asl #2
	add	r4, r4, r4, asl #2
	mov	r1, r0
	mov	r0, r4, asl #2
	bl	__udivsi3(PLT)
	str	r0, [r5, #4]
	mov	r0, #1
	ldmfd	sp!, {r4, r5, pc}
.L78:
	.align	2
.L77:
	.word	35116
	.size	kernel_IdlePercentage, .-kernel_IdlePercentage
	.align	2
	.global	processMail
	.type	processMail, %function
processMail:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	add	r0, r0, r0, asl #4
	add	r4, r1, r0, asl #4
	sub	sp, sp, #4
	mov	r6, r1
	mov	r0, r4
	mov	r1, r2
	mov	r7, r3
	mov	r5, r2
	bl	checkMail(PLT)
	cmp	r0, #0
	moveq	r3, #4
	streq	r3, [r4, #48]
	beq	.L82
	ldr	r3, [r5, #0]
	mov	r1, #0
	add	r3, r3, r3, asl #4
	add	r3, r6, r3, asl #4
	mov	r2, #6
	str	r2, [r3, #48]
	str	r1, [sp, #0]
	str	r1, [sp, #0]
	ldr	r1, [r5, #8]
	ldr	r3, [sp, #0]
	cmp	r3, r1
	bge	.L83
.L94:
	ldr	r2, [r4, #264]
	ldr	r3, [sp, #0]
	cmp	r2, r3
	ble	.L83
	ldr	ip, [sp, #0]
	ldr	r0, [r5, #4]
	ldr	r3, [sp, #0]
	ldr	r1, [r4, #260]
	ldrb	r2, [r0, r3]	@ zero_extendqisi2
	strb	r2, [r1, ip]
	ldr	r3, [sp, #0]
	ldr	r1, [r5, #8]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	cmp	r1, r2
	bgt	.L94
.L83:
	ldr	r3, [r4, #264]
	cmp	r3, r1
	ldrlt	r1, [r4, #264]
	ldrlt	r3, [r4, #260]
	movlt	r2, #0
	addlt	r3, r3, r1
	mvnlt	r1, #0
	strltb	r2, [r3, #-1]
	strge	r1, [r4, #4]
	strlt	r1, [r4, #4]
	ldr	r1, [r5, #0]
	ldr	r2, [r4, #268]
	mov	r3, #1
	cmp	r7, #0
	str	r1, [r2, #0]
	str	r3, [r4, #48]
	bne	.L95
.L82:
	mov	r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L95:
	mov	r0, r6
	mov	r1, r4
	bl	kernel_queuePush(PLT)
	b	.L82
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
	str	ip, [r0, #264]
	ldr	r4, [r0, #32]
	ldr	ip, [r1, #8]
	str	lr, [r0, #268]
	str	ip, [r0, #260]
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
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r4, [r1, #4]
	mov	r5, r0
	cmp	r4, #127
	mov	r8, r2
	mov	r7, r3
	ldr	r0, [r1, #12]
	ldr	ip, [r1, #20]
	bhi	.L99
	add	r3, r4, r4, asl #4
	add	r6, r2, r3, asl #4
	ldr	r2, [r6, #48]
	cmp	r2, #3
	beq	.L99
	ldr	r3, [r6, #48]
	cmp	r3, #0
	beq	.L99
	ldr	r3, [r5, #32]
	cmp	r4, r3
	beq	.L111
	ldr	r2, [r5, #32]
	ldr	r3, [r1, #16]
	ldr	r1, [r1, #8]
	str	r0, [r7, #8]
	str	r1, [r7, #4]
	str	r2, [r7, #0]
	str	r3, [r5, #260]
	str	ip, [r5, #264]
	mov	r0, r6
	mov	r1, r7
	bl	putMail(PLT)
	cmp	r0, #0
	beq	.L111
	ldr	r3, [r6, #48]
	cmp	r3, #4
	movne	r3, #5
	strne	r3, [r5, #48]
	bne	.L103
	mov	r0, r4
	mov	r1, r8
	mov	r2, r7
	sub	r3, r3, #3
	bl	processMail(PLT)
	b	.L103
.L99:
	mvn	r3, #1
	str	r3, [r5, #4]
.L103:
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L111:
	mvn	r3, #2
	mov	r0, #1
	str	r3, [r5, #4]
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.size	kernel_Send, .-kernel_Send
	.align	2
	.global	kernel_RegisterAs
	.type	kernel_RegisterAs, %function
kernel_RegisterAs:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	lr, .L120
	mov	r5, r0
	ldr	lr, [r2, lr]
	mov	r6, r1
	add	r4, lr, lr, asl #4
	cmn	lr, #1
	add	r4, r2, r4, asl #4
	beq	.L113
	ldr	ip, [r4, #48]
	cmp	ip, #3
	beq	.L113
	ldr	ip, [r4, #48]
	cmp	ip, #0
	bne	.L119
.L113:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r5, #4]
	ldmfd	sp!, {r4, r5, r6, pc}
.L119:
	str	lr, [r1, #4]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	kernel_Send(PLT)
.L121:
	.align	2
.L120:
	.word	35088
	.size	kernel_RegisterAs, .-kernel_RegisterAs
	.align	2
	.global	kernel_WhoIs
	.type	kernel_WhoIs, %function
kernel_WhoIs:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	lr, .L130
	mov	r5, r0
	ldr	lr, [r2, lr]
	mov	r6, r1
	add	r4, lr, lr, asl #4
	cmn	lr, #1
	add	r4, r2, r4, asl #4
	beq	.L123
	ldr	ip, [r4, #48]
	cmp	ip, #3
	beq	.L123
	ldr	ip, [r4, #48]
	cmp	ip, #0
	bne	.L129
.L123:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r5, #4]
	ldmfd	sp!, {r4, r5, r6, pc}
.L129:
	str	lr, [r1, #4]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	kernel_Send(PLT)
.L131:
	.align	2
.L130:
	.word	35088
	.size	kernel_WhoIs, .-kernel_WhoIs
	.align	2
	.global	kernel_RequestIOServer
	.type	kernel_RequestIOServer, %function
kernel_RequestIOServer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r5, .L139
	mov	lr, r2
	ldr	ip, [r2, r5]
	mov	r4, r0
	cmn	ip, #1
	beq	.L133
	ldr	lr, [r2, r5]
	ldr	ip, [r1, #4]
	cmp	lr, ip
	beq	.L138
.L133:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r4, #4]
	ldmfd	sp!, {r4, r5, pc}
.L138:
	ldmfd	sp!, {r4, r5, lr}
	b	kernel_Send(PLT)
.L140:
	.align	2
.L139:
	.word	35096
	.size	kernel_RequestIOServer, .-kernel_RequestIOServer
	.align	2
	.global	kernel_RequestClockServer
	.type	kernel_RequestClockServer, %function
kernel_RequestClockServer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r5, .L148
	mov	lr, r2
	ldr	ip, [r2, r5]
	mov	r4, r0
	cmn	ip, #1
	beq	.L142
	ldr	lr, [r2, r5]
	ldr	ip, [r1, #4]
	cmp	lr, ip
	beq	.L147
.L142:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r4, #4]
	ldmfd	sp!, {r4, r5, pc}
.L147:
	ldmfd	sp!, {r4, r5, lr}
	b	kernel_Send(PLT)
.L149:
	.align	2
.L148:
	.word	35092
	.size	kernel_RequestClockServer, .-kernel_RequestClockServer
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"TIMER 2 INTERRUPT, BITCHES\015\012\000"
	.text
	.align	2
	.global	processInterrupt
	.type	processInterrupt, %function
processInterrupt:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L183
	sub	sp, sp, #8
.L174:
	add	sl, pc, sl
	mov	r5, #0
	mov	r4, r0
	str	r5, [sp, #4]
	bl	checkInterrupts(PLT)
	str	r0, [sp, #0]
	ldr	r3, [sp, #0]
	ands	r0, r3, #1
	bne	.L176
	ldr	r3, [sp, #0]
	tst	r3, #2
	bne	.L177
.L155:
	ldr	r3, [sp, #0]
	tst	r3, #4
	bne	.L178
.L158:
	ldr	r3, [sp, #0]
	tst	r3, #8
	beq	.L160
.L182:
	ldr	r3, .L183+4
	mov	r6, #1
	ldr	r2, [r3, #0]
	str	r2, [sp, #4]
	str	r6, [r3, #0]
	ldr	r2, [sp, #4]
	tst	r2, #4
	bne	.L179
.L162:
	ldr	r3, [sp, #4]
	tst	r3, #2
	bne	.L180
.L160:
	ldr	r3, [sp, #0]
	tst	r3, #16
	beq	.L153
	ldr	r3, .L183+8
	mov	r6, #1
	ldr	r2, [r3, #0]
	str	r2, [sp, #4]
	str	r6, [r3, #0]
	ldr	r2, [sp, #4]
	tst	r2, #4
	bne	.L181
.L168:
	ldr	r3, [sp, #4]
	tst	r3, #2
	beq	.L153
	ldr	r5, .L183+12
	mov	r0, #0
	bl	toggleUART2ReceiveInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L153
.L175:
	ldr	r3, [r4, r5]
	mov	r2, #1
	add	r3, r3, r3, asl #4
	add	r3, r4, r3, asl #4
	str	r2, [r3, #48]
	ldr	r1, [r4, r5]
	mov	r0, r4
	add	r1, r1, r1, asl #4
	add	r1, r4, r1, asl #4
	bl	kernel_queuePush(PLT)
	mvn	r3, #0
	str	r3, [r4, r5]
.L153:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L177:
	ldr	r5, .L183+16
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L183+20
	bl	clearTimerInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L155
	ldr	r3, [r4, r5]
	mov	r2, #1
	add	r3, r3, r3, asl #4
	add	r3, r4, r3, asl #4
	str	r2, [r3, #48]
	ldr	r1, [r4, r5]
	mov	r0, r4
	add	r1, r1, r1, asl #4
	add	r1, r4, r1, asl #4
	bl	kernel_queuePush(PLT)
	mvn	r3, #0
	str	r3, [r4, r5]
	ldr	r3, [sp, #0]
	tst	r3, #4
	beq	.L158
.L178:
	ldr	r0, .L183+24
	bl	stopTimer(PLT)
	ldr	r0, .L183+24
	bl	clearTimerInterrupt(PLT)
	ldr	r1, .L183+28
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r3, #1
	ldr	r0, .L183+24
	mov	r1, #508
	ldr	r2, .L183+32
	bl	startTimer(PLT)
	ldr	r3, [sp, #0]
	tst	r3, #8
	beq	.L160
	b	.L182
.L176:
	ldr	r0, .L183+20
	bl	stopTimer(PLT)
	ldr	r0, .L183+20
	bl	clearTimerInterrupt(PLT)
	mov	r3, #1
	mov	r1, #508
	ldr	r2, .L183+36
	ldr	r0, .L183+20
	bl	startTimer(PLT)
	ldr	r0, .L183+40
	bl	clearTimerInterrupt(PLT)
	mov	r0, r5
	ldr	r5, .L183+16
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L183+20
	bl	clearTimerInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	bgt	.L175
	b	.L153
.L180:
	ldr	r5, .L183+44
	mov	r0, #0
	bl	toggleUART1ReceiveInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L160
	ldr	r3, [r4, r5]
	mov	r2, #1
	add	r3, r3, r3, asl #4
	add	r3, r4, r3, asl #4
	str	r2, [r3, #48]
	ldr	r1, [r4, r5]
	mov	r0, r4
	add	r1, r1, r1, asl #4
	add	r1, r4, r1, asl #4
	bl	kernel_queuePush(PLT)
	mvn	r3, #0
	str	r3, [r4, r5]
	b	.L160
.L181:
	ldr	r5, .L183+48
	mov	r0, #0
	bl	toggleUART2SendInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L168
	ldr	r3, [r4, r5]
	mov	r0, r4
	add	r3, r3, r3, asl #4
	add	r3, r4, r3, asl #4
	str	r6, [r3, #48]
	ldr	r1, [r4, r5]
	add	r1, r1, r1, asl #4
	add	r1, r4, r1, asl #4
	bl	kernel_queuePush(PLT)
	mvn	r3, #0
	str	r3, [r4, r5]
	b	.L168
.L179:
	ldr	r5, .L183+52
	mov	r0, #0
	bl	toggleUART1SendInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L162
	ldr	r3, [r4, r5]
	mov	r0, r4
	add	r3, r3, r3, asl #4
	add	r3, r4, r3, asl #4
	str	r6, [r3, #48]
	ldr	r1, [r4, r5]
	add	r1, r1, r1, asl #4
	add	r1, r4, r1, asl #4
	bl	kernel_queuePush(PLT)
	mvn	r3, #0
	str	r3, [r4, r5]
	b	.L162
.L184:
	.align	2
.L183:
	.word	_GLOBAL_OFFSET_TABLE_-(.L174+8)
	.word	-2138308580
	.word	-2138243044
	.word	35136
	.word	35120
	.word	-2139029504
	.word	-2139029472
	.word	.LC0(GOTOFF)
	.word	5080
	.word	5085
	.word	-2139029376
	.word	35128
	.word	35132
	.word	35124
	.size	processInterrupt, .-processInterrupt
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"<Kernel>: Could not await TD<%d>, as TD<%d> waiting"
	.ascii	" on await_TIMER.\015\012\000"
	.align	2
.LC2:
	.ascii	"<Kernel>: Could not await TD<%d>, as TD<%d> waiting"
	.ascii	" on await_UART1SEND.\015\012\000"
	.align	2
.LC3:
	.ascii	"<Kernel>: Could not await TD<%d>, as TD<%d> waiting"
	.ascii	" on await_UART1RECEIVE.\015\012\000"
	.align	2
.LC4:
	.ascii	"<Kernel>: Could not await TD<%d>, as TD<%d> waiting"
	.ascii	" on await_UART2SEND.\015\012\000"
	.align	2
.LC5:
	.ascii	"<Kernel>: Could not await TD<%d>, as TD<%d> waiting"
	.ascii	" on await_UART2RECEIVE.\015\012\000"
	.text
	.align	2
	.global	kernel_AwaitEvent
	.type	kernel_AwaitEvent, %function
kernel_AwaitEvent:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L196
	ldr	r3, [r1, #4]
.L195:
	add	sl, pc, sl
	sub	sp, sp, #4
	mov	r5, r0
	mov	r6, r2
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L186
	.p2align 2
.L192:
	b	.L187
	b	.L188
	b	.L189
	b	.L190
	b	.L191
.L186:
	mvn	r3, #0
	str	r3, [r0, #4]
	mov	r0, #0
.L193:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L191:
	ldr	r4, .L196+4
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L196+8
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	add	r2, sl, r2
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	mov	r3, #7
	str	r3, [r5, #48]
	ldr	r2, [r5, #32]
	mov	r0, #1
	str	r2, [r6, r4]
	bl	toggleUART2VICInterrupt(PLT)
	mov	r0, #1
	bl	toggleUART2ReceiveInterrupt(PLT)
	mov	r0, #1
	b	.L193
.L190:
	ldr	r4, .L196+12
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L196+16
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	add	r2, sl, r2
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	mov	r3, #7
	str	r3, [r5, #48]
	ldr	r2, [r5, #32]
	mov	r0, #1
	str	r2, [r6, r4]
	bl	toggleUART2VICInterrupt(PLT)
	mov	r0, #1
	bl	toggleUART2SendInterrupt(PLT)
	mov	r0, #1
	b	.L193
.L189:
	ldr	r4, .L196+20
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L196+24
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	add	r2, sl, r2
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	mov	r3, #7
	str	r3, [r5, #48]
	ldr	r2, [r5, #32]
	mov	r0, #1
	str	r2, [r6, r4]
	bl	toggleUART1VICInterrupt(PLT)
	mov	r0, #1
	bl	toggleUART1ReceiveInterrupt(PLT)
	mov	r0, #1
	b	.L193
.L188:
	ldr	r4, .L196+28
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L196+32
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	add	r2, sl, r2
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	mov	r3, #7
	str	r3, [r5, #48]
	ldr	r2, [r5, #32]
	mov	r0, #1
	str	r2, [r6, r4]
	bl	toggleUART1VICInterrupt(PLT)
	mov	r0, #1
	bl	toggleUART1SendInterrupt(PLT)
	mov	r0, #1
	b	.L193
.L187:
	ldr	r4, .L196+36
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L196+40
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	add	r2, sl, r2
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	mov	r3, #7
	str	r3, [r5, #48]
	ldr	r2, [r5, #32]
	mov	r0, #1
	str	r2, [r6, r4]
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L196+44
	bl	clearTimerInterrupt(PLT)
	mov	r0, #1
	b	.L193
.L197:
	.align	2
.L196:
	.word	_GLOBAL_OFFSET_TABLE_-(.L195+8)
	.word	35136
	.word	.LC5(GOTOFF)
	.word	35132
	.word	.LC4(GOTOFF)
	.word	35128
	.word	.LC3(GOTOFF)
	.word	35124
	.word	.LC2(GOTOFF)
	.word	35120
	.word	.LC1(GOTOFF)
	.word	-2139029504
	.size	kernel_AwaitEvent, .-kernel_AwaitEvent
	.align	2
	.global	processRequest
	.type	processRequest, %function
processRequest:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	str	lr, [sp, #-4]!
	mov	ip, r3
	mov	lr, r0
	beq	.L228
	ldr	r3, [r2, #0]
	sub	r3, r3, #1
	cmp	r3, #17
	addls	pc, pc, r3, asl #2
	b	.L201
	.p2align 2
.L219:
	b	.L202
	b	.L203
	b	.L204
	b	.L205
	b	.L206
	b	.L207
	b	.L208
	b	.L209
	b	.L210
	b	.L211
	b	.L212
	b	.L213
	b	.L214
	b	.L215
	b	.L201
	b	.L216
	b	.L217
	b	.L218
.L202:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_MyTid(PLT)
.L218:
	mov	r0, r1
	mov	r1, lr
	ldr	lr, [sp], #4
	b	kernel_IdlePercentage(PLT)
.L217:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_RequestIOServer(PLT)
.L216:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_RequestClockServer(PLT)
.L201:
	mov	r0, #0
	ldr	pc, [sp], #4
.L215:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_AwaitEvent(PLT)
.L214:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_RegisterAs(PLT)
.L213:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_WhoIs(PLT)
.L212:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_Reply(PLT)
.L211:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_Receive(PLT)
.L210:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_Send(PLT)
.L209:
	ldr	r0, .L229
	ldr	r2, [r1, #32]
	ldr	r3, [lr, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [lr, r0]
	ldr	r0, .L229+4
	ldr	r2, [r1, #32]
	ldr	r3, [lr, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [lr, r0]
	ldr	r0, .L229+8
	ldr	r2, [r1, #32]
	ldr	r3, [lr, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [lr, r0]
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_Exit(PLT)
.L208:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_Pass(PLT)
.L207:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_CreateIOServer(PLT)
.L206:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_CreateClockServer(PLT)
.L205:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_CreateNameServer(PLT)
.L204:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_Create(PLT)
.L203:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_MyParentTid(PLT)
.L228:
	mov	r3, #1
	str	r3, [r1, #20]
	ldr	lr, [sp], #4
	b	processInterrupt(PLT)
.L230:
	.align	2
.L229:
	.word	35088
	.word	35096
	.word	35092
	.size	processRequest, .-processRequest
	.ident	"GCC: (GNU) 4.0.2"
