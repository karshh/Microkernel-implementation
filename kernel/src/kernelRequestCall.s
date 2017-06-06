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
	cmp	r3, #0
	bne	.L2
	ldr	r3, [fp, #-20]
	mov	r2, #1
	str	r2, [r3, #20]
	ldr	r0, [fp, #-16]
	bl	processInterrupt(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L2:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	sub	r3, r3, #1
	cmp	r3, #16
	addls	pc, pc, r3, asl #2
	b	.L5
	.p2align 2
.L22:
	b	.L6
	b	.L7
	b	.L8
	b	.L9
	b	.L10
	b	.L11
	b	.L12
	b	.L13
	b	.L14
	b	.L15
	b	.L16
	b	.L17
	b	.L18
	b	.L5
	b	.L19
	b	.L20
	b	.L21
.L6:
	ldr	r0, [fp, #-20]
	bl	kernel_MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L7:
	ldr	r0, [fp, #-20]
	bl	kernel_MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L8:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	bl	kernel_Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L9:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	bl	kernel_CreateNameServer(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L11:
	ldr	r0, [fp, #-20]
	bl	kernel_Pass(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L12:
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-16]
	ldr	r3, .L26
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L23
	ldr	r1, [fp, #-16]
	ldr	r2, .L26
	mvn	r3, #0
	str	r3, [r1, r2]
.L23:
	ldr	r0, [fp, #-20]
	bl	kernel_Exit(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L13:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L16:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L17:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_RegisterAs(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L14:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_Receive(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L15:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_Reply(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L10:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	bl	kernel_CreateClockServer(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L18:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	bl	kernel_AwaitEvent(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L19:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_RequestClockServer(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L20:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_RequestClockServer(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L21:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_RequestClockServer(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L5:
	mov	r3, #0
	str	r3, [fp, #-32]
.L4:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L27:
	.align	2
.L26:
	.word	35088
	.size	processRequest, .-processRequest
	.align	2
	.global	kernel_RequestClockServer
	.type	kernel_RequestClockServer, %function
kernel_RequestClockServer:
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
	ldr	r2, .L34
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L29
	ldr	r2, [fp, #-24]
	ldr	r3, .L34
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	beq	.L31
.L29:
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L32
.L31:
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
.L32:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L35:
	.align	2
.L34:
	.word	35092
	.size	kernel_RequestClockServer, .-kernel_RequestClockServer
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
	ldr	r2, [r3, #32]
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
	ldr	r2, [r3, #36]
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
	str	r2, [r3, #44]
	ldr	r2, [fp, #-20]
	mov	r3, #3
	str	r3, [r2, #48]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #4]
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_Exit, .-kernel_Exit
	.align	2
	.global	kernel_CreateNameServer
	.type	kernel_CreateNameServer, %function
kernel_CreateNameServer:
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
	blt	.L45
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	ble	.L47
.L45:
	ldr	r2, [fp, #-40]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L48
.L47:
	ldr	r3, [fp, #-48]
	ldr	r2, .L55
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L49
	ldr	r2, [fp, #-48]
	ldr	r3, .L55
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-48]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L49
	ldr	r2, [fp, #-40]
	mvn	r3, #2
	str	r3, [r2, #4]
	b	.L48
.L49:
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
	beq	.L52
	ldr	r2, [fp, #-40]
	mvn	r3, #1
	str	r3, [r2, #4]
	b	.L48
.L52:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #32]
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
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-48]
	ldr	r3, .L55
	str	r1, [r2, r3]
.L48:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L56:
	.align	2
.L55:
	.word	35088
	.size	kernel_CreateNameServer, .-kernel_CreateNameServer
	.align	2
	.global	kernel_CreateClockServer
	.type	kernel_CreateClockServer, %function
kernel_CreateClockServer:
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
	blt	.L58
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	ble	.L60
.L58:
	ldr	r2, [fp, #-40]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L61
.L60:
	ldr	r3, [fp, #-48]
	ldr	r2, .L68
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L62
	ldr	r2, [fp, #-48]
	ldr	r3, .L68
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-48]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L62
	ldr	r2, [fp, #-40]
	mvn	r3, #2
	str	r3, [r2, #4]
	b	.L61
.L62:
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
	beq	.L65
	ldr	r2, [fp, #-40]
	mvn	r3, #1
	str	r3, [r2, #4]
	b	.L61
.L65:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #32]
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
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-48]
	ldr	r3, .L68
	str	r1, [r2, r3]
.L61:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L69:
	.align	2
.L68:
	.word	35092
	.size	kernel_CreateClockServer, .-kernel_CreateClockServer
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
	blt	.L71
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	ble	.L73
.L71:
	ldr	r2, [fp, #-40]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L74
.L73:
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
	beq	.L75
	ldr	r2, [fp, #-40]
	mvn	r3, #1
	str	r3, [r2, #4]
	b	.L74
.L75:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #32]
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
.L74:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_Create, .-kernel_Create
	.align	2
	.global	kernel_WhoIs
	.type	kernel_WhoIs, %function
kernel_WhoIs:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-28]
	ldr	r3, .L85
	ldr	r3, [r2, r3]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmn	r3, #1
	beq	.L79
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L79
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L79
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	str	r3, [r2, #4]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	b	.L83
.L79:
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-36]
.L83:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L86:
	.align	2
.L85:
	.word	35088
	.size	kernel_WhoIs, .-kernel_WhoIs
	.align	2
	.global	kernel_RegisterAs
	.type	kernel_RegisterAs, %function
kernel_RegisterAs:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-28]
	ldr	r3, .L94
	ldr	r3, [r2, r3]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmn	r3, #1
	beq	.L88
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L88
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L88
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	str	r3, [r2, #4]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	b	.L92
.L88:
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-36]
.L92:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L95:
	.align	2
.L94:
	.word	35088
	.size	kernel_RegisterAs, .-kernel_RegisterAs
	.align	2
	.global	kernel_Send
	.type	kernel_Send, %function
kernel_Send:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #127
	bgt	.L97
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L97
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-36]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L97
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-36]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L101
.L97:
	ldr	r2, [fp, #-28]
	mvn	r3, #1
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-44]
	b	.L102
.L101:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L103
	ldr	r2, [fp, #-28]
	mvn	r3, #2
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-44]
	b	.L102
.L103:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-40]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #8]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	str	r2, [r3, #260]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #264]
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	mov	r0, r3
	ldr	r1, [fp, #-40]
	bl	putMail(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L105
	ldr	r2, [fp, #-28]
	mvn	r3, #2
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-44]
	b	.L102
.L105:
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-36]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #4
	bne	.L107
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-40]
	mov	r3, #1
	bl	processMail(PLT)
	b	.L109
.L107:
	ldr	r2, [fp, #-28]
	mov	r3, #5
	str	r3, [r2, #48]
.L109:
	mov	r3, #1
	str	r3, [fp, #-44]
.L102:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_Send, .-kernel_Send
	.align	2
	.global	kernel_Receive
	.type	kernel_Receive, %function
kernel_Receive:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #260]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #264]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #268]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #32]
	mov	r0, r3
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-28]
	mov	r3, #0
	bl	processMail(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
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
	ldr	r3, [fp, #-24]
	cmp	r3, #127
	bgt	.L114
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L114
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-40]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L114
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-40]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L118
.L114:
	ldr	r2, [fp, #-32]
	mvn	r3, #1
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L119
.L118:
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #48]
	cmp	r3, #5
	beq	.L120
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #48]
	cmp	r3, #6
	beq	.L120
	ldr	r2, [fp, #-32]
	mvn	r3, #2
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L119
.L120:
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L123
.L124:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #260]
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
.L123:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L125
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #264]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bgt	.L124
.L125:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #264]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L127
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #260]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #264]
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
	b	.L129
.L127:
	ldr	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #4]
.L129:
	ldr	r3, [fp, #-20]
	mov	r2, #1
	str	r2, [r3, #48]
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-40]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	mov	r3, #1
	str	r3, [fp, #-48]
.L119:
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
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-32]
	bl	checkMail(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L132
	ldr	r2, [fp, #-16]
	mov	r3, #4
	str	r3, [r2, #48]
	mov	r3, #1
	str	r3, [fp, #-40]
	b	.L134
.L132:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #0]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #6
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L135
.L136:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #260]
	ldr	r3, [fp, #-20]
	add	r1, r2, r3
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r1, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L135:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L137
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #264]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L136
.L137:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #264]
	cmp	r2, r3
	ble	.L139
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #260]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #264]
	add	r3, r2, r3
	sub	r2, r3, #1
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L141
.L139:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
.L141:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #268]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #1
	str	r3, [r2, #48]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L142
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
.L142:
	mov	r3, #1
	str	r3, [fp, #-40]
.L134:
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	processMail, .-processMail
	.section	.rodata
	.align	2
.LC0:
	.ascii	"TIMER 2 INTERRUPT, BITCHES\015\012\000"
	.text
	.align	2
	.global	processInterrupt
	.type	processInterrupt, %function
processInterrupt:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L180
.L179:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	bl	checkInterrupts(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #4
	cmp	r3, #18
	addls	pc, pc, r3, asl #2
	b	.L146
	.p2align 2
.L152:
	b	.L147
	b	.L148
	b	.L146
	b	.L146
	b	.L146
	b	.L146
	b	.L146
	b	.L146
	b	.L146
	b	.L146
	b	.L146
	b	.L146
	b	.L146
	b	.L146
	b	.L146
	b	.L149
	b	.L150
	b	.L146
	b	.L151
.L147:
	mov	r0, #0
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L180+4
	bl	clearTimerInterrupt(PLT)
	ldr	r3, [fp, #-24]
	ldr	r2, .L180+8
	ldr	r3, [r3, r2]
	cmn	r3, #1
	ble	.L153
	ldr	r2, [fp, #-24]
	ldr	r3, .L180+8
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-24]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, .L180+8
	ldr	r3, [r2, r3]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r1, [fp, #-24]
	ldr	r2, .L180+8
	mvn	r3, #0
	str	r3, [r1, r2]
.L153:
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L155
.L148:
	ldr	r0, .L180+12
	bl	stopTimer(PLT)
	ldr	r0, .L180+12
	bl	clearTimerInterrupt(PLT)
	mov	r0, #1
	ldr	r3, .L180+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r0, .L180+12
	mov	r1, #508
	ldr	r2, .L180+20
	mov	r3, #1
	bl	startTimer(PLT)
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L155
.L149:
	ldr	r0, .L180+4
	bl	stopTimer(PLT)
	ldr	r0, .L180+4
	bl	clearTimerInterrupt(PLT)
	ldr	r0, .L180+4
	mov	r1, #508
	ldr	r2, .L180+24
	mov	r3, #1
	bl	startTimer(PLT)
	ldr	r0, .L180+28
	bl	clearTimerInterrupt(PLT)
	mov	r0, #0
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L180+4
	bl	clearTimerInterrupt(PLT)
	ldr	r3, [fp, #-24]
	ldr	r2, .L180+8
	ldr	r3, [r3, r2]
	cmn	r3, #1
	ble	.L156
	ldr	r2, [fp, #-24]
	ldr	r3, .L180+8
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-24]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, .L180+8
	ldr	r3, [r2, r3]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r1, [fp, #-24]
	ldr	r2, .L180+8
	mvn	r3, #0
	str	r3, [r1, r2]
.L156:
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L155
.L150:
	ldr	r3, .L180+32
	ldr	r3, [r3, #0]
	and	r3, r3, #1
	and	r3, r3, #255
	eor	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L158
	ldr	r3, .L180+32
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L160
	mov	r0, #0
	bl	toggleUART1SendInterrupt(PLT)
	ldr	r3, [fp, #-24]
	ldr	r2, .L180+36
	ldr	r3, [r3, r2]
	cmn	r3, #1
	ble	.L158
	ldr	r2, [fp, #-24]
	ldr	r3, .L180+36
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-24]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, .L180+36
	ldr	r3, [r2, r3]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r1, [fp, #-24]
	ldr	r2, .L180+36
	mvn	r3, #0
	str	r3, [r1, r2]
	b	.L158
.L160:
	ldr	r3, .L180+32
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L158
	mov	r0, #0
	bl	toggleUART1ReceiveInterrupt(PLT)
	ldr	r3, [fp, #-24]
	ldr	r2, .L180+40
	ldr	r3, [r3, r2]
	cmn	r3, #1
	ble	.L158
	ldr	r2, [fp, #-24]
	ldr	r3, .L180+40
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-24]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, .L180+40
	ldr	r3, [r2, r3]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r1, [fp, #-24]
	ldr	r2, .L180+40
	mvn	r3, #0
	str	r3, [r1, r2]
.L158:
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L155
.L151:
	ldr	r3, .L180+44
	ldr	r3, [r3, #0]
	and	r3, r3, #1
	and	r3, r3, #255
	eor	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L168
	ldr	r3, .L180+44
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L170
	mov	r0, #0
	bl	toggleUART2SendInterrupt(PLT)
	ldr	r3, [fp, #-24]
	ldr	r2, .L180+48
	ldr	r3, [r3, r2]
	cmn	r3, #1
	ble	.L168
	ldr	r2, [fp, #-24]
	ldr	r3, .L180+48
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-24]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, .L180+48
	ldr	r3, [r2, r3]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r1, [fp, #-24]
	ldr	r2, .L180+48
	mvn	r3, #0
	str	r3, [r1, r2]
	b	.L168
.L170:
	ldr	r3, .L180+44
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L168
	mov	r0, #0
	bl	toggleUART2ReceiveInterrupt(PLT)
	ldr	r3, [fp, #-24]
	ldr	r2, .L180+52
	ldr	r3, [r3, r2]
	cmn	r3, #1
	ble	.L168
	ldr	r2, [fp, #-24]
	ldr	r3, .L180+52
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-24]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, .L180+52
	ldr	r3, [r2, r3]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r1, [fp, #-24]
	ldr	r2, .L180+52
	mvn	r3, #0
	str	r3, [r1, r2]
.L168:
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L155
.L146:
	mov	r3, #0
	str	r3, [fp, #-28]
.L155:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L181:
	.align	2
.L180:
	.word	_GLOBAL_OFFSET_TABLE_-(.L179+8)
	.word	-2139029504
	.word	35116
	.word	-2139029472
	.word	.LC0(GOTOFF)
	.word	5080
	.word	5085
	.word	-2139029376
	.word	-2138308580
	.word	35120
	.word	35124
	.word	-2138243044
	.word	35128
	.word	35132
	.size	processInterrupt, .-processInterrupt
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	ldr	sl, .L193
.L192:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L183
	.p2align 2
.L189:
	b	.L184
	b	.L185
	b	.L186
	b	.L187
	b	.L188
.L184:
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+4
	ldr	r3, [r2, r3]
	cmn	r3, #1
	movne	r1, #0
	moveq	r1, #1
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+4
	ldr	r3, [r2, r3]
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, #1
	ldr	r3, .L193+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	ldr	r2, [fp, #-24]
	mov	r3, #7
	str	r3, [r2, #48]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+4
	str	r1, [r2, r3]
	mov	r0, #1
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L193+12
	bl	clearTimerInterrupt(PLT)
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L190
.L185:
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+16
	ldr	r3, [r2, r3]
	cmn	r3, #1
	movne	r1, #0
	moveq	r1, #1
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+16
	ldr	r3, [r2, r3]
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, #1
	ldr	r3, .L193+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	ldr	r2, [fp, #-24]
	mov	r3, #7
	str	r3, [r2, #48]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+16
	str	r1, [r2, r3]
	mov	r0, #1
	bl	toggleUART1SendInterrupt(PLT)
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L190
.L186:
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+24
	ldr	r3, [r2, r3]
	cmn	r3, #1
	movne	r1, #0
	moveq	r1, #1
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+24
	ldr	r3, [r2, r3]
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, #1
	ldr	r3, .L193+28
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	ldr	r2, [fp, #-24]
	mov	r3, #7
	str	r3, [r2, #48]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+24
	str	r1, [r2, r3]
	mov	r0, #1
	bl	toggleUART1ReceiveInterrupt(PLT)
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L190
.L187:
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+32
	ldr	r3, [r2, r3]
	cmn	r3, #1
	movne	r1, #0
	moveq	r1, #1
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+32
	ldr	r3, [r2, r3]
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, #1
	ldr	r3, .L193+36
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	ldr	r2, [fp, #-24]
	mov	r3, #7
	str	r3, [r2, #48]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+32
	str	r1, [r2, r3]
	mov	r0, #1
	bl	toggleUART2SendInterrupt(PLT)
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L190
.L188:
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+40
	ldr	r3, [r2, r3]
	cmn	r3, #1
	movne	r1, #0
	moveq	r1, #1
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+40
	ldr	r3, [r2, r3]
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, #1
	ldr	r3, .L193+44
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	ldr	r2, [fp, #-24]
	mov	r3, #7
	str	r3, [r2, #48]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L193+40
	str	r1, [r2, r3]
	mov	r0, #1
	bl	toggleUART2ReceiveInterrupt(PLT)
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L190
.L183:
	ldr	r2, [fp, #-24]
	mvn	r3, #0
	str	r3, [r2, #4]
	mov	r3, #0
	str	r3, [fp, #-36]
.L190:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L194:
	.align	2
.L193:
	.word	_GLOBAL_OFFSET_TABLE_-(.L192+8)
	.word	35116
	.word	.LC1(GOTOFF)
	.word	-2139029504
	.word	35120
	.word	.LC2(GOTOFF)
	.word	35124
	.word	.LC3(GOTOFF)
	.word	35128
	.word	.LC4(GOTOFF)
	.word	35132
	.word	.LC5(GOTOFF)
	.size	kernel_AwaitEvent, .-kernel_AwaitEvent
	.ident	"GCC: (GNU) 4.0.2"
