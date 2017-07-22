	.file	"controller.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"displayServer\000"
	.align	2
.LC1:
	.ascii	"<update switchs>: Displaying switches failed.\000"
	.align	2
.LC2:
	.ascii	"<trainServer>: Error sending message to DisplayServ"
	.ascii	"er.\015\012\000"
	.text
	.align	2
	.global	update_switch
	.type	update_switch, %function
update_switch:
	@ args = 0, pretend = 0, frame = 92
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L44
	mov	r4, r0
	ldr	r0, .L44+4
.L40:
	add	sl, pc, sl
	sub	sp, sp, #96
	mov	fp, #0
	add	r0, sl, r0
	mov	r9, r1
	mov	r8, r2
	str	fp, [sp, #88]
	bl	WhoIs(PLT)
	cmp	r4, #18
	str	r0, [sp, #12]
	str	fp, [sp, #80]
	bgt	.L2
	mov	r2, #33
	add	r3, r9, r4, asl #6
	strb	r2, [sp, #84]
	add	r3, r3, #5120
	ldr	ip, [r3, #12]
	sub	lr, r4, #1
	cmp	ip, #2
	movne	ip, #83
	moveq	ip, #67
	add	r3, sp, #93
	add	r1, sp, #84
	sub	r2, r2, #29
	strb	ip, [sp, #85]
	mov	ip, #3
	str	r3, [sp, #4]
	strb	lr, [sp, #86]
	str	ip, [sp, #0]
	strb	fp, [sp, #87]
	bl	Send(PLT)
	ldr	r2, .L44+8
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r3, #58
	str	r3, [sp, #80]
	ldr	r2, [sp, #80]
	cmp	r2, #79
	ble	.L42
.L36:
	add	sp, sp, #96
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L2:
	cmp	r4, #154
	ble	.L43
	cmp	r4, #156
	bgt	.L36
	add	r6, r9, #6400
	ldr	lr, [r6, #12]
	add	ip, sp, #93
	add	r3, sp, #84
	cmp	lr, #4
	str	r3, [sp, #8]
	str	ip, [sp, #4]
	mov	r3, ip
	mov	ip, #20
	movne	lr, #83
	moveq	lr, #67
	mov	r7, #33
	ldr	r1, [sp, #8]
	mov	r2, #4
	strb	ip, [sp, #86]
	sub	ip, ip, #17
	strb	lr, [sp, #85]
	str	ip, [sp, #0]
	strb	r7, [sp, #84]
	strb	fp, [sp, #87]
	bl	Send(PLT)
	ldr	r3, .L44+8
	mvn	r0, r0
	add	r5, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	mov	r2, r5
	bl	bwassert(PLT)
	ldr	r4, [r6, #12]
	mov	ip, #21
	cmp	r4, #3
	movne	r4, #83
	moveq	r4, #67
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #8]
	mov	r2, #4
	strb	ip, [sp, #86]
	ldr	r0, [sp, #12]
	sub	ip, ip, #18
	str	ip, [sp, #0]
	strb	r7, [sp, #84]
	strb	r4, [sp, #85]
	strb	fp, [sp, #87]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r2, r5
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r3, #58
	str	r3, [sp, #80]
	ldr	r2, [sp, #80]
	cmp	r2, #79
	bgt	.L36
	add	r7, sp, #88
	b	.L32
.L33:
	ldr	r3, [sp, #80]
	add	r3, r3, #1
	str	r3, [sp, #80]
	ldr	r2, [sp, #80]
	cmp	r2, #79
	bgt	.L36
.L32:
	mov	r1, #100
	mov	r2, r7
	mov	r0, r9
	bl	findAltSensor(PLT)
	ldr	r3, [sp, #80]
	mov	r1, #100
	ldr	ip, [r8, r3, asl #2]
	mov	r2, r7
	cmp	r0, ip
	mov	r0, r9
	bne	.L33
	ldr	r4, [sp, #80]
	bl	findNextSensor(PLT)
	ldr	lr, [sp, #80]
	str	r0, [r8, r4, asl #2]
	ldr	ip, [r8, lr, asl #2]
	add	r1, sp, #16
	cmp	ip, #0
	mov	r2, #4
	ldr	r3, [sp, #4]
	ldr	r0, [sp, #12]
	ble	.L36
	ldr	r5, [sp, #80]
	mov	ip, #31
	ldr	r4, [sp, #80]
	strb	ip, [sp, #16]
	ldr	lr, [r8, r4, asl #2]
	sub	ip, ip, #31
	mov	r4, #3
	strb	r5, [sp, #17]
	strb	lr, [sp, #18]
	strb	ip, [sp, #19]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L44+12
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	b	.L33
.L43:
	add	r6, r9, #6336
	ldr	lr, [r6, #12]
	add	ip, sp, #84
	cmp	lr, #4
	mov	r1, ip
	str	ip, [sp, #8]
	mov	ip, #18
	movne	lr, #83
	moveq	lr, #67
	add	r3, sp, #93
	mov	r7, #33
	mov	r2, #4
	strb	ip, [sp, #86]
	sub	ip, ip, #15
	strb	lr, [sp, #85]
	str	ip, [sp, #0]
	str	r3, [sp, #4]
	strb	r7, [sp, #84]
	strb	fp, [sp, #87]
	bl	Send(PLT)
	ldr	r3, .L44+8
	mvn	r0, r0
	add	r5, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	mov	r2, r5
	bl	bwassert(PLT)
	ldr	r4, [r6, #12]
	mov	ip, #19
	cmp	r4, #3
	movne	r4, #83
	moveq	r4, #67
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #8]
	mov	r2, #4
	strb	ip, [sp, #86]
	ldr	r0, [sp, #12]
	sub	ip, ip, #16
	str	ip, [sp, #0]
	strb	r7, [sp, #84]
	strb	r4, [sp, #85]
	strb	fp, [sp, #87]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r2, r5
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r3, #58
	str	r3, [sp, #80]
	ldr	r2, [sp, #80]
	cmp	r2, #79
	bgt	.L36
	add	r7, sp, #88
	b	.L21
.L22:
	ldr	r3, [sp, #80]
	add	r3, r3, #1
	str	r3, [sp, #80]
	ldr	r2, [sp, #80]
	cmp	r2, #79
	bgt	.L36
.L21:
	mov	r1, #99
	mov	r2, r7
	mov	r0, r9
	bl	findAltSensor(PLT)
	ldr	r3, [sp, #80]
	mov	r2, r7
	ldr	ip, [r8, r3, asl #2]
	mov	r1, #99
	cmp	r0, ip
	mov	r0, r9
	bne	.L22
	ldr	r4, [sp, #80]
	bl	findNextSensor(PLT)
	ldr	lr, [sp, #80]
	str	r0, [r8, r4, asl #2]
	ldr	ip, [r8, lr, asl #2]
	add	r1, sp, #16
	cmp	ip, #0
	mov	r2, #4
	ldr	r3, [sp, #4]
	ldr	r0, [sp, #12]
	ble	.L36
	ldr	r5, [sp, #80]
	mov	ip, #31
	ldr	r4, [sp, #80]
	strb	ip, [sp, #16]
	ldr	lr, [r8, r4, asl #2]
	sub	ip, ip, #31
	mov	r4, #3
	strb	r5, [sp, #17]
	strb	lr, [sp, #18]
	strb	ip, [sp, #19]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L44+12
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	b	.L22
.L42:
	add	r6, r4, #80
	add	r7, sp, #88
	b	.L9
.L10:
	ldr	r3, [sp, #80]
	add	r3, r3, #1
	str	r3, [sp, #80]
	ldr	r2, [sp, #80]
	cmp	r2, #79
	bgt	.L36
.L9:
	mov	r1, r6
	mov	r2, r7
	mov	r0, r9
	bl	findAltSensor(PLT)
	ldr	r3, [sp, #80]
	mov	r1, r6
	ldr	ip, [r8, r3, asl #2]
	mov	r2, r7
	cmp	r0, ip
	mov	r0, r9
	bne	.L10
	ldr	r4, [sp, #80]
	bl	findNextSensor(PLT)
	ldr	lr, [sp, #80]
	str	r0, [r8, r4, asl #2]
	ldr	ip, [r8, lr, asl #2]
	add	r1, sp, #16
	cmp	ip, #0
	mov	r2, #4
	ldr	r3, [sp, #4]
	ldr	r0, [sp, #12]
	ble	.L36
	ldr	r5, [sp, #80]
	mov	ip, #31
	ldr	r4, [sp, #80]
	strb	ip, [sp, #16]
	ldr	lr, [r8, r4, asl #2]
	sub	ip, ip, #31
	mov	r4, #3
	strb	r5, [sp, #17]
	strb	lr, [sp, #18]
	strb	ip, [sp, #19]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L44+12
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	b	.L10
.L45:
	.align	2
.L44:
	.word	_GLOBAL_OFFSET_TABLE_-(.L40+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	update_switch, .-update_switch
	.align	2
	.global	nextState
	.type	nextState, %function
nextState:
	@ args = 20, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	and	r1, r1, #255
	mov	r5, r2
	mov	lr, r3
	add	r2, sp, #20
	ldmia	r2, {r2, r4, ip}	@ phole ldm
	ldr	r6, [sp, #32]
	ldr	r7, [sp, #36]
	cmp	r0, #68
	addls	pc, pc, r0, asl #2
	b	.L47
	.p2align 2
.L110:
	b	.L48
	b	.L47
	b	.L49
	b	.L50
	b	.L51
	b	.L52
	b	.L53
	b	.L55
	b	.L55
	b	.L56
	b	.L57
	b	.L58
	b	.L47
	b	.L59
	b	.L60
	b	.L61
	b	.L62
	b	.L63
	b	.L47
	b	.L64
	b	.L65
	b	.L66
	b	.L67
	b	.L68
	b	.L69
	b	.L70
	b	.L71
	b	.L72
	b	.L47
	b	.L73
	b	.L74
	b	.L75
	b	.L76
	b	.L47
	b	.L77
	b	.L78
	b	.L79
	b	.L80
	b	.L82
	b	.L82
	b	.L83
	b	.L84
	b	.L85
	b	.L86
	b	.L87
	b	.L88
	b	.L89
	b	.L90
	b	.L91
	b	.L92
	b	.L94
	b	.L94
	b	.L95
	b	.L96
	b	.L97
	b	.L98
	b	.L47
	b	.L99
	b	.L100
	b	.L101
	b	.L102
	b	.L47
	b	.L103
	b	.L104
	b	.L105
	b	.L106
	b	.L107
	b	.L108
	b	.L109
.L96:
	cmp	r1, #48
	moveq	r0, #54
	ldmeqfd	sp!, {r4, r5, r6, r7, pc}
	cmp	r1, #49
	moveq	r0, #55
	ldmeqfd	sp!, {r4, r5, r6, r7, pc}
.L47:
	mvn	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L55:
	cmp	r1, #32
	bne	.L47
.L128:
	mov	r0, #9
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L82:
	cmp	r1, #32
	bne	.L47
.L176:
	mov	r0, #40
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L94:
	cmp	r1, #32
	bne	.L47
.L194:
	mov	r0, #52
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L74:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L47
	.p2align 2
.L168:
	b	.L165
	b	.L165
	b	.L165
	b	.L165
	b	.L165
	b	.L165
	b	.L165
	b	.L165
	b	.L166
	b	.L167
.L75:
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L47
	ldr	r3, [lr, #0]
	mov	r2, #1
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	mov	r0, #33
	str	r3, [lr, #0]
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L76:
	cmp	r1, #48
	bne	.L47
	ldr	r3, [r3, #0]
	mov	r2, #1
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	mov	r0, #33
	str	r3, [lr, #0]
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L77:
	cmp	r1, #32
	moveq	r0, #35
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L78:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L47
	.p2align 2
.L175:
	b	.L172
	b	.L172
	b	.L172
	b	.L172
	b	.L172
	b	.L172
	b	.L172
	b	.L172
	b	.L173
	b	.L174
.L79:
	cmp	r1, #32
	beq	.L176
	bcc	.L47
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L47
	ldr	r3, [lr, #0]
	mov	r0, #38
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L80:
	cmp	r1, #32
	beq	.L176
	cmp	r1, #48
	bne	.L47
	ldr	r3, [r3, #0]
	mov	r0, #39
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L49:
	cmp	r1, #114
	moveq	r0, #3
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L83:
	cmp	r1, #65
	bcc	.L47
	cmp	r1, #69
	movls	r3, r1, asl #4
	subls	r3, r3, #1040
	movls	r0, #41
	strls	r3, [r6, #0]
	ldmlsfd	sp!, {r4, r5, r6, r7, pc}
	cmp	r1, #78
	bne	.L47
	mov	r3, #90
	str	r3, [r6, #0]
	mov	r2, #0
	sub	r3, r3, #89
	mov	r0, #44
	str	r2, [r7, #0]
	str	r3, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L95:
	sub	r3, r1, #65
	cmp	r3, #4
	movls	r3, r1, asl #4
	subls	r3, r3, #1040
	movls	r0, #53
	strls	r3, [r6, #0]
	ldmlsfd	sp!, {r4, r5, r6, r7, pc}
	b	.L47
.L97:
	sub	r3, r1, #49
	cmp	r3, #8
	bhi	.L47
	ldr	r3, [r6, #0]
	mov	r2, #1
	add	r3, r1, r3
	sub	r3, r3, #48
	mov	r0, #56
	str	r3, [r6, #0]
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L90:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L47
	.p2align 2
.L193:
	b	.L190
	b	.L190
	b	.L190
	b	.L190
	b	.L190
	b	.L190
	b	.L190
	b	.L190
	b	.L191
	b	.L192
.L91:
	cmp	r1, #32
	beq	.L194
	bcc	.L47
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L47
	ldr	r3, [lr, #0]
	mov	r0, #50
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L64:
	cmp	r1, #115
	moveq	r0, #34
	ldmeqfd	sp!, {r4, r5, r6, r7, pc}
	cmp	r1, #119
	bne	.L47
	mov	r0, #20
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L65:
	cmp	r1, #32
	moveq	r0, #21
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L66:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L47
	.p2align 2
.L151:
	b	.L148
	b	.L148
	b	.L149
	b	.L150
	b	.L150
	b	.L150
	b	.L150
	b	.L150
	b	.L150
	b	.L150
.L67:
	sub	r3, r1, #32
	cmp	r3, #25
	addls	pc, pc, r3, asl #2
	b	.L47
	.p2align 2
.L155:
	b	.L152
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L157
	b	.L157
	b	.L157
	b	.L157
	b	.L157
	b	.L157
	b	.L157
	b	.L157
	b	.L157
	b	.L154
.L68:
	sub	r3, r1, #32
	cmp	r3, #25
	addls	pc, pc, r3, asl #2
	b	.L47
	.p2align 2
.L160:
	b	.L152
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L156
	b	.L157
	b	.L157
	b	.L157
	b	.L157
	b	.L158
	b	.L219
	b	.L219
	b	.L219
	b	.L219
.L69:
	cmp	r1, #32
	beq	.L152
.L225:
	bcc	.L47
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L47
	b	.L219
.L70:
	cmp	r1, #32
	beq	.L152
	bcc	.L47
	sub	r3, r1, #48
	cmp	r3, #5
	bhi	.L47
.L219:
	ldr	r3, [r4, #0]
	mov	r0, #26
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L60:
	cmp	r1, #32
	moveq	r0, #15
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L61:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L47
	.p2align 2
.L142:
	b	.L139
	b	.L139
	b	.L139
	b	.L139
	b	.L139
	b	.L139
	b	.L139
	b	.L139
	b	.L140
	b	.L141
.L71:
	cmp	r1, #32
	bne	.L47
.L152:
	mov	r0, #27
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L72:
	cmp	r1, #67
	beq	.L163
	cmp	r1, #83
	bne	.L47
.L163:
	mov	r3, #1
	mov	r0, #28
	strb	r1, [ip, #0]
	str	r3, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L73:
	cmp	r1, #32
	moveq	r0, #30
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L51:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L47
	.p2align 2
.L127:
	b	.L124
	b	.L124
	b	.L124
	b	.L124
	b	.L124
	b	.L124
	b	.L124
	b	.L124
	b	.L125
	b	.L126
.L52:
	cmp	r1, #32
	beq	.L128
	bcc	.L47
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L47
	ldr	r3, [lr, #0]
	mov	r0, #7
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L106:
	sub	r3, r1, #65
	cmp	r3, #4
	movls	r3, r1, asl #4
	subls	r3, r3, #1040
	movls	r0, #66
	strls	r3, [r6, #0]
	ldmlsfd	sp!, {r4, r5, r6, r7, pc}
	b	.L47
.L107:
	cmp	r1, #48
	moveq	r0, #67
	ldmeqfd	sp!, {r4, r5, r6, r7, pc}
	cmp	r1, #49
	moveq	r0, #68
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L108:
	sub	r3, r1, #49
	cmp	r3, #8
	bhi	.L47
	ldr	r3, [r6, #0]
	mov	r2, #1
	add	r3, r1, r3
	sub	r3, r3, #48
	mov	r0, #69
	str	r3, [r6, #0]
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L109:
	sub	r3, r1, #48
	cmp	r3, #6
	bhi	.L47
	ldr	r3, [r6, #0]
	mov	r2, #1
	add	r3, r1, r3
	sub	r3, r3, #38
	mov	r0, #69
	str	r3, [r6, #0]
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L98:
	sub	r3, r1, #48
	cmp	r3, #6
	bhi	.L47
	ldr	r3, [r6, #0]
	mov	r2, #1
	add	r3, r1, r3
	sub	r3, r3, #38
	mov	r0, #56
	str	r3, [r6, #0]
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L99:
	cmp	r1, #32
	moveq	r0, #58
	bne	.L225
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L100:
	cmp	r1, #67
	moveq	r0, #59
	ldmeqfd	sp!, {r4, r5, r6, r7, pc}
	cmp	r1, #83
	moveq	r0, #60
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L101:
	cmp	r1, #83
	moveq	r3, #1
	moveq	r2, #68
	streq	r3, [r5, #0]
	moveq	r0, #61
	streqb	r2, [ip, #0]
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L102:
	cmp	r1, #67
	moveq	r3, #1
	moveq	r2, #84
	streq	r3, [r5, #0]
	moveq	r0, #61
	streqb	r2, [ip, #0]
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L103:
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L47
	mov	r2, #1
	str	r2, [r5, #0]
	ldr	r3, [r7, #0]
	mov	r0, #62
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r7, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L104:
	cmp	r1, #112
	moveq	r0, #64
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L105:
	cmp	r1, #32
	moveq	r0, #65
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L62:
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L47
	ldr	r3, [lr, #0]
	mov	r2, #1
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	mov	r0, #18
	str	r3, [lr, #0]
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L63:
	cmp	r1, #48
	bne	.L47
	ldr	r3, [r3, #0]
	mov	r2, #1
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	mov	r0, #18
	str	r3, [lr, #0]
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L58:
	sub	r3, r1, #48
	cmp	r3, #4
	bhi	.L47
.L223:
	ldr	r3, [r2, #0]
	mov	r0, #12
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r2, #0]
	mov	r2, #1
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L59:
	cmp	r1, #118
	moveq	r0, #14
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L53:
	cmp	r1, #32
	beq	.L128
	cmp	r1, #48
	bne	.L47
	ldr	r3, [r3, #0]
	mov	r0, #8
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L50:
	cmp	r1, #32
	moveq	r0, #4
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L92:
	cmp	r1, #32
	beq	.L194
	cmp	r1, #48
	bne	.L47
	ldr	r3, [r3, #0]
	mov	r0, #51
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L48:
	sub	r3, r1, #81
	cmp	r3, #35
	addls	pc, pc, r3, asl #2
	b	.L47
	.p2align 2
.L120:
	b	.L111
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L47
	b	.L112
	b	.L47
	b	.L47
	b	.L113
	b	.L114
	b	.L47
	b	.L47
	b	.L115
	b	.L116
	b	.L117
	b	.L118
	b	.L119
.L56:
	sub	r1, r1, #48
	cmp	r1, #9
	addls	pc, pc, r1, asl #2
	b	.L47
	.p2align 2
.L134:
	b	.L131
	b	.L132
	b	.L133
	b	.L133
	b	.L133
	b	.L133
	b	.L133
	b	.L133
	b	.L133
	b	.L133
.L86:
	cmp	r1, #32
	beq	.L220
	bcc	.L47
	sub	r3, r1, #48
	cmp	r3, #6
	bhi	.L47
	ldr	r3, [r6, #0]
	mov	r2, #0
	add	r3, r3, r1
	sub	r3, r3, #39
	str	r3, [r6, #0]
	mov	r0, #44
	mov	r3, #1
	str	r2, [r7, #0]
	str	r3, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L88:
	cmp	r1, #115
	moveq	r0, #46
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L89:
	cmp	r1, #32
	moveq	r0, #47
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L84:
	sub	r3, r1, #48
	cmp	r3, #9
	addls	pc, pc, r3, asl #2
	b	.L47
	.p2align 2
.L184:
	b	.L181
	b	.L182
	b	.L221
	b	.L221
	b	.L221
	b	.L221
	b	.L221
	b	.L221
	b	.L221
	b	.L221
.L85:
	sub	r3, r1, #49
	cmp	r3, #8
	bhi	.L47
.L221:
	ldr	r3, [r6, #0]
	mov	r0, #44
	add	r3, r1, r3
	sub	r3, r3, #48
.L222:
	str	r3, [r6, #0]
	mov	r2, #1
	mov	r3, #0
	str	r2, [r5, #0]
	str	r3, [r7, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L57:
	sub	r3, r1, #48
	cmp	r3, #9
	bhi	.L47
	b	.L223
.L87:
	cmp	r1, #32
	bne	.L47
.L220:
	mov	r3, #0
	mov	r0, #62
	str	r3, [r5, #0]
	str	r3, [r7, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L157:
	ldr	r3, [r4, #0]
	mov	r0, #24
	add	r3, r3, r3, asl #2
	add	r3, r1, r3, asl #1
	sub	r3, r3, #48
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L181:
	mov	r0, #42
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L182:
	ldr	r3, [r6, #0]
	mov	r0, #43
	add	r3, r3, #1
	b	.L222
.L139:
	str	r1, [r3, #0]
	mov	r0, #16
	mov	r3, #1
	str	r3, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L154:
	ldr	r3, [r4, #0]
	mov	r0, #57
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	add	r3, r3, #9
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L190:
	mov	r0, #48
	str	r1, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L148:
	mov	r0, #22
	str	r1, [r4, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L149:
	mov	r3, #2
	mov	r0, #23
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L150:
	mov	r0, #24
	str	r1, [r4, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L191:
	mov	r3, #8
	mov	r0, #49
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L192:
	mov	r3, #9
	mov	r0, #50
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L166:
	mov	r3, #8
	mov	r2, #1
	mov	r0, #32
	str	r3, [lr, #0]
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L167:
	mov	r3, #9
	mov	r2, #1
	mov	r0, #33
	str	r3, [lr, #0]
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L165:
	str	r1, [r3, #0]
	mov	r0, #31
	mov	r3, #1
	str	r3, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L172:
	mov	r0, #36
	str	r1, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L173:
	mov	r3, #8
	mov	r0, #37
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L174:
	mov	r3, #9
	mov	r0, #38
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L131:
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r0, #10
	mov	r2, #1
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L132:
	mov	r3, #1
	mov	r0, #11
	str	r3, [r2, #0]
	str	r3, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L133:
	mov	r3, #1
	mov	r0, #12
	str	r1, [r2, #0]
	str	r3, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L124:
	mov	r0, #5
	str	r1, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L140:
	mov	r3, #8
	mov	r2, #1
	mov	r0, #17
	str	r3, [lr, #0]
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L141:
	mov	r3, #9
	mov	r2, #1
	mov	r0, #18
	str	r3, [lr, #0]
	str	r2, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L125:
	mov	r3, #8
	mov	r0, #6
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L126:
	mov	r3, #9
	mov	r0, #7
	str	r3, [lr, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L158:
	ldr	r3, [r4, #0]
	mov	r0, #25
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	add	r3, r3, #5
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L156:
	ldr	r3, [r4, #0]
	mov	r0, #57
	add	r3, r3, r3, asl #2
	mov	r3, r3, asl #1
	str	r3, [r4, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L111:
	mov	r3, #1
	mov	r0, #70
	str	r3, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L112:
	mov	r0, #45
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L113:
	mov	r0, #29
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L114:
	mov	r0, #63
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L115:
	mov	r3, #1
	mov	r0, #90
	str	r3, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L116:
	mov	r3, #1
	mov	r0, r3
	str	r3, [r5, #0]
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L117:
	mov	r0, #13
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L118:
	mov	r0, #19
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L119:
	mov	r0, #2
	ldmfd	sp!, {r4, r5, r6, r7, pc}
	.size	nextState, .-nextState
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"trainServer\000"
	.align	2
.LC4:
	.ascii	"trackServer\000"
	.align	2
.LC5:
	.ascii	"sensorProcessor\000"
	.align	2
.LC6:
	.ascii	"<parseCommand>: trainServer has not been set up.\015"
	.ascii	"\012\000"
	.align	2
.LC7:
	.ascii	"<Parse_Command>: Error with send Lights command.\015"
	.ascii	"\012\000"
	.align	2
.LC8:
	.ascii	"<Parse_Command>: Error with send Trains command.\015"
	.ascii	"\012\000"
	.align	2
.LC9:
	.ascii	"<Parse_Command>: Error with send Reverse command.\015"
	.ascii	"\012\000"
	.align	2
.LC10:
	.ascii	"<trainServer>: Error sending switch update to Track"
	.ascii	"Server.\015\012\000"
	.align	2
.LC11:
	.ascii	"<Parse_Command>: Error with send Init sensor comman"
	.ascii	"d.\015\012\000"
	.align	2
.LC12:
	.ascii	"<Parse_Command>: Error with send manual ping sensor"
	.ascii	" command.\015\012\000"
	.text
	.align	2
	.global	parseCommand
	.type	parseCommand, %function
parseCommand:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L262
	mov	r6, r0
	ldr	r0, .L262+4
.L259:
	add	sl, pc, sl
	sub	sp, sp, #88
	add	r0, sl, r0
	str	r3, [sp, #32]
	str	r1, [sp, #40]
	str	r2, [sp, #36]
	bl	WhoIs(PLT)
	str	r0, [sp, #44]
	ldr	r0, .L262+8
	add	r0, sl, r0
	bl	WhoIs(PLT)
	str	r0, [sp, #48]
	ldr	r0, .L262+12
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, [sp, #44]
	str	r0, [sp, #52]
	mvn	r0, r2
	ldr	r2, .L262+16
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldrb	r3, [r6, #0]	@ zero_extendqisi2
	mov	r0, #0
	cmp	r3, r0
	str	r0, [sp, #80]
	str	r0, [sp, #76]
	str	r0, [sp, #72]
	str	r0, [sp, #68]
	strb	r0, [sp, #87]
	str	r0, [sp, #64]
	str	r0, [sp, #60]
	addeq	r0, r0, #4
	beq	.L229
	add	r3, sp, #80
	add	r2, sp, #72
	add	ip, sp, #76
	str	r2, [sp, #28]
	mov	r4, r0
	mov	r5, #1
	add	fp, sp, #68
	add	r9, sp, #87
	add	r8, sp, #64
	add	r7, sp, #60
	mov	r2, r3
	str	r3, [sp, #20]
	str	ip, [sp, #24]
	b	.L230
.L261:
	ldrb	r3, [r6, r5]	@ zero_extendqisi2
	add	r5, r5, #1
	cmp	r3, #0
	beq	.L233
	ldr	r2, [sp, #20]
.L230:
	ldr	ip, [sp, #28]
	ldrb	r1, [r6, r4]	@ zero_extendqisi2
	ldr	r3, [sp, #24]
	str	ip, [sp, #0]
	str	fp, [sp, #4]
	str	r9, [sp, #8]
	str	r8, [sp, #12]
	str	r7, [sp, #16]
	bl	nextState(PLT)
	cmp	r0, #0
	add	r4, r4, #1
	bge	.L261
.L231:
	mov	r0, #3
.L229:
	add	sp, sp, #88
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L233:
	cmp	r0, #0
	ble	.L231
	ldr	r3, [sp, #80]
	cmp	r3, #1
	bne	.L231
	sub	r3, r0, #1
	cmp	r3, #69
	addls	pc, pc, r3, asl #2
	b	.L231
	.p2align 2
.L246:
	b	.L260
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L238
	b	.L238
	b	.L238
	b	.L231
	b	.L231
	b	.L231
	b	.L239
	b	.L239
	b	.L239
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L240
	b	.L231
	b	.L231
	b	.L241
	b	.L241
	b	.L241
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L242
	b	.L242
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L243
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L240
	b	.L242
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L231
	b	.L244
	b	.L245
.L245:
	bl	Quit(PLT)
.L260:
	mov	r0, #10
	b	.L229
.L238:
	ldr	lr, [sp, #72]
	ldr	r4, [sp, #76]
	ldr	r2, [sp, #40]
	ldr	r3, [sp, #36]
	mov	ip, #12
	str	r4, [r2, #0]
	add	r1, sp, #56
	str	lr, [r3, #0]
	mov	r2, #3
	add	r3, sp, #85
	strb	ip, [sp, #56]
	ldr	r0, [sp, #48]
	sub	ip, ip, #10
	strb	lr, [sp, #57]
	str	ip, [sp, #0]
	strb	r4, [sp, #58]
	bl	Send(PLT)
	ldr	r2, .L262+20
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldrb	r3, [sp, #85]	@ zero_extendqisi2
	cmp	r3, #49
	movne	r0, #25
	moveq	r0, #13
	b	.L229
.L239:
	ldr	lr, [sp, #76]
	mov	r4, #2
	mov	ip, #12
	add	r3, sp, #85
	mov	r2, r4
	add	r1, sp, #56
	ldr	r0, [sp, #44]
	strb	ip, [sp, #56]
	strb	lr, [sp, #57]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L262+24
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldrb	r2, [sp, #86]	@ zero_extendqisi2
	ldrb	r1, [sp, #85]	@ zero_extendqisi2
	cmp	r2, #48
	ldr	r3, [sp, #76]
	ldr	ip, [sp, #40]
	ldr	r2, [sp, #36]
	moveq	r0, #26
	movne	r0, #12
	str	r3, [ip, #0]
	str	r1, [r2, #0]
	b	.L229
.L241:
	ldr	lr, [sp, #76]
	ldr	r0, [sp, #40]
	mov	r4, #2
	str	lr, [r0, #0]
	add	r3, sp, #85
	mov	ip, #14
	mov	r2, r4
	add	r1, sp, #56
	ldr	r0, [sp, #44]
	strb	ip, [sp, #56]
	strb	lr, [sp, #57]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L262+28
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldrb	r3, [sp, #85]	@ zero_extendqisi2
	cmp	r3, #49
	movne	r0, #24
	moveq	r0, #14
	b	.L229
.L243:
	ldr	lr, [sp, #76]
	ldr	r4, [sp, #64]
	ldr	r3, [sp, #40]
	ldr	ip, [sp, #36]
	add	r5, sp, #56
	add	r6, sp, #85
	str	lr, [r3, #0]
	mov	r7, #2
	str	r4, [ip, #0]
	mov	r3, r6
	mov	ip, #5
	mov	r1, r5
	mov	r2, #4
	ldr	r0, [sp, #48]
	strb	ip, [sp, #56]
	strb	lr, [sp, #57]
	strb	r4, [sp, #58]
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	r3, .L262+32
	mvn	r0, r0
	add	r4, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	mov	r2, r4
	bl	bwassert(PLT)
	mov	ip, #22
	ldr	lr, [sp, #76]
	strb	ip, [sp, #56]
	ldr	ip, [sp, #64]
	mov	r3, r6
	mov	r1, r5
	mov	r2, #3
	ldr	r0, [sp, #44]
	strb	lr, [sp, #57]
	strb	ip, [sp, #58]
	str	r7, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r2, r4
	mov	r1, #1
	bl	bwassert(PLT)
	ldrb	r3, [sp, #85]	@ zero_extendqisi2
	cmp	r3, #49
	movne	r0, #36
	moveq	r0, #22
	b	.L229
.L240:
	ldr	r2, [sp, #68]
	ldr	r3, [sp, #40]
	ldrb	r1, [sp, #87]	@ zero_extendqisi2
	ldr	ip, [sp, #36]
	str	r2, [r3, #0]
	mov	r3, #6
	strb	r3, [sp, #56]
	cmp	r2, #20
	sub	r3, r3, #6
	str	r1, [ip, #0]
	strb	r1, [sp, #58]
	strb	r3, [sp, #59]
	strb	r2, [sp, #57]
	bgt	.L231
	mov	ip, #2
	add	r1, sp, #56
	mov	r2, #4
	add	r3, sp, #85
	ldr	r0, [sp, #48]
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L262+36
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r0, #11
	b	.L229
.L242:
	ldr	r6, [sp, #60]
	ldr	r1, .L262+40
	ldr	r2, .L262+44
	ldr	r3, .L262+48
	smull	r0, r5, r1, r6
	smull	r0, r4, r3, r6
	smull	ip, r3, r2, r6
	mov	lr, r6, asr #31
	rsb	r5, lr, r5, asr #5
	rsb	r4, lr, r4, asr #18
	rsb	lr, lr, r3, asr #12
	smull	r2, ip, r1, lr
	smull	r3, r0, r1, r4
	smull	r2, r7, r1, r5
	mov	r2, lr, asr #31
	mov	r3, r4, asr #31
	rsb	r2, r2, ip, asr #5
	mov	r1, r5, asr #31
	rsb	r3, r3, r0, asr #5
	add	r2, r2, r2, asl #2
	ldr	ip, [sp, #40]
	rsb	r1, r1, r7, asr #5
	add	r2, r2, r2, asl #2
	ldr	r7, [sp, #76]
	add	r3, r3, r3, asl #2
	ldr	r8, [sp, #64]
	sub	lr, lr, r2, asl #2
	ldr	r0, [sp, #36]
	ldr	r2, [sp, #32]
	add	r3, r3, r3, asl #2
	add	r1, r1, r1, asl #2
	str	r7, [ip, #0]
	sub	r4, r4, r3, asl #2
	add	r1, r1, r1, asl #2
	mov	ip, #4
	str	r8, [r0, #0]
	add	r3, sp, #85
	str	r6, [r2, #0]
	sub	r5, r5, r1, asl #2
	mov	r2, #7
	add	r1, sp, #56
	strb	ip, [sp, #56]
	strb	r4, [sp, #59]
	sub	ip, ip, #4
	ldr	r0, [sp, #48]
	mov	r4, #2
	strb	lr, [sp, #60]
	strb	ip, [sp, #63]
	strb	r7, [sp, #57]
	strb	r8, [sp, #58]
	strb	r5, [sp, #61]
	strb	r6, [sp, #62]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L262+32
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldrb	r3, [sp, #85]	@ zero_extendqisi2
	cmp	r3, #49
	movne	r0, #23
	moveq	r0, #21
	b	.L229
.L244:
	ldr	lr, [sp, #64]
	ldr	r0, [sp, #40]
	mov	ip, #2
	str	lr, [r0, #0]
	mov	r2, ip
	add	r1, sp, #56
	add	r3, sp, #85
	ldr	r0, [sp, #52]
	strb	lr, [sp, #57]
	strb	ip, [sp, #56]
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L262+52
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r0, #15
	b	.L229
.L263:
	.align	2
.L262:
	.word	_GLOBAL_OFFSET_TABLE_-(.L259+8)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	1374389535
	.word	1759218605
	.word	1125899907
	.word	.LC12(GOTOFF)
	.size	parseCommand, .-parseCommand
	.ident	"GCC: (GNU) 4.0.2"
