	.file	"kernelRequestCall.c"
	.text
	.align	2
	.global	kernel_MyTid
	.type	kernel_MyTid, %function
kernel_MyTid:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #68]
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
	ldr	r2, [r0, #72]
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
	mov	r2, #1
	mov	r3, #2
	str	r3, [r1, #0]
	str	r2, [r0, #4]
	mov	r0, r2
	@ lr needed for prologue
	bx	lr
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
	sub	r3, r3, #4
	str	r3, [r0, #4]
	add	r3, r3, #3
	str	r2, [r0, #80]
	str	r3, [r0, #84]
	mov	r0, #1
	@ lr needed for prologue
	add	sp, sp, #4
	bx	lr
	.size	kernel_Exit, .-kernel_Exit
	.align	2
	.global	kernel_Reply
	.type	kernel_Reply, %function
kernel_Reply:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	ip, [r1, #4]
	mov	r4, r0
	cmp	ip, #127
	mov	r5, r2
	bhi	.L12
	add	r3, ip, ip, asl #2
	add	r3, ip, r3, asl #1
	mov	r3, r3, asl #3
	add	r2, r3, r2
	ldr	r2, [r2, #480]
	cmp	r2, #3
	beq	.L12
	cmp	r2, #0
	bne	.L15
.L12:
	mvn	r3, #1
	str	r3, [r4, #4]
.L16:
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L15:
	add	r2, r5, #396
	add	r6, r2, r3
	ldr	r3, [r6, #84]
	ldr	r7, [r1, #12]
	sub	r3, r3, #5
	cmp	r3, #1
	mvnhi	r3, #2
	strhi	r3, [r0, #4]
	bhi	.L16
	ldr	r2, [r6, #32]
	ldr	r1, [r1, #8]
	cmp	r7, r2
	movlt	r2, r7
	ldr	r0, [r6, #28]
	bl	pkmemcpy(PLT)
	ldr	r2, [r6, #32]
	mov	r0, r5
	cmp	r7, r2
	ldrgt	r3, [r6, #28]
	movle	r3, #0
	addgt	r3, r3, r2
	movgt	r2, #0
	strgtb	r2, [r3, #-1]
	mvngt	r1, #0
	strle	r3, [r4, #4]
	mov	r3, #1
	strgt	r1, [r4, #4]
	strle	r7, [r6, #4]
	strgt	r1, [r6, #4]
	str	r3, [r6, #84]
	mov	r1, r6
	bl	kernel_queuePush(PLT)
	b	.L16
	.size	kernel_Reply, .-kernel_Reply
	.align	2
	.global	processMail
	.type	processMail, %function
processMail:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	add	r3, r0, r0, asl #2
	add	r0, r0, r3, asl #1
	mov	r5, r1
	add	r1, r1, #396
	add	r4, r1, r0, asl #3
	ldr	r3, [r4, #44]
	mov	ip, #0
	mov	r7, ip
	cmp	r3, r7
	sub	sp, sp, #4
	moveq	r3, #4
	add	ip, sp, #4
	mov	r0, r4
	mov	r6, r2
	streq	r3, [r4, #84]
	bne	.L33
.L27:
	mov	r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L33:
	str	r7, [ip, #-4]!
	mov	r1, sp
	bl	inbox_Pop(PLT)
	ldr	ip, [sp, #0]
	ldr	r1, [r4, #40]
	ldr	r2, [ip, #24]
	mov	r3, #6
	cmp	r2, r1
	movge	r2, r1
	str	r3, [ip, #84]
	ldr	r1, [ip, #20]
	ldr	r0, [r4, #36]
	bl	pkmemcpy(PLT)
	ldr	ip, [sp, #0]
	ldr	r2, [r4, #40]
	ldr	r3, [ip, #24]
	mov	r0, r5
	cmp	r3, r2
	ldrgt	r3, [r4, #36]
	strle	r3, [r4, #4]
	addgt	r3, r3, r2
	strgtb	r7, [r3, #-1]
	ldrgt	ip, [sp, #0]
	mvngt	r3, #0
	ldr	ip, [ip, #68]
	ldr	r2, [r4, #16]
	strgt	r3, [r4, #4]
	mov	r3, #1
	cmp	r6, #0
	mov	r1, r4
	str	r3, [r4, #84]
	str	ip, [r2, #0]
	beq	.L27
	bl	kernel_queuePush(PLT)
	b	.L27
	.size	processMail, .-processMail
	.align	2
	.global	kernel_Receive
	.type	kernel_Receive, %function
kernel_Receive:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [r1, #4]
	ldr	r3, [r1, #8]
	ldr	ip, [r1, #12]
	str	r3, [r0, #36]
	str	ip, [r0, #40]
	str	lr, [r0, #16]
	ldr	r0, [r0, #68]
	mov	r1, r2
	mov	r2, #0
	ldr	lr, [sp], #4
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
	mov	ip, r1
	add	r3, r4, r4, asl #2
	add	r3, r4, r3, asl #1
	mov	r3, r3, asl #3
	cmp	r4, #127
	mov	r5, r0
	mov	r6, r2
	add	r8, r3, r2
	ldr	r7, [r1, #12]
	ldr	lr, [r1, #20]
	bhi	.L37
	ldr	r2, [r8, #480]
	cmp	r2, #3
	beq	.L37
	cmp	r2, #0
	beq	.L37
	add	r0, r6, #396
	add	r0, r0, r3
	ldr	r3, [r5, #68]
	mov	r1, r5
	cmp	r4, r3
	mvneq	r3, #2
	streq	r3, [r5, #4]
	beq	.L41
	ldr	r2, [ip, #16]
	ldr	r3, [ip, #8]
	str	r2, [r5, #28]
	str	r3, [r5, #20]
	str	r7, [r5, #24]
	str	lr, [r5, #32]
	bl	inbox_Push(PLT)
	ldr	r3, [r8, #480]
	mov	r0, r4
	cmp	r3, #4
	movne	r3, #5
	mov	r1, r6
	mov	r2, #1
	strne	r3, [r5, #84]
	bne	.L41
	bl	processMail(PLT)
	b	.L41
.L37:
	mvn	r3, #1
	str	r3, [r5, #4]
.L41:
	mov	r0, #1
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.size	kernel_Send, .-kernel_Send
	.align	2
	.global	kernel_RegisterAs
	.type	kernel_RegisterAs, %function
kernel_RegisterAs:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	ip, .L55
	mov	lr, r0
	ldr	ip, [r2, ip]
	mov	r4, r1
	add	r3, ip, ip, asl #2
	add	r3, ip, r3, asl #1
	cmn	ip, #1
	add	r3, r2, r3, asl #3
	beq	.L48
	ldr	r3, [r3, #480]
	cmp	r3, #3
	beq	.L48
	cmp	r3, #0
	bne	.L54
.L48:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [lr, #4]
	ldmfd	sp!, {r4, pc}
.L54:
	str	ip, [r1, #4]
	ldmfd	sp!, {r4, lr}
	b	kernel_Send(PLT)
.L56:
	.align	2
.L55:
	.word	11660
	.size	kernel_RegisterAs, .-kernel_RegisterAs
	.align	2
	.global	kernel_WhoIs
	.type	kernel_WhoIs, %function
kernel_WhoIs:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	ip, .L65
	mov	lr, r0
	ldr	ip, [r2, ip]
	mov	r4, r1
	add	r3, ip, ip, asl #2
	add	r3, ip, r3, asl #1
	cmn	ip, #1
	add	r3, r2, r3, asl #3
	beq	.L58
	ldr	r3, [r3, #480]
	cmp	r3, #3
	beq	.L58
	cmp	r3, #0
	bne	.L64
.L58:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [lr, #4]
	ldmfd	sp!, {r4, pc}
.L64:
	str	ip, [r1, #4]
	ldmfd	sp!, {r4, lr}
	b	kernel_Send(PLT)
.L66:
	.align	2
.L65:
	.word	11660
	.size	kernel_WhoIs, .-kernel_WhoIs
	.align	2
	.global	kernel_RequestIOServer
	.type	kernel_RequestIOServer, %function
kernel_RequestIOServer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	ip, .L89
	mov	lr, r2
	ldr	r3, [r2, ip]
	mov	r5, r0
	cmn	r3, #1
	mov	r4, r1
	beq	.L68
	ldr	ip, [r2, ip]
	ldr	r3, [r1, #4]
	cmp	ip, r3
	beq	.L88
.L68:
	ldr	r2, .L89+4
	ldr	r3, [lr, r2]
	cmn	r3, #1
	beq	.L71
	ldr	r2, [lr, r2]
	ldr	r3, [r4, #4]
	cmp	r2, r3
	beq	.L87
.L71:
	ldr	r2, .L89+8
	ldr	r3, [lr, r2]
	cmn	r3, #1
	beq	.L74
	ldr	r2, [lr, r2]
	ldr	r3, [r4, #4]
	cmp	r2, r3
	beq	.L87
.L74:
	ldr	r2, .L89+12
	ldr	r3, [lr, r2]
	cmn	r3, #1
	beq	.L77
	ldr	r2, [lr, r2]
	ldr	r3, [r4, #4]
	cmp	r2, r3
	beq	.L87
.L77:
	ldr	r2, .L89+16
	ldr	r3, [lr, r2]
	cmn	r3, #1
	beq	.L80
	ldr	r2, [lr, r2]
	ldr	r3, [r4, #4]
	cmp	r2, r3
	beq	.L87
.L80:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [r5, #4]
	ldmfd	sp!, {r4, r5, pc}
.L87:
	mov	r0, r5
	mov	r1, r4
	mov	r2, lr
.L88:
	ldmfd	sp!, {r4, r5, lr}
	b	kernel_Send(PLT)
.L90:
	.align	2
.L89:
	.word	11684
	.word	11668
	.word	11672
	.word	11676
	.word	11680
	.size	kernel_RequestIOServer, .-kernel_RequestIOServer
	.align	2
	.global	kernel_RequestClockServer
	.type	kernel_RequestClockServer, %function
kernel_RequestClockServer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L98
	mov	lr, r0
	ldr	r3, [r2, r4]
	cmn	r3, #1
	beq	.L92
	ldr	ip, [r2, r4]
	ldr	r3, [r1, #4]
	cmp	ip, r3
	beq	.L97
.L92:
	mvn	r3, #0
	mov	r0, #1
	str	r3, [lr, #4]
	ldmfd	sp!, {r4, pc}
.L97:
	ldmfd	sp!, {r4, lr}
	b	kernel_Send(PLT)
.L99:
	.align	2
.L98:
	.word	11664
	.size	kernel_RequestClockServer, .-kernel_RequestClockServer
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
	bls	.L107
.L103:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L107:
	mov	r3, #0
	str	r3, [ip, #-4]!
	mov	r1, ip
	bl	getNextTID(PLT)
	cmp	r0, #0
	mov	r3, r6
	mvnne	r3, #1
	mov	r0, r5
	strne	r3, [r4, #4]
	bne	.L103
	ldr	r1, [sp, #4]
	ldr	ip, [r7, #8]
	str	r1, [r4, #4]
	ldr	r2, [r4, #68]
	str	ip, [sp, #0]
	bl	setTask(PLT)
	mov	r1, r0
	mov	r0, r5
	bl	kernel_queuePush(PLT)
	b	.L103
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
	bhi	.L111
	cmp	r4, #0
	beq	.L158
	cmp	r4, #1
	beq	.L159
	cmp	r4, #2
	beq	.L160
	cmp	r4, #3
	beq	.L161
	cmp	r4, #4
	beq	.L162
	mvnhi	r3, #3
	strhi	r3, [r0, #4]
	bhi	.L111
.L132:
	mov	r3, #0
	add	r1, sp, #8
	str	r3, [r1, #-4]!
	mov	r0, r5
	bl	getNextTID(PLT)
	cmp	r0, #0
	mvnne	r3, #1
	strne	r3, [r7, #4]
	bne	.L111
	ldr	r1, [sp, #4]
	ldr	ip, [r6, #8]
	str	r1, [r7, #4]
	ldr	r2, [r7, #68]
	mov	r3, r8
	mov	r0, r5
	str	ip, [sp, #0]
	bl	setTask(PLT)
	mov	r1, r0
	mov	r0, r5
	bl	kernel_queuePush(PLT)
	cmp	r4, #4
	addls	pc, pc, r4, asl #2
	b	.L111
	.p2align 2
.L141:
	b	.L136
	b	.L137
	b	.L138
	b	.L139
	b	.L140
.L140:
	ldr	r2, [sp, #4]
	ldr	r3, .L163
	str	r2, [r5, r3]
.L111:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L158:
	ldr	r2, .L163+4
	ldr	r3, [r5, r2]
	cmn	r3, #1
	beq	.L132
.L157:
	ldr	r3, [r5, r2]
	add	r2, r3, r3, asl #2
	add	r3, r3, r2, asl #1
	add	r3, r5, r3, asl #3
	ldr	r2, [r3, #480]
	cmp	r2, #3
	mvnne	r3, #2
	strne	r3, [r7, #4]
	bne	.L111
	b	.L132
.L159:
	ldr	r2, .L163+8
	ldr	r3, [r5, r2]
	cmn	r3, #1
	bne	.L157
	b	.L132
.L160:
	ldr	r2, .L163+12
	ldr	r3, [r5, r2]
	cmn	r3, #1
	bne	.L157
	b	.L132
.L161:
	ldr	r2, .L163+16
	ldr	r3, [r5, r2]
	cmn	r3, #1
	bne	.L157
	b	.L132
.L162:
	ldr	r2, .L163
	ldr	r3, [r5, r2]
	cmn	r3, #1
	bne	.L157
	b	.L132
.L136:
	ldr	r2, [sp, #4]
	ldr	r3, .L163+4
	str	r2, [r5, r3]
	b	.L111
.L137:
	ldr	r2, [sp, #4]
	ldr	r3, .L163+8
	str	r2, [r5, r3]
	b	.L111
.L138:
	ldr	r2, [sp, #4]
	ldr	r3, .L163+12
	str	r2, [r5, r3]
	b	.L111
.L139:
	ldr	r2, [sp, #4]
	ldr	r3, .L163+16
	str	r2, [r5, r3]
	b	.L111
.L164:
	.align	2
.L163:
	.word	11680
	.word	11684
	.word	11668
	.word	11672
	.word	11676
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
	ldr	ip, .L175
	mov	r7, r1
	mov	r4, r2
	mov	r5, r0
	strhi	r3, [r0, #4]
	bhi	.L168
	ldr	r3, [r2, ip]
	add	r1, sp, #8
	cmn	r3, #1
	mov	r0, r2
	beq	.L169
	ldr	r3, [r2, ip]
	add	r2, r3, r3, asl #2
	add	r3, r3, r2, asl #1
	add	r3, r4, r3, asl #3
	ldr	r2, [r3, #480]
	cmp	r2, #3
	mvnne	r3, #2
	strne	r3, [r5, #4]
	beq	.L169
.L168:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L169:
	mov	r3, #0
	str	r3, [r1, #-4]!
	bl	getNextTID(PLT)
	cmp	r0, #0
	mov	r3, r6
	mvnne	r3, #1
	mov	r0, r4
	strne	r3, [r5, #4]
	bne	.L168
	ldr	r1, [sp, #4]
	ldr	ip, [r7, #8]
	ldr	r2, [r5, #68]
	str	r1, [r5, #4]
	str	ip, [sp, #0]
	bl	setTask(PLT)
	mov	r1, r0
	mov	r0, r4
	bl	kernel_queuePush(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, .L175
	str	r2, [r4, r3]
	b	.L168
.L176:
	.align	2
.L175:
	.word	11664
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
	ldr	ip, .L187
	mov	r7, r1
	mov	r4, r2
	mov	r5, r0
	strhi	r3, [r0, #4]
	bhi	.L180
	ldr	r3, [r2, ip]
	add	r1, sp, #8
	cmn	r3, #1
	mov	r0, r2
	beq	.L181
	ldr	r3, [r2, ip]
	add	r2, r3, r3, asl #2
	add	r3, r3, r2, asl #1
	add	r3, r4, r3, asl #3
	ldr	r2, [r3, #480]
	cmp	r2, #3
	mvnne	r3, #2
	strne	r3, [r5, #4]
	beq	.L181
.L180:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L181:
	mov	r3, #0
	str	r3, [r1, #-4]!
	bl	getNextTID(PLT)
	cmp	r0, #0
	mov	r3, r6
	mvnne	r3, #1
	mov	r0, r4
	strne	r3, [r5, #4]
	bne	.L180
	ldr	r1, [sp, #4]
	ldr	ip, [r7, #8]
	ldr	r2, [r5, #68]
	str	r1, [r5, #4]
	str	ip, [sp, #0]
	bl	setTask(PLT)
	mov	r1, r0
	mov	r0, r4
	bl	kernel_queuePush(PLT)
	ldr	r2, [sp, #4]
	ldr	r3, .L187
	str	r2, [r4, r3]
	b	.L180
.L188:
	.align	2
.L187:
	.word	11660
	.size	kernel_CreateNameServer, .-kernel_CreateNameServer
	.global	__udivsi3
	.align	2
	.global	kernel_IdlePercentage
	.type	kernel_IdlePercentage, %function
kernel_IdlePercentage:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r3, .L191
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
.L192:
	.align	2
.L191:
	.word	11704
	.size	kernel_IdlePercentage, .-kernel_IdlePercentage
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
	ldr	sl, .L235
	sub	sp, sp, #8
.L226:
	add	sl, pc, sl
	mov	r5, #0
	mov	r4, r0
	str	r5, [sp, #4]
	bl	checkInterrupts(PLT)
	str	r0, [sp, #0]
	ldr	r3, [sp, #0]
	ands	r0, r3, #1
	bne	.L228
	ldr	r3, [sp, #0]
	tst	r3, #2
	bne	.L229
.L198:
	ldr	r3, [sp, #0]
	tst	r3, #4
	bne	.L230
.L201:
	ldr	r3, [sp, #0]
	tst	r3, #8
	bne	.L231
.L203:
	ldr	r3, [sp, #0]
	tst	r3, #16
	beq	.L196
.L234:
	ldr	r3, .L235+4
	mov	r6, #1
	ldr	r2, [r3, #0]
	str	r2, [sp, #4]
	str	r6, [r3, #0]
	ldr	r2, [sp, #4]
	tst	r2, #4
	bne	.L232
.L220:
	ldr	r3, [sp, #4]
	tst	r3, #2
	beq	.L196
	ldr	r5, .L235+8
	mov	r0, #0
	bl	toggleUART2ReceiveInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L196
.L227:
	ldr	r3, [r4, r5]
	ldr	r1, [r4, r5]
	add	r2, r3, r3, asl #2
	add	r3, r3, r2, asl #1
	add	r0, r1, r1, asl #2
	add	r3, r4, r3, asl #3
	add	r1, r1, r0, asl #1
	mov	r2, #1
	add	r0, r4, #396
	str	r2, [r3, #480]
	add	r1, r0, r1, asl #3
	mov	r0, r4
	bl	kernel_queuePush(PLT)
	mvn	r3, #0
	str	r3, [r4, r5]
.L196:
	mov	r0, #1
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L231:
	ldr	r1, .L235+12
	ldr	r3, [r1, #0]
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	tst	r2, #1
	beq	.L205
	ldr	r3, .L235+16
	mov	r0, #1
	ldr	r2, [r3, #0]
	str	r0, [r1, #0]
	tst	r2, #1
	beq	.L205
	ldr	r3, .L235+20
	ldr	ip, .L235+24
	str	r0, [r4, r3]
	ldr	r2, [r4, ip]
	cmp	r2, #0
	bne	.L233
.L205:
	ldr	r3, [sp, #4]
	tst	r3, #4
	beq	.L209
	ldr	r3, .L235+20
	ldr	r2, [r4, r3]
	cmp	r2, #0
	ldreq	r3, .L235+24
	moveq	r2, #1
	streq	r2, [r4, r3]
	beq	.L216
	mov	r5, #11712
	ldr	r3, [r4, r5]
	cmn	r3, #1
	movle	r3, #1
	ble	.L215
	ldr	r3, [r4, r5]
	ldr	r1, [r4, r5]
	add	r2, r3, r3, asl #2
	add	r3, r3, r2, asl #1
	add	r0, r1, r1, asl #2
	add	r3, r4, r3, asl #3
	add	r1, r1, r0, asl #1
	mov	r2, #1
	add	r0, r4, #396
	str	r2, [r3, #480]
	add	r1, r0, r1, asl #3
	mov	r0, r4
	bl	kernel_queuePush(PLT)
	mvn	r3, #0
	str	r3, [r4, r5]
	add	r3, r3, #1
.L215:
	cmp	r3, #0
	ldr	r3, .L235+20
	mov	r2, #0
	str	r2, [r4, r3]
	beq	.L209
.L216:
	ldr	r2, .L235+28
	ldr	r3, [r2, #0]
	bic	r3, r3, #32
	str	r3, [r2, #0]
.L209:
	ldr	r3, [sp, #4]
	tst	r3, #2
	beq	.L203
	ldr	r5, .L235+32
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L203
	ldr	r0, [r4, r5]
	ldr	r3, [r4, r5]
	ldr	r1, .L235+36
	add	r2, r3, r3, asl #2
	add	r3, r3, r2, asl #1
	ldr	r2, [r1, #0]
	add	r3, r4, r3, asl #3
	str	r2, [r3, #400]
	ldr	r1, [r4, r5]
	add	r3, r0, r0, asl #2
	add	r0, r0, r3, asl #1
	add	r2, r1, r1, asl #2
	mov	r3, #1
	add	r1, r1, r2, asl #1
	add	r0, r4, r0, asl #3
	add	r2, r4, #396
	str	r3, [r0, #480]
	add	r1, r2, r1, asl #3
	mov	r0, r4
	bl	kernel_queuePush(PLT)
	mvn	r3, #0
	str	r3, [r4, r5]
	ldr	r3, [sp, #0]
	tst	r3, #16
	bne	.L234
	b	.L196
.L229:
	ldr	r5, .L235+40
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L235+44
	bl	clearTimerInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L198
	ldr	r3, [r4, r5]
	ldr	r1, [r4, r5]
	add	r2, r3, r3, asl #2
	add	r3, r3, r2, asl #1
	add	r0, r1, r1, asl #2
	add	r3, r4, r3, asl #3
	add	r1, r1, r0, asl #1
	mov	r2, #1
	add	r0, r4, #396
	str	r2, [r3, #480]
	add	r1, r0, r1, asl #3
	mov	r0, r4
	bl	kernel_queuePush(PLT)
	mvn	r3, #0
	str	r3, [r4, r5]
	ldr	r3, [sp, #0]
	tst	r3, #4
	beq	.L201
.L230:
	ldr	r0, .L235+48
	bl	stopTimer(PLT)
	ldr	r0, .L235+48
	bl	clearTimerInterrupt(PLT)
	ldr	r1, .L235+52
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r3, #1
	ldr	r0, .L235+48
	mov	r1, #508
	ldr	r2, .L235+56
	bl	startTimer(PLT)
	ldr	r3, [sp, #0]
	tst	r3, #8
	beq	.L203
	b	.L231
.L228:
	ldr	r0, .L235+44
	bl	stopTimer(PLT)
	ldr	r0, .L235+44
	bl	clearTimerInterrupt(PLT)
	mov	r3, #1
	mov	r1, #508
	ldr	r2, .L235+60
	ldr	r0, .L235+44
	bl	startTimer(PLT)
	ldr	r0, .L235+64
	bl	clearTimerInterrupt(PLT)
	mov	r0, r5
	ldr	r5, .L235+40
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L235+44
	bl	clearTimerInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	bgt	.L227
	b	.L196
.L232:
	ldr	r5, .L235+68
	mov	r0, #0
	bl	toggleUART2SendInterrupt(PLT)
	ldr	r3, [r4, r5]
	cmn	r3, #1
	ble	.L220
	ldr	r3, [r4, r5]
	ldr	r1, [r4, r5]
	add	r2, r3, r3, asl #2
	add	r3, r3, r2, asl #1
	add	r0, r1, r1, asl #2
	add	r3, r4, r3, asl #3
	add	r1, r1, r0, asl #1
	add	r2, r4, #396
	str	r6, [r3, #480]
	add	r1, r2, r1, asl #3
	mov	r0, r4
	bl	kernel_queuePush(PLT)
	mvn	r3, #0
	str	r3, [r4, r5]
	b	.L220
.L233:
	ldr	r3, .L235+28
	mov	r1, #0
	ldr	r2, [r3, #0]
	orr	r2, r2, #32
	str	r2, [r3, #0]
	str	r1, [r4, ip]
	b	.L205
.L236:
	.align	2
.L235:
	.word	_GLOBAL_OFFSET_TABLE_-(.L226+8)
	.word	-2138243044
	.word	11724
	.word	-2138308580
	.word	-2138308584
	.word	11732
	.word	11728
	.word	-2138308588
	.word	11716
	.word	-2138308608
	.word	11708
	.word	-2139029504
	.word	-2139029472
	.word	.LC0(GOTOFF)
	.word	5080
	.word	5085
	.word	-2139029376
	.word	11720
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
	ldr	sl, .L248
	ldr	r3, [r1, #4]
.L247:
	add	sl, pc, sl
	sub	sp, sp, #4
	mov	r6, r0
	mov	r5, r2
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L238
	.p2align 2
.L244:
	b	.L239
	b	.L240
	b	.L241
	b	.L242
	b	.L243
.L238:
	mvn	r3, #0
	str	r3, [r0, #4]
	mov	r0, #0
.L245:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L243:
	ldr	r4, .L248+4
	ldr	r3, [r0, #68]
	ldr	r0, [r2, r4]
	ldr	ip, [r2, r4]
	ldr	r2, .L248+8
	mov	r1, #1
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	add	r2, sl, r2
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	ldr	r3, [r6, #68]
	mov	r2, #7
	str	r3, [r5, r4]
	str	r2, [r6, #84]
	mov	r0, #1
	bl	toggleUART2VICInterrupt(PLT)
	mov	r0, #1
	bl	toggleUART2ReceiveInterrupt(PLT)
	mov	r0, #1
	b	.L245
.L242:
	ldr	r4, .L248+12
	ldr	r3, [r0, #68]
	ldr	r0, [r2, r4]
	ldr	ip, [r2, r4]
	ldr	r2, .L248+16
	mov	r1, #1
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	add	r2, sl, r2
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	ldr	r3, [r6, #68]
	mov	r2, #7
	str	r3, [r5, r4]
	str	r2, [r6, #84]
	mov	r0, #1
	bl	toggleUART2VICInterrupt(PLT)
	mov	r0, #1
	bl	toggleUART2SendInterrupt(PLT)
	mov	r0, #1
	b	.L245
.L241:
	ldr	r4, .L248+20
	ldr	r3, [r0, #68]
	ldr	r0, [r2, r4]
	ldr	ip, [r2, r4]
	ldr	r2, .L248+24
	mov	r1, #1
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	add	r2, sl, r2
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	ldr	r3, [r6, #68]
	mov	r2, #7
	str	r3, [r5, r4]
	str	r2, [r6, #84]
	mov	r0, #1
	bl	toggleUART1VICInterrupt(PLT)
	mov	r0, #1
	bl	toggleUART1ReceiveInterrupt(PLT)
	mov	r0, #1
	b	.L245
.L240:
	mov	r4, #11712
	ldr	r0, [r2, r4]
	ldr	ip, [r2, r4]
	ldr	r2, .L248+28
	mov	r1, #1
	ldr	r3, [r6, #68]
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	add	r2, sl, r2
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	ldr	r3, [r6, #68]
	mov	r2, #7
	str	r3, [r5, r4]
	str	r2, [r6, #84]
	mov	r0, #1
	bl	toggleUART1VICInterrupt(PLT)
	mov	r0, #1
	bl	toggleUART1SendInterrupt(PLT)
	ldr	r3, .L248+32
	ldr	r2, .L248+36
	mov	r1, #0
	mov	r0, #1
	str	r1, [r5, r3]
	str	r1, [r5, r2]
	b	.L245
.L239:
	ldr	r4, .L248+40
	ldr	r3, [r0, #68]
	ldr	r0, [r2, r4]
	ldr	ip, [r2, r4]
	ldr	r2, .L248+44
	mov	r1, #1
	cmn	r0, #1
	movne	r0, #0
	moveq	r0, #1
	add	r2, sl, r2
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	ldr	r3, [r6, #68]
	mov	r2, #7
	str	r3, [r5, r4]
	str	r2, [r6, #84]
	mov	r0, #1
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L248+48
	bl	clearTimerInterrupt(PLT)
	mov	r0, #1
	b	.L245
.L249:
	.align	2
.L248:
	.word	_GLOBAL_OFFSET_TABLE_-(.L247+8)
	.word	11724
	.word	.LC5(GOTOFF)
	.word	11720
	.word	.LC4(GOTOFF)
	.word	11716
	.word	.LC3(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	11732
	.word	11728
	.word	11708
	.word	.LC1(GOTOFF)
	.word	-2139029504
	.size	kernel_AwaitEvent, .-kernel_AwaitEvent
	.align	2
	.global	processRequest
	.type	processRequest, %function
processRequest:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	@ lr needed for prologue
	mov	ip, r0
	beq	.L289
	ldr	r3, [r2, #0]
	sub	r3, r3, #1
	cmp	r3, #18
	addls	pc, pc, r3, asl #2
	b	.L253
	.p2align 2
.L272:
	b	.L254
	b	.L255
	b	.L256
	b	.L257
	b	.L258
	b	.L259
	b	.L260
	b	.L261
	b	.L262
	b	.L263
	b	.L264
	b	.L265
	b	.L266
	b	.L267
	b	.L253
	b	.L268
	b	.L269
	b	.L270
	b	.L271
.L289:
	mov	r3, #1
	str	r3, [r1, #56]
	b	processInterrupt(PLT)
.L254:
	mov	r0, r1
	mov	r1, r2
	mov	r2, ip
	b	kernel_Send(PLT)
.L255:
	mov	r0, r1
	mov	r1, r2
	mov	r2, ip
	b	kernel_Receive(PLT)
.L256:
	mov	r0, r1
	mov	r1, r2
	mov	r2, ip
	b	kernel_Reply(PLT)
.L257:
	mov	r0, r1
	b	kernel_MyTid(PLT)
.L258:
	mov	r0, r1
	b	kernel_MyParentTid(PLT)
.L259:
	mov	r0, r1
	mov	r1, r2
	mov	r2, ip
	b	kernel_Create(PLT)
.L260:
	mov	r0, r1
	mov	r1, r2
	mov	r2, ip
	b	kernel_CreateNameServer(PLT)
.L261:
	mov	r0, r1
	mov	r1, r2
	mov	r2, ip
	b	kernel_CreateClockServer(PLT)
.L262:
	mov	r0, r1
	mov	r1, r2
	mov	r2, ip
	b	kernel_CreateIOServer(PLT)
.L263:
	mov	r0, r1
	b	kernel_Pass(PLT)
.L264:
	ldr	r0, .L290
	ldr	r2, [r1, #68]
	ldr	r3, [ip, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [ip, r0]
	ldr	r0, .L290+4
	ldreq	r2, [r1, #68]
	ldr	r3, [ip, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [ip, r0]
	ldr	r0, .L290+8
	ldreq	r2, [r1, #68]
	ldr	r3, [ip, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [ip, r0]
	ldr	r0, .L290+12
	ldreq	r2, [r1, #68]
	ldr	r3, [ip, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [ip, r0]
	ldr	r0, .L290+16
	ldreq	r2, [r1, #68]
	ldr	r3, [ip, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [ip, r0]
	ldr	r0, .L290+20
	ldreq	r2, [r1, #68]
	ldr	r3, [ip, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [ip, r0]
	ldr	r0, .L290+24
	ldreq	r2, [r1, #68]
	ldr	r3, [ip, r0]
	cmp	r2, r3
	mvneq	r3, #0
	streq	r3, [ip, r0]
	mov	r0, r1
	b	kernel_Exit(PLT)
.L265:
	mov	r0, r1
	mov	r1, r2
	mov	r2, ip
	b	kernel_WhoIs(PLT)
.L266:
	mov	r0, r1
	mov	r1, r2
	mov	r2, ip
	b	kernel_RegisterAs(PLT)
.L267:
	mov	r0, r1
	mov	r1, r2
	mov	r2, ip
	b	kernel_AwaitEvent(PLT)
.L253:
	mov	r0, #0
	bx	lr
.L268:
	mov	r0, r1
	mov	r1, r2
	mov	r2, ip
	b	kernel_RequestClockServer(PLT)
.L269:
	mov	r0, r1
	mov	r1, r2
	mov	r2, ip
	b	kernel_RequestIOServer(PLT)
.L270:
	mov	r0, r1
	mov	r1, ip
	b	kernel_IdlePercentage(PLT)
.L271:
	mov	r0, r1
	mov	r1, ip
	b	kernel_Quit(PLT)
.L291:
	.align	2
.L290:
	.word	11660
	.word	11684
	.word	11668
	.word	11676
	.word	11672
	.word	11680
	.word	11664
	.size	processRequest, .-processRequest
	.ident	"GCC: (GNU) 4.0.2"
