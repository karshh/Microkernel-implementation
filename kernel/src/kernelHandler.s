	.file	"kernelHandler.c"
	.text
	.align	2
	.global	free_Pop
	.type	free_Pop, %function
free_Pop:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, .L10
	ldr	ip, [r0, lr]
	cmp	ip, #0
	mov	r2, ip
	beq	.L4
	ldr	r2, [ip, #52]
	cmp	r2, #0
	ldreq	r3, .L10+4
	movne	r3, #0
	strne	r3, [r2, #56]
	streq	r2, [r0, r3]
	mov	r3, #0
	streq	r2, [r0, lr]
	strne	r2, [r0, lr]
	str	r3, [ip, #52]
	mov	r2, #1
	str	r3, [ip, #56]
	str	ip, [r1, #0]
.L4:
	mov	r0, r2
	ldr	pc, [sp], #4
.L11:
	.align	2
.L10:
	.word	35080
	.word	35076
	.size	free_Pop, .-free_Pop
	.align	2
	.global	getNextTID
	.type	getNextTID, %function
getNextTID:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #4
	add	r3, sp, #4
	mov	r5, #0
	str	r5, [r3, #-4]!
	mov	r4, r1
	mov	r1, sp
	bl	free_Pop(PLT)
	cmp	r0, r5
	ldrne	r3, [sp, #0]
	mvn	r0, #0
	ldrne	r2, [r3, #32]
	movne	r0, r5
	strne	r2, [r4, #0]
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, pc}
	.size	getNextTID, .-getNextTID
	.align	2
	.global	exitKernel
	.type	exitKernel, %function
exitKernel:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	bl	disableInterrupts(PLT)
	ldr	r0, .L19
	bl	stopTimer(PLT)
	ldr	r0, .L19+4
	ldr	lr, [sp], #4
	b	stopTimer(PLT)
.L20:
	.align	2
.L19:
	.word	-2139029504
	.word	-2139029404
	.size	exitKernel, .-exitKernel
	.align	2
	.global	free_Push
	.type	free_Push, %function
free_Push:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L27
	mov	r3, #0
	ldr	r2, [r0, ip]
	@ lr needed for prologue
	cmp	r2, r3
	beq	.L26
	str	r1, [r2, #52]
	str	r2, [r1, #56]
	str	r3, [r1, #52]
	str	r1, [r0, ip]
	mov	r0, #1
	str	r3, [r1, #48]
	bx	lr
.L26:
	ldr	r3, .L27+4
	str	r1, [r0, ip]
	str	r1, [r0, r3]
	mov	r0, #1
	str	r2, [r1, #52]
	str	r2, [r1, #56]
	str	r2, [r1, #48]
	bx	lr
.L28:
	.align	2
.L27:
	.word	35076
	.word	35080
	.size	free_Push, .-free_Push
	.align	2
	.global	setTask
	.type	setTask, %function
setTask:
	@ args = 4, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	lr, r1
	add	r1, r2, r2, asl #4
	mov	r4, r0
	add	r1, r0, r1, asl #4
	add	r0, lr, lr, asl #4
	add	ip, r4, r0, asl #4
	cmn	r2, #1
	str	r3, [ip, #44]
	moveq	r3, #0
	str	r2, [ip, #36]
	streq	r3, [ip, #40]
	mvn	r2, #0
	mov	r3, #2
	str	r3, [ip, #48]
	sub	sp, sp, #4
	str	r2, [ip, #4]
	strne	r1, [ip, #40]
	ldr	r2, .L34
	mov	r1, lr, asl #17
	str	r1, [sp, #0]
	ldr	r3, [r4, r2]
	ldr	r1, [sp, #0]
	ldr	r2, [sp, #12]
	rsb	r3, r1, r3
	add	r2, r2, #2195456
	str	r2, [r3, #-44]
	ldr	r1, [ip, #24]
	mov	r0, ip
	str	r1, [r3, #-48]!
	str	r3, [ip, #0]
	add	sp, sp, #4
	ldmfd	sp!, {r4, pc}
.L35:
	.align	2
.L34:
	.word	35160
	.size	setTask, .-setTask
	.align	2
	.global	kernel_queuePush
	.type	kernel_queuePush, %function
kernel_queuePush:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, [r1, #44]
	mov	r4, r0
	add	r2, r0, r5, asl #2
	add	r0, r2, #34816
	ldr	lr, [r0, #0]
	mov	r6, #35072
	cmp	lr, #0
	mov	ip, r1
	beq	.L41
	mov	r3, #0
	str	r1, [lr, #52]
	str	lr, [r1, #56]
	str	r3, [r1, #52]
	str	r1, [r0, #0]
	add	r3, r3, #2
	mov	r0, #1
	str	r3, [r1, #48]
	ldmfd	sp!, {r4, r5, r6, pc}
.L41:
	ldr	r1, [r4, r6]
	ldr	r3, .L42
	str	ip, [r0, #0]
	str	ip, [r2, r3]
	mvn	r2, r1
	mov	r3, #1
	and	r2, r2, r3, asl r5
	mov	r0, #1
	eor	r1, r1, r2
	add	r3, r3, r3
	str	lr, [ip, #52]
	str	r1, [r4, r6]
	str	lr, [ip, #56]
	str	r3, [ip, #48]
	ldmfd	sp!, {r4, r5, r6, pc}
.L43:
	.align	2
.L42:
	.word	34944
	.size	kernel_queuePush, .-kernel_queuePush
	.section	.rodata.str1.4,"aMS",%progbits,1
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
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	r3, .L62
	ldr	sl, .L62+4
	mov	r4, #0
	str	r4, [r0, r3]
	sub	sp, sp, #8
.L59:
	add	sl, pc, sl
	mov	r5, r0
	mov	r8, r2
	mov	r7, r1
	bl	disableInterrupts(PLT)
	mov	r1, #2400
	mov	r0, r4
	bl	bwsetspeed(PLT)
	mov	r1, r4
	mov	r0, r4
	bl	bwsetfifo(PLT)
	ldr	r1, .L62+8
	mov	r0, #1
	bl	bwsetspeed(PLT)
	mov	r1, r4
	mov	r0, #1
	bl	bwsetfifo(PLT)
	bl	initHandlers(PLT)
	ldr	r1, .L62+12
	mvn	r0, #0
	add	r1, r5, r1
	mov	r2, r1, asr #31
	mov	r2, r2, lsr #28
	add	r3, r1, r2
	and	r3, r3, #15
	rsb	r3, r2, r3
	rsb	r6, r3, r1
	ldr	r2, .L62+16
	ldr	r3, .L62+20
	str	r4, [r5, r2]
	str	r0, [r5, r3]
	sub	r2, r2, #8
	add	r3, r3, #4
	str	r0, [r5, r3]
	str	r4, [r5, r2]
	add	r3, r3, #20
	add	r2, r2, #4
	str	r0, [r5, r3]
	str	r4, [r5, r2]
	sub	r3, r3, #16
	add	r2, r2, #80
	str	r0, [r5, r3]
	str	r6, [r5, r2]
	add	r3, r3, #4
	sub	r2, r2, #56
	str	r0, [r5, r3]
	str	r0, [r5, r2]
	add	r3, r3, #8
	add	r2, r2, #32
	str	r0, [r5, r3]
	str	r0, [r5, r2]
	add	r3, r3, #32
	add	r2, r2, #8
	str	r0, [r5, r3]
	str	r0, [r5, r2]
	add	r3, r3, #8
	add	r2, r2, #8
	str	r0, [r5, r3]
	mov	r1, r4
	str	r0, [r5, r2]
	str	r4, [sp, #4]
.L45:
	add	r0, r1, r1, asl #4
	mov	r2, r6
	add	r0, r5, r0, asl #4
	bl	initTD(PLT)
	ldr	r1, [sp, #4]
	mov	r0, r5
	add	r1, r1, r1, asl #4
	add	r1, r5, r1, asl #4
	bl	free_Push(PLT)
	ldr	r3, [sp, #4]
	add	r1, r3, #1
	cmp	r1, #127
	str	r1, [sp, #4]
	ble	.L45
	mov	r0, #0
	add	r3, r5, #34816
	mov	r2, r0
.L47:
	add	r2, r2, #1
	cmp	r2, #32
	str	r0, [r3, #0]
	str	r0, [r3, #128]
	add	r3, r3, #4
	bne	.L47
	add	r1, sp, #8
	mov	r3, #35072
	str	r0, [r1, #-4]!
	str	r0, [r5, r3]
	mov	r0, r5
	bl	getNextTID(PLT)
	subs	r4, r0, #0
	bne	.L60
	mov	r3, r7
	ldr	r1, [sp, #4]
	mvn	r2, #0
	mov	r0, r5
	str	r8, [sp, #0]
	bl	setTask(PLT)
	mov	r6, r0
	mov	r1, r6
	mov	r0, r5
	bl	kernel_queuePush(PLT)
	cmp	r0, #0
	beq	.L61
	ldr	r0, .L62+24
	bl	stopTimer(PLT)
	ldr	r0, .L62+28
	bl	stopTimer(PLT)
	ldr	r0, .L62+32
	bl	stopTimer(PLT)
	ldr	r0, .L62+28
	mov	r1, #508
	ldr	r2, .L62+36
	mov	r3, #1
	bl	startTimer(PLT)
	mov	r1, #508
	ldr	r2, .L62+40
	mov	r3, #1
	ldr	r0, .L62+24
	bl	startTimer(PLT)
	mov	r0, #1
	bl	toggleTimer3Interrupt(PLT)
	ldr	r0, .L62+32
	mov	r1, r4
	mov	r2, r4
	mov	r3, r4
	bl	startTimer(PLT)
	ldr	r3, .L62+44
	ldr	r2, .L62+48
	str	r4, [r5, r3]
	add	r3, r3, #8
	str	r4, [r5, r2]
	mov	r1, #1
	str	r4, [r5, r3]
	add	r2, r2, #12
	add	r3, r3, #32
	str	r4, [r5, r2]
	mov	r0, r4
	str	r1, [r5, r3]
.L51:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L60:
	ldr	r1, .L62+52
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mvn	r0, #0
	b	.L51
.L61:
	ldr	r1, .L62+56
	add	r0, r0, #1
	ldr	r2, [r6, #32]
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mvn	r0, #1
	b	.L51
.L63:
	.align	2
.L62:
	.word	35156
	.word	_GLOBAL_OFFSET_TABLE_-(.L59+8)
	.word	115200
	.word	16812379
	.word	35084
	.word	35088
	.word	-2139029504
	.word	-2139029376
	.word	-2139029404
	.word	5084689
	.word	5085
	.word	35116
	.word	35120
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	initKernel, .-initKernel
	.align	2
	.global	kernel_queuePop_priority
	.type	kernel_queuePop_priority, %function
kernel_queuePop_priority:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #4
	str	r2, [sp, #0]
	ldr	r3, [sp, #0]
	ldr	r6, .L73
	add	r3, r0, r3, asl #2
	ldr	r2, [r3, r6]
	mov	lr, r0
	cmp	r2, #0
	mov	r7, r1
	mov	r0, r2
	beq	.L67
	ldr	r3, [sp, #0]
	mov	r8, #35072
	add	r3, lr, r3, asl #2
	ldr	r5, [r3, r6]
	ldr	r4, [r5, #52]
	cmp	r4, #0
	beq	.L72
	mov	r2, #0
	str	r2, [r4, #56]
	ldr	r3, [sp, #0]
	add	r3, lr, r3, asl #2
	str	r4, [r3, r6]
.L70:
	mov	r3, #0
	str	r3, [r5, #52]
	mov	r0, #1
	str	r3, [r5, #56]
	str	r5, [r7, #0]
.L67:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L72:
	ldr	ip, [sp, #0]
	ldr	r1, [lr, r8]
	mov	r3, #1
	and	r3, r1, r3, asl ip
	ldr	r0, [sp, #0]
	ldr	r2, [sp, #0]
	eor	r1, r1, r3
	add	r2, lr, r2, asl #2
	add	r0, lr, r0, asl #2
	add	r2, r2, #34816
	str	r1, [lr, r8]
	str	r4, [r0, r6]
	str	r4, [r2, #0]
	b	.L70
.L74:
	.align	2
.L73:
	.word	34944
	.size	kernel_queuePop_priority, .-kernel_queuePop_priority
	.align	2
	.global	kernel_queuePop
	.type	kernel_queuePop, %function
kernel_queuePop:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, #35072
	mov	ip, r0
	ldr	r0, [r0, r3]
	cmp	r0, #0
	ldreq	pc, [sp], #4
	tst	r0, #1
	movne	r2, #0
	beq	.L92
	mov	r0, ip
	bl	kernel_queuePop_priority(PLT)
	mov	r0, #1
	ldr	pc, [sp], #4
.L92:
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	cmp	r3, #0
	moveq	r0, r0, lsr #16
	movne	r2, #1
	moveq	r2, #17
	tst	r0, #255
	moveq	r0, r0, lsr #8
	addeq	r2, r2, #8
	tst	r0, #15
	moveq	r0, r0, lsr #4
	addeq	r2, r2, #4
	tst	r0, #3
	moveq	r0, r0, lsr #2
	and	r3, r0, #1
	addeq	r2, r2, #2
	rsb	r2, r3, r2
	mov	r0, ip
	bl	kernel_queuePop_priority(PLT)
	mov	r0, #1
	ldr	pc, [sp], #4
	.size	kernel_queuePop, .-kernel_queuePop
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"PROCESS request failed[TID:%d]!\012\015\000"
	.text
	.align	2
	.global	kernelRun
	.type	kernelRun, %function
kernelRun:
	@ args = 0, pretend = 0, frame = 16812416
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	add	sp, sp, #-16777216
	sub	sp, sp, #35072
	ldr	r3, .L113
	sub	sp, sp, #128
	ldr	r6, .L113+4
	add	r3, sp, r3
	ldr	sl, .L113+8
	add	r6, r3, r6
.L109:
	add	sl, pc, sl
	mov	r2, r1
	mov	r1, r0
	mov	r0, r6
	bl	initKernel(PLT)
	cmp	r0, #0
	bne	.L108
	ldr	r3, .L113
	add	r3, sp, r3
	str	r0, [r3, #-4]!
	str	r3, [sp, #0]
	b	.L96
.L102:
	ldr	r3, .L113+12
	mov	r2, r7
	mov	r1, r5
	add	r3, sp, r3
	mov	r0, r6
	bl	processRequest(PLT)
	cmp	r0, #0
	mov	r0, r6
	beq	.L110
	add	r3, sp, #16777216
	add	r3, r3, #32768
	ldr	r1, [r3, #2428]
	ldr	r3, [r1, #48]
	cmp	r3, #1
	beq	.L111
.L106:
	mov	r3, #0
	str	r3, [r6, r8]
.L96:
	ldr	r1, [sp, #0]
	mov	r0, r6
	bl	kernel_queuePop(PLT)
	cmp	r0, #0
	mov	r9, #1
	ldr	fp, .L113+16
	ldr	r8, .L113+20
	mov	r0, #0
	beq	.L98
	ldr	r3, .L113+24
	ldr	r2, [r6, r3]
	cmp	r2, #2
	beq	.L98
	add	r3, sp, #16777216
	add	r3, r3, #32768
	ldr	r5, [r3, #2428]
	str	r9, [r5, #48]
	ldr	r3, [r5, #44]
	str	r5, [r6, r8]
	cmp	r3, #31
	beq	.L112
.L100:
	ldr	r0, [r6, r8]
	bl	activate(PLT)
	ldr	r3, [r6, fp]
	mov	r7, r0
	mov	r0, #0
	cmp	r3, r0
	beq	.L102
	ldr	r3, .L113+28
	ldr	r4, [r6, r3]
	bl	getTicks4(PLT)
	ldr	r3, .L113+32
	ldr	r2, [r6, r3]
	add	r3, r3, #4
	rsb	r0, r2, r0
	add	r4, r4, r0
	str	r4, [r6, r3]
	mov	r3, #0
	str	r3, [r6, fp]
	b	.L102
.L110:
	ldr	r1, .L113+36
	ldr	r2, [r5, #32]
	mov	r0, r9
	add	r1, sl, r1
	bl	bwprintf(PLT)
.L98:
	mov	r0, r6
	bl	exitKernel(PLT)
.L108:
	add	sp, sp, #2432
	add	sp, sp, #32768
	add	sp, sp, #16777216
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L112:
	ldr	r3, .L113+16
	str	r9, [r6, r3]
	bl	getTicks4(PLT)
	ldr	r3, .L113+32
	str	r0, [r6, r3]
	b	.L100
.L111:
	bl	kernel_queuePush(PLT)
	b	.L106
.L114:
	.align	2
.L113:
	.word	16812416
	.word	-16812412
	.word	_GLOBAL_OFFSET_TABLE_-(.L109+8)
	.word	16812400
	.word	35116
	.word	35084
	.word	35156
	.word	35132
	.word	35128
	.word	.LC2(GOTOFF)
	.size	kernelRun, .-kernelRun
	.ident	"GCC: (GNU) 4.0.2"
