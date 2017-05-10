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
	beq	.L191
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	beq	.L192
	b	.L190
.L191:
	ldr	r3, [fp, #-20]
	add	r3, r3, #4096
	add	r3, r3, #8
	ldrb	r2, [fp, #-24]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_push(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	b	.L193
.L192:
	ldr	r3, [fp, #-20]
	add	r3, r3, #8192
	add	r3, r3, #16
	ldrb	r2, [fp, #-24]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_push(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	b	.L193
.L190:
	mvn	r3, #0
	str	r3, [fp, #-28]
.L193:
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
	b	.L196
.L197:
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
.L196:
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
	bne	.L200
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bgt	.L197
	b	.L200
.L201:
	ldrb	r3, [fp, #-36]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putc(PLT)
.L200:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
	cmp	r2, #0
	bne	.L201
	b	.L203
.L204:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putc(PLT)
.L203:
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
	bne	.L204
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
	b	.L208
.L209:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r2, r3
	bl	pie_putc(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L210
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L212
.L210:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L208:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L209
	mov	r3, #0
	str	r3, [fp, #-28]
.L212:
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
	bhi	.L216
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #48
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
	b	.L218
.L216:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	add	r3, r3, #87
	and	r3, r3, #255
	and	r3, r3, #255
	str	r3, [fp, #-20]
.L218:
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
	b	.L223
.L224:
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
.L223:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L224
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
	bls	.L228
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L228
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #48
	str	r3, [fp, #-20]
	b	.L231
.L228:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #96
	bls	.L232
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #102
	bhi	.L232
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #87
	str	r3, [fp, #-20]
	b	.L231
.L232:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #64
	bls	.L235
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #70
	bhi	.L235
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	sub	r3, r3, #55
	str	r3, [fp, #-20]
	b	.L231
.L235:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L231:
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
	b	.L240
.L241:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bgt	.L242
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
.L240:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r0, r3
	bl	pie_a2d(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L241
.L242:
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
	b	.L246
.L247:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
.L246:
	ldr	r0, [fp, #-28]
	ldr	r1, [fp, #-16]
	bl	__udivsi3(PLT)
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bcs	.L247
	b	.L259
.L250:
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
	bne	.L251
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L251
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L249
.L251:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L254
	mov	r1, #48
	str	r1, [fp, #-40]
	b	.L256
.L254:
	mov	r3, #87
	str	r3, [fp, #-40]
.L256:
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
.L249:
.L259:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L250
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
	bge	.L261
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, #45
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L261:
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
	b	.L283
.L266:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L267
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r2, r3
	bl	pie_putc(PLT)
	b	.L265
.L267:
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
	beq	.L270
	ldr	r3, [fp, #-56]
	cmp	r3, #48
	blt	.L269
	ldr	r3, [fp, #-56]
	cmp	r3, #57
	bgt	.L269
	b	.L271
.L270:
	mov	r3, #1
	strb	r3, [fp, #-13]
	ldr	r2, [fp, #-44]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-44]
	b	.L269
.L271:
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
.L269:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #115
	beq	.L276
	ldr	r3, [fp, #-52]
	cmp	r3, #115
	bgt	.L279
	ldr	r3, [fp, #-52]
	cmp	r3, #99
	beq	.L274
	ldr	r3, [fp, #-52]
	cmp	r3, #99
	bgt	.L280
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	beq	.L282
	ldr	r3, [fp, #-52]
	cmp	r3, #37
	beq	.L273
	b	.L265
.L280:
	ldr	r3, [fp, #-52]
	cmp	r3, #100
	beq	.L275
	b	.L265
.L279:
	ldr	r3, [fp, #-52]
	cmp	r3, #117
	beq	.L277
	ldr	r3, [fp, #-52]
	cmp	r3, #120
	beq	.L278
	b	.L265
.L274:
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
	b	.L265
.L276:
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
	b	.L265
.L277:
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
	b	.L265
.L275:
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
	b	.L265
.L278:
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
	b	.L265
.L273:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r2, r3
	bl	pie_putc(PLT)
.L265:
.L283:
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
	bne	.L266
.L282:
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
	beq	.L288
	ldr	r3, [fp, #-44]
	cmp	r3, #1
	beq	.L289
	b	.L287
.L288:
	ldr	r3, .L299
	str	r3, [fp, #-20]
	ldr	r3, .L299+4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	add	r3, r3, #4096
	add	r3, r3, #8
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L293
	mvn	r3, #0
	str	r3, [fp, #-40]
	b	.L292
.L289:
	ldr	r3, .L299+8
	str	r3, [fp, #-20]
	ldr	r3, .L299+12
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	add	r3, r3, #8192
	add	r3, r3, #16
	str	r3, [fp, #-16]
	b	.L293
.L287:
	mvn	r3, #0
	str	r3, [fp, #-40]
	b	.L292
.L293:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L294
	ldr	r3, [fp, #-16]
	sub	r2, fp, #25
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_pop(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L296
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L292
.L296:
	mvn	r3, #0
	str	r3, [fp, #-40]
	b	.L292
.L294:
	mvn	r3, #0
	str	r3, [fp, #-40]
.L292:
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L300:
	.align	2
.L299:
	.word	-2138308584
	.word	-2138308608
	.word	-2138243048
	.word	-2138243072
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
	beq	.L303
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	beq	.L304
	b	.L302
.L303:
	ldr	r3, .L311
	str	r3, [fp, #-16]
	b	.L305
.L304:
	ldr	r3, .L311+4
	str	r3, [fp, #-16]
	b	.L305
.L302:
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L306
.L305:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L307
	ldr	r3, [fp, #-20]
	orr	r3, r3, #16
	str	r3, [fp, #-32]
	b	.L309
.L307:
	ldr	r3, [fp, #-20]
	bic	r3, r3, #16
	str	r3, [fp, #-32]
.L309:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	mov	r3, #0
	str	r3, [fp, #-36]
.L306:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L312:
	.align	2
.L311:
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
	beq	.L315
	ldr	r2, [fp, #-40]
	cmp	r2, #1
	beq	.L316
	b	.L314
.L315:
	ldr	r3, .L323
	str	r3, [fp, #-20]
	ldr	r3, .L323+4
	str	r3, [fp, #-16]
	b	.L317
.L316:
	ldr	r3, .L323+8
	str	r3, [fp, #-20]
	ldr	r3, .L323+12
	str	r3, [fp, #-16]
	b	.L317
.L314:
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L318
.L317:
	ldr	r2, [fp, #-32]
	str	r2, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #2400
	beq	.L320
	ldr	r3, .L323+16
	ldr	r2, [fp, #-44]
	cmp	r2, r3
	beq	.L321
	b	.L319
.L321:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #3
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L318
.L320:
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #191
	str	r3, [r2, #0]
	mov	r2, #0
	str	r2, [fp, #-36]
	b	.L318
.L319:
	mvn	r3, #0
	str	r3, [fp, #-36]
.L318:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L324:
	.align	2
.L323:
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
	beq	.L327
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	beq	.L328
	b	.L326
.L327:
	ldr	r3, [fp, #-24]
	add	r3, r3, #4096
	add	r3, r3, #8
	str	r3, [fp, #-16]
	b	.L329
.L328:
	ldr	r3, [fp, #-24]
	add	r3, r3, #8192
	add	r3, r3, #16
	str	r3, [fp, #-16]
	b	.L329
.L326:
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L330
.L329:
	ldr	r0, [fp, #-16]
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L331
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	bl	push_character(PLT)
	b	.L329
.L331:
	mov	r3, #0
	str	r3, [fp, #-28]
.L330:
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
	ldr	sl, .L348
.L347:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	bl	pie_setfifo(PLT)
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L348+4
	add	r3, sl, r3
	mov	r2, r3
	bl	pie_printf(PLT)
	ldr	r3, .L348+8
	add	r3, sl, r3
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	mov	r2, #150
	mov	r3, #42
	bl	pie_putw(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L335
.L336:
	mov	r3, #148
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L348+12
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	pie_printf(PLT)
	ldr	r3, [fp, #-20]
	eor	r3, r3, #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L337
	mov	r0, #1
	ldr	r1, [fp, #-24]
	bl	flush_ccb(PLT)
.L337:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L335:
	ldr	r3, [fp, #-20]
	cmp	r3, #35
	ble	.L336
	ldr	r3, .L348+8
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
	ldr	r3, .L348+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #5
	bl	pie_printf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L340
.L341:
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
	ldr	r3, .L348+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #6
	bl	pie_printf(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L340:
	ldr	r3, [fp, #-20]
	cmp	r3, #8
	ble	.L341
	mov	r0, #1
	ldr	r1, [fp, #-24]
	bl	flush_ccb(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L343
.L344:
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
	ldr	r3, .L348+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #8
	bl	pie_printf(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L343:
	ldr	r3, [fp, #-20]
	cmp	r3, #8
	ble	.L344
	mov	r3, #22
	str	r3, [sp, #0]
	mov	r3, #153
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L348+24
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
	ldr	r3, .L348+24
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
	ldr	r3, .L348+24
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
	ldr	r3, .L348+24
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #12
	bl	pie_printf(PLT)
	mov	r3, #19
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L348+28
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #19
	bl	pie_printf(PLT)
	mov	r3, #62
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L348+32
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #35
	bl	pie_printf(PLT)
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L348+36
	add	r3, sl, r3
	mov	r2, r3
	bl	pie_printf(PLT)
	mov	r0, #1
	ldr	r1, [fp, #-24]
	bl	flush_ccb(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L349:
	.align	2
.L348:
	.word	_GLOBAL_OFFSET_TABLE_-(.L347+8)
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
	ldr	sl, .L353
.L352:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, .L353+4
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
	ldr	r3, .L353+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #34
	bl	pie_printf(PLT)
	ldr	r1, [fp, #-20]
	ldr	r2, .L353+12
	mov	r3, #0
	str	r3, [r1, r2]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L354:
	.align	2
.L353:
	.word	_GLOBAL_OFFSET_TABLE_-(.L352+8)
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
	ldr	sl, .L358
.L357:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	mov	r3, #35
	str	r3, [sp, #0]
	mov	r3, #148
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-20]
	ldr	r3, .L358+4
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #35
	bl	pie_printf(PLT)
	mov	r3, #62
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-20]
	ldr	r3, .L358+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #35
	bl	pie_printf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L359:
	.align	2
.L358:
	.word	_GLOBAL_OFFSET_TABLE_-(.L357+8)
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
	ldr	sl, .L368
.L367:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldr	r2, .L368+4
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L361
	ldr	r0, [fp, #-20]
	bl	flush_message_display(PLT)
.L361:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L364
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	beq	.L365
	b	.L363
.L364:
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-20]
	ldr	r3, .L368+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #34
	bl	pie_printf(PLT)
	b	.L363
.L365:
	ldr	r3, [fp, #-24]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-20]
	ldr	r3, .L368+12
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #34
	bl	pie_printf(PLT)
.L363:
	ldr	r1, [fp, #-20]
	ldr	r2, .L368+4
	mov	r3, #1
	str	r3, [r1, r2]
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L369:
	.align	2
.L368:
	.word	_GLOBAL_OFFSET_TABLE_-(.L367+8)
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
	ldr	r3, .L378
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L371
	ldr	r2, [fp, #-16]
	ldr	r3, .L378+4
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L371
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L374
.L371:
	ldr	r3, [fp, #-16]
	ldr	r2, .L378+8
	ldr	r3, [r3, r2]
	cmp	r3, #9
	bgt	.L375
	ldr	r2, [fp, #-16]
	ldr	r3, .L378+8
	ldr	r3, [r2, r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-16]
	ldr	r3, .L378+8
	str	r1, [r2, r3]
.L375:
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
	ldr	r2, .L378
	ldr	r3, [fp, #-20]
	str	r3, [r1, r2]
	ldr	r1, [fp, #-16]
	ldr	r2, .L378+4
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-28]
.L374:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L379:
	.align	2
.L378:
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
	bge	.L381
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #1
	bl	push_sensor(PLT)
.L381:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L383
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #2
	bl	push_sensor(PLT)
.L383:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L385
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #3
	bl	push_sensor(PLT)
.L385:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #4
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L387
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #4
	bl	push_sensor(PLT)
.L387:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #3
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L389
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #5
	bl	push_sensor(PLT)
.L389:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L391
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #6
	bl	push_sensor(PLT)
.L391:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	mov	r3, r3, lsr #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L393
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #7
	bl	push_sensor(PLT)
.L393:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L395
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #8
	bl	push_sensor(PLT)
.L395:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, asl #24
	mov	r3, r3, asr #24
	cmp	r3, #0
	bge	.L397
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #9
	bl	push_sensor(PLT)
.L397:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L399
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #10
	bl	push_sensor(PLT)
.L399:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L401
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #11
	bl	push_sensor(PLT)
.L401:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #4
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L403
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #12
	bl	push_sensor(PLT)
.L403:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #3
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L405
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #13
	bl	push_sensor(PLT)
.L405:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L407
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #14
	bl	push_sensor(PLT)
.L407:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L409
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #15
	bl	push_sensor(PLT)
.L409:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L411
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	mov	r1, r3
	mov	r2, #16
	bl	push_sensor(PLT)
.L411:
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
	ldr	r3, .L419
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L415
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-20]
	ldr	r3, .L419+4
	str	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #7
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	mov	r1, r3
	ldr	r2, [fp, #-20]
	ldr	r3, .L419+8
	str	r1, [r2, r3]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L417
.L415:
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-20]
	ldr	r3, .L419+12
	str	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #7
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	mov	r1, r3
	ldr	r2, [fp, #-20]
	ldr	r3, .L419+16
	str	r1, [r2, r3]
	mov	r3, #0
	str	r3, [fp, #-32]
.L417:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L420:
	.align	2
.L419:
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
	ldr	r2, .L442
	ldr	r3, [r3, r2]
	cmp	r3, #0
	bne	.L422
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L424
.L422:
	ldr	r3, .L442+4
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L425
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, .L442+8
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L442+12
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bgt	.L427
	ldr	r2, [fp, #-24]
	ldr	r3, .L442+8
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L429
	ldr	r2, [fp, #-24]
	ldr	r3, .L442+12
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L442+8
	ldr	r3, [r2, r3]
	rsb	r2, r3, r1
	ldr	r3, .L442+16
	rsb	r3, r2, r3
	ldr	r2, [fp, #-20]
	cmp	r3, r2
	ble	.L429
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L424
.L429:
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L424
.L427:
	ldr	r2, [fp, #-24]
	ldr	r3, .L442+8
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L442+12
	ldr	r3, [r2, r3]
	rsb	r2, r3, r1
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L432
	mov	r0, #1
	ldr	r1, [fp, #-24]
	bl	flush_ccb(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L424
.L432:
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L424
.L425:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #0]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, .L442+20
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L442
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bgt	.L434
	ldr	r2, [fp, #-24]
	ldr	r3, .L442+20
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L436
	ldr	r2, [fp, #-24]
	ldr	r3, .L442
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L442+20
	ldr	r3, [r2, r3]
	rsb	r2, r3, r1
	ldr	r3, .L442+16
	rsb	r3, r2, r3
	ldr	r2, [fp, #-20]
	cmp	r3, r2
	ble	.L436
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L424
.L436:
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L424
.L434:
	ldr	r2, [fp, #-24]
	ldr	r3, .L442+20
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L442
	ldr	r3, [r2, r3]
	rsb	r2, r3, r1
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L439
	mov	r0, #1
	ldr	r1, [fp, #-24]
	bl	flush_ccb(PLT)
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L424
.L439:
	mov	r3, #0
	str	r3, [fp, #-32]
.L424:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L443:
	.align	2
.L442:
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
	beq	.L445
	ldr	r0, [fp, #-16]
	mov	r1, #1
	bl	timer_passed(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L445
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
	ldr	r2, .L450
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r0, [fp, #-16]
	mov	r1, #500
	mov	r2, #1
	bl	set_timer_delay(PLT)
	ldr	r1, [fp, #-16]
	ldr	r2, .L450+4
	mov	r3, #0
	str	r3, [r1, r2]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L448
.L445:
	mvn	r3, #0
	str	r3, [fp, #-20]
.L448:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L451:
	.align	2
.L450:
	.word	21136
	.word	20564
	.size	poll_sensor, .-poll_sensor
	.section	.rodata
	.align	2
.LC13:
	.ascii	"\033[%d;40H                \033[%d;40H%c%d\000"
	.align	2
.LC14:
	.ascii	"RECIEVED MORE COMMANDS THAN HOLES TO FILL\000"
	.align	2
.LC15:
	.ascii	"VALID COMMAND! CHOO CHOO MOTHERFUCKA!!\000"
	.align	2
.LC16:
	.ascii	"Quiting!\000"
	.align	2
.LC17:
	.ascii	"INVALID COMMAND! CHECK DOCUMENTATION\000"
	.align	2
.LC18:
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
	ldr	sl, .L502
.L501:
	add	sl, pc, sl
	str	r0, [fp, #-60]
	str	r1, [fp, #-64]
	mov	r3, r2
	strb	r3, [fp, #-68]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	cmp	r3, #0
	beq	.L454
	ldr	r3, [fp, #-76]
	cmp	r3, #1
	beq	.L455
	b	.L453
.L454:
	ldr	r3, [fp, #-64]
	add	r3, r3, #16384
	add	r3, r3, #72
	str	r3, [fp, #-32]
	b	.L456
.L455:
	ldr	r3, [fp, #-64]
	add	r3, r3, #12352
	str	r3, [fp, #-32]
	b	.L456
.L453:
	mvn	r3, #0
	str	r3, [fp, #-72]
	b	.L457
.L456:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	bne	.L458
	ldr	r3, [fp, #-64]
	add	r3, r3, #16384
	add	r3, r3, #72
	ldrb	r2, [fp, #-68]	@ zero_extendqisi2
	mov	r0, r3
	mov	r1, r2
	bl	ccbuff_push(PLT)
	ldr	r2, [fp, #-64]
	ldr	r3, .L502+4
	ldr	r3, [r2, r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-64]
	ldr	r3, .L502+4
	str	r1, [r2, r3]
	ldr	r2, [fp, #-64]
	ldr	r3, .L502+4
	ldr	r3, [r2, r3]
	cmp	r3, #10
	bne	.L460
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L462
.L463:
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
.L462:
	ldr	r3, [fp, #-28]
	cmp	r3, #4
	ble	.L463
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L465
.L466:
	ldr	r3, [fp, #-64]
	add	r3, r3, #12288
	add	r3, r3, #24
	mov	r0, r3
	bl	ccbuffS_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L460
	ldr	r3, [fp, #-64]
	add	r3, r3, #12288
	add	r3, r3, #44
	mov	r0, r3
	bl	ccbuffS_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L460
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
	blt	.L460
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
	blt	.L460
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
	ldr	r3, .L502+8
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L465:
	ldr	r3, [fp, #-28]
	cmp	r3, #9
	ble	.L466
.L460:
	ldr	r3, [fp, #-64]
	ldr	r2, .L502+4
	ldr	r3, [r3, r2]
	cmp	r3, #10
	ble	.L471
	ldr	r0, [fp, #-64]
	ldr	r3, .L502+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #0
	bl	push_message(PLT)
.L471:
	mov	r3, #0
	str	r3, [fp, #-72]
	b	.L457
.L458:
	ldrb	r3, [fp, #-68]	@ zero_extendqisi2
	cmp	r3, #13
	beq	.L474
	b	.L473
.L474:
	ldr	r0, [fp, #-32]
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L475
	mvn	r3, #0
	str	r3, [fp, #-72]
	b	.L457
.L475:
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
.L477:
	ldr	r2, [fp, #-32]
	mov	r3, #4096
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L478
	mvn	r3, #1
	str	r3, [fp, #-24]
	b	.L480
.L478:
	ldr	r2, [fp, #-32]
	ldr	r3, .L502+16
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
	blt	.L480
	ldr	r2, [fp, #-32]
	mov	r3, #4096
	ldr	r3, [r2, r3]
	sub	r2, r3, #1
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	.L480
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L477
.L480:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	ble	.L483
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	bne	.L483
	ldr	r0, [fp, #-64]
	ldr	r3, .L502+20
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	push_message(PLT)
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	cmp	r3, #89
	addls	pc, pc, r3, asl #2
	b	.L497
	.p2align 2
.L493:
	b	.L487
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L488
	b	.L488
	b	.L488
	b	.L497
	b	.L497
	b	.L497
	b	.L489
	b	.L489
	b	.L489
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L490
	b	.L497
	b	.L497
	b	.L491
	b	.L491
	b	.L491
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L497
	b	.L492
.L487:
	ldr	r0, [fp, #-64]
	ldr	r3, .L502+24
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	push_message(PLT)
	ldr	r1, [fp, #-64]
	ldr	r2, .L502+28
	mov	r3, #1
	str	r3, [r1, r2]
	b	.L497
.L491:
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
	b	.L497
.L489:
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
	b	.L497
.L488:
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
	b	.L497
.L490:
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #83
	bl	ccbuff_push(PLT)
	ldrb	r3, [fp, #-53]	@ zero_extendqisi2
	cmp	r3, #67
	bne	.L494
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #34
	bl	ccbuff_push(PLT)
	b	.L496
.L494:
	ldr	r3, [fp, #-64]
	mov	r0, r3
	mov	r1, #33
	bl	ccbuff_push(PLT)
.L496:
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
	b	.L497
.L492:
	ldr	r0, [fp, #-64]
	bl	poll_sensor(PLT)
	b	.L497
.L483:
	ldr	r0, [fp, #-64]
	ldr	r3, .L502+32
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #0
	bl	push_message(PLT)
.L497:
	ldr	r0, [fp, #-32]
	bl	ccbuff_init(PLT)
	ldr	r1, [fp, #-64]
	ldr	r2, .L502+36
	mov	r3, #0
	str	r3, [r1, r2]
	ldr	r0, [fp, #-64]
	bl	flush_command_display(PLT)
	mov	r3, #0
	str	r3, [fp, #-72]
	b	.L457
.L473:
	ldr	r3, [fp, #-60]
	cmp	r3, #1
	bne	.L498
	ldrb	r3, [fp, #-68]	@ zero_extendqisi2
	ldr	r0, [fp, #-32]
	mov	r1, r3
	bl	ccbuff_push(PLT)
	ldr	r2, [fp, #-64]
	ldr	r3, .L502+36
	ldr	r3, [r2, r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-64]
	ldr	r3, .L502+36
	str	r1, [r2, r3]
	ldrb	ip, [fp, #-68]	@ zero_extendqisi2
	mov	r0, #1
	ldr	r1, [fp, #-64]
	ldr	r3, .L502+40
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
.L498:
	mov	r3, #0
	str	r3, [fp, #-72]
.L457:
	ldr	r3, [fp, #-72]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L503:
	.align	2
.L502:
	.word	_GLOBAL_OFFSET_TABLE_-(.L501+8)
	.word	20564
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	4100
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	20572
	.word	.LC17(GOTOFF)
	.word	20560
	.word	.LC18(GOTOFF)
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
	beq	.L506
	ldr	r3, [fp, #-40]
	cmp	r3, #1
	beq	.L507
	b	.L505
.L506:
	ldr	r3, .L513
	str	r3, [fp, #-20]
	ldr	r3, .L513+4
	str	r3, [fp, #-24]
	b	.L508
.L507:
	ldr	r3, .L513+8
	str	r3, [fp, #-20]
	ldr	r3, .L513+12
	str	r3, [fp, #-24]
	b	.L508
.L505:
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L509
.L508:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L510
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
	b	.L509
.L510:
	mvn	r3, #0
	str	r3, [fp, #-36]
.L509:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L514:
	.align	2
.L513:
	.word	-2138308584
	.word	-2138308608
	.word	-2138243048
	.word	-2138243072
	.size	pull_character, .-pull_character
	.section	.rodata
	.align	2
.LC19:
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
	ldr	sl, .L518
.L517:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	ldr	r3, .L518+4
	str	r3, [fp, #-24]
	ldr	r3, .L518+8
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r3, .L518+12
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
	ldr	r3, .L518+16
	add	r3, sl, r3
	mov	r2, r3
	bl	pie_printf(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L519:
	.align	2
.L518:
	.word	_GLOBAL_OFFSET_TABLE_-(.L517+8)
	.word	-2139029376
	.word	-2139029368
	.word	20576
	.word	.LC19(GOTOFF)
	.size	init_clock, .-init_clock
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
	ldr	r3, .L522
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldr	ip, [r3, #0]
	ldr	r2, [fp, #-20]
	ldr	r1, .L522+4
	mov	r3, r0, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	str	ip, [r3, #0]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L523:
	.align	2
.L522:
	.word	-2139029372
	.word	21016
	.size	set_timer_check, .-set_timer_check
	.section	.rodata
	.align	2
.LC20:
	.ascii	"\033[6;%dH%d\000"
	.align	2
.LC21:
	.ascii	"\033[7;%dH%d\000"
	.align	2
.LC22:
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
	ldr	sl, .L542
.L541:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L525
.L526:
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r0, [r3, #0]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	rsb	r3, r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r0, [r3, #0]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	cmp	r0, r3
	ble	.L527
	ldr	r2, [fp, #-24]
	ldr	r3, .L542+8
	rsb	r3, r2, r3
	str	r3, [fp, #-24]
.L527:
	ldr	r2, [fp, #-24]
	ldr	r3, .L542+12
	smull	r1, r3, r2, r3
	add	r3, r3, r2
	mov	r1, r3, asr #8
	mov	r3, r2, asr #31
	rsb	r3, r3, r1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+16
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L529
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+16
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
	ldr	r3, .L542+20
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
	ldr	r3, .L542+24
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
.L529:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+28
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L531
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+28
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
	ldr	r3, .L542+32
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
.L531:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L525:
	ldr	r3, [fp, #-32]
	add	r2, r3, #1
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L526
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r3, .L542+4
	ldr	r0, [r2, r3]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	rsb	r3, r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+4
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r1, [r3, #0]
	ldr	r2, [fp, #-28]
	ldr	r3, .L542+4
	ldr	r3, [r2, r3]
	cmp	r1, r3
	ble	.L534
	ldr	r2, [fp, #-24]
	ldr	r3, .L542+8
	rsb	r3, r2, r3
	str	r3, [fp, #-24]
.L534:
	ldr	r2, [fp, #-24]
	ldr	r3, .L542+12
	smull	r1, r3, r2, r3
	add	r3, r3, r2
	mov	r1, r3, asr #8
	mov	r3, r2, asr #31
	rsb	r3, r3, r1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+16
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L536
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+16
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
	ldr	r3, .L542+20
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
	ldr	r3, .L542+24
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
.L536:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+28
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L538
	ldr	r3, [fp, #-20]
	ldr	r0, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r1, .L542+28
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
	ldr	r3, .L542+32
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
.L538:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L543:
	.align	2
.L542:
	.word	_GLOBAL_OFFSET_TABLE_-(.L541+8)
	.word	21016
	.word	1828800000
	.word	-2130574327
	.word	21056
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	21096
	.word	.LC22(GOTOFF)
	.size	output_max_check, .-output_max_check
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
	ldr	sl, .L574
.L573:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	cmp	r3, #9
	bgt	.L545
	ldr	r3, [fp, #-32]
	cmp	r3, #34
	bne	.L547
	mov	r3, #67
	strb	r3, [fp, #-20]
	b	.L549
.L547:
	mov	r3, #83
	strb	r3, [fp, #-20]
.L549:
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
	ldr	r3, .L574+4
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #7
	bl	pie_printf(PLT)
	b	.L550
.L545:
	ldr	r3, [fp, #-28]
	cmp	r3, #18
	bgt	.L551
	ldr	r3, [fp, #-32]
	cmp	r3, #34
	bne	.L553
	mov	r3, #67
	strb	r3, [fp, #-19]
	b	.L555
.L553:
	mov	r3, #83
	strb	r3, [fp, #-19]
.L555:
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
	ldr	r3, .L574+4
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #9
	bl	pie_printf(PLT)
	b	.L550
.L551:
	ldr	r3, [fp, #-28]
	cmp	r3, #154
	bgt	.L556
	ldr	r3, [fp, #-32]
	cmp	r3, #34
	bne	.L558
	mov	r3, #67
	strb	r3, [fp, #-18]
	b	.L560
.L558:
	mov	r3, #83
	strb	r3, [fp, #-18]
.L560:
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
	ldr	r3, .L574+4
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #11
	bl	pie_printf(PLT)
	ldr	r2, [fp, #-24]
	ldr	r3, .L574+8
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L574+12
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L561
	ldrb	r3, [fp, #-18]	@ zero_extendqisi2
	cmp	r3, #67
	bne	.L561
	ldrb	r2, [fp, #-18]	@ zero_extendqisi2
	mov	r3, #32
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L574+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #11
	bl	pie_printf(PLT)
	b	.L550
.L561:
	ldrb	r2, [fp, #-18]	@ zero_extendqisi2
	mov	r3, #32
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L574+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #11
	bl	pie_printf(PLT)
	b	.L550
.L556:
	ldr	r3, [fp, #-28]
	cmp	r3, #156
	bgt	.L550
	ldr	r3, [fp, #-32]
	cmp	r3, #34
	bne	.L566
	mov	r3, #67
	strb	r3, [fp, #-17]
	b	.L568
.L566:
	mov	r3, #83
	strb	r3, [fp, #-17]
.L568:
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
	ldr	r3, .L574+4
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #13
	bl	pie_printf(PLT)
	ldr	r2, [fp, #-24]
	ldr	r3, .L574+24
	ldr	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldr	r3, .L574+28
	ldr	r3, [r2, r3]
	cmp	r1, r3
	bne	.L569
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #67
	bne	.L569
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r3, #32
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L574+16
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #13
	bl	pie_printf(PLT)
	b	.L550
.L569:
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	mov	r3, #32
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-24]
	ldr	r3, .L574+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #13
	bl	pie_printf(PLT)
.L550:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L575:
	.align	2
.L574:
	.word	_GLOBAL_OFFSET_TABLE_-(.L573+8)
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
	ldr	sl, .L603
.L602:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L577
	mvn	r3, #1
	str	r3, [fp, #-32]
	b	.L579
.L577:
	mov	r0, #0
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L580
	mvn	r3, #2
	str	r3, [fp, #-32]
	b	.L579
.L580:
	ldr	r0, [fp, #-28]
	mov	r1, #0
	bl	timer_passed(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L582
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L579
.L582:
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
	b	.L584
	.p2align 2
.L590:
	b	.L585
	b	.L584
	b	.L584
	b	.L586
	b	.L584
	b	.L584
	b	.L587
	b	.L588
	b	.L584
	b	.L584
	b	.L589
	b	.L586
.L589:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r2, r3
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	str	r2, [sp, #0]
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	ldr	r3, .L603+4
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
	bhi	.L591
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	sub	r0, r3, #1
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r2, [fp, #-28]
	ldr	r1, .L603+8
	mov	r3, r0, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	str	ip, [r3, #0]
	b	.L593
.L591:
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	sub	r0, r3, #135
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r2, [fp, #-28]
	ldr	r1, .L603+8
	mov	r3, r0, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	str	ip, [r3, #0]
.L593:
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
	b	.L584
.L587:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	ldr	r3, .L603+12
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
.L585:
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putc(PLT)
	ldr	r0, [fp, #-28]
	mov	r1, #150
	mov	r2, #0
	bl	set_timer_delay(PLT)
	b	.L584
.L588:
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r0, #0
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	pie_putc(PLT)
	b	.L584
.L586:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L594
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	sub	r0, r3, #1
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r2, [fp, #-28]
	ldr	r1, .L603+16
	mov	r3, r0, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	str	ip, [r3, #0]
.L594:
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L596
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	sub	r3, r3, #1
	ldr	r2, [fp, #-28]
	ldr	r1, .L603+16
	mov	r3, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-22]
.L596:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r2, r3
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	str	r2, [sp, #0]
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r1, [fp, #-28]
	ldr	r3, .L603+4
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
	bne	.L598
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L598
	ldr	r0, [fp, #-28]
	ldr	r1, .L603+20
	mov	r2, #0
	bl	set_timer_delay(PLT)
	ldr	r0, [fp, #-28]
	ldr	r1, .L603+20
	mov	r2, #1
	bl	set_timer_delay(PLT)
	b	.L584
.L598:
	ldr	r0, [fp, #-28]
	mov	r1, #150
	mov	r2, #0
	bl	set_timer_delay(PLT)
.L584:
	mov	r3, #0
	str	r3, [fp, #-32]
.L579:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L604:
	.align	2
.L603:
	.word	_GLOBAL_OFFSET_TABLE_-(.L602+8)
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
	ldr	sl, .L627
.L626:
	add	sl, pc, sl
	str	r0, [fp, #-44]
	ldr	r3, .L627+4
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #0]
	ldr	r3, .L627+8
	rsb	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-36]
	ldr	r3, .L627+12
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #12
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-36]
	ldr	r3, .L627+16
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
	ldr	r3, .L627+16
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-36]
	ldr	r3, .L627+20
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
	ldr	r3, .L627+20
	smull	r1, r3, r2, r3
	add	r3, r3, r2
	mov	r1, r3, asr #5
	mov	r3, r2, asr #31
	rsb	r3, r3, r1
	str	r3, [fp, #-36]
	ldr	r1, [fp, #-36]
	ldr	r3, .L627+20
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
	ldr	r3, .L627+24
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	beq	.L606
	ldr	r1, [fp, #-44]
	ldr	r2, .L627+24
	ldr	r3, [fp, #-28]
	str	r3, [r1, r2]
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L627+28
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-28]
	bl	pie_printf(PLT)
	mov	r3, #1
	str	r3, [fp, #-40]
.L606:
	ldr	r2, [fp, #-44]
	ldr	r3, .L627+32
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L608
	ldr	r3, [fp, #-24]
	cmp	r3, #9
	bgt	.L610
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L627+36
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	bl	pie_printf(PLT)
	b	.L612
.L610:
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L627+40
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	bl	pie_printf(PLT)
.L612:
	ldr	r1, [fp, #-44]
	ldr	r2, .L627+32
	ldr	r3, [fp, #-24]
	str	r3, [r1, r2]
	mov	r3, #1
	str	r3, [fp, #-40]
.L608:
	ldr	r2, [fp, #-44]
	ldr	r3, .L627+44
	ldr	r2, [r2, r3]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	.L613
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	bgt	.L615
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L627+48
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	pie_printf(PLT)
	b	.L617
.L615:
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L627+52
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	pie_printf(PLT)
.L617:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L618
	ldr	r3, [fp, #-44]
	ldr	r2, .L627+44
	ldr	r3, [r3, r2]
	cmp	r3, #0
	beq	.L618
	ldr	r2, [fp, #-44]
	ldr	r3, .L627+56
	ldr	r3, [r2, r3]
	add	r1, r3, #1
	ldr	r2, [fp, #-44]
	ldr	r3, .L627+56
	str	r1, [r2, r3]
	ldr	r2, [fp, #-44]
	ldr	r3, .L627+56
	ldr	r1, [r2, r3]
	ldr	r3, .L627+60
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
	ldr	r3, .L627+56
	ldr	r1, [fp, #-48]
	str	r1, [r2, r3]
	ldr	r2, [fp, #-44]
	ldr	r3, .L627+56
	ldr	r3, [r2, r3]
	cmp	r3, #9
	bgt	.L621
	ldr	r2, [fp, #-44]
	ldr	r3, .L627+56
	ldr	ip, [r2, r3]
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L627+64
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
	b	.L618
.L621:
	ldr	r2, [fp, #-44]
	ldr	r3, .L627+56
	ldr	ip, [r2, r3]
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L627+68
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	pie_printf(PLT)
.L618:
	ldr	r1, [fp, #-44]
	ldr	r2, .L627+44
	ldr	r3, [fp, #-20]
	str	r3, [r1, r2]
	mov	r3, #1
	str	r3, [fp, #-40]
.L613:
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L623
	ldr	r2, [fp, #-44]
	ldr	r3, .L627+72
	ldr	r3, [r2, r3]
	add	r3, r3, #3
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r1, [fp, #-44]
	ldr	r3, .L627+76
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #35
	bl	pie_printf(PLT)
.L623:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L628:
	.align	2
.L627:
	.word	_GLOBAL_OFFSET_TABLE_-(.L626+8)
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
	ldr	sl, .L657
.L656:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	mov	r0, #0
	ldr	r1, [fp, #-28]
	mov	r2, #2400
	bl	pie_setspeed(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L630
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L632
.L630:
	ldr	r3, .L657+4
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
	beq	.L633
	mvn	r3, #0
	str	r3, [fp, #-36]
	b	.L632
.L633:
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
	ldr	r3, .L657+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	push_message(PLT)
	mov	r0, #1
	ldr	r1, [fp, #-28]
	bl	flush_ccb(PLT)
.L635:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L636
	ldr	r3, [fp, #-28]
	add	r3, r3, #4096
	add	r3, r3, #8
	mov	r0, r3
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L638
.L636:
	ldr	r0, [fp, #-28]
	bl	process_train_command(PLT)
	mov	r0, #0
	ldr	r1, [fp, #-28]
	bl	push_character(PLT)
	b	.L635
.L638:
	ldr	r0, [fp, #-28]
	ldr	r3, .L657+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	push_message(PLT)
	mov	r0, #1
	ldr	r1, [fp, #-28]
	bl	flush_ccb(PLT)
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L639
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L641
.L642:
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
.L641:
	ldr	r3, [fp, #-20]
	cmp	r3, #79
	ble	.L642
.L643:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L644
	ldr	r3, [fp, #-28]
	add	r3, r3, #4096
	add	r3, r3, #8
	mov	r0, r3
	bl	ccbuff_isEmpty(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L646
.L644:
	ldr	r0, [fp, #-28]
	bl	process_train_command(PLT)
	mov	r0, #0
	ldr	r1, [fp, #-28]
	bl	flush_ccb(PLT)
	b	.L643
.L646:
	ldr	r0, [fp, #-28]
	ldr	r3, .L657+16
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #1
	bl	push_message(PLT)
	mov	r0, #1
	ldr	r1, [fp, #-28]
	bl	flush_ccb(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L647
.L648:
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
.L647:
	ldr	r3, [fp, #-20]
	cmp	r3, #17
	ble	.L648
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L650
.L651:
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
.L650:
	ldr	r3, [fp, #-20]
	cmp	r3, #1
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
	bne	.L639
.L653:
	ldr	r0, [fp, #-28]
	bl	process_train_command(PLT)
	mov	r0, #0
	ldr	r1, [fp, #-28]
	bl	flush_ccb(PLT)
	b	.L652
.L639:
	ldr	r0, [fp, #-28]
	bl	flush_command_display(PLT)
	mov	r3, #0
	str	r3, [fp, #-36]
.L632:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L658:
	.align	2
.L657:
	.word	_GLOBAL_OFFSET_TABLE_-(.L656+8)
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
	@ args = 0, pretend = 0, frame = 21160
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20992
	sub	sp, sp, #168
	ldr	sl, .L665
.L664:
	add	sl, pc, sl
	ldr	r3, .L665+4
	sub	r2, fp, #16
	str	r0, [r2, r3]
	ldr	r3, .L665+8
	sub	r2, fp, #16
	str	r1, [r2, r3]
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, r3
	bl	glbs_init(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, r3
	mov	r1, #0
	bl	screen_init(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, r3
	bl	init_clock(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, r3
	mov	r1, #0
	bl	train_init(PLT)
.L660:
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, r3
	bl	update_clock(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #0
	mov	r1, r3
	bl	pull_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #1
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #0
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, r3
	bl	process_train_command(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #0
	mov	r1, r3
	bl	pull_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #1
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #0
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #1
	mov	r1, r3
	bl	pull_character(PLT)
	ldr	r3, .L665+12
	ldr	r2, .L665+16
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L661
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #0
	mov	r1, r3
	bl	pull_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #1
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #0
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #0
	mov	r1, r3
	bl	pull_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #1
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #0
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, r3
	bl	poll_sensor(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #0
	mov	r1, r3
	bl	pull_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #1
	mov	r1, r3
	bl	push_character(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #0
	mov	r1, r3
	bl	push_character(PLT)
	b	.L660
.L661:
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	add	r3, r3, #4096
	add	r3, r3, #8
	mov	r0, r3
	bl	ccbuff_init(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	add	r3, r3, #8192
	add	r3, r3, #16
	mov	r0, r3
	bl	ccbuff_init(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #1
	mov	r1, r3
	ldr	r3, .L665+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, #40
	bl	pie_printf(PLT)
	sub	r3, fp, #20992
	sub	r3, r3, #16
	sub	r3, r3, #160
	mov	r0, #1
	mov	r1, r3
	bl	flush_ccb(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L666:
	.align	2
.L665:
	.word	_GLOBAL_OFFSET_TABLE_-(.L664+8)
	.word	-21156
	.word	-21160
	.word	-21152
	.word	20572
	.word	.LC39(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
