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
	bl	disableInterrupts(PLT)
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	bl	initHandlers(PLT)
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+4
	mov	r3, #0
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+8
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+12
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+16
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+20
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+24
	mvn	r3, #0
	str	r3, [r1, r2]
	ldr	r3, [fp, #-36]
	add	r3, r3, #35072
	add	r3, r3, #52
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
	ldr	r2, .L24+28
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
	ldr	r1, .L24+32
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
	ldr	r3, .L24+36
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
	ldr	r3, .L24+40
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mvn	r3, #1
	str	r3, [fp, #-48]
	b	.L19
.L20:
	ldr	r0, .L24+44
	bl	stopTimer(PLT)
	ldr	r0, .L24+48
	bl	stopTimer(PLT)
	ldr	r0, .L24+52
	bl	stopTimer(PLT)
	ldr	r0, .L24+48
	mov	r1, #508
	ldr	r2, .L24+56
	mov	r3, #1
	bl	startTimer(PLT)
	ldr	r0, .L24+44
	mov	r1, #508
	ldr	r2, .L24+60
	mov	r3, #1
	bl	startTimer(PLT)
	mov	r0, #1
	bl	toggleTimer3Interrupt(PLT)
	ldr	r0, .L24+52
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	bl	startTimer(PLT)
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+64
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+68
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+72
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-36]
	ldr	r2, .L24+76
	mov	r3, #0
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
	.word	35084
	.word	35076
	.word	35080
	.word	35088
	.word	35092
	.word	35116
	.word	35120
	.word	34944
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	-2139029504
	.word	-2139029376
	.word	-2139029404
	.word	5084689
	.word	5085
	.word	35096
	.word	35100
	.word	35104
	.word	35112
	.size	initKernel, .-initKernel
	.global	__udivsi3
	.section	.rodata
	.align	2
.LC2:
	.ascii	"\033[s\033[?25l\033[1;90H idle:%d%% \033[u\033[?25h"
	.ascii	"\000"
	.align	2
.LC3:
	.ascii	"PROCESS request failed!\012\015\000"
	.text
	.align	2
	.global	kernelRun
	.type	kernelRun, %function
kernelRun:
	@ args = 0, pretend = 0, frame = 16812396
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	add	sp, sp, #-16777216
	sub	sp, sp, #35072
	sub	sp, sp, #108
	ldr	sl, .L45
.L44:
	add	sl, pc, sl
	ldr	r3, .L45+4
	sub	r2, fp, #20
	str	r0, [r2, r3]
	ldr	r3, .L45+8
	sub	r0, fp, #20
	str	r1, [r0, r3]
	ldr	r3, .L45+12
	sub	r1, fp, #20
	add	r3, r1, r3
	ldr	r2, .L45+4
	ldr	ip, .L45+8
	mov	r0, r3
	sub	r3, fp, #20
	ldr	r1, [r3, r2]
	sub	r3, fp, #20
	ldr	r2, [r3, ip]
	bl	initKernel(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L43
	ldr	r3, .L45+16
	mov	r2, #0
	sub	r0, fp, #20
	str	r2, [r0, r3]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L29
.L30:
	ldr	r3, .L45+16
	sub	r1, fp, #20
	ldr	r2, [r1, r3]
	mov	r3, #1
	str	r3, [r2, #48]
	ldr	r3, .L45+16
	sub	r2, fp, #20
	ldr	r1, [r2, r3]
	ldr	r3, .L45+12
	ldr	r2, .L45+20
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r3, .L45+16
	sub	r1, fp, #20
	ldr	r3, [r1, r3]
	str	r3, [fp, #-28]
	ldr	r3, .L45+12
	ldr	r2, .L45+20
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	ldr	r3, [r3, #44]
	cmp	r3, #31
	bne	.L31
	ldr	r3, .L45+12
	ldr	r2, .L45+24
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r0, #0
	bl	getTicks4(PLT)
	mov	r1, r0
	ldr	r3, .L45+12
	ldr	r2, .L45+28
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
.L31:
	ldr	r3, .L45+12
	ldr	r2, .L45+20
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	activate(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, .L45+12
	ldr	r2, .L45+24
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L33
	ldr	r3, .L45+12
	ldr	r2, .L45+32
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r4, [r3, #0]
	mov	r0, #0
	bl	getTicks4(PLT)
	mov	r1, r0
	ldr	r3, .L45+12
	ldr	r2, .L45+28
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	rsb	r3, r3, r1
	add	r1, r4, r3
	ldr	r3, .L45+12
	ldr	r2, .L45+32
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r3, r3, r2
	str	r1, [r3, #0]
	ldr	r3, .L45+12
	ldr	r2, .L45+24
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
.L33:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L35
	ldr	r3, .L45+12
	ldr	r2, .L45+32
	sub	r0, fp, #20
	add	r3, r0, r3
	add	r3, r3, r2
	ldr	r2, [r3, #0]
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
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L35
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-32]
	mov	r0, #1
	ldr	r3, .L45+36
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	bwprintf(PLT)
.L35:
	ldr	r3, .L45+12
	sub	r1, fp, #20
	add	r3, r1, r3
	ldr	ip, .L45+40
	sub	r2, fp, #20
	add	ip, r2, ip
	mov	r0, r3
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-36]
	mov	r3, ip
	bl	processRequest(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L38
	mov	r0, #1
	ldr	r3, .L45+44
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L40
.L38:
	ldr	r3, .L45+16
	sub	r0, fp, #20
	ldr	r3, [r0, r3]
	ldr	r3, [r3, #48]
	cmp	r3, #1
	bne	.L41
	ldr	r3, .L45+16
	sub	r1, fp, #20
	ldr	r2, [r1, r3]
	ldr	r3, .L45+12
	sub	r0, fp, #20
	add	r3, r0, r3
	mov	r0, r3
	mov	r1, r2
	bl	kernel_queuePush(PLT)
.L41:
	ldr	r3, .L45+12
	ldr	r2, .L45+20
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
.L29:
	ldr	r3, .L45+12
	sub	r2, fp, #20
	add	r3, r2, r3
	ldr	r2, .L45+16
	sub	r0, fp, #20
	add	r2, r0, r2
	mov	r0, r3
	mov	r1, r2
	bl	kernel_queuePop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L30
.L40:
	ldr	r3, .L45+12
	sub	r1, fp, #20
	add	r3, r1, r3
	mov	r0, r3
	bl	exitKernel(PLT)
.L43:
	sub	sp, fp, #20
	ldmfd	sp, {r4, sl, fp, sp, pc}
.L46:
	.align	2
.L45:
	.word	_GLOBAL_OFFSET_TABLE_-(.L44+8)
	.word	-16812392
	.word	-16812396
	.word	-16812372
	.word	-16812388
	.word	35084
	.word	35096
	.word	35108
	.word	35112
	.word	.LC2(GOTOFF)
	.word	-16812384
	.word	.LC3(GOTOFF)
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
	bne	.L48
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #40]
	b	.L50
.L48:
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-32]
	mov	r3, r2
	mov	r3, r3, asl #4
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r2, r1, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #40]
.L50:
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
	ldr	r3, .L52
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
.L53:
	.align	2
.L52:
	.word	35120
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
	bne	.L55
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
	ldr	r1, .L59
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
	b	.L57
.L55:
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
.L57:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L60:
	.align	2
.L59:
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
	ldr	r2, .L66
	ldr	r3, [r3, r2]
	cmp	r3, #0
	bne	.L62
	ldr	r1, [fp, #-20]
	ldr	r2, .L66
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L66+4
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
	b	.L64
.L62:
	ldr	r2, [fp, #-20]
	ldr	r3, .L66
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
	ldr	r2, .L66
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
.L64:
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L67:
	.align	2
.L66:
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
	ldr	r1, .L76
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L69
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L71
.L69:
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L76
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
	bne	.L72
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
	ldr	r1, .L76
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
	b	.L74
.L72:
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-32]
	ldr	r1, .L76
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
.L74:
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
.L71:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L77:
	.align	2
.L76:
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
	ldr	r2, .L86
	ldr	r3, [r3, r2]
	cmp	r3, #0
	bne	.L79
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L81
.L79:
	ldr	r2, [fp, #-24]
	ldr	r3, .L86
	ldr	r3, [r2, r3]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #52]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L82
	ldr	r1, [fp, #-24]
	ldr	r2, .L86
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-24]
	ldr	r2, .L86+4
	mov	r3, #0
	str	r3, [r1, r2]
	b	.L84
.L82:
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #56]
	ldr	r1, [fp, #-24]
	ldr	r2, .L86
	ldr	r3, [fp, #-16]
	str	r3, [r1, r2]
.L84:
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
.L81:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L87:
	.align	2
.L86:
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
	bne	.L89
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L91
.L89:
	ldr	r3, [fp, #-20]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L92
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L94
.L92:
	mov	r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	bne	.L95
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #16
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #16
	str	r3, [fp, #-16]
.L95:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L97
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #8
	str	r3, [fp, #-16]
.L97:
	ldr	r3, [fp, #-20]
	and	r3, r3, #15
	cmp	r3, #0
	bne	.L99
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #4
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	str	r3, [fp, #-16]
.L99:
	ldr	r3, [fp, #-20]
	and	r3, r3, #3
	cmp	r3, #0
	bne	.L101
	ldr	r3, [fp, #-20]
	mov	r3, r3, lsr #2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	str	r3, [fp, #-16]
.L101:
	ldr	r3, [fp, #-20]
	and	r2, r3, #1
	ldr	r3, [fp, #-16]
	rsb	r3, r2, r3
	str	r3, [fp, #-16]
.L94:
	ldr	r3, [fp, #-16]
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	kernel_queuePop_priority(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
.L91:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	kernel_queuePop, .-kernel_queuePop
	.ident	"GCC: (GNU) 4.0.2"
