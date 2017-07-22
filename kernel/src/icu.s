	.file	"icu.c"
	.text
	.align	2
	.global	toggleTimer1Interrupt
	.type	toggleTimer1Interrupt, %function
toggleTimer1Interrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L6
	cmp	r0, #0
	mov	r3, r2
	ldreq	r2, .L6+4
	@ lr needed for prologue
	moveq	r3, r2
	ldr	r3, [r3, #0]
	orr	r3, r3, #16
	str	r3, [r2, #0]
	bx	lr
.L7:
	.align	2
.L6:
	.word	-2146762736
	.word	-2146762732
	.size	toggleTimer1Interrupt, .-toggleTimer1Interrupt
	.align	2
	.global	toggleTimer2Interrupt
	.type	toggleTimer2Interrupt, %function
toggleTimer2Interrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L13
	cmp	r0, #0
	mov	r3, r2
	ldreq	r2, .L13+4
	@ lr needed for prologue
	moveq	r3, r2
	ldr	r3, [r3, #0]
	orr	r3, r3, #32
	str	r3, [r2, #0]
	bx	lr
.L14:
	.align	2
.L13:
	.word	-2146762736
	.word	-2146762732
	.size	toggleTimer2Interrupt, .-toggleTimer2Interrupt
	.align	2
	.global	toggleTimer3Interrupt
	.type	toggleTimer3Interrupt, %function
toggleTimer3Interrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L20
	cmp	r0, #0
	mov	r3, r2
	ldreq	r2, .L20+4
	@ lr needed for prologue
	moveq	r3, r2
	ldr	r3, [r3, #0]
	orr	r3, r3, #524288
	str	r3, [r2, #0]
	bx	lr
.L21:
	.align	2
.L20:
	.word	-2146697200
	.word	-2146697196
	.size	toggleTimer3Interrupt, .-toggleTimer3Interrupt
	.align	2
	.global	toggleUART1SendInterrupt
	.type	toggleUART1SendInterrupt, %function
toggleUART1SendInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L27
	cmp	r0, #0
	ldrne	r3, [r1, #0]
	ldreq	r3, [r1, #0]
	orrne	r3, r3, #40
	biceq	r3, r3, #32
	@ lr needed for prologue
	strne	r3, [r1, #0]
	streq	r3, [r1, #0]
	bx	lr
.L28:
	.align	2
.L27:
	.word	-2138308588
	.size	toggleUART1SendInterrupt, .-toggleUART1SendInterrupt
	.align	2
	.global	toggleUART1ReceiveInterrupt
	.type	toggleUART1ReceiveInterrupt, %function
toggleUART1ReceiveInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L34
	cmp	r0, #0
	ldrne	r3, [r1, #0]
	ldreq	r3, [r1, #0]
	orrne	r3, r3, #24
	biceq	r3, r3, #16
	@ lr needed for prologue
	strne	r3, [r1, #0]
	streq	r3, [r1, #0]
	bx	lr
.L35:
	.align	2
.L34:
	.word	-2138308588
	.size	toggleUART1ReceiveInterrupt, .-toggleUART1ReceiveInterrupt
	.align	2
	.global	toggleUART1VICInterrupt
	.type	toggleUART1VICInterrupt, %function
toggleUART1VICInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L41
	cmp	r0, #0
	mov	r3, r2
	ldreq	r2, .L41+4
	@ lr needed for prologue
	moveq	r3, r2
	ldr	r3, [r3, #0]
	orr	r3, r3, #1048576
	str	r3, [r2, #0]
	bx	lr
.L42:
	.align	2
.L41:
	.word	-2146697200
	.word	-2146697196
	.size	toggleUART1VICInterrupt, .-toggleUART1VICInterrupt
	.align	2
	.global	toggleUART2SendInterrupt
	.type	toggleUART2SendInterrupt, %function
toggleUART2SendInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L48
	cmp	r0, #0
	ldrne	r3, [r1, #0]
	ldreq	r3, [r1, #0]
	orrne	r3, r3, #32
	biceq	r3, r3, #32
	@ lr needed for prologue
	strne	r3, [r1, #0]
	streq	r3, [r1, #0]
	bx	lr
.L49:
	.align	2
.L48:
	.word	-2138243052
	.size	toggleUART2SendInterrupt, .-toggleUART2SendInterrupt
	.align	2
	.global	toggleUART2ReceiveInterrupt
	.type	toggleUART2ReceiveInterrupt, %function
toggleUART2ReceiveInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L55
	cmp	r0, #0
	ldrne	r3, [r1, #0]
	ldreq	r3, [r1, #0]
	orrne	r3, r3, #16
	biceq	r3, r3, #16
	@ lr needed for prologue
	strne	r3, [r1, #0]
	streq	r3, [r1, #0]
	bx	lr
.L56:
	.align	2
.L55:
	.word	-2138243052
	.size	toggleUART2ReceiveInterrupt, .-toggleUART2ReceiveInterrupt
	.align	2
	.global	toggleUART2VICInterrupt
	.type	toggleUART2VICInterrupt, %function
toggleUART2VICInterrupt:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L62
	cmp	r0, #0
	mov	r3, r2
	ldreq	r2, .L62+4
	@ lr needed for prologue
	moveq	r3, r2
	ldr	r3, [r3, #0]
	orr	r3, r3, #4194304
	str	r3, [r2, #0]
	bx	lr
.L63:
	.align	2
.L62:
	.word	-2146697200
	.word	-2146697196
	.size	toggleUART2VICInterrupt, .-toggleUART2VICInterrupt
	.align	2
	.global	checkInterrupts
	.type	checkInterrupts, %function
checkInterrupts:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #12
	mov	r3, #0
	ldr	r2, .L76
	str	r3, [sp, #8]
	ldr	r3, [r2, #0]
	add	r2, r2, #65536
	str	r3, [sp, #4]
	ldr	r1, [r2, #0]
	@ lr needed for prologue
	str	r1, [sp, #0]
	ldr	r3, [sp, #0]
	mov	r3, r3, asr #19
	cmp	r3, #1
	ldreq	r3, [sp, #8]
	orreq	r3, r3, #1
	streq	r3, [sp, #8]
	ldr	r3, [sp, #4]
	mov	r3, r3, asr #4
	cmp	r3, #1
	ldreq	r3, [sp, #8]
	orreq	r3, r3, #2
	streq	r3, [sp, #8]
	ldr	r3, [sp, #4]
	mov	r3, r3, asr #5
	cmp	r3, #1
	ldreq	r3, [sp, #8]
	orreq	r3, r3, #4
	streq	r3, [sp, #8]
	ldr	r3, [sp, #0]
	mov	r3, r3, asr #20
	cmp	r3, #1
	ldreq	r3, [sp, #8]
	orreq	r3, r3, #8
	streq	r3, [sp, #8]
	ldr	r3, [sp, #0]
	mov	r3, r3, asr #22
	cmp	r3, #1
	ldreq	r3, [sp, #8]
	orreq	r3, r3, #16
	streq	r3, [sp, #8]
	ldr	r0, [sp, #8]
	add	sp, sp, #12
	bx	lr
.L77:
	.align	2
.L76:
	.word	-2146762752
	.size	checkInterrupts, .-checkInterrupts
	.align	2
	.global	disableInterrupts
	.type	disableInterrupts, %function
disableInterrupts:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
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
	ldr	lr, [sp], #4
	b	toggleUART2ReceiveInterrupt(PLT)
	.size	disableInterrupts, .-disableInterrupts
	.ident	"GCC: (GNU) 4.0.2"
