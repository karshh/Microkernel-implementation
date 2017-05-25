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
	cmp	r3, #5
	addls	pc, pc, r3, asl #2
	b	.L2
	.p2align 2
.L9:
	b	.L3
	b	.L4
	b	.L5
	b	.L6
	b	.L7
	b	.L8
.L3:
	ldr	r0, [fp, #-20]
	bl	kernel_MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L10
.L4:
	ldr	r0, [fp, #-20]
	bl	kernel_MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L10
.L5:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	bl	kernel_Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L10
.L6:
	ldr	r0, [fp, #-20]
	bl	kernel_Pass(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L10
.L7:
	ldr	r0, [fp, #-20]
	bl	kernel_Exit(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L10
.L8:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	bl	kernel_Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	b	.L10
.L2:
	mov	r3, #0
	str	r3, [fp, #-32]
.L10:
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
	blt	.L21
	ldr	r3, [fp, #-32]
	cmp	r3, #31
	ble	.L23
.L21:
	ldr	r2, [fp, #-40]
	mvn	r3, #0
	str	r3, [r2, #4]
	b	.L24
.L23:
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
	beq	.L25
	ldr	r2, [fp, #-40]
	mvn	r3, #1
	str	r3, [r2, #4]
	b	.L24
.L25:
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
.L24:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_Create, .-kernel_Create
	.align	2
	.global	kernel_Send
	.type	kernel_Send, %function
kernel_Send:
	@ args = 0, pretend = 0, frame = 28
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
	ldr	r2, [fp, #-40]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-40]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-40]
	mov	r3, #0
	str	r3, [r2, #8]
	ldr	r2, [fp, #-40]
	mov	r3, #0
	str	r3, [r2, #12]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-40]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #12]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-40]
	str	r2, [r3, #4]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #8]
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r0, r1, r3
	ldr	r3, [fp, #-40]
	ldr	r2, [r3, #12]
	str	r2, [sp, #0]
	ldmia	r3, {r1, r2, r3}
	bl	putMail(PLT)
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #564]
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #568]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #564]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #568]
	ldr	r2, [fp, #-28]
	mov	r3, #4
	str	r3, [r2, #32]
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_Send, .-kernel_Send
	.ident	"GCC: (GNU) 4.0.2"
