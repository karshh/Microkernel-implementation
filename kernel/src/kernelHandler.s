	.file	"kernelHandler.c"
	.text
	.align	2
	.global	getNextTID
	.type	getNextTID, %function
getNextTID:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	sub	r3, fp, #16
	ldr	r0, [fp, #-20]
	mov	r1, r3
	bl	free_Pop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L2
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L4
.L2:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-28]
.L4:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	getNextTID, .-getNextTID
	.section	.rodata
	.align	2
.LC0:
	.ascii	"error getting TID\012\015\000"
	.align	2
.LC1:
	.ascii	"Kernel:failed to push TD %d on the queue\012\015\000"
	.text
	.align	2
	.global	initKernel
	.type	initKernel, %function
initKernel:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	ldr	sl, .L20
.L19:
	add	sl, pc, sl
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	str	r2, [fp, #-44]
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	ldr	r1, [fp, #-36]
	ldr	r2, .L20+4
	mov	r3, #0
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r1, [fp, #-36]
	ldr	r2, .L20+8
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L20+12
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r3, [fp, #-36]
	add	r3, r3, #155648
	add	r3, r3, #276
	add	r3, r3, #16777216
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #28
	add	r3, r2, r1
	and	r3, r3, #15
	rsb	r3, r1, r3
	mov	r2, r3
	ldr	r3, [fp, #-28]
	rsb	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r1, [fp, #-36]
	ldr	r2, .L20+16
	ldr	r3, [fp, #-28]
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L7
.L8:
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #6
	add	r3, r1, r3
	ldr	r2, [fp, #-32]
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-28]
	bl	initTD(PLT)
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #6
	add	r3, r1, r3
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	free_Push(PLT)
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L7:
	ldr	r3, [fp, #-32]
	cmp	r3, #127
	ble	.L8
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L10
.L11:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-36]
	mov	r1, #155648
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-36]
	ldr	r1, .L20+20
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L10:
	ldr	r3, [fp, #-24]
	cmp	r3, #31
	ble	.L11
	ldr	r1, [fp, #-36]
	ldr	r2, .L20+24
	mov	r3, #0
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-32]
	sub	r3, fp, #32
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	getNextTID(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L13
	mov	r0, #1
	ldr	r3, .L20+28
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-48]
	b	.L15
.L13:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r2
	mvn	r2, #0
	ldr	r3, [fp, #-40]
	bl	setTask(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	kernel_queuePush(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L16
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #16]
	mov	r0, #1
	ldr	r3, .L20+32
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #1
	str	r3, [fp, #-48]
	b	.L15
.L16:
	mov	r3, #0
	str	r3, [fp, #-48]
.L15:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L21:
	.align	2
.L20:
	.word	_GLOBAL_OFFSET_TABLE_-(.L19+8)
	.word	155916
	.word	155908
	.word	155912
	.word	155920
	.word	155776
	.word	155904
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	initKernel, .-initKernel
	.align	2
	.global	kernelRun
	.type	kernelRun, %function
kernelRun:
	@ args = 0, pretend = 0, frame = 16933340
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	add	sp, sp, #-16777216
	sub	sp, sp, #155648
	sub	sp, sp, #476
	ldr	r3, .L30
	sub	r2, fp, #12
	str	r0, [r2, r3]
	ldr	r3, .L30+4
	sub	r0, fp, #12
	str	r1, [r0, r3]
	ldr	r3, .L30+8
	sub	r1, fp, #12
	add	r3, r1, r3
	ldr	r2, .L30
	ldr	ip, .L30+4
	mov	r0, r3
	sub	r3, fp, #12
	ldr	r1, [r3, r2]
	sub	r3, fp, #12
	ldr	r2, [r3, ip]
	bl	initKernel(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L29
	ldr	r2, .L30+12
	mov	r3, #0
	sub	r0, fp, #12
	str	r3, [r0, r2]
	b	.L25
.L26:
	ldr	r3, .L30+12
	sub	r1, fp, #12
	ldr	r2, [r1, r3]
	mov	r3, #1
	str	r3, [r2, #32]
	ldr	r3, .L30+12
	sub	r2, fp, #12
	ldr	r1, [r2, r3]
	ldr	r3, .L30+8
	ldr	r2, .L30+16
	sub	r0, fp, #12
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r3, .L30+12
	sub	r1, fp, #12
	ldr	r3, [r1, r3]
	str	r3, [fp, #-16]
	ldr	r3, .L30+12
	sub	r2, fp, #12
	ldr	r3, [r2, r3]
	ldr	r3, [r3, #4]
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	activate(PLT)
	mov	r2, r0
	ldr	r3, .L30+20
	sub	r0, fp, #12
	add	lr, r0, r3
	mov	ip, r2
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1}
	stmia	lr, {r0, r1}
	ldr	r2, .L30+8
	sub	r1, fp, #12
	add	r2, r1, r2
	ldr	ip, .L30+20
	sub	r3, fp, #12
	add	ip, r3, ip
	ldr	r3, .L30+24
	sub	r0, fp, #12
	add	r3, r0, r3
	mov	r0, r2
	ldr	r1, [fp, #-16]
	mov	r2, ip
	bl	processRequest(PLT)
	ldr	r3, .L30+12
	sub	r1, fp, #12
	ldr	r3, [r1, r3]
	ldr	r3, [r3, #32]
	cmp	r3, #1
	bne	.L27
	ldr	r3, .L30+12
	sub	r0, fp, #12
	ldr	r2, [r0, r3]
	ldr	r3, .L30+8
	sub	r1, fp, #12
	add	r3, r1, r3
	mov	r0, r3
	mov	r1, r2
	bl	kernel_queuePush(PLT)
.L27:
	ldr	r3, .L30+8
	ldr	r2, .L30+16
	sub	r0, fp, #12
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
.L25:
	ldr	r3, .L30+8
	sub	r1, fp, #12
	add	r3, r1, r3
	ldr	r2, .L30+12
	sub	r0, fp, #12
	add	r2, r0, r2
	mov	r0, r3
	mov	r1, r2
	bl	kernel_queuePop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L26
.L29:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L31:
	.align	2
.L30:
	.word	-16933336
	.word	-16933340
	.word	-16933160
	.word	-16933332
	.word	155916
	.word	-16933184
	.word	-16933328
	.size	kernelRun, .-kernelRun
	.align	2
	.global	setTask
	.type	setTask, %function
setTask:
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #6
	add	r3, r1, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #28]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #20]
	ldr	r3, [fp, #-32]
	cmn	r3, #1
	bne	.L33
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #24]
	b	.L35
.L33:
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-32]
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #6
	add	r2, r1, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #24]
.L35:
	ldr	r2, [fp, #-16]
	mov	r3, #2
	str	r3, [r2, #32]
	ldr	r2, [fp, #-16]
	mov	r3, #208
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #4]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #17
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, .L37
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, r2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	sub	r2, r3, #44
	ldr	r3, [fp, #4]
	add	r3, r3, #2195456
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	sub	r2, r3, #48
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	sub	r2, r3, #48
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L38:
	.align	2
.L37:
	.word	155920
	.size	setTask, .-setTask
	.align	2
	.global	kernel_queuePush
	.type	kernel_queuePush, %function
kernel_queuePush:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #28]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	mov	r1, #155648
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L40
	mov	r2, #1
	ldr	r3, [fp, #-28]
	mov	r3, r2, asl r3
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	ldr	r3, .L44
	ldr	r0, [r2, r3]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #0
	mov	r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, .L44
	ldr	r3, [r2, r3]
	eor	r2, r1, r3
	ldr	r3, [fp, #-24]
	and	r3, r2, r3
	eor	r1, r0, r3
	ldr	r2, [fp, #-32]
	ldr	r3, .L44
	str	r1, [r2, r3]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	mov	r1, #155648
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	ldr	r1, .L44+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r2, [fp, #-36]
	mov	r3, #2
	str	r3, [r2, #32]
	b	.L42
.L40:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	mov	r1, #155648
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #36]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #40]
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r2, [fp, #-36]
	mov	r3, #2
	str	r3, [r2, #32]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	mov	r1, #155648
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
.L42:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L45:
	.align	2
.L44:
	.word	155904
	.word	155776
	.size	kernel_queuePush, .-kernel_queuePush
	.align	2
	.global	free_Push
	.type	free_Push, %function
free_Push:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r2, .L51
	ldr	r3, [r3, r2]
	cmp	r3, #0
	bne	.L47
	ldr	r1, [fp, #-20]
	ldr	r2, .L51
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L51+4
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #32]
	b	.L49
.L47:
	ldr	r2, [fp, #-20]
	ldr	r3, .L51
	ldr	r3, [r2, r3]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #36]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #40]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #32]
	ldr	r1, [fp, #-20]
	ldr	r2, .L51
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
.L49:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L52:
	.align	2
.L51:
	.word	155908
	.word	155912
	.size	free_Push, .-free_Push
	.align	2
	.global	kernel_queuePop_priority
	.type	kernel_queuePop_priority, %function
kernel_queuePop_priority:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L61
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L54
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L56
.L54:
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L61
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #36]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L57
	ldr	r2, [fp, #-40]
	mov	r3, #1
	mov	r3, r3, asl r2
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	ldr	r3, .L61+4
	ldr	r0, [r2, r3]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	mov	r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, .L61+4
	ldr	r3, [r2, r3]
	eor	r2, r1, r3
	ldr	r3, [fp, #-20]
	and	r3, r2, r3
	eor	r1, r0, r3
	ldr	r2, [fp, #-32]
	ldr	r3, .L61+4
	str	r1, [r2, r3]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L61
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	mov	r1, #155648
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	b	.L59
.L57:
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L61
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
.L59:
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-44]
.L56:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L62:
	.align	2
.L61:
	.word	155776
	.word	155904
	.size	kernel_queuePop_priority, .-kernel_queuePop_priority
	.align	2
	.global	free_Pop
	.type	free_Pop, %function
free_Pop:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldr	r2, .L71
	ldr	r3, [r3, r2]
	cmp	r3, #0
	bne	.L64
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L66
.L64:
	ldr	r2, [fp, #-24]
	ldr	r3, .L71
	ldr	r3, [r2, r3]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #36]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L67
	ldr	r1, [fp, #-24]
	ldr	r2, .L71
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L71+4
	mov	r3, #0
	str	r3, [r1, r2]
	b	.L69
.L67:
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r1, [fp, #-24]
	ldr	r2, .L71
	ldr	r3, [fp, #-16]
	str	r3, [r1, r2]
.L69:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-32]
.L66:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L72:
	.align	2
.L71:
	.word	155912
	.word	155908
	.size	free_Pop, .-free_Pop
	.align	2
	.global	kernel_queuePop
	.type	kernel_queuePop, %function
kernel_queuePop:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r3, .L89
	ldr	r3, [r2, r3]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L74
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L76
.L74:
	ldr	r3, [fp, #-20]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L77
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L79
.L77:
	mov	r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L80
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #16
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #16
	str	r3, [fp, #-16]
.L80:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L82
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #8
	str	r3, [fp, #-16]
.L82:
	ldr	r3, [fp, #-20]
	and	r3, r3, #15
	cmp	r3, #0
	bne	.L84
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #4
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	str	r3, [fp, #-16]
.L84:
	ldr	r3, [fp, #-20]
	and	r3, r3, #3
	cmp	r3, #0
	bne	.L86
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	str	r3, [fp, #-16]
.L86:
	ldr	r3, [fp, #-20]
	and	r2, r3, #1
	ldr	r3, [fp, #-16]
	rsb	r3, r2, r3
	str	r3, [fp, #-16]
.L79:
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	kernel_queuePop_priority(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
.L76:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L90:
	.align	2
.L89:
	.word	155904
	.size	kernel_queuePop, .-kernel_queuePop
	.ident	"GCC: (GNU) 4.0.2"
