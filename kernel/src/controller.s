	.file	"controller.c"
	.section	.rodata
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
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	ldr	sl, .L17
.L16:
	add	sl, pc, sl
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	ldr	r3, .L17+4
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #4
	str	r3, [fp, #-24]
	mov	r3, #3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-40]
	cmp	r3, #18
	bgt	.L2
	mov	r3, #48
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	and	r3, r3, #255
	strb	r3, [fp, #-31]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	sub	r3, r3, #1
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	sub	r2, fp, #32
	sub	ip, fp, #35
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L17+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L15
.L2:
	ldr	r3, [fp, #-40]
	cmp	r3, #154
	bgt	.L5
	ldr	r3, [fp, #-48]
	add	r3, r3, #72
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	add	r3, r3, #76
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	.L7
	ldr	r3, [fp, #-44]
	cmp	r3, #67
	bne	.L7
	mov	r3, #1
	strb	r3, [fp, #-32]
	mov	r3, #67
	strb	r3, [fp, #-31]
	mov	r3, #18
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	sub	r2, fp, #32
	sub	ip, fp, #35
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L17+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #1
	strb	r3, [fp, #-32]
	mov	r3, #67
	strb	r3, [fp, #-31]
	mov	r3, #19
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	sub	r2, fp, #32
	sub	ip, fp, #35
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L17+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L15
.L7:
	mov	r3, #48
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-48]
	add	r3, r3, #72
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-31]
	mov	r3, #18
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	sub	r2, fp, #32
	sub	ip, fp, #35
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L17+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #48
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-48]
	add	r3, r3, #76
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-31]
	mov	r3, #19
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	sub	r2, fp, #32
	sub	ip, fp, #35
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L17+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L15
.L5:
	ldr	r3, [fp, #-40]
	cmp	r3, #156
	bgt	.L15
	ldr	r3, [fp, #-48]
	add	r3, r3, #80
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-48]
	add	r3, r3, #84
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bne	.L12
	ldr	r3, [fp, #-44]
	cmp	r3, #67
	bne	.L12
	mov	r3, #1
	strb	r3, [fp, #-32]
	mov	r3, #67
	strb	r3, [fp, #-31]
	mov	r3, #20
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	sub	r2, fp, #32
	sub	ip, fp, #35
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L17+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #1
	strb	r3, [fp, #-32]
	mov	r3, #67
	strb	r3, [fp, #-31]
	mov	r3, #21
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	sub	r2, fp, #32
	sub	ip, fp, #35
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L17+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L15
.L12:
	mov	r3, #48
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-48]
	add	r3, r3, #80
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-31]
	mov	r3, #20
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	sub	r2, fp, #32
	sub	ip, fp, #35
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L17+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #48
	strb	r3, [fp, #-32]
	ldr	r3, [fp, #-48]
	add	r3, r3, #84
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-31]
	mov	r3, #21
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	sub	r2, fp, #32
	sub	ip, fp, #35
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L17+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
.L15:
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L18:
	.align	2
.L17:
	.word	_GLOBAL_OFFSET_TABLE_-(.L16+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	update_switch, .-update_switch
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #64
	ldr	sl, .L39
.L38:
	add	sl, pc, sl
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	str	r2, [fp, #-64]
	ldr	r3, .L39+4
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L39+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-44]
	mov	r3, #0
	strb	r3, [fp, #-45]
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L20
	mov	r3, #4
	str	r3, [fp, #-68]
	b	.L22
.L20:
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	sub	ip, fp, #32
	sub	lr, fp, #36
	sub	r3, fp, #40
	str	r3, [sp, #0]
	sub	r3, fp, #44
	str	r3, [sp, #4]
	sub	r3, fp, #45
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
	blt	.L23
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-56]
	add	r3, r2, r3
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L23
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L20
.L23:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	ble	.L26
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L26
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	cmp	r3, #89
	addls	pc, pc, r3, asl #2
	b	.L29
	.p2align 2
.L36:
	b	.L30
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L31
	b	.L31
	b	.L31
	b	.L29
	b	.L29
	b	.L29
	b	.L32
	b	.L32
	b	.L32
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L33
	b	.L29
	b	.L29
	b	.L34
	b	.L34
	b	.L34
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L29
	b	.L35
.L30:
	mov	r3, #10
	str	r3, [fp, #-68]
	b	.L22
.L34:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-60]
	str	r2, [r3, #0]
	mov	r3, #76
	strb	r3, [fp, #-49]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	strb	r3, [fp, #-48]
	mov	r3, #0
	strb	r3, [fp, #-47]
	mov	r3, #0
	strb	r3, [fp, #-46]
	sub	r2, fp, #49
	sub	ip, fp, #51
	mov	r3, #2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L39+12
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #14
	str	r3, [fp, #-68]
	b	.L22
.L32:
	mov	r3, #82
	strb	r3, [fp, #-49]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	strb	r3, [fp, #-48]
	mov	r3, #0
	strb	r3, [fp, #-47]
	mov	r3, #0
	strb	r3, [fp, #-46]
	sub	r2, fp, #49
	sub	ip, fp, #51
	mov	r3, #2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L39+16
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-60]
	str	r2, [r3, #0]
	ldrb	r3, [fp, #-51]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-64]
	str	r2, [r3, #0]
	mov	r3, #12
	str	r3, [fp, #-68]
	b	.L22
.L31:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-60]
	str	r2, [r3, #0]
	mov	r3, #84
	strb	r3, [fp, #-49]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	strb	r3, [fp, #-48]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	strb	r3, [fp, #-47]
	mov	r3, #0
	strb	r3, [fp, #-46]
	sub	r2, fp, #49
	sub	ip, fp, #51
	mov	r3, #2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L39+20
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-64]
	str	r2, [r3, #0]
	mov	r3, #13
	str	r3, [fp, #-68]
	b	.L22
.L33:
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-60]
	str	r2, [r3, #0]
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-64]
	str	r2, [r3, #0]
	mov	r3, #83
	strb	r3, [fp, #-49]
	ldr	r3, [fp, #-44]
	and	r3, r3, #255
	strb	r3, [fp, #-48]
	ldrb	r3, [fp, #-45]	@ zero_extendqisi2
	strb	r3, [fp, #-47]
	mov	r3, #0
	strb	r3, [fp, #-46]
	sub	r2, fp, #49
	sub	ip, fp, #51
	mov	r3, #2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L39+24
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #11
	str	r3, [fp, #-68]
	b	.L22
.L35:
	mov	r3, #15
	str	r3, [fp, #-68]
	b	.L22
.L29:
	mov	r3, #3
	str	r3, [fp, #-68]
	b	.L22
.L26:
	mov	r3, #3
	str	r3, [fp, #-68]
.L22:
	ldr	r3, [fp, #-68]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L40:
	.align	2
.L39:
	.word	_GLOBAL_OFFSET_TABLE_-(.L38+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.size	parseCommand, .-parseCommand
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
	b	.L42
	.p2align 2
.L72:
	b	.L43
	b	.L42
	b	.L44
	b	.L45
	b	.L46
	b	.L47
	b	.L48
	b	.L49
	b	.L50
	b	.L51
	b	.L52
	b	.L53
	b	.L42
	b	.L54
	b	.L55
	b	.L56
	b	.L57
	b	.L58
	b	.L42
	b	.L59
	b	.L60
	b	.L61
	b	.L62
	b	.L63
	b	.L64
	b	.L65
	b	.L66
	b	.L67
	b	.L42
	b	.L68
	b	.L69
	b	.L70
	b	.L71
.L43:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #108
	cmp	r3, #8
	addls	pc, pc, r3, asl #2
	b	.L73
	.p2align 2
.L80:
	b	.L74
	b	.L73
	b	.L73
	b	.L73
	b	.L75
	b	.L76
	b	.L77
	b	.L78
	b	.L79
.L75:
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #90
	str	r2, [fp, #-56]
	b	.L81
.L76:
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-56]
	b	.L81
.L79:
	mov	r2, #2
	str	r2, [fp, #-56]
	b	.L81
.L77:
	mov	r3, #13
	str	r3, [fp, #-56]
	b	.L81
.L78:
	mov	r2, #19
	str	r2, [fp, #-56]
	b	.L81
.L74:
	mov	r3, #29
	str	r3, [fp, #-56]
	b	.L81
.L73:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L81
.L44:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #114
	beq	.L83
	b	.L82
.L83:
	mov	r3, #3
	str	r3, [fp, #-56]
	b	.L81
.L82:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L81
.L45:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L85
	b	.L84
.L85:
	mov	r3, #4
	str	r3, [fp, #-56]
	b	.L81
.L84:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L81
.L46:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	addls	pc, pc, r3, asl #2
	b	.L86
	.p2align 2
.L90:
	b	.L87
	b	.L87
	b	.L87
	b	.L87
	b	.L87
	b	.L87
	b	.L87
	b	.L87
	b	.L88
	b	.L89
.L87:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	mov	r3, #5
	str	r3, [fp, #-56]
	b	.L81
.L88:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	mov	r2, #6
	str	r2, [fp, #-56]
	b	.L81
.L89:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	mov	r3, #7
	str	r3, [fp, #-56]
	b	.L81
.L86:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L81
.L47:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-52]
	cmp	r2, #32
	beq	.L92
	ldr	r3, [fp, #-52]
	cmp	r3, #32
	blt	.L91
	ldr	r2, [fp, #-52]
	sub	r3, r2, #48
	cmp	r3, #9
	bhi	.L91
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
	b	.L81
.L92:
	mov	r2, #9
	str	r2, [fp, #-56]
	b	.L81
.L91:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L48:
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	str	r2, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #32
	beq	.L95
	ldr	r2, [fp, #-48]
	cmp	r2, #48
	beq	.L96
	b	.L94
.L96:
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
	b	.L81
.L95:
	mov	r2, #9
	str	r2, [fp, #-56]
	b	.L81
.L94:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L49:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L98
	b	.L97
.L98:
	mov	r2, #9
	str	r2, [fp, #-56]
	b	.L81
.L97:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L50:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L100
	b	.L99
.L100:
	mov	r2, #9
	str	r2, [fp, #-56]
	b	.L81
.L99:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L51:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	addls	pc, pc, r3, asl #2
	b	.L101
	.p2align 2
.L105:
	b	.L102
	b	.L103
	b	.L104
	b	.L104
	b	.L104
	b	.L104
	b	.L104
	b	.L104
	b	.L104
	b	.L104
.L102:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #4]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #10
	str	r2, [fp, #-56]
	b	.L81
.L103:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #4]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #11
	str	r3, [fp, #-56]
	b	.L81
.L104:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #4]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #12
	str	r2, [fp, #-56]
	b	.L81
.L101:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L52:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	bhi	.L106
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
	b	.L81
.L106:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L53:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #4
	bhi	.L108
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
	b	.L81
.L108:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L54:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #118
	beq	.L111
	b	.L110
.L111:
	mov	r2, #14
	str	r2, [fp, #-56]
	b	.L81
.L110:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L55:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L113
	b	.L112
.L113:
	mov	r2, #15
	str	r2, [fp, #-56]
	b	.L81
.L112:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L56:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	addls	pc, pc, r3, asl #2
	b	.L114
	.p2align 2
.L118:
	b	.L115
	b	.L115
	b	.L115
	b	.L115
	b	.L115
	b	.L115
	b	.L115
	b	.L115
	b	.L116
	b	.L117
.L115:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #16
	str	r2, [fp, #-56]
	b	.L81
.L116:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #17
	str	r3, [fp, #-56]
	b	.L81
.L117:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #18
	str	r2, [fp, #-56]
	b	.L81
.L114:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L57:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	bhi	.L119
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
	b	.L81
.L119:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L58:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #48
	beq	.L122
	b	.L121
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
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #18
	str	r2, [fp, #-56]
	b	.L81
.L121:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L59:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #119
	beq	.L124
	b	.L123
.L124:
	mov	r2, #20
	str	r2, [fp, #-56]
	b	.L81
.L123:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L60:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L126
	b	.L125
.L126:
	mov	r2, #21
	str	r2, [fp, #-56]
	b	.L81
.L125:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L61:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	addls	pc, pc, r3, asl #2
	b	.L127
	.p2align 2
.L131:
	b	.L128
	b	.L128
	b	.L129
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
	ldr	r3, [fp, #8]
	str	r2, [r3, #0]
	mov	r2, #22
	str	r2, [fp, #-56]
	b	.L81
.L129:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #8]
	str	r2, [r3, #0]
	mov	r3, #23
	str	r3, [fp, #-56]
	b	.L81
.L130:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #8]
	str	r2, [r3, #0]
	mov	r2, #24
	str	r2, [fp, #-56]
	b	.L81
.L127:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L62:
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	str	r2, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #32
	beq	.L133
	ldr	r2, [fp, #-44]
	cmp	r2, #32
	blt	.L132
	ldr	r2, [fp, #-44]
	sub	r3, r2, #48
	cmp	r3, #9
	bhi	.L132
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
	b	.L81
.L133:
	mov	r2, #27
	str	r2, [fp, #-56]
	b	.L81
.L132:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L63:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #32
	cmp	r3, #25
	addls	pc, pc, r3, asl #2
	b	.L135
	.p2align 2
.L140:
	b	.L136
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L135
	b	.L137
	b	.L137
	b	.L137
	b	.L137
	b	.L137
	b	.L138
	b	.L139
	b	.L139
	b	.L139
	b	.L139
.L137:
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
	b	.L81
.L138:
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
	b	.L81
.L139:
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
	b	.L81
.L136:
	mov	r3, #27
	str	r3, [fp, #-56]
	b	.L81
.L135:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L81
.L64:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-40]
	cmp	r2, #32
	beq	.L142
	ldr	r3, [fp, #-40]
	cmp	r3, #32
	blt	.L141
	ldr	r2, [fp, #-40]
	sub	r3, r2, #48
	cmp	r3, #9
	bhi	.L141
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
	b	.L81
.L142:
	mov	r2, #27
	str	r2, [fp, #-56]
	b	.L81
.L141:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L65:
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	str	r2, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #32
	beq	.L145
	ldr	r2, [fp, #-36]
	cmp	r2, #32
	blt	.L144
	ldr	r2, [fp, #-36]
	sub	r3, r2, #48
	cmp	r3, #5
	bhi	.L144
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
	b	.L81
.L145:
	mov	r2, #27
	str	r2, [fp, #-56]
	b	.L81
.L144:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L66:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L148
	b	.L147
.L148:
	mov	r2, #27
	str	r2, [fp, #-56]
	b	.L81
.L147:
	mvn	r3, #0
	str	r3, [fp, #-56]
	b	.L81
.L67:
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #67
	beq	.L150
	ldr	r2, [fp, #-32]
	cmp	r2, #83
	beq	.L150
	b	.L149
.L150:
	ldr	r2, [fp, #12]
	ldrb	r3, [fp, #-20]
	strb	r3, [r2, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #28
	str	r3, [fp, #-56]
	b	.L81
.L149:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L81
.L68:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #32
	beq	.L152
	b	.L151
.L152:
	mov	r3, #30
	str	r3, [fp, #-56]
	b	.L81
.L151:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L81
.L69:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	addls	pc, pc, r3, asl #2
	b	.L153
	.p2align 2
.L157:
	b	.L154
	b	.L154
	b	.L154
	b	.L154
	b	.L154
	b	.L154
	b	.L154
	b	.L154
	b	.L155
	b	.L156
.L154:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #31
	str	r3, [fp, #-56]
	b	.L81
.L155:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r2, #32
	str	r2, [fp, #-56]
	b	.L81
.L156:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r2, r3, #48
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-24]
	mov	r3, #1
	str	r3, [r2, #0]
	mov	r3, #33
	str	r3, [fp, #-56]
	b	.L81
.L153:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L81
.L70:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	sub	r3, r3, #48
	cmp	r3, #9
	bhi	.L158
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
	b	.L81
.L158:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L81
.L71:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #48
	beq	.L161
	b	.L160
.L161:
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
	b	.L81
.L160:
	mvn	r2, #0
	str	r2, [fp, #-56]
	b	.L81
.L42:
	mvn	r3, #0
	str	r3, [fp, #-56]
.L81:
	ldr	r3, [fp, #-56]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	nextState, .-nextState
	.ident	"GCC: (GNU) 4.0.2"
