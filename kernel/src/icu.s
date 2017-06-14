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
	.global	toggleUART1SendInterrupt
	.type	toggleUART1SendInterrupt, %function
toggleUART1SendInterrupt:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L32
	ldr	r2, .L36
	ldr	r3, .L36
	ldr	r3, [r3, #0]
	orr	r3, r3, #40
	str	r3, [r2, #0]
	b	.L35
.L32:
	ldr	r2, .L36
	ldr	r3, .L36
	ldr	r3, [r3, #0]
	bic	r3, r3, #40
	str	r3, [r2, #0]
.L35:
	ldmfd	sp, {r3, fp, sp, pc}
.L37:
	.align	2
.L36:
	.word	-2138308588
	.size	toggleUART1SendInterrupt, .-toggleUART1SendInterrupt
	.align	2
	.global	toggleUART1ReceiveInterrupt
	.type	toggleUART1ReceiveInterrupt, %function
toggleUART1ReceiveInterrupt:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L39
	ldr	r2, .L43
	ldr	r3, .L43
	ldr	r3, [r3, #0]
	orr	r3, r3, #16
	str	r3, [r2, #0]
	b	.L42
.L39:
	ldr	r2, .L43
	ldr	r3, .L43
	ldr	r3, [r3, #0]
	bic	r3, r3, #16
	str	r3, [r2, #0]
.L42:
	ldmfd	sp, {r3, fp, sp, pc}
.L44:
	.align	2
.L43:
	.word	-2138308588
	.size	toggleUART1ReceiveInterrupt, .-toggleUART1ReceiveInterrupt
	.align	2
	.global	toggleUART1VICInterrupt
	.type	toggleUART1VICInterrupt, %function
toggleUART1VICInterrupt:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L46
	ldr	r2, .L53
	str	r2, [fp, #-24]
	b	.L48
.L46:
	ldr	r3, .L53+4
	str	r3, [fp, #-24]
.L48:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L49
	ldr	r2, .L53
	str	r2, [fp, #-20]
	b	.L51
.L49:
	ldr	r3, .L53+4
	str	r3, [fp, #-20]
.L51:
	ldr	r2, [fp, #-20]
	ldr	r3, [r2, #0]
	orr	r3, r3, #1048576
	ldr	r2, [fp, #-24]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L54:
	.align	2
.L53:
	.word	-2146697200
	.word	-2146697196
	.size	toggleUART1VICInterrupt, .-toggleUART1VICInterrupt
	.align	2
	.global	toggleUART2SendInterrupt
	.type	toggleUART2SendInterrupt, %function
toggleUART2SendInterrupt:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L56
	ldr	r2, .L60
	ldr	r3, .L60
	ldr	r3, [r3, #0]
	orr	r3, r3, #32
	str	r3, [r2, #0]
	b	.L59
.L56:
	ldr	r2, .L60
	ldr	r3, .L60
	ldr	r3, [r3, #0]
	bic	r3, r3, #32
	str	r3, [r2, #0]
.L59:
	ldmfd	sp, {r3, fp, sp, pc}
.L61:
	.align	2
.L60:
	.word	-2138243052
	.size	toggleUART2SendInterrupt, .-toggleUART2SendInterrupt
	.align	2
	.global	toggleUART2ReceiveInterrupt
	.type	toggleUART2ReceiveInterrupt, %function
toggleUART2ReceiveInterrupt:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L63
	ldr	r2, .L67
	ldr	r3, .L67
	ldr	r3, [r3, #0]
	orr	r3, r3, #16
	str	r3, [r2, #0]
	b	.L66
.L63:
	ldr	r2, .L67
	ldr	r3, .L67
	ldr	r3, [r3, #0]
	bic	r3, r3, #16
	str	r3, [r2, #0]
.L66:
	ldmfd	sp, {r3, fp, sp, pc}
.L68:
	.align	2
.L67:
	.word	-2138243052
	.size	toggleUART2ReceiveInterrupt, .-toggleUART2ReceiveInterrupt
	.align	2
	.global	toggleUART2VICInterrupt
	.type	toggleUART2VICInterrupt, %function
toggleUART2VICInterrupt:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L70
	ldr	r2, .L77
	str	r2, [fp, #-24]
	b	.L72
.L70:
	ldr	r3, .L77+4
	str	r3, [fp, #-24]
.L72:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L73
	ldr	r2, .L77
	str	r2, [fp, #-20]
	b	.L75
.L73:
	ldr	r3, .L77+4
	str	r3, [fp, #-20]
.L75:
	ldr	r2, [fp, #-20]
	ldr	r3, [r2, #0]
	orr	r3, r3, #4194304
	ldr	r2, [fp, #-24]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L78:
	.align	2
.L77:
	.word	-2146697200
	.word	-2146697196
	.size	toggleUART2VICInterrupt, .-toggleUART2VICInterrupt
	.align	2
	.global	checkInterrupts
	.type	checkInterrupts, %function
checkInterrupts:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, .L91
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, .L91+4
	ldr	r3, [r3, #0]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	mov	r3, r3, asr #19
	cmp	r3, #1
	bne	.L80
	ldr	r3, [fp, #-16]
	orr	r3, r3, #1
	str	r3, [fp, #-16]
.L80:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asr #4
	cmp	r3, #1
	bne	.L82
	ldr	r3, [fp, #-16]
	orr	r3, r3, #2
	str	r3, [fp, #-16]
.L82:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asr #5
	cmp	r3, #1
	bne	.L84
	ldr	r3, [fp, #-16]
	orr	r3, r3, #4
	str	r3, [fp, #-16]
.L84:
	ldr	r3, [fp, #-24]
	mov	r3, r3, asr #20
	cmp	r3, #1
	bne	.L86
	ldr	r3, [fp, #-16]
	orr	r3, r3, #8
	str	r3, [fp, #-16]
.L86:
	ldr	r3, [fp, #-24]
	mov	r3, r3, asr #22
	cmp	r3, #1
	bne	.L88
	ldr	r3, [fp, #-16]
	orr	r3, r3, #16
	str	r3, [fp, #-16]
.L88:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L92:
	.align	2
.L91:
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
	bl	toggleUART1VICInterrupt(PLT)
	mov	r0, #0
	bl	toggleUART1SendInterrupt(PLT)
	mov	r0, #0
	bl	toggleUART1ReceiveInterrupt(PLT)
	mov	r0, #0
	bl	toggleUART2VICInterrupt(PLT)
	mov	r0, #0
	bl	toggleUART2SendInterrupt(PLT)
	mov	r0, #0
	bl	toggleUART2ReceiveInterrupt(PLT)
	ldmfd	sp, {fp, sp, pc}
	.size	disableInterrupts, .-disableInterrupts
	.ident	"GCC: (GNU) 4.0.2"
