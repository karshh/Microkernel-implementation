	.file	"kernelRequestCall.c"
	.text
	.align	2
	.global	processRequest
	.type	processRequest, %function
processRequest:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	sub	r3, r3, #1
	cmp	r3, #7
	addls	pc, pc, r3, asl #2
	b	.L2
	.p2align 2
.L11:
	b	.L3
	b	.L4
	b	.L5
	b	.L6
	b	.L7
	b	.L8
	b	.L9
	b	.L10
.L3:
	ldr	r0, [fp, #-20]
	bl	kernel_MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L12
.L4:
	ldr	r0, [fp, #-20]
	bl	kernel_MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L12
.L5:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	bl	kernel_Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L12
.L6:
	ldr	r0, [fp, #-20]
	bl	kernel_Pass(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L12
.L7:
	ldr	r0, [fp, #-20]
	bl	kernel_Exit(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L12
.L8:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L12
.L9:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_Receive(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L12
.L10:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_Reply(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L12
.L2:
	mov	r3, #0
	str	r3, [fp, #-32]
.L12:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	processRequest, .-processRequest
	.align	2
	.global	kernel_MyTid
	.type	kernel_MyTid, %function
kernel_MyTid:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	kernel_MyTid, .-kernel_MyTid
	.align	2
	.global	kernel_MyParentTid
	.type	kernel_MyParentTid, %function
kernel_MyParentTid:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	kernel_MyParentTid, .-kernel_MyParentTid
	.align	2
	.global	kernel_Pass
	.type	kernel_Pass, %function
kernel_Pass:
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
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	kernel_Pass, .-kernel_Pass
	.align	2
	.global	kernel_Exit
	.type	kernel_Exit, %function
kernel_Exit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	mov	r3, #4
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #28]
	ldr	r2, [fp, #-20]
	mov	r3, #3
	str	r3, [r2, #32]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #4]
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_Exit, .-kernel_Exit
	.align	2
	.global	kernel_Create
	.type	kernel_Create, %function
kernel_Create:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	blt	.L23
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	ble	.L25
.L23:
	ldr	r2, [fp, #-40]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L26
.L25:
	mov	r3, #0
	str	r3, [fp, #-36]
	sub	r3, fp, #36
	ldr	r0, [fp, #-48]
	mov	r1, r3
	bl	getNextTID(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L27
	ldr	r2, [fp, #-40]
	mvn	r3, #1
	str	r3, [r2, #4]
	b	.L26
.L27:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-48]
	mov	r1, r2
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-32]
	bl	setTask(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-48]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
.L26:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_Create, .-kernel_Create
	.align	2
	.global	kernel_Send
	.type	kernel_Send, %function
kernel_Send:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r3, #127
	bgt	.L31
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	blt	.L31
	ldr	r2, [fp, #-28]
	ldr	r1, [fp, #-40]
	mov	r0, #32
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #6
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L31
	ldr	r2, [fp, #-28]
	ldr	r1, [fp, #-40]
	mov	r0, #32
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #6
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L35
.L31:
	ldr	r2, [fp, #-32]
	mvn	r3, #1
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L36
.L35:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	beq	.L37
	ldr	r3, [fp, #-24]
	cmp	r3, #128
	bgt	.L37
	ldr	r3, [fp, #-20]
	cmp	r3, #128
	ble	.L40
.L37:
	ldr	r2, [fp, #-32]
	mvn	r3, #2
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L36
.L40:
	ldr	r2, [fp, #-44]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L41
.L42:
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-44]
	mov	r2, #4
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L41:
	ldr	r3, [fp, #-44]
	ldr	r2, [r3, #136]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bgt	.L42
	ldr	r2, [fp, #-44]
	mov	r3, #0
	str	r3, [r2, #136]
	ldr	r2, [fp, #-44]
	mov	r3, #0
	str	r3, [r2, #140]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-44]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #140]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #136]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L44
.L45:
	ldr	r0, [fp, #-16]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-44]
	mov	r2, #4
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, r1
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L44:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L45
	ldr	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [r2, #1204]
	ldr	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [r2, #1208]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #16]
	mov	r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #1204]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #1208]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #6
	add	r3, r1, r3
	mov	r0, r3
	ldr	r1, [fp, #-44]
	bl	putMail(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L47
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L36
.L47:
	ldr	r2, [fp, #-28]
	ldr	r1, [fp, #-40]
	mov	r0, #32
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #6
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #4
	bne	.L49
	ldr	r2, [fp, #-32]
	mov	r3, #5
	str	r3, [r2, #32]
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-44]
	mov	r3, #1
	bl	processMail(PLT)
	b	.L51
.L49:
	ldr	r2, [fp, #-32]
	mov	r3, #6
	str	r3, [r2, #32]
.L51:
	mov	r3, #1
	str	r3, [fp, #-48]
.L36:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_Send, .-kernel_Send
	.section	.rodata
	.align	2
.LC0:
	.ascii	"FUCK THIS SHIT.\000"
	.text
	.align	2
	.global	kernel_Receive
	.type	kernel_Receive, %function
kernel_Receive:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L56
.L55:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #1204]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #1208]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #1212]
	mov	r0, #0
	mov	r1, #1
	ldr	r3, .L56+4
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #16]
	mov	r0, r3
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-32]
	mov	r3, #0
	bl	processMail(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L57:
	.align	2
.L56:
	.word	_GLOBAL_OFFSET_TABLE_-(.L55+8)
	.word	.LC0(GOTOFF)
	.size	kernel_Receive, .-kernel_Receive
	.align	2
	.global	kernel_Reply
	.type	kernel_Reply, %function
kernel_Reply:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #6
	add	r3, r1, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #32]
	cmp	r3, #5
	beq	.L59
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #32]
	cmp	r3, #6
	beq	.L59
	ldr	r2, [fp, #-32]
	mvn	r3, #2
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L62
.L59:
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L63
.L64:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1204]
	ldr	r3, [fp, #-28]
	add	r1, r2, r3
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r1, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L63:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L65
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1208]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bgt	.L64
.L65:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1208]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L67
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #1204]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #1208]
	add	r3, r2, r3
	sub	r2, r3, #1
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r2, [fp, #-32]
	mvn	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L69
.L67:
	ldr	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #4]
.L69:
	ldr	r3, [fp, #-20]
	mov	r2, #1
	str	r2, [r3, #32]
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-40]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	mov	r3, #1
	str	r3, [fp, #-48]
.L62:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_Reply, .-kernel_Reply
	.align	2
	.global	processMail
	.type	processMail, %function
processMail:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #6
	add	r3, r1, r3
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-32]
	bl	checkMail(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L72
	ldr	r2, [fp, #-16]
	mov	r3, #4
	str	r3, [r2, #32]
	mov	r3, #1
	str	r3, [fp, #-40]
	b	.L74
.L72:
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L75
.L76:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1204]
	ldr	r3, [fp, #-20]
	add	r0, r2, r3
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-32]
	mov	r2, #4
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r0, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L75:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #136]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L77
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1208]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L76
.L77:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #136]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1208]
	cmp	r2, r3
	ble	.L79
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1204]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1208]
	add	r3, r2, r3
	sub	r2, r3, #1
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L81
.L79:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #136]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
.L81:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #1212]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #1
	str	r3, [r2, #32]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L82
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
.L82:
	mov	r3, #1
	str	r3, [fp, #-40]
.L74:
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	processMail, .-processMail
	.ident	"GCC: (GNU) 4.0.2"
