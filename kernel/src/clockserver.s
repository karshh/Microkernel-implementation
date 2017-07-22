	.file	"clockserver.c"
	.text
	.align	2
	.global	initStorage
	.type	initStorage, %function
initStorage:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	@ lr needed for prologue
	str	r3, [r0, #1024]
	bx	lr
	.size	initStorage, .-initStorage
	.align	2
	.global	heapParent
	.type	heapParent, %function
heapParent:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	r0, r0, #1
	add	r0, r0, r0, lsr #31
	mov	r0, r0, asr #1
	@ lr needed for prologue
	bx	lr
	.size	heapParent, .-heapParent
	.align	2
	.global	heapLeft
	.type	heapLeft, %function
heapLeft:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, r0, asl #1
	add	r0, r0, #1
	@ lr needed for prologue
	bx	lr
	.size	heapLeft, .-heapLeft
	.align	2
	.global	heapRight
	.type	heapRight, %function
heapRight:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, r0, asl #1
	add	r0, r0, #2
	@ lr needed for prologue
	bx	lr
	.size	heapRight, .-heapRight
	.align	2
	.global	minHeapPeak
	.type	minHeapPeak, %function
minHeapPeak:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #1024]
	@ lr needed for prologue
	cmp	r3, #0
	mov	r2, r3
	ldrne	r3, [r0, #0]
	movne	r2, #1
	mov	r0, r2
	strne	r3, [r1, #0]
	bx	lr
	.size	minHeapPeak, .-minHeapPeak
	.align	2
	.global	clockNotifier
	.type	clockNotifier, %function
clockNotifier:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	sub	sp, sp, #8
	bl	MyParentTid(PLT)
	add	r6, sp, #5
	mov	r4, r0
	mov	r5, #3
.L15:
	mov	r0, #0
	bl	AwaitEvent(PLT)
	mov	r1, #0
	mov	r0, r4
	mov	r2, r1
	mov	r3, r6
	str	r5, [sp, #0]
	bl	Send(PLT)
	b	.L15
	.size	clockNotifier, .-clockNotifier
	.align	2
	.global	minHeapInsert
	.type	minHeapInsert, %function
minHeapInsert:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	ip, [r0, #1024]
	mov	r6, r1
	cmp	ip, #127
	moveq	r2, #0
	beq	.L21
	cmp	ip, #0
	ble	.L30
	sub	r3, ip, #1
	add	r3, r3, r3, lsr #31
	mov	r1, r3, asr #1
	ldr	r2, [r0, r1, asl #3]
	ldr	r3, [r6, #0]
	cmp	r3, r2
	movlt	lr, ip
	movlt	ip, r1
	blt	.L23
.L30:
	mov	r4, ip, asl #3
.L24:
	ldr	r3, [r6, #0]
	ldr	r1, [r6, #4]
	add	r2, r4, r0
	str	r1, [r2, #4]
	str	r3, [r0, ip, asl #3]
	ldr	r3, [r0, #1024]
	mov	r2, #1
	add	r3, r3, r2
	str	r3, [r0, #1024]
.L21:
	mov	r0, r2
	ldmfd	sp!, {r4, r5, r6, pc}
.L22:
	mov	ip, r5
.L23:
	sub	r3, ip, #1
	add	r3, r3, r3, lsr #31
	mov	r4, ip, asl #3
	mov	r5, r3, asr #1
	add	r3, r4, r0
	ldr	r2, [r3, #4]
	ldr	r1, [r0, ip, asl #3]
	add	r3, r0, lr, asl #3
	cmp	ip, #0
	str	r1, [r0, lr, asl #3]
	str	r2, [r3, #4]
	mov	lr, ip
	ble	.L24
	ldr	r2, [r0, r5, asl #3]
	ldr	r3, [r6, #0]
	cmp	r3, r2
	blt	.L22
	b	.L24
	.size	minHeapInsert, .-minHeapInsert
	.align	2
	.global	minHeapify
	.type	minHeapify, %function
minHeapify:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	lr, r0
	mov	r4, r1
	mov	r3, r4, asl #1
	ldr	r5, [lr, #1024]
	add	r1, r3, #1
	cmp	r1, r5
	add	r0, r3, #2
	bgt	.L34
.L44:
	ldr	r2, [lr, r1, asl #3]
	ldr	r3, [lr, r4, asl #3]
	mov	ip, r1
	cmp	r2, r3
	bge	.L34
.L37:
	cmp	r0, r5
	add	r6, lr, r4, asl #3
	bgt	.L38
	ldr	r2, [lr, r0, asl #3]
	ldr	r3, [lr, ip, asl #3]
	cmp	r2, r3
	movlt	ip, r0
.L38:
	cmp	ip, r4
	add	r5, lr, ip, asl #3
	ldmeqfd	sp!, {r4, r5, r6, pc}
	ldr	r0, [r5, #4]
	ldr	r2, [lr, ip, asl #3]
	ldr	r1, [r6, #4]
	ldr	r3, [lr, r4, asl #3]
	str	r1, [r5, #4]
	str	r3, [lr, ip, asl #3]
	str	r0, [r6, #4]
	str	r2, [lr, r4, asl #3]
	mov	r4, ip
	mov	r3, r4, asl #1
	ldr	r5, [lr, #1024]
	add	r1, r3, #1
	cmp	r1, r5
	add	r0, r3, #2
	ble	.L44
.L34:
	mov	ip, r4
	b	.L37
	.size	minHeapify, .-minHeapify
	.align	2
	.global	minHeapDelete
	.type	minHeapDelete, %function
minHeapDelete:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, [r0, #1024]
	mov	ip, r1
	cmp	r3, #0
	mov	lr, r0
	mov	r1, #0
	beq	.L48
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #4]
	str	r3, [ip, #0]
	str	r2, [ip, #4]
	ldr	r3, [r0, #1024]
	add	r2, r0, r3, asl #3
	sub	r3, r3, #1
	ldr	ip, [r0, r3, asl #3]
	ldr	r4, [r2, #-4]
	str	ip, [r0, #0]
	str	r3, [r0, #1024]
	str	r4, [r0, #4]
	bl	minHeapify(PLT)
	mov	r3, #1
.L48:
	mov	r0, r3
	ldmfd	sp!, {r4, pc}
	.size	minHeapDelete, .-minHeapDelete
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"clockServer\000"
	.align	2
.LC1:
	.ascii	"Failed to register clockServer.\015\012\000"
	.align	2
.LC2:
	.ascii	"Invalid code received\015\012\000"
	.align	2
.LC3:
	.ascii	"1\000"
	.align	2
.LC4:
	.ascii	"<ClockServer>: Delay overflow error. Could not dela"
	.ascii	"y TD<%d>.\015\012\000"
	.align	2
.LC5:
	.ascii	"<ClockServer>: Delay storage error. Could not put %"
	.ascii	"d into storage.\015\012\000"
	.align	2
.LC6:
	.ascii	"<ClockServer>: Time overflow error. Could not send "
	.ascii	"time to TD<%d>.\015\012\000"
	.align	2
.LC7:
	.ascii	"<ClockServer>: DelayUntil overflow error. Could not"
	.ascii	" delay TD<%d>.\015\012\000"
	.align	2
.LC8:
	.ascii	"<ClockServer>: DelayUntil storage error. Could not "
	.ascii	"put TD<%d> into storage.\015\012\000"
	.align	2
.LC9:
	.ascii	"<ClockServer>: Invalid code: %d.\015\012\000"
	.text
	.align	2
	.global	clockServer
	.type	clockServer, %function
clockServer:
	@ args = 0, pretend = 0, frame = 1136
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #1136
	add	r0, sp, #80
	ldr	sl, .L83
	str	r0, [sp, #40]
	ldr	r0, .L83+4
.L76:
	add	sl, pc, sl
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L83+8
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r1, [sp, #40]
	ldr	r3, .L83+12
	sub	r1, r1, #8
	str	r1, [sp, #40]
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	str	r0, [sp, #68]
	ldr	r0, [sp, #40]
	bl	initStorage(PLT)
	ldr	r2, .L83+16
	ldr	r3, .L83+20
	ldr	r7, .L83+24
	ldr	r8, .L83+28
	ldr	ip, .L83+32
	str	r2, [sp, #20]
	str	r3, [sp, #16]
	ldr	r2, .L83+36
	mvn	r3, #0
	ldr	r0, .L83+40
	ldr	r1, .L83+44
	str	r7, [sp, #12]
	str	r8, [sp, #8]
	str	ip, [sp, #56]
	str	r3, [sp, #1132]
	add	r7, sp, #1104
	add	r3, sp, #1120
	add	r8, sp, #1088
	add	ip, sp, #1104
	add	r3, r3, #12
	add	r7, r7, #7
	str	r2, [sp, #44]
	add	r8, r8, #12
	mov	r2, #0
	add	ip, ip, #14
	str	r0, [sp, #52]
	str	r1, [sp, #48]
	str	r2, [sp, #1128]
	str	r3, [sp, #24]
	str	r7, [sp, #32]
	str	r8, [sp, #36]
	str	ip, [sp, #28]
	mov	r1, r7
	mov	r0, r3
.L78:
	mov	r2, #7
	bl	Receive(PLT)
	ldr	r3, [sp, #20]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r3
	bl	bwassert(PLT)
	ldr	r5, [sp, #1132]
	ldr	r7, [sp, #68]
	cmp	r7, r5
	beq	.L79
	ldrb	r3, [sp, #1111]	@ zero_extendqisi2
	str	r3, [sp, #1124]
	ldr	r3, [sp, #1124]
	cmp	r3, #10
	beq	.L60
	blt	.L59
	cmp	r3, #11
	beq	.L61
	cmp	r3, #12
	beq	.L80
.L59:
	ldr	r7, [sp, #44]
	mov	r0, #0
	mov	r1, #1
	ldr	r3, [sp, #1124]
	add	r2, sl, r7
	bl	bwassert(PLT)
	ldr	r1, [sp, #32]
	ldr	r0, [sp, #24]
	b	.L78
.L79:
	ldr	r3, [sp, #1128]
	ldr	r2, [sp, #1096]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [sp, #1128]
	beq	.L75
	ldr	r2, [sp, #72]
	ldr	r3, [sp, #1128]
	cmp	r2, r3
	ble	.L71
.L75:
	ldr	ip, [sp, #16]
.L54:
	add	r1, sl, ip
	ldr	r0, [sp, #68]
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r1, [sp, #32]
	ldr	r0, [sp, #24]
	b	.L78
.L71:
	ldr	r1, [sp, #36]
	ldr	r0, [sp, #40]
	bl	minHeapDelete(PLT)
	ldr	r8, [sp, #16]
	cmp	r0, #0
	add	r1, sl, r8
	mov	r2, #2
	beq	.L74
.L81:
	ldr	r0, [sp, #1104]
	bl	Reply(PLT)
	ldr	r3, [sp, #1096]
	cmp	r3, #0
	beq	.L75
	ldr	r2, [sp, #72]
	ldr	r3, [sp, #1128]
	cmp	r3, r2
	blt	.L75
	ldr	r1, [sp, #36]
	ldr	r0, [sp, #40]
	bl	minHeapDelete(PLT)
	ldr	r8, [sp, #16]
	cmp	r0, #0
	add	r1, sl, r8
	mov	r2, #2
	bne	.L81
.L74:
	mov	ip, r8
	b	.L54
.L60:
	ldrb	r0, [sp, #1112]	@ zero_extendqisi2
	ldrb	r3, [sp, #1113]	@ zero_extendqisi2
	ldrb	r1, [sp, #1114]	@ zero_extendqisi2
	rsb	r2, r0, r0, asl #5
	rsb	r2, r2, r2, asl #6
	rsb	lr, r3, r3, asl #5
	ldrb	ip, [sp, #1115]	@ zero_extendqisi2
	rsb	r4, r1, r1, asl #5
	rsb	lr, lr, lr, asl #6
	add	r0, r0, r2, asl #3
	add	r1, r1, r4, asl #2
	add	r3, r3, lr, asl #3
	add	r0, r0, r0, asl #2
	add	ip, ip, ip, asl #2
	add	r1, r1, r1, asl #2
	add	ip, ip, ip, asl #2
	add	r0, r0, r0, asl #2
	mov	r3, r3, asl #6
	mov	r1, r1, asl #4
	add	r1, r1, ip, asl #2
	add	r3, r3, r0, asl #8
	ldrb	r0, [sp, #1116]	@ zero_extendqisi2
	ldr	r2, [sp, #1128]
	add	r3, r3, r1
	add	r3, r3, r0
	add	r3, r3, r2
	str	r3, [sp, #1100]
	ldr	r0, [sp, #1100]
	ldr	r1, [sp, #12]
	mvn	r0, r0
	mov	r3, r5
	add	r2, sl, r1
	mov	r0, r0, lsr #31
	mov	r1, #1
	str	r5, [sp, #1104]
	bl	bwassert(PLT)
	ldr	r1, [sp, #36]
	ldr	r0, [sp, #40]
	bl	minHeapInsert(PLT)
	ldr	r3, [sp, #8]
	mov	r1, #1
.L77:
	add	r2, sl, r3
	ldr	r3, [sp, #1104]
	bl	bwassert(PLT)
	ldr	r1, [sp, #32]
	ldr	r0, [sp, #24]
	b	.L78
.L61:
	ldr	r0, [sp, #1128]
	ldr	r7, [sp, #56]
	mvn	r0, r0
	add	r2, sl, r7
	mov	r3, r5
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r6, [sp, #1128]
	ldr	r3, .L83+48
	ldr	lr, [sp, #1128]
	ldr	r2, .L83+52
	ldr	r1, .L83+56
	ldr	r4, [sp, #1128]
	smull	ip, r8, r3, r6
	ldr	r5, [sp, #1128]
	smull	r0, ip, r2, lr
	ldr	r3, .L83+60
	mov	r6, r6, asr #31
	smull	r7, r2, r3, r4
	smull	r3, r0, r1, r5
	ldr	r7, [sp, #1128]
	mov	lr, lr, asr #31
	rsb	lr, lr, ip, asr #18
	rsb	r6, r6, r8, asr #25
	smull	ip, r8, r1, r7
	mov	r5, r5, asr #31
	rsb	r5, r5, r0, asr #5
	str	r7, [sp, #64]
	mov	r4, r4, asr #31
	smull	ip, r7, r1, r5
	rsb	r4, r4, r2, asr #12
	str	r8, [sp, #60]
	smull	r2, r9, r1, lr
	smull	r0, r8, r1, r6
	ldr	r2, [sp, #64]
	mov	r0, r6, asr #31
	str	r0, [sp, #4]
	smull	r3, fp, r1, r4
	mov	r0, r5, asr #31
	mov	r1, lr, asr #31
	mov	ip, r2, asr #31
	ldr	r2, [sp, #4]
	str	r1, [sp, #0]
	rsb	r0, r0, r7, asr #5
	ldr	r7, [sp, #60]
	rsb	r3, r2, r8, asr #5
	ldr	r8, [sp, #0]
	mov	r1, r4, asr #31
	rsb	ip, ip, r7, asr #5
	rsb	r2, r8, r9, asr #5
	rsb	r1, r1, fp, asr #5
	ldr	r8, [sp, #64]
	add	r3, r3, r3, asl #2
	add	ip, ip, ip, asl #2
	add	r3, r3, r3, asl #2
	add	ip, ip, ip, asl #2
	add	r2, r2, r2, asl #2
	add	r1, r1, r1, asl #2
	add	r0, r0, r0, asl #2
	add	r2, r2, r2, asl #2
	add	r1, r1, r1, asl #2
	add	r0, r0, r0, asl #2
	sub	r6, r6, r3, asl #2
	sub	r3, r8, ip, asl #2
	sub	lr, lr, r2, asl #2
	sub	r4, r4, r1, asl #2
	sub	r5, r5, r0, asl #2
	ldr	r1, [sp, #28]
	strb	r3, [sp, #1122]
	ldr	r0, [sp, #1132]
	mov	r3, #0
	mov	r2, #6
	strb	r6, [sp, #1118]
	strb	lr, [sp, #1119]
	strb	r4, [sp, #1120]
	strb	r5, [sp, #1121]
	strb	r3, [sp, #1123]
	bl	Reply(PLT)
	ldr	r1, [sp, #32]
	ldr	r0, [sp, #24]
	b	.L78
.L80:
	ldrb	r1, [sp, #1112]	@ zero_extendqisi2
	ldrb	r0, [sp, #1113]	@ zero_extendqisi2
	ldrb	r2, [sp, #1114]	@ zero_extendqisi2
	rsb	r3, r1, r1, asl #5
	rsb	r3, r3, r3, asl #6
	rsb	lr, r0, r0, asl #5
	ldrb	ip, [sp, #1115]	@ zero_extendqisi2
	rsb	r4, r2, r2, asl #5
	add	r1, r1, r3, asl #3
	rsb	lr, lr, lr, asl #6
	add	r2, r2, r4, asl #2
	add	r0, r0, lr, asl #3
	add	r1, r1, r1, asl #2
	add	ip, ip, ip, asl #2
	add	r2, r2, r2, asl #2
	add	r1, r1, r1, asl #2
	add	ip, ip, ip, asl #2
	mov	r0, r0, asl #6
	mov	r2, r2, asl #4
	add	r2, r2, ip, asl #2
	ldrb	r3, [sp, #1116]	@ zero_extendqisi2
	add	r0, r0, r1, asl #8
	add	r0, r0, r2
	add	r0, r0, r3
	str	r0, [sp, #1100]
	ldr	r0, [sp, #1100]
	ldr	ip, [sp, #52]
	mvn	r0, r0
	mov	r3, r5
	add	r2, sl, ip
	mov	r0, r0, lsr #31
	mov	r1, #1
	str	r5, [sp, #1104]
	bl	bwassert(PLT)
	ldr	r2, [sp, #1100]
	ldr	r3, [sp, #1128]
	cmp	r2, r3
	ble	.L82
.L63:
	ldr	r1, [sp, #36]
	ldr	r0, [sp, #40]
	bl	minHeapInsert(PLT)
	ldr	r3, [sp, #48]
	mov	r1, #1
	b	.L77
.L82:
	ldr	r2, [sp, #16]
	ldr	r0, [sp, #1132]
	add	r1, sl, r2
	mov	r2, #2
	bl	Reply(PLT)
	b	.L63
.L84:
	.align	2
.L83:
	.word	_GLOBAL_OFFSET_TABLE_-(.L76+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	clockNotifier(GOT)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	1441151881
	.word	1125899907
	.word	1374389535
	.word	1759218605
	.size	clockServer, .-clockServer
	.ident	"GCC: (GNU) 4.0.2"
