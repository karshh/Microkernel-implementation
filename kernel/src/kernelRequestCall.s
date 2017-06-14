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
	cmp	r3, #18
	addls	pc, pc, r3, asl #2
	b	.L5
	.p2align 2
.L24:
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
	b	.L19
	b	.L5
	b	.L20
	b	.L21
	b	.L22
	b	.L23
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
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	bl	kernel_CreateIOServer(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L12:
	ldr	r0, [fp, #-20]
	bl	kernel_Pass(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L23:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-16]
	bl	kernel_Quit(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L13:
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-16]
	ldr	r3, .L40
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L25
	ldr	r1, [fp, #-16]
	ldr	r2, .L40
	mvn	r3, #0
	str	r3, [r1, r2]
.L25:
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-16]
	ldr	r3, .L40+4
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L27
	ldr	r1, [fp, #-16]
	ldr	r2, .L40+4
	mvn	r3, #0
	str	r3, [r1, r2]
.L27:
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-16]
	ldr	r3, .L40+8
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L29
	ldr	r1, [fp, #-16]
	ldr	r2, .L40+8
	mvn	r3, #0
	str	r3, [r1, r2]
.L29:
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-16]
	ldr	r3, .L40+12
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L31
	ldr	r1, [fp, #-16]
	ldr	r2, .L40+12
	mvn	r3, #0
	str	r3, [r1, r2]
.L31:
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-16]
	ldr	r3, .L40+16
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L33
	ldr	r1, [fp, #-16]
	ldr	r2, .L40+16
	mvn	r3, #0
	str	r3, [r1, r2]
.L33:
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-16]
	ldr	r3, .L40+20
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L35
	ldr	r1, [fp, #-16]
	ldr	r2, .L40+20
	mvn	r3, #0
	str	r3, [r1, r2]
.L35:
	ldr	r3, [fp, #-20]
	ldr	r1, [r3, #32]
	ldr	r2, [fp, #-16]
	ldr	r3, .L40+24
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L37
	ldr	r1, [fp, #-16]
	ldr	r2, .L40+24
	mvn	r3, #0
	str	r3, [r1, r2]
.L37:
	ldr	r0, [fp, #-20]
	bl	kernel_Exit(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L14:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L17:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L18:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_RegisterAs(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L15:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_Receive(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L16:
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
.L19:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	bl	kernel_AwaitEvent(PLT)
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
	bl	kernel_RequestIOServer(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L4
.L22:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-16]
	bl	kernel_IdlePercentage(PLT)
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
.L41:
	.align	2
.L40:
	.word	35088
	.word	35112
	.word	35096
	.word	35104
	.word	35100
	.word	35108
	.word	35092
	.size	processRequest, .-processRequest
	.align	2
	.global	kernel_Quit
	.type	kernel_Quit, %function
kernel_Quit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r1, [fp, #-20]
	ldr	r2, .L44
	mov	r3, #2
	str	r3, [r1, r2]
	ldr	r2, [fp, #-16]
	mov	r3, #1
	str	r3, [r2, #4]
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L45:
	.align	2
.L44:
	.word	35156
	.size	kernel_Quit, .-kernel_Quit
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
	ldr	r2, .L52
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L47
	ldr	r2, [fp, #-24]
	ldr	r3, .L52
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	beq	.L49
.L47:
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L50
.L49:
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
.L50:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L53:
	.align	2
.L52:
	.word	35092
	.size	kernel_RequestClockServer, .-kernel_RequestClockServer
	.align	2
	.global	kernel_RequestIOServer
	.type	kernel_RequestIOServer, %function
kernel_RequestIOServer:
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
	ldr	r2, .L72
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L55
	ldr	r2, [fp, #-24]
	ldr	r3, .L72
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L55
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L58
.L55:
	ldr	r3, [fp, #-24]
	ldr	r2, .L72+4
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L59
	ldr	r2, [fp, #-24]
	ldr	r3, .L72+4
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L59
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L58
.L59:
	ldr	r3, [fp, #-24]
	ldr	r2, .L72+8
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L62
	ldr	r2, [fp, #-24]
	ldr	r3, .L72+8
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L62
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L58
.L62:
	ldr	r3, [fp, #-24]
	ldr	r2, .L72+12
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L65
	ldr	r2, [fp, #-24]
	ldr	r3, .L72+12
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L65
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L58
.L65:
	ldr	r3, [fp, #-24]
	ldr	r2, .L72+16
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L68
	ldr	r2, [fp, #-24]
	ldr	r3, .L72+16
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L68
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L58
.L68:
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-32]
.L58:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L73:
	.align	2
.L72:
	.word	35112
	.word	35096
	.word	35100
	.word	35104
	.word	35108
	.size	kernel_RequestIOServer, .-kernel_RequestIOServer
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
	blt	.L83
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	ble	.L85
.L83:
	ldr	r2, [fp, #-40]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L86
.L85:
	ldr	r3, [fp, #-48]
	ldr	r2, .L93
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L87
	ldr	r2, [fp, #-48]
	ldr	r3, .L93
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
	beq	.L87
	ldr	r2, [fp, #-40]
	mvn	r3, #2
	str	r3, [r2, #4]
	b	.L86
.L87:
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
	beq	.L90
	ldr	r2, [fp, #-40]
	mvn	r3, #1
	str	r3, [r2, #4]
	b	.L86
.L90:
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
	ldr	r3, .L93
	str	r1, [r2, r3]
.L86:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L94:
	.align	2
.L93:
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
	blt	.L96
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	ble	.L98
.L96:
	ldr	r2, [fp, #-40]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L99
.L98:
	ldr	r3, [fp, #-48]
	ldr	r2, .L106
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L100
	ldr	r2, [fp, #-48]
	ldr	r3, .L106
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
	beq	.L100
	ldr	r2, [fp, #-40]
	mvn	r3, #2
	str	r3, [r2, #4]
	b	.L99
.L100:
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
	beq	.L103
	ldr	r2, [fp, #-40]
	mvn	r3, #1
	str	r3, [r2, #4]
	b	.L99
.L103:
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
	ldr	r3, .L106
	str	r1, [r2, r3]
.L99:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L107:
	.align	2
.L106:
	.word	35092
	.size	kernel_CreateClockServer, .-kernel_CreateClockServer
	.align	2
	.global	kernel_CreateIOServer
	.type	kernel_CreateIOServer, %function
kernel_CreateIOServer:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #44
	str	r0, [fp, #-44]
	str	r1, [fp, #-48]
	str	r2, [fp, #-52]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	blt	.L109
	ldr	r3, [fp, #-36]
	cmp	r3, #31
	ble	.L111
.L109:
	ldr	r2, [fp, #-44]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L112
.L111:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L113
	ldr	r3, [fp, #-52]
	ldr	r2, .L148
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L113
	ldr	r2, [fp, #-52]
	ldr	r3, .L148
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-52]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L113
	ldr	r2, [fp, #-44]
	mvn	r3, #2
	str	r3, [r2, #4]
	b	.L112
.L113:
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L117
	ldr	r3, [fp, #-52]
	ldr	r2, .L148+4
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L117
	ldr	r2, [fp, #-52]
	ldr	r3, .L148+4
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-52]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L117
	ldr	r2, [fp, #-44]
	mvn	r3, #2
	str	r3, [r2, #4]
	b	.L112
.L117:
	ldr	r3, [fp, #-32]
	cmp	r3, #2
	bne	.L121
	ldr	r3, [fp, #-52]
	ldr	r2, .L148+8
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L121
	ldr	r2, [fp, #-52]
	ldr	r3, .L148+8
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-52]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L121
	ldr	r2, [fp, #-44]
	mvn	r3, #2
	str	r3, [r2, #4]
	b	.L112
.L121:
	ldr	r3, [fp, #-32]
	cmp	r3, #3
	bne	.L125
	ldr	r3, [fp, #-52]
	ldr	r2, .L148+12
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L125
	ldr	r2, [fp, #-52]
	ldr	r3, .L148+12
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-52]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L125
	ldr	r2, [fp, #-44]
	mvn	r3, #2
	str	r3, [r2, #4]
	b	.L112
.L125:
	ldr	r3, [fp, #-32]
	cmp	r3, #4
	bne	.L129
	ldr	r3, [fp, #-52]
	ldr	r2, .L148+16
	ldr	r3, [r3, r2]
	cmn	r3, #1
	beq	.L129
	ldr	r2, [fp, #-52]
	ldr	r3, .L148+16
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-52]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #3
	beq	.L129
	ldr	r2, [fp, #-44]
	mvn	r3, #2
	str	r3, [r2, #4]
	b	.L112
.L129:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L133
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	beq	.L133
	ldr	r3, [fp, #-32]
	cmp	r3, #2
	beq	.L133
	ldr	r3, [fp, #-32]
	cmp	r3, #3
	beq	.L133
	ldr	r3, [fp, #-32]
	cmp	r3, #4
	beq	.L133
	ldr	r2, [fp, #-44]
	mvn	r3, #3
	str	r3, [r2, #4]
	b	.L112
.L133:
	mov	r3, #0
	str	r3, [fp, #-40]
	sub	r3, fp, #40
	ldr	r0, [fp, #-52]
	mov	r1, r3
	bl	getNextTID(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L139
	ldr	r2, [fp, #-44]
	mvn	r3, #1
	str	r3, [r2, #4]
	b	.L112
.L139:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-44]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #32]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-52]
	mov	r1, r2
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	bl	setTask(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-52]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r3, [fp, #-32]
	cmp	r3, #4
	addls	pc, pc, r3, asl #2
	b	.L112
	.p2align 2
.L146:
	b	.L141
	b	.L142
	b	.L143
	b	.L144
	b	.L145
.L141:
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-52]
	ldr	r3, .L148
	str	r1, [r2, r3]
	b	.L112
.L142:
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-52]
	ldr	r3, .L148+4
	str	r1, [r2, r3]
	b	.L112
.L143:
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-52]
	ldr	r3, .L148+8
	str	r1, [r2, r3]
	b	.L112
.L144:
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-52]
	ldr	r3, .L148+12
	str	r1, [r2, r3]
	b	.L112
.L145:
	ldr	r1, [fp, #-40]
	ldr	r2, [fp, #-52]
	ldr	r3, .L148+16
	str	r1, [r2, r3]
.L112:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L149:
	.align	2
.L148:
	.word	35112
	.word	35096
	.word	35100
	.word	35104
	.word	35108
	.size	kernel_CreateIOServer, .-kernel_CreateIOServer
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
	blt	.L151
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	ble	.L153
.L151:
	ldr	r2, [fp, #-40]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L154
.L153:
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
	beq	.L155
	ldr	r2, [fp, #-40]
	mvn	r3, #1
	str	r3, [r2, #4]
	b	.L154
.L155:
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
.L154:
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
	ldr	r3, .L165
	ldr	r3, [r2, r3]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmn	r3, #1
	beq	.L159
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
	beq	.L159
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
	beq	.L159
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
	b	.L163
.L159:
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-36]
.L163:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L166:
	.align	2
.L165:
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
	ldr	r3, .L174
	ldr	r3, [r2, r3]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmn	r3, #1
	beq	.L168
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
	beq	.L168
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
	beq	.L168
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
	b	.L172
.L168:
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-36]
.L172:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L175:
	.align	2
.L174:
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
	bgt	.L177
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L177
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
	beq	.L177
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
	bne	.L181
.L177:
	ldr	r2, [fp, #-28]
	mvn	r3, #1
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-44]
	b	.L182
.L181:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L183
	ldr	r2, [fp, #-28]
	mvn	r3, #2
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-44]
	b	.L182
.L183:
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
	bne	.L185
	ldr	r2, [fp, #-28]
	mvn	r3, #2
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-44]
	b	.L182
.L185:
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
	bne	.L187
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-40]
	mov	r3, #1
	bl	processMail(PLT)
	b	.L189
.L187:
	ldr	r2, [fp, #-28]
	mov	r3, #5
	str	r3, [r2, #48]
.L189:
	mov	r3, #1
	str	r3, [fp, #-44]
.L182:
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
	bgt	.L194
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L194
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
	beq	.L194
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
	bne	.L198
.L194:
	ldr	r2, [fp, #-32]
	mvn	r3, #1
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L199
.L198:
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
	beq	.L200
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #48]
	cmp	r3, #6
	beq	.L200
	ldr	r2, [fp, #-32]
	mvn	r3, #2
	str	r3, [r2, #4]
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L199
.L200:
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L203
.L204:
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
.L203:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L205
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #264]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bgt	.L204
.L205:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #264]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L207
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
	b	.L209
.L207:
	ldr	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #4]
.L209:
	ldr	r3, [fp, #-20]
	mov	r2, #1
	str	r2, [r3, #48]
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-40]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	mov	r3, #1
	str	r3, [fp, #-48]
.L199:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_Reply, .-kernel_Reply
	.global	__udivsi3
	.align	2
	.global	kernel_IdlePercentage
	.type	kernel_IdlePercentage, %function
kernel_IdlePercentage:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, .L213
	ldr	r2, [r2, r3]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r4, r3
	mov	r0, #0
	bl	getTicks4(PLT)
	mov	r3, r0
	mov	r0, r4
	mov	r1, r3
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {r4, fp, sp, pc}
.L214:
	.align	2
.L213:
	.word	35132
	.size	kernel_IdlePercentage, .-kernel_IdlePercentage
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
	bne	.L216
	ldr	r2, [fp, #-16]
	mov	r3, #4
	str	r3, [r2, #48]
	mov	r3, #1
	str	r3, [fp, #-40]
	b	.L218
.L216:
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
	b	.L219
.L220:
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
.L219:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L221
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #264]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L220
.L221:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #264]
	cmp	r2, r3
	ble	.L223
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
	b	.L225
.L223:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
.L225:
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
	beq	.L226
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
.L226:
	mov	r3, #1
	str	r3, [fp, #-40]
.L218:
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L256
.L255:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-20]
	bl	checkInterrupts(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L230
	ldr	r0, .L256+4
	bl	stopTimer(PLT)
	ldr	r0, .L256+4
	bl	clearTimerInterrupt(PLT)
	ldr	r0, .L256+4
	mov	r1, #508
	ldr	r2, .L256+8
	mov	r3, #1
	bl	startTimer(PLT)
	ldr	r0, .L256+12
	bl	clearTimerInterrupt(PLT)
	mov	r0, #0
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L256+4
	bl	clearTimerInterrupt(PLT)
	ldr	r3, [fp, #-28]
	ldr	r2, .L256+16
	ldr	r3, [r3, r2]
	cmn	r3, #1
	ble	.L232
	ldr	r2, [fp, #-28]
	ldr	r3, .L256+16
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-28]
	ldr	r3, .L256+16
	ldr	r3, [r2, r3]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r1, [fp, #-28]
	ldr	r2, .L256+16
	mvn	r3, #0
	str	r3, [r1, r2]
.L232:
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L234
.L230:
	ldr	r3, [fp, #-24]
	mov	r3, r3, lsr #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L235
	mov	r0, #0
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L256+4
	bl	clearTimerInterrupt(PLT)
	ldr	r3, [fp, #-28]
	ldr	r2, .L256+16
	ldr	r3, [r3, r2]
	cmn	r3, #1
	ble	.L235
	ldr	r2, [fp, #-28]
	ldr	r3, .L256+16
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-28]
	ldr	r3, .L256+16
	ldr	r3, [r2, r3]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r1, [fp, #-28]
	ldr	r2, .L256+16
	mvn	r3, #0
	str	r3, [r1, r2]
.L235:
	ldr	r3, [fp, #-24]
	mov	r3, r3, lsr #2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L238
	ldr	r0, .L256+20
	bl	stopTimer(PLT)
	ldr	r0, .L256+20
	bl	clearTimerInterrupt(PLT)
	mov	r0, #1
	ldr	r3, .L256+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r0, .L256+20
	mov	r1, #508
	ldr	r2, .L256+28
	mov	r3, #1
	bl	startTimer(PLT)
.L238:
	ldr	r3, [fp, #-24]
	mov	r3, r3, lsr #3
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L240
	ldr	r3, .L256+32
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r2, .L256+32
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L242
	mov	r0, #0
	bl	toggleUART1SendInterrupt(PLT)
	ldr	r3, [fp, #-28]
	ldr	r2, .L256+36
	ldr	r3, [r3, r2]
	cmn	r3, #1
	ble	.L242
	ldr	r2, [fp, #-28]
	ldr	r3, .L256+36
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-28]
	ldr	r3, .L256+36
	ldr	r3, [r2, r3]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r1, [fp, #-28]
	ldr	r2, .L256+36
	mvn	r3, #0
	str	r3, [r1, r2]
.L242:
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L240
	mov	r0, #0
	bl	toggleUART1ReceiveInterrupt(PLT)
	ldr	r3, [fp, #-28]
	ldr	r2, .L256+40
	ldr	r3, [r3, r2]
	cmn	r3, #1
	ble	.L240
	ldr	r2, [fp, #-28]
	ldr	r3, .L256+40
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-28]
	ldr	r3, .L256+40
	ldr	r3, [r2, r3]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r1, [fp, #-28]
	ldr	r2, .L256+40
	mvn	r3, #0
	str	r3, [r1, r2]
.L240:
	ldr	r3, [fp, #-24]
	mov	r3, r3, lsr #4
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L247
	ldr	r3, .L256+44
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r2, .L256+44
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L249
	mov	r0, #0
	bl	toggleUART2SendInterrupt(PLT)
	ldr	r3, [fp, #-28]
	ldr	r2, .L256+48
	ldr	r3, [r3, r2]
	cmn	r3, #1
	ble	.L249
	ldr	r2, [fp, #-28]
	ldr	r3, .L256+48
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-28]
	ldr	r3, .L256+48
	ldr	r3, [r2, r3]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r1, [fp, #-28]
	ldr	r2, .L256+48
	mvn	r3, #0
	str	r3, [r1, r2]
.L249:
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L247
	mov	r0, #0
	bl	toggleUART2ReceiveInterrupt(PLT)
	ldr	r3, [fp, #-28]
	ldr	r2, .L256+52
	ldr	r3, [r3, r2]
	cmn	r3, #1
	ble	.L247
	ldr	r2, [fp, #-28]
	ldr	r3, .L256+52
	ldr	r2, [r2, r3]
	ldr	r1, [fp, #-28]
	mov	r0, #48
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r1
	add	r2, r3, r0
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-28]
	ldr	r3, .L256+52
	ldr	r3, [r2, r3]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-28]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	ldr	r1, [fp, #-28]
	ldr	r2, .L256+52
	mvn	r3, #0
	str	r3, [r1, r2]
.L247:
	mov	r3, #1
	str	r3, [fp, #-32]
.L234:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L257:
	.align	2
.L256:
	.word	_GLOBAL_OFFSET_TABLE_-(.L255+8)
	.word	-2139029504
	.word	5085
	.word	-2139029376
	.word	35136
	.word	-2139029472
	.word	.LC0(GOTOFF)
	.word	5080
	.word	-2138308580
	.word	35140
	.word	35144
	.word	-2138243044
	.word	35148
	.word	35152
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
	ldr	sl, .L269
.L268:
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
	b	.L259
	.p2align 2
.L265:
	b	.L260
	b	.L261
	b	.L262
	b	.L263
	b	.L264
.L260:
	ldr	r2, [fp, #-32]
	ldr	r3, .L269+4
	ldr	r3, [r2, r3]
	cmn	r3, #1
	movne	r1, #0
	moveq	r1, #1
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L269+4
	ldr	r3, [r2, r3]
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, #1
	ldr	r3, .L269+8
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
	ldr	r3, .L269+4
	str	r1, [r2, r3]
	mov	r0, #1
	bl	toggleTimer1Interrupt(PLT)
	ldr	r0, .L269+12
	bl	clearTimerInterrupt(PLT)
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L266
.L261:
	ldr	r2, [fp, #-32]
	ldr	r3, .L269+16
	ldr	r3, [r2, r3]
	cmn	r3, #1
	movne	r1, #0
	moveq	r1, #1
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L269+16
	ldr	r3, [r2, r3]
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, #1
	ldr	r3, .L269+20
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
	ldr	r3, .L269+16
	str	r1, [r2, r3]
	mov	r0, #1
	bl	toggleUART1VICInterrupt(PLT)
	mov	r0, #1
	bl	toggleUART1SendInterrupt(PLT)
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L266
.L262:
	ldr	r2, [fp, #-32]
	ldr	r3, .L269+24
	ldr	r3, [r2, r3]
	cmn	r3, #1
	movne	r1, #0
	moveq	r1, #1
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L269+24
	ldr	r3, [r2, r3]
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, #1
	ldr	r3, .L269+28
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
	ldr	r3, .L269+24
	str	r1, [r2, r3]
	mov	r0, #1
	bl	toggleUART1VICInterrupt(PLT)
	mov	r0, #1
	bl	toggleUART1ReceiveInterrupt(PLT)
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L266
.L263:
	ldr	r2, [fp, #-32]
	ldr	r3, .L269+32
	ldr	r3, [r2, r3]
	cmn	r3, #1
	movne	r1, #0
	moveq	r1, #1
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L269+32
	ldr	r3, [r2, r3]
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, #1
	ldr	r3, .L269+36
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
	ldr	r3, .L269+32
	str	r1, [r2, r3]
	mov	r0, #1
	bl	toggleUART2VICInterrupt(PLT)
	mov	r0, #1
	bl	toggleUART2SendInterrupt(PLT)
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L266
.L264:
	ldr	r2, [fp, #-32]
	ldr	r3, .L269+40
	ldr	r3, [r2, r3]
	cmn	r3, #1
	movne	r1, #0
	moveq	r1, #1
	ldr	r3, [fp, #-24]
	ldr	ip, [r3, #32]
	ldr	r2, [fp, #-32]
	ldr	r3, .L269+40
	ldr	r3, [r2, r3]
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, #1
	ldr	r3, .L269+44
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
	ldr	r3, .L269+40
	str	r1, [r2, r3]
	mov	r0, #1
	bl	toggleUART2VICInterrupt(PLT)
	mov	r0, #1
	bl	toggleUART2ReceiveInterrupt(PLT)
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L266
.L259:
	ldr	r2, [fp, #-24]
	mvn	r3, #0
	str	r3, [r2, #4]
	mov	r3, #0
	str	r3, [fp, #-36]
.L266:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L270:
	.align	2
.L269:
	.word	_GLOBAL_OFFSET_TABLE_-(.L268+8)
	.word	35136
	.word	.LC1(GOTOFF)
	.word	-2139029504
	.word	35140
	.word	.LC2(GOTOFF)
	.word	35144
	.word	.LC3(GOTOFF)
	.word	35148
	.word	.LC4(GOTOFF)
	.word	35152
	.word	.LC5(GOTOFF)
	.size	kernel_AwaitEvent, .-kernel_AwaitEvent
	.ident	"GCC: (GNU) 4.0.2"
