	.file	"time.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"ERROR startTimer: Illegal base address for timer: 0"
	.ascii	"x%x\015\012\000"
	.text
	.align	2
	.global	startTimer
	.type	startTimer, %function
startTimer:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	ldr	sl, .L12
.L11:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r2, [fp, #-20]
	ldr	r3, .L12+4
	cmp	r2, r3
	beq	.L2
	ldr	r2, [fp, #-20]
	ldr	r3, .L12+8
	cmp	r2, r3
	beq	.L2
	ldr	r2, [fp, #-20]
	ldr	r3, .L12+12
	cmp	r2, r3
	bne	.L5
.L2:
	mov	r1, #1
	str	r1, [fp, #-44]
	b	.L6
.L5:
	mov	r2, #0
	str	r2, [fp, #-44]
.L6:
	ldr	r0, [fp, #-44]
	mov	r1, #1
	ldr	r3, .L12+16
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	bwassert(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	bic	r3, r3, #128
	str	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	cmp	r3, #508
	bne	.L7
	mov	r3, #8
	str	r3, [fp, #-32]
	b	.L9
.L7:
	mov	r1, #0
	str	r1, [fp, #-32]
.L9:
	ldr	r2, [fp, #-36]
	ldr	r1, [fp, #-32]
	orr	r3, r2, r1
	ldr	r2, [fp, #-40]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	orr	r3, r3, #128
	str	r3, [r2, #0]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L13:
	.align	2
.L12:
	.word	_GLOBAL_OFFSET_TABLE_-(.L11+8)
	.word	-2139029504
	.word	-2139029472
	.word	-2139029376
	.word	.LC0(GOTOFF)
	.size	startTimer, .-startTimer
	.section	.rodata
	.align	2
.LC1:
	.ascii	"ERROR stopTimer: Illegal base address for timer: 0x"
	.ascii	"%x\015\012\000"
	.text
	.align	2
	.global	stopTimer
	.type	stopTimer, %function
stopTimer:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L22
.L21:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, .L22+4
	cmp	r2, r3
	beq	.L15
	ldr	r2, [fp, #-20]
	ldr	r3, .L22+8
	cmp	r2, r3
	beq	.L15
	ldr	r2, [fp, #-20]
	ldr	r3, .L22+12
	cmp	r2, r3
	bne	.L18
.L15:
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L19
.L18:
	mov	r3, #0
	str	r3, [fp, #-24]
.L19:
	ldr	r0, [fp, #-24]
	mov	r1, #1
	ldr	r3, .L22+16
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	bwassert(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	bic	r3, r3, #128
	str	r3, [r2, #0]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L23:
	.align	2
.L22:
	.word	_GLOBAL_OFFSET_TABLE_-(.L21+8)
	.word	-2139029504
	.word	-2139029472
	.word	-2139029376
	.word	.LC1(GOTOFF)
	.size	stopTimer, .-stopTimer
	.align	2
	.global	clearTimerInterrupt
	.type	clearTimerInterrupt, %function
clearTimerInterrupt:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L32
.L31:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, .L32+4
	cmp	r2, r3
	beq	.L25
	ldr	r2, [fp, #-20]
	ldr	r3, .L32+8
	cmp	r2, r3
	beq	.L25
	ldr	r2, [fp, #-20]
	ldr	r3, .L32+12
	cmp	r2, r3
	bne	.L28
.L25:
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L29
.L28:
	mov	r3, #0
	str	r3, [fp, #-24]
.L29:
	ldr	r0, [fp, #-24]
	mov	r1, #1
	ldr	r3, .L32+16
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	bwassert(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #12
	mov	r2, r3
	mov	r3, #1
	str	r3, [r2, #0]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L33:
	.align	2
.L32:
	.word	_GLOBAL_OFFSET_TABLE_-(.L31+8)
	.word	-2139029504
	.word	-2139029472
	.word	-2139029376
	.word	.LC1(GOTOFF)
	.size	clearTimerInterrupt, .-clearTimerInterrupt
	.section	.rodata
	.align	2
.LC2:
	.ascii	"ERROR geTicks: Illegal base address for timer: 0x%x"
	.ascii	"\015\012\000"
	.text
	.align	2
	.global	getTicks
	.type	getTicks, %function
getTicks:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L42
.L41:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, .L42+4
	cmp	r2, r3
	beq	.L35
	ldr	r2, [fp, #-20]
	ldr	r3, .L42+8
	cmp	r2, r3
	beq	.L35
	ldr	r2, [fp, #-20]
	ldr	r3, .L42+12
	cmp	r2, r3
	bne	.L38
.L35:
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L39
.L38:
	mov	r3, #0
	str	r3, [fp, #-28]
.L39:
	ldr	r0, [fp, #-28]
	mov	r1, #1
	ldr	r3, .L42+16
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	bwassert(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	rsb	r3, r2, r3
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L43:
	.align	2
.L42:
	.word	_GLOBAL_OFFSET_TABLE_-(.L41+8)
	.word	-2139029504
	.word	-2139029472
	.word	-2139029376
	.word	.LC2(GOTOFF)
	.size	getTicks, .-getTicks
	.ident	"GCC: (GNU) 4.0.2"
