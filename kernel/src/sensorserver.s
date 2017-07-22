	.file	"sensorserver.c"
	.text
	.align	2
	.global	initSensorWorker
	.type	initSensorWorker, %function
initSensorWorker:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	@ lr needed for prologue
	mov	r3, r2
	mvn	r1, #0
.L2:
	add	r2, r2, #1
	cmp	r2, #18
	str	r3, [r0, #0]
	stmib	r0, {r1, r3}	@ phole stm
	str	r3, [r0, #12]
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	str	r3, [r0, #24]
	str	r3, [r0, #28]
	str	r3, [r0, #32]
	str	r3, [r0, #36]
	add	r0, r0, #40
	bne	.L2
	bx	lr
	.size	initSensorWorker, .-initSensorWorker
	.align	2
	.global	registerSensorWorker
	.type	registerSensorWorker, %function
registerSensorWorker:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, #0
	mov	lr, r3
	mov	r4, #1
.L9:
	ldr	r3, [r0, #0]
	add	ip, ip, #1
	cmp	r3, #0
	beq	.L17
	cmp	ip, #18
	add	r0, r0, #40
	bne	.L9
	sub	ip, ip, #18
	mov	r0, ip
	ldmfd	sp!, {r4, pc}
.L17:
	ldr	r3, [sp, #8]
	mov	ip, r4
	str	r3, [r0, #16]
	stmib	r0, {r1, r2, lr}	@ phole stm
	str	r4, [r0, #0]
	mov	r0, ip
	ldmfd	sp!, {r4, pc}
	.size	registerSensorWorker, .-registerSensorWorker
	.align	2
	.global	wakeupWaitingSensorWorker
	.type	wakeupWaitingSensorWorker, %function
wakeupWaitingSensorWorker:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
	mov	r7, #0
	sub	sp, sp, #20
	mov	r6, r1
	mov	r4, r0
	mov	r8, r7
	b	.L19
.L44:
	ldr	r2, [r4, #8]
	add	r0, r2, r6
	ldrb	r3, [r0, #319]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L42
	ldr	r1, [r4, #12]
	cmp	r1, #0
	ble	.L26
	add	r3, r1, r6
	ldrb	r2, [r3, #319]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L26
	mov	r3, #1
	str	r3, [r4, #28]
	add	r2, r6, r1, asl #2
	ldr	r3, [r2, #-4]
	str	r3, [r4, #32]
.L20:
	add	r7, r7, #1
	cmp	r7, #18
	add	r4, r4, #40
	beq	.L43
.L19:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	beq	.L20
	ldr	r5, [r4, #36]
	add	r9, r4, #36
	cmp	r5, #0
	beq	.L44
	ldr	r3, [r4, #8]
	add	fp, r4, #8
	add	r0, r3, r6
	ldrb	r5, [r0, #319]	@ zero_extendqisi2
	cmp	r5, #0
	bne	.L45
	ldr	r2, [r4, #12]
	add	r3, r4, #12
	cmp	r2, #0
	str	r3, [sp, #0]
	ble	.L33
	add	r0, r2, r6
	ldrb	r3, [r0, #319]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L42
.L33:
	ldr	r2, [r4, #16]
	cmp	r2, #0
	ble	.L20
	add	r0, r2, r6
	ldrb	r3, [r0, #319]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L20
	str	r2, [sp, #4]
	str	r8, [sp, #16]
	add	r3, r6, r2, asl #2
	ldr	r2, [r3, #-4]
	add	r1, sp, #4
	str	r2, [sp, #12]
	ldrb	r3, [r0, #319]	@ zero_extendqisi2
	mov	r2, #16
	strb	r3, [sp, #8]
	ldr	r0, [r4, #4]
	bl	Reply(PLT)
	ldr	r3, [sp, #0]
	add	r7, r7, #1
	str	r8, [r3, #0]
	cmp	r7, #18
	mvn	r3, #0
	str	r8, [r4, #0]
	str	r3, [r4, #4]
	str	r8, [r4, #16]
	str	r8, [r4, #20]
	str	r8, [r4, #24]
	str	r8, [r4, #28]
	str	r8, [r4, #32]
	str	r8, [fp, #0]
	str	r8, [r9, #0]
	add	r4, r4, #40
	bne	.L19
.L43:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, pc}
.L42:
	str	r2, [sp, #4]
	str	r5, [sp, #16]
	add	r3, r6, r2, asl #2
	ldr	r2, [r3, #-4]
	add	r1, sp, #4
	str	r2, [sp, #12]
	ldrb	r3, [r0, #319]	@ zero_extendqisi2
	mov	r2, #16
	strb	r3, [sp, #8]
	ldr	r0, [r4, #4]
	bl	Reply(PLT)
	mvn	r3, #0
	str	r5, [r4, #36]
	str	r5, [r4, #0]
	stmib	r4, {r3, r5}	@ phole stm
	str	r5, [r4, #12]
	str	r5, [r4, #16]
	str	r5, [r4, #20]
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r5, [r4, #32]
	b	.L20
.L26:
	ldr	r1, [r4, #16]
	cmp	r1, #0
	ble	.L20
	add	r3, r1, r6
	ldrb	r2, [r3, #319]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L20
	mov	r3, #1
	str	r3, [r4, #20]
	add	r2, r6, r1, asl #2
	ldr	r3, [r2, #-4]
	str	r3, [r4, #24]
	b	.L20
.L45:
	str	r3, [sp, #4]
	str	r8, [sp, #16]
	add	r3, r6, r3, asl #2
	ldr	r2, [r3, #-4]
	add	r1, sp, #4
	str	r2, [sp, #12]
	ldrb	r3, [r0, #319]	@ zero_extendqisi2
	mov	r2, #16
	strb	r3, [sp, #8]
	ldr	r0, [r4, #4]
	bl	Reply(PLT)
	mvn	r3, #0
	str	r8, [r4, #0]
	stmib	r4, {r3, r8}	@ phole stm
	str	r8, [r4, #12]
	str	r8, [r4, #16]
	str	r8, [r4, #20]
	str	r8, [r4, #24]
	str	r8, [r4, #28]
	str	r8, [r4, #32]
	str	r8, [r4, #36]
	b	.L20
	.size	wakeupWaitingSensorWorker, .-wakeupWaitingSensorWorker
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"displayServer\000"
	.text
	.align	2
	.global	bootSensorWorker
	.type	bootSensorWorker, %function
bootSensorWorker:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L62
	mov	r4, r0
	ldr	r0, .L62+4
.L59:
	add	sl, pc, sl
	sub	sp, sp, #16
	add	r0, sl, r0
	mov	r6, r2
	mov	r5, r1
	bl	WhoIs(PLT)
	mov	r2, #0
	mov	r7, r2
	mvn	r8, #0
.L47:
	ldr	r3, [r4, #0]
	add	r2, r2, #1
	cmp	r3, #0
	beq	.L48
	ldr	r0, [r4, #4]
	cmp	r0, r5
	beq	.L60
.L48:
	cmp	r2, #18
	add	r4, r4, #40
	bne	.L47
.L57:
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L60:
	cmp	r6, #0
	beq	.L51
	ldr	r5, [r4, #20]
	mov	lr, #1
	cmp	r5, #0
	str	lr, [r4, #36]
	bne	.L61
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L57
	ldr	r3, [r4, #12]
	ldr	ip, [r4, #32]
	mov	r1, sp
	mov	r2, #16
	str	r3, [sp, #0]
	str	ip, [sp, #8]
	strb	lr, [sp, #4]
	str	r5, [sp, #12]
	bl	Reply(PLT)
	str	r5, [r4, #36]
	stmia	r4, {r5, r8}	@ phole stm
	str	r5, [r4, #8]
	str	r5, [r4, #12]
	str	r5, [r4, #16]
	str	r5, [r4, #20]
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r5, [r4, #32]
	b	.L57
.L61:
	ldr	r3, [r4, #16]
	ldr	ip, [r4, #24]
	mov	r1, sp
	mov	r2, #16
	str	r3, [sp, #0]
	str	ip, [sp, #8]
	strb	lr, [sp, #4]
	str	r7, [sp, #12]
	bl	Reply(PLT)
	str	r7, [r4, #36]
	stmia	r4, {r7, r8}	@ phole stm
	str	r7, [r4, #8]
	str	r7, [r4, #12]
	str	r7, [r4, #16]
	str	r7, [r4, #20]
	str	r7, [r4, #24]
	str	r7, [r4, #28]
	str	r7, [r4, #32]
	b	.L57
.L51:
	mov	r3, #2
	mov	r1, sp
	mov	r2, #16
	str	r3, [sp, #12]
	str	r6, [sp, #0]
	str	r6, [sp, #8]
	strb	r6, [sp, #4]
	bl	Reply(PLT)
	str	r6, [r4, #36]
	stmia	r4, {r6, r8}	@ phole stm
	str	r6, [r4, #8]
	str	r6, [r4, #12]
	str	r6, [r4, #16]
	str	r6, [r4, #20]
	str	r6, [r4, #24]
	str	r6, [r4, #28]
	str	r6, [r4, #32]
	b	.L57
.L63:
	.align	2
.L62:
	.word	_GLOBAL_OFFSET_TABLE_-(.L59+8)
	.word	.LC0(GOTOFF)
	.size	bootSensorWorker, .-bootSensorWorker
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"sensorServer\000"
	.align	2
.LC2:
	.ascii	"Failed to register sensorServer.\015\012\000"
	.align	2
.LC3:
	.ascii	"<sensorServer>: sensor to display courier has not b"
	.ascii	"een set up.\015\012\000"
	.align	2
.LC4:
	.ascii	"<sensorServer>: sensor processor has not been set u"
	.ascii	"p.\015\012\000"
	.align	2
.LC5:
	.ascii	"<sensorServer>: sensor register worker. we ran out "
	.ascii	"of space to save workers...call Paily.\015\012\000"
	.align	2
.LC6:
	.ascii	"1\000"
	.align	2
.LC7:
	.ascii	"0\000"
	.text
	.align	2
	.global	sensorServer
	.type	sensorServer, %function
sensorServer:
	@ args = 0, pretend = 0, frame = 2260
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L99
	ldr	r0, .L99+4
.L97:
	add	sl, pc, sl
	sub	sp, sp, #2256
	sub	sp, sp, #8
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r0, .L99+8
	add	r7, sp, #1744
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L99+12
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L99+16
	mov	r0, #10
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L99+20
	str	r0, [sp, #24]
	mvn	r0, r0
	add	r2, sl, r2
	mov	r1, #1
	mov	r0, r0, lsr #31
	bl	bwassert(PLT)
	add	r7, r7, #12
	mvn	r3, #0
	mov	r2, #0
	str	r3, [sp, #2260]
	mov	r1, r2
	mov	r3, r7
.L65:
	str	r1, [r2, r7]
	add	r2, r2, #4
	cmp	r2, #320
	strb	r1, [r3, #320]
	add	r3, r3, #1
	bne	.L65
	mov	ip, r1
	mov	r3, r7
	add	r2, r7, #81
.L67:
	strb	ip, [r3, #404]
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L67
	ldr	r3, .L99+24
	mov	r4, #1
	ldr	r1, [sl, r3]
	mov	r0, #5
	strb	ip, [sp, #2160]
	str	r4, [sp, #2156]
	bl	Create(PLT)
	ldr	r2, .L99+28
	mvn	r0, r0
	add	r5, sp, #40
	mov	r1, r4
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	sub	r5, r5, #8
	bl	bwassert(PLT)
	mov	r0, r5
	bl	initSensorWorker(PLT)
	ldr	r2, .L99+32
	add	r3, sp, #2240
	str	r2, [sp, #8]
	add	r2, sp, #2160
	add	r3, r3, #4
	str	r2, [sp, #20]
	add	r2, sp, #1264
	mov	r8, #0
	add	r4, sp, #760
	add	r6, sp, #2256
	str	r3, [sp, #4]
	add	r2, r2, #4
	add	r3, sp, #1264
	ldr	r9, .L99+36
	ldr	fp, .L99+40
	sub	r4, r4, #8
	str	r8, [sp, #28]
	add	r6, r6, #4
	str	r3, [sp, #16]
	str	r2, [sp, #12]
.L98:
	mov	r0, r6
	mov	r1, r4
	mov	r2, #512
	bl	Receive(PLT)
	ldrb	r3, [sp, #752]	@ zero_extendqisi2
	sub	r3, r3, #1
	cmp	r3, #5
	addls	pc, pc, r3, asl #2
	b	.L71
	.p2align 2
.L77:
	b	.L72
	b	.L71
	b	.L73
	b	.L74
	b	.L75
	b	.L76
.L73:
	mov	r2, #2
	add	r1, sl, r9
	ldr	r0, [sp, #2260]
	bl	Reply(PLT)
	ldr	r0, [sp, #16]
	mov	r1, r4
	mov	r2, #492
	bl	pkmemcpy(PLT)
	mov	r0, r7
	ldr	r1, [sp, #12]
	mov	r2, #488
	bl	pkmemcpy(PLT)
	mov	r0, r5
	mov	r1, r7
	bl	wakeupWaitingSensorWorker(PLT)
	cmp	r8, #0
	bne	.L82
	ldr	r3, [sp, #2156]
	cmp	r3, #1
	movgt	r3, #1
	strgt	r3, [sp, #28]
.L71:
	ldr	r0, [sp, #2260]
	add	r1, sl, fp
	mov	r2, #2
	bl	Reply(PLT)
	b	.L98
.L74:
	ldr	r3, [sp, #28]
	cmp	r3, #0
	moveq	r8, #1
	beq	.L98
	ldr	r2, [sp, #2156]
	ldr	r0, [sp, #24]
	ldr	r1, [sp, #20]
	bl	Reply(PLT)
	mov	r2, #0
	str	r2, [sp, #28]
	b	.L98
.L76:
	add	r1, sl, r9
	ldr	r0, [sp, #2260]
	mov	r2, #2
	bl	Reply(PLT)
	mov	r0, r5
	ldrb	r1, [sp, #753]	@ zero_extendqisi2
	ldrb	r2, [sp, #754]	@ zero_extendqisi2
	bl	bootSensorWorker(PLT)
	b	.L98
.L75:
	ldrb	ip, [sp, #755]	@ zero_extendqisi2
	ldrb	r2, [sp, #753]	@ zero_extendqisi2
	ldrb	r3, [sp, #754]	@ zero_extendqisi2
	ldr	r1, [sp, #2260]
	mov	r0, r5
	str	ip, [sp, #0]
	bl	registerSensorWorker(PLT)
	ldr	r3, [sp, #8]
	mov	r1, #1
	add	r2, sl, r3
	bl	bwassert(PLT)
	mov	r0, r5
	mov	r1, r7
	bl	wakeupWaitingSensorWorker(PLT)
	b	.L98
.L72:
	ldrb	ip, [sp, #753]	@ zero_extendqisi2
	sub	r3, ip, #1
	cmp	r3, #79
	mvnhi	r3, #0
	strhi	r3, [sp, #2244]
	bhi	.L80
	add	r2, sp, #2256
	add	r2, r2, #8
	add	r0, r2, ip
	add	r3, r2, ip, asl #2
	ldr	r2, [r3, #-512]
	ldrb	r1, [r0, #-189]	@ zero_extendqisi2
	str	r2, [sp, #2252]
	strb	r1, [sp, #2248]
	str	ip, [sp, #2244]
.L80:
	ldr	r0, [sp, #2260]
	ldr	r1, [sp, #4]
	mov	r2, #16
	bl	Reply(PLT)
	b	.L98
.L82:
	ldr	r2, [sp, #2156]
	cmp	r2, #1
	ble	.L71
	ldr	r1, [sp, #20]
	ldr	r0, [sp, #24]
	bl	Reply(PLT)
	ldr	r0, [sp, #2260]
	add	r1, sl, fp
	mov	r2, #2
	mov	r8, #0
	bl	Reply(PLT)
	b	.L98
.L100:
	.align	2
.L99:
	.word	_GLOBAL_OFFSET_TABLE_-(.L97+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	sensorDisplayCourier(GOT)
	.word	.LC3(GOTOFF)
	.word	sensorProcessor(GOT)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.size	sensorServer, .-sensorServer
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"<sensorCourier>: Getting sensor libray from sensor "
	.ascii	"processor failed.\000"
	.align	2
.LC9:
	.ascii	"<sensorCourier>: SSending sensor library to sensor "
	.ascii	"server failed.\000"
	.text
	.align	2
	.global	sensorCourier
	.type	sensorCourier, %function
sensorCourier:
	@ args = 0, pretend = 0, frame = 504
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L105
	sub	sp, sp, #508
.L104:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r7, r0
	ldr	r0, .L105+4
	ldr	r3, .L105+8
	add	r0, sl, r0
	str	r3, [sp, #4]
	bl	WhoIs(PLT)
	add	r9, sp, #504
	mov	r3, #3
	mov	r2, #0
	add	r8, sp, #500
	ldr	fp, .L105+12
	mov	r6, r0
	strb	r3, [sp, #506]
	strb	r2, [sp, #507]
	add	r5, sp, #8
	add	r9, r9, #2
	add	r8, r8, #3
	mov	r4, #492
.L102:
	mov	r3, r5
	mov	r1, r9
	mov	r0, r7
	mov	r2, #2
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #4]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r1, r5
	mov	r2, r4
	mov	ip, #3
	mov	r0, r6
	mov	r3, r8
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, fp
	bl	bwassert(PLT)
	b	.L102
.L106:
	.align	2
.L105:
	.word	_GLOBAL_OFFSET_TABLE_-(.L104+8)
	.word	.LC1(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.size	sensorCourier, .-sensorCourier
	.section	.rodata.str1.4
	.align	2
.LC10:
	.ascii	"trackServer\000"
	.align	2
.LC11:
	.ascii	"<sensorDisplayCourier>: Getting recenent sensor lis"
	.ascii	"t from sensor processor failed.\000"
	.align	2
.LC12:
	.ascii	"<sensorDisplayCourier>: Sending sensor recent senso"
	.ascii	"r list to display sensor server failed. %d %d\000"
	.text
	.align	2
	.global	sensorDisplayCourier
	.type	sensorDisplayCourier, %function
sensorDisplayCourier:
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L111
	sub	sp, sp, #100
.L110:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r8, r0
	ldr	r0, .L111+4
	ldr	r3, .L111+8
	add	r0, sl, r0
	str	r3, [sp, #8]
	bl	WhoIs(PLT)
	ldr	ip, .L111+12
	mov	r3, #4
	mov	r2, #0
	mov	r6, r0
	str	ip, [sp, #4]
	strb	r3, [sp, #98]
	strb	r2, [sp, #99]
	add	fp, sp, #98
	add	r7, sp, #14
	add	r9, sp, #95
.L108:
	mov	ip, #81
	mov	r3, r7
	mov	r1, fp
	mov	r0, r8
	mov	r2, #2
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #8]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldrb	r5, [sp, #14]	@ zero_extendqisi2
	mov	r1, r7
	mov	r2, r5
	mov	r3, r9
	mov	ip, #35
	mov	r0, r6
	mov	r4, #3
	strb	ip, [sp, #14]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #4]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r3, r5
	mov	r1, #1
	add	r2, sl, ip
	str	r6, [sp, #0]
	bl	bwassert(PLT)
	b	.L108
.L112:
	.align	2
.L111:
	.word	_GLOBAL_OFFSET_TABLE_-(.L110+8)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.size	sensorDisplayCourier, .-sensorDisplayCourier
	.section	.rodata.str1.4
	.align	2
.LC13:
	.ascii	"UART1R\000"
	.align	2
.LC14:
	.ascii	"<getSensorData>: UART1ReceiveServer has not been se"
	.ascii	"t up.\015\012\000"
	.align	2
.LC15:
	.ascii	"commandServer\000"
	.align	2
.LC16:
	.ascii	"<sensorNotifier>: commandServer has not been set up"
	.ascii	".\015\012\000"
	.align	2
.LC17:
	.ascii	"<sensorNotifier>: Polling sensors failed.\000"
	.align	2
.LC18:
	.ascii	"<sensorNotifier>: Sending raw sensor batch data fai"
	.ascii	"led.\000"
	.text
	.align	2
	.global	sensorNotifier
	.type	sensorNotifier, %function
sensorNotifier:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L121
	sub	sp, sp, #32
.L120:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	fp, r0
	ldr	r0, .L121+4
	ldr	r3, .L121+8
	add	r0, sl, r0
	str	r3, [sp, #12]
	bl	WhoIs(PLT)
	ldr	r2, .L121+12
	mov	r5, r0
	mvn	r0, r0
	add	r2, sl, r2
	mov	r1, #1
	mov	r0, r0, lsr #31
	bl	bwassert(PLT)
	ldr	r0, .L121+16
	ldr	r3, .L121+20
	add	r0, sl, r0
	str	r3, [sp, #8]
	bl	WhoIs(PLT)
	ldr	r2, .L121+24
	mov	r9, r0
	mvn	r0, r0
	mov	r1, #1
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	bl	bwassert(PLT)
	mov	r3, #15
	strb	r3, [sp, #30]
	add	r3, sp, #30
	str	r3, [sp, #4]
	add	r8, sp, #27
	add	r6, sp, #16
	mov	r7, #3
	mov	r1, r3
.L114:
	mov	r2, #1
	mov	r3, r8
	mov	r0, r9
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #12]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r3, #1
	strb	r3, [sp, #16]
	mov	r4, #0
.L115:
	mov	r0, r5
	mov	r1, #0
	bl	Getc(PLT)
	add	r4, r4, #1
	cmp	r4, #10
	strb	r0, [r6, r4]
	bne	.L115
	mov	r1, r6
	mov	r2, #11
	mov	r3, r8
	mov	r0, fp
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #8]
	mvn	r0, r0
	mov	r1, #1
	mov	r0, r0, lsr #31
	add	r2, sl, r3
	bl	bwassert(PLT)
	ldr	r1, [sp, #4]
	b	.L114
.L122:
	.align	2
.L121:
	.word	_GLOBAL_OFFSET_TABLE_-(.L120+8)
	.word	.LC13(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC16(GOTOFF)
	.size	sensorNotifier, .-sensorNotifier
	.section	.rodata.str1.4
	.align	2
.LC19:
	.ascii	"sensorProcessor\000"
	.align	2
.LC20:
	.ascii	"Failed to register sensorProcessor.\015\012\000"
	.align	2
.LC21:
	.ascii	"<sensorServer>: sensor courier has not been set up."
	.ascii	"\015\012\000"
	.align	2
.LC22:
	.ascii	"<sensorServer>: sensor notifier has not been set up"
	.ascii	".\015\012\000"
	.align	2
.LC23:
	.ascii	"clockServer\000"
	.text
	.align	2
	.global	sensorProcessor
	.type	sensorProcessor, %function
sensorProcessor:
	@ args = 0, pretend = 0, frame = 1040
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #1040
	add	r0, sp, #536
	ldr	sl, .L256
	str	r0, [sp, #16]
	ldr	r0, .L256+4
.L249:
	add	sl, pc, sl
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L256+8
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L256+12
	mov	r0, #10
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L256+16
	str	r0, [sp, #28]
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L256+20
	mov	r0, #10
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L256+24
	mvn	r0, r0
	add	r2, sl, r2
	mov	r1, #1
	mov	r0, r0, lsr #31
	bl	bwassert(PLT)
	ldr	r0, .L256+28
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mvn	r3, #0
	mov	r2, #0
	ldr	r1, [sp, #16]
	str	r3, [sp, #1036]
	str	r0, [sp, #36]
	mov	r3, r2
.L124:
	ldr	r5, [sp, #16]
	strb	r3, [r1, #320]
	str	r3, [r2, r5]
	add	r2, r2, #4
	cmp	r2, #320
	add	r1, r1, #1
	bne	.L124
	mov	r2, r3
	ldr	r3, [sp, #16]
	add	r7, r5, #81
.L126:
	strb	r2, [r3, #404]
	add	r3, r3, #1
	cmp	r7, r3
	bne	.L126
	ldr	ip, .L256+32
	ldr	r0, .L256+36
	add	r3, sp, #1024
	add	r3, r3, #12
	add	r5, sp, #1024
	mov	r1, #0
	add	r5, r5, #1
	stmia	sp, {r0, ip}	@ phole stm
	str	r3, [sp, #8]
	add	ip, sp, #44
	add	r0, sp, #48
	strb	r2, [sp, #940]
	mov	r3, #1
	mov	r2, #3
	str	r1, [sp, #32]
	str	r5, [sp, #12]
	add	r9, sp, #616
	str	ip, [sp, #24]
	str	r0, [sp, #20]
	str	r3, [sp, #936]
	strb	r2, [sp, #44]
	mov	r1, r5
.L250:
	mov	r2, #11
	ldr	r0, [sp, #8]
	bl	Receive(PLT)
	ldrb	r2, [sp, #1025]	@ zero_extendqisi2
	cmp	r2, #2
	beq	.L132
.L252:
	cmp	r2, #3
	beq	.L129
	cmp	r2, #1
	beq	.L251
	ldr	r2, [sp, #0]
	ldr	r0, [sp, #1036]
	add	r1, sl, r2
	mov	r2, #2
	bl	Reply(PLT)
	mov	r2, #11
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #8]
	bl	Receive(PLT)
	ldrb	r2, [sp, #1025]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L252
.L132:
	ldr	r3, [sp, #4]
	ldr	r0, [sp, #1036]
	add	r1, sl, r3
	bl	Reply(PLT)
	ldr	r0, [sp, #36]
	bl	Time(PLT)
	ldrb	ip, [sp, #1026]	@ zero_extendqisi2
	add	r5, sp, #1040
	sub	r2, ip, #1
	add	lr, r5, r2
	ldrb	r3, [lr, #-184]	@ zero_extendqisi2
	mov	r4, r0
	cmp	r3, #0
	bne	.L133
	ldr	r3, [sp, #936]
	add	r1, r5, r2, asl #2
	add	r0, r3, #1
	add	r2, r5, r3
	str	r4, [r1, #-504]
	strb	ip, [r2, #-100]
	str	r0, [sp, #936]
.L133:
	ldr	r3, [sp, #16]
	mov	r2, #0
.L135:
	strb	r2, [r3, #320]
	add	r3, r3, #1
	cmp	r3, r9
	bne	.L135
	ldr	ip, [sp, #32]
	mov	r3, #1
	cmp	ip, #0
	strb	r3, [lr, #-184]
	beq	.L248
	ldr	r3, [sp, #936]
	cmp	r3, #1
	ble	.L248
	mov	r2, #488
	ldr	r0, [sp, #20]
	ldr	r1, [sp, #16]
	strb	r3, [sp, #940]
	bl	pkmemcpy(PLT)
	mov	r2, #492
	ldr	r0, [sp, #28]
	ldr	r1, [sp, #24]
	bl	Reply(PLT)
	ldr	r3, [sp, #16]
	mov	r2, #0
.L139:
	strb	r2, [r3, #404]
	add	r3, r3, #1
	cmp	r7, r3
	bne	.L139
	ldr	r1, [sp, #12]
	mov	r0, #0
	mov	r3, #1
	str	r0, [sp, #32]
	strb	r2, [sp, #940]
	str	r3, [sp, #936]
	b	.L250
.L251:
	ldr	r2, [sp, #4]
	ldr	r0, [sp, #1036]
	add	r1, sl, r2
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r0, [sp, #36]
	bl	Time(PLT)
	ldr	r3, [sp, #16]
	ldr	r4, [sp, #936]
	ldr	fp, [sp, #12]
	mov	r8, r0
	mov	r5, #0
	str	r3, [sp, #40]
.L141:
	ldrb	r1, [fp, #1]	@ zero_extendqisi2
	tst	r1, #128
	bne	.L253
.L212:
	add	ip, r5, #1
.L144:
	ands	r6, r1, #64
	add	r3, sp, #1040
	add	r2, r3, r5
	addeq	r0, sp, #1040
	mov	r3, r1, lsr #7
	addeq	lr, r0, ip
	strb	r3, [r2, #-184]
	addeq	ip, r5, #2
	beq	.L148
	add	r2, sp, #1040
	add	lr, r2, ip
	ldrb	r3, [lr, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r2, r2, ip, asl #2
	addeq	ip, sp, #1040
	addeq	r3, ip, r4
	addeq	ip, r5, #2
	addeq	r4, r4, #1
	streqb	ip, [r3, #-100]
	streq	r8, [r2, #-504]
	addne	ip, r5, #2
.L148:
	subs	r3, r6, #0
	movne	r3, #1
	ands	r6, r1, #32
	addeq	r0, sp, #1040
	strb	r3, [lr, #-184]
	addeq	lr, r0, ip
	addeq	ip, r5, #3
	beq	.L152
	add	r2, sp, #1040
	add	lr, r2, ip
	ldrb	r3, [lr, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r2, r2, ip, asl #2
	addeq	ip, sp, #1040
	addeq	r3, ip, r4
	addeq	ip, r5, #3
	addeq	r4, r4, #1
	streqb	ip, [r3, #-100]
	streq	r8, [r2, #-504]
	addne	ip, r5, #3
.L152:
	subs	r3, r6, #0
	movne	r3, #1
	ands	r6, r1, #16
	addeq	r0, sp, #1040
	strb	r3, [lr, #-184]
	addeq	lr, r0, ip
	addeq	ip, r5, #4
	beq	.L156
	add	r2, sp, #1040
	add	lr, r2, ip
	ldrb	r3, [lr, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r2, r2, ip, asl #2
	addeq	ip, sp, #1040
	addeq	r3, ip, r4
	addeq	ip, r5, #4
	addeq	r4, r4, #1
	streqb	ip, [r3, #-100]
	streq	r8, [r2, #-504]
	addne	ip, r5, #4
.L156:
	subs	r3, r6, #0
	movne	r3, #1
	ands	r6, r1, #8
	addeq	r0, sp, #1040
	strb	r3, [lr, #-184]
	addeq	lr, r0, ip
	addeq	ip, r5, #5
	beq	.L160
	add	r2, sp, #1040
	add	lr, r2, ip
	ldrb	r3, [lr, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r2, r2, ip, asl #2
	addeq	ip, sp, #1040
	addeq	r3, ip, r4
	addeq	ip, r5, #5
	addeq	r4, r4, #1
	streqb	ip, [r3, #-100]
	streq	r8, [r2, #-504]
	addne	ip, r5, #5
.L160:
	subs	r3, r6, #0
	movne	r3, #1
	ands	r6, r1, #4
	addeq	r0, sp, #1040
	strb	r3, [lr, #-184]
	addeq	lr, r0, ip
	addeq	ip, r5, #6
	beq	.L164
	add	r2, sp, #1040
	add	lr, r2, ip
	ldrb	r3, [lr, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r2, r2, ip, asl #2
	addeq	ip, sp, #1040
	addeq	r3, ip, r4
	addeq	ip, r5, #6
	addeq	r4, r4, #1
	streqb	ip, [r3, #-100]
	streq	r8, [r2, #-504]
	addne	ip, r5, #6
.L164:
	subs	r3, r6, #0
	movne	r3, #1
	ands	r6, r1, #2
	addeq	r2, sp, #1040
	strb	r3, [lr, #-184]
	addeq	r0, r2, ip
	addeq	lr, r5, #7
	beq	.L168
	add	r3, sp, #1040
	add	r0, r3, ip
	ldrb	r3, [r0, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r3, sp, #1040
	addeq	r2, r3, ip, asl #2
	addeq	lr, r5, #7
	addeq	r3, r3, r4
	streqb	lr, [r3, #-100]
	addeq	r4, r4, #1
	streq	r8, [r2, #-504]
	addne	lr, r5, #7
.L168:
	subs	r3, r6, #0
	movne	r3, #1
	ands	r6, r1, #1
	strb	r3, [r0, #-184]
	addeq	r0, sp, #1040
	addeq	ip, r0, lr
	addeq	lr, r5, #8
	beq	.L172
	add	r1, sp, #1040
	add	ip, r1, lr
	ldrb	r3, [ip, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r2, r1, lr, asl #2
	addeq	r3, r1, r4
	addeq	lr, r5, #8
	addeq	r4, r4, #1
	streqb	lr, [r3, #-100]
	streq	r8, [r2, #-504]
	addne	lr, r5, #8
.L172:
	ldrb	r1, [fp, #2]	@ zero_extendqisi2
	strb	r6, [ip, #-184]
	tst	r1, #128
	addeq	r2, sp, #1040
	addeq	r0, r2, lr
	addeq	ip, r5, #9
	bne	.L254
.L176:
	ands	r6, r1, #64
	mov	r3, r1, lsr #7
	strb	r3, [r0, #-184]
	addeq	r0, sp, #1040
	addeq	lr, r0, ip
	addeq	ip, r5, #10
	beq	.L180
	add	r2, sp, #1040
	add	lr, r2, ip
	ldrb	r3, [lr, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r2, r2, ip, asl #2
	addeq	ip, sp, #1040
	addeq	r3, ip, r4
	addeq	ip, r5, #10
	addeq	r4, r4, #1
	streqb	ip, [r3, #-100]
	streq	r8, [r2, #-504]
	addne	ip, r5, #10
.L180:
	subs	r3, r6, #0
	movne	r3, #1
	ands	r6, r1, #32
	addeq	r0, sp, #1040
	strb	r3, [lr, #-184]
	addeq	lr, r0, ip
	addeq	ip, r5, #11
	beq	.L184
	add	r2, sp, #1040
	add	lr, r2, ip
	ldrb	r3, [lr, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r2, r2, ip, asl #2
	addeq	ip, sp, #1040
	addeq	r3, ip, r4
	addeq	ip, r5, #11
	addeq	r4, r4, #1
	streqb	ip, [r3, #-100]
	streq	r8, [r2, #-504]
	addne	ip, r5, #11
.L184:
	subs	r3, r6, #0
	movne	r3, #1
	ands	r6, r1, #16
	addeq	r0, sp, #1040
	strb	r3, [lr, #-184]
	addeq	lr, r0, ip
	addeq	ip, r5, #12
	beq	.L188
	add	r2, sp, #1040
	add	lr, r2, ip
	ldrb	r3, [lr, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r2, r2, ip, asl #2
	addeq	ip, sp, #1040
	addeq	r3, ip, r4
	addeq	ip, r5, #12
	addeq	r4, r4, #1
	streqb	ip, [r3, #-100]
	streq	r8, [r2, #-504]
	addne	ip, r5, #12
.L188:
	subs	r3, r6, #0
	movne	r3, #1
	ands	r6, r1, #8
	addeq	r0, sp, #1040
	strb	r3, [lr, #-184]
	addeq	lr, r0, ip
	addeq	ip, r5, #13
	beq	.L192
	add	r2, sp, #1040
	add	lr, r2, ip
	ldrb	r3, [lr, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r2, r2, ip, asl #2
	addeq	ip, sp, #1040
	addeq	r3, ip, r4
	addeq	ip, r5, #13
	addeq	r4, r4, #1
	streqb	ip, [r3, #-100]
	streq	r8, [r2, #-504]
	addne	ip, r5, #13
.L192:
	subs	r3, r6, #0
	movne	r3, #1
	ands	r6, r1, #4
	addeq	r0, sp, #1040
	strb	r3, [lr, #-184]
	addeq	lr, r0, ip
	addeq	ip, r5, #14
	beq	.L196
	add	r2, sp, #1040
	add	lr, r2, ip
	ldrb	r3, [lr, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r2, r2, ip, asl #2
	addeq	ip, sp, #1040
	addeq	r3, ip, r4
	addeq	ip, r5, #14
	addeq	r4, r4, #1
	streqb	ip, [r3, #-100]
	streq	r8, [r2, #-504]
	addne	ip, r5, #14
.L196:
	subs	r3, r6, #0
	movne	r3, #1
	ands	r6, r1, #2
	addeq	r0, sp, #1040
	strb	r3, [lr, #-184]
	addeq	lr, r0, ip
	addeq	r0, r5, #15
	beq	.L200
	add	r2, sp, #1040
	add	lr, r2, ip
	ldrb	r3, [lr, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r2, r2, ip, asl #2
	addeq	ip, sp, #1040
	addeq	r3, ip, r4
	addeq	r0, r5, #15
	addeq	r4, r4, #1
	streqb	r0, [r3, #-100]
	streq	r8, [r2, #-504]
	addne	r0, r5, #15
.L200:
	subs	r3, r6, #0
	movne	r3, #1
	ands	r6, r1, #1
	addeq	r1, sp, #1040
	addeq	ip, r1, r0
	strb	r3, [lr, #-184]
	addeq	r1, r5, #16
	beq	.L204
	add	r2, sp, #1040
	add	ip, r2, r0
	ldrb	r3, [ip, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	r1, r5, #16
	addeq	r5, sp, #1040
	addeq	r3, r5, r4
	addeq	r2, r2, r0, asl #2
	addeq	r4, r4, #1
	streqb	r1, [r3, #-100]
	streq	r8, [r2, #-504]
	addne	r1, r5, #16
.L204:
	strb	r6, [ip, #-184]
	ldr	ip, [sp, #40]
	cmp	r1, #80
	add	ip, ip, #16
	mov	r5, r1
	add	fp, fp, #2
	str	ip, [sp, #40]
	bne	.L141
	ldr	r0, [sp, #32]
	str	r4, [sp, #936]
	cmp	r0, #0
	bne	.L255
.L248:
	ldr	r1, [sp, #12]
	b	.L250
.L129:
	mov	r1, #1
	str	r1, [sp, #32]
	ldr	r1, [sp, #12]
	b	.L250
.L253:
	ldr	ip, [sp, #40]
	ldrb	r3, [ip, #320]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L212
	add	r0, sp, #1040
	add	r3, r0, r4
	add	ip, r5, #1
	strb	ip, [r3, #-100]
	ldr	r2, [sp, #16]
	add	r4, r4, #1
	str	r8, [r2, r5, asl #2]
	b	.L144
.L255:
	mov	r2, #488
	ldr	r0, [sp, #20]
	ldr	r1, [sp, #16]
	strb	r4, [sp, #940]
	bl	pkmemcpy(PLT)
	mov	r2, #492
	ldr	r0, [sp, #28]
	ldr	r1, [sp, #24]
	bl	Reply(PLT)
	ldr	r3, [sp, #16]
	mov	r2, #0
.L208:
	strb	r2, [r3, #404]
	add	r3, r3, #1
	cmp	r7, r3
	bne	.L208
	mov	r1, #0
	str	r1, [sp, #32]
	ldr	r1, [sp, #12]
	mov	r3, #1
	strb	r2, [sp, #940]
	str	r3, [sp, #936]
	b	.L250
.L254:
	add	r3, sp, #1040
	add	r0, r3, lr
	ldrb	r3, [r0, #-184]	@ zero_extendqisi2
	cmp	r3, #0
	addeq	ip, sp, #1040
	addeq	r3, ip, r4
	addeq	r2, ip, lr, asl #2
	addeq	r4, r4, #1
	addeq	ip, r5, #9
	addne	ip, r5, #9
	streqb	ip, [r3, #-100]
	streq	r8, [r2, #-504]
	b	.L176
.L257:
	.align	2
.L256:
	.word	_GLOBAL_OFFSET_TABLE_-(.L249+8)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	sensorCourier(GOT)
	.word	.LC21(GOTOFF)
	.word	sensorNotifier(GOT)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.size	sensorProcessor, .-sensorProcessor
	.ident	"GCC: (GNU) 4.0.2"
