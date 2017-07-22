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
	ldr	r2, [ip, #8]
	cmp	r2, #0
	ldreq	r3, .L10+4
	movne	r3, #0
	streq	r2, [r0, r3]
	strne	r3, [r2, #12]
	mov	r3, #0
	streq	r2, [r0, lr]
	strne	r2, [r0, lr]
	str	r3, [ip, #8]
	str	r3, [ip, #12]
	mov	r2, #1
	str	ip, [r1, #0]
.L4:
	mov	r0, r2
	ldr	pc, [sp], #4
.L11:
	.align	2
.L10:
	.word	11744
	.word	11740
	.size	free_Pop, .-free_Pop
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"getNextTID: WE RAN OUT OF FREE TID's. PAILY:IMPLIME"
	.ascii	"NT DESTROY, DIVIDE STACK FARTHER OR ALLOCATE MORE S"
	.ascii	"PACE!\015\012\000"
	.text
	.align	2
	.global	getNextTID
	.type	getNextTID, %function
getNextTID:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L19
	sub	sp, sp, #4
	mov	r5, #0
	add	r3, sp, #4
.L17:
	add	sl, pc, sl
	str	r5, [r3, #-4]!
	mov	r4, r1
	mov	r1, sp
	bl	free_Pop(PLT)
	ldr	r2, .L19+4
	cmp	r0, r5
	mov	r1, #1
	add	r2, sl, r2
	beq	.L18
	ldr	r3, [sp, #0]
	mov	r0, r5
	ldr	r2, [r3, #68]
	str	r2, [r4, #0]
.L15:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, sl, pc}
.L18:
	bl	bwassert(PLT)
	mvn	r0, #0
	b	.L15
.L20:
	.align	2
.L19:
	.word	_GLOBAL_OFFSET_TABLE_-(.L17+8)
	.word	.LC0(GOTOFF)
	.size	getNextTID, .-getNextTID
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
	str	r1, [r2, #8]
	str	r2, [r1, #12]
	str	r3, [r1, #8]
	str	r1, [r0, ip]
	mov	r0, #1
	str	r3, [r1, #84]
	bx	lr
.L26:
	ldr	r3, .L27+4
	str	r1, [r0, ip]
	str	r1, [r0, r3]
	mov	r0, #1
	str	r2, [r1, #84]
	str	r2, [r1, #8]
	str	r2, [r1, #12]
	bx	lr
.L28:
	.align	2
.L27:
	.word	11740
	.word	11744
	.size	free_Push, .-free_Push
	.align	2
	.global	setTask
	.type	setTask, %function
setTask:
	@ args = 4, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	add	ip, r1, r1, asl #2
	mov	r4, r1
	mov	r5, r0
	add	ip, r4, ip, asl #1
	add	r0, r0, #396
	add	lr, r0, ip, asl #3
	cmn	r2, #1
	str	r3, [lr, #80]
	add	r1, r2, r2, asl #2
	moveq	r3, #0
	str	r2, [lr, #72]
	add	r1, r2, r1, asl #1
	streq	r3, [lr, #76]
	ldr	r2, .L34
	mvn	r3, #0
	str	r3, [lr, #4]
	sub	sp, sp, #4
	mov	ip, r4, asl #17
	ldr	r3, [r5, r2]
	add	r1, r0, r1, asl #3
	str	ip, [sp, #0]
	mov	r2, #2
	strne	r1, [lr, #76]
	str	r2, [lr, #84]
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #0]
	add	r1, r1, #2195456
	rsb	r3, r2, r3
	str	r1, [r3, #-44]
	ldr	r2, [lr, #60]
	mov	r0, lr
	str	r2, [r3, #-48]!
	str	r3, [lr, #0]
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, pc}
.L35:
	.align	2
.L34:
	.word	11736
	.size	setTask, .-setTask
	.align	2
	.global	kernel_queuePush
	.type	kernel_queuePush, %function
kernel_queuePush:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r5, [r1, #80]
	mov	ip, r1
	add	r4, r0, r5, asl #2
	ldr	lr, [r4, #140]
	cmp	lr, #0
	beq	.L41
	mov	r3, #2
	mov	r2, #0
	mov	r0, #1
	str	r1, [lr, #8]
	str	r3, [r1, #84]
	str	r2, [r1, #8]
	str	r1, [r4, #140]
	ldmfd	sp!, {r4, r5, pc}
.L41:
	ldr	r1, [r0, #8]
	mov	r3, #2
	str	r3, [ip, #84]
	mvn	r2, r1
	sub	r3, r3, #1
	and	r2, r2, r3, asl r5
	eor	r1, r1, r2
	str	r1, [r0, #8]
	mov	r0, #1
	str	ip, [r4, #268]
	str	ip, [r4, #140]
	str	lr, [ip, #8]
	ldmfd	sp!, {r4, r5, pc}
	.size	kernel_queuePush, .-kernel_queuePush
	.align	2
	.global	exitKernel
	.type	exitKernel, %function
exitKernel:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	bl	disableInterrupts(PLT)
	ldr	r0, .L44
	bl	stopTimer(PLT)
	ldr	r0, .L44+4
	ldr	lr, [sp], #4
	b	stopTimer(PLT)
.L45:
	.align	2
.L44:
	.word	-2139029504
	.word	-2139029404
	.size	exitKernel, .-exitKernel
	.align	2
	.global	kernel_queuePop
	.type	kernel_queuePop, %function
kernel_queuePop:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r4, r0
	ldr	r0, [r0, #8]
	mov	r5, r1
	rsb	r2, r0, #0
	and	r2, r0, r2
	rsb	r3, r2, r2, asl #9
	add	r3, r2, r3, asl #3
	rsb	r3, r2, r3, asl #5
	add	r3, r2, r3, asl #2
	rsb	r3, r3, r3, asl #4
	add	r2, r2, r3, asl #4
	mov	r2, r2, lsr #27
	cmp	r0, #0
	add	r3, r4, r2, asl #2
	beq	.L47
	ldr	r1, [r3, #12]
	add	r2, r4, r1, asl #2
	ldr	lr, [r2, #268]
	cmp	lr, #0
	beq	.L47
	ldr	ip, [lr, #8]
	cmp	ip, #0
	moveq	r3, #1
	andeq	r3, r0, r3, asl r1
	eoreq	r3, r0, r3
	streq	r3, [r4, #8]
	mov	r0, #1
	mov	r3, #0
	streq	ip, [r2, #140]
	streq	ip, [r2, #268]
	strne	ip, [r2, #268]
	str	r3, [lr, #8]
	str	lr, [r5, #0]
	ldmfd	sp!, {r4, r5, pc}
.L47:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, pc}
	.size	kernel_queuePop, .-kernel_queuePop
	.align	2
	.global	kernelExecute
	.type	kernelExecute, %function
kernelExecute:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
	ldr	fp, .L75
	mov	r5, r0
	add	r9, r0, #4
	mov	r8, #0
	b	.L56
.L59:
	ldr	r1, [r5, #4]
	mov	r2, r6
	mov	r0, r5
	bl	processRequest(PLT)
	ldr	r0, [r5, #4]
	ldr	r1, [r0, #84]
	cmp	r1, #1
	beq	.L72
.L61:
	ldr	r3, [r5, #0]
	cmp	r3, #2
	beq	.L65
.L56:
	ldr	lr, [r5, #8]
	cmp	lr, #0
	beq	.L65
	rsb	r2, lr, #0
	and	r2, lr, r2
	rsb	r3, r2, r2, asl #9
	add	r3, r2, r3, asl #3
	rsb	r3, r2, r3, asl #5
	add	r3, r2, r3, asl #2
	rsb	r3, r3, r3, asl #4
	add	r2, r2, r3, asl #4
	mov	r2, r2, lsr #27
	add	r2, r5, r2, asl #2
	ldr	r2, [r2, #12]
	add	ip, r5, r2, asl #2
	ldr	r0, [ip, #268]
	cmp	r0, #0
	beq	.L65
	ldr	r1, [r0, #8]
	cmp	r1, #0
	moveq	r3, #1
	andeq	r3, lr, r3, asl r2
	streq	r1, [ip, #140]
	streq	r1, [ip, #268]
	strne	r1, [ip, #268]
	str	r8, [r0, #8]
	str	r0, [r9, #0]
	eoreq	r3, lr, r3
	ldr	r2, [r5, #4]
	streq	r3, [r5, #8]
	ldr	r3, [r2, #80]
	mov	r1, #1
	cmp	r3, #31
	str	r1, [r2, #84]
	beq	.L73
.L58:
	mov	r0, r2
	bl	activate(PLT)
	ldr	r7, .L75+4
	mov	r6, r0
	ldr	r3, [r5, r7]
	cmp	r3, #0
	beq	.L59
	mov	r0, #0
	ldr	r4, [r5, fp]
	bl	getTicks4(PLT)
	ldr	r3, .L75+8
	ldr	r1, [r5, #4]
	ldr	r2, [r5, r3]
	rsb	r0, r2, r0
	add	r4, r4, r0
	str	r4, [r5, fp]
	mov	r2, r6
	str	r8, [r5, r7]
	mov	r0, r5
	bl	processRequest(PLT)
	ldr	r0, [r5, #4]
	ldr	r1, [r0, #84]
	cmp	r1, #1
	bne	.L61
.L72:
	ldr	r4, [r0, #80]
	add	lr, r5, r4, asl #2
	ldr	ip, [lr, #140]
	cmp	ip, #0
	beq	.L74
	mov	r3, #2
	str	r3, [r0, #84]
	ldr	r3, [r5, #0]
	str	r0, [ip, #8]
	cmp	r3, #2
	str	r8, [r0, #8]
	str	r0, [lr, #140]
	bne	.L56
.L65:
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
	b	exitKernel(PLT)
.L73:
	ldr	r3, .L75+4
	mov	r0, #0
	str	r1, [r5, r3]
	bl	getTicks4(PLT)
	ldr	r3, .L75+8
	ldr	r2, [r5, #4]
	str	r0, [r5, r3]
	b	.L58
.L74:
	ldr	r3, [r5, #8]
	str	r0, [lr, #268]
	mvn	r2, r3
	and	r2, r2, r1, asl r4
	add	r1, r1, #1
	eor	r3, r3, r2
	str	r0, [lr, #140]
	str	r1, [r0, #84]
	str	r3, [r5, #8]
	str	ip, [r0, #8]
	b	.L61
.L76:
	.align	2
.L75:
	.word	11704
	.word	11688
	.word	11700
	.size	kernelExecute, .-kernelExecute
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"error getting TID\012\015\000"
	.text
	.align	2
	.global	initKernel
	.type	initKernel, %function
initKernel:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r8, r3
	ldr	sl, .L95
	ldr	r3, .L95+4
	mov	r4, #0
	str	r8, [r0, r3]
.L92:
	add	sl, pc, sl
	sub	sp, sp, #8
	str	r4, [r0, #0]
	mov	r7, r0
	mov	fp, r2
	mov	r9, r1
	bl	disableInterrupts(PLT)
	mov	r1, #2400
	mov	r0, r4
	bl	bwsetspeed(PLT)
	mov	r1, r4
	mov	r0, r4
	bl	bwsetfifo(PLT)
	ldr	r1, .L95+8
	mov	r0, #1
	bl	bwsetspeed(PLT)
	mov	r1, r4
	mov	r0, #1
	bl	bwsetfifo(PLT)
	bl	initHandlers(PLT)
	ldr	r3, .L95+12
	ldr	r2, .L95+16
	mvn	r1, #0
	str	r1, [r7, r3]
	str	r4, [r7, r2]
	add	r3, r3, #4
	add	r2, r2, #4
	str	r1, [r7, r3]
	str	r4, [r7, r2]
	add	r3, r3, #20
	sub	r2, r2, #76
	str	r1, [r7, r3]
	str	r1, [r7, r2]
	sub	r3, r3, #12
	add	r2, r2, #8
	str	r1, [r7, r3]
	str	r1, [r7, r2]
	add	r3, r3, #8
	add	r2, r2, #32
	str	r1, [r7, r3]
	str	r1, [r7, r2]
	add	r3, r3, #32
	add	r2, r2, #8
	str	r1, [r7, r3]
	str	r1, [r7, r2]
	add	r3, r3, #8
	add	r2, r2, #8
	str	r1, [r7, r3]
	mov	ip, r4
	str	r1, [r7, r2]
	str	r4, [r7, #4]
	mov	r5, r4
	add	r6, r7, #396
.L78:
	add	r0, ip, ip, asl #2
	add	r0, ip, r0, asl #1
	mov	r1, ip
	mov	r2, r8
	add	r0, r6, r0, asl #3
	bl	initTD(PLT)
	add	r4, r4, #1
	add	r1, r5, r6
	mov	r0, r7
	bl	free_Push(PLT)
	cmp	r4, #128
	mov	ip, r4
	add	r5, r5, #88
	bne	.L78
	mov	r4, #0
	mov	r3, r7
	mov	r2, r4
.L81:
	add	r2, r2, #1
	cmp	r2, #32
	str	r4, [r3, #140]
	str	r4, [r3, #268]
	add	r3, r3, #4
	bne	.L81
	add	r1, sp, #8
	str	r4, [r1, #-4]!
	str	r4, [r7, #8]
	mov	r0, r7
	bl	free_Pop(PLT)
	cmp	r0, #0
	beq	.L93
	ldr	r2, [sp, #4]
	mov	r3, r9
	ldr	r1, [r2, #68]
	mov	r0, r7
	mvn	r2, #0
	str	fp, [sp, #0]
	bl	setTask(PLT)
	ldr	lr, [r0, #80]
	add	ip, r7, lr, asl #2
	ldr	r3, [ip, #140]
	cmp	r3, #0
	beq	.L94
	str	r0, [r3, #8]
	mov	r3, #2
	str	r4, [r0, #8]
	str	r3, [r0, #84]
	str	r0, [ip, #140]
.L88:
	ldr	r0, .L95+20
	bl	stopTimer(PLT)
	ldr	r0, .L95+24
	bl	stopTimer(PLT)
	ldr	r0, .L95+28
	bl	stopTimer(PLT)
	ldr	r0, .L95+24
	mov	r1, #508
	ldr	r2, .L95+32
	mov	r3, #1
	bl	startTimer(PLT)
	mov	r1, #508
	ldr	r2, .L95+36
	mov	r3, #1
	ldr	r0, .L95+20
	bl	startTimer(PLT)
	mov	r0, #1
	bl	toggleTimer3Interrupt(PLT)
	mov	r1, #0
	mov	r2, r1
	mov	r3, r1
	ldr	r0, .L95+28
	bl	startTimer(PLT)
	ldr	r3, .L95+40
	mov	r1, #0
	str	r1, [r7, r3]
	add	r3, r3, #4
	str	r1, [r7, r3]
	mov	r2, #28
	add	r3, r3, #4
	str	r1, [r7, r3]
	str	r2, [r7, #20]
	add	r3, r3, #8
	sub	r2, r2, #26
	str	r2, [r7, #24]
	str	r1, [r7, r3]
	add	r2, r2, #27
	mov	r3, #24
	str	r2, [r7, #28]
	str	r3, [r7, #36]
	sub	r2, r2, #15
	add	r3, r3, #6
	str	r2, [r7, #32]
	str	r3, [r7, #44]
	sub	r2, r2, #11
	sub	r3, r3, #10
	str	r2, [r7, #40]
	str	r3, [r7, #52]
	add	r2, r2, #19
	add	r3, r3, #5
	str	r2, [r7, #48]
	str	r3, [r7, #60]
	sub	r2, r2, #7
	sub	r3, r3, #21
	str	r2, [r7, #56]
	str	r3, [r7, #68]
	add	r2, r2, #2
	add	r3, r3, #27
	str	r2, [r7, #64]
	str	r3, [r7, #76]
	sub	r2, r2, #9
	sub	r3, r3, #18
	str	r2, [r7, #72]
	str	r3, [r7, #84]
	add	r2, r2, #19
	add	r3, r3, #8
	str	r2, [r7, #80]
	str	r3, [r7, #92]
	sub	r2, r2, #4
	sub	r3, r3, #5
	str	r2, [r7, #88]
	str	r3, [r7, #100]
	sub	r2, r2, #4
	add	r3, r3, #10
	str	r2, [r7, #96]
	str	r3, [r7, #108]
	sub	r2, r2, #12
	sub	r3, r3, #8
	str	r2, [r7, #104]
	str	r3, [r7, #116]
	add	r2, r2, #5
	sub	r3, r3, #7
	mov	r0, #1
	str	r2, [r7, #112]
	str	r3, [r7, #124]
	sub	r2, r2, #6
	sub	r3, r3, #6
	str	r2, [r7, #120]
	str	r0, [r7, #16]
	str	r1, [r7, #12]
	add	r2, r2, #3
	str	r3, [r7, #128]
	add	r3, r3, #5
	str	r0, [r7, #0]
	str	r3, [r7, #132]
	str	r2, [r7, #136]
	mov	r0, r1
.L85:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L94:
	ldr	r1, [r7, #8]
	mov	r2, #1
	mvn	r3, r1
	and	r3, r3, r2, asl lr
	add	r2, r2, r2
	eor	r1, r1, r3
	str	r0, [ip, #268]
	str	r0, [ip, #140]
	str	r2, [r0, #84]
	str	r1, [r7, #8]
	str	r4, [r0, #8]
	b	.L88
.L93:
	ldr	r2, .L95+44
	mov	r1, #1
	add	r2, sl, r2
	bl	bwassert(PLT)
	ldr	r1, .L95+48
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mvn	r0, #0
	b	.L85
.L96:
	.align	2
.L95:
	.word	_GLOBAL_OFFSET_TABLE_-(.L92+8)
	.word	11736
	.word	115200
	.word	11660
	.word	11740
	.word	-2139029504
	.word	-2139029376
	.word	-2139029404
	.word	5084689
	.word	5085
	.word	11688
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	initKernel, .-initKernel
	.align	2
	.global	kernelRun
	.type	kernelRun, %function
kernelRun:
	@ args = 0, pretend = 0, frame = 16788980
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	add	sp, sp, #-16777216
	sub	sp, sp, #11712
	sub	sp, sp, #52
	add	ip, sp, #16777216
	add	ip, ip, #52
	sub	ip, ip, #53
	mov	r2, ip, asr #31
	mov	r2, r2, lsr #28
	add	r3, ip, r2
	add	r4, sp, #16777216
	and	r3, r3, #15
	add	r4, r4, #52
	rsb	r3, r2, r3
	sub	r4, r4, #36
	mov	r2, r1
	rsb	r3, r3, ip
	mov	r1, r0
	mov	r0, r4
	bl	initKernel(PLT)
	cmp	r0, #0
	mov	r0, r4
	bleq	kernelExecute(PLT)
.L100:
	add	sp, sp, #500
	add	sp, sp, #11264
	add	sp, sp, #16777216
	ldmfd	sp!, {r4, pc}
	.size	kernelRun, .-kernelRun
	.ident	"GCC: (GNU) 4.0.2"
