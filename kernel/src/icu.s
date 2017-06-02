	.file	"icu.c"
	.text
	.align	2
	.global	toggleTimer1Interrupt
	.type	toggleTimer1Interrupt, %function
toggleTimer1Interrupt:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L2
	ldr	r2, .L9
	str	r2, [fp, #-24]
	b	.L4
.L2:
	ldr	r3, .L9+4
	str	r3, [fp, #-24]
.L4:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L5
	ldr	r2, .L9
	str	r2, [fp, #-20]
	b	.L7
.L5:
	ldr	r3, .L9+4
	str	r3, [fp, #-20]
.L7:
	ldr	r2, [fp, #-20]
	ldr	r3, [r2, #0]
	orr	r3, r3, #16
	ldr	r2, [fp, #-24]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L10:
	.align	2
.L9:
	.word	-2146762736
	.word	-2146762732
	.size	toggleTimer1Interrupt, .-toggleTimer1Interrupt
	.align	2
	.global	toggleTimer2Interrupt
	.type	toggleTimer2Interrupt, %function
toggleTimer2Interrupt:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L12
	ldr	r2, .L19
	str	r2, [fp, #-24]
	b	.L14
.L12:
	ldr	r3, .L19+4
	str	r3, [fp, #-24]
.L14:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L15
	ldr	r2, .L19
	str	r2, [fp, #-20]
	b	.L17
.L15:
	ldr	r3, .L19+4
	str	r3, [fp, #-20]
.L17:
	ldr	r2, [fp, #-20]
	ldr	r3, [r2, #0]
	orr	r3, r3, #32
	ldr	r2, [fp, #-24]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L20:
	.align	2
.L19:
	.word	-2146762736
	.word	-2146762732
	.size	toggleTimer2Interrupt, .-toggleTimer2Interrupt
	.align	2
	.global	toggleTimer3Interrupt
	.type	toggleTimer3Interrupt, %function
toggleTimer3Interrupt:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L22
	ldr	r2, .L29
	str	r2, [fp, #-24]
	b	.L24
.L22:
	ldr	r3, .L29+4
	str	r3, [fp, #-24]
.L24:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L25
	ldr	r2, .L29
	str	r2, [fp, #-20]
	b	.L27
.L25:
	ldr	r3, .L29+4
	str	r3, [fp, #-20]
.L27:
	ldr	r2, [fp, #-20]
	ldr	r3, [r2, #0]
	orr	r3, r3, #524288
	ldr	r2, [fp, #-24]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L30:
	.align	2
.L29:
	.word	-2146697200
	.word	-2146697196
	.size	toggleTimer3Interrupt, .-toggleTimer3Interrupt
	.align	2
	.global	toggleUART1Interrupt
	.type	toggleUART1Interrupt, %function
toggleUART1Interrupt:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L32
	ldr	r2, .L39
	str	r2, [fp, #-24]
	b	.L34
.L32:
	ldr	r3, .L39+4
	str	r3, [fp, #-24]
.L34:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L35
	ldr	r2, .L39
	str	r2, [fp, #-20]
	b	.L37
.L35:
	ldr	r3, .L39+4
	str	r3, [fp, #-20]
.L37:
	ldr	r2, [fp, #-20]
	ldr	r3, [r2, #0]
	orr	r3, r3, #1048576
	ldr	r2, [fp, #-24]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L40:
	.align	2
.L39:
	.word	-2146697200
	.word	-2146697196
	.size	toggleUART1Interrupt, .-toggleUART1Interrupt
	.align	2
	.global	toggleUART2Interrupt
	.type	toggleUART2Interrupt, %function
toggleUART2Interrupt:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L42
	ldr	r2, .L49
	str	r2, [fp, #-24]
	b	.L44
.L42:
	ldr	r3, .L49+4
	str	r3, [fp, #-24]
.L44:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L45
	ldr	r2, .L49
	str	r2, [fp, #-20]
	b	.L47
.L45:
	ldr	r3, .L49+4
	str	r3, [fp, #-20]
.L47:
	ldr	r2, [fp, #-20]
	ldr	r3, [r2, #0]
	orr	r3, r3, #4194304
	ldr	r2, [fp, #-24]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L50:
	.align	2
.L49:
	.word	-2146697200
	.word	-2146697196
	.size	toggleUART2Interrupt, .-toggleUART2Interrupt
	.align	2
	.global	checkInterrupts
	.type	checkInterrupts, %function
checkInterrupts:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	r3, .L64
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #4
	cmp	r3, #1
	bne	.L52
	mov	r3, #4
	str	r3, [fp, #-16]
	b	.L54
.L52:
	ldr	r3, .L64
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #5
	cmp	r3, #1
	bne	.L55
	mov	r3, #5
	str	r3, [fp, #-16]
	b	.L54
.L55:
	ldr	r3, .L64+4
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #19
	cmp	r3, #1
	bne	.L57
	mov	r3, #19
	str	r3, [fp, #-16]
	b	.L54
.L57:
	ldr	r3, .L64+4
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #20
	cmp	r3, #1
	bne	.L59
	mov	r3, #20
	str	r3, [fp, #-16]
	b	.L54
.L59:
	ldr	r3, .L64+4
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #22
	cmp	r3, #1
	bne	.L61
	mov	r3, #22
	str	r3, [fp, #-16]
	b	.L54
.L61:
	mov	r3, #0
	str	r3, [fp, #-16]
.L54:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L65:
	.align	2
.L64:
	.word	-2146762752
	.word	-2146697216
	.size	checkInterrupts, .-checkInterrupts
	.align	2
	.global	disableInterrupts
	.type	disableInterrupts, %function
disableInterrupts:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	mov	r0, #0
	bl	toggleTimer1Interrupt(PLT)
	mov	r0, #0
	bl	toggleTimer2Interrupt(PLT)
	mov	r0, #0
	bl	toggleTimer3Interrupt(PLT)
	mov	r0, #0
	bl	toggleUART1Interrupt(PLT)
	mov	r0, #0
	bl	toggleUART2Interrupt(PLT)
	ldmfd	sp, {fp, sp, pc}
	.size	disableInterrupts, .-disableInterrupts
	.ident	"GCC: (GNU) 4.0.2"
