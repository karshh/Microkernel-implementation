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
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L21
.L20:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-20]
	ldr	r3, .L21+4
	cmp	r2, r3
	beq	.L2
	ldr	r2, [fp, #-20]
	ldr	r3, .L21+8
	cmp	r2, r3
	beq	.L2
	ldr	r2, [fp, #-20]
	ldr	r3, .L21+12
	cmp	r2, r3
	beq	.L2
	ldr	r2, [fp, #-20]
	ldr	r3, .L21+16
	cmp	r2, r3
	bne	.L6
.L2:
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L7
.L6:
	mov	r3, #0
	str	r3, [fp, #-36]
.L7:
	ldr	r0, [fp, #-36]
	mov	r1, #1
	ldr	r3, .L21+20
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	bwassert(PLT)
	ldr	r2, [fp, #-20]
	ldr	r3, .L21+4
	cmp	r2, r3
	beq	.L8
	ldr	r2, [fp, #-20]
	ldr	r3, .L21+8
	cmp	r2, r3
	beq	.L8
	ldr	r2, [fp, #-20]
	ldr	r3, .L21+12
	cmp	r2, r3
	bne	.L11
.L8:
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
	ldr	r3, [fp, #-24]
	cmp	r3, #508
	bne	.L12
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	orr	r3, r3, #8
	str	r3, [r2, #0]
	b	.L14
.L12:
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	bic	r3, r3, #8
	str	r3, [r2, #0]
.L14:
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L15
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	orr	r3, r3, #64
	str	r3, [r2, #0]
	b	.L17
.L15:
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	bic	r3, r3, #64
	str	r3, [r2, #0]
.L17:
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	orr	r3, r3, #128
	str	r3, [r2, #0]
	b	.L19
.L11:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	orr	r3, r3, #256
	str	r3, [r2, #0]
.L19:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	_GLOBAL_OFFSET_TABLE_-(.L20+8)
	.word	-2139029504
	.word	-2139029472
	.word	-2139029376
	.word	-2139029404
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
	ldr	sl, .L37
.L36:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, .L37+4
	cmp	r2, r3
	beq	.L24
	ldr	r2, [fp, #-20]
	ldr	r3, .L37+8
	cmp	r2, r3
	beq	.L24
	ldr	r2, [fp, #-20]
	ldr	r3, .L37+12
	cmp	r2, r3
	beq	.L24
	ldr	r2, [fp, #-20]
	ldr	r3, .L37+16
	cmp	r2, r3
	bne	.L28
.L24:
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L29
.L28:
	mov	r3, #0
	str	r3, [fp, #-24]
.L29:
	ldr	r0, [fp, #-24]
	mov	r1, #1
	ldr	r3, .L37+20
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	bwassert(PLT)
	ldr	r2, [fp, #-20]
	ldr	r3, .L37+4
	cmp	r2, r3
	beq	.L30
	ldr	r2, [fp, #-20]
	ldr	r3, .L37+8
	cmp	r2, r3
	beq	.L30
	ldr	r2, [fp, #-20]
	ldr	r3, .L37+12
	cmp	r2, r3
	bne	.L33
.L30:
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldr	r3, [r3, #0]
	bic	r3, r3, #128
	str	r3, [r2, #0]
	b	.L35
.L33:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	bic	r3, r3, #256
	str	r3, [r2, #0]
.L35:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L38:
	.align	2
.L37:
	.word	_GLOBAL_OFFSET_TABLE_-(.L36+8)
	.word	-2139029504
	.word	-2139029472
	.word	-2139029376
	.word	-2139029404
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
	ldr	sl, .L47
.L46:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, .L47+4
	cmp	r2, r3
	beq	.L40
	ldr	r2, [fp, #-20]
	ldr	r3, .L47+8
	cmp	r2, r3
	beq	.L40
	ldr	r2, [fp, #-20]
	ldr	r3, .L47+12
	cmp	r2, r3
	bne	.L43
.L40:
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L44
.L43:
	mov	r3, #0
	str	r3, [fp, #-24]
.L44:
	ldr	r0, [fp, #-24]
	mov	r1, #1
	ldr	r3, .L47+16
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
.L48:
	.align	2
.L47:
	.word	_GLOBAL_OFFSET_TABLE_-(.L46+8)
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
	ldr	sl, .L57
.L56:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, .L57+4
	cmp	r2, r3
	beq	.L50
	ldr	r2, [fp, #-20]
	ldr	r3, .L57+8
	cmp	r2, r3
	beq	.L50
	ldr	r2, [fp, #-20]
	ldr	r3, .L57+12
	cmp	r2, r3
	bne	.L53
.L50:
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L54
.L53:
	mov	r3, #0
	str	r3, [fp, #-28]
.L54:
	ldr	r0, [fp, #-28]
	mov	r1, #1
	ldr	r3, .L57+16
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
.L58:
	.align	2
.L57:
	.word	_GLOBAL_OFFSET_TABLE_-(.L56+8)
	.word	-2139029504
	.word	-2139029472
	.word	-2139029376
	.word	.LC2(GOTOFF)
	.size	getTicks, .-getTicks
	.align	2
	.global	getTicks4
	.type	getTicks4, %function
getTicks4:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, .L61
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	rsb	r2, r3, r2
	ldr	r3, .L61+4
	umull	r0, r1, r3, r2
	rsb	r3, r1, r2
	mov	r3, r3, lsr #1
	add	r3, r1, r3
	mov	r3, r3, lsr #9
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L62:
	.align	2
.L61:
	.word	-2139029408
	.word	179139023
	.size	getTicks4, .-getTicks4
	.ident	"GCC: (GNU) 4.0.2"
