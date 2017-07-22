	.file	"trainserver.c"
	.text
	.align	2
	.global	trainPrintLocation
	.type	trainPrintLocation, %function
trainPrintLocation:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #58
	@ lr needed for prologue
	mov	r3, #6
	beq	.L4
	cmp	r0, #69
	mov	r3, #13
	beq	.L4
	cmp	r0, #70
	mov	r3, #20
	beq	.L4
	cmp	r0, #76
	movne	r3, #34
	moveq	r3, #27
.L4:
	mov	r0, r3
	bx	lr
	.size	trainPrintLocation, .-trainPrintLocation
	.align	2
	.global	printTrainDiagnostics
	.type	printTrainDiagnostics, %function
printTrainDiagnostics:
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	bx	lr
	.size	printTrainDiagnostics, .-printTrainDiagnostics
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<initTrains>: Error sending message to CommandServe"
	.ascii	"r.\015\012\000"
	.align	2
.LC1:
	.ascii	"<initTrains>: Displaying switches failed.\000"
	.text
	.align	2
	.global	initTrains
	.type	initTrains, %function
initTrains:
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L23
	sub	sp, sp, #92
	str	r3, [sp, #12]
	ldr	r3, .L23+4
.L22:
	add	sl, pc, sl
	ldr	ip, .L23+8
	str	r0, [sp, #20]
	add	r3, sl, r3
	mov	r9, r2
	mov	r5, #58
	add	r7, sp, #25
	add	r8, sp, #89
	mov	r6, #0
	mov	fp, #3
	mov	r0, r1
	str	ip, [sp, #4]
	str	r1, [sp, #16]
	str	r3, [sp, #8]
	b	.L16
.L21:
	ldr	r0, [sp, #16]
.L16:
	mov	ip, #13
	and	r4, r5, #255
	mov	r3, r8
	mov	r1, r7
	mov	r2, #4
	strb	ip, [sp, #25]
	strb	r6, [sp, #26]
	strb	r4, [sp, #27]
	strb	r6, [sp, #28]
	str	fp, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #4]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	ip, #30
	mov	r3, r8
	mov	r1, r7
	mov	r2, #4
	mov	r0, r9
	strb	ip, [sp, #25]
	strb	r4, [sp, #27]
	strb	r6, [sp, #26]
	strb	r6, [sp, #28]
	str	fp, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	ldr	r2, [sp, #8]
	bl	bwassert(PLT)
	add	r5, r5, #1
	ldr	r0, [sp, #20]
	mov	r1, #5
	bl	Delay(PLT)
	cmp	r5, #80
	bne	.L21
	ldr	r0, [sp, #20]
	mov	r1, #436
	bl	Delay(PLT)
	mov	r4, #1
	mov	ip, #30
	mov	r3, r8
	mov	r1, r7
	mov	r2, #4
	mov	r0, r9
	strb	ip, [sp, #25]
	strb	r4, [sp, #26]
	strb	r6, [sp, #27]
	strb	r6, [sp, #28]
	str	fp, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r1, r4
	ldr	r2, [sp, #8]
	mov	r0, r0, lsr #31
	bl	bwassert(PLT)
	mov	r3, r8
	mov	r1, r7
	ldr	r0, [sp, #12]
	mov	r2, #2
	strb	r4, [sp, #25]
	strb	r6, [sp, #26]
	str	fp, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r1, r4
	ldr	r2, [sp, #8]
	mov	r0, r0, lsr #31
	bl	bwassert(PLT)
	mov	ip, #30
	mov	r1, r7
	strb	ip, [sp, #25]
	mov	r0, r9
	mov	ip, #2
	mov	r3, r8
	mov	r2, #4
	strb	ip, [sp, #26]
	strb	r6, [sp, #28]
	str	fp, [sp, #0]
	strb	r6, [sp, #27]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, r4
	ldr	r2, [sp, #8]
	bl	bwassert(PLT)
	add	sp, sp, #92
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L24:
	.align	2
.L23:
	.word	_GLOBAL_OFFSET_TABLE_-(.L22+8)
	.word	.LC1(GOTOFF)
	.word	.LC0(GOTOFF)
	.size	initTrains, .-initTrains
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"trainServer\000"
	.align	2
.LC3:
	.ascii	"Failed to register trainServer.\015\012\000"
	.align	2
.LC4:
	.ascii	"commandServer\000"
	.align	2
.LC5:
	.ascii	"clockServer\000"
	.align	2
.LC6:
	.ascii	"displayServer\000"
	.align	2
.LC7:
	.ascii	"trackServer\000"
	.align	2
.LC8:
	.ascii	"<trainServer>: Error sending message to CommandServ"
	.ascii	"er.\015\012\000"
	.align	2
.LC9:
	.ascii	"0\000"
	.align	2
.LC10:
	.ascii	"<trainServer>: Error %d sending TR 76 message to Co"
	.ascii	"mmandServer.\015\012\000"
	.align	2
.LC11:
	.ascii	"1\000"
	.align	2
.LC12:
	.ascii	"<trainServer> INVALIDE CASE [%d] seriosly, why are "
	.ascii	"you even here?\000"
	.text
	.align	2
	.global	trainServer
	.type	trainServer, %function
trainServer:
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L73
	ldr	r0, .L73+4
.L65:
	add	sl, pc, sl
	sub	sp, sp, #100
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L73+8
	mov	r1, #1
	add	r2, sl, r2
	rsbs	r0, r0, #1
	movcc	r0, #0
	bl	bwassert(PLT)
	ldr	r0, .L73+12
	ldr	r3, .L73+16
	add	r0, sl, r0
	str	r3, [sp, #4]
	bl	WhoIs(PLT)
	mov	r7, r0
	ldr	r0, .L73+20
	ldr	ip, .L73+24
	add	r0, sl, r0
	str	ip, [sp, #20]
	bl	WhoIs(PLT)
	mov	r5, r0
	ldr	r0, .L73+28
	ldr	r3, .L73+32
	add	r0, sl, r0
	str	r3, [sp, #16]
	bl	WhoIs(PLT)
	mov	r4, r0
	ldr	r0, .L73+36
	ldr	ip, .L73+40
	add	r0, sl, r0
	str	ip, [sp, #12]
	bl	WhoIs(PLT)
	mov	r2, r4
	mvn	ip, #0
	mov	r3, r0
	mov	r1, r7
	mov	r0, r5
	str	ip, [sp, #92]
	bl	initTrains(PLT)
	ldr	r3, .L73+44
	mov	r0, #15
	ldr	r4, [sl, r3]
	add	r3, sp, #92
	mov	r1, r4
	str	r3, [sp, #8]
	bl	Create(PLT)
	mov	r1, r4
	str	r0, [sp, #24]
	mov	r0, #15
	bl	Create(PLT)
	mov	r1, r4
	mov	fp, r0
	mov	r0, #15
	bl	Create(PLT)
	mov	r1, r4
	mov	r9, r0
	mov	r0, #15
	bl	Create(PLT)
	ldr	r6, .L73+48
	mov	r8, r0
	add	r4, sp, #28
	add	r5, sp, #97
.L72:
	mov	r2, #64
	ldr	r0, [sp, #8]
	mov	r1, r4
	bl	Receive(PLT)
	ldrb	r2, [sp, #28]	@ zero_extendqisi2
	sub	r3, r2, #1
	cmp	r3, #38
	addls	pc, pc, r3, asl #2
	b	.L27
	.p2align 2
.L33:
	b	.L28
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L29
	b	.L30
	b	.L29
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L31
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L27
	b	.L32
.L28:
	ldr	r0, [sp, #92]
	ldr	ip, [sp, #24]
	mov	r1, r5
	cmp	ip, r0
	moveq	r3, #58
	streqb	r3, [sp, #97]
	cmp	fp, r0
	moveq	r3, #76
	streqb	r3, [sp, #97]
	cmp	r8, r0
	moveq	r3, #69
	streqb	r3, [sp, #97]
	cmp	r9, r0
	moveq	r3, #70
	streqb	r3, [sp, #97]
	mov	r2, #2
	mov	r3, #0
	strb	r3, [sp, #98]
	bl	Reply(PLT)
	b	.L72
.L30:
	mov	r3, r5
	mov	ip, #3
	mov	r1, r4
	mov	r2, #4
	mov	r0, r7
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r6
	bl	bwassert(PLT)
	ldr	r0, [sp, #92]
	mov	r1, r5
	mov	r2, #2
	bl	Reply(PLT)
	ldrb	r3, [sp, #30]	@ zero_extendqisi2
	sub	r3, r3, #58
	cmp	r3, #18
	addls	pc, pc, r3, asl #2
	b	.L72
	.p2align 2
.L52:
	b	.L70
	b	.L72
	b	.L72
	b	.L72
	b	.L72
	b	.L72
	b	.L72
	b	.L72
	b	.L72
	b	.L72
	b	.L72
	b	.L69
	b	.L71
	b	.L72
	b	.L72
	b	.L72
	b	.L72
	b	.L72
	b	.L51
.L29:
	ldrb	r3, [sp, #29]	@ zero_extendqisi2
	sub	r3, r3, #58
	cmp	r3, #18
	addls	pc, pc, r3, asl #2
	b	.L53
	.p2align 2
.L47:
	b	.L43
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L44
	b	.L45
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L46
.L31:
	ldrb	r3, [sp, #29]	@ zero_extendqisi2
	sub	r3, r3, #58
	cmp	r3, #18
	addls	pc, pc, r3, asl #2
	b	.L53
	.p2align 2
.L58:
	b	.L54
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L55
	b	.L56
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L53
	b	.L57
.L27:
	ldr	ip, [sp, #12]
	mov	r3, r2
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, ip
	bl	bwassert(PLT)
	b	.L72
.L32:
	mov	ip, #13
	mov	lr, #12
	strb	ip, [sp, #28]
	strb	lr, [sp, #29]
	add	ip, ip, #45
	sub	lr, lr, #12
	strb	ip, [sp, #30]
	mov	r1, r4
	mov	r3, r5
	mov	r0, r7
	mov	r2, #4
	strb	lr, [sp, #31]
	sub	ip, ip, #55
.L68:
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	add	r2, sl, r6
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r0, [sp, #92]
	mov	r1, r5
	mov	r2, #2
	bl	Reply(PLT)
	b	.L72
.L53:
	ldr	r3, [sp, #4]
	ldr	r0, [sp, #92]
	add	r1, sl, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L72
.L54:
	ldr	r3, [sp, #16]
	ldr	r0, [sp, #92]
	add	r1, sl, r3
	mov	r2, #2
	bl	Reply(PLT)
.L70:
	mov	ip, #3
	ldr	r0, [sp, #24]
	mov	r2, ip
	mov	r1, r4
.L67:
	mov	r3, r5
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r6
	bl	bwassert(PLT)
	b	.L72
.L55:
	ldr	ip, [sp, #16]
	ldr	r0, [sp, #92]
	add	r1, sl, ip
	mov	r2, #2
	bl	Reply(PLT)
.L69:
	mov	ip, #3
	mov	r2, ip
	mov	r1, r4
	mov	r0, r8
	b	.L67
.L56:
	ldr	r3, [sp, #16]
	ldr	r0, [sp, #92]
	add	r1, sl, r3
	mov	r2, #2
	bl	Reply(PLT)
.L71:
	mov	ip, #3
	mov	r2, ip
	mov	r1, r4
	mov	r0, r9
	b	.L67
.L51:
	mov	ip, #3
	mov	r2, ip
	mov	r1, r4
	mov	r3, r5
	mov	r0, fp
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #20]
	mov	r3, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, ip
	bl	bwassert(PLT)
	b	.L72
.L43:
	ldr	r0, [sp, #24]
	mov	r1, r4
	mov	r3, r5
.L66:
	mov	r2, #2
	mov	ip, #3
	b	.L68
.L46:
	mov	r1, r4
	mov	r3, r5
	mov	r0, fp
	b	.L66
.L44:
	mov	r1, r4
	mov	r3, r5
	mov	r0, r8
	b	.L66
.L45:
	mov	r1, r4
	mov	r3, r5
	mov	r0, r9
	b	.L66
.L57:
	ldr	ip, [sp, #16]
	mov	r2, #2
	add	r1, sl, ip
	ldr	r0, [sp, #92]
	bl	Reply(PLT)
	mov	ip, #3
	mov	r2, ip
	mov	r1, r4
	mov	r0, fp
	b	.L67
.L74:
	.align	2
.L73:
	.word	_GLOBAL_OFFSET_TABLE_-(.L65+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	trainProfile(GOT)
	.word	.LC8(GOTOFF)
	.size	trainServer, .-trainServer
	.align	2
	.global	max
	.type	max, %function
max:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, r1
	movlt	r0, r1
	@ lr needed for prologue
	bx	lr
	.size	max, .-max
	.align	2
	.global	initTrainWorker
	.type	initTrainWorker, %function
initTrainWorker:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L86
	mov	r4, r0
	ldr	r0, .L86+4
.L85:
	add	sl, pc, sl
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	r5, #0
	ldr	r7, .L86+8
	mov	r6, r5
.L80:
	str	r6, [r4, #4]
	mov	r0, #17
	ldr	r1, [sl, r7]
	bl	Create(PLT)
	add	r5, r5, #1
	cmp	r5, #5
	str	r0, [r4], #8
	bne	.L80
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L87:
	.align	2
.L86:
	.word	_GLOBAL_OFFSET_TABLE_-(.L85+8)
	.word	.LC6(GOTOFF)
	.word	trainWorker(GOT)
	.size	initTrainWorker, .-initTrainWorker
	.align	2
	.global	trainWorkerIndex
	.type	trainWorkerIndex, %function
trainWorkerIndex:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, sl, lr}
	ldr	sl, .L97
	mov	r4, r0
	ldr	r0, .L97+4
.L96:
	add	sl, pc, sl
	add	r0, sl, r0
	mov	r5, r1
	bl	WhoIs(PLT)
	mov	r0, #0
.L89:
	ldr	r3, [r4], #8
	cmp	r3, r5
	ldmeqfd	sp!, {r4, r5, sl, pc}
	add	r0, r0, #1
	cmp	r0, #5
	bne	.L89
	sub	r0, r0, #6
	ldmfd	sp!, {r4, r5, sl, pc}
.L98:
	.align	2
.L97:
	.word	_GLOBAL_OFFSET_TABLE_-(.L96+8)
	.word	.LC6(GOTOFF)
	.size	trainWorkerIndex, .-trainWorkerIndex
	.align	2
	.global	setTrainWorkerStatus
	.type	setTrainWorkerStatus, %function
setTrainWorkerStatus:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	mov	ip, #0
.L100:
	ldr	r3, [r0, #0]
	add	ip, ip, #1
	cmp	r3, r1
	beq	.L108
	cmp	ip, #5
	add	r0, r0, #8
	bne	.L100
	mvn	r3, #0
	mov	r0, r3
	bx	lr
.L108:
	mov	r3, #0
	str	r2, [r0, #4]
	mov	r0, r3
	bx	lr
	.size	setTrainWorkerStatus, .-setTrainWorkerStatus
	.align	2
	.global	nextFreeTrainWorker
	.type	nextFreeTrainWorker, %function
nextFreeTrainWorker:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	mov	r2, #0
.L110:
	ldr	r3, [r0, #4]
	add	r2, r2, #1
	cmp	r3, #1
	beq	.L118
	cmp	r2, #5
	add	r0, r0, #8
	bne	.L110
	mvn	r0, #0
	bx	lr
.L118:
	ldr	r0, [r0, #0]
	bx	lr
	.size	nextFreeTrainWorker, .-nextFreeTrainWorker
	.section	.rodata.str1.4
	.align	2
.LC13:
	.ascii	"sensorServer\000"
	.align	2
.LC14:
	.ascii	"<trainProfile %dr> someone [%d] calling himmself my"
	.ascii	" worker who i don't know is telling me he's ready\000"
	.align	2
.LC15:
	.ascii	"<trainProfile %d>: Error sending getNextSensorn mes"
	.ascii	"sage.\015\012\000"
	.align	2
.LC16:
	.ascii	"<trainProfile %dr> ran out of workers, COMMAND IS. "
	.ascii	"Fix this Paily\000"
	.global	__divsi3
	.align	2
.LC17:
	.ascii	"We got a worker that doesnt have an VEL based id,,,"
	.ascii	",PAILY?!!!!\000"
	.text
	.align	2
	.global	trainProfile
	.type	trainProfile, %function
trainProfile:
	@ args = 0, pretend = 0, frame = 360
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L243
	sub	sp, sp, #368
.L224:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r4, r0
	ldr	r0, .L243+4
	mov	r6, #1
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r0, .L243+8
	add	r8, sp, #204
	add	r0, sl, r0
	bl	WhoIs(PLT)
	str	r0, [sp, #48]
	add	r0, sp, #140
	str	r0, [sp, #28]
	ldr	r0, .L243+12
	mvn	r5, #0
	add	r0, sl, r0
	bl	WhoIs(PLT)
	str	r0, [sp, #52]
	ldr	r0, .L243+16
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	ip, #64
	str	r0, [sp, #56]
	mov	r1, r8
	mov	r0, r4
	mov	r2, r6
	ldr	r3, [sp, #28]
	str	ip, [sp, #0]
	str	r5, [sp, #364]
	strb	r6, [sp, #204]
	bl	Send(PLT)
	ldrb	r9, [sp, #140]	@ zero_extendqisi2
	cmp	r9, #0
	beq	.L230
.L120:
	add	fp, sp, #268
	mov	r0, fp
	bl	initTrainWorker(PLT)
	ldr	r3, .L243+20
	mov	r0, #17
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	str	r0, [sp, #108]
	ldr	r0, .L243+24
	mov	r1, #0
	add	r0, sl, r0
	str	r1, [sp, #64]
	bl	WhoIs(PLT)
	ldr	r2, [sp, #64]
	ldr	r3, .L243+28
	str	r2, [sp, #80]
	ldr	ip, .L243+32
	ldr	lr, .L243+36
	ldr	r0, .L243+40
	str	r3, [sp, #24]
	ldr	r1, .L243+44
	ldr	r3, [sp, #80]
	str	r2, [sp, #72]
	str	r2, [sp, #136]
	str	ip, [sp, #20]
	str	lr, [sp, #16]
	add	ip, sp, #364
	str	r0, [sp, #12]
	str	r2, [sp, #60]
	add	r0, sp, #340
	str	r2, [sp, #68]
	str	r2, [sp, #76]
	str	r2, [sp, #84]
	str	r2, [sp, #88]
	str	r2, [sp, #92]
	str	r2, [sp, #96]
	add	lr, sp, #308
	mov	r2, #5
	str	r0, [sp, #36]
	str	r5, [sp, #116]
	str	r1, [sp, #8]
	str	r6, [sp, #100]
	str	r2, [sp, #104]
	str	r5, [sp, #112]
	str	r5, [sp, #120]
	str	r3, [sp, #124]
	str	r3, [sp, #128]
	str	r5, [sp, #132]
	str	ip, [sp, #32]
	str	lr, [sp, #40]
	mov	r0, ip
.L229:
	mov	r1, r8
	mov	r2, #64
	bl	Receive(PLT)
	ldrb	r3, [sp, #204]	@ zero_extendqisi2
	sub	r3, r3, #1
	cmp	r3, #21
	addls	pc, pc, r3, asl #2
	b	.L126
	.p2align 2
.L135:
	b	.L127
	b	.L128
	b	.L129
	b	.L130
	b	.L126
	b	.L126
	b	.L126
	b	.L126
	b	.L126
	b	.L126
	b	.L126
	b	.L131
	b	.L132
	b	.L133
	b	.L126
	b	.L126
	b	.L126
	b	.L126
	b	.L126
	b	.L126
	b	.L126
	b	.L134
.L127:
	mov	r0, fp
	ldr	r1, [sp, #364]
	bl	trainWorkerIndex(PLT)
	cmp	r0, #0
	blt	.L148
	mov	r0, fp
	ldr	r1, [sp, #364]
	mov	r2, #1
	bl	setTrainWorkerStatus(PLT)
	ldr	r3, [sp, #104]
	ldr	r0, [sp, #32]
	sub	r3, r3, #1
	str	r3, [sp, #104]
	b	.L229
.L128:
	mov	r0, fp
	ldr	r1, [sp, #364]
	bl	trainWorkerIndex(PLT)
	cmp	r0, #0
	blt	.L223
	ldr	r1, [sp, #364]
	mov	r2, #1
	mov	r0, fp
	bl	setTrainWorkerStatus(PLT)
	ldr	r0, [sp, #36]
	mov	r1, r8
	mov	r2, #24
	bl	pkmemcpy(PLT)
	ldr	r3, [sp, #344]
	ldr	lr, [sp, #132]
	ldr	ip, [sp, #104]
	cmp	lr, r3
	sub	r6, ip, #1
	beq	.L231
.L227:
	ldr	r0, [sp, #32]
	str	r6, [sp, #104]
	b	.L229
.L129:
	mov	r0, fp
	ldr	r1, [sp, #364]
	bl	trainWorkerIndex(PLT)
	cmp	r0, #0
	blt	.L223
	ldr	r1, [sp, #364]
	mov	r2, #1
	mov	r0, fp
	bl	setTrainWorkerStatus(PLT)
	ldr	r0, [sp, #36]
	mov	r1, r8
	mov	r2, #24
	bl	pkmemcpy(PLT)
	ldr	r3, [sp, #104]
	ldr	ip, [sp, #132]
	sub	r6, r3, #1
	ldr	r3, [sp, #344]
	cmp	ip, r3
	bne	.L227
	ldr	r4, [sp, #352]
	cmp	r4, #0
	bne	.L160
	ldr	lr, [sp, #360]
	ldr	r0, [sp, #80]
	ldr	r2, [sp, #348]
	rsb	r3, r0, lr
	add	r3, r3, r3, asl #2
	cmp	r2, #4
	str	lr, [sp, #84]
	mov	r1, r3, asl #1
	ldr	r7, [sp, #356]
	beq	.L232
	cmp	r2, #5
	beq	.L233
	ldr	r2, [sp, #76]
	rsb	r0, r2, r2, asl #5
	add	r0, r2, r0, asl #2
	mov	r0, r0, asl #3
	bl	__divsi3(PLT)
	ldr	ip, [sp, #100]
	add	r0, r0, r0, asl #2
	add	r3, ip, ip, asl #1
	rsb	r3, r3, r3, asl #4
	ldr	r2, .L243+48
	mov	r3, r3, asl #1
	add	r3, r3, r0, asl #1
	smull	lr, r1, r2, r3
	mov	r3, r3, asr #31
	rsb	r1, r3, r1, asr #5
	str	r1, [sp, #100]
	ldr	r0, [sp, #84]
	ldr	r1, [sp, #96]
	mov	r2, r4
.L228:
	rsb	ip, r1, r0
	ldr	r3, [sp, #100]
	ldr	r0, [sp, #48]
	mov	r1, r9
	stmia	sp, {r7, ip}	@ phole stm
	bl	printTrainDiagnostics(PLT)
	mov	ip, #11
	mov	r1, r8
	mov	r2, #2
	ldr	r3, [sp, #40]
	strb	ip, [sp, #204]
	ldr	r0, [sp, #52]
	add	ip, ip, #21
	str	ip, [sp, #0]
	strb	r7, [sp, #205]
	bl	Send(PLT)
	ldr	r3, [sp, #16]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r3, r9
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	ip, [sp, #132]
	ldr	r3, [sp, #312]
	add	ip, ip, #1
	cmn	r3, #1
	str	ip, [sp, #132]
	bne	.L167
	ldr	lr, [sp, #84]
	ldr	r0, [sp, #32]
	str	r6, [sp, #104]
	str	lr, [sp, #80]
	b	.L229
.L130:
	ldr	r3, [sp, #124]
	cmp	r3, #1
	beq	.L234
.L136:
	ldr	r0, [sp, #128]
	cmp	r0, #1
	movne	r1, r0
	beq	.L235
.L144:
	ldr	r0, [sp, #124]
	sub	r1, r1, #1
	subs	r0, r0, #1
	str	r0, [sp, #124]
	str	r1, [sp, #128]
	bne	.L236
.L223:
	ldr	r0, [sp, #32]
	b	.L229
.L133:
	ldr	lr, [sp, #64]
	ldr	r2, [sp, #60]
	cmp	lr, #0
	movne	r0, #0
	moveq	r1, #16
	movne	ip, r0
	moveq	ip, r1
	strne	r0, [sp, #64]
	streq	r1, [sp, #64]
	ldr	r0, [sp, #364]
	ldr	r1, [sp, #28]
	add	ip, ip, r2
	mov	r3, #14
	mov	r2, #2
.L226:
	strb	r3, [sp, #204]
	mov	r3, #0
	strb	ip, [sp, #205]
	strb	r9, [sp, #206]
	strb	r3, [sp, #207]
	bl	Reply(PLT)
	ldr	r0, [sp, #32]
	b	.L229
.L134:
	mov	r1, r8
	mov	r2, #2
	ldr	r0, [sp, #364]
	bl	Reply(PLT)
	ldrb	r5, [sp, #206]	@ zero_extendqisi2
	mov	ip, #11
	mov	lr, #32
	mov	r1, r8
	mov	r2, #2
	ldr	r3, [sp, #40]
	ldr	r0, [sp, #52]
	strb	ip, [sp, #204]
	str	lr, [sp, #0]
	strb	r5, [sp, #205]
	bl	Send(PLT)
	ldr	lr, [sp, #16]
	mvn	r0, r0
	mov	r3, r9
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, lr
	bl	bwassert(PLT)
	ldr	r3, [sp, #312]
	cmn	r3, #1
	beq	.L223
	ldr	r0, [sp, #104]
	cmp	r0, #0
	beq	.L154
	ldr	r3, [sp, #12]
	mov	r0, #0
	add	r2, sl, r3
	mov	r1, #1
	mov	r3, r9
	bl	bwassert(PLT)
	ldr	r0, [sp, #32]
	b	.L229
.L131:
	ldr	lr, [sp, #60]
	ldrb	ip, [sp, #140]	@ zero_extendqisi2
	and	r3, lr, #255
	strb	r3, [sp, #204]
	strb	r3, [sp, #206]
	ldr	r0, [sp, #364]
	mov	r3, #0
	mov	r1, r8
	mov	r2, #2
	strb	ip, [sp, #205]
	strb	r3, [sp, #207]
	bl	Reply(PLT)
	ldr	r0, [sp, #32]
	mov	ip, #0
	str	ip, [sp, #64]
	b	.L229
.L126:
	ldr	r0, [sp, #364]
	mov	r1, #0
	mov	r2, #1
	bl	Reply(PLT)
	ldr	r0, [sp, #32]
	b	.L229
.L132:
	ldrb	ip, [sp, #205]	@ zero_extendqisi2
	ldr	lr, [sp, #64]
	ldr	r0, [sp, #364]
	ldr	r1, [sp, #28]
	str	ip, [sp, #60]
	mov	r2, #2
	add	ip, lr, ip
	mov	r3, #13
	b	.L226
.L236:
	ldr	r2, [sp, #24]
	ldr	r0, [sp, #364]
	add	r1, sl, r2
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r0, [sp, #32]
	b	.L229
.L154:
	ldr	ip, [sp, #316]
	mov	r0, fp
	str	ip, [sp, #68]
	bl	nextFreeTrainWorker(PLT)
	str	r0, [sp, #112]
	ldr	r1, [sp, #112]
	mov	r2, #2
	mov	r0, fp
	bl	setTrainWorkerStatus(PLT)
	mov	r0, fp
	bl	nextFreeTrainWorker(PLT)
	ldr	lr, [sp, #132]
	str	r0, [sp, #116]
	add	lr, lr, #1
	ldr	r1, [sp, #116]
	mov	r2, #3
	mov	r0, fp
	str	lr, [sp, #132]
	bl	setTrainWorkerStatus(PLT)
	ldr	r0, [sp, #132]
	mov	r7, #1
	and	r4, r0, #255
	mov	r1, r8
	mov	r2, #4
	mov	r6, #2
	ldr	r0, [sp, #112]
	strb	r5, [sp, #205]
	strb	r7, [sp, #204]
	strb	r4, [sp, #206]
	strb	r6, [sp, #207]
	bl	Reply(PLT)
	ldr	r3, [sp, #312]
	mov	r1, r8
	strb	r3, [sp, #205]
	ldr	r0, [sp, #116]
	mov	r3, #3
	mov	r2, #4
	strb	r4, [sp, #206]
	strb	r3, [sp, #207]
	strb	r7, [sp, #204]
	bl	Reply(PLT)
	ldr	r1, [sp, #124]
	cmp	r1, #0
	beq	.L156
	ldr	r0, [sp, #32]
	mvn	r2, #0
	mov	r3, #2000
	mov	ip, #0
	str	r2, [sp, #80]
	str	r6, [sp, #104]
	str	r7, [sp, #136]
	str	r2, [sp, #84]
	str	r3, [sp, #124]
	str	ip, [sp, #128]
	b	.L229
.L235:
	ldr	r1, [sp, #136]
	ldr	r2, [sp, #120]
	cmp	r1, #2
	movne	r3, #0
	moveq	r3, #1
	cmp	r2, #0
	moveq	r3, #0
	cmp	r3, #0
	ldreq	r1, [sp, #128]
	beq	.L144
	mov	ip, #6
	mov	lr, #64
	strb	ip, [sp, #204]
	str	lr, [sp, #0]
	ldr	ip, [sp, #120]
	ldr	lr, [sp, #128]
	mov	r1, r8
	ldr	r0, [sp, #56]
	mov	r2, #4
	ldr	r3, [sp, #28]
	strb	ip, [sp, #205]
	strb	lr, [sp, #206]
	bl	Send(PLT)
	ldr	r1, [sp, #128]
	b	.L144
.L234:
	ldr	ip, [sp, #136]
	cmp	ip, #1
	beq	.L237
	ldr	r1, [sp, #120]
	cmp	ip, #2
	movne	r3, #0
	moveq	r3, #1
	cmp	r1, #0
	movle	r3, #0
	cmp	r3, #0
	beq	.L136
	mov	ip, #6
	strb	ip, [sp, #204]
	mov	lr, #64
	ldr	ip, [sp, #120]
	str	lr, [sp, #0]
	ldr	r0, [sp, #56]
	mov	lr, #0
	mov	r1, r8
	mov	r2, #4
	ldr	r3, [sp, #28]
	strb	ip, [sp, #205]
	strb	lr, [sp, #206]
	bl	Send(PLT)
	b	.L136
.L148:
	ldr	ip, [sp, #20]
	mov	r0, #0
	add	r2, sl, ip
	ldr	ip, [sp, #364]
	mov	r1, #1
	mov	r3, r9
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	ldr	r0, [sp, #32]
	b	.L229
.L231:
	ldr	r7, [sp, #348]
	cmp	r7, #2
	beq	.L238
	cmp	r7, #3
	bne	.L190
	ldr	r1, [sp, #352]
	cmp	r1, #0
	str	r1, [sp, #44]
	bne	.L192
	ldr	r2, [sp, #80]
	cmn	r2, #1
	beq	.L239
	ldr	r3, [sp, #68]
	mov	ip, r2
	ldr	r2, [sp, #360]
	rsb	r0, r3, r3, asl #5
	rsb	r1, ip, r2
	add	r0, r3, r0, asl #2
	add	r1, r1, r1, asl #2
	mov	r1, r1, asl #1
	mov	r0, r0, asl #3
	str	r2, [sp, #84]
	bl	__divsi3(PLT)
	ldr	r2, [sp, #44]
	str	r0, [sp, #100]
	ldr	ip, [sp, #356]
	ldr	r0, [sp, #48]
	mov	r1, r9
	ldr	r3, [sp, #100]
	str	ip, [sp, #0]
	str	r2, [sp, #4]
	bl	printTrainDiagnostics(PLT)
	ldr	lr, [sp, #356]
	mov	ip, #11
	mov	r1, r8
	mov	r2, #2
	ldr	r3, [sp, #40]
	strb	ip, [sp, #204]
	ldr	r0, [sp, #52]
	add	ip, ip, #21
	str	ip, [sp, #0]
	strb	lr, [sp, #205]
	bl	Send(PLT)
	ldr	r3, [sp, #16]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r3
	mov	r1, #1
	mov	r3, r9
	bl	bwassert(PLT)
	ldr	ip, [sp, #132]
	ldr	r0, [sp, #312]
	add	ip, ip, #1
	cmn	r0, #1
	str	ip, [sp, #132]
	bne	.L200
	str	r0, [sp, #116]
	ldr	lr, [sp, #84]
	ldr	r0, [sp, #32]
	str	r6, [sp, #104]
	str	lr, [sp, #80]
	b	.L229
.L156:
	ldr	lr, [sp, #24]
	mov	r2, r6
	add	r1, sl, lr
	ldr	r0, [sp, #108]
	bl	Reply(PLT)
	mvn	r0, #0
	str	r0, [sp, #80]
	str	r0, [sp, #84]
	ldr	r0, [sp, #32]
	mov	r1, #2000
	mov	r2, #0
	str	r6, [sp, #104]
	str	r7, [sp, #136]
	str	r1, [sp, #124]
	str	r2, [sp, #128]
	b	.L229
.L160:
	cmp	r4, #2
	bne	.L227
	ldr	r0, [sp, #88]
	ldr	lr, [sp, #84]
	ldr	ip, [sp, #356]
	rsb	r4, r0, lr
	mov	r1, r9
	ldr	r0, [sp, #48]
	mov	r2, #1
	ldr	r3, [sp, #100]
	str	ip, [sp, #0]
	str	r4, [sp, #4]
	bl	printTrainDiagnostics(PLT)
	ldr	r1, [sp, #132]
	ldr	r0, [sp, #32]
	add	r1, r1, #1
	mvn	r2, #0
	mov	r3, #0
	str	r1, [sp, #132]
	str	r6, [sp, #104]
	str	r2, [sp, #120]
	str	r3, [sp, #136]
	b	.L229
.L237:
	ldr	lr, [sp, #112]
	cmp	lr, #0
	ble	.L140
	add	ip, ip, #5
	mov	lr, #64
	strb	ip, [sp, #204]
	ldr	ip, [sp, #112]
	str	lr, [sp, #0]
	ldr	r0, [sp, #56]
	mov	lr, #0
	mov	r1, r8
	mov	r2, #3
	ldr	r3, [sp, #28]
	strb	ip, [sp, #205]
	strb	lr, [sp, #206]
	bl	Send(PLT)
.L140:
	ldr	r0, [sp, #116]
	cmp	r0, #0
	ble	.L136
	mov	ip, #6
	strb	ip, [sp, #204]
	mov	lr, #64
	ldr	ip, [sp, #116]
	str	lr, [sp, #0]
	ldr	r0, [sp, #56]
	mov	lr, #0
	mov	r1, r8
	mov	r2, #3
	ldr	r3, [sp, #28]
	strb	ip, [sp, #205]
	strb	lr, [sp, #206]
	bl	Send(PLT)
	b	.L136
.L190:
	ldr	r3, [sp, #8]
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, r3
	bl	bwassert(PLT)
	b	.L227
.L238:
	ldr	r3, [sp, #352]
	cmp	r3, #0
	bne	.L183
	ldr	r0, [sp, #84]
	cmn	r0, #1
	ble	.L185
	cmp	r6, #0
	bne	.L123
	ldr	r1, [sp, #132]
	ldr	r0, [sp, #32]
	add	r1, r1, #1
	mvn	r2, #0
	str	r6, [sp, #104]
	str	r1, [sp, #132]
	str	r2, [sp, #112]
	str	r6, [sp, #136]
	b	.L229
.L167:
	ldr	r0, [sp, #316]
	ldr	r1, [sp, #100]
	str	r0, [sp, #68]
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	mov	r0, r0, asl #2
	bl	__divsi3(PLT)
	mov	r5, r0
	mov	r0, fp
	bl	nextFreeTrainWorker(PLT)
	str	r0, [sp, #120]
	ldr	r1, [sp, #120]
	mov	r2, #4
	mov	r0, fp
	bl	setTrainWorkerStatus(PLT)
	mov	r3, #2
	ldr	r4, [sp, #320]
	strb	r3, [sp, #204]
	ldr	ip, [sp, #84]
	add	r3, r3, r3
	ldr	r2, [sp, #312]
	strb	r3, [sp, #209]
	ldr	r3, [sp, #132]
	mov	r1, #0
	cmn	r4, #1
	add	ip, ip, r5
	strb	r2, [sp, #205]
	strb	r1, [sp, #206]
	strb	r1, [sp, #207]
	strb	r3, [sp, #208]
	str	ip, [sp, #88]
	streq	r1, [sp, #72]
	moveq	r7, r1
	streq	r1, [sp, #92]
	beq	.L171
	ldr	lr, [sp, #68]
	ldr	r3, [sp, #324]
	ldr	r1, [sp, #100]
	add	r3, lr, r3
	add	r0, r3, r3, asl #2
	add	r0, r0, r0, asl #2
	mov	r0, r0, asl #2
	str	r3, [sp, #72]
	bl	__divsi3(PLT)
	mov	r7, r0
	ldr	r0, [sp, #84]
	strb	r4, [sp, #206]
	add	r0, r0, r7
	str	r0, [sp, #92]
.L171:
	ldr	r4, [sp, #332]
	cmn	r4, #1
	moveq	r1, #0
	streq	r1, [sp, #76]
	moveq	r6, r1
	streq	r1, [sp, #96]
	beq	.L174
	ldr	r2, [sp, #336]
	ldr	r1, [sp, #100]
	add	r0, r2, r2, asl #2
	add	r0, r0, r0, asl #2
	mov	r0, r0, asl #2
	str	r2, [sp, #76]
	bl	__divsi3(PLT)
	ldr	r3, [sp, #84]
	mov	r6, r0
	add	r3, r3, r0
	strb	r4, [sp, #207]
	str	r3, [sp, #96]
.L174:
	ldr	r0, [sp, #120]
	mov	r1, r8
	mov	r2, #6
	bl	Reply(PLT)
	ldr	ip, [sp, #124]
	cmp	ip, #0
	beq	.L175
	mov	r1, r7
	mov	r0, r5
	bl	max(PLT)
	mov	r1, r6
	bl	max(PLT)
	ldr	lr, .L243+52
	add	r0, r0, #30
	smull	r2, r3, lr, r0
	add	r1, r5, #12
	smull	ip, r2, lr, r1
	sub	r3, r3, r0, asr #31
	mov	r0, #2
	ldr	lr, [sp, #84]
	str	r0, [sp, #136]
	ldr	r0, [sp, #32]
	sub	r2, r2, r1, asr #31
	str	r3, [sp, #124]
	str	r2, [sp, #128]
	str	lr, [sp, #80]
	b	.L229
.L183:
	cmp	r3, #2
	beq	.L240
.L123:
	ldr	r0, [sp, #32]
	mvn	r1, #0
	str	r6, [sp, #104]
	str	r1, [sp, #112]
	b	.L229
.L192:
	cmp	r1, #2
	beq	.L241
.L125:
	ldr	r0, [sp, #32]
	mvn	r2, #0
	str	r6, [sp, #104]
	str	r2, [sp, #116]
	b	.L229
.L240:
	cmp	r6, #0
	bne	.L123
	ldr	lr, [sp, #132]
	mvn	r0, #0
	str	r0, [sp, #112]
	ldr	r0, [sp, #32]
	add	lr, lr, #1
	str	r6, [sp, #104]
	str	lr, [sp, #132]
	str	r6, [sp, #136]
	b	.L229
.L233:
	ldr	r2, [sp, #72]
	rsb	r0, r2, r2, asl #5
	add	r0, r2, r0, asl #2
	mov	r0, r0, asl #3
	bl	__divsi3(PLT)
	ldr	ip, [sp, #100]
	add	r0, r0, r0, asl #2
	add	r3, ip, ip, asl #1
	rsb	r3, r3, r3, asl #4
	ldr	r2, .L243+48
	mov	r3, r3, asl #1
	add	r3, r3, r0, asl #1
	smull	lr, r1, r2, r3
	mov	r3, r3, asr #31
	rsb	r1, r3, r1, asr #5
	str	r1, [sp, #100]
	ldr	r0, [sp, #84]
	ldr	r1, [sp, #92]
	mov	r2, r4
	b	.L228
.L175:
	mov	r1, r7
	mov	r0, r5
	bl	max(PLT)
	mov	r1, r6
	bl	max(PLT)
	ldr	r1, .L243+52
	add	r3, r0, #30
	add	r5, r5, #12
	smull	r2, ip, r1, r3
	smull	lr, r4, r1, r5
	ldr	r2, [sp, #24]
	sub	ip, ip, r3, asr #31
	add	r1, sl, r2
	ldr	r0, [sp, #108]
	mov	r2, #2
	sub	r4, r4, r5, asr #31
	str	ip, [sp, #124]
	str	r4, [sp, #128]
	bl	Reply(PLT)
	ldr	r3, [sp, #84]
	ldr	r0, [sp, #32]
	mov	ip, #2
	str	r3, [sp, #80]
	str	ip, [sp, #136]
	b	.L229
.L232:
	ldr	r2, [sp, #68]
	rsb	r0, r2, r2, asl #5
	add	r0, r2, r0, asl #2
	mov	r0, r0, asl #3
	bl	__divsi3(PLT)
	ldr	ip, [sp, #100]
	add	r0, r0, r0, asl #2
	add	r3, ip, ip, asl #1
	rsb	r3, r3, r3, asl #4
	ldr	r2, .L243+48
	mov	r3, r3, asl #1
	add	r3, r3, r0, asl #1
	smull	lr, r1, r2, r3
	mov	r3, r3, asr #31
	rsb	r1, r3, r1, asr #5
	str	r1, [sp, #100]
	ldr	r0, [sp, #84]
	ldr	r1, [sp, #88]
	mov	r2, r4
	b	.L228
.L200:
	ldr	r0, [sp, #316]
	ldr	r1, [sp, #100]
	str	r0, [sp, #68]
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	mov	r0, r0, asl #2
	bl	__divsi3(PLT)
	mov	r5, r0
	mov	r0, fp
	bl	nextFreeTrainWorker(PLT)
	str	r0, [sp, #120]
	mov	r2, #4
	mov	r0, fp
	ldr	r1, [sp, #120]
	bl	setTrainWorkerStatus(PLT)
	mov	r3, #2
	ldr	r4, [sp, #320]
	strb	r3, [sp, #204]
	add	r3, r3, r3
	strb	r3, [sp, #209]
	ldr	lr, [sp, #84]
	ldr	r3, [sp, #44]
	cmn	r4, #1
	ldr	r2, [sp, #312]
	ldr	ip, [sp, #132]
	moveq	r6, r3
	add	lr, lr, r5
	strb	r2, [sp, #205]
	strb	r3, [sp, #206]
	strb	r3, [sp, #207]
	strb	ip, [sp, #208]
	str	lr, [sp, #88]
	streq	r6, [sp, #72]
	streq	r6, [sp, #92]
	beq	.L204
	ldr	r0, [sp, #68]
	ldr	r3, [sp, #324]
	ldr	r1, [sp, #100]
	add	r3, r0, r3
	add	r0, r3, r3, asl #2
	add	r0, r0, r0, asl #2
	mov	r0, r0, asl #2
	str	r3, [sp, #72]
	bl	__divsi3(PLT)
	ldr	r1, [sp, #84]
	mov	r6, r0
	add	r1, r1, r0
	strb	r4, [sp, #206]
	str	r1, [sp, #92]
.L204:
	ldr	r7, [sp, #332]
	cmn	r7, #1
	moveq	r4, #0
	streq	r4, [sp, #76]
	streq	r4, [sp, #96]
	beq	.L207
	ldr	r2, [sp, #336]
	ldr	r1, [sp, #100]
	add	r0, r2, r2, asl #2
	add	r0, r0, r0, asl #2
	mov	r0, r0, asl #2
	str	r2, [sp, #76]
	bl	__divsi3(PLT)
	ldr	r3, [sp, #84]
	mov	r4, r0
	add	r3, r3, r0
	strb	r7, [sp, #207]
	str	r3, [sp, #96]
.L207:
	ldr	r0, [sp, #120]
	mov	r1, r8
	mov	r2, #6
	bl	Reply(PLT)
	ldr	ip, [sp, #124]
	cmp	ip, #0
	beq	.L208
	mov	r1, r6
	mov	r0, r5
	bl	max(PLT)
	mov	r1, r4
	bl	max(PLT)
	ldr	lr, .L243+52
	add	r0, r0, #30
	smull	r2, r3, lr, r0
	add	r1, r5, #12
	smull	ip, r2, lr, r1
	sub	r3, r3, r0, asr #31
	mvn	r0, #0
	ldr	lr, [sp, #84]
	str	r0, [sp, #116]
	ldr	r0, [sp, #32]
	sub	r2, r2, r1, asr #31
	mov	r1, #2
	str	r3, [sp, #124]
	str	r2, [sp, #128]
	str	lr, [sp, #80]
	str	r1, [sp, #136]
	b	.L229
.L241:
	cmp	r6, #0
	bne	.L125
	ldr	r1, [sp, #132]
	ldr	r0, [sp, #32]
	add	r1, r1, #1
	mvn	r2, #0
	str	r6, [sp, #104]
	str	r1, [sp, #132]
	str	r2, [sp, #116]
	str	r6, [sp, #136]
	b	.L229
.L239:
	mov	ip, #6
	ldr	r3, [sp, #112]
	strb	ip, [sp, #204]
	add	ip, ip, #58
	str	ip, [sp, #0]
	ldr	ip, [sp, #360]
	and	lr, r3, #255
	mov	r1, r8
	add	r2, r2, #5
	ldr	r3, [sp, #28]
	ldr	r0, [sp, #56]
	strb	lr, [sp, #207]
	strb	lr, [sp, #205]
	strb	lr, [sp, #206]
	ldr	r4, [sp, #356]
	str	ip, [sp, #80]
	bl	Send(PLT)
	mov	ip, #11
	mov	r1, r8
	mov	r2, #2
	ldr	r3, [sp, #40]
	strb	ip, [sp, #204]
	ldr	r0, [sp, #52]
	add	ip, ip, #21
	str	ip, [sp, #0]
	strb	r4, [sp, #205]
	bl	Send(PLT)
	ldr	lr, [sp, #16]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, lr
	mov	r3, r9
	bl	bwassert(PLT)
	ldr	r1, [sp, #132]
	ldr	r0, [sp, #312]
	add	r1, r1, #1
	cmn	r0, #1
	str	r1, [sp, #132]
	bne	.L196
	ldr	r2, [sp, #44]
	str	r0, [sp, #116]
	ldr	r0, [sp, #32]
	str	r2, [sp, #124]
	str	r6, [sp, #104]
	str	r2, [sp, #128]
	b	.L229
.L185:
	ldr	r3, [sp, #360]
	ldr	r0, [sp, #32]
	mvn	ip, #0
	str	r3, [sp, #80]
	str	r6, [sp, #104]
	str	ip, [sp, #112]
	b	.L229
.L208:
	mov	r1, r6
	mov	r0, r5
	bl	max(PLT)
	mov	r1, r4
	bl	max(PLT)
	ldr	r2, .L243+52
	add	r3, r0, #30
	add	r5, r5, #12
	smull	lr, ip, r2, r3
	smull	r0, r4, r2, r5
	ldr	r2, [sp, #24]
	sub	ip, ip, r3, asr #31
	add	r1, sl, r2
	ldr	r0, [sp, #108]
	mov	r2, #2
	sub	r4, r4, r5, asr #31
	str	ip, [sp, #124]
	str	r4, [sp, #128]
	bl	Reply(PLT)
	ldr	r3, [sp, #84]
	ldr	r0, [sp, #32]
	mvn	ip, #0
	mov	lr, #2
	str	r3, [sp, #80]
	str	ip, [sp, #116]
	str	lr, [sp, #136]
	b	.L229
.L244:
	.align	2
.L243:
	.word	_GLOBAL_OFFSET_TABLE_-(.L224+8)
	.word	.LC4(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	trainTimer(GOT)
	.word	.LC5(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	1374389535
	.word	715827883
.L196:
	mov	r0, fp
	bl	nextFreeTrainWorker(PLT)
	cmn	r0, #1
	mov	r4, r0
	beq	.L242
	ldr	lr, [sp, #316]
	mov	r0, fp
	str	lr, [sp, #68]
	bl	nextFreeTrainWorker(PLT)
	mov	r4, r0
	mov	r1, r4
	mov	r2, r7
	mov	r0, fp
	bl	setTrainWorkerStatus(PLT)
	ldr	r3, [sp, #312]
	mov	r5, #1
	strb	r3, [sp, #205]
	ldr	r3, [sp, #132]
	mov	r1, r8
	mov	r2, #4
	mov	r0, r4
	strb	r3, [sp, #206]
	strb	r7, [sp, #207]
	strb	r5, [sp, #204]
	bl	Reply(PLT)
	ldr	ip, [sp, #24]
	ldr	r0, [sp, #108]
	add	r1, sl, ip
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r0, [sp, #44]
	mvn	lr, #0
	str	r0, [sp, #128]
	ldr	r0, [sp, #32]
	mov	r1, #500
	str	lr, [sp, #116]
	str	r5, [sp, #136]
	str	lr, [sp, #84]
	str	r1, [sp, #124]
	b	.L229
.L242:
	ldr	r3, [sp, #12]
	ldr	r0, [sp, #44]
	add	r2, sl, r3
	mov	r1, #1
	mov	r3, r9
	bl	bwassert(PLT)
	ldr	ip, [sp, #44]
	ldr	r0, [sp, #32]
	str	ip, [sp, #128]
	str	r6, [sp, #104]
	str	r4, [sp, #116]
	str	ip, [sp, #124]
	b	.L229
.L230:
	bl	Exit(PLT)
	b	.L120
	.size	trainProfile, .-trainProfile
	.align	2
	.global	trainTimer
	.type	trainTimer, %function
trainTimer:
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L249
	ldr	r0, .L249+4
.L248:
	add	sl, pc, sl
	sub	sp, sp, #132
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	r5, r0
	bl	MyParentTid(PLT)
	add	r9, sp, #68
	mov	r4, r0
	add	r8, sp, #4
	mov	r7, #4
	mov	r6, #64
.L246:
	mov	r0, r5
	mov	r1, #6
	bl	Delay(PLT)
	mov	r0, r4
	mov	r1, r9
	mov	r2, #1
	mov	r3, r8
	strb	r7, [sp, #68]
	str	r6, [sp, #0]
	bl	Send(PLT)
	b	.L246
.L250:
	.align	2
.L249:
	.word	_GLOBAL_OFFSET_TABLE_-(.L248+8)
	.word	.LC5(GOTOFF)
	.size	trainTimer, .-trainTimer
	.align	2
	.global	trainWorker
	.type	trainWorker, %function
trainWorker:
	@ args = 0, pretend = 0, frame = 184
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L271
	sub	sp, sp, #188
.L267:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r7, r0
	ldr	r0, .L271+4
	mov	r4, #1
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r0, .L271+8
	add	r3, sp, #20
	add	r0, sl, r0
	str	r3, [sp, #4]
	bl	WhoIs(PLT)
	str	r0, [sp, #16]
	ldr	r0, .L271+12
	add	r3, sp, #172
	add	r9, sp, #84
	add	r0, sl, r0
	str	r3, [sp, #12]
	bl	WhoIs(PLT)
	ldr	r3, [sp, #4]
	mov	ip, #64
	mov	r2, r4
	mov	r0, r7
	mov	r1, r9
	str	ip, [sp, #0]
	strb	r4, [sp, #84]
	bl	Send(PLT)
	add	r3, sp, #148
	str	r3, [sp, #8]
.L268:
	ldrb	ip, [sp, #20]	@ zero_extendqisi2
	mov	lr, #0
	cmp	ip, #1
	mov	r1, r9
	ldr	r3, [sp, #12]
	ldr	r0, [sp, #16]
	mov	r2, #4
	beq	.L254
.L270:
	add	lr, lr, #1
	cmp	ip, #2
	mov	r2, lr
	mov	r0, r7
	ldr	r3, [sp, #4]
	mov	r8, #5
	beq	.L269
	mov	ip, #64
	str	ip, [sp, #0]
	strb	lr, [sp, #84]
	bl	Send(PLT)
	ldrb	ip, [sp, #20]	@ zero_extendqisi2
	mov	lr, #0
	cmp	ip, #1
	mov	r1, r9
	ldr	r3, [sp, #12]
	ldr	r0, [sp, #16]
	mov	r2, #4
	bne	.L270
.L254:
	ldrb	r6, [sp, #21]	@ zero_extendqisi2
	mov	ip, #5
	strb	ip, [sp, #84]
	add	ip, ip, #11
	strb	lr, [sp, #87]
	str	ip, [sp, #0]
	strb	lr, [sp, #86]
	ldrb	r5, [sp, #22]	@ zero_extendqisi2
	ldrb	r4, [sp, #23]	@ zero_extendqisi2
	strb	r6, [sp, #85]
	bl	Send(PLT)
	mov	ip, #2
	strb	ip, [sp, #148]
	ldr	ip, [sp, #184]
	ldr	lr, [sp, #180]
	str	ip, [sp, #160]
	mov	r0, r7
	mov	ip, #64
	ldr	r1, [sp, #8]
	mov	r2, #24
	ldr	r3, [sp, #4]
	str	r4, [sp, #156]
	str	r5, [sp, #152]
	str	r6, [sp, #164]
	str	lr, [sp, #168]
	str	ip, [sp, #0]
	bl	Send(PLT)
	b	.L268
.L269:
	ldrb	r4, [sp, #21]	@ zero_extendqisi2
	ldrb	r5, [sp, #22]	@ zero_extendqisi2
	ldrb	r6, [sp, #23]	@ zero_extendqisi2
	ldr	r3, [sp, #12]
	add	r2, lr, #3
	add	ip, ip, #14
	ldr	r0, [sp, #16]
	str	ip, [sp, #0]
	strb	r8, [sp, #84]
	ldrb	fp, [sp, #24]	@ zero_extendqisi2
	strb	r4, [sp, #85]
	strb	r5, [sp, #86]
	strb	r6, [sp, #87]
	bl	Send(PLT)
	ldr	r2, [sp, #172]
	cmp	r4, r2
	moveq	r3, #4
	streq	r3, [sp, #156]
	streq	r2, [sp, #164]
	beq	.L258
	cmp	r5, r2
	movne	r3, #6
	streq	r8, [sp, #156]
	streq	r5, [sp, #164]
	strne	r3, [sp, #156]
	strne	r6, [sp, #164]
.L258:
	mov	ip, #3
	strb	ip, [sp, #148]
	ldr	lr, [sp, #184]
	ldr	ip, [sp, #180]
	mov	r4, #64
	mov	r0, r7
	ldr	r1, [sp, #8]
	mov	r2, #24
	ldr	r3, [sp, #4]
	str	fp, [sp, #152]
	str	lr, [sp, #160]
	str	ip, [sp, #168]
	str	r4, [sp, #0]
	bl	Send(PLT)
	b	.L268
.L272:
	.align	2
.L271:
	.word	_GLOBAL_OFFSET_TABLE_-(.L267+8)
	.word	.LC6(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC5(GOTOFF)
	.size	trainWorker, .-trainWorker
	.align	2
	.global	stopDistance
	.type	stopDistance, %function
stopDistance:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r2, .L284
	sub	sp, sp, #56
	ldr	r3, .L284+4
	str	r2, [sp, #36]
	ldr	r2, .L284+8
	str	r3, [sp, #32]
	str	r2, [sp, #44]
	mov	r3, #2688
	ldr	r2, .L284+12
	str	r3, [sp, #40]
	add	r3, r3, #2928
	str	r3, [sp, #48]
	str	r2, [sp, #52]
	ldr	r3, .L284+16
	ldr	r2, .L284+20
	str	r3, [sp, #4]
	str	r2, [sp, #8]
	ldr	r3, .L284+24
	ldr	r2, .L284+28
	str	r3, [sp, #12]
	str	r2, [sp, #16]
	ldr	r3, .L284+32
	ldr	r2, .L284+36
	mov	r1, #0
	str	r2, [sp, #24]
	str	r3, [sp, #20]
	str	r1, [sp, #28]
	str	r1, [sp, #0]
	add	r2, sp, #28
.L274:
	ldr	r3, [r2, r1, asl #2]
	cmp	r0, r3
	ble	.L275
	add	r1, r1, #1
	cmp	r1, #7
	bne	.L274
	mov	r3, #6
	sub	r1, r1, #2
.L278:
	add	r2, sp, #56
	add	r4, r2, r3, asl #2
	ldr	r3, [r4, #-28]
	add	r5, r2, r1, asl #2
	rsb	r0, r0, r3
	ldr	r1, [r5, #-28]
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	rsb	r1, r1, r3
	mov	r0, r0, asl #2
	bl	__divsi3(PLT)
	ldr	r1, [r4, #-56]
	rsb	r3, r0, #100
	mul	ip, r1, r3
	ldr	r2, [r5, #-56]
	ldr	r3, .L284+40
	mla	r0, r2, r0, ip
	smull	r1, r2, r3, r0
	mov	r0, r0, asr #31
	rsb	r0, r0, r2, asr #5
	add	sp, sp, #56
	ldmfd	sp!, {r4, r5, pc}
.L275:
	cmp	r1, #0
	movne	r3, r1
	moveq	r3, #1
	subne	r1, r1, #1
	b	.L278
.L285:
	.align	2
.L284:
	.word	1999
	.word	1122
	.word	3361
	.word	6712
	.word	199200
	.word	316083
	.word	421500
	.word	529450
	.word	1009200
	.word	1170200
	.word	1374389535
	.size	stopDistance, .-stopDistance
	.section	.rodata.str1.4
	.align	2
.LC18:
	.ascii	"<trainVelocityServer>: Receive error.\015\012\000"
	.align	2
.LC19:
	.ascii	"<trainServer>: Error sending message to DisplayServ"
	.ascii	"er.\015\012\000"
	.align	2
.LC20:
	.ascii	"<trainVelocityServer>: Illegal request code from us"
	.ascii	"erTask <%d>:[%s].\015\012\000"
	.align	2
.LC21:
	.ascii	"Q\000"
	.align	2
.LC22:
	.ascii	"<trainVelocityServer>: child croaked with wierd req"
	.ascii	"uest<%d>:[%s].\015\012\000"
	.align	2
.LC23:
	.ascii	"<trainVelocityServer>: Who this bitch? <%d>:[%s].\015"
	.ascii	"\012\000"
	.text
	.align	2
	.global	trainVelocityServer
	.type	trainVelocityServer, %function
trainVelocityServer:
	@ args = 0, pretend = 0, frame = 1220
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L352
	sub	sp, sp, #1216
	sub	sp, sp, #8
.L341:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r8, r0
	mov	r0, #0
	str	r0, [sp, #112]
	ldr	r0, .L352+4
	add	r7, sp, #1216
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r3, .L352+8
	str	r0, [sp, #100]
	ldr	r1, [sl, r3]
	mov	r0, #3
	bl	Create(PLT)
	str	r0, [sp, #104]
	ldr	r0, .L352+12
	mvn	lr, #0
	add	r0, sl, r0
	str	lr, [sp, #1216]
	bl	WhoIs(PLT)
	ldr	r5, [sp, #112]
	ldr	r1, .L352+16
	ldr	r2, .L352+20
	add	ip, sp, #1088
	mov	r3, #1
	str	r0, [sp, #156]
	stmib	sp, {r1, r2}	@ phole stm
	str	r3, [sp, #108]
	str	r5, [sp, #116]
	mov	r6, r5
	str	r5, [sp, #124]
	str	r5, [sp, #128]
	str	r5, [sp, #132]
	str	r5, [sp, #136]
	str	r5, [sp, #140]
	str	r5, [sp, #144]
	str	r5, [sp, #148]
	str	r5, [sp, #152]
	str	r7, [sp, #16]
	str	ip, [sp, #12]
	mov	r1, ip
	mov	r0, r7
.L342:
	mov	r2, #128
	bl	Receive(PLT)
	ldr	r3, [sp, #4]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r3
	bl	bwassert(PLT)
	ldr	lr, [sp, #1216]
	cmp	r8, lr
	beq	.L343
	ldr	r0, [sp, #104]
	cmp	r0, lr
	bne	.L319
	ldrb	r4, [sp, #1088]	@ zero_extendqisi2
	cmp	r4, #74
	beq	.L323
	cmp	r4, #83
	beq	.L324
	cmp	r4, #71
	beq	.L344
	ldr	r2, .L352+24
	mov	r3, lr
	ldr	lr, [sp, #12]
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, r2
	str	lr, [sp, #0]
	bl	bwassert(PLT)
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #16]
	b	.L342
.L343:
	ldrb	r3, [sp, #1088]	@ zero_extendqisi2
	cmp	r3, #74
	beq	.L293
	bhi	.L296
	cmp	r3, #28
	beq	.L345
.L291:
	ldr	r7, [sp, #8]
	mov	r2, #2
	add	r1, sl, r7
	mov	r0, r8
	bl	Reply(PLT)
	ldr	r2, .L352+28
	ldr	ip, [sp, #12]
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, r2
	ldr	r3, [sp, #1216]
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #16]
	b	.L342
.L323:
	ldr	r5, [sp, #116]
	cmp	r5, #0
	bne	.L346
	ldr	ip, [sp, #112]
	cmp	ip, #0
	bne	.L347
	mov	r0, #1
	str	r0, [sp, #140]
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #16]
	str	ip, [sp, #116]
	b	.L342
.L324:
	add	r3, sp, #1216
	mov	ip, #3
	add	r3, r3, #5
	add	r1, sp, #960
	mov	r2, #1
	mov	r0, r8
	str	ip, [sp, #0]
	strb	r4, [sp, #960]
	bl	Send(PLT)
	ldr	r2, .L352+32
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r7, [sp, #8]
	ldr	r0, [sp, #1216]
	add	r1, sl, r7
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #16]
	mov	ip, #0
	str	ip, [sp, #112]
	b	.L342
.L296:
	cmp	r3, #75
	beq	.L294
	cmp	r3, #83
	bne	.L291
	ldrb	r0, [sp, #1090]	@ zero_extendqisi2
	ldrb	r3, [sp, #1091]	@ zero_extendqisi2
	ldrb	ip, [sp, #1093]	@ zero_extendqisi2
	ldrb	r2, [sp, #1094]	@ zero_extendqisi2
	rsb	r1, r0, r0, asl #5
	add	r3, r3, r3, asl #2
	add	r0, r0, r1, asl #2
	add	r3, r3, r3, asl #2
	rsb	r1, ip, ip, asl #5
	add	r2, r2, r2, asl #2
	add	ip, ip, r1, asl #2
	add	r0, r0, r0, asl #2
	mov	r3, r3, asl #2
	add	r2, r2, r2, asl #2
	ldrb	lr, [sp, #1092]	@ zero_extendqisi2
	add	r3, r3, r0, asl #4
	add	ip, ip, ip, asl #2
	mov	r2, r2, asl #2
	ldrb	r1, [sp, #1095]	@ zero_extendqisi2
	add	r2, r2, ip, asl #4
	adds	r3, r3, lr
	str	r3, [sp, #120]
	add	r2, r2, r1
	ldrb	r5, [sp, #1089]	@ zero_extendqisi2
	bne	.L348
	ldr	ip, [sp, #112]
	cmp	ip, #0
	beq	.L306
.L351:
	ldr	lr, [sp, #128]
	cmp	lr, #0
	sub	r0, lr, #1
	ble	.L309
	ldr	r3, [sp, #560]
	cmp	r5, r3
	moveq	r0, #0
	movne	r2, #0
	beq	.L309
.L311:
	ldr	r7, [sp, #128]
	add	r2, r2, #1
	add	r1, sp, #1216
	add	r1, r1, #8
	cmp	r7, r2
	add	r3, r1, r2, asl #2
	beq	.L309
	ldr	r3, [r3, #-664]
	cmp	r5, r3
	bne	.L311
	mov	r0, r2
.L309:
	ldr	ip, [sp, #132]
	cmp	ip, r0
	movle	ip, #0
	ble	.L315
	add	r3, sp, #168
	mov	lr, ip
	sub	r3, r3, #8
	mov	ip, #0
	add	r1, r3, r0, asl #2
	mov	r2, ip
	rsb	r0, r0, lr
.L316:
	add	r2, r2, #1
	ldr	r3, [r1], #4
	cmp	r0, r2
	add	ip, ip, r3
	bne	.L316
.L315:
	ldr	r1, [sp, #148]
	ldr	r0, [sp, #156]
	add	ip, r1, ip
	str	ip, [sp, #144]
	bl	Time(PLT)
	mov	r4, r0
	ldr	r0, [sp, #108]
	bl	stopDistance(PLT)
	ldr	r2, [sp, #144]
	ldr	r1, [sp, #108]
	rsb	r3, r2, r2, asl #5
	add	r3, r2, r3, asl #2
	rsb	r0, r0, r3, asl #3
	bl	__divsi3(PLT)
	add	r4, r4, r0
	str	r4, [sp, #152]
.L306:
	ldr	r7, [sp, #120]
	cmp	r6, r5
	ldr	r3, [sp, #124]
	ldr	r0, .L352+36
	ldr	ip, .L352+40
	movne	r3, r7
	str	r3, [sp, #124]
	smull	lr, r1, ip, r3
	ldr	r5, .L352+40
	smull	r2, ip, r0, r3
	ldr	r3, [sp, #108]
	ldr	lr, [sp, #120]
	smull	r6, r2, r5, r3
	ldr	r6, .L352+36
	smull	r7, r4, r0, r3
	smull	r0, r3, r5, lr
	smull	r7, r5, r6, lr
	ldr	lr, [sp, #124]
	str	r5, [sp, #60]
	mov	r0, lr, asr #31
	ldr	r5, [sp, #108]
	ldr	r6, [sp, #120]
	rsb	ip, r0, ip, asr #5
	ldr	r7, [sp, #60]
	str	ip, [sp, #32]
	mov	r5, r5, asr #31
	ldr	ip, .L352+36
	mov	r6, r6, asr #31
	rsb	r3, r6, r3, asr #12
	rsb	r1, r0, r1, asr #12
	rsb	r7, r6, r7, asr #5
	rsb	r2, r5, r2, asr #12
	rsb	r4, r5, r4, asr #5
	str	r3, [sp, #76]
	str	r1, [sp, #44]
	smull	lr, fp, ip, r2
	str	r2, [sp, #96]
	str	r5, [sp, #92]
	smull	r1, r5, ip, r3
	smull	r3, r2, ip, r7
	ldr	lr, [sp, #44]
	str	r7, [sp, #64]
	str	r2, [sp, #56]
	smull	r0, r7, ip, lr
	ldr	r2, [sp, #32]
	str	r7, [sp, #40]
	smull	r3, r1, ip, r2
	ldr	r7, [sp, #96]
	str	r1, [sp, #28]
	str	r6, [sp, #72]
	mov	r1, r7, asr #31
	smull	r0, r6, ip, r4
	ldr	r7, [sp, #44]
	ldr	lr, [sp, #76]
	ldr	r0, [sp, #64]
	mov	r2, r7, asr #31
	ldr	r7, [sp, #32]
	mov	ip, r4, asr #31
	mov	r3, lr, asr #31
	rsb	ip, ip, r6, asr #5
	mov	lr, r0, asr #31
	ldr	r6, [sp, #40]
	mov	r0, r7, asr #31
	ldr	r7, [sp, #28]
	rsb	r2, r2, r6, asr #5
	rsb	r0, r0, r7, asr #5
	ldr	r6, [sp, #64]
	ldr	r7, [sp, #32]
	rsb	r3, r3, r5, asr #5
	ldr	r5, [sp, #56]
	rsb	r1, r1, fp, asr #5
	add	r9, r7, r7, asl #2
	add	fp, r6, r6, asl #2
	ldr	r6, [sp, #124]
	rsb	lr, lr, r5, asr #5
	add	r7, fp, fp, asl #2
	add	r5, r4, r4, asl #2
	add	fp, r9, r9, asl #2
	sub	fp, r6, fp, asl #2
	add	r5, r5, r5, asl #2
	str	r5, [sp, #80]
	add	r1, r1, r1, asl #2
	str	fp, [sp, #20]
	ldr	r5, [sp, #96]
	add	r1, r1, r1, asl #2
	sub	r1, r5, r1, asl #2
	str	r1, [sp, #88]
	ldr	r1, [sp, #120]
	ldr	r6, [sp, #76]
	add	r3, r3, r3, asl #2
	sub	r7, r1, r7, asl #2
	add	r3, r3, r3, asl #2
	sub	r3, r6, r3, asl #2
	str	r7, [sp, #48]
	add	ip, ip, ip, asl #2
	ldr	r7, [sp, #64]
	add	lr, lr, lr, asl #2
	str	r3, [sp, #68]
	add	ip, ip, ip, asl #2
	ldr	r3, [sp, #44]
	add	r2, r2, r2, asl #2
	add	lr, lr, lr, asl #2
	sub	r4, r4, ip, asl #2
	ldr	r5, [sp, #108]
	ldr	r6, [sp, #80]
	sub	lr, r7, lr, asl #2
	ldr	ip, [sp, #32]
	add	r0, r0, r0, asl #2
	add	r2, r2, r2, asl #2
	sub	r2, r3, r2, asl #2
	str	lr, [sp, #52]
	add	r0, r0, r0, asl #2
	mov	lr, #58
	str	r2, [sp, #36]
	sub	fp, r5, r6, asl #2
	sub	r0, ip, r0, asl #2
	ldr	r5, [sp, #68]
	mov	ip, #34
	strb	lr, [sp, #961]
	ldr	lr, [sp, #88]
	str	r0, [sp, #24]
	strb	ip, [sp, #960]
	ldr	ip, [sp, #36]
	ldr	r6, [sp, #52]
	strb	lr, [sp, #962]
	strb	r5, [sp, #965]
	ldr	lr, [sp, #24]
	ldr	r7, [sp, #48]
	ldr	r5, [sp, #20]
	add	r3, sp, #1216
	add	r3, r3, #5
	add	r1, sp, #960
	ldr	r0, [sp, #100]
	mov	r2, #11
	strb	r4, [sp, #963]
	strb	ip, [sp, #968]
	mov	r4, #3
	mov	ip, #0
	strb	lr, [sp, #969]
	strb	r6, [sp, #966]
	strb	fp, [sp, #964]
	strb	r7, [sp, #967]
	strb	r5, [sp, #970]
	strb	ip, [sp, #971]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L352+32
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldrb	r3, [sp, #1097]	@ zero_extendqisi2
	ldrb	r0, [sp, #1098]	@ zero_extendqisi2
	rsb	r2, r3, r3, asl #5
	add	r0, r0, r0, asl #2
	add	r3, r3, r2, asl #2
	add	r0, r0, r0, asl #2
	ldrb	r2, [sp, #1099]	@ zero_extendqisi2
	add	r3, r3, r3, asl #2
	mov	r0, r0, asl #2
	add	r0, r0, r3, asl #4
	add	r0, r0, r2
	rsb	r3, r0, r0, asl #5
	add	r0, r0, r3, asl #2
	ldr	r1, [sp, #108]
	mov	r0, r0, asl r4
	bl	__divsi3(PLT)
	ldr	r6, [sp, #8]
	str	r0, [sp, #124]
	add	r1, sl, r6
	ldr	r0, [sp, #1216]
	mov	r2, #2
	ldrb	r6, [sp, #1096]	@ zero_extendqisi2
	bl	Reply(PLT)
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #16]
	b	.L342
.L344:
	ldr	r1, [sp, #116]
	cmp	r1, #0
	bne	.L349
.L325:
	ldr	r2, [sp, #152]
	mov	r0, lr
	mov	r3, r2, asr #24
	strb	r3, [sp, #961]
	ldr	r3, [sp, #152]
	mov	ip, r2, asr #16
	mov	lr, r2, asr #8
	add	r1, sp, #960
	mov	r2, #5
	strb	r4, [sp, #960]
	strb	ip, [sp, #962]
	strb	lr, [sp, #963]
	strb	r3, [sp, #964]
	bl	Reply(PLT)
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #16]
	b	.L342
.L293:
	ldrb	ip, [sp, #1089]	@ zero_extendqisi2
	ldrb	lr, [sp, #1090]	@ zero_extendqisi2
	ldrb	r0, [sp, #1091]	@ zero_extendqisi2
	cmp	ip, #0
	str	ip, [sp, #128]
	str	lr, [sp, #132]
	str	r0, [sp, #148]
	ble	.L297
	ldr	r1, [sp, #12]
	mov	r2, #0
	add	r0, sp, #560
.L299:
	ldrb	r3, [r1, #4]	@ zero_extendqisi2
	add	r1, r1, #1
	str	r3, [r0, r2, asl #2]
	ldr	r3, [sp, #128]
	add	r2, r2, #1
	cmp	r3, r2
	bne	.L299
.L297:
	ldr	r5, [sp, #8]
	mov	r0, r8
	add	r1, sl, r5
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #16]
	mov	r7, #0
	str	r7, [sp, #144]
	str	r7, [sp, #136]
	b	.L342
.L319:
	ldr	r0, [sp, #8]
	mov	r2, #2
	add	r1, sl, r0
	mov	r0, lr
	bl	Reply(PLT)
	ldr	r2, .L352+44
	ldr	r5, [sp, #12]
	add	r2, sl, r2
	ldr	r3, [sp, #1216]
	mov	r0, #0
	mov	r1, #1
	str	r5, [sp, #0]
	bl	bwassert(PLT)
	add	sp, sp, #200
	add	sp, sp, #1024
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L346:
	ldr	r1, .L352+48
	mov	r0, lr
	add	r1, sl, r1
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #16]
	mov	r7, #1
	str	r7, [sp, #140]
	b	.L342
.L347:
	ldr	r1, [sp, #152]
	mov	r0, lr
	mov	r3, #71
	ldr	lr, [sp, #152]
	strb	r3, [sp, #960]
	ldr	r3, [sp, #152]
	mov	ip, lr, asr #24
	mov	r4, r1, asr #8
	mov	lr, lr, asr #16
	add	r1, sp, #960
	mov	r2, #5
	strb	ip, [sp, #961]
	strb	lr, [sp, #962]
	strb	r4, [sp, #963]
	strb	r3, [sp, #964]
	bl	Reply(PLT)
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #16]
	mov	r5, #1
	str	r5, [sp, #140]
	b	.L342
.L294:
	ldrb	r2, [sp, #1092]	@ zero_extendqisi2
	ldrb	r3, [sp, #1093]	@ zero_extendqisi2
	ldrb	r1, [sp, #1091]	@ zero_extendqisi2
	add	r3, r3, r2, asl #8
	ldrb	ip, [sp, #1089]	@ zero_extendqisi2
	add	r5, sp, #1216
	add	r3, r3, r1, asl #16
	ldrb	r0, [sp, #1090]	@ zero_extendqisi2
	ldr	r1, [sp, #136]
	add	r5, r5, #8
	add	r2, r5, ip, asl #2
	ldr	r7, [sp, #132]
	ldr	ip, [sp, #144]
	add	r1, r1, #1
	add	r3, r3, r0, asl #24
	add	ip, ip, r3
	cmp	r7, r1
	str	r1, [sp, #136]
	str	r3, [r2, #-1064]
	str	ip, [sp, #144]
	beq	.L350
.L300:
	mov	r0, lr
	ldr	lr, [sp, #8]
	mov	r2, #2
	add	r1, sl, lr
	bl	Reply(PLT)
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #16]
	b	.L342
.L345:
	ldr	r5, [sp, #8]
	mov	r0, lr
	add	r1, sl, r5
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #16]
	mov	r7, #1
	str	r7, [sp, #116]
	b	.L342
.L349:
	ldr	r1, .L352+48
	mov	r0, lr
	add	r1, sl, r1
	mov	r2, #2
	bl	Reply(PLT)
	ldr	lr, [sp, #1216]
	b	.L325
.L348:
	rsb	r0, r2, r2, asl #5
	add	r0, r2, r0, asl #2
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	mov	r1, r3
	mov	r0, r0, asl #4
	bl	__divsi3(PLT)
	ldr	r1, [sp, #108]
	ldr	ip, [sp, #112]
	add	r3, r1, r1, asl #2
	add	r3, r3, r3, asl #2
	add	r0, r0, r3, asl #1
	ldr	r3, .L352+36
	cmp	ip, #0
	smull	r7, r2, r3, r0
	mov	r0, r0, asr #31
	rsb	r2, r0, r2, asr #5
	str	r2, [sp, #108]
	beq	.L306
	b	.L351
.L350:
	ldr	r0, [sp, #156]
	bl	Time(PLT)
	mov	r4, r0
	ldr	r0, [sp, #108]
	bl	stopDistance(PLT)
	ldr	lr, [sp, #144]
	ldr	r1, [sp, #148]
	add	lr, lr, r1
	rsb	r3, lr, lr, asl #5
	add	r3, lr, r3, asl #2
	rsb	r0, r0, r3, asl #3
	ldr	r1, [sp, #108]
	str	lr, [sp, #144]
	bl	__divsi3(PLT)
	ldr	r2, [sp, #124]
	ldr	r3, [sp, #140]
	add	r4, r2, r4
	add	r4, r4, r0
	cmp	r3, #0
	str	r4, [sp, #152]
	ldreq	lr, [sp, #1216]
	moveq	r5, #1
	streq	r5, [sp, #112]
	beq	.L300
.L302:
	mov	ip, r4, asr #24
	mov	lr, r4, asr #16
	mov	r7, r4
	mov	r3, #71
	mov	r4, r4, asr #8
	ldr	r0, [sp, #104]
	add	r1, sp, #960
	mov	r2, #5
	strb	ip, [sp, #961]
	strb	lr, [sp, #962]
	strb	r3, [sp, #960]
	strb	r4, [sp, #963]
	strb	r7, [sp, #964]
	bl	Reply(PLT)
	ldr	lr, [sp, #1216]
	mov	ip, #1
	str	ip, [sp, #112]
	b	.L300
.L353:
	.align	2
.L352:
	.word	_GLOBAL_OFFSET_TABLE_-(.L341+8)
	.word	.LC6(GOTOFF)
	.word	trainStopServer(GOT)
	.word	.LC5(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	1374389535
	.word	1759218605
	.word	.LC23(GOTOFF)
	.word	.LC21(GOTOFF)
	.size	trainVelocityServer, .-trainVelocityServer
	.section	.rodata.str1.4
	.align	2
.LC24:
	.ascii	"<trainstopServer>: Send G issue.\000"
	.align	2
.LC25:
	.ascii	"<trainstopServer>: Send J issue.\000"
	.text
	.align	2
	.global	trainStopServer
	.type	trainStopServer, %function
trainStopServer:
	@ args = 0, pretend = 0, frame = 404
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L371
	ldr	r0, .L371+4
.L369:
	add	sl, pc, sl
	ldr	r3, .L371+8
	sub	sp, sp, #408
	add	r0, sl, r0
	str	r3, [sp, #4]
	bl	WhoIs(PLT)
	ldr	r0, .L371+12
	ldr	fp, .L371+16
	add	r0, sl, r0
	bl	WhoIs(PLT)
	str	r0, [sp, #20]
	ldr	r0, .L371+20
	ldr	ip, .L371+24
	add	r0, sl, r0
	str	ip, [sp, #8]
	bl	WhoIs(PLT)
	mov	r5, r0
	bl	MyParentTid(PLT)
	ldr	r3, .L371+28
	add	ip, sp, #152
	mov	r6, r0
	str	r3, [sp, #12]
	add	r9, sp, #280
	add	r8, sp, #24
	str	ip, [sp, #16]
	mov	r7, #128
.L355:
	mov	r3, r8
	mov	ip, #74
	mov	r1, r9
	mov	r2, #1
	mov	r0, r6
	strb	ip, [sp, #280]
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #12]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, ip
	bl	bwassert(PLT)
	ldrb	r3, [sp, #280]	@ zero_extendqisi2
	cmp	r3, #28
	beq	.L365
.L366:
	ldrb	r3, [sp, #28]	@ zero_extendqisi2
	ldrb	r2, [sp, #27]	@ zero_extendqisi2
	ldrb	r0, [sp, #26]	@ zero_extendqisi2
	add	r3, r3, r2, asl #8
	ldrb	r1, [sp, #25]	@ zero_extendqisi2
	add	r3, r3, r0, asl #16
	mov	r0, r5
	add	r4, r3, r1, asl #24
	bl	Time(PLT)
	rsb	r3, r0, r4
	cmp	r3, #10
	mov	r0, r5
	ble	.L370
	bl	Time(PLT)
	rsb	r3, r0, r4
	cmp	r3, #19
	mov	r1, #5
	mov	r0, r5
	bgt	.L358
	bl	Delay(PLT)
.L360:
	mov	r3, r8
	mov	ip, #71
	mov	r1, r9
	mov	r2, #1
	mov	r0, r6
	strb	ip, [sp, #280]
	str	r7, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, fp
	bl	bwassert(PLT)
	ldrb	r3, [sp, #280]	@ zero_extendqisi2
	cmp	r3, #28
	bne	.L366
.L365:
	bl	Exit(PLT)
	b	.L366
.L358:
	bl	Time(PLT)
	rsb	r3, r0, r4
	cmp	r3, #20
	mov	r1, #10
	mov	r0, r5
	ble	.L360
	bl	Delay(PLT)
	mov	r0, r5
	bl	Time(PLT)
	b	.L360
.L370:
	mov	r0, r5
	bl	Time(PLT)
	rsb	r1, r4, r0
	mov	r0, r5
	bl	Delay(PLT)
	mov	r4, #0
	mov	lr, #58
	mov	ip, #84
	mov	r3, r8
	mov	r1, r9
	ldr	r0, [sp, #20]
	mov	r2, #4
	strb	lr, [sp, #282]
	strb	ip, [sp, #280]
	strb	r4, [sp, #283]
	strb	r4, [sp, #281]
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #4]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r3, r8
	mov	ip, #83
	mov	r1, r9
	mov	r0, r6
	mov	r2, #1
	strb	ip, [sp, #280]
	str	r7, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	add	r2, sl, fp
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r1, [sp, #16]
	mov	r3, r8
	mov	ip, #83
	mov	r0, r6
	mov	r2, #1
	strb	ip, [sp, #152]
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #8]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r3
	bl	bwassert(PLT)
	b	.L355
.L372:
	.align	2
.L371:
	.word	_GLOBAL_OFFSET_TABLE_-(.L369+8)
	.word	.LC6(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC25(GOTOFF)
	.size	trainStopServer, .-trainStopServer
	.ident	"GCC: (GNU) 4.0.2"
