	.file	"controller.c"
	.text
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
	b	.L2
	.p2align 2
.L32:
	b	.L3
	b	.L2
	b	.L4
	b	.L5
	b	.L6
	b	.L7
	b	.L8
	b	.L10
	b	.L10
	b	.L11
	b	.L12
	b	.L13
	b	.L2
	b	.L14
	b	.L15
	b	.L16
	b	.L17
	b	.L18
	b	.L2
	b	.L19
	b	.L20
	b	.L21
	b	.L22
	b	.L23
	b	.L24
	b	.L25
	b	.L26
	b	.L27
	b	.L2
	b	.L28
	b	.L29
	b	.L30
	b	.L31
.L4:
	cmp	r1, #114
	moveq	r0, #3
	ldmeqfd	sp!, {r4, pc}
.L2:
	mvn	r0, #0
	ldmfd	sp!, {r4, pc}
.L10:
	cmp	r1, #32
	bne	.L2
.L47:
	mov	r0, #9
	ldmfd	sp!, {r4, pc}
.L3:
	sub	r3, r1, #108
	cmp	r3, #8
	addls	pc, pc, r3, asl #2
	b	.L2
	.p2align 2
.L39:
	b	.L33
	b	.L2
	b	.L2
	b	.L2
	b	.L34
	b	.L35
	b	.L36
	b	.L37
	b	.L38
.L11:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L2
	.p2align 2
.L53:
	b	.L50
	b	.L51
	b	.L52
	b	.L52
	b	.L52
	b	.L52
	b	.L52
	b	.L52
	b	.L52
	b	.L52
.L12:
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L2
.L88:
	ldr	r3, [ip, #0]
	mov	r2, #1
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	mov	r0, #12
	str	r3, [ip, #0]
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L21:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L2
	.p2align 2
.L69:
	b	.L66
	b	.L66
	b	.L67
	b	.L68
	b	.L68
	b	.L68
	b	.L68
	b	.L68
	b	.L68
	b	.L68
.L22:
	cmp	r1, #32
	beq	.L70
	bcc	.L2
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L2
.L72:
	ldr	r3, [r4, #0]
	mov	r0, #24
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, pc}
.L23:
	sub	r3, r1, #32
	cmp	r3, #25
	addls	pc, pc, r3, asl #2
	b	.L2
	.p2align 2
.L75:
	b	.L70
	b	.L2
	b	.L2
	b	.L2
	b	.L2
	b	.L2
	b	.L2
	b	.L2
	b	.L2
	b	.L2
	b	.L2
	b	.L2
	b	.L2
	b	.L2
	b	.L2
	b	.L2
	b	.L72
	b	.L72
	b	.L72
	b	.L72
	b	.L72
	b	.L73
	b	.L87
	b	.L87
	b	.L87
	b	.L87
.L13:
	sub	r3, r1, #48
	cmp	r3, #4
	bhi	.L2
	b	.L88
.L14:
	cmp	r1, #118
	moveq	r0, #14
	bne	.L2
	ldmfd	sp!, {r4, pc}
.L29:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L2
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
.L30:
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L2
	ldr	r3, [r2, #0]
	mov	r0, #33
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r2, #0]
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L31:
	cmp	r1, #48
	bne	.L2
	ldr	r3, [r3, #0]
	mov	r0, #33
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	str	r3, [r2, #0]
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L17:
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L2
	ldr	r3, [r2, #0]
	mov	r0, #18
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r2, #0]
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L18:
	cmp	r1, #48
	bne	.L2
	ldr	r3, [r3, #0]
	mov	r0, #18
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	str	r3, [r2, #0]
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L19:
	cmp	r1, #119
	moveq	r0, #20
	bne	.L2
	ldmfd	sp!, {r4, pc}
.L20:
	cmp	r1, #32
	moveq	r0, #21
	bne	.L2
	ldmfd	sp!, {r4, pc}
.L15:
	cmp	r1, #32
	moveq	r0, #15
	bne	.L2
	ldmfd	sp!, {r4, pc}
.L16:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L2
	.p2align 2
.L61:
	b	.L58
	b	.L58
	b	.L58
	b	.L58
	b	.L58
	b	.L58
	b	.L58
	b	.L58
	b	.L59
	b	.L60
.L25:
	cmp	r1, #32
	beq	.L70
	bcc	.L2
	sub	r3, r1, #48
	cmp	r3, #5
	bhi	.L2
.L87:
	ldr	r3, [r4, #0]
	mov	r0, #26
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, pc}
.L27:
	cmp	r1, #67
	beq	.L78
	cmp	r1, #83
	bne	.L2
.L78:
	ldr	r3, [sp, #16]
	mov	r2, #1
	mov	r0, #28
	strb	r1, [r3, #0]
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L28:
	cmp	r1, #32
	moveq	r0, #30
	bne	.L2
	ldmfd	sp!, {r4, pc}
.L5:
	cmp	r1, #32
	moveq	r0, #4
	bne	.L2
	ldmfd	sp!, {r4, pc}
.L6:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L2
	.p2align 2
.L46:
	b	.L43
	b	.L43
	b	.L43
	b	.L43
	b	.L43
	b	.L43
	b	.L43
	b	.L43
	b	.L44
	b	.L45
.L7:
	cmp	r1, #32
	beq	.L47
	bcc	.L2
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L2
	ldr	r3, [r2, #0]
	mov	r0, #7
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, pc}
.L24:
	cmp	r1, #32
	beq	.L70
	bcc	.L2
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L2
	b	.L87
.L26:
	cmp	r1, #32
	bne	.L2
.L70:
	mov	r0, #27
	ldmfd	sp!, {r4, pc}
.L8:
	cmp	r1, #32
	beq	.L47
	cmp	r1, #48
	bne	.L2
	ldr	r3, [r3, #0]
	mov	r0, #8
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, pc}
.L44:
	mov	r3, #8
	mov	r0, #6
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, pc}
.L45:
	mov	r3, #9
	mov	r0, #7
	str	r3, [r2, #0]
	ldmfd	sp!, {r4, pc}
.L58:
	str	r1, [r3, #0]
	mov	r0, #16
	mov	r3, #1
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L43:
	mov	r0, #5
	str	r1, [r3, #0]
	ldmfd	sp!, {r4, pc}
.L50:
	mov	r3, #0
	mov	r2, #1
	mov	r0, #10
	str	r3, [ip, #0]
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L51:
	mov	r3, #1
	mov	r0, #11
	str	r3, [ip, #0]
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L52:
	mov	r3, #1
	mov	r0, #12
	str	r1, [ip, #0]
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L67:
	mov	r3, #2
	mov	r0, #23
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, pc}
.L68:
	mov	r0, #24
	str	r1, [r4, #0]
	ldmfd	sp!, {r4, pc}
.L59:
	mov	r3, #8
	str	r3, [r2, #0]
	mov	r0, #17
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L60:
	mov	r3, #9
	str	r3, [r2, #0]
	mov	r0, #18
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L66:
	mov	r0, #22
	str	r1, [r4, #0]
	ldmfd	sp!, {r4, pc}
.L80:
	str	r1, [r3, #0]
	mov	r0, #31
	mov	r3, #1
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L81:
	mov	r3, #8
	str	r3, [r2, #0]
	mov	r0, #32
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L82:
	mov	r3, #9
	str	r3, [r2, #0]
	mov	r0, #33
	mov	r2, #1
	str	r2, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L73:
	ldr	r3, [r4, #0]
	mov	r0, #25
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	add	r3, r3, #5
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, pc}
.L33:
	mov	r0, #29
	ldmfd	sp!, {r4, pc}
.L34:
	mov	r3, #1
	mov	r0, #90
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L35:
	mov	r3, #1
	mov	r0, r3
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, pc}
.L36:
	mov	r0, #13
	ldmfd	sp!, {r4, pc}
.L37:
	mov	r0, #19
	ldmfd	sp!, {r4, pc}
.L38:
	mov	r0, #2
	ldmfd	sp!, {r4, pc}
	.size	nextState, .-nextState
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"trainServer\000"
	.align	2
.LC1:
	.ascii	"<parseCommand>: trainServer has not been set up.\015"
	.ascii	"\012\000"
	.align	2
.LC2:
	.ascii	"<Parse_Command>: Error with send Lights command.\015"
	.ascii	"\012\000"
	.align	2
.LC3:
	.ascii	"<Parse_Command>: Error with send Reverse command.\015"
	.ascii	"\012\000"
	.align	2
.LC4:
	.ascii	"<Parse_Command>: Error with send Trains command.\015"
	.ascii	"\012\000"
	.text
	.align	2
	.global	parseCommand
	.type	parseCommand, %function
parseCommand:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L112
	mov	r6, r0
	ldr	r0, .L112+4
.L109:
	add	sl, pc, sl
	sub	sp, sp, #52
	add	r0, sl, r0
	str	r1, [sp, #20]
	str	r2, [sp, #16]
	bl	WhoIs(PLT)
	ldr	r2, .L112+8
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
	beq	.L93
	add	r1, sp, #44
	mov	r4, r0
	mov	r5, #1
	add	fp, sp, #40
	add	r9, sp, #36
	add	r8, sp, #32
	add	r7, sp, #51
	str	r1, [sp, #12]
	b	.L94
.L111:
	ldrb	r3, [r5, r6]	@ zero_extendqisi2
	add	r5, r5, #1
	cmp	r3, #0
	beq	.L110
.L94:
	ldrb	r1, [r6, r4]	@ zero_extendqisi2
	ldr	r2, [sp, #12]
	mov	r3, fp
	str	r9, [sp, #0]
	str	r8, [sp, #4]
	str	r7, [sp, #8]
	bl	nextState(PLT)
	cmp	r0, #0
	add	r4, r4, #1
	bge	.L111
.L95:
	mov	r0, #3
.L93:
	add	sp, sp, #52
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L110:
	cmp	r0, #0
	ble	.L95
	ldr	r3, [sp, #44]
	cmp	r3, #1
	bne	.L95
	sub	r3, r0, #1
	cmp	r3, #89
	addls	pc, pc, r3, asl #2
	b	.L95
	.p2align 2
.L107:
	b	.L101
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L102
	b	.L102
	b	.L102
	b	.L95
	b	.L95
	b	.L95
	b	.L103
	b	.L103
	b	.L103
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L104
	b	.L95
	b	.L95
	b	.L105
	b	.L105
	b	.L105
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L95
	b	.L106
.L101:
	mov	r0, #10
	b	.L93
.L102:
	ldr	lr, [sp, #40]
	ldr	r4, [sp, #36]
	ldr	r2, [sp, #20]
	mov	ip, #84
	str	lr, [r2, #0]
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
	ldr	r2, .L112+12
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r2
	bl	bwassert(PLT)
	ldr	r3, [sp, #36]
	ldr	r1, [sp, #16]
	mov	r0, #13
	str	r3, [r1, #0]
	b	.L93
.L103:
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
	ldr	r2, .L112+16
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r2
	bl	bwassert(PLT)
	ldr	r3, [sp, #40]
	ldr	r1, [sp, #20]
	mov	r0, #12
	str	r3, [r1, #0]
	b	.L93
.L104:
	ldr	r3, [sp, #32]
	ldr	r1, [sp, #20]
	ldrb	r2, [sp, #51]	@ zero_extendqisi2
	str	r3, [r1, #0]
	ldr	r3, [sp, #16]
	mov	r0, #11
	str	r2, [r3, #0]
	b	.L93
.L105:
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
	ldr	r2, .L112+20
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r0, #14
	b	.L93
.L106:
	mov	r0, #15
	b	.L93
.L113:
	.align	2
.L112:
	.word	_GLOBAL_OFFSET_TABLE_-(.L109+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	parseCommand, .-parseCommand
	.ident	"GCC: (GNU) 4.0.2"
