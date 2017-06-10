	.file	"a01.c"
	.text
	.align	2
	.global	ccbuff_isEmpty
	.type	ccbuff_isEmpty, %function
ccbuff_isEmpty:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #4096
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-16]
	ldr	r3, .L6
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L2
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L4
.L2:
	mov	r3, #0
	str	r3, [fp, #-20]
.L4:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	4100
	.size	ccbuff_isEmpty, .-ccbuff_isEmpty
	.align	2
	.global	ccbuff_init
	.type	ccbuff_init, %function
ccbuff_init:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r1, [fp, #-16]
	mov	r2, #4096
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-16]
	ldr	r2, .L10
	mov	r3, #0
	str	r3, [r1, r2]
	ldmfd	sp, {r3, fp, sp, pc}
.L11:
	.align	2
.L10:
	.word	4100
	.size	ccbuff_init, .-ccbuff_init
	.align	2
	.global	ccbuff_pop
	.type	ccbuff_pop, %function
ccbuff_pop:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	mov	r3, #4096
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-20]
	ldr	r3, .L19
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L13
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L15
.L13:
	ldr	r2, [fp, #-20]
	ldr	r3, .L19
	ldr	r3, [r2, r3]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #4096
	bne	.L16
	mov	r3, #0
	str	r3, [fp, #-16]
.L16:
	ldr	r2, [fp, #-20]
	ldr	r3, .L19
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, r2]
	and	r3, r3, #255
	ldr	r2, [fp, #-24]
	strb	r3, [r2, #0]
	ldr	r1, [fp, #-20]
	ldr	r2, .L19
	ldr	r3, [fp, #-16]
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-28]
.L15:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L20:
	.align	2
.L19:
	.word	4100
	.size	ccbuff_pop, .-ccbuff_pop
	.align	2
	.global	ccbuff_push
	.type	ccbuff_push, %function
ccbuff_push:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	mov	r3, r1
	strb	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	mov	r3, #4096
	ldr	r3, [r2, r3]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #4096
	bne	.L22
	mov	r3, #0
	str	r3, [fp, #-16]
.L22:
	ldr	r2, [fp, #-24]
	ldr	r3, .L27
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L24
	ldr	r3, [fp, #-24]
	sub	r2, fp, #17
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_pop(PLT)
.L24:
	ldr	r2, [fp, #-24]
	mov	r3, #4096
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldrb	r3, [fp, #-28]
	strb	r3, [r2, r1]
	ldr	r1, [fp, #-24]
	mov	r2, #4096
	ldr	r3, [fp, #-16]
	str	r3, [r1, r2]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L28:
	.align	2
.L27:
	.word	4100
	.size	ccbuff_push, .-ccbuff_push
	.align	2
	.global	ccbuffS_isEmpty
	.type	ccbuffS_isEmpty, %function
ccbuffS_isEmpty:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L30
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L32
.L30:
	mov	r3, #0
	str	r3, [fp, #-20]
.L32:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	ccbuffS_isEmpty, .-ccbuffS_isEmpty
	.align	2
	.global	ccbuffS_init
	.type	ccbuffS_init, %function
ccbuffS_init:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #12]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #16]
	ldmfd	sp, {r3, fp, sp, pc}
	.size	ccbuffS_init, .-ccbuffS_init
	.align	2
	.global	ccbuffS_pop
	.type	ccbuffS_pop, %function
ccbuffS_pop:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L37
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L39
.L37:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #10
	bne	.L40
	mov	r3, #0
	str	r3, [fp, #-16]
.L40:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, r2]
	and	r3, r3, #255
	ldr	r2, [fp, #-24]
	strb	r3, [r2, #0]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #16]
	mov	r3, #0
	str	r3, [fp, #-28]
.L39:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	ccbuffS_pop, .-ccbuffS_pop
	.align	2
	.global	ccbuffS_push
	.type	ccbuffS_push, %function
ccbuffS_push:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	mov	r3, r1
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #10
	bne	.L44
	mov	r3, #0
	str	r3, [fp, #-16]
.L44:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L46
	ldr	r3, [fp, #-24]
	sub	r2, fp, #17
	mov	r0, r3
	mov	r1, r2
	bl	ccbuffS_pop(PLT)
.L46:
	ldr	r3, [fp, #-24]
	ldr	r1, [r3, #12]
	ldr	r2, [fp, #-24]
	ldrb	r3, [fp, #-28]
	strb	r3, [r2, r1]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #12]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	ccbuffS_push, .-ccbuffS_push
	.align	2
	.global	ccbuffS_peak
	.type	ccbuffS_peak, %function
ccbuffS_peak:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L50
	mvn	r2, #0
	str	r2, [fp, #-36]
	b	.L52
.L50:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #16]
	rsb	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bge	.L53
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #10
	str	r3, [fp, #-20]
.L53:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L55
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L52
.L55:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	sub	r1, r3, #1
	ldr	r3, .L58
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r3, r3, r1
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	ldr	r2, [fp, #-28]
	strb	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-36]
.L52:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L59:
	.align	2
.L58:
	.word	1717986919
	.size	ccbuffS_peak, .-ccbuffS_peak
	.align	2
	.global	glbs_init
	.type	glbs_init, %function
glbs_init:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	add	r3, r3, #4096
	add	r3, r3, #8
	mov	r0, r3
	bl	ccbuff_init(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #8192
	add	r3, r3, #16
	mov	r0, r3
	bl	ccbuff_init(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #12352
	mov	r0, r3
	bl	ccbuff_init(PLT)
	ldr	r3, [fp, #-20]
	mov	r0, r3
	bl	ccbuff_init(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #16384
	add	r3, r3, #72
	mov	r0, r3
	bl	ccbuff_init(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #12288
	add	r3, r3, #24
	mov	r0, r3
	bl	ccbuffS_init(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #12288
	add	r3, r3, #44
	mov	r0, r3
	bl	ccbuffS_init(PLT)
	ldr	r1, [fp, #-20]
	ldr	r2, .L65
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+4
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+8
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+12
	ldr	r3, .L65+16
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+20
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+24
	ldr	r3, .L65+16
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+28
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+32
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+36
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+40
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+44
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+48
	mov	r3, #0
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L61
.L62:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r1, .L65+52
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r1, .L65+56
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, r1
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L61:
	ldr	r3, [fp, #-16]
	cmp	r3, #9
	ble	.L62
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+60
	mov	r3, #1
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+64
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+68
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r1, [fp, #-20]
	ldr	r2, .L65+72
	mov	r3, #5
	str	r3, [r1, r2]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L66:
	.align	2
.L65:
	.word	20560
	.word	20572
	.word	20568
	.word	20576
	.word	1828800000
	.word	20580
	.word	20584
	.word	20588
	.word	20592
	.word	20596
	.word	20600
	.word	20604
	.word	20564
	.word	21056
	.word	21096
	.word	21136
	.word	21140
	.word	21148
	.word	21152
	.size	glbs_init, .-glbs_init
	.align	2
	.global	nextState
	.type	nextState, %function
nextState:
	@ args = 12, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #44
	str	r0, [fp, #-16]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	mov	r3, r1
	strb	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r3, #32
	addls	pc, pc, r3, asl #2
	b	.L68
	.p2align 2
.L98:
	b	.L69
	b	.L68
	b	.L70
	b	.L71
	b	.L72
	b	.L73
	b	.L74
	b	.L75
	b	.L76
	b	.L77
	b	.L78
	b	.L79
	b	.L68
	b	.L80
	b	.L81
	b	.L82
	b	.L83
	b	.L84
	b	.L68
	b	.L85
	b	.L86
	b	.L87
	b	.L88
	b	.L89
	b	.L90
	b	.L91
	b	.L92
	b	.L93
	b	.L68
	b	.L94
	b	.L95
	b	.L96
	b	.L97
.L69:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #108
	cmp	r3, #8
	addls	pc, pc, r3, asl #2
	b	.L99
	.p2align 2
.L106:
	b	.L100
	b	.L99
	b	.L99
	b	.L99
	b	.L101
	b	.L102
	b	.L103
	b	.L104
	b	.L105
.L101:
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #90
	str	r2, [fp, #-56]
	b	.L107
.L102:
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-56]
	b	.L107
.L105:
	mov	r2, #2
	str	r2, [fp, #-56]
	b	.L107
.L103:
	mov	r3, #13
	str	r3, [fp, #-56]
	b	.L107
.L104:
	mov	r2, #19
	str	r2, [fp, #-56]
	b	.L107
.L100:
	mov	r3, #29
	str	r3, [fp, #-56]
	b	.L107
.L99:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L107
.L70:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #114
	beq	.L109
	b	.L108
.L109:
	mov	r3, #3
	str	r3, [fp, #-56]
	b	.L107
.L108:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L107
.L71:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L111
	b	.L110
.L111:
	mov	r3, #4
	str	r3, [fp, #-56]
	b	.L107
.L110:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L107
.L72:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	addls	pc, pc, r3, asl #2
	b	.L112
	.p2align 2
.L116:
	b	.L113
	b	.L113
	b	.L113
	b	.L113
	b	.L113
	b	.L113
	b	.L113
	b	.L113
	b	.L114
	b	.L115
.L113:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	mov	r3, #5
	str	r3, [fp, #-56]
	b	.L107
.L114:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	mov	r2, #6
	str	r2, [fp, #-56]
	b	.L107
.L115:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	mov	r3, #7
	str	r3, [fp, #-56]
	b	.L107
.L112:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L107
.L73:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-52]
	cmp	r2, #32
	beq	.L118
	ldr	r3, [fp, #-52]
	cmp	r3, #32
	blt	.L117
	ldr	r2, [fp, #-52]
	sub	r3, r2, #48
	cmp	r3, #9
	bhi	.L117
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	mov	r3, #7
	str	r3, [fp, #-56]
	b	.L107
.L118:
	mov	r2, #9
	str	r2, [fp, #-56]
	b	.L107
.L117:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L74:
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	str	r2, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #32
	beq	.L121
	ldr	r2, [fp, #-48]
	cmp	r2, #48
	beq	.L122
	b	.L120
.L122:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	mov	r3, #8
	str	r3, [fp, #-56]
	b	.L107
.L121:
	mov	r2, #9
	str	r2, [fp, #-56]
	b	.L107
.L120:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L75:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L124
	b	.L123
.L124:
	mov	r2, #9
	str	r2, [fp, #-56]
	b	.L107
.L123:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L76:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L126
	b	.L125
.L126:
	mov	r2, #9
	str	r2, [fp, #-56]
	b	.L107
.L125:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L77:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	addls	pc, pc, r3, asl #2
	b	.L127
	.p2align 2
.L131:
	b	.L128
	b	.L129
	b	.L130
	b	.L130
	b	.L130
	b	.L130
	b	.L130
	b	.L130
	b	.L130
	b	.L130
.L128:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #4]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #10
	str	r2, [fp, #-56]
	b	.L107
.L129:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #4]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #11
	str	r3, [fp, #-56]
	b	.L107
.L130:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #4]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #12
	str	r2, [fp, #-56]
	b	.L107
.L127:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L78:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	bhi	.L132
	ldr	r3, [fp, #4]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #4]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #12
	str	r2, [fp, #-56]
	b	.L107
.L132:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L79:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #4
	bhi	.L134
	ldr	r3, [fp, #4]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #4]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #12
	str	r2, [fp, #-56]
	b	.L107
.L134:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L80:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #118
	beq	.L137
	b	.L136
.L137:
	mov	r2, #14
	str	r2, [fp, #-56]
	b	.L107
.L136:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L81:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L139
	b	.L138
.L139:
	mov	r2, #15
	str	r2, [fp, #-56]
	b	.L107
.L138:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L82:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	addls	pc, pc, r3, asl #2
	b	.L140
	.p2align 2
.L144:
	b	.L141
	b	.L141
	b	.L141
	b	.L141
	b	.L141
	b	.L141
	b	.L141
	b	.L141
	b	.L142
	b	.L143
.L141:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #16
	str	r2, [fp, #-56]
	b	.L107
.L142:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #17
	str	r3, [fp, #-56]
	b	.L107
.L143:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #18
	str	r2, [fp, #-56]
	b	.L107
.L140:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L83:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	bhi	.L145
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #18
	str	r2, [fp, #-56]
	b	.L107
.L145:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L84:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #48
	beq	.L148
	b	.L147
.L148:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #18
	str	r2, [fp, #-56]
	b	.L107
.L147:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L85:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #119
	beq	.L150
	b	.L149
.L150:
	mov	r2, #20
	str	r2, [fp, #-56]
	b	.L107
.L149:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L86:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L152
	b	.L151
.L152:
	mov	r2, #21
	str	r2, [fp, #-56]
	b	.L107
.L151:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L87:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	addls	pc, pc, r3, asl #2
	b	.L153
	.p2align 2
.L157:
	b	.L154
	b	.L154
	b	.L155
	b	.L156
	b	.L156
	b	.L156
	b	.L156
	b	.L156
	b	.L156
	b	.L156
.L154:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #8]
	str	r2, [r3, #0]
	mov	r2, #22
	str	r2, [fp, #-56]
	b	.L107
.L155:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #8]
	str	r2, [r3, #0]
	mov	r3, #23
	str	r3, [fp, #-56]
	b	.L107
.L156:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #8]
	str	r2, [r3, #0]
	mov	r2, #24
	str	r2, [fp, #-56]
	b	.L107
.L153:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L88:
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	str	r2, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #32
	beq	.L159
	ldr	r2, [fp, #-44]
	cmp	r2, #32
	blt	.L158
	ldr	r2, [fp, #-44]
	sub	r3, r2, #48
	cmp	r3, #9
	bhi	.L158
	ldr	r3, [fp, #8]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #8]
	str	r2, [r3, #0]
	mov	r3, #24
	str	r3, [fp, #-56]
	b	.L107
.L159:
	mov	r2, #27
	str	r2, [fp, #-56]
	b	.L107
.L158:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L89:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #32
	cmp	r3, #25
	addls	pc, pc, r3, asl #2
	b	.L161
	.p2align 2
.L166:
	b	.L162
	b	.L161
	b	.L161
	b	.L161
	b	.L161
	b	.L161
	b	.L161
	b	.L161
	b	.L161
	b	.L161
	b	.L161
	b	.L161
	b	.L161
	b	.L161
	b	.L161
	b	.L161
	b	.L163
	b	.L163
	b	.L163
	b	.L163
	b	.L163
	b	.L164
	b	.L165
	b	.L165
	b	.L165
	b	.L165
.L163:
	ldr	r3, [fp, #8]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #8]
	str	r2, [r3, #0]
	mov	r2, #24
	str	r2, [fp, #-56]
	b	.L107
.L164:
	ldr	r3, [fp, #8]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #8]
	str	r2, [r3, #0]
	mov	r3, #25
	str	r3, [fp, #-56]
	b	.L107
.L165:
	ldr	r3, [fp, #8]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #8]
	str	r2, [r3, #0]
	mov	r2, #26
	str	r2, [fp, #-56]
	b	.L107
.L162:
	mov	r3, #27
	str	r3, [fp, #-56]
	b	.L107
.L161:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L107
.L90:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-40]
	cmp	r2, #32
	beq	.L168
	ldr	r3, [fp, #-40]
	cmp	r3, #32
	blt	.L167
	ldr	r2, [fp, #-40]
	sub	r3, r2, #48
	cmp	r3, #9
	bhi	.L167
	ldr	r3, [fp, #8]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #8]
	str	r2, [r3, #0]
	mov	r3, #26
	str	r3, [fp, #-56]
	b	.L107
.L168:
	mov	r2, #27
	str	r2, [fp, #-56]
	b	.L107
.L167:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L91:
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	str	r2, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #32
	beq	.L171
	ldr	r2, [fp, #-36]
	cmp	r2, #32
	blt	.L170
	ldr	r2, [fp, #-36]
	sub	r3, r2, #48
	cmp	r3, #5
	bhi	.L170
	ldr	r3, [fp, #8]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #8]
	str	r2, [r3, #0]
	mov	r3, #26
	str	r3, [fp, #-56]
	b	.L107
.L171:
	mov	r2, #27
	str	r2, [fp, #-56]
	b	.L107
.L170:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L92:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L174
	b	.L173
.L174:
	mov	r2, #27
	str	r2, [fp, #-56]
	b	.L107
.L173:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L107
.L93:
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #67
	beq	.L176
	ldr	r2, [fp, #-32]
	cmp	r2, #83
	beq	.L176
	b	.L175
.L176:
	ldr	r2, [fp, #12]
	ldrb	r3, [fp, #-20]
	strb	r3, [r2, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #28
	str	r3, [fp, #-56]
	b	.L107
.L175:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L107
.L94:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L178
	b	.L177
.L178:
	mov	r3, #30
	str	r3, [fp, #-56]
	b	.L107
.L177:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L107
.L95:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	addls	pc, pc, r3, asl #2
	b	.L179
	.p2align 2
.L183:
	b	.L180
	b	.L180
	b	.L180
	b	.L180
	b	.L180
	b	.L180
	b	.L180
	b	.L180
	b	.L181
	b	.L182
.L180:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #31
	str	r3, [fp, #-56]
	b	.L107
.L181:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #32
	str	r2, [fp, #-56]
	b	.L107
.L182:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #33
	str	r3, [fp, #-56]
	b	.L107
.L179:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L107
.L96:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	bhi	.L184
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #33
	str	r3, [fp, #-56]
	b	.L107
.L184:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L107
.L97:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #48
	beq	.L187
	b	.L186
.L187:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #0]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	add	r3, r2, r3
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #33
	str	r3, [fp, #-56]
	b	.L107
.L186:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L107
.L68:
	mvn	r3, #0
	str	r3, [fp, #-56]
.L107:
	ldr	r3, [fp, #-56]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	nextState, .-nextState
	.align	2
	.global	set_timer_check
	.type	set_timer_check, %function
set_timer_check:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, .L191
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldr	ip, [r3, #0]
	ldr	r2, [fp, #-20]
	ldr	r1, .L191+4
	mov	r3, r0, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	str	ip, [r3, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L192:
	.align	2
.L191:
	.word	-2139029372
	.word	21016
	.size	set_timer_check, .-set_timer_check
	.align	2
	.global	pie_putc
	.type	pie_putc, %function
pie_putc:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, r2
	strb	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L195
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	beq	.L196
	b	.L194
.L195:
	ldr	r3, [fp, #-20]
	add	r3, r3, #4096
	add	r3, r3, #8
	ldrb	r2, [fp, #-24]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_push(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	b	.L197
.L196:
	ldr	r3, [fp, #-20]
	add	r3, r3, #8192
	add	r3, r3, #16
	ldrb	r2, [fp, #-24]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_push(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	b	.L197
.L194:
	mvn	r3, #0
	str	r3, [fp, #-28]
.L197:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pie_putc, .-pie_putc
	.align	2
	.global	pie_putw
	.type	pie_putw, %function
pie_putw:
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	strb	r3, [fp, #-36]
	ldr	r3, [fp, #4]
	str	r3, [fp, #-16]
	b	.L200
.L201:
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
.L200:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	eor	r3, r2, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L204
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bgt	.L201
	b	.L204
.L205:
	ldrb	r3, [fp, #-36]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putc(PLT)
.L204:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
	cmp	r2, #0
	bne	.L205
	b	.L207
.L208:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putc(PLT)
.L207:
	ldr	r3, [fp, #4]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #4]
	add	r3, r3, #1
	str	r3, [fp, #4]
	cmp	r2, #0
	bne	.L208
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pie_putw, .-pie_putw
	.align	2
	.global	pie_putstr
	.type	pie_putstr, %function
pie_putstr:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	b	.L212
.L213:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r2, r3
	bl	pie_putc(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L214
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L216
.L214:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L212:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L213
	mov	r3, #0
	str	r3, [fp, #-28]
.L216:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pie_putstr, .-pie_putstr
	.align	2
	.global	pie_c2x
	.type	pie_c2x, %function
pie_c2x:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #9
	bhi	.L220
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #48
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
	b	.L222
.L220:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #87
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
.L222:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pie_c2x, .-pie_c2x
	.align	2
	.global	pie_putx
	.type	pie_putx, %function
pie_putx:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	mov	r3, r2
	strb	r3, [fp, #-28]
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #4
	and	r3, r3, #255
	mov	r0, r3
	bl	pie_c2x(PLT)
	mov	r3, r0
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	and	r3, r3, #15
	mov	r0, r3
	bl	pie_c2x(PLT)
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	mov	r2, r3
	bl	pie_putc(PLT)
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	mov	r2, r3
	bl	pie_putc(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pie_putx, .-pie_putx
	.align	2
	.global	pie_putr
	.type	pie_putr, %function
pie_putr:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	sub	r3, fp, #32
	str	r3, [fp, #-16]
	mov	r3, #3
	str	r3, [fp, #-20]
	b	.L227
.L228:
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putx(PLT)
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L227:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L228
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, #32
	bl	pie_putc(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pie_putr, .-pie_putr
	.align	2
	.global	pie_a2d
	.type	pie_a2d, %function
pie_a2d:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-16]
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L232
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L232
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-20]
	b	.L235
.L232:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L236
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #102
	bhi	.L236
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #87
	str	r3, [fp, #-20]
	b	.L235
.L236:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L239
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #70
	bhi	.L239
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #55
	str	r3, [fp, #-20]
	b	.L235
.L239:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L235:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pie_a2d, .-pie_a2d
	.align	2
	.global	pie_a2i
	.type	pie_a2i, %function
pie_a2i:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	str	r3, [fp, #-40]
	mov	r3, r0
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L244
.L245:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bgt	.L246
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	mul	r2, r3, r2
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L244:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	bl	pie_a2d(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L245
.L246:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pie_a2i, .-pie_a2i
	.global	__udivsi3
	.global	__umodsi3
	.align	2
	.global	pie_ui2a
	.type	pie_ui2a, %function
pie_ui2a:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L250
.L251:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
.L250:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bcs	.L251
	b	.L263
.L254:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	ldr	r1, [fp, #-16]
	bl	__umodsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-32]
	bl	__udivsi3(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L255
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L255
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L253
.L255:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L258
	mov	r1, #48
	str	r1, [fp, #-40]
	b	.L260
.L258:
	mov	r3, #87
	str	r3, [fp, #-40]
.L260:
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	ldr	r1, [fp, #-40]
	mov	r2, r1
	add	r3, r2, r3
	and	r3, r3, #255
	and	r3, r3, #255
	ldr	r2, [fp, #-36]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L253:
.L263:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L254
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pie_ui2a, .-pie_ui2a
	.align	2
	.global	pie_i2a
	.type	pie_i2a, %function
pie_i2a:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L265
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, #45
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L265:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	mov	r1, #10
	ldr	r2, [fp, #-20]
	bl	pie_ui2a(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pie_i2a, .-pie_i2a
	.align	2
	.global	pie_format
	.type	pie_format, %function
pie_format:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #48
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	str	r2, [fp, #-44]
	str	r3, [fp, #-48]
	b	.L287
.L270:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L271
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r2, r3
	bl	pie_putc(PLT)
	b	.L269
.L271:
	mov	r3, #0
	strb	r3, [fp, #-13]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-44]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-44]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	cmp	r3, #48
	beq	.L274
	ldr	r3, [fp, #-56]
	cmp	r3, #48
	blt	.L273
	ldr	r3, [fp, #-56]
	cmp	r3, #57
	bgt	.L273
	b	.L275
.L274:
	mov	r3, #1
	strb	r3, [fp, #-13]
	ldr	r2, [fp, #-44]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-44]
	b	.L273
.L275:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	sub	r2, fp, #44
	sub	ip, fp, #32
	mov	r0, r3
	mov	r1, r2
	mov	r2, #10
	mov	r3, ip
	bl	pie_a2i(PLT)
	mov	r3, r0
	strb	r3, [fp, #-14]
.L273:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #115
	beq	.L280
	ldr	r3, [fp, #-52]
	cmp	r3, #115
	bgt	.L283
	ldr	r3, [fp, #-52]
	cmp	r3, #99
	beq	.L278
	ldr	r3, [fp, #-52]
	cmp	r3, #99
	bgt	.L284
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	beq	.L286
	ldr	r3, [fp, #-52]
	cmp	r3, #37
	beq	.L277
	b	.L269
.L284:
	ldr	r3, [fp, #-52]
	cmp	r3, #100
	beq	.L279
	b	.L269
.L283:
	ldr	r3, [fp, #-52]
	cmp	r3, #117
	beq	.L281
	ldr	r3, [fp, #-52]
	cmp	r3, #120
	beq	.L282
	b	.L269
.L278:
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r2, r3
	bl	pie_putc(PLT)
	b	.L269
.L280:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r3, #0
	bl	pie_putw(PLT)
	b	.L269
.L281:
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #10
	bl	pie_ui2a(PLT)
	ldr	r2, [fp, #-32]
	ldrb	ip, [fp, #-13]	@ zero_extendqisi2
	sub	r3, fp, #26
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r3, ip
	bl	pie_putw(PLT)
	b	.L269
.L279:
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, r2
	bl	pie_i2a(PLT)
	ldr	r2, [fp, #-32]
	ldrb	ip, [fp, #-13]	@ zero_extendqisi2
	sub	r3, fp, #26
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r3, ip
	bl	pie_putw(PLT)
	b	.L269
.L282:
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #16
	bl	pie_ui2a(PLT)
	ldr	r2, [fp, #-32]
	ldrb	ip, [fp, #-13]	@ zero_extendqisi2
	sub	r3, fp, #26
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r3, ip
	bl	pie_putw(PLT)
	b	.L269
.L277:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r2, r3
	bl	pie_putc(PLT)
.L269:
.L287:
	ldr	r1, [fp, #-44]
	ldrb	r3, [r1, #0]
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	add	r3, r1, #1
	str	r3, [fp, #-44]
	cmp	r2, #0
	bne	.L270
.L286:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pie_format, .-pie_format
	.align	2
	.global	pie_printf
	.type	pie_printf, %function
pie_printf:
	@ args = 4, pretend = 8, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 1
	mov	ip, sp
	stmfd	sp!, {r2, r3}
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #12
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	add	r3, fp, #8
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #4]
	ldr	r3, [fp, #-16]
	bl	pie_format(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pie_printf, .-pie_printf
	.align	2
	.global	push_character
	.type	push_character, %function
push_character:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L292
	ldr	r3, [fp, #-44]
	cmp	r3, #1
	beq	.L293
	b	.L291
.L292:
	ldr	r3, .L308
	str	r3, [fp, #-20]
	ldr	r3, .L308+4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	add	r3, r3, #4096
	add	r3, r3, #8
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L297
	mvn	r3, #0
	str	r3, [fp, #-40]
	b	.L296
.L293:
	ldr	r3, .L308+8
	str	r3, [fp, #-20]
	ldr	r3, .L308+12
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	add	r3, r3, #8192
	add	r3, r3, #16
	str	r3, [fp, #-16]
	b	.L297
.L291:
	mvn	r3, #0
	str	r3, [fp, #-40]
	b	.L296
.L297:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L298
	ldr	r3, [fp, #-16]
	sub	r2, fp, #25
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_pop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L300
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L302
	ldr	r3, [fp, #-36]
	ldr	r2, .L308+16
	ldr	r3, [r3, r2]
	cmp	r3, #0
	bne	.L304
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #133
	bne	.L304
	ldr	r1, [fp, #-36]
	ldr	r2, .L308+16
	mov	r3, #1
	str	r3, [r1, r2]
.L304:
	ldr	r0, [fp, #-36]
	mov	r1, #0
	bl	set_timer_check(PLT)
.L302:
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L296
.L300:
	mvn	r3, #0
	str	r3, [fp, #-40]
	b	.L296
.L298:
	mvn	r3, #0
	str	r3, [fp, #-40]
.L296:
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L309:
	.align	2
.L308:
	.word	-2138308584
	.word	-2138308608
	.word	-2138243048
	.word	-2138243072
	.word	21152
	.size	push_character, .-push_character
	.align	2
	.global	pie_setfifo
	.type	pie_setfifo, %function
pie_setfifo:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L312
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	beq	.L313
	b	.L311
.L312:
	ldr	r3, .L320
	str	r3, [fp, #-16]
	b	.L314
.L313:
	ldr	r3, .L320+4
	str	r3, [fp, #-16]
	b	.L314
.L311:
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L315
.L314:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L316
	ldr	r3, [fp, #-20]
	orr	r3, r3, #16
	str	r3, [fp, #-32]
	b	.L318
.L316:
	ldr	r3, [fp, #-20]
	bic	r3, r3, #16
	str	r3, [fp, #-32]
.L318:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-36]
.L315:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L321:
	.align	2
.L320:
	.word	-2138308600
	.word	-2138243064
	.size	pie_setfifo, .-pie_setfifo
	.align	2
	.global	pie_setspeed
	.type	pie_setspeed, %function
pie_setspeed:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r2, [fp, #-24]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L324
	ldr	r2, [fp, #-40]
	cmp	r2, #1
	beq	.L325
	b	.L323
.L324:
	ldr	r3, .L332
	str	r3, [fp, #-20]
	ldr	r3, .L332+4
	str	r3, [fp, #-16]
	b	.L326
.L325:
	ldr	r3, .L332+8
	str	r3, [fp, #-20]
	ldr	r3, .L332+12
	str	r3, [fp, #-16]
	b	.L326
.L323:
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L327
.L326:
	ldr	r2, [fp, #-32]
	str	r2, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #2400
	beq	.L329
	ldr	r3, .L332+16
	ldr	r2, [fp, #-44]
	cmp	r2, r3
	beq	.L330
	b	.L328
.L330:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #3
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L327
.L329:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #191
	str	r3, [r2, #0]
	mov	r2, #0
	str	r2, [fp, #-36]
	b	.L327
.L328:
	mvn	r3, #0
	str	r3, [fp, #-36]
.L327:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L333:
	.align	2
.L332:
	.word	-2138308596
	.word	-2138308592
	.word	-2138243060
	.word	-2138243056
	.word	115200
	.size	pie_setspeed, .-pie_setspeed
	.align	2
	.global	flush_ccb
	.type	flush_ccb, %function
flush_ccb:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L336
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	beq	.L337
	b	.L335
.L336:
	ldr	r3, [fp, #-24]
	add	r3, r3, #4096
	add	r3, r3, #8
	str	r3, [fp, #-16]
	b	.L338
.L337:
	ldr	r3, [fp, #-24]
	add	r3, r3, #8192
	add	r3, r3, #16
	str	r3, [fp, #-16]
	b	.L338
.L335:
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L339
.L338:
	ldr	r0, [fp, #-16]
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L340
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	bl	push_character(PLT)
	b	.L338
.L340:
	mov	r3, #0
	str	r3, [fp, #-28]
.L339:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	flush_ccb, .-flush_ccb
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\033[2J\033[H\000"
	.align	2
.LC1:
	.ascii	"\012\015\000"
	.align	2
.LC2:
	.ascii	"*\033[%d;%dH*\012\015\000"
	.align	2
.LC3:
	.ascii	"\033[%d;%dH Switches\000"
	.align	2
.LC4:
	.ascii	"\033[%d;%dH %d\000"
	.align	2
.LC5:
	.ascii	"\033[%d;%dH %x\000"
	.align	2
.LC6:
	.ascii	"\033[%d;40H                \033[%d;40HSensors\000"
	.align	2
.LC7:
	.ascii	"\033[%d;2H%c\000"
	.align	2
.LC8:
	.ascii	"\033[?25l\000"
	.text
	.align	2
	.global	screen_init
	.type	screen_init, %function
screen_init:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L357
.L356:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	bl	pie_setfifo(PLT)
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L357+4
	add	r3, sl, r3
	mov	r2, r3
	bl	pie_printf(PLT)
	ldr	r3, .L357+8
	add	r3, sl, r3
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	mov	r2, #150
	mov	r3, #42
	bl	pie_putw(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L344
.L345:
	mov	r3, #148
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L357+12
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	pie_printf(PLT)
	ldr	r3, [fp, #-20]
	eor	r3, r3, #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L346
	mov	r0, #1
	ldr	r1, [fp, #-24]
	bl	flush_ccb(PLT)
.L346:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L344:
	ldr	r3, [fp, #-20]
	cmp	r3, #35
	ble	.L345
	ldr	r3, .L357+8
	add	r3, sl, r3
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	mov	r2, #150
	mov	r3, #42
	bl	pie_putw(PLT)
	mov	r0, #1
	ldr	r1, [fp, #-24]
	bl	flush_ccb(PLT)
	mov	r3, #22
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L357+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #5
	bl	pie_printf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L349
.L350:
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, #22
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r2, [sp, #0]
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L357+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #6
	bl	pie_printf(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L349:
	ldr	r3, [fp, #-20]
	cmp	r3, #8
	ble	.L350
	mov	r0, #1
	ldr	r1, [fp, #-24]
	bl	flush_ccb(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L352
.L353:
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r2, r3, #22
	ldr	r3, [fp, #-20]
	add	r3, r3, #10
	str	r2, [sp, #0]
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L357+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #8
	bl	pie_printf(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L352:
	ldr	r3, [fp, #-20]
	cmp	r3, #8
	ble	.L353
	mov	r3, #22
	str	r3, [sp, #0]
	mov	r3, #153
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L357+24
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #10
	bl	pie_printf(PLT)
	mov	r3, #27
	str	r3, [sp, #0]
	mov	r3, #154
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L357+24
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #10
	bl	pie_printf(PLT)
	mov	r3, #22
	str	r3, [sp, #0]
	mov	r3, #155
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L357+24
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #12
	bl	pie_printf(PLT)
	mov	r3, #27
	str	r3, [sp, #0]
	mov	r3, #156
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L357+24
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #12
	bl	pie_printf(PLT)
	mov	r3, #19
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L357+28
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #19
	bl	pie_printf(PLT)
	mov	r3, #62
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L357+32
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #35
	bl	pie_printf(PLT)
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L357+36
	add	r3, sl, r3
	mov	r2, r3
	bl	pie_printf(PLT)
	mov	r0, #1
	ldr	r1, [fp, #-24]
	bl	flush_ccb(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L358:
	.align	2
.L357:
	.word	_GLOBAL_OFFSET_TABLE_-(.L356+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.size	screen_init, .-screen_init
	.section	.rodata
	.align	2
.LC9:
	.ascii	"\033[%d;1H\033[K*\033[%d;%dH*\033[%d;%dH\000"
	.text
	.align	2
	.global	flush_message_display
	.type	flush_message_display, %function
flush_message_display:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L362
.L361:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, .L362+4
	ldr	r3, [r2, r3]
	add	r2, r3, #2
	mov	r3, #34
	str	r3, [sp, #0]
	mov	r3, #148
	str	r3, [sp, #4]
	mov	r3, #35
	str	r3, [sp, #8]
	str	r2, [sp, #12]
	mov	r0, #1
	ldr	r1, [fp, #-20]
	ldr	r3, .L362+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #34
	bl	pie_printf(PLT)
	ldr	r1, [fp, #-20]
	ldr	r2, .L362+12
	mov	r3, #0
	str	r3, [r1, r2]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L363:
	.align	2
.L362:
	.word	_GLOBAL_OFFSET_TABLE_-(.L361+8)
	.word	20560
	.word	.LC9(GOTOFF)
	.word	20568
	.size	flush_message_display, .-flush_message_display
	.section	.rodata
	.align	2
.LC10:
	.ascii	"\033[%d;1H\033[K*\033[%d;%dH*\012\015\000"
	.text
	.align	2
	.global	flush_command_display
	.type	flush_command_display, %function
flush_command_display:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L367
.L366:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	mov	r3, #35
	str	r3, [sp, #0]
	mov	r3, #148
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-20]
	ldr	r3, .L367+4
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #35
	bl	pie_printf(PLT)
	mov	r3, #62
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-20]
	ldr	r3, .L367+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #35
	bl	pie_printf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L368:
	.align	2
.L367:
	.word	_GLOBAL_OFFSET_TABLE_-(.L366+8)
	.word	.LC10(GOTOFF)
	.word	.LC7(GOTOFF)
	.size	flush_command_display, .-flush_command_display
	.section	.rodata
	.align	2
.LC11:
	.ascii	"\033[%d;2H\033[31m\033[1m%s\033[0m\000"
	.align	2
.LC12:
	.ascii	"\033[%d;2H\033[32m\033[1m%s\033[0m\000"
	.text
	.align	2
	.global	push_message
	.type	push_message, %function
push_message:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L377
.L376:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldr	r2, .L377+4
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L370
	ldr	r0, [fp, #-20]
	bl	flush_message_display(PLT)
.L370:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L373
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	beq	.L374
	b	.L372
.L373:
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-20]
	ldr	r3, .L377+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #34
	bl	pie_printf(PLT)
	b	.L372
.L374:
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-20]
	ldr	r3, .L377+12
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #34
	bl	pie_printf(PLT)
.L372:
	ldr	r1, [fp, #-20]
	ldr	r2, .L377+4
	mov	r3, #1
	str	r3, [r1, r2]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L378:
	.align	2
.L377:
	.word	_GLOBAL_OFFSET_TABLE_-(.L376+8)
	.word	20568
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.size	push_message, .-push_message
	.align	2
	.global	push_sensor
	.type	push_sensor, %function
push_sensor:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, .L387
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L380
	ldr	r2, [fp, #-16]
	ldr	r3, .L387+4
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L380
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L383
.L380:
	ldr	r3, [fp, #-16]
	ldr	r2, .L387+8
	ldr	r3, [r3, r2]
	cmp	r3, #9
	bgt	.L384
	ldr	r2, [fp, #-16]
	ldr	r3, .L387+8
	ldr	r3, [r2, r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-16]
	ldr	r3, .L387+8
	str	r1, [r2, r3]
.L384:
	ldr	r3, [fp, #-16]
	add	r2, r3, #12288
	add	r2, r2, #24
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r0, r2
	mov	r1, r3
	bl	ccbuffS_push(PLT)
	ldr	r3, [fp, #-16]
	add	r2, r3, #12288
	add	r2, r2, #44
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r0, r2
	mov	r1, r3
	bl	ccbuffS_push(PLT)
	ldr	r1, [fp, #-16]
	ldr	r2, .L387
	ldr	r3, [fp, #-20]
	str	r3, [r1, r2]
	ldr	r1, [fp, #-16]
	ldr	r2, .L387+4
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-28]
.L383:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L388:
	.align	2
.L387:
	.word	21140
	.word	21144
	.word	21148
	.size	push_sensor, .-push_sensor
	.align	2
	.global	parse_sensors
	.type	parse_sensors, %function
parse_sensors:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r0, r3
	mov	r3, r1
	strb	r3, [fp, #-20]
	mov	r3, r2
	strb	r3, [fp, #-24]
	mov	r3, r0
	strb	r3, [fp, #-28]
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, asl #24
	mov	r3, r3, asr #24
	cmp	r3, #0
	bge	.L390
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #1
	bl	push_sensor(PLT)
.L390:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L392
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #2
	bl	push_sensor(PLT)
.L392:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L394
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #3
	bl	push_sensor(PLT)
.L394:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #4
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L396
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #4
	bl	push_sensor(PLT)
.L396:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #3
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L398
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #5
	bl	push_sensor(PLT)
.L398:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L400
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #6
	bl	push_sensor(PLT)
.L400:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L402
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #7
	bl	push_sensor(PLT)
.L402:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L404
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #8
	bl	push_sensor(PLT)
.L404:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, asl #24
	mov	r3, r3, asr #24
	cmp	r3, #0
	bge	.L406
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #9
	bl	push_sensor(PLT)
.L406:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L408
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #10
	bl	push_sensor(PLT)
.L408:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L410
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #11
	bl	push_sensor(PLT)
.L410:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #4
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L412
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #12
	bl	push_sensor(PLT)
.L412:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #3
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L414
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #13
	bl	push_sensor(PLT)
.L414:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L416
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #14
	bl	push_sensor(PLT)
.L416:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L418
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #15
	bl	push_sensor(PLT)
.L418:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L420
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #16
	bl	push_sensor(PLT)
.L420:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	parse_sensors, .-parse_sensors
	.align	2
	.global	set_timer_delay
	.type	set_timer_delay, %function
set_timer_delay:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, .L428
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L424
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-20]
	ldr	r3, .L428+4
	str	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #7
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	mov	r1, r3
	ldr	r2, [fp, #-20]
	ldr	r3, .L428+8
	str	r1, [r2, r3]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L426
.L424:
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-20]
	ldr	r3, .L428+12
	str	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #7
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	mov	r1, r3
	ldr	r2, [fp, #-20]
	ldr	r3, .L428+16
	str	r1, [r2, r3]
	mov	r3, #0
	str	r3, [fp, #-32]
.L426:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L429:
	.align	2
.L428:
	.word	-2139029372
	.word	20584
	.word	20588
	.word	20576
	.word	20580
	.size	set_timer_delay, .-set_timer_delay
	.align	2
	.global	timer_passed
	.type	timer_passed, %function
timer_passed:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldr	r2, .L451
	ldr	r3, [r3, r2]
	cmp	r3, #0
	bne	.L431
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L433
.L431:
	ldr	r3, .L451+4
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L434
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, .L451+8
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L451+12
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bgt	.L436
	ldr	r2, [fp, #-24]
	ldr	r3, .L451+8
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L438
	ldr	r2, [fp, #-24]
	ldr	r3, .L451+12
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L451+8
	ldr	r3, [r2, r3]
	rsb	r2, r3, r1
	ldr	r3, .L451+16
	rsb	r3, r2, r3
	ldr	r2, [fp, #-20]
	cmp	r3, r2
	ble	.L438
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L433
.L438:
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L433
.L436:
	ldr	r2, [fp, #-24]
	ldr	r3, .L451+8
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L451+12
	ldr	r3, [r2, r3]
	rsb	r2, r3, r1
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L441
	mov	r0, #1
	ldr	r1, [fp, #-24]
	bl	flush_ccb(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L433
.L441:
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L433
.L434:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, .L451+20
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L451
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bgt	.L443
	ldr	r2, [fp, #-24]
	ldr	r3, .L451+20
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L445
	ldr	r2, [fp, #-24]
	ldr	r3, .L451
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L451+20
	ldr	r3, [r2, r3]
	rsb	r2, r3, r1
	ldr	r3, .L451+16
	rsb	r3, r2, r3
	ldr	r2, [fp, #-20]
	cmp	r3, r2
	ble	.L445
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L433
.L445:
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L433
.L443:
	ldr	r2, [fp, #-24]
	ldr	r3, .L451+20
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L451
	ldr	r3, [r2, r3]
	rsb	r2, r3, r1
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L448
	mov	r0, #1
	ldr	r1, [fp, #-24]
	bl	flush_ccb(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L433
.L448:
	mov	r3, #0
	str	r3, [fp, #-32]
.L433:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L452:
	.align	2
.L451:
	.word	20580
	.word	-2139029372
	.word	20584
	.word	20588
	.word	1828800000
	.word	20576
	.size	timer_passed, .-timer_passed
	.align	2
	.global	poll_sensor
	.type	poll_sensor, %function
poll_sensor:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4096
	add	r3, r3, #8
	mov	r0, r3
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L454
	ldr	r0, [fp, #-16]
	mov	r1, #1
	bl	timer_passed(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L454
	ldr	r3, [fp, #-16]
	mov	r0, r3
	mov	r1, #80
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-16]
	mov	r0, r3
	mov	r1, #133
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-16]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-16]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r1, [fp, #-16]
	ldr	r2, .L459
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r0, [fp, #-16]
	mov	r1, #500
	mov	r2, #1
	bl	set_timer_delay(PLT)
	ldr	r1, [fp, #-16]
	ldr	r2, .L459+4
	mov	r3, #0
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L457
.L454:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L457:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L460:
	.align	2
.L459:
	.word	21136
	.word	20564
	.size	poll_sensor, .-poll_sensor
	.section	.rodata
	.align	2
.LC13:
	.ascii	"\033[6;%dH%d\000"
	.align	2
.LC14:
	.ascii	"\033[7;%dH%d\000"
	.align	2
.LC15:
	.ascii	"\033[8;%dH     \033[8;%dH%d\000"
	.text
	.align	2
	.global	output_max_check
	.type	output_max_check, %function
output_max_check:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	ldr	sl, .L479
.L478:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L462
.L463:
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r0, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	rsb	r3, r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r0, [r3, #0]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r0, r3
	ble	.L464
	ldr	r2, [fp, #-24]
	ldr	r3, .L479+8
	rsb	r3, r2, r3
	str	r3, [fp, #-24]
.L464:
	ldr	r2, [fp, #-24]
	ldr	r3, .L479+12
	smull	r1, r3, r2, r3
	add	r3, r3, r2
	mov	r1, r3, asr #8
	mov	r3, r2, asr #31
	rsb	r3, r3, r1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+16
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L466
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+16
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	str	r0, [r3, #0]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	ip, r3, #67
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	ldr	r3, .L479+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	ip, r3, #67
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	ldr	r3, .L479+24
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
.L466:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+28
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L468
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+28
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	str	r0, [r3, #0]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	ip, r3, #67
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, #67
	ldr	r2, [fp, #-24]
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	ldr	r3, .L479+32
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
.L468:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L462:
	ldr	r3, [fp, #-32]
	add	r2, r3, #1
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L463
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r3, .L479+4
	ldr	r0, [r2, r3]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	rsb	r3, r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-28]
	ldr	r3, .L479+4
	ldr	r3, [r2, r3]
	cmp	r1, r3
	ble	.L471
	ldr	r2, [fp, #-24]
	ldr	r3, .L479+8
	rsb	r3, r2, r3
	str	r3, [fp, #-24]
.L471:
	ldr	r2, [fp, #-24]
	ldr	r3, .L479+12
	smull	r1, r3, r2, r3
	add	r3, r3, r2
	mov	r1, r3, asr #8
	mov	r3, r2, asr #31
	rsb	r3, r3, r1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+16
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L473
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+16
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	str	r0, [r3, #0]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	ip, r3, #67
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	ldr	r3, .L479+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	ip, r3, #67
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	ldr	r3, .L479+24
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
.L473:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+28
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L475
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r1, .L479+28
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	str	r0, [r3, #0]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	ip, r3, #67
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, #67
	ldr	r2, [fp, #-24]
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	ldr	r3, .L479+32
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
.L475:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L480:
	.align	2
.L479:
	.word	_GLOBAL_OFFSET_TABLE_-(.L478+8)
	.word	21016
	.word	1828800000
	.word	-2130574327
	.word	21056
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	21096
	.word	.LC15(GOTOFF)
	.size	output_max_check, .-output_max_check
	.section	.rodata
	.align	2
.LC16:
	.ascii	"\033[%d;40H                \033[%d;40H%c%d\000"
	.align	2
.LC17:
	.ascii	"RECIEVED MORE COMMANDS THAN HOLES TO FILL\000"
	.align	2
.LC18:
	.ascii	"VALID COMMAND! CHOO CHOO MOTHERFUCKA!!\000"
	.align	2
.LC19:
	.ascii	"Quiting!\000"
	.align	2
.LC20:
	.ascii	"INVALID COMMAND! CHECK DOCUMENTATION\000"
	.align	2
.LC21:
	.ascii	"%c\000"
	.text
	.align	2
	.global	process_command_char
	.type	process_command_char, %function
process_command_char:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #72
	ldr	sl, .L535
.L534:
	add	sl, pc, sl
	str	r0, [fp, #-60]
	str	r1, [fp, #-64]
	mov	r3, r2
	strb	r3, [fp, #-68]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	cmp	r3, #0
	beq	.L483
	ldr	r3, [fp, #-76]
	cmp	r3, #1
	beq	.L484
	b	.L482
.L483:
	ldr	r3, [fp, #-64]
	add	r3, r3, #16384
	add	r3, r3, #72
	str	r3, [fp, #-32]
	b	.L485
.L484:
	ldr	r3, [fp, #-64]
	add	r3, r3, #12352
	str	r3, [fp, #-32]
	b	.L485
.L482:
	mvn	r3, #0
	str	r3, [fp, #-72]
	b	.L486
.L485:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	bne	.L487
	ldr	r3, [fp, #-64]
	ldr	r2, .L535+4
	ldr	r3, [r3, r2]
	cmp	r3, #1
	bne	.L489
	ldr	r0, [fp, #-64]
	mov	r1, #1
	bl	set_timer_check(PLT)
	ldr	r1, [fp, #-64]
	ldr	r2, .L535+4
	mov	r3, #2
	str	r3, [r1, r2]
.L489:
	ldr	r3, [fp, #-64]
	add	r3, r3, #16384
	add	r3, r3, #72
	ldrb	r2, [fp, #-68]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_push(PLT)
	ldr	r2, [fp, #-64]
	ldr	r3, .L535+8
	ldr	r3, [r2, r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-64]
	ldr	r3, .L535+8
	str	r1, [r2, r3]
	ldr	r2, [fp, #-64]
	ldr	r3, .L535+8
	ldr	r3, [r2, r3]
	cmp	r3, #10
	bne	.L491
	ldr	r3, [fp, #-64]
	ldr	r2, .L535+4
	ldr	r3, [r3, r2]
	cmp	r3, #2
	bne	.L493
	ldr	r0, [fp, #-64]
	mov	r1, #2
	bl	set_timer_check(PLT)
	ldr	r1, [fp, #-64]
	ldr	r2, .L535+4
	mov	r3, #3
	str	r3, [r1, r2]
	ldr	r0, [fp, #-64]
	mov	r1, #2
	bl	output_max_check(PLT)
.L493:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L495
.L496:
	ldr	r3, [fp, #-64]
	add	r3, r3, #16384
	add	r3, r3, #72
	sub	r2, fp, #33
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_pop(PLT)
	ldr	r3, [fp, #-64]
	add	r3, r3, #16384
	add	r3, r3, #72
	sub	r2, fp, #34
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_pop(PLT)
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	add	r3, r3, #65
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r1, r3
	ldrb	r3, [fp, #-33]	@ zero_extendqisi2
	mov	r2, r3
	ldrb	r3, [fp, #-34]	@ zero_extendqisi2
	ldr	r0, [fp, #-64]
	bl	parse_sensors(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L495:
	ldr	r3, [fp, #-28]
	cmp	r3, #4
	ble	.L496
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L498
.L499:
	ldr	r3, [fp, #-64]
	add	r3, r3, #12288
	add	r3, r3, #24
	mov	r0, r3
	bl	ccbuffS_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L491
	ldr	r3, [fp, #-64]
	add	r3, r3, #12288
	add	r3, r3, #44
	mov	r0, r3
	bl	ccbuffS_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L491
	mov	r3, #0
	strb	r3, [fp, #-35]
	mov	r3, #0
	strb	r3, [fp, #-36]
	ldr	r3, [fp, #-64]
	add	r3, r3, #12288
	add	r3, r3, #24
	sub	r2, fp, #35
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-28]
	bl	ccbuffS_peak(PLT)
	mov	r3, r0
	cmp	r3, #0
	blt	.L491
	ldr	r3, [fp, #-64]
	add	r3, r3, #12288
	add	r3, r3, #44
	sub	r2, fp, #36
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-28]
	bl	ccbuffS_peak(PLT)
	mov	r3, r0
	cmp	r3, #0
	blt	.L491
	ldr	r3, [fp, #-28]
	add	ip, r3, #20
	ldr	r3, [fp, #-28]
	add	r2, r3, #20
	ldrb	r3, [fp, #-35]	@ zero_extendqisi2
	mov	r1, r3
	ldrb	r3, [fp, #-36]	@ zero_extendqisi2
	str	r2, [sp, #0]
	str	r1, [sp, #4]
	str	r3, [sp, #8]
	mov	r0, #1
	ldr	r1, [fp, #-64]
	ldr	r3, .L535+12
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L498:
	ldr	r3, [fp, #-28]
	cmp	r3, #9
	ble	.L499
.L491:
	ldr	r3, [fp, #-64]
	ldr	r2, .L535+8
	ldr	r3, [r3, r2]
	cmp	r3, #10
	ble	.L504
	ldr	r0, [fp, #-64]
	ldr	r3, .L535+16
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #0
	bl	push_message(PLT)
.L504:
	mov	r3, #0
	str	r3, [fp, #-72]
	b	.L486
.L487:
	ldrb	r3, [fp, #-68]	@ zero_extendqisi2
	cmp	r3, #13
	beq	.L507
	b	.L506
.L507:
	ldr	r0, [fp, #-32]
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L508
	mvn	r3, #0
	str	r3, [fp, #-72]
	b	.L486
.L508:
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-52]
	mov	r3, #0
	strb	r3, [fp, #-53]
.L510:
	ldr	r2, [fp, #-32]
	mov	r3, #4096
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L511
	mvn	r3, #1
	str	r3, [fp, #-24]
	b	.L513
.L511:
	ldr	r2, [fp, #-32]
	ldr	r3, .L535+20
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	mov	r2, r3
	sub	ip, fp, #40
	sub	lr, fp, #44
	sub	r3, fp, #48
	str	r3, [sp, #0]
	sub	r3, fp, #52
	str	r3, [sp, #4]
	sub	r3, fp, #53
	str	r3, [sp, #8]
	ldr	r0, [fp, #-24]
	mov	r1, r2
	mov	r2, ip
	mov	r3, lr
	bl	nextState(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L513
	ldr	r2, [fp, #-32]
	mov	r3, #4096
	ldr	r3, [r2, r3]
	sub	r2, r3, #1
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	.L513
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L510
.L513:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	ble	.L516
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	bne	.L516
	ldr	r0, [fp, #-64]
	ldr	r3, .L535+24
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	push_message(PLT)
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	cmp	r3, #89
	addls	pc, pc, r3, asl #2
	b	.L530
	.p2align 2
.L526:
	b	.L520
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L521
	b	.L521
	b	.L521
	b	.L530
	b	.L530
	b	.L530
	b	.L522
	b	.L522
	b	.L522
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L523
	b	.L530
	b	.L530
	b	.L524
	b	.L524
	b	.L524
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L530
	b	.L525
.L520:
	ldr	r0, [fp, #-64]
	ldr	r3, .L535+28
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	push_message(PLT)
	ldr	r1, [fp, #-64]
	ldr	r2, .L535+32
	mov	r3, #1
	str	r3, [r1, r2]
	b	.L530
.L524:
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #76
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #16
	bl	ccbuff_push(PLT)
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-44]
	and	r3, r3, #255
	mov	r0, r2
	mov	r1, r3
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #1
	bl	ccbuff_push(PLT)
	b	.L530
.L522:
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #84
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-44]
	and	r3, r3, #255
	mov	r0, r2
	mov	r1, r3
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #84
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #15
	bl	ccbuff_push(PLT)
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-44]
	and	r3, r3, #255
	mov	r0, r2
	mov	r1, r3
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #84
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-44]
	and	r3, r3, #255
	mov	r0, r2
	mov	r1, r3
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #2
	bl	ccbuff_push(PLT)
	b	.L530
.L521:
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #84
	bl	ccbuff_push(PLT)
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-48]
	and	r3, r3, #255
	mov	r0, r2
	mov	r1, r3
	bl	ccbuff_push(PLT)
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-44]
	and	r3, r3, #255
	mov	r0, r2
	mov	r1, r3
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #1
	bl	ccbuff_push(PLT)
	b	.L530
.L523:
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #83
	bl	ccbuff_push(PLT)
	ldrb	r3, [fp, #-53]	@ zero_extendqisi2
	cmp	r3, #67
	bne	.L527
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #34
	bl	ccbuff_push(PLT)
	b	.L529
.L527:
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #33
	bl	ccbuff_push(PLT)
.L529:
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-52]
	and	r3, r3, #255
	mov	r0, r2
	mov	r1, r3
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #79
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #32
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	b	.L530
.L525:
	ldr	r0, [fp, #-64]
	bl	poll_sensor(PLT)
	b	.L530
.L516:
	ldr	r0, [fp, #-64]
	ldr	r3, .L535+36
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #0
	bl	push_message(PLT)
.L530:
	ldr	r0, [fp, #-32]
	bl	ccbuff_init(PLT)
	ldr	r1, [fp, #-64]
	ldr	r2, .L535+40
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r0, [fp, #-64]
	bl	flush_command_display(PLT)
	mov	r3, #0
	str	r3, [fp, #-72]
	b	.L486
.L506:
	ldr	r3, [fp, #-60]
	cmp	r3, #1
	bne	.L531
	ldrb	r3, [fp, #-68]	@ zero_extendqisi2
	ldr	r0, [fp, #-32]
	mov	r1, r3
	bl	ccbuff_push(PLT)
	ldr	r2, [fp, #-64]
	ldr	r3, .L535+40
	ldr	r3, [r2, r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-64]
	ldr	r3, .L535+40
	str	r1, [r2, r3]
	ldrb	ip, [fp, #-68]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r1, [fp, #-64]
	ldr	r3, .L535+44
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
.L531:
	mov	r3, #0
	str	r3, [fp, #-72]
.L486:
	ldr	r3, [fp, #-72]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L536:
	.align	2
.L535:
	.word	_GLOBAL_OFFSET_TABLE_-(.L534+8)
	.word	21152
	.word	20564
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	4100
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	20572
	.word	.LC20(GOTOFF)
	.word	20560
	.word	.LC21(GOTOFF)
	.size	process_command_char, .-process_command_char
	.align	2
	.global	pull_character
	.type	pull_character, %function
pull_character:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L539
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	beq	.L540
	b	.L538
.L539:
	ldr	r3, .L546
	str	r3, [fp, #-20]
	ldr	r3, .L546+4
	str	r3, [fp, #-24]
	b	.L541
.L540:
	ldr	r3, .L546+8
	str	r3, [fp, #-20]
	ldr	r3, .L546+12
	str	r3, [fp, #-24]
	b	.L541
.L538:
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L542
.L541:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L543
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-32]
	mov	r2, r3
	bl	process_command_char(PLT)
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L542
.L543:
	mvn	r3, #0
	str	r3, [fp, #-36]
.L542:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L547:
	.align	2
.L546:
	.word	-2138308584
	.word	-2138308608
	.word	-2138243048
	.word	-2138243072
	.size	pull_character, .-pull_character
	.section	.rodata
	.align	2
.LC22:
	.ascii	"\033[2;2H00:00:00.0\000"
	.text
	.align	2
	.global	init_clock
	.type	init_clock, %function
init_clock:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L551
.L550:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	ldr	r3, .L551+4
	str	r3, [fp, #-24]
	ldr	r3, .L551+8
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r3, .L551+12
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	orr	r2, r3, #64
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	orr	r2, r3, #8
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	orr	r2, r3, #128
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	ldr	r3, .L551+16
	add	r3, sl, r3
	mov	r2, r3
	bl	pie_printf(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L552:
	.align	2
.L551:
	.word	_GLOBAL_OFFSET_TABLE_-(.L550+8)
	.word	-2139029376
	.word	-2139029368
	.word	20576
	.word	.LC22(GOTOFF)
	.size	init_clock, .-init_clock
	.section	.rodata
	.align	2
.LC23:
	.ascii	"\033[%d;%dH %c\000"
	.align	2
.LC24:
	.ascii	"\033[%d;%dH\033[31m DOUBLE CURVE\033[0m\000"
	.align	2
.LC25:
	.ascii	"\033[%d;%dH             \000"
	.text
	.align	2
	.global	update_switch
	.type	update_switch, %function
update_switch:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	ldr	sl, .L583
.L582:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	cmp	r3, #9
	bgt	.L554
	ldr	r3, [fp, #-32]
	cmp	r3, #34
	bne	.L556
	mov	r3, #67
	strb	r3, [fp, #-20]
	b	.L558
.L556:
	mov	r3, #83
	strb	r3, [fp, #-20]
.L558:
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, #17
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L583+4
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #7
	bl	pie_printf(PLT)
	b	.L559
.L554:
	ldr	r3, [fp, #-28]
	cmp	r3, #18
	bgt	.L560
	ldr	r3, [fp, #-32]
	cmp	r3, #34
	bne	.L562
	mov	r3, #67
	strb	r3, [fp, #-19]
	b	.L564
.L562:
	mov	r3, #83
	strb	r3, [fp, #-19]
.L564:
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	sub	r3, r3, #28
	ldrb	r2, [fp, #-19]	@ zero_extendqisi2
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L583+4
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #9
	bl	pie_printf(PLT)
	b	.L559
.L560:
	ldr	r3, [fp, #-28]
	cmp	r3, #154
	bgt	.L565
	ldr	r3, [fp, #-32]
	cmp	r3, #34
	bne	.L567
	mov	r3, #67
	strb	r3, [fp, #-18]
	b	.L569
.L567:
	mov	r3, #83
	strb	r3, [fp, #-18]
.L569:
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	sub	r3, r3, #740
	sub	r3, r3, #3
	ldrb	r2, [fp, #-18]	@ zero_extendqisi2
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L583+4
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #11
	bl	pie_printf(PLT)
	ldr	r2, [fp, #-24]
	ldr	r3, .L583+8
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L583+12
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L570
	ldrb	r3, [fp, #-18]	@ zero_extendqisi2
	cmp	r3, #67
	bne	.L570
	ldrb	r2, [fp, #-18]	@ zero_extendqisi2
	mov	r3, #32
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L583+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #11
	bl	pie_printf(PLT)
	b	.L559
.L570:
	ldrb	r2, [fp, #-18]	@ zero_extendqisi2
	mov	r3, #32
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L583+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #11
	bl	pie_printf(PLT)
	b	.L559
.L565:
	ldr	r3, [fp, #-28]
	cmp	r3, #156
	bgt	.L559
	ldr	r3, [fp, #-32]
	cmp	r3, #34
	bne	.L575
	mov	r3, #67
	strb	r3, [fp, #-17]
	b	.L577
.L575:
	mov	r3, #83
	strb	r3, [fp, #-17]
.L577:
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	sub	r3, r3, #752
	sub	r3, r3, #1
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L583+4
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #13
	bl	pie_printf(PLT)
	ldr	r2, [fp, #-24]
	ldr	r3, .L583+24
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L583+28
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L578
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #67
	bne	.L578
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r3, #32
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L583+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #13
	bl	pie_printf(PLT)
	b	.L559
.L578:
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r3, #32
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L583+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #13
	bl	pie_printf(PLT)
.L559:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L584:
	.align	2
.L583:
	.word	_GLOBAL_OFFSET_TABLE_-(.L582+8)
	.word	.LC23(GOTOFF)
	.word	21000
	.word	21004
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	21012
	.word	21008
	.size	update_switch, .-update_switch
	.section	.rodata
	.align	2
.LC26:
	.ascii	"\033[3;8H%c %d %d\000"
	.align	2
.LC27:
	.ascii	"\033[3;8H%c %d\000"
	.text
	.align	2
	.global	process_train_command
	.type	process_train_command, %function
process_train_command:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	ldr	sl, .L612
.L611:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L586
	mvn	r3, #1
	str	r3, [fp, #-32]
	b	.L588
.L586:
	mov	r0, #0
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L589
	mvn	r3, #2
	str	r3, [fp, #-32]
	b	.L588
.L589:
	ldr	r0, [fp, #-28]
	mov	r1, #0
	bl	timer_passed(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L591
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L588
.L591:
	mov	r3, #0
	strb	r3, [fp, #-21]
	mov	r3, #0
	strb	r3, [fp, #-22]
	mov	r3, #0
	strb	r3, [fp, #-23]
	mov	r3, #0
	strb	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	sub	r2, fp, #21
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_pop(PLT)
	ldr	r3, [fp, #-20]
	sub	r2, fp, #22
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_pop(PLT)
	ldr	r3, [fp, #-20]
	sub	r2, fp, #23
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_pop(PLT)
	ldr	r3, [fp, #-20]
	sub	r2, fp, #24
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_pop(PLT)
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	sub	r3, r3, #73
	cmp	r3, #11
	addls	pc, pc, r3, asl #2
	b	.L593
	.p2align 2
.L599:
	b	.L594
	b	.L593
	b	.L593
	b	.L595
	b	.L593
	b	.L593
	b	.L596
	b	.L597
	b	.L593
	b	.L593
	b	.L598
	b	.L595
.L598:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r2, r3
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	str	r2, [sp, #0]
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	ldr	r3, .L612+4
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putc(PLT)
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putc(PLT)
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	cmp	r3, #21
	bhi	.L600
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	sub	r0, r3, #1
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r2, [fp, #-28]
	ldr	r1, .L612+8
	mov	r3, r0, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	str	ip, [r3, #0]
	b	.L602
.L600:
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	sub	r0, r3, #135
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r2, [fp, #-28]
	ldr	r1, .L612+8
	mov	r3, r0, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	str	ip, [r3, #0]
.L602:
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	mov	r2, r3
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	ldr	r0, [fp, #-28]
	mov	r1, r2
	mov	r2, r3
	bl	update_switch(PLT)
	ldr	r0, [fp, #-28]
	mov	r1, #200
	mov	r2, #0
	bl	set_timer_delay(PLT)
	b	.L593
.L596:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	ldr	r3, .L612+12
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putc(PLT)
	ldr	r0, [fp, #-28]
	mov	r1, #150
	mov	r2, #0
	bl	set_timer_delay(PLT)
.L594:
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putc(PLT)
	ldr	r0, [fp, #-28]
	mov	r1, #150
	mov	r2, #0
	bl	set_timer_delay(PLT)
	b	.L593
.L597:
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putc(PLT)
	b	.L593
.L595:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L603
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	sub	r0, r3, #1
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r2, [fp, #-28]
	ldr	r1, .L612+16
	mov	r3, r0, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	str	ip, [r3, #0]
.L603:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L605
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	sub	r3, r3, #1
	ldr	r2, [fp, #-28]
	ldr	r1, .L612+16
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-22]
.L605:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r2, r3
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	str	r2, [sp, #0]
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	ldr	r3, .L612+4
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putc(PLT)
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putc(PLT)
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L607
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L607
	ldr	r0, [fp, #-28]
	ldr	r1, .L612+20
	mov	r2, #0
	bl	set_timer_delay(PLT)
	ldr	r0, [fp, #-28]
	ldr	r1, .L612+20
	mov	r2, #1
	bl	set_timer_delay(PLT)
	b	.L593
.L607:
	ldr	r0, [fp, #-28]
	mov	r1, #150
	mov	r2, #0
	bl	set_timer_delay(PLT)
.L593:
	mov	r3, #0
	str	r3, [fp, #-32]
.L588:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L613:
	.align	2
.L612:
	.word	_GLOBAL_OFFSET_TABLE_-(.L611+8)
	.word	.LC26(GOTOFF)
	.word	20928
	.word	.LC27(GOTOFF)
	.word	20608
	.word	3000
	.size	process_train_command, .-process_train_command
	.section	.rodata
	.align	2
.LC28:
	.ascii	"\033[2;11H%d\000"
	.align	2
.LC29:
	.ascii	"\033[2;8H00\033[2;9H%d\000"
	.align	2
.LC30:
	.ascii	"\033[2;8H%d\000"
	.align	2
.LC31:
	.ascii	"\033[2;5H00\033[2;6H%d\000"
	.align	2
.LC32:
	.ascii	"\033[2;5H%d\000"
	.align	2
.LC33:
	.ascii	"\033[2;3H%d\000"
	.align	2
.LC34:
	.ascii	"\033[2;2H%d\000"
	.align	2
.LC35:
	.ascii	"\033[%d;%dH\000"
	.text
	.align	2
	.global	update_clock
	.type	update_clock, %function
update_clock:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	ldr	sl, .L636
.L635:
	add	sl, pc, sl
	str	r0, [fp, #-44]
	ldr	r3, .L636+4
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #0]
	ldr	r3, .L636+8
	rsb	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-36]
	ldr	r3, .L636+12
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #12
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-36]
	ldr	r3, .L636+16
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r3, r3, r1
	str	r3, [fp, #-28]
	ldr	r1, [fp, #-36]
	ldr	r3, .L636+16
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-36]
	ldr	r3, .L636+20
	smull	r2, r3, r1, r3
	add	r3, r3, r1
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r3, r3, r1
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-36]
	ldr	r3, .L636+20
	smull	r1, r3, r2, r3
	add	r3, r3, r2
	mov	r1, r3, asr #5
	mov	r3, r2, asr #31
	rsb	r3, r3, r1
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-36]
	ldr	r3, .L636+20
	smull	r2, r3, r1, r3
	add	r3, r3, r1
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #4
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r3, r3, r1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-44]
	ldr	r3, .L636+24
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	beq	.L615
	ldr	r1, [fp, #-44]
	ldr	r2, .L636+24
	ldr	r3, [fp, #-28]
	str	r3, [r1, r2]
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L636+28
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-28]
	bl	pie_printf(PLT)
	mov	r3, #1
	str	r3, [fp, #-40]
.L615:
	ldr	r2, [fp, #-44]
	ldr	r3, .L636+32
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L617
	ldr	r3, [fp, #-24]
	cmp	r3, #9
	bgt	.L619
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L636+36
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	bl	pie_printf(PLT)
	b	.L621
.L619:
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L636+40
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	bl	pie_printf(PLT)
.L621:
	ldr	r1, [fp, #-44]
	ldr	r2, .L636+32
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
	mov	r3, #1
	str	r3, [fp, #-40]
.L617:
	ldr	r2, [fp, #-44]
	ldr	r3, .L636+44
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	.L622
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L624
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L636+48
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	pie_printf(PLT)
	b	.L626
.L624:
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L636+52
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	pie_printf(PLT)
.L626:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L627
	ldr	r3, [fp, #-44]
	ldr	r2, .L636+44
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L627
	ldr	r2, [fp, #-44]
	ldr	r3, .L636+56
	ldr	r3, [r2, r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-44]
	ldr	r3, .L636+56
	str	r1, [r2, r3]
	ldr	r2, [fp, #-44]
	ldr	r3, .L636+56
	ldr	r1, [r2, r3]
	ldr	r3, .L636+60
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-48]
	ldr	r3, [fp, #-48]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-48]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-48]
	ldr	r2, [fp, #-44]
	ldr	r3, .L636+56
	ldr	r1, [fp, #-48]
	str	r1, [r2, r3]
	ldr	r2, [fp, #-44]
	ldr	r3, .L636+56
	ldr	r3, [r2, r3]
	cmp	r3, #9
	bgt	.L630
	ldr	r2, [fp, #-44]
	ldr	r3, .L636+56
	ldr	ip, [r2, r3]
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L636+64
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
	b	.L627
.L630:
	ldr	r2, [fp, #-44]
	ldr	r3, .L636+56
	ldr	ip, [r2, r3]
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L636+68
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
.L627:
	ldr	r1, [fp, #-44]
	ldr	r2, .L636+44
	ldr	r3, [fp, #-20]
	str	r3, [r1, r2]
	mov	r3, #1
	str	r3, [fp, #-40]
.L622:
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L632
	ldr	r2, [fp, #-44]
	ldr	r3, .L636+72
	ldr	r3, [r2, r3]
	add	r3, r3, #3
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L636+76
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #35
	bl	pie_printf(PLT)
.L632:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L637:
	.align	2
.L636:
	.word	_GLOBAL_OFFSET_TABLE_-(.L635+8)
	.word	-2139029372
	.word	1828800000
	.word	346302875
	.word	1717986919
	.word	-2004318071
	.word	20592
	.word	.LC28(GOTOFF)
	.word	20596
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	20600
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	20604
	.word	1374389535
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	20560
	.word	.LC35(GOTOFF)
	.size	update_clock, .-update_clock
	.section	.rodata
	.align	2
.LC36:
	.ascii	"Start Trains\000"
	.align	2
.LC37:
	.ascii	"Setting Trains to speed 0\000"
	.align	2
.LC38:
	.ascii	"Setting Switches\000"
	.text
	.align	2
	.global	train_init
	.type	train_init, %function
train_init:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L666
.L665:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	mov	r0, #0
	ldr	r1, [fp, #-28]
	mov	r2, #2400
	bl	pie_setspeed(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L639
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L641
.L639:
	ldr	r3, .L666+4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	orr	r2, r3, #8
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	mov	r0, #0
	mov	r1, #0
	bl	pie_setfifo(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L642
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L641
.L642:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #73
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #96
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r0, [fp, #-28]
	ldr	r3, .L666+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	push_message(PLT)
	mov	r0, #1
	ldr	r1, [fp, #-28]
	bl	flush_ccb(PLT)
.L644:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L645
	ldr	r3, [fp, #-28]
	add	r3, r3, #4096
	add	r3, r3, #8
	mov	r0, r3
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L647
.L645:
	ldr	r0, [fp, #-28]
	bl	process_train_command(PLT)
	mov	r0, #0
	ldr	r1, [fp, #-28]
	bl	push_character(PLT)
	b	.L644
.L647:
	ldr	r0, [fp, #-28]
	ldr	r3, .L666+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	push_message(PLT)
	mov	r0, #1
	ldr	r1, [fp, #-28]
	bl	flush_ccb(PLT)
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L648
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L650
.L651:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #84
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	add	r3, r3, #1
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r0, r2
	mov	r1, r3
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #1
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L650:
	ldr	r3, [fp, #-20]
	cmp	r3, #79
	ble	.L651
.L652:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L653
	ldr	r3, [fp, #-28]
	add	r3, r3, #4096
	add	r3, r3, #8
	mov	r0, r3
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L655
.L653:
	ldr	r0, [fp, #-28]
	bl	process_train_command(PLT)
	mov	r0, #0
	ldr	r1, [fp, #-28]
	bl	flush_ccb(PLT)
	b	.L652
.L655:
	ldr	r0, [fp, #-28]
	ldr	r3, .L666+16
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	push_message(PLT)
	mov	r0, #1
	ldr	r1, [fp, #-28]
	bl	flush_ccb(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L656
.L657:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #83
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #34
	bl	ccbuff_push(PLT)
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	add	r3, r3, #1
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r0, r2
	mov	r1, r3
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #1
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #79
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #32
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L656:
	ldr	r3, [fp, #-20]
	cmp	r3, #17
	ble	.L657
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L659
.L660:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #83
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #34
	bl	ccbuff_push(PLT)
	ldr	r0, [fp, #-28]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	and	r1, r3, #255
	mvn	r3, #102
	mov	r2, r3
	mov	r3, r1
	add	r3, r2, r3
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r1, r3
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #1
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #79
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #32
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #83
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #33
	bl	ccbuff_push(PLT)
	ldr	r0, [fp, #-28]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #1
	and	r1, r3, #255
	mvn	r3, #101
	mov	r2, r3
	mov	r3, r1
	add	r3, r2, r3
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r1, r3
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #1
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #79
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #32
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-28]
	mov	r0, r3
	mov	r1, #0
	bl	ccbuff_push(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L659:
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	ble	.L660
.L661:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L662
	ldr	r3, [fp, #-28]
	add	r3, r3, #4096
	add	r3, r3, #8
	mov	r0, r3
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L648
.L662:
	ldr	r0, [fp, #-28]
	bl	process_train_command(PLT)
	mov	r0, #0
	ldr	r1, [fp, #-28]
	bl	flush_ccb(PLT)
	b	.L661
.L648:
	ldr	r0, [fp, #-28]
	bl	flush_command_display(PLT)
	mov	r3, #0
	str	r3, [fp, #-36]
.L641:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L667:
	.align	2
.L666:
	.word	_GLOBAL_OFFSET_TABLE_-(.L665+8)
	.word	-2138308600
	.word	.LC36(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	.LC38(GOTOFF)
	.size	train_init, .-train_init
	.section	.rodata
	.align	2
.LC39:
	.ascii	"\033[%d;1H\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 21164
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20992
	sub	sp, sp, #172
	ldr	sl, .L674
.L673:
	add	sl, pc, sl
	ldr	r3, .L674+4
	sub	r2, fp, #16
	str	r0, [r2, r3]
	ldr	r3, .L674+8
	sub	r2, fp, #16
	str	r1, [r2, r3]
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, r3
	bl	glbs_init(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, r3
	mov	r1, #0
	bl	screen_init(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, r3
	bl	init_clock(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, r3
	mov	r1, #0
	bl	train_init(PLT)
.L669:
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, r3
	bl	update_clock(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #0
	mov	r1, r3
	bl	pull_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #1
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #0
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, r3
	bl	process_train_command(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #0
	mov	r1, r3
	bl	pull_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #1
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #0
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #1
	mov	r1, r3
	bl	pull_character(PLT)
	ldr	r3, .L674+12
	ldr	r2, .L674+16
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L670
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #0
	mov	r1, r3
	bl	pull_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #1
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #0
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #0
	mov	r1, r3
	bl	pull_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #1
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #0
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, r3
	bl	poll_sensor(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #0
	mov	r1, r3
	bl	pull_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #1
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #0
	mov	r1, r3
	bl	push_character(PLT)
	b	.L669
.L670:
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	add	r3, r3, #4096
	add	r3, r3, #8
	mov	r0, r3
	bl	ccbuff_init(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	add	r3, r3, #8192
	add	r3, r3, #16
	mov	r0, r3
	bl	ccbuff_init(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #1
	mov	r1, r3
	ldr	r3, .L674+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #40
	bl	pie_printf(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #164
	mov	r0, #1
	mov	r1, r3
	bl	flush_ccb(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L675:
	.align	2
.L674:
	.word	_GLOBAL_OFFSET_TABLE_-(.L673+8)
	.word	-21160
	.word	-21164
	.word	-21156
	.word	20572
	.word	.LC39(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
