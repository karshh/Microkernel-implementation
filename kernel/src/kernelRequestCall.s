	.file	"kernelRequestCall.c"
	.text
	.align	2
	.global	processRequest
	.type	processRequest, %function
processRequest:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #44
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	str	r3, [fp, #-52]
	mov	r3, #14
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	bne	.L2
	sub	r3, fp, #36
	str	r3, [fp, #-48]
	ldr	r2, [fp, #-44]
	mov	r3, #1
	str	r3, [r2, #20]
.L2:
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #0]
	sub	r3, r3, #1
	cmp	r3, #13
	addls	pc, pc, r3, asl #2
	b	.L4
	.p2align 2
.L19:
	b	.L5
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
.L5:
	ldr	r0, [fp, #-44]
	bl	kernel_MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L6:
	ldr	r0, [fp, #-44]
	bl	kernel_MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L7:
	ldr	r0, [fp, #-44]
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-40]
	bl	kernel_Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L8:
	ldr	r0, [fp, #-44]
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-40]
	bl	kernel_CreateNameServer(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L10:
	ldr	r0, [fp, #-44]
	bl	kernel_Pass(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L11:
	ldr	r3, [fp, #-44]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-40]
	ldr	r3, .L24
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L21
	ldr	r1, [fp, #-40]
	ldr	r2, .L24
	mvn	r3, #0
	str	r3, [r1, r2]
.L21:
	ldr	r0, [fp, #-44]
	bl	kernel_Exit(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L12:
	ldr	r0, [fp, #-44]
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-52]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L15:
	ldr	r0, [fp, #-44]
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-52]
	bl	kernel_WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L16:
	ldr	r0, [fp, #-44]
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-52]
	bl	kernel_RegisterAs(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L13:
	ldr	r0, [fp, #-44]
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-52]
	bl	kernel_Receive(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L14:
	ldr	r0, [fp, #-44]
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-52]
	bl	kernel_Reply(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L18:
	ldr	r0, [fp, #-40]
	bl	processInterupt(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L9:
	ldr	r0, [fp, #-44]
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-40]
	bl	kernel_CreateClockServer(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L17:
	ldr	r0, [fp, #-44]
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-40]
	bl	kernel_AwaitEvent(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	b	.L20
.L4:
	mov	r3, #0
	str	r3, [fp, #-56]
.L20:
	ldr	r3, [fp, #-56]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L25:
	.align	2
.L24:
	.word	305424
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
	blt	.L35
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	ble	.L37
.L35:
	ldr	r2, [fp, #-40]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L38
.L37:
	ldr	r3, [fp, #-48]
	ldr	r2, .L45
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L39
	ldr	r2, [fp, #-48]
	ldr	r3, .L45
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-48]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L39
	ldr	r2, [fp, #-40]
	mvn	r3, #2
	str	r3, [r2, #4]
	b	.L38
.L39:
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
	beq	.L42
	ldr	r2, [fp, #-40]
	mvn	r3, #1
	str	r3, [r2, #4]
	b	.L38
.L42:
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
	ldr	r3, .L45
	str	r1, [r2, r3]
.L38:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L46:
	.align	2
.L45:
	.word	305424
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
	blt	.L48
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	ble	.L50
.L48:
	ldr	r2, [fp, #-40]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L51
.L50:
	ldr	r3, [fp, #-48]
	ldr	r2, .L58
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L52
	ldr	r2, [fp, #-48]
	ldr	r3, .L58
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-48]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L52
	ldr	r2, [fp, #-40]
	mvn	r3, #2
	str	r3, [r2, #4]
	b	.L51
.L52:
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
	beq	.L55
	ldr	r2, [fp, #-40]
	mvn	r3, #1
	str	r3, [r2, #4]
	b	.L51
.L55:
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
	ldr	r3, .L58+4
	str	r1, [r2, r3]
.L51:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L59:
	.align	2
.L58:
	.word	305428
	.word	305424
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
	blt	.L61
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	ble	.L63
.L61:
	ldr	r2, [fp, #-40]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L64
.L63:
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
	b	.L64
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
.L64:
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
	ldr	r3, .L75
	ldr	r3, [r2, r3]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmn	r3, #1
	beq	.L69
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L69
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L69
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
	b	.L73
.L69:
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-36]
.L73:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L76:
	.align	2
.L75:
	.word	305424
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
	ldr	r3, .L84
	ldr	r3, [r2, r3]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmn	r3, #1
	beq	.L78
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L78
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L78
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
	b	.L82
.L78:
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-36]
.L82:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L85:
	.align	2
.L84:
	.word	305424
	.size	kernel_RegisterAs, .-kernel_RegisterAs
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
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #127
	bgt	.L87
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L87
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-40]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L87
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-40]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L91
.L87:
	ldr	r2, [fp, #-32]
	mvn	r3, #1
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L92
.L91:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L93
	ldr	r3, [fp, #-20]
	cmp	r3, #128
	bgt	.L93
	ldr	r3, [fp, #-16]
	cmp	r3, #128
	ble	.L96
.L93:
	ldr	r2, [fp, #-32]
	mvn	r3, #2
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L92
.L96:
	ldr	r2, [fp, #-44]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L97
.L98:
	ldr	r1, [fp, #-28]
	ldr	r3, [fp, #-44]
	mov	r2, #4
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L97:
	ldr	r3, [fp, #-28]
	cmp	r3, #127
	ble	.L98
	ldr	r2, [fp, #-44]
	mov	r3, #0
	str	r3, [r2, #136]
	ldr	r2, [fp, #-44]
	mov	r3, #0
	str	r3, [r2, #140]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-44]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #140]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #136]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L100
.L101:
	ldr	r0, [fp, #-28]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #8]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-44]
	mov	r2, #4
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, r1
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L100:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L101
	ldr	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [r2, #2372]
	ldr	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [r2, #2376]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #16]
	mov	r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #2372]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #2376]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	mov	r0, r3
	ldr	r1, [fp, #-44]
	bl	putMail(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L103
	ldr	r2, [fp, #-32]
	mvn	r3, #2
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L92
.L103:
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-40]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #4
	bne	.L105
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-44]
	mov	r3, #1
	bl	processMail(PLT)
	b	.L107
.L105:
	ldr	r2, [fp, #-32]
	mov	r3, #5
	str	r3, [r2, #48]
.L107:
	mov	r3, #1
	str	r3, [fp, #-48]
.L92:
	ldr	r3, [fp, #-48]
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
	str	r2, [r3, #2372]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #2376]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #2380]
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
	bgt	.L112
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L112
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-40]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L112
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-40]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L116
.L112:
	ldr	r2, [fp, #-32]
	mvn	r3, #1
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L117
.L116:
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
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
	beq	.L118
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #48]
	cmp	r3, #6
	beq	.L118
	ldr	r2, [fp, #-32]
	mvn	r3, #2
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L117
.L118:
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L121
.L122:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #2372]
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
.L121:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L123
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #2376]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bgt	.L122
.L123:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #2376]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L125
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #2372]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #2376]
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
	b	.L127
.L125:
	ldr	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #4]
.L127:
	ldr	r3, [fp, #-20]
	mov	r2, #1
	str	r2, [r3, #48]
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-40]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	mov	r3, #1
	str	r3, [fp, #-48]
.L117:
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
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-32]
	bl	checkMail(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L130
	ldr	r2, [fp, #-16]
	mov	r3, #4
	str	r3, [r2, #48]
	mov	r3, #1
	str	r3, [fp, #-40]
	b	.L132
.L130:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #0]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
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
	b	.L133
.L134:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #2372]
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
.L133:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #136]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L135
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #2376]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L134
.L135:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #136]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #2376]
	cmp	r2, r3
	ble	.L137
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #2372]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #2376]
	add	r3, r2, r3
	sub	r2, r3, #1
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L139
.L137:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #136]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
.L139:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #2380]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #1
	str	r3, [r2, #48]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L140
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
.L140:
	mov	r3, #1
	str	r3, [fp, #-40]
.L132:
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	processMail, .-processMail
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Kernel: TIMER 1 INTERRUPT, BITCHES\015\012\000"
	.align	2
.LC1:
	.ascii	"Kernel: Currently listening TID: %d\015\012\000"
	.align	2
.LC2:
	.ascii	"Kernel: Stopping Timer1.\015\012\000"
	.align	2
.LC3:
	.ascii	"TIMER 2 INTERRUPT, BITCHES\015\012\000"
	.align	2
.LC4:
	.ascii	"TIMER 3 INTERRUPT, BITCHES\015\012\000"
	.text
	.align	2
	.global	processInterupt
	.type	processInterupt, %function
processInterupt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L153
.L152:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	bl	checkInterrupts(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #5
	beq	.L146
	ldr	r3, [fp, #-32]
	cmp	r3, #19
	beq	.L147
	ldr	r3, [fp, #-32]
	cmp	r3, #4
	beq	.L145
	b	.L144
.L145:
	mov	r0, #1
	ldr	r3, .L153+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-24]
	ldr	r3, .L153+8
	ldr	r2, [r2, r3]
	mov	r0, #1
	ldr	r3, .L153+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L153+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r0, .L153+20
	bl	stopTimer(PLT)
	ldr	r0, .L153+20
	bl	clearTimerInterrupt(PLT)
	ldr	r2, [fp, #-24]
	ldr	r3, .L153+8
	ldr	r3, [r2, r3]
	cmn	r3, #1
	ble	.L148
	ldr	r2, [fp, #-24]
	ldr	r3, .L153+8
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-24]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, .L153+8
	ldr	r3, [r2, r3]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r1, [fp, #-24]
	ldr	r2, .L153+8
	mvn	r3, #0
	str	r3, [r1, r2]
.L148:
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L150
.L146:
	ldr	r0, .L153+24
	bl	stopTimer(PLT)
	ldr	r0, .L153+24
	bl	clearTimerInterrupt(PLT)
	mov	r0, #1
	ldr	r3, .L153+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r0, .L153+24
	mov	r1, #508
	ldr	r2, .L153+32
	bl	startTimer(PLT)
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L150
.L147:
	ldr	r0, .L153+36
	bl	stopTimer(PLT)
	ldr	r0, .L153+36
	bl	clearTimerInterrupt(PLT)
	mov	r0, #1
	ldr	r3, .L153+40
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r0, .L153+36
	mov	r1, #508
	mov	r2, #508
	bl	startTimer(PLT)
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L150
.L144:
	mov	r3, #0
	str	r3, [fp, #-28]
.L150:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L154:
	.align	2
.L153:
	.word	_GLOBAL_OFFSET_TABLE_-(.L152+8)
	.word	.LC0(GOTOFF)
	.word	305432
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	-2139029504
	.word	-2139029472
	.word	.LC3(GOTOFF)
	.word	5080
	.word	-2139029376
	.word	.LC4(GOTOFF)
	.size	processInterupt, .-processInterupt
	.section	.rodata
	.align	2
.LC5:
	.ascii	"Kernel: Await event on code: %d\015\012\000"
	.align	2
.LC6:
	.ascii	"Another task is waiting on this event: %d.\015\012\000"
	.align	2
.LC7:
	.ascii	"Kernel: Blocking TD %d...\015\012\000"
	.align	2
.LC8:
	.ascii	"Starting Timer1...\015\012\000"
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
	sub	sp, sp, #20
	ldr	sl, .L161
.L160:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L161+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L157
	b	.L156
.L157:
	ldr	r2, [fp, #-32]
	ldr	r3, .L161+8
	ldr	r3, [r2, r3]
	cmn	r3, #1
	movne	r1, #0
	moveq	r1, #1
	ldr	r2, [fp, #-32]
	ldr	r3, .L161+8
	ldr	ip, [r2, r3]
	mov	r0, r1
	mov	r1, #1
	ldr	r3, .L161+12
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #32]
	mov	r0, #1
	ldr	r3, .L161+16
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-24]
	mov	r3, #7
	str	r3, [r2, #48]
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L161+8
	str	r1, [r2, r3]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #32]
	mov	r0, #1
	ldr	r3, .L161+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L161+24
	mov	r1, #508
	ldr	r2, .L161+28
	bl	startTimer(PLT)
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L158
.L156:
	ldr	r2, [fp, #-24]
	mvn	r3, #0
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-36]
.L158:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L162:
	.align	2
.L161:
	.word	_GLOBAL_OFFSET_TABLE_-(.L160+8)
	.word	.LC5(GOTOFF)
	.word	305432
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	-2139029504
	.word	5080
	.size	kernel_AwaitEvent, .-kernel_AwaitEvent
	.ident	"GCC: (GNU) 4.0.2"
