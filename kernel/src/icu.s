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
	ldr	r2, .L42
	ldr	r3, .L42
	ldr	r3, [r3, #0]
	orr	r3, r3, #40
	str	r3, [r2, #0]
	b	.L34
.L32:
	ldr	r2, .L42
	ldr	r3, .L42
	ldr	r3, [r3, #0]
	bic	r3, r3, #40
	str	r3, [r2, #0]
.L34:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L35
	ldr	r2, .L42+4
	str	r2, [fp, #-24]
	b	.L37
.L35:
	ldr	r3, .L42+8
	str	r3, [fp, #-24]
.L37:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L38
	ldr	r2, .L42+4
	str	r2, [fp, #-20]
	b	.L40
.L38:
	ldr	r3, .L42+8
	str	r3, [fp, #-20]
.L40:
	ldr	r2, [fp, #-20]
	ldr	r3, [r2, #0]
	orr	r3, r3, #1048576
	ldr	r2, [fp, #-24]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L43:
	.align	2
.L42:
	.word	-2138308588
	.word	-2146697200
	.word	-2146697196
	.size	toggleUART1SendInterrupt, .-toggleUART1SendInterrupt
	.align	2
	.global	toggleUART1ReceiveInterrupt
	.type	toggleUART1ReceiveInterrupt, %function
toggleUART1ReceiveInterrupt:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L45
	ldr	r2, .L55
	ldr	r3, .L55
	ldr	r3, [r3, #0]
	orr	r3, r3, #16
	str	r3, [r2, #0]
	b	.L47
.L45:
	ldr	r2, .L55
	ldr	r3, .L55
	ldr	r3, [r3, #0]
	bic	r3, r3, #16
	str	r3, [r2, #0]
.L47:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L48
	ldr	r2, .L55+4
	str	r2, [fp, #-24]
	b	.L50
.L48:
	ldr	r3, .L55+8
	str	r3, [fp, #-24]
.L50:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L51
	ldr	r2, .L55+4
	str	r2, [fp, #-20]
	b	.L53
.L51:
	ldr	r3, .L55+8
	str	r3, [fp, #-20]
.L53:
	ldr	r2, [fp, #-20]
	ldr	r3, [r2, #0]
	orr	r3, r3, #1048576
	ldr	r2, [fp, #-24]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L56:
	.align	2
.L55:
	.word	-2138308588
	.word	-2146697200
	.word	-2146697196
	.size	toggleUART1ReceiveInterrupt, .-toggleUART1ReceiveInterrupt
	.align	2
	.global	toggleUART2SendInterrupt
	.type	toggleUART2SendInterrupt, %function
toggleUART2SendInterrupt:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L58
	ldr	r2, .L68
	ldr	r3, .L68
	ldr	r3, [r3, #0]
	orr	r3, r3, #32
	str	r3, [r2, #0]
	b	.L60
.L58:
	ldr	r2, .L68
	ldr	r3, .L68
	ldr	r3, [r3, #0]
	bic	r3, r3, #32
	str	r3, [r2, #0]
.L60:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L61
	ldr	r2, .L68+4
	str	r2, [fp, #-24]
	b	.L63
.L61:
	ldr	r3, .L68+8
	str	r3, [fp, #-24]
.L63:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L64
	ldr	r2, .L68+4
	str	r2, [fp, #-20]
	b	.L66
.L64:
	ldr	r3, .L68+8
	str	r3, [fp, #-20]
.L66:
	ldr	r2, [fp, #-20]
	ldr	r3, [r2, #0]
	orr	r3, r3, #4194304
	ldr	r2, [fp, #-24]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L69:
	.align	2
.L68:
	.word	-2138243052
	.word	-2146697200
	.word	-2146697196
	.size	toggleUART2SendInterrupt, .-toggleUART2SendInterrupt
	.align	2
	.global	toggleUART2ReceiveInterrupt
	.type	toggleUART2ReceiveInterrupt, %function
toggleUART2ReceiveInterrupt:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L71
	ldr	r2, .L81
	ldr	r3, .L81
	ldr	r3, [r3, #0]
	orr	r3, r3, #16
	str	r3, [r2, #0]
	b	.L73
.L71:
	ldr	r2, .L81
	ldr	r3, .L81
	ldr	r3, [r3, #0]
	bic	r3, r3, #16
	str	r3, [r2, #0]
.L73:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L74
	ldr	r2, .L81+4
	str	r2, [fp, #-24]
	b	.L76
.L74:
	ldr	r3, .L81+8
	str	r3, [fp, #-24]
.L76:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L77
	ldr	r2, .L81+4
	str	r2, [fp, #-20]
	b	.L79
.L77:
	ldr	r3, .L81+8
	str	r3, [fp, #-20]
.L79:
	ldr	r2, [fp, #-20]
	ldr	r3, [r2, #0]
	orr	r3, r3, #4194304
	ldr	r2, [fp, #-24]
	str	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L82:
	.align	2
.L81:
	.word	-2138243052
	.word	-2146697200
	.word	-2146697196
	.size	toggleUART2ReceiveInterrupt, .-toggleUART2ReceiveInterrupt
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
	ldr	r3, .L96
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #19
	cmp	r3, #1
	bne	.L84
	mov	r3, #19
	str	r3, [fp, #-16]
	b	.L86
.L84:
	ldr	r3, .L96+4
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #4
	cmp	r3, #1
	bne	.L87
	mov	r3, #4
	str	r3, [fp, #-16]
	b	.L86
.L87:
	ldr	r3, .L96+4
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #5
	cmp	r3, #1
	bne	.L89
	mov	r3, #5
	str	r3, [fp, #-16]
	b	.L86
.L89:
	ldr	r3, .L96
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #20
	cmp	r3, #1
	bne	.L91
	mov	r3, #20
	str	r3, [fp, #-16]
	b	.L86
.L91:
	ldr	r3, .L96
	ldr	r3, [r3, #0]
	mov	r3, r3, asr #22
	cmp	r3, #1
	bne	.L93
	mov	r3, #22
	str	r3, [fp, #-16]
	b	.L86
.L93:
	mov	r3, #0
	str	r3, [fp, #-16]
.L86:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L97:
	.align	2
.L96:
	.word	-2146697216
	.word	-2146762752
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
	bl	toggleUART1SendInterrupt(PLT)
	mov	r0, #0
	bl	toggleUART1ReceiveInterrupt(PLT)
	mov	r0, #0
	bl	toggleUART2SendInterrupt(PLT)
	mov	r0, #0
	bl	toggleUART2ReceiveInterrupt(PLT)
	ldmfd	sp, {fp, sp, pc}
	.size	disableInterrupts, .-disableInterrupts
	.ident	"GCC: (GNU) 4.0.2"
