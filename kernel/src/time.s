	.file	"time.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ERROR startTimer: Illegal base address for timer: 0"
	.ascii	"x%x\015\012\000"
	.text
	.align	2
	.global	startTimer
	.type	startTimer, %function
startTimer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	ip, .L19
	ldr	lr, .L19+4
	ldr	sl, .L19+8
	cmp	r0, ip
	cmpne	r0, lr
.L17:
	add	sl, pc, sl
	mov	r4, r0
	movne	r5, #0
	moveq	r5, #1
	mov	r6, r1
	mov	r7, r2
	mov	r8, r3
	beq	.L2
	ldr	r2, .L19+12
	ldr	r3, .L19+16
	cmp	r0, r3
	cmpne	r0, r2
	movne	r0, r5
	beq	.L2
.L5:
	ldr	r2, .L19+20
	mov	r1, #1
	add	r2, sl, r2
	mov	r3, r4
	bl	bwassert(PLT)
	cmp	r5, #0
	bne	.L6
	ldr	r3, .L19+12
	cmp	r4, r3
	ldrne	r3, [r4, #0]
	orrne	r3, r3, #256
	strne	r3, [r4, #0]
	ldmnefd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L6:
	ldr	r1, [r4, #8]
	cmp	r6, #508
	bic	r3, r1, #128
	str	r3, [r4, #8]
	orreq	r3, r3, #8
	bicne	r3, r1, #136
	streq	r3, [r4, #8]
	strne	r3, [r4, #8]
	str	r7, [r4, #0]
	cmp	r8, #1
	add	r2, r4, #8
	ldreq	r3, [r2, #0]
	ldrne	r3, [r2, #0]
	orreq	r3, r3, #64
	bicne	r3, r3, #64
	streq	r3, [r2, #0]
	strne	r3, [r2, #0]
	orr	r3, r3, #128
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L2:
	mov	r0, #1
	b	.L5
.L20:
	.align	2
.L19:
	.word	-2139029472
	.word	-2139029504
	.word	_GLOBAL_OFFSET_TABLE_-(.L17+8)
	.word	-2139029376
	.word	-2139029404
	.word	.LC0(GOTOFF)
	.size	startTimer, .-startTimer
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"ERROR stopTimer: Illegal base address for timer: 0x"
	.ascii	"%x\015\012\000"
	.text
	.align	2
	.global	stopTimer
	.type	stopTimer, %function
stopTimer:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L32
	ldr	r3, .L32+4
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L32+8
	cmp	r0, r3
	cmpne	r0, r2
.L31:
	add	sl, pc, sl
	mov	r4, r0
	movne	r5, #0
	moveq	r5, #1
	beq	.L22
	add	r2, r2, #128
	add	r3, r3, #68
	cmp	r0, r3
	cmpne	r0, r2
	mov	r0, r5
	beq	.L22
.L25:
	ldr	r2, .L32+12
	mov	r1, #1
	add	r2, sl, r2
	mov	r3, r4
	bl	bwassert(PLT)
	cmp	r5, #0
	bne	.L26
	ldr	r3, .L32+16
	cmp	r4, r3
	ldrne	r3, [r4, #0]
	bicne	r3, r3, #256
	strne	r3, [r4, #0]
	ldmnefd	sp!, {r4, r5, sl, pc}
.L26:
	ldr	r3, [r4, #8]
	bic	r3, r3, #128
	str	r3, [r4, #8]
	ldmfd	sp!, {r4, r5, sl, pc}
.L22:
	mov	r0, #1
	b	.L25
.L33:
	.align	2
.L32:
	.word	-2139029504
	.word	-2139029472
	.word	_GLOBAL_OFFSET_TABLE_-(.L31+8)
	.word	.LC1(GOTOFF)
	.word	-2139029376
	.size	stopTimer, .-stopTimer
	.align	2
	.global	clearTimerInterrupt
	.type	clearTimerInterrupt, %function
clearTimerInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L41
	ldr	r3, .L41+4
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L41+8
	cmp	r0, r3
	cmpne	r0, r2
.L40:
	add	sl, pc, sl
	mov	r4, r0
	movne	r0, #0
	moveq	r0, #1
	beq	.L35
	add	r3, r3, #96
	cmp	r4, r3
	beq	.L35
.L38:
	ldr	r2, .L41+12
	mov	r3, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r3, #1
	str	r3, [r4, #12]
	ldmfd	sp!, {r4, sl, pc}
.L35:
	mov	r0, #1
	b	.L38
.L42:
	.align	2
.L41:
	.word	-2139029504
	.word	-2139029472
	.word	_GLOBAL_OFFSET_TABLE_-(.L40+8)
	.word	.LC1(GOTOFF)
	.size	clearTimerInterrupt, .-clearTimerInterrupt
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"ERROR geTicks: Illegal base address for timer: 0x%x"
	.ascii	"\015\012\000"
	.text
	.align	2
	.global	getTicks
	.type	getTicks, %function
getTicks:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L50
	ldr	r3, .L50+4
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L50+8
	cmp	r0, r3
	cmpne	r0, r2
.L49:
	add	sl, pc, sl
	mov	r4, r0
	movne	r0, #0
	moveq	r0, #1
	mov	r5, r1
	beq	.L44
	add	r3, r3, #96
	cmp	r4, r3
	beq	.L44
.L47:
	ldr	r2, .L50+12
	mov	r1, #1
	add	r2, sl, r2
	mov	r3, r4
	bl	bwassert(PLT)
	ldr	r0, [r4, #4]
	rsb	r0, r0, r5
	ldmfd	sp!, {r4, r5, sl, pc}
.L44:
	mov	r0, #1
	b	.L47
.L51:
	.align	2
.L50:
	.word	-2139029504
	.word	-2139029472
	.word	_GLOBAL_OFFSET_TABLE_-(.L49+8)
	.word	.LC2(GOTOFF)
	.size	getTicks, .-getTicks
	.align	2
	.global	getTicks4
	.type	getTicks4, %function
getTicks4:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L54
	@ lr needed for prologue
	ldr	r3, [r2, #0]
	ldr	r2, .L54+4
	rsb	r3, r0, r3
	umull	r1, r0, r2, r3
	rsb	r3, r0, r3
	add	r0, r0, r3, lsr #1
	mov	r0, r0, lsr #9
	bx	lr
.L55:
	.align	2
.L54:
	.word	-2139029408
	.word	179139023
	.size	getTicks4, .-getTicks4
	.align	2
	.global	getTicks4us
	.type	getTicks4us, %function
getTicks4us:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L58
	@ lr needed for prologue
	ldr	r2, [r3, #0]
	rsb	r0, r0, r2
	bx	lr
.L59:
	.align	2
.L58:
	.word	-2139029408
	.size	getTicks4us, .-getTicks4us
	.ident	"GCC: (GNU) 4.0.2"
