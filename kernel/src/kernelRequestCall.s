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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ERROR: tid > MAX_TID - 1 = %d, tid < 0 = %d, ks->TD"
	.ascii	"List[tid]).state == ZOMBIE = %d, (ks->TDList[tid])."
	.ascii	"state == FREE = %d\015\012\000"
	.text
	.align	2
	.global	kernel_Send
	.type	kernel_Send, %function
kernel_Send:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	r5, [r1, #4]
	ldr	sl, .L114
	cmp	r5, #127
.L112:
	add	sl, pc, sl
	sub	sp, sp, #12
	mov	r6, r0
	mov	r7, r2
	mov	r8, r3
	ldr	ip, [r1, #12]
	ldr	lr, [r1, #20]
	bhi	.L111
	mov	r0, r5, asl #4
	add	r3, r0, r5
	add	r4, r2, r3, asl #4
	ldr	r2, [r4, #48]
	cmp	r2, #3
	beq	.L99
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L99
	ldr	r3, [r6, #32]
	cmp	r5, r3
	beq	.L113
	ldr	r2, [r6, #32]
	ldr	r3, [r1, #16]
	ldr	r1, [r1, #8]
	str	r2, [r8, #0]
	stmib	r8, {r1, ip}	@ phole stm
	str	r3, [r6, #260]
	str	lr, [r6, #264]
	mov	r0, r4
	mov	r1, r8
	bl	putMail(PLT)
	cmp	r0, #0
	bne	.L106
.L113:
	mvn	r3, #2
	str	r3, [r6, #4]
	b	.L103
.L111:
	mov	r0, r5, asl #4
.L99:
	add	r3, r0, r5
	add	r3, r7, r3, asl #4
	ldr	ip, [r3, #48]
	ldr	r2, .L114+4
	ldr	r4, [r3, #48]
	cmp	ip, #3
	movne	ip, #0
	moveq	ip, #1
	cmp	r5, #128
	movle	r3, #0
	movgt	r3, #1
	mov	lr, r5, lsr #31
	rsbs	r4, r4, #1
	movcc	r4, #0
	add	r2, sl, r2
	mov	r0, #0
	mov	r1, #1
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	str	r4, [sp, #8]
	bl	bwassert(PLT)
	mvn	r3, #1
	str	r3, [r6, #4]
.L103:
	mov	r0, #1
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L106:
	ldr	r3, [r4, #48]
	cmp	r3, #4
	movne	r3, #5
	strne	r3, [r6, #48]
	bne	.L103
	mov	r0, r5
	mov	r1, r7
	mov	r2, r8
	sub	r3, r3, #3
	bl	processMail(PLT)
	b	.L103
.L115:
	.align	2
.L114:
	.word	_GLOBAL_OFFSET_TABLE_-(.L112+8)
	.word	.LC0(GOTOFF)
	.size	kernel_Send, .-kernel_Send
	.align	2
	.global	kernel_RegisterAs
	.type	kernel_RegisterAs, %function
kernel_RegisterAs:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	lr, .L124
	mov	r5, r0
	ldr	lr, [r2, lr]
	mov	r6, r1
	add	r4, lr, lr, asl #4
	cmn	lr, #1
	add	r4, r2, r4, asl #4
	beq	.L117
	ldr	ip, [r4, #48]
	cmp	ip, #3
	beq	.L117
	ldr	ip, [r4, #48]
	cmp	ip, #0
	bne	.L123
.L117:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r5, #4]
	ldmfd	sp!, {r4, r5, r6, pc}
.L123:
	str	lr, [r1, #4]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	kernel_Send(PLT)
.L125:
	.align	2
.L124:
	.word	35088
	.size	kernel_RegisterAs, .-kernel_RegisterAs
	.align	2
	.global	kernel_WhoIs
	.type	kernel_WhoIs, %function
kernel_WhoIs:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	lr, .L134
	mov	r5, r0
	ldr	lr, [r2, lr]
	mov	r6, r1
	add	r4, lr, lr, asl #4
	cmn	lr, #1
	add	r4, r2, r4, asl #4
	beq	.L127
	ldr	ip, [r4, #48]
	cmp	ip, #3
	beq	.L127
	ldr	ip, [r4, #48]
	cmp	ip, #0
	bne	.L133
.L127:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r5, #4]
	ldmfd	sp!, {r4, r5, r6, pc}
.L133:
	str	lr, [r1, #4]
	ldmfd	sp!, {r4, r5, r6, lr}
	b	kernel_Send(PLT)
.L135:
	.align	2
.L134:
	.word	35088
	.size	kernel_WhoIs, .-kernel_WhoIs
	.align	2
	.global	kernel_RequestIOServer
	.type	kernel_RequestIOServer, %function
kernel_RequestIOServer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r5, .L143
	mov	lr, r2
	ldr	ip, [r2, r5]
	mov	r4, r0
	cmn	ip, #1
	beq	.L137
	ldr	lr, [r2, r5]
	ldr	ip, [r1, #4]
	cmp	lr, ip
	beq	.L142
.L137:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r4, #4]
	ldmfd	sp!, {r4, r5, pc}
.L142:
	ldmfd	sp!, {r4, r5, lr}
	b	kernel_Send(PLT)
.L144:
	.align	2
.L143:
	.word	35096
	.size	kernel_RequestIOServer, .-kernel_RequestIOServer
	.align	2
	.global	kernel_RequestClockServer
	.type	kernel_RequestClockServer, %function
kernel_RequestClockServer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r5, .L152
	mov	lr, r2
	ldr	ip, [r2, r5]
	mov	r4, r0
	cmn	ip, #1
	beq	.L146
	ldr	lr, [r2, r5]
	ldr	ip, [r1, #4]
	cmp	lr, ip
	beq	.L151
.L146:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r4, #4]
	ldmfd	sp!, {r4, r5, pc}
.L151:
	ldmfd	sp!, {r4, r5, lr}
	b	kernel_Send(PLT)
.L153:
	.align	2
.L152:
	.word	35092
	.size	kernel_RequestClockServer, .-kernel_RequestClockServer
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"TIMER 2 INTERRUPT, BITCHES\015\012\000"
	.text
	.align	2
	.global	processInterrupt
	.type	processInterrupt, %function
processInterrupt:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L187
	sub	sp, sp, #8
.L178:
	add	sl, pc, sl
	mov	r5, #0
	mov	r4, r0
	str	r5, [sp, #4]
	bl	checkInterrupts(PLT)
	str	r0, [sp, #0]
	ldr	r3, [sp, #0]
	ands	r0, r3, #1
	bne	.L180
	ldr	r3, [sp, #0]
	tst	r3, #2
	bne	.L181
.L159:
	ldr	r3, [sp, #0]
	tst	r3, #4
	bne	.L182
.L162:
	ldr	r3, [sp, #0]
	tst	r3, #8
	beq	.L164
.L186:
	ldr	r3, .L187+4
	mov	r6, #1
	ldr	r2, [r3, #0]
	str	r2, [sp, #4]
	str	r6, [r3, #0]
	ldr	r2, [sp, #4]
	tst	r2, #4
	bne	.L183
.L166:
	ldr	r3, [sp, #4]
	tst	r3, #2
	bne	.L184
.L164:
	ldr	r3, [sp, #0]
	tst	r3, #16
	beq	.L157
	ldr	r3, .L187+8
	mov	r6, #1
	ldr	r2, [r3, #0]
	str	r2, [sp, #4]
	str	r6, [r3, #0]
	ldr	r2, [sp, #4]
	tst	r2, #4
	bne	.L185
.L172:
	ldr	r3, [sp, #4]
	tst	r3, #2
	beq	.L157
	ldr	r5, .L187+12
	mov	r0, #0
	bl	toggleUART2ReceiveInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L157
.L179:
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
.L157:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L181:
	ldr	r5, .L187+16
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L187+20
	bl	clearTimerInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L159
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
	beq	.L162
.L182:
	ldr	r0, .L187+24
	bl	stopTimer(PLT)
	ldr	r0, .L187+24
	bl	clearTimerInterrupt(PLT)
	ldr	r1, .L187+28
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r3, #1
	ldr	r0, .L187+24
	mov	r1, #508
	ldr	r2, .L187+32
	bl	startTimer(PLT)
	ldr	r3, [sp, #0]
	tst	r3, #8
	beq	.L164
	b	.L186
.L180:
	ldr	r0, .L187+20
	bl	stopTimer(PLT)
	ldr	r0, .L187+20
	bl	clearTimerInterrupt(PLT)
	mov	r3, #1
	mov	r1, #508
	ldr	r2, .L187+36
	ldr	r0, .L187+20
	bl	startTimer(PLT)
	ldr	r0, .L187+40
	bl	clearTimerInterrupt(PLT)
	mov	r0, r5
	ldr	r5, .L187+16
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L187+20
	bl	clearTimerInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	bgt	.L179
	b	.L157
.L184:
	ldr	r5, .L187+44
	mov	r0, #0
	bl	toggleUART1ReceiveInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L164
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
	b	.L164
.L185:
	ldr	r5, .L187+48
	mov	r0, #0
	bl	toggleUART2SendInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L172
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
	b	.L172
.L183:
	ldr	r5, .L187+52
	mov	r0, #0
	bl	toggleUART1SendInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L166
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
	b	.L166
.L188:
	.align	2
.L187:
	.word	_GLOBAL_OFFSET_TABLE_-(.L178+8)
	.word	-2138308580
	.word	-2138243044
	.word	35136
	.word	35120
	.word	-2139029504
	.word	-2139029472
	.word	.LC1(GOTOFF)
	.word	5080
	.word	5085
	.word	-2139029376
	.word	35128
	.word	35132
	.word	35124
	.size	processInterrupt, .-processInterrupt
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"<Kernel>: Could not await TD<%d>, as TD<%d> waiting"
	.ascii	" on await_TIMER.\015\012\000"
	.align	2
.LC3:
	.ascii	"<Kernel>: Could not await TD<%d>, as TD<%d> waiting"
	.ascii	" on await_UART1SEND.\015\012\000"
	.align	2
.LC4:
	.ascii	"<Kernel>: Could not await TD<%d>, as TD<%d> waiting"
	.ascii	" on await_UART1RECEIVE.\015\012\000"
	.align	2
.LC5:
	.ascii	"<Kernel>: Could not await TD<%d>, as TD<%d> waiting"
	.ascii	" on await_UART2SEND.\015\012\000"
	.align	2
.LC6:
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
	ldr	sl, .L200
	ldr	r3, [r1, #4]
.L199:
	add	sl, pc, sl
	sub	sp, sp, #4
	mov	r5, r0
	mov	r6, r2
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L190
	.p2align 2
.L196:
	b	.L191
	b	.L192
	b	.L193
	b	.L194
	b	.L195
.L190:
	mvn	r3, #0
	str	r3, [r0, #4]
	mov	r0, #0
.L197:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L195:
	ldr	r4, .L200+4
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L200+8
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
	b	.L197
.L194:
	ldr	r4, .L200+12
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L200+16
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
	b	.L197
.L193:
	ldr	r4, .L200+20
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L200+24
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
	b	.L197
.L192:
	ldr	r4, .L200+28
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L200+32
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
	b	.L197
.L191:
	ldr	r4, .L200+36
	mov	r1, #1
	ldr	r0, [r2, r4]
	ldr	r3, [r5, #32]
	ldr	ip, [r2, r4]
	ldr	r2, .L200+40
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
	ldr	r0, .L200+44
	bl	clearTimerInterrupt(PLT)
	mov	r0, #1
	b	.L197
.L201:
	.align	2
.L200:
	.word	_GLOBAL_OFFSET_TABLE_-(.L199+8)
	.word	35136
	.word	.LC6(GOTOFF)
	.word	35132
	.word	.LC5(GOTOFF)
	.word	35128
	.word	.LC4(GOTOFF)
	.word	35124
	.word	.LC3(GOTOFF)
	.word	35120
	.word	.LC2(GOTOFF)
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
	beq	.L232
	ldr	r3, [r2, #0]
	sub	r3, r3, #1
	cmp	r3, #17
	addls	pc, pc, r3, asl #2
	b	.L205
	.p2align 2
.L223:
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
	b	.L216
	b	.L217
	b	.L218
	b	.L219
	b	.L205
	b	.L220
	b	.L221
	b	.L222
.L206:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_MyTid(PLT)
.L222:
	mov	r0, r1
	mov	r1, lr
	ldr	lr, [sp], #4
	b	kernel_IdlePercentage(PLT)
.L221:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_RequestIOServer(PLT)
.L220:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_RequestClockServer(PLT)
.L205:
	mov	r0, #0
	ldr	pc, [sp], #4
.L219:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_AwaitEvent(PLT)
.L218:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_RegisterAs(PLT)
.L217:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_WhoIs(PLT)
.L216:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_Reply(PLT)
.L215:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_Receive(PLT)
.L214:
	mov	r0, r1
	mov	r3, ip
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_Send(PLT)
.L213:
	ldr	r0, .L233
	ldr	r2, [r1, #32]
	ldr	r3, [lr, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [lr, r0]
	ldr	r0, .L233+4
	ldr	r2, [r1, #32]
	ldr	r3, [lr, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [lr, r0]
	ldr	r0, .L233+8
	ldr	r2, [r1, #32]
	ldr	r3, [lr, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [lr, r0]
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_Exit(PLT)
.L212:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_Pass(PLT)
.L211:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_CreateIOServer(PLT)
.L210:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_CreateClockServer(PLT)
.L209:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_CreateNameServer(PLT)
.L208:
	mov	r0, r1
	mov	r1, r2
	mov	r2, lr
	ldr	lr, [sp], #4
	b	kernel_Create(PLT)
.L207:
	mov	r0, r1
	ldr	lr, [sp], #4
	b	kernel_MyParentTid(PLT)
.L232:
	mov	r3, #1
	str	r3, [r1, #20]
	ldr	lr, [sp], #4
	b	processInterrupt(PLT)
.L234:
	.align	2
.L233:
	.word	35088
	.word	35096
	.word	35092
	.size	processRequest, .-processRequest
	.ident	"GCC: (GNU) 4.0.2"
