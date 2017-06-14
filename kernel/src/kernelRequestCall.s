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
	.global	kernel_Quit
	.type	kernel_Quit, %function
kernel_Quit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	mov	ip, r0
	mov	r2, #2
	mov	r0, #1
	str	r2, [r1, r3]
	@ lr needed for prologue
	str	r0, [ip, #4]
	bx	lr
.L10:
	.align	2
.L9:
	.word	35156
	.size	kernel_Quit, .-kernel_Quit
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
	bhi	.L14
	add	r3, r3, r3, asl #4
	add	lr, r2, r3, asl #4
	ldr	r2, [lr, #48]
	cmp	r2, #3
	beq	.L14
	ldr	r3, [lr, #48]
	cmp	r3, #0
	beq	.L14
	ldr	r3, [lr, #48]
	ldr	r6, [r1, #12]
	cmp	r3, #5
	beq	.L19
	ldr	r3, [lr, #48]
	cmp	r3, #6
	mvnne	r3, #2
	strne	r3, [r0, #4]
	bne	.L18
.L19:
	mov	r2, #0
	str	r2, [sp, #0]
	str	r2, [sp, #0]
	ldr	r3, [sp, #0]
	cmp	r6, r3
	ble	.L22
	ldr	r2, [lr, #264]
	ldr	r3, [sp, #0]
	cmp	r2, r3
	ble	.L22
.L30:
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
	bge	.L22
	ldr	r2, [lr, #264]
	ldr	r3, [sp, #0]
	cmp	r3, r2
	blt	.L30
.L22:
	ldr	r3, [lr, #264]
	cmp	r6, r3
	movle	r3, #0
	strle	r3, [r5, #4]
	strle	r6, [lr, #4]
	bgt	.L34
.L28:
	mov	r3, #1
	str	r3, [lr, #48]
	mov	r0, r7
	mov	r1, lr
	bl	kernel_queuePush(PLT)
	b	.L18
.L14:
	mvn	r3, #1
	str	r3, [r5, #4]
.L18:
	mov	r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L34:
	ldr	r1, [lr, #264]
	ldr	r3, [lr, #260]
	mvn	r0, #0
	add	r3, r3, r1
	mov	r2, #0
	strb	r2, [r3, #-1]
	str	r0, [r5, #4]
	str	r0, [lr, #4]
	b	.L28
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
	bls	.L42
.L38:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L42:
	mov	r3, #0
	str	r3, [ip, #-4]!
	mov	r1, ip
	bl	getNextTID(PLT)
	cmp	r0, #0
	mov	r3, r6
	mvnne	r3, #1
	mov	r0, r5
	strne	r3, [r4, #4]
	bne	.L38
	ldr	r1, [sp, #4]
	ldr	ip, [r7, #8]
	str	r1, [r4, #4]
	ldr	r2, [r4, #32]
	str	ip, [sp, #0]
	bl	setTask(PLT)
	mov	r1, r0
	mov	r0, r5
	bl	kernel_queuePush(PLT)
	b	.L38
	.size	kernel_Create, .-kernel_Create
	.align	2
	.global	kernel_CreateIOServer
	.type	kernel_CreateIOServer, %function
kernel_CreateIOServer:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r8, [r1, #4]
	sub	sp, sp, #8
	cmp	r8, #31
	mvnhi	r3, #0
	mov	r6, r1
	mov	r7, r0
	mov	r5, r2
	ldr	r4, [r1, #12]
	strhi	r3, [r0, #4]
	bhi	.L46
	cmp	r4, #0
	beq	.L93
	cmp	r4, #1
	beq	.L94
	cmp	r4, #2
	beq	.L95
	cmp	r4, #3
	beq	.L96
	cmp	r4, #4
	beq	.L97
	mvnhi	r3, #3
	strhi	r3, [r0, #4]
	bhi	.L46
.L67:
	mov	r3, #0
	add	r1, sp, #8
	str	r3, [r1, #-4]!
	mov	r0, r5
	bl	getNextTID(PLT)
	cmp	r0, #0
	mvnne	r3, #1
	strne	r3, [r7, #4]
	bne	.L46
	ldr	r1, [sp, #4]
	ldr	ip, [r6, #8]
	str	r1, [r7, #4]
	ldr	r2, [r7, #32]
	mov	r3, r8
	mov	r0, r5
	str	ip, [sp, #0]
	bl	setTask(PLT)
	mov	r1, r0
	mov	r0, r5
	bl	kernel_queuePush(PLT)
	cmp	r4, #4
	addls	pc, pc, r4, asl #2
	b	.L46
	.p2align 2
.L76:
	b	.L71
	b	.L72
	b	.L73
	b	.L74
	b	.L75
.L75:
	ldr	r2, [sp, #4]
	ldr	r3, .L98
	str	r2, [r5, r3]
.L46:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L93:
	ldr	r2, .L98+4
	ldr	r3, [r5, r2]
	cmn	r3, #1
	beq	.L67
.L92:
	ldr	r3, [r5, r2]
	add	r3, r3, r3, asl #4
	add	r3, r5, r3, asl #4
	ldr	r2, [r3, #48]
	cmp	r2, #3
	mvnne	r3, #2
	strne	r3, [r7, #4]
	bne	.L46
	b	.L67
.L94:
	ldr	r2, .L98+8
	ldr	r3, [r5, r2]
	cmn	r3, #1
	bne	.L92
	b	.L67
.L95:
	ldr	r2, .L98+12
	ldr	r3, [r5, r2]
	cmn	r3, #1
	bne	.L92
	b	.L67
.L96:
	ldr	r2, .L98+16
	ldr	r3, [r5, r2]
	cmn	r3, #1
	bne	.L92
	b	.L67
.L97:
	ldr	r2, .L98
	ldr	r3, [r5, r2]
	cmn	r3, #1
	bne	.L92
	b	.L67
.L71:
	ldr	r2, [sp, #4]
	ldr	r3, .L98+4
	str	r2, [r5, r3]
	b	.L46
.L72:
	ldr	r2, [sp, #4]
	ldr	r3, .L98+8
	str	r2, [r5, r3]
	b	.L46
.L73:
	ldr	r2, [sp, #4]
	ldr	r3, .L98+12
	str	r2, [r5, r3]
	b	.L46
.L74:
	ldr	r2, [sp, #4]
	ldr	r3, .L98+16
	str	r2, [r5, r3]
	b	.L46
.L99:
	.align	2
.L98:
	.word	35108
	.word	35112
	.word	35096
	.word	35100
	.word	35104
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
	ldr	ip, .L110
	mov	r7, r1
	mov	r4, r2
	mov	r5, r0
	strhi	r3, [r0, #4]
	bhi	.L103
	ldr	r3, [r2, ip]
	add	r1, sp, #8
	cmn	r3, #1
	mov	r0, r2
	beq	.L104
	ldr	r3, [r2, ip]
	add	r3, r3, r3, asl #4
	add	r3, r2, r3, asl #4
	ldr	r2, [r3, #48]
	cmp	r2, #3
	mvnne	r3, #2
	strne	r3, [r5, #4]
	beq	.L104
.L103:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L104:
	mov	r3, #0
	str	r3, [r1, #-4]!
	bl	getNextTID(PLT)
	cmp	r0, #0
	mov	r3, r6
	mvnne	r3, #1
	mov	r0, r4
	strne	r3, [r5, #4]
	bne	.L103
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
	ldr	r3, .L110
	str	r2, [r4, r3]
	b	.L103
.L111:
	.align	2
.L110:
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
	ldr	ip, .L122
	mov	r7, r1
	mov	r4, r2
	mov	r5, r0
	strhi	r3, [r0, #4]
	bhi	.L115
	ldr	r3, [r2, ip]
	add	r1, sp, #8
	cmn	r3, #1
	mov	r0, r2
	beq	.L116
	ldr	r3, [r2, ip]
	add	r3, r3, r3, asl #4
	add	r3, r2, r3, asl #4
	ldr	r2, [r3, #48]
	cmp	r2, #3
	mvnne	r3, #2
	strne	r3, [r5, #4]
	beq	.L116
.L115:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L116:
	mov	r3, #0
	str	r3, [r1, #-4]!
	bl	getNextTID(PLT)
	cmp	r0, #0
	mov	r3, r6
	mvnne	r3, #1
	mov	r0, r4
	strne	r3, [r5, #4]
	bne	.L115
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
	ldr	r3, .L122
	str	r2, [r4, r3]
	b	.L115
.L123:
	.align	2
.L122:
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
	ldr	r3, .L126
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
.L127:
	.align	2
.L126:
	.word	35132
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
	beq	.L131
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
	bge	.L132
.L143:
	ldr	r2, [r4, #264]
	ldr	r3, [sp, #0]
	cmp	r2, r3
	ble	.L132
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
	bgt	.L143
.L132:
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
	bne	.L144
.L131:
	mov	r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L144:
	mov	r0, r6
	mov	r1, r4
	bl	kernel_queuePush(PLT)
	b	.L131
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
	bhi	.L148
	add	r3, r4, r4, asl #4
	add	r6, r2, r3, asl #4
	ldr	r2, [r6, #48]
	cmp	r2, #3
	beq	.L148
	ldr	r3, [r6, #48]
	cmp	r3, #0
	beq	.L148
	ldr	r3, [r5, #32]
	cmp	r4, r3
	beq	.L160
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
	beq	.L160
	ldr	r3, [r6, #48]
	cmp	r3, #4
	movne	r3, #5
	strne	r3, [r5, #48]
	bne	.L152
	mov	r0, r4
	mov	r1, r8
	mov	r2, r7
	sub	r3, r3, #3
	bl	processMail(PLT)
	b	.L152
.L148:
	mvn	r3, #1
	str	r3, [r5, #4]
.L152:
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L160:
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
	ldr	lr, .L169
	mov	r5, r0
	ldr	lr, [r2, lr]
	mov	r6, r1
	add	r4, lr, lr, asl #4
	cmn	lr, #1
	add	r4, r2, r4, asl #4
	beq	.L162
	ldr	ip, [r4, #48]
	cmp	ip, #3
	beq	.L162
	ldr	ip, [r4, #48]
	cmp	ip, #0
	bne	.L168
.L162:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r5, #4]
	ldmfd	sp!, {r4, r5, r6, pc}
.L168:
	str	lr, [r1, #4]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	kernel_Send(PLT)
.L170:
	.align	2
.L169:
	.word	35088
	.size	kernel_RegisterAs, .-kernel_RegisterAs
	.align	2
	.global	kernel_WhoIs
	.type	kernel_WhoIs, %function
kernel_WhoIs:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	lr, .L179
	mov	r5, r0
	ldr	lr, [r2, lr]
	mov	r6, r1
	add	r4, lr, lr, asl #4
	cmn	lr, #1
	add	r4, r2, r4, asl #4
	beq	.L172
	ldr	ip, [r4, #48]
	cmp	ip, #3
	beq	.L172
	ldr	ip, [r4, #48]
	cmp	ip, #0
	bne	.L178
.L172:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r5, #4]
	ldmfd	sp!, {r4, r5, r6, pc}
.L178:
	str	lr, [r1, #4]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	kernel_Send(PLT)
.L180:
	.align	2
.L179:
	.word	35088
	.size	kernel_WhoIs, .-kernel_WhoIs
	.align	2
	.global	kernel_RequestIOServer
	.type	kernel_RequestIOServer, %function
kernel_RequestIOServer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	lr, .L203
	mov	r4, r2
	ldr	ip, [r2, lr]
	mov	r6, r0
	cmn	ip, #1
	mov	r5, r1
	mov	r7, r3
	beq	.L182
	ldr	lr, [r2, lr]
	ldr	ip, [r1, #4]
	cmp	lr, ip
	beq	.L202
.L182:
	ldr	r2, .L203+4
	ldr	r3, [r4, r2]
	cmn	r3, #1
	beq	.L185
	ldr	r2, [r4, r2]
	ldr	r3, [r5, #4]
	cmp	r2, r3
	beq	.L201
.L185:
	ldr	r2, .L203+8
	ldr	r3, [r4, r2]
	cmn	r3, #1
	beq	.L188
	ldr	r2, [r4, r2]
	ldr	r3, [r5, #4]
	cmp	r2, r3
	beq	.L201
.L188:
	ldr	r2, .L203+12
	ldr	r3, [r4, r2]
	cmn	r3, #1
	beq	.L191
	ldr	r2, [r4, r2]
	ldr	r3, [r5, #4]
	cmp	r2, r3
	beq	.L201
.L191:
	ldr	r2, .L203+16
	ldr	r3, [r4, r2]
	cmn	r3, #1
	beq	.L194
	ldr	r2, [r4, r2]
	ldr	r3, [r5, #4]
	cmp	r2, r3
	beq	.L201
.L194:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r6, #4]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L201:
	mov	r0, r6
	mov	r1, r5
	mov	r2, r4
	mov	r3, r7
.L202:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	kernel_Send(PLT)
.L204:
	.align	2
.L203:
	.word	35112
	.word	35096
	.word	35100
	.word	35104
	.word	35108
	.size	kernel_RequestIOServer, .-kernel_RequestIOServer
	.align	2
	.global	kernel_RequestClockServer
	.type	kernel_RequestClockServer, %function
kernel_RequestClockServer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r5, .L212
	mov	lr, r2
	ldr	ip, [r2, r5]
	mov	r4, r0
	cmn	ip, #1
	beq	.L206
	ldr	lr, [r2, r5]
	ldr	ip, [r1, #4]
	cmp	lr, ip
	beq	.L211
.L206:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r4, #4]
	ldmfd	sp!, {r4, r5, pc}
.L211:
	ldmfd	sp!, {r4, r5, lr}
	b	kernel_Send(PLT)
.L213:
	.align	2
.L212:
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
	ldr	sl, .L247
	sub	sp, sp, #8
.L238:
	add	sl, pc, sl
	mov	r5, #0
	mov	r4, r0
	str	r5, [sp, #4]
	bl	checkInterrupts(PLT)
	str	r0, [sp, #0]
	ldr	r3, [sp, #0]
	ands	r0, r3, #1
	bne	.L240
	ldr	r3, [sp, #0]
	tst	r3, #2
	bne	.L241
.L219:
	ldr	r3, [sp, #0]
	tst	r3, #4
	bne	.L242
.L222:
	ldr	r3, [sp, #0]
	tst	r3, #8
	beq	.L224
.L246:
	ldr	r3, .L247+4
	mov	r6, #1
	ldr	r2, [r3, #0]
	str	r2, [sp, #4]
	str	r6, [r3, #0]
	ldr	r2, [sp, #4]
	tst	r2, #4
	bne	.L243
.L226:
	ldr	r3, [sp, #4]
	tst	r3, #2
	bne	.L244
.L224:
	ldr	r3, [sp, #0]
	tst	r3, #16
	beq	.L217
	ldr	r3, .L247+8
	mov	r6, #1
	ldr	r2, [r3, #0]
	str	r2, [sp, #4]
	str	r6, [r3, #0]
	ldr	r2, [sp, #4]
	tst	r2, #4
	bne	.L245
.L232:
	ldr	r3, [sp, #4]
	tst	r3, #2
	beq	.L217
	ldr	r5, .L247+12
	mov	r0, #0
	bl	toggleUART2ReceiveInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L217
.L239:
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
.L217:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L241:
	ldr	r5, .L247+16
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L247+20
	bl	clearTimerInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L219
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
	beq	.L222
.L242:
	ldr	r0, .L247+24
	bl	stopTimer(PLT)
	ldr	r0, .L247+24
	bl	clearTimerInterrupt(PLT)
	ldr	r1, .L247+28
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r3, #1
	ldr	r0, .L247+24
	mov	r1, #508
	ldr	r2, .L247+32
	bl	startTimer(PLT)
	ldr	r3, [sp, #0]
	tst	r3, #8
	beq	.L224
	b	.L246
.L240:
	ldr	r0, .L247+20
	bl	stopTimer(PLT)
	ldr	r0, .L247+20
	bl	clearTimerInterrupt(PLT)
	mov	r3, #1
	mov	r1, #508
	ldr	r2, .L247+36
	ldr	r0, .L247+20
	bl	startTimer(PLT)
	ldr	r0, .L247+40
	bl	clearTimerInterrupt(PLT)
	mov	r0, r5
	ldr	r5, .L247+16
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L247+20
	bl	clearTimerInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	bgt	.L239
	b	.L217
.L244:
	ldr	r5, .L247+44
	mov	r0, #0
	bl	toggleUART1ReceiveInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L224
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
	b	.L224
.L245:
	ldr	r5, .L247+48
	mov	r0, #0
	bl	toggleUART2SendInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L232
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
	b	.L232
.L243:
	ldr	r5, .L247+52
	mov	r0, #0
	bl	toggleUART1SendInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L226
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
	b	.L226
.L248:
	.align	2
.L247:
	.word	_GLOBAL_OFFSET_TABLE_-(.L238+8)
	.word	-2138308580
	.word	-2138243044
	.word	35152
	.word	35136
	.word	-2139029504
	.word	-2139029472
	.word	.LC0(GOTOFF)
	.word	5080
	.word	5085
	.word	-2139029376
	.word	35144
	.word	35148
	.word	35140
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
	ldr	sl, .L260
	ldr	r3, [r1, #4]
.L259:
	add	sl, pc, sl
	sub	sp, sp, #4
	mov	r5, r0
	mov	r6, r2
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L250
	.p2align 2
.L256:
	b	.L251
	b	.L252
	b	.L253
	b	.L254
	b	.L255
.L250:
	mvn	r3, #0
	str	r3, [r0, #4]
	mov	r0, #0
.L257:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L255:
	ldr	r4, .L260+4
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L260+8
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
	b	.L257
.L254:
	ldr	r4, .L260+12
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L260+16
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
	b	.L257
.L253:
	ldr	r4, .L260+20
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L260+24
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
	b	.L257
.L252:
	ldr	r4, .L260+28
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L260+32
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
	b	.L257
.L251:
	ldr	r4, .L260+36
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L260+40
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
	ldr	r0, .L260+44
	bl	clearTimerInterrupt(PLT)
	mov	r0, #1
	b	.L257
.L261:
	.align	2
.L260:
	.word	_GLOBAL_OFFSET_TABLE_-(.L259+8)
	.word	35152
	.word	.LC5(GOTOFF)
	.word	35148
	.word	.LC4(GOTOFF)
	.word	35144
	.word	.LC3(GOTOFF)
	.word	35140
	.word	.LC2(GOTOFF)
	.word	35136
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
	beq	.L301
	ldr	r3, [r2, #0]
	sub	r3, r3, #1
	cmp	r3, #18
	addls	pc, pc, r3, asl #2
	b	.L265
	.p2align 2
.L284:
	b	.L266
	b	.L267
	b	.L268
	b	.L269
	b	.L270
	b	.L271
	b	.L272
	b	.L273
	b	.L274
	b	.L275
	b	.L276
	b	.L277
	b	.L278
	b	.L279
	b	.L265
	b	.L280
	b	.L281
	b	.L282
	b	.L283
.L301:
	mov	r3, #1
	str	r3, [r1, #20]
	ldr	lr, [sp], #4
	b	processInterrupt(PLT)
.L266:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_MyTid(PLT)
.L267:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_MyParentTid(PLT)
.L268:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_Create(PLT)
.L269:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_CreateNameServer(PLT)
.L270:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_CreateClockServer(PLT)
.L271:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_CreateIOServer(PLT)
.L272:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_Pass(PLT)
.L273:
	ldr	r0, .L302
	ldr	r2, [r1, #32]
	ldr	r3, [lr, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [lr, r0]
	ldr	r0, .L302+4
	ldr	r2, [r1, #32]
	ldr	r3, [lr, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [lr, r0]
	ldr	r0, .L302+8
	ldr	r2, [r1, #32]
	ldr	r3, [lr, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [lr, r0]
	ldr	r0, .L302+12
	ldr	r2, [r1, #32]
	ldr	r3, [lr, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [lr, r0]
	ldr	r0, .L302+16
	ldr	r2, [r1, #32]
	ldr	r3, [lr, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [lr, r0]
	ldr	r0, .L302+20
	ldr	r2, [r1, #32]
	ldr	r3, [lr, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [lr, r0]
	ldr	r0, .L302+24
	ldr	r2, [r1, #32]
	ldr	r3, [lr, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [lr, r0]
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_Exit(PLT)
.L274:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_Send(PLT)
.L275:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_Receive(PLT)
.L276:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_Reply(PLT)
.L277:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_WhoIs(PLT)
.L278:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_RegisterAs(PLT)
.L279:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_AwaitEvent(PLT)
.L265:
	mov	r0, #0
	ldr	pc, [sp], #4
.L280:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_RequestClockServer(PLT)
.L281:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_RequestIOServer(PLT)
.L282:
	mov	r0, r1
	mov	r1, lr
	ldr	lr, [sp], #4
	b	kernel_IdlePercentage(PLT)
.L283:
	mov	r0, r1
	mov	r1, lr
	ldr	lr, [sp], #4
	b	kernel_Quit(PLT)
.L303:
	.align	2
.L302:
	.word	35088
	.word	35112
	.word	35096
	.word	35104
	.word	35100
	.word	35108
	.word	35092
	.size	processRequest, .-processRequest
	.ident	"GCC: (GNU) 4.0.2"
