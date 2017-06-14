	.file	"controller.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"displayServer\000"
	.align	2
.LC1:
	.ascii	"<update switchs>: Displaying switches failed.\000"
	.text
	.align	2
	.global	update_switch
	.type	update_switch, %function
update_switch:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L21
	mov	r4, r0
	ldr	r0, .L21+4
.L13:
	add	sl, pc, sl
	sub	sp, sp, #36
	add	r0, sl, r0
	mov	r5, r1
	mov	fp, r2
	bl	WhoIs(PLT)
	cmp	r4, #18
	mov	r9, r0
	ble	.L17
	cmp	r4, #154
	ble	.L18
	cmp	r4, #156
	bgt	.L12
	ldr	ip, [fp, #80]
	ldr	r3, [fp, #84]
	cmp	ip, r3
	cmpeq	r5, #67
	movne	r7, #0
	moveq	r7, #1
	beq	.L19
	add	r3, sp, #29
	strb	ip, [sp, #30]
	mov	ip, #20
	str	r3, [sp, #8]
	strb	ip, [sp, #31]
	mov	ip, #48
	add	r3, sp, #33
	ldr	r1, [sp, #8]
	mov	r2, #4
	strb	ip, [sp, #29]
	mov	ip, #3
	str	ip, [sp, #0]
	str	r3, [sp, #4]
	strb	r7, [sp, #32]
	bl	Send(PLT)
	ldr	r3, .L21+8
	mvn	r0, r0
	add	r5, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	mov	r2, r5
	bl	bwassert(PLT)
	mov	ip, #48
	ldr	r4, [fp, #84]
	strb	ip, [sp, #29]
	mov	ip, #21
	ldr	r1, [sp, #8]
	mov	r2, #4
	strb	ip, [sp, #31]
	mov	r0, r9
	sub	ip, ip, #18
	ldr	r3, [sp, #4]
	strb	r4, [sp, #30]
	strb	r7, [sp, #32]
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r2, r5
	mov	r1, #1
	bl	bwassert(PLT)
.L12:
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L18:
	ldr	ip, [fp, #72]
	ldr	r3, [fp, #76]
	cmp	ip, r3
	cmpeq	r5, #67
	movne	r8, #0
	moveq	r8, #1
	beq	.L20
	add	r3, sp, #29
	strb	ip, [sp, #30]
	mov	ip, #18
	str	r3, [sp, #16]
	add	r6, sp, #33
	strb	ip, [sp, #31]
	mov	ip, #48
	mov	r3, r6
	ldr	r1, [sp, #16]
	strb	ip, [sp, #29]
	mov	r2, #4
	mov	ip, #3
	str	ip, [sp, #0]
	strb	r8, [sp, #32]
	bl	Send(PLT)
	ldr	r3, .L21+8
	mvn	r0, r0
	add	r5, sl, r3
	mov	r2, r5
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	ip, #48
	ldr	r4, [fp, #76]
	strb	ip, [sp, #29]
	mov	ip, #19
	ldr	r1, [sp, #16]
	strb	ip, [sp, #31]
	mov	r0, r9
	sub	ip, ip, #16
	mov	r3, r6
	mov	r2, #4
	strb	r4, [sp, #30]
	strb	r8, [sp, #32]
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r2, r5
	mov	r1, #1
	bl	bwassert(PLT)
	b	.L12
.L17:
	mov	ip, #48
	sub	lr, r4, #1
	add	r1, sp, #29
	strb	ip, [sp, #29]
	mov	r2, #4
	sub	ip, ip, #48
	add	r3, sp, #33
	mov	r4, #3
	strb	r5, [sp, #30]
	strb	lr, [sp, #31]
	strb	ip, [sp, #32]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L21+8
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	b	.L12
.L20:
	add	ip, sp, #33
	add	r3, sp, #29
	str	r3, [sp, #24]
	str	ip, [sp, #20]
	mov	r3, ip
	mov	ip, #18
	strb	ip, [sp, #31]
	mov	ip, #0
	mov	r4, #1
	mov	fp, #67
	ldr	r1, [sp, #24]
	mov	r2, #4
	strb	ip, [sp, #32]
	mov	ip, #3
	str	ip, [sp, #0]
	strb	r4, [sp, #29]
	strb	fp, [sp, #30]
	bl	Send(PLT)
	ldr	r3, .L21+8
	mvn	r0, r0
	add	r5, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, r4
	mov	r2, r5
	bl	bwassert(PLT)
	ldr	r1, [sp, #24]
	ldr	r3, [sp, #20]
	mov	r0, r9
	mov	r2, #4
	strb	fp, [sp, #30]
	mov	ip, #19
.L14:
	strb	ip, [sp, #31]
	mov	ip, #0
	strb	ip, [sp, #32]
	mov	ip, #3
	str	ip, [sp, #0]
	strb	r4, [sp, #29]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, r4
	mov	r2, r5
	bl	bwassert(PLT)
	b	.L12
.L19:
	mov	ip, #20
	strb	ip, [sp, #31]
	mov	ip, #67
	add	fp, sp, #29
	strb	ip, [sp, #30]
	mov	ip, #0
	add	r3, sp, #33
	mov	r4, #1
	mov	r1, fp
	mov	r2, #4
	strb	ip, [sp, #32]
	mov	ip, #3
	str	ip, [sp, #0]
	str	r3, [sp, #12]
	strb	r4, [sp, #29]
	bl	Send(PLT)
	ldr	r3, .L21+8
	mvn	r0, r0
	add	r5, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, r4
	mov	r2, r5
	bl	bwassert(PLT)
	mov	ip, #67
	ldr	r3, [sp, #12]
	strb	ip, [sp, #30]
	mov	r1, fp
	mov	r0, r9
	mov	r2, #4
	mov	ip, #21
	b	.L14
.L22:
	.align	2
.L21:
	.word	_GLOBAL_OFFSET_TABLE_-(.L13+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	update_switch, .-update_switch
	.align	2
	.global	nextState
	.type	nextState, %function
nextState:
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	and	r1, r1, #255
	mov	lr, r2
	ldr	ip, [sp, #8]
	mov	r2, r3
	ldr	r4, [sp, #12]
	cmp	r0, #32
	addls	pc, pc, r0, asl #2
	b	.L24
	.p2align 2
.L54:
	b	.L25
	b	.L24
	b	.L26
	b	.L27
	b	.L28
	b	.L29
	b	.L30
	b	.L32
	b	.L32
	b	.L33
	b	.L34
	b	.L35
	b	.L24
	b	.L36
	b	.L37
	b	.L38
	b	.L39
	b	.L40
	b	.L24
	b	.L41
	b	.L42
	b	.L43
	b	.L44
	b	.L45
	b	.L46
	b	.L47
	b	.L48
	b	.L49
	b	.L24
	b	.L50
	b	.L51
	b	.L52
	b	.L53
.L26:
	cmp	r1, #114
	moveq	r0, #3
	ldmeqfd	sp!, {r4, pc}
.L24:
	mvn	r0, #0
	ldmfd	sp!, {r4, pc}
.L32:
	cmp	r1, #32
	bne	.L24
.L69:
	mov	r0, #9
	ldmfd	sp!, {r4, pc}
.L25:
	sub	r3, r1, #108
	cmp	r3, #8
	addls	pc, pc, r3, asl #2
	b	.L24
	.p2align 2
.L61:
	b	.L55
	b	.L24
	b	.L24
	b	.L24
	b	.L56
	b	.L57
	b	.L58
	b	.L59
	b	.L60
.L33:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L24
	.p2align 2
.L75:
	b	.L72
	b	.L73
	b	.L74
	b	.L74
	b	.L74
	b	.L74
	b	.L74
	b	.L74
	b	.L74
	b	.L74
.L34:
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L24
.L110:
	ldr	r3, [ip, #0]
	mov	r2, #1
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	mov	r0, #12
	str	r3, [ip, #0]
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L43:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L24
	.p2align 2
.L91:
	b	.L88
	b	.L88
	b	.L89
	b	.L90
	b	.L90
	b	.L90
	b	.L90
	b	.L90
	b	.L90
	b	.L90
.L44:
	cmp	r1, #32
	beq	.L92
	bcc	.L24
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L24
.L94:
	ldr	r3, [r4, #0]
	mov	r0, #24
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, pc}
.L45:
	sub	r3, r1, #32
	cmp	r3, #25
	addls	pc, pc, r3, asl #2
	b	.L24
	.p2align 2
.L97:
	b	.L92
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L24
	b	.L94
	b	.L94
	b	.L94
	b	.L94
	b	.L94
	b	.L95
	b	.L109
	b	.L109
	b	.L109
	b	.L109
.L35:
	sub	r3, r1, #48
	cmp	r3, #4
	bhi	.L24
	b	.L110
.L36:
	cmp	r1, #118
	moveq	r0, #14
	bne	.L24
	ldmfd	sp!, {r4, pc}
.L51:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L24
	.p2align 2
.L105:
	b	.L102
	b	.L102
	b	.L102
	b	.L102
	b	.L102
	b	.L102
	b	.L102
	b	.L102
	b	.L103
	b	.L104
.L52:
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L24
	ldr	r3, [r2, #0]
	mov	r0, #33
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r2, #0]
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L53:
	cmp	r1, #48
	bne	.L24
	ldr	r3, [r3, #0]
	mov	r0, #33
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	str	r3, [r2, #0]
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L39:
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L24
	ldr	r3, [r2, #0]
	mov	r0, #18
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r2, #0]
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L40:
	cmp	r1, #48
	bne	.L24
	ldr	r3, [r3, #0]
	mov	r0, #18
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	str	r3, [r2, #0]
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L41:
	cmp	r1, #119
	moveq	r0, #20
	bne	.L24
	ldmfd	sp!, {r4, pc}
.L42:
	cmp	r1, #32
	moveq	r0, #21
	bne	.L24
	ldmfd	sp!, {r4, pc}
.L37:
	cmp	r1, #32
	moveq	r0, #15
	bne	.L24
	ldmfd	sp!, {r4, pc}
.L38:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L24
	.p2align 2
.L83:
	b	.L80
	b	.L80
	b	.L80
	b	.L80
	b	.L80
	b	.L80
	b	.L80
	b	.L80
	b	.L81
	b	.L82
.L47:
	cmp	r1, #32
	beq	.L92
	bcc	.L24
	sub	r3, r1, #48
	cmp	r3, #5
	bhi	.L24
.L109:
	ldr	r3, [r4, #0]
	mov	r0, #26
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, pc}
.L49:
	cmp	r1, #67
	beq	.L100
	cmp	r1, #83
	bne	.L24
.L100:
	ldr	r3, [sp, #16]
	mov	r2, #1
	mov	r0, #28
	strb	r1, [r3, #0]
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L50:
	cmp	r1, #32
	moveq	r0, #30
	bne	.L24
	ldmfd	sp!, {r4, pc}
.L27:
	cmp	r1, #32
	moveq	r0, #4
	bne	.L24
	ldmfd	sp!, {r4, pc}
.L28:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L24
	.p2align 2
.L68:
	b	.L65
	b	.L65
	b	.L65
	b	.L65
	b	.L65
	b	.L65
	b	.L65
	b	.L65
	b	.L66
	b	.L67
.L29:
	cmp	r1, #32
	beq	.L69
	bcc	.L24
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L24
	ldr	r3, [r2, #0]
	mov	r0, #7
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, pc}
.L46:
	cmp	r1, #32
	beq	.L92
	bcc	.L24
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L24
	b	.L109
.L48:
	cmp	r1, #32
	bne	.L24
.L92:
	mov	r0, #27
	ldmfd	sp!, {r4, pc}
.L30:
	cmp	r1, #32
	beq	.L69
	cmp	r1, #48
	bne	.L24
	ldr	r3, [r3, #0]
	mov	r0, #8
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, pc}
.L66:
	mov	r3, #8
	mov	r0, #6
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, pc}
.L67:
	mov	r3, #9
	mov	r0, #7
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, pc}
.L80:
	str	r1, [r3, #0]
	mov	r0, #16
	mov	r3, #1
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L65:
	mov	r0, #5
	str	r1, [r3, #0]
	ldmfd	sp!, {r4, pc}
.L72:
	mov	r3, #0
	mov	r2, #1
	mov	r0, #10
	str	r3, [ip, #0]
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L73:
	mov	r3, #1
	mov	r0, #11
	str	r3, [ip, #0]
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L74:
	mov	r3, #1
	mov	r0, #12
	str	r1, [ip, #0]
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L89:
	mov	r3, #2
	mov	r0, #23
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, pc}
.L90:
	mov	r0, #24
	str	r1, [r4, #0]
	ldmfd	sp!, {r4, pc}
.L81:
	mov	r3, #8
	str	r3, [r2, #0]
	mov	r0, #17
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L82:
	mov	r3, #9
	str	r3, [r2, #0]
	mov	r0, #18
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L88:
	mov	r0, #22
	str	r1, [r4, #0]
	ldmfd	sp!, {r4, pc}
.L102:
	str	r1, [r3, #0]
	mov	r0, #31
	mov	r3, #1
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L103:
	mov	r3, #8
	str	r3, [r2, #0]
	mov	r0, #32
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L104:
	mov	r3, #9
	str	r3, [r2, #0]
	mov	r0, #33
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L95:
	ldr	r3, [r4, #0]
	mov	r0, #25
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	add	r3, r3, #5
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, pc}
.L55:
	mov	r0, #29
	ldmfd	sp!, {r4, pc}
.L56:
	mov	r3, #1
	mov	r0, #90
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L57:
	mov	r3, #1
	mov	r0, r3
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L58:
	mov	r0, #13
	ldmfd	sp!, {r4, pc}
.L59:
	mov	r0, #19
	ldmfd	sp!, {r4, pc}
.L60:
	mov	r0, #2
	ldmfd	sp!, {r4, pc}
	.size	nextState, .-nextState
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"trainServer\000"
	.align	2
.LC3:
	.ascii	"<parseCommand>: trainServer has not been set up.\015"
	.ascii	"\012\000"
	.align	2
.LC4:
	.ascii	"<Parse_Command>: Error with send Lights command.\015"
	.ascii	"\012\000"
	.align	2
.LC5:
	.ascii	"<Parse_Command>: Error with send Reverse command.\015"
	.ascii	"\012\000"
	.align	2
.LC6:
	.ascii	"<Parse_Command>: Error with send Trains command.\015"
	.ascii	"\012\000"
	.align	2
.LC7:
	.ascii	"<Parse_Command>: Error with send Switch command.\015"
	.ascii	"\012\000"
	.text
	.align	2
	.global	parseCommand
	.type	parseCommand, %function
parseCommand:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L133
	mov	r6, r0
	ldr	r0, .L133+4
.L130:
	add	sl, pc, sl
	sub	sp, sp, #52
	add	r0, sl, r0
	str	r1, [sp, #20]
	str	r2, [sp, #16]
	bl	WhoIs(PLT)
	ldr	r2, .L133+8
	str	r0, [sp, #24]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldrb	r3, [r6, #0]	@ zero_extendqisi2
	mov	r0, #0
	cmp	r3, r0
	str	r0, [sp, #44]
	str	r0, [sp, #40]
	str	r0, [sp, #36]
	str	r0, [sp, #32]
	strb	r0, [sp, #51]
	addeq	r0, r0, #4
	beq	.L114
	add	r1, sp, #44
	mov	r4, r0
	mov	r5, #1
	add	fp, sp, #40
	add	r9, sp, #36
	add	r8, sp, #32
	add	r7, sp, #51
	str	r1, [sp, #12]
	b	.L115
.L132:
	ldrb	r3, [r5, r6]	@ zero_extendqisi2
	add	r5, r5, #1
	cmp	r3, #0
	beq	.L131
.L115:
	ldrb	r1, [r6, r4]	@ zero_extendqisi2
	ldr	r2, [sp, #12]
	mov	r3, fp
	str	r9, [sp, #0]
	str	r8, [sp, #4]
	str	r7, [sp, #8]
	bl	nextState(PLT)
	cmp	r0, #0
	add	r4, r4, #1
	bge	.L132
.L116:
	mov	r0, #3
.L114:
	add	sp, sp, #52
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L131:
	cmp	r0, #0
	ble	.L116
	ldr	r3, [sp, #44]
	cmp	r3, #1
	bne	.L116
	sub	r3, r0, #1
	cmp	r3, #89
	addls	pc, pc, r3, asl #2
	b	.L116
	.p2align 2
.L128:
	b	.L122
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L123
	b	.L123
	b	.L123
	b	.L116
	b	.L116
	b	.L116
	b	.L124
	b	.L124
	b	.L124
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L125
	b	.L116
	b	.L116
	b	.L126
	b	.L126
	b	.L126
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L116
	b	.L127
.L122:
	mov	r0, #10
	b	.L114
.L123:
	ldr	lr, [sp, #40]
	ldr	r4, [sp, #36]
	ldr	r1, [sp, #20]
	mov	ip, #84
	str	lr, [r1, #0]
	add	r3, sp, #49
	add	r1, sp, #28
	mov	r2, #4
	strb	ip, [sp, #28]
	strb	r4, [sp, #29]
	sub	ip, ip, #84
	ldr	r0, [sp, #24]
	mov	r4, #2
	strb	lr, [sp, #30]
	strb	ip, [sp, #31]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L133+12
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, [sp, #36]
	ldr	r2, [sp, #16]
	mov	r0, #13
	str	r3, [r2, #0]
	b	.L114
.L124:
	ldr	lr, [sp, #40]
	mov	ip, #82
	add	r3, sp, #49
	mov	r4, #0
	add	r1, sp, #28
	mov	r2, #4
	strb	ip, [sp, #28]
	ldr	r0, [sp, #24]
	sub	ip, ip, #80
	strb	lr, [sp, #29]
	str	ip, [sp, #0]
	strb	r4, [sp, #31]
	strb	r4, [sp, #30]
	bl	Send(PLT)
	ldr	r2, .L133+16
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, [sp, #40]
	ldr	r1, [sp, #20]
	ldrb	r2, [sp, #49]	@ zero_extendqisi2
	str	r3, [r1, #0]
	ldr	r3, [sp, #16]
	mov	r0, #12
	str	r2, [r3, #0]
	b	.L114
.L125:
	ldr	lr, [sp, #32]
	ldrb	r4, [sp, #51]	@ zero_extendqisi2
	ldr	r3, [sp, #20]
	ldr	r1, [sp, #16]
	mov	ip, #83
	str	lr, [r3, #0]
	mov	r2, #4
	str	r4, [r1, #0]
	add	r3, sp, #49
	add	r1, sp, #28
	strb	ip, [sp, #28]
	strb	r4, [sp, #30]
	sub	ip, ip, #83
	ldr	r0, [sp, #24]
	mov	r4, #2
	strb	lr, [sp, #29]
	strb	ip, [sp, #31]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L133+20
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r0, #11
	b	.L114
.L126:
	ldr	lr, [sp, #40]
	ldr	r2, [sp, #20]
	mov	ip, #76
	str	lr, [r2, #0]
	mov	r4, #0
	add	r1, sp, #28
	mov	r2, #4
	add	r3, sp, #49
	strb	ip, [sp, #28]
	ldr	r0, [sp, #24]
	sub	ip, ip, #74
	strb	lr, [sp, #29]
	str	ip, [sp, #0]
	strb	r4, [sp, #31]
	strb	r4, [sp, #30]
	bl	Send(PLT)
	ldr	r2, .L133+24
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r0, #14
	b	.L114
.L127:
	mov	r0, #15
	b	.L114
.L134:
	.align	2
.L133:
	.word	_GLOBAL_OFFSET_TABLE_-(.L130+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC4(GOTOFF)
	.size	parseCommand, .-parseCommand
	.ident	"GCC: (GNU) 4.0.2"
