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
	ldr	r2, [ip, #36]
	cmp	r2, #0
	ldreq	r3, .L10+4
	movne	r3, #0
	strne	r3, [r2, #40]
	streq	r2, [r0, r3]
	mov	r3, #0
	streq	r2, [r0, lr]
	strne	r2, [r0, lr]
	str	r3, [ip, #36]
	mov	r2, #1
	str	r3, [ip, #40]
	str	ip, [r1, #0]
.L4:
	mov	r0, r2
	ldr	pc, [sp], #4
.L11:
	.align	2
.L10:
	.word	155912
	.word	155908
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
	ldrne	r2, [r3, #16]
	movne	r0, r5
	strne	r2, [r4, #0]
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, pc}
	.size	getNextTID, .-getNextTID
	.align	2
	.global	free_Push
	.type	free_Push, %function
free_Push:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L23
	mov	r3, #0
	ldr	r2, [r0, ip]
	@ lr needed for prologue
	cmp	r2, r3
	beq	.L22
	str	r1, [r2, #36]
	str	r2, [r1, #40]
	str	r3, [r1, #36]
	str	r1, [r0, ip]
	mov	r0, #1
	str	r3, [r1, #32]
	bx	lr
.L22:
	ldr	r3, .L23+4
	str	r1, [r0, ip]
	str	r1, [r0, r3]
	mov	r0, #1
	str	r2, [r1, #36]
	str	r2, [r1, #40]
	str	r2, [r1, #32]
	bx	lr
.L24:
	.align	2
.L23:
	.word	155908
	.word	155912
	.size	free_Push, .-free_Push
	.align	2
	.global	setTask
	.type	setTask, %function
setTask:
	@ args = 4, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	add	ip, r1, r1, asl #3
	mov	lr, r1
	add	ip, lr, ip, asl #1
	add	ip, r0, ip, asl #6
	cmn	r2, #1
	add	r1, r2, r2, asl #3
	str	r3, [ip, #28]
	add	r1, r2, r1, asl #1
	moveq	r3, #0
	str	r2, [ip, #20]
	add	r1, r0, r1, asl #6
	streq	r3, [ip, #24]
	mov	r2, #208
	mov	r3, #2
	str	r3, [ip, #32]
	sub	sp, sp, #4
	str	r2, [ip, #8]
	strne	r1, [ip, #24]
	sub	r3, r3, #3
	mov	r1, lr, asl #17
	ldr	r2, .L30
	str	r3, [ip, #4]
	str	r1, [sp, #0]
	ldr	r3, [r0, r2]
	ldr	r1, [sp, #0]
	ldr	r2, [sp, #8]
	rsb	r3, r1, r3
	add	r2, r2, #2195456
	str	r2, [r3, #-44]
	ldr	r1, [ip, #8]
	mov	r0, ip
	str	r1, [r3, #-48]!
	str	r3, [ip, #0]
	add	sp, sp, #4
	ldmfd	sp!, {pc}
.L31:
	.align	2
.L30:
	.word	155920
	.size	setTask, .-setTask
	.align	2
	.global	kernel_queuePush
	.type	kernel_queuePush, %function
kernel_queuePush:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r5, [r1, #28]
	mov	r4, r0
	add	r2, r0, r5, asl #2
	add	r0, r2, #155648
	ldr	lr, [r0, #0]
	ldr	r6, .L38
	cmp	lr, #0
	mov	ip, r1
	beq	.L37
	mov	r3, #0
	str	r1, [lr, #36]
	str	lr, [r1, #40]
	str	r3, [r1, #36]
	str	r1, [r0, #0]
	add	r3, r3, #2
	mov	r0, #1
	str	r3, [r1, #32]
	ldmfd	sp!, {r4, r5, r6, pc}
.L37:
	ldr	r1, [r4, r6]
	ldr	r3, .L38+4
	str	ip, [r0, #0]
	str	ip, [r2, r3]
	mvn	r2, r1
	mov	r3, #1
	and	r2, r2, r3, asl r5
	mov	r0, #1
	eor	r1, r1, r2
	add	r3, r3, r3
	str	lr, [ip, #36]
	str	r1, [r4, r6]
	str	lr, [ip, #40]
	str	r3, [ip, #32]
	ldmfd	sp!, {r4, r5, r6, pc}
.L39:
	.align	2
.L38:
	.word	155904
	.word	155776
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
	ldr	sl, .L58
	mov	r4, r0
	sub	sp, sp, #8
.L55:
	add	sl, pc, sl
	mov	r7, r1
	mov	r0, #1
	mov	r1, #0
	mov	r8, r2
	bl	bwsetfifo(PLT)
	ldr	r1, .L58+4
	mov	r0, #0
	add	r1, r4, r1
	mov	r2, r1, asr #31
	mov	r2, r2, lsr #28
	add	r3, r1, r2
	and	r3, r3, #15
	rsb	r3, r2, r3
	rsb	r5, r3, r1
	ldr	r2, .L58+8
	ldr	r3, .L58+12
	str	r0, [r4, r2]
	str	r0, [r4, r3]
	add	r2, r2, #12
	sub	r3, r3, #4
	str	r5, [r4, r2]
	str	r0, [r4, r3]
	str	r0, [sp, #4]
	mov	r1, r0
.L41:
	add	r0, r1, r1, asl #3
	add	r0, r1, r0, asl #1
	mov	r2, r5
	add	r0, r4, r0, asl #6
	bl	initTD(PLT)
	ldr	r1, [sp, #4]
	mov	r0, r4
	add	r3, r1, r1, asl #3
	add	r1, r1, r3, asl #1
	add	r1, r4, r1, asl #6
	bl	free_Push(PLT)
	ldr	r3, [sp, #4]
	add	r1, r3, #1
	cmp	r1, #127
	str	r1, [sp, #4]
	ble	.L41
	mov	r0, #0
	add	r3, r4, #155648
	mov	r2, r0
.L43:
	add	r2, r2, #1
	cmp	r2, #32
	str	r0, [r3, #0]
	str	r0, [r3, #128]
	add	r3, r3, #4
	bne	.L43
	ldr	r3, .L58+16
	add	r1, sp, #8
	str	r0, [r1, #-4]!
	str	r0, [r4, r3]
	mov	r0, r4
	bl	getNextTID(PLT)
	subs	r6, r0, #0
	bne	.L56
	mov	r3, r7
	ldr	r1, [sp, #4]
	mvn	r2, #0
	mov	r0, r4
	str	r8, [sp, #0]
	bl	setTask(PLT)
	mov	r5, r0
	mov	r1, r5
	mov	r0, r4
	bl	kernel_queuePush(PLT)
	cmp	r0, #0
	movne	r0, r6
	beq	.L57
.L47:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L56:
	ldr	r1, .L58+20
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mvn	r0, #0
	b	.L47
.L57:
	ldr	r1, .L58+24
	mov	r0, #1
	ldr	r2, [r5, #16]
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mvn	r0, #1
	b	.L47
.L59:
	.align	2
.L58:
	.word	_GLOBAL_OFFSET_TABLE_-(.L55+8)
	.word	16933139
	.word	155908
	.word	155916
	.word	155904
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
	ldr	r6, .L69
	add	r3, r0, r3, asl #2
	ldr	r2, [r3, r6]
	mov	lr, r0
	cmp	r2, #0
	mov	r7, r1
	mov	r0, r2
	beq	.L63
	ldr	r3, [sp, #0]
	ldr	r8, .L69+4
	add	r3, lr, r3, asl #2
	ldr	r5, [r3, r6]
	ldr	r4, [r5, #36]
	cmp	r4, #0
	beq	.L68
	mov	r2, #0
	str	r2, [r4, #40]
	ldr	r3, [sp, #0]
	add	r3, lr, r3, asl #2
	str	r4, [r3, r6]
.L66:
	mov	r3, #0
	str	r3, [r5, #36]
	mov	r0, #1
	str	r3, [r5, #40]
	str	r5, [r7, #0]
.L63:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L68:
	ldr	ip, [sp, #0]
	ldr	r1, [lr, r8]
	mov	r3, #1
	and	r3, r1, r3, asl ip
	ldr	r0, [sp, #0]
	ldr	r2, [sp, #0]
	eor	r1, r1, r3
	add	r2, lr, r2, asl #2
	add	r0, lr, r0, asl #2
	add	r2, r2, #155648
	str	r1, [lr, r8]
	str	r4, [r0, r6]
	str	r4, [r2, #0]
	b	.L66
.L70:
	.align	2
.L69:
	.word	155776
	.word	155904
	.size	kernel_queuePop_priority, .-kernel_queuePop_priority
	.align	2
	.global	kernel_queuePop
	.type	kernel_queuePop, %function
kernel_queuePop:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r3, .L89
	mov	ip, r0
	ldr	r0, [r0, r3]
	cmp	r0, #0
	ldreq	pc, [sp], #4
	tst	r0, #1
	movne	r2, #0
	beq	.L88
	mov	r0, ip
	bl	kernel_queuePop_priority(PLT)
	mov	r0, #1
	ldr	pc, [sp], #4
.L88:
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
.L90:
	.align	2
.L89:
	.word	155904
	.size	kernel_queuePop, .-kernel_queuePop
	.align	2
	.global	kernelRun
	.type	kernelRun, %function
kernelRun:
	@ args = 0, pretend = 0, frame = 16933328
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	add	sp, sp, #-16777216
	sub	sp, sp, #155648
	ldr	r3, .L99
	sub	sp, sp, #464
	ldr	r5, .L99+4
	mov	r2, r1
	add	r3, sp, r3
	mov	r1, r0
	mov	r0, sp
	add	r5, r3, r5
	bl	initKernel(PLT)
	cmp	r0, #0
	ldreq	r7, .L99
	addeq	r7, sp, r7
	streq	r0, [r7, #-4]!
	beq	.L94
	b	.L98
.L96:
	mov	r3, #0
	str	r3, [r5, r6]
.L94:
	mov	r1, r7
	mov	r0, r5
	bl	kernel_queuePop(PLT)
	cmp	r0, #0
	ldr	r6, .L99+8
	beq	.L98
	add	r3, sp, #16777216
	add	r3, r3, #155648
	ldr	r4, [r3, #460]
	mov	r3, #1
	str	r3, [r4, #32]
	mov	r1, r4
	ldr	r0, [r4, #4]
	str	r4, [r5, r6]
	bl	activate(PLT)
	ldr	ip, .L99+12
	mov	lr, r0
	add	ip, sp, ip
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r2, .L99+12
	ldr	r3, .L99+16
	ldmia	lr, {r0, r1}
	add	r3, sp, r3
	stmia	ip, {r0, r1}
	add	r2, sp, r2
	mov	r1, r4
	mov	r0, r5
	bl	processRequest(PLT)
	add	r3, sp, #16777216
	add	r3, r3, #155648
	ldr	r1, [r3, #460]
	mov	r0, r5
	ldr	r3, [r1, #32]
	cmp	r3, #1
	bne	.L96
	bl	kernel_queuePush(PLT)
	b	.L96
.L98:
	add	sp, sp, #464
	add	sp, sp, #155648
	add	sp, sp, #16777216
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L100:
	.align	2
.L99:
	.word	16933328
	.word	-16933328
	.word	155916
	.word	16933300
	.word	16933156
	.size	kernelRun, .-kernelRun
	.ident	"GCC: (GNU) 4.0.2"
