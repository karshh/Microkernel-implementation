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
	ldr	r2, [r3, #32]
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
	.align	2
	.global	exitKernel
	.type	exitKernel, %function
exitKernel:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	bl	disableInterrupts(PLT)
	ldr	r0, .L8
	bl	stopTimer(PLT)
	ldr	r0, .L8+4
	bl	stopTimer(PLT)
	ldmfd	sp, {r3, fp, sp, pc}
.L9:
	.align	2
.L8:
	.word	-2139029504
	.word	-2139029404
	.size	exitKernel, .-exitKernel
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
	ldr	sl, .L24
.L23:
	add	sl, pc, sl
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	str	r2, [fp, #-44]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+4
	mov	r3, #0
	str	r3, [r1, r2]
	bl	disableInterrupts(PLT)
	mov	r0, #0
	mov	r1, #2400
	bl	bwsetspeed(PLT)
	mov	r0, #0
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mov	r0, #1
	ldr	r1, .L24+8
	bl	bwsetspeed(PLT)
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	bl	initHandlers(PLT)
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+12
	mov	r3, #0
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+16
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+20
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+24
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+28
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+32
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+36
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+40
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+44
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+48
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+52
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+56
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+60
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+64
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+68
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r3, [fp, #-36]
	add	r3, r3, #35072
	add	r3, r3, #92
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
	ldr	r2, .L24+72
	ldr	r3, [fp, #-28]
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L11
.L12:
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
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
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	ldr	r0, [fp, #-36]
	mov	r1, r3
	bl	free_Push(PLT)
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L11:
	ldr	r3, [fp, #-32]
	cmp	r3, #127
	ble	.L12
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L14
.L15:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-36]
	mov	r1, #34816
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-36]
	ldr	r1, .L24+76
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L14:
	ldr	r3, [fp, #-24]
	cmp	r3, #31
	ble	.L15
	ldr	r1, [fp, #-36]
	mov	r2, #35072
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
	beq	.L17
	mov	r0, #1
	ldr	r3, .L24+80
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #0
	str	r3, [fp, #-48]
	b	.L19
.L17:
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
	bne	.L20
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #32]
	mov	r0, #1
	ldr	r3, .L24+84
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #1
	str	r3, [fp, #-48]
	b	.L19
.L20:
	ldr	r0, .L24+88
	bl	stopTimer(PLT)
	ldr	r0, .L24+92
	bl	stopTimer(PLT)
	ldr	r0, .L24+96
	bl	stopTimer(PLT)
	ldr	r0, .L24+92
	mov	r1, #508
	ldr	r2, .L24+100
	mov	r3, #1
	bl	startTimer(PLT)
	ldr	r0, .L24+88
	mov	r1, #508
	ldr	r2, .L24+104
	mov	r3, #1
	bl	startTimer(PLT)
	mov	r0, #1
	bl	toggleTimer3Interrupt(PLT)
	ldr	r0, .L24+96
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	bl	startTimer(PLT)
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+108
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+112
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+116
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+120
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+4
	mov	r3, #1
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-48]
.L19:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L25:
	.align	2
.L24:
	.word	_GLOBAL_OFFSET_TABLE_-(.L23+8)
	.word	35156
	.word	115200
	.word	35084
	.word	35076
	.word	35080
	.word	35088
	.word	35092
	.word	35112
	.word	35096
	.word	35100
	.word	35104
	.word	35108
	.word	35136
	.word	35140
	.word	35144
	.word	35148
	.word	35152
	.word	35160
	.word	34944
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	-2139029504
	.word	-2139029376
	.word	-2139029404
	.word	5084689
	.word	5085
	.word	35116
	.word	35120
	.word	35124
	.word	35132
	.size	initKernel, .-initKernel
	.section	.rodata
	.align	2
.LC2:
	.ascii	"PROCESS request failed[TID:%d]!\012\015\000"
	.text
	.align	2
	.global	kernelRun
	.type	kernelRun, %function
kernelRun:
	@ args = 0, pretend = 0, frame = 16812428
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	add	sp, sp, #-16777216
	sub	sp, sp, #35072
	sub	sp, sp, #140
	ldr	sl, .L43
.L42:
	add	sl, pc, sl
	ldr	r3, .L43+4
	sub	r2, fp, #20
	str	r0, [r2, r3]
	ldr	r3, .L43+8
	sub	r0, fp, #20
	str	r1, [r0, r3]
	ldr	r3, .L43+12
	sub	r1, fp, #20
	add	r3, r1, r3
	ldr	r2, .L43+4
	ldr	ip, .L43+8
	mov	r0, r3
	sub	r3, fp, #20
	ldr	r1, [r3, r2]
	sub	r3, fp, #20
	ldr	r2, [r3, ip]
	bl	initKernel(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L41
	ldr	r2, .L43+16
	mov	r3, #0
	sub	r0, fp, #20
	str	r3, [r0, r2]
	b	.L29
.L30:
	ldr	r3, .L43+12
	ldr	r2, .L43+20
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	cmp	r3, #2
	beq	.L31
	ldr	r3, .L43+16
	sub	r0, fp, #20
	ldr	r2, [r0, r3]
	mov	r3, #1
	str	r3, [r2, #48]
	ldr	r3, .L43+16
	sub	r2, fp, #20
	ldr	r1, [r2, r3]
	ldr	r3, .L43+12
	ldr	r2, .L43+24
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r3, .L43+16
	sub	r1, fp, #20
	ldr	r3, [r1, r3]
	str	r3, [fp, #-24]
	ldr	r3, .L43+12
	ldr	r2, .L43+24
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #44]
	cmp	r3, #31
	bne	.L33
	ldr	r3, .L43+12
	ldr	r2, .L43+28
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r0, #0
	bl	getTicks4(PLT)
	mov	r1, r0
	ldr	r3, .L43+12
	ldr	r2, .L43+32
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
.L33:
	ldr	r3, .L43+12
	ldr	r2, .L43+24
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	activate(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, .L43+12
	ldr	r2, .L43+28
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L35
	ldr	r3, .L43+12
	ldr	r2, .L43+36
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r4, [r3, #0]
	mov	r0, #0
	bl	getTicks4(PLT)
	mov	r1, r0
	ldr	r3, .L43+12
	ldr	r2, .L43+32
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	rsb	r3, r3, r1
	add	r1, r4, r3
	ldr	r3, .L43+12
	ldr	r2, .L43+36
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r3, .L43+12
	ldr	r2, .L43+28
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
.L35:
	ldr	r3, .L43+12
	sub	r2, fp, #20
	add	r3, r2, r3
	ldr	ip, .L43+40
	sub	r0, fp, #20
	add	ip, r0, ip
	mov	r0, r3
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-28]
	mov	r3, ip
	bl	processRequest(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L37
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #32]
	mov	r0, #1
	ldr	r3, .L43+44
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L31
.L37:
	ldr	r3, .L43+16
	sub	r1, fp, #20
	ldr	r3, [r1, r3]
	ldr	r3, [r3, #48]
	cmp	r3, #1
	bne	.L39
	ldr	r3, .L43+16
	sub	r0, fp, #20
	ldr	r2, [r0, r3]
	ldr	r3, .L43+12
	sub	r1, fp, #20
	add	r3, r1, r3
	mov	r0, r3
	mov	r1, r2
	bl	kernel_queuePush(PLT)
.L39:
	ldr	r3, .L43+12
	ldr	r2, .L43+24
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
.L29:
	ldr	r3, .L43+12
	sub	r1, fp, #20
	add	r3, r1, r3
	ldr	r2, .L43+16
	sub	r0, fp, #20
	add	r2, r0, r2
	mov	r0, r3
	mov	r1, r2
	bl	kernel_queuePop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L30
.L31:
	ldr	r3, .L43+12
	sub	r1, fp, #20
	add	r3, r1, r3
	mov	r0, r3
	bl	exitKernel(PLT)
.L41:
	sub	sp, fp, #20
	ldmfd	sp, {r4, sl, fp, sp, pc}
.L44:
	.align	2
.L43:
	.word	_GLOBAL_OFFSET_TABLE_-(.L42+8)
	.word	-16812424
	.word	-16812428
	.word	-16812404
	.word	-16812420
	.word	35156
	.word	35084
	.word	35116
	.word	35128
	.word	35132
	.word	-16812416
	.word	.LC2(GOTOFF)
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
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r1, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #44]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #36]
	ldr	r3, [fp, #-32]
	cmn	r3, #1
	bne	.L46
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #40]
	b	.L48
.L46:
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-32]
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r2, r1, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #40]
.L48:
	ldr	r2, [fp, #-16]
	mov	r3, #2
	str	r3, [r2, #48]
	ldr	r2, [fp, #-16]
	mvn	r3, #0
	str	r3, [r2, #4]
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #17
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, .L50
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
	ldr	r3, [r3, #24]
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
.L51:
	.align	2
.L50:
	.word	35160
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
	ldr	r3, [r3, #44]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	mov	r1, #34816
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L53
	mov	r2, #1
	ldr	r3, [fp, #-28]
	mov	r3, r2, asl r3
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	mov	r3, #35072
	ldr	r0, [r2, r3]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #0
	mov	r1, r3
	ldr	r2, [fp, #-32]
	mov	r3, #35072
	ldr	r3, [r2, r3]
	eor	r2, r1, r3
	ldr	r3, [fp, #-24]
	and	r3, r2, r3
	eor	r1, r0, r3
	ldr	r2, [fp, #-32]
	mov	r3, #35072
	str	r1, [r2, r3]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	mov	r1, #34816
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	ldr	r1, .L57
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #52]
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r2, [fp, #-36]
	mov	r3, #2
	str	r3, [r2, #48]
	b	.L55
.L53:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	mov	r1, #34816
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #52]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #56]
	ldr	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [r2, #52]
	ldr	r2, [fp, #-36]
	mov	r3, #2
	str	r3, [r2, #48]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	mov	r1, #34816
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-36]
	str	r3, [r2, #0]
.L55:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L58:
	.align	2
.L57:
	.word	34944
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
	ldr	r2, .L64
	ldr	r3, [r3, r2]
	cmp	r3, #0
	bne	.L60
	ldr	r1, [fp, #-20]
	ldr	r2, .L64
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L64+4
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #52]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #48]
	b	.L62
.L60:
	ldr	r2, [fp, #-20]
	ldr	r3, .L64
	ldr	r3, [r2, r3]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #52]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #56]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #52]
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #48]
	ldr	r1, [fp, #-20]
	ldr	r2, .L64
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
.L62:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L65:
	.align	2
.L64:
	.word	35076
	.word	35080
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
	ldr	r1, .L74
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L67
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L69
.L67:
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L74
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #52]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L70
	ldr	r2, [fp, #-40]
	mov	r3, #1
	mov	r3, r3, asl r2
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mov	r3, #35072
	ldr	r0, [r2, r3]
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	mov	r1, r3
	ldr	r2, [fp, #-32]
	mov	r3, #35072
	ldr	r3, [r2, r3]
	eor	r2, r1, r3
	ldr	r3, [fp, #-20]
	and	r3, r2, r3
	eor	r1, r0, r3
	ldr	r2, [fp, #-32]
	mov	r3, #35072
	str	r1, [r2, r3]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L74
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	mov	r1, #34816
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	b	.L72
.L70:
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L74
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
.L72:
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #52]
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-44]
.L69:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L75:
	.align	2
.L74:
	.word	34944
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
	ldr	r2, .L84
	ldr	r3, [r3, r2]
	cmp	r3, #0
	bne	.L77
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L79
.L77:
	ldr	r2, [fp, #-24]
	ldr	r3, .L84
	ldr	r3, [r2, r3]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #52]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L80
	ldr	r1, [fp, #-24]
	ldr	r2, .L84
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L84+4
	mov	r3, #0
	str	r3, [r1, r2]
	b	.L82
.L80:
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r1, [fp, #-24]
	ldr	r2, .L84
	ldr	r3, [fp, #-16]
	str	r3, [r1, r2]
.L82:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #52]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-32]
.L79:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L85:
	.align	2
.L84:
	.word	35080
	.word	35076
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
	mov	r3, #35072
	ldr	r3, [r2, r3]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L87
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L89
.L87:
	ldr	r3, [fp, #-20]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L90
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L92
.L90:
	mov	r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L93
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #16
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #16
	str	r3, [fp, #-16]
.L93:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L95
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #8
	str	r3, [fp, #-16]
.L95:
	ldr	r3, [fp, #-20]
	and	r3, r3, #15
	cmp	r3, #0
	bne	.L97
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #4
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	str	r3, [fp, #-16]
.L97:
	ldr	r3, [fp, #-20]
	and	r3, r3, #3
	cmp	r3, #0
	bne	.L99
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	str	r3, [fp, #-16]
.L99:
	ldr	r3, [fp, #-20]
	and	r2, r3, #1
	ldr	r3, [fp, #-16]
	rsb	r3, r2, r3
	str	r3, [fp, #-16]
.L92:
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	kernel_queuePop_priority(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
.L89:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_queuePop, .-kernel_queuePop
	.ident	"GCC: (GNU) 4.0.2"
