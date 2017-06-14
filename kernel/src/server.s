	.file	"server.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Failed Create UART1TR Server.\012\015\000"
	.align	2
.LC1:
	.ascii	"Failed Create UART2TR Server.\012\015\000"
	.align	2
.LC2:
	.ascii	"Failed Create UART1TS Server.\012\015\000"
	.align	2
.LC3:
	.ascii	"Failed Create UART2TS Server.\012\015\000"
	.text
	.align	2
	.global	FirstUserTask
	.type	FirstUserTask, %function
FirstUserTask:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L4
	ldr	r3, .L4+4
.L3:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	CreateNameServer(PLT)
	ldr	r3, .L4+8
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	CreateClockServer(PLT)
	ldr	r3, .L4+12
	mov	r0, #31
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L4+16
	mov	r0, #2
	ldr	r1, [sl, r3]
	mov	r2, r0
	bl	CreateIOServer(PLT)
	ldr	r2, .L4+20
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L4+24
	mov	r2, #4
	ldr	r1, [sl, r3]
	mov	r0, #2
	bl	CreateIOServer(PLT)
	ldr	r2, .L4+28
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L4+32
	mov	r2, #1
	ldr	r1, [sl, r3]
	mov	r0, #2
	bl	CreateIOServer(PLT)
	ldr	r2, .L4+36
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L4+40
	mov	r2, #3
	ldr	r1, [sl, r3]
	mov	r0, #2
	bl	CreateIOServer(PLT)
	ldr	r2, .L4+44
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L4+48
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L4+52
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	NameServerTask(GOT)
	.word	clockServer(GOT)
	.word	idleTask(GOT)
	.word	UART1_ReceiveServer(GOT)
	.word	.LC0(GOTOFF)
	.word	UART2_ReceiveServer(GOT)
	.word	.LC1(GOTOFF)
	.word	UART1_SendServer(GOT)
	.word	.LC2(GOTOFF)
	.word	UART2_SendServer(GOT)
	.word	.LC3(GOTOFF)
	.word	commandServer(GOT)
	.word	displayServer(GOT)
	.size	FirstUserTask, .-FirstUserTask
	.align	2
	.global	nameServerInit
	.type	nameServerInit, %function
nameServerInit:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	sub	sp, sp, #4
	mov	r4, r0
	bl	MyTid(PLT)
	str	r0, [sp, #0]
	ldr	r3, [sp, #0]
	mov	r0, #1
	str	r3, [r4, #0]
	add	sp, sp, #4
	ldmfd	sp!, {r4, pc}
	.size	nameServerInit, .-nameServerInit
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Failed NameServer initialization.\012\015\000"
	.text
	.align	2
	.global	nameServerRun
	.type	nameServerRun, %function
nameServerRun:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L11
	sub	sp, sp, #4
.L10:
	add	sl, pc, sl
	mov	r0, sp
	bl	nameServerInit(PLT)
	ldr	r2, .L11+4
	mov	r1, #1
	add	r2, sl, r2
	bl	bwassert(PLT)
	mov	r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {sl, pc}
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	.LC4(GOTOFF)
	.size	nameServerRun, .-nameServerRun
	.section	.rodata.str1.4
	.align	2
.LC5:
	.ascii	"01\000"
	.align	2
.LC7:
	.ascii	"10\000"
	.align	2
.LC8:
	.ascii	"DO NOT SEND TO NAME SERVER\000"
	.align	2
.LC6:
	.ascii	"1\000"
	.text
	.align	2
	.global	NameServerTask
	.type	NameServerTask, %function
NameServerTask:
	@ args = 0, pretend = 0, frame = 9584
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #9536
	sub	sp, sp, #48
	ldr	sl, .L39
	add	r8, sp, #48
	sub	r8, r8, #28
.L36:
	add	sl, pc, sl
	mov	r0, r8
	bl	initDictionary(PLT)
	ldr	r1, .L39+4
	ldr	r2, .L39+8
	ldr	r3, .L39+12
	add	ip, sp, #9536
	add	lr, sp, #9536
	add	r5, sp, #9536
	add	r7, sp, #9472
	add	r6, sp, #9536
	add	ip, ip, #4
	add	lr, lr, #24
	add	fp, sp, #9536
	ldr	r9, .L39+16
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp, #0]
	add	r5, r5, #36
	add	r7, r7, #48
	add	r6, r6, #43
	str	ip, [sp, #16]
	str	lr, [sp, #12]
	add	fp, fp, #46
.L37:
	add	r3, sp, #8192
	mov	r4, #0
	str	r4, [r3, #1380]
	mov	r0, r5
	mov	r1, r7
	mov	r2, #20
	bl	Receive(PLT)
	add	ip, sp, #8192
	str	r0, [ip, #1376]
	ldr	r3, [ip, #1376]
	cmp	r3, #3
	ble	.L15
	add	lr, sp, #9472
	ldrb	r3, [lr, #48]	@ zero_extendqisi2
	ldrb	r2, [lr, #49]	@ zero_extendqisi2
	strb	r3, [lr, #107]
	strb	r2, [lr, #108]
	strb	r4, [lr, #109]
	str	r4, [ip, #1372]
	str	r4, [ip, #1372]
	ldr	r3, [ip, #1372]
	cmp	r3, #14
	bgt	.L17
.L32:
	add	r1, sp, #8192
	ldr	r2, [r1, #1372]
	add	r3, sp, #9536
	ldr	r1, [r1, #1372]
	add	r3, r3, #48
	add	r0, r3, r2
	add	r3, r3, r1
	ldrb	r2, [r3, #-62]	@ zero_extendqisi2
	add	ip, sp, #8192
	strb	r2, [r0, #-44]
	ldr	r3, [ip, #1372]
	add	r3, r3, #1
	str	r3, [ip, #1372]
	ldr	r2, [ip, #1372]
	cmp	r2, #14
	ble	.L32
.L17:
	mov	r0, r6
	add	r1, sl, r9
	bl	pkstreq_volatile(PLT)
	subs	r4, r0, #0
	beq	.L19
	add	lr, sp, #8192
	mov	r3, #0
	str	r3, [lr, #1368]
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #12]
	str	r3, [lr, #1364]
	mov	r0, r8
	bl	searchDictionary(PLT)
	add	r1, sp, #8192
	str	r0, [r1, #1364]
	ldr	r3, [r1, #1364]
	ldr	ip, [sp, #8]
	cmp	r3, #0
	subeq	r3, r3, #2
	add	r2, sp, #8192
	streq	r3, [r1, #1368]
	ldrh	lr, [sl, ip]
	ldr	r3, [r2, #1368]
	add	ip, sp, #9472
	strh	lr, [ip, #110]	@ movhi
	ldr	r0, [r2, #1380]
	mov	r1, fp
	mov	r2, #2
	strb	r3, [ip, #110]
	bl	Reply(PLT)
	b	.L37
.L19:
	ldr	r2, [sp, #4]
	mov	r0, r6
	add	r1, sl, r2
	bl	pkstreq_volatile(PLT)
	cmp	r0, #0
	beq	.L23
	add	r3, sp, #8192
	ldr	r1, [sp, #16]
	ldr	r2, [r3, #1380]
	mov	r0, r8
	bl	addDictionary(PLT)
	ldr	ip, [sp, #8]
	cmp	r0, #0
	ldrh	lr, [sl, ip]
	addeq	r1, sp, #9472
	add	ip, sp, #9472
	add	r2, sp, #8192
	mvneq	r3, #1
	strh	lr, [ip, #110]	@ movhi
	ldr	r0, [r2, #1380]
	streqb	r3, [r1, #110]
	strneb	r4, [ip, #110]
	mov	r1, fp
	mov	r2, #2
	bl	Reply(PLT)
	b	.L37
.L15:
	ldr	r2, [sp, #0]
	add	lr, sp, #8192
	add	r1, sl, r2
	ldr	r0, [lr, #1380]
	mov	r2, #27
	bl	Reply(PLT)
	b	.L37
.L23:
	ldr	ip, [sp, #0]
	add	r3, sp, #8192
	ldr	r0, [r3, #1380]
	add	r1, sl, ip
	mov	r2, #27
	bl	Reply(PLT)
	b	.L37
.L40:
	.align	2
.L39:
	.word	_GLOBAL_OFFSET_TABLE_-(.L36+8)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC5(GOTOFF)
	.size	NameServerTask, .-NameServerTask
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
	.global	insertIntoStorage
	.type	insertIntoStorage, %function
insertIntoStorage:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r4, r0
	ldr	r0, [r0, #1024]
	sub	sp, sp, #20
	cmp	r0, #127
	mov	r5, r1
	movgt	r0, #0
	bgt	.L46
	mov	r3, #0
	str	r3, [sp, #12]
	str	r0, [sp, #8]
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	sub	r3, r3, #1
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	str	r3, [sp, #4]
	b	.L72
.L48:
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	sub	r3, r3, #1
	add	r3, r3, r3, lsr #31
	mov	r3, r3, asr #1
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	add	r2, r4, r2, asl #3
	ldr	r1, [r2, #4]
	ldr	r3, [r5, #4]
	cmp	r1, r3
	ldrgt	r3, [sp, #4]
	ldrle	r3, [sp, #4]
	addgt	r3, r3, #1
	strgt	r3, [sp, #12]
	strle	r3, [sp, #8]
.L72:
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #8]
	cmp	r2, r3
	bne	.L48
	ldr	r3, [sp, #4]
	cmp	r0, r3
	ble	.L53
.L70:
	ldr	r3, [sp, #4]
	add	r3, r4, r3, asl #3
	ldr	r1, [r3, #4]
	ldr	r2, [r5, #4]
	cmp	r1, r2
	ble	.L53
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r0, r2
	bgt	.L70
.L53:
	cmp	r0, #0
	beq	.L55
	sub	r3, r0, #1
	b	.L71
.L73:
	ldr	r0, [sp, #0]
	ldr	lr, [sp, #0]
	add	r0, r0, #1
	add	r3, r4, lr, asl #3
	ldr	r2, [r3, #4]
	add	ip, r4, r0, asl #3
	str	r2, [sp, #16]
	ldr	r1, [sp, #16]
	ldr	r2, [r4, lr, asl #3]
	str	r1, [ip, #4]
	ldr	r3, [sp, #0]
	str	r2, [r4, r0, asl #3]
	sub	r3, r3, #1
.L71:
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bge	.L73
.L55:
	ldr	r0, [sp, #4]
	ldr	r2, [sp, #4]
	ldr	r3, [r5, #0]
	ldr	r1, [r5, #4]
	add	r2, r4, r2, asl #3
	str	r3, [r4, r0, asl #3]
	str	r1, [r2, #4]
	ldr	r3, [r4, #1024]
	mov	r0, #1
	add	r3, r3, r0
	str	r3, [r4, #1024]
.L46:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, pc}
	.size	insertIntoStorage, .-insertIntoStorage
	.align	2
	.global	deleteFromStorage
	.type	deleteFromStorage, %function
deleteFromStorage:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #1024]
	mov	ip, #0
	cmp	r3, ip
	@ lr needed for prologue
	add	r2, r0, r3, asl #3
	ble	.L77
	ldr	r2, [r2, #-8]
	mov	ip, #1
	str	r2, [r1, #0]
	ldr	r3, [r0, #1024]
	sub	r3, r3, #1
	add	r3, r0, r3, asl #3
	ldr	r2, [r3, #4]
	str	r2, [r1, #4]
	ldr	r3, [r0, #1024]
	sub	r3, r3, #1
	str	r3, [r0, #1024]
.L77:
	mov	r0, ip
	bx	lr
	.size	deleteFromStorage, .-deleteFromStorage
	.align	2
	.global	idleTask
	.type	idleTask, %function
idleTask:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
.L81:
	b	.L81
	.size	idleTask, .-idleTask
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
.L84:
	mov	r0, #0
	bl	AwaitEvent(PLT)
	mov	r1, #0
	mov	r0, r4
	mov	r2, r1
	mov	r3, r6
	str	r5, [sp, #0]
	bl	Send(PLT)
	b	.L84
	.size	clockNotifier, .-clockNotifier
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"clockServer\000"
	.align	2
.LC10:
	.ascii	"Failed to register clockServer.\015\012\000"
	.align	2
.LC11:
	.ascii	"Invalid code received\015\012\000"
	.align	2
.LC12:
	.ascii	"<ClockServer>: Reinsertion error: Could not put bac"
	.ascii	"k TD<%d> into storage.\015\012\000"
	.align	2
.LC13:
	.ascii	"<ClockServer>: Delay overflow error. Could not dela"
	.ascii	"y TD<%d>.\015\012\000"
	.align	2
.LC14:
	.ascii	"<ClockServer>: Delay storage error. Could not put %"
	.ascii	"d into storage.\015\012\000"
	.align	2
.LC15:
	.ascii	"<ClockServer>: Time overflow error. Could not send "
	.ascii	"time to TD<%d>.\015\012\000"
	.align	2
.LC16:
	.ascii	"<ClockServer>: DelayUntil overflow error. Could not"
	.ascii	" delay TD<%d>.\015\012\000"
	.align	2
.LC17:
	.ascii	"<ClockServer>: DelayUntil storage error. Could not "
	.ascii	"put TD<%d> into storage.\015\012\000"
	.align	2
.LC18:
	.ascii	"<ClockServer>: Invalid code: %d.\015\012\000"
	.text
	.align	2
	.global	clockServer
	.type	clockServer, %function
clockServer:
	@ args = 0, pretend = 0, frame = 1152
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L114
	ldr	r0, .L114+4
.L108:
	add	sl, pc, sl
	sub	sp, sp, #1152
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L114+8
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L114+12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	add	fp, sp, #96
	sub	fp, fp, #8
	str	r0, [sp, #84]
	mov	r0, fp
	bl	initStorage(PLT)
	ldr	r2, .L114+16
	ldr	r3, .L114+20
	ldr	r0, .L114+24
	ldr	r1, .L114+28
	ldr	r6, .L114+32
	ldr	r8, .L114+36
	str	r2, [sp, #56]
	str	r3, [sp, #36]
	mov	r2, #0
	mvn	r3, #0
	str	r0, [sp, #48]
	str	r1, [sp, #40]
	str	r6, [sp, #32]
	str	r8, [sp, #28]
	ldr	ip, .L114+40
	ldr	r0, .L114+44
	ldr	r1, .L114+48
	str	r3, [sp, #1148]
	str	r2, [sp, #1144]
	add	r3, sp, #1120
	add	r2, sp, #1136
	add	r6, sp, #1104
	add	r8, sp, #1120
	add	r2, r2, #12
	add	r3, r3, #7
	add	r6, r6, #12
	add	r8, r8, #14
	str	ip, [sp, #24]
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	str	r2, [sp, #8]
	str	r3, [sp, #44]
	str	r6, [sp, #52]
	str	r8, [sp, #12]
.L109:
	ldr	r1, [sp, #44]
	mov	r2, #7
	ldr	r0, [sp, #8]
	bl	Receive(PLT)
	ldr	ip, [sp, #48]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, ip
	bl	bwassert(PLT)
	ldr	r5, [sp, #1148]
	ldr	r0, [sp, #84]
	cmp	r0, r5
	beq	.L110
	ldrb	r3, [sp, #1127]	@ zero_extendqisi2
	str	r3, [sp, #1140]
	ldr	r3, [sp, #1140]
	cmp	r3, #10
	beq	.L96
	blt	.L95
	cmp	r3, #11
	beq	.L97
	cmp	r3, #12
	beq	.L111
.L95:
	ldr	r6, [sp, #16]
	ldr	r3, [sp, #1140]
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, r6
	bl	bwassert(PLT)
	b	.L109
.L110:
	ldr	r3, [sp, #1144]
	add	r3, r3, #1
	str	r3, [sp, #1144]
	b	.L90
.L112:
	ldr	r0, [sp, #1120]
	ldr	r3, [sp, #1144]
	cmp	r0, r3
	bgt	.L103
	ldr	r0, [sp, #1116]
	bl	Reply(PLT)
.L90:
	ldr	r1, [sp, #52]
	mov	r0, fp
	bl	deleteFromStorage(PLT)
	ldr	r2, [sp, #56]
	cmp	r0, #0
	add	r1, sl, r2
	mov	r2, #2
	bne	.L112
	ldr	r3, [sp, #56]
	ldr	r0, [sp, #84]
	add	r1, sl, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L109
.L96:
	ldrb	r0, [sp, #1128]	@ zero_extendqisi2
	ldrb	r3, [sp, #1129]	@ zero_extendqisi2
	ldrb	r1, [sp, #1130]	@ zero_extendqisi2
	rsb	r2, r0, r0, asl #5
	ldrb	ip, [sp, #1131]	@ zero_extendqisi2
	rsb	r2, r2, r2, asl #6
	rsb	lr, r3, r3, asl #5
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
	ldrb	r0, [sp, #1132]	@ zero_extendqisi2
	ldr	r2, [sp, #1144]
	add	r3, r3, r1
	add	r3, r3, r0
	add	r3, r3, r2
	str	r3, [sp, #1120]
	ldr	r0, [sp, #1120]
	ldr	r8, [sp, #36]
	mvn	r0, r0
	mov	r3, r5
	add	r2, sl, r8
	mov	r0, r0, lsr #31
	mov	r1, #1
	str	r5, [sp, #1116]
	bl	bwassert(PLT)
	ldr	r1, [sp, #52]
	mov	r0, fp
	bl	insertIntoStorage(PLT)
	ldr	ip, [sp, #32]
	mov	r1, #1
	add	r2, sl, ip
	ldr	r3, [sp, #1116]
	bl	bwassert(PLT)
	b	.L109
.L103:
	ldr	r1, [sp, #52]
	mov	r0, fp
	bl	insertIntoStorage(PLT)
	ldr	r6, [sp, #40]
	ldr	r3, [sp, #1116]
	add	r2, sl, r6
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, [sp, #56]
	ldr	r0, [sp, #84]
	add	r1, sl, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L109
.L97:
	ldr	r0, [sp, #1144]
	ldr	r1, [sp, #28]
	mvn	r0, r0
	add	r2, sl, r1
	mov	r3, r5
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r2, [sp, #1144]
	ldr	r3, .L114+52
	ldr	lr, [sp, #1144]
	smull	r6, r8, r3, r2
	ldr	r4, [sp, #1144]
	str	r2, [sp, #76]
	ldr	r3, .L114+56
	ldr	r2, .L114+60
	ldr	r1, .L114+64
	smull	r0, ip, r2, lr
	smull	r6, r2, r3, r4
	ldr	r6, [sp, #76]
	ldr	r5, [sp, #1144]
	mov	r6, r6, asr #31
	smull	r3, r0, r1, r5
	rsb	r8, r6, r8, asr #25
	str	r8, [sp, #72]
	ldr	r3, [sp, #1144]
	mov	lr, lr, asr #31
	rsb	lr, lr, ip, asr #18
	ldr	ip, [sp, #72]
	str	r6, [sp, #68]
	mov	r5, r5, asr #31
	smull	r8, r6, r1, r3
	rsb	r5, r5, r0, asr #5
	smull	r0, r8, r1, ip
	ldr	r0, [sp, #72]
	str	r3, [sp, #80]
	mov	r4, r4, asr #31
	rsb	r4, r4, r2, asr #12
	mov	r0, r0, asr #31
	smull	r2, r9, r1, lr
	ldr	r2, [sp, #80]
	str	r6, [sp, #60]
	str	r0, [sp, #4]
	smull	ip, r6, r1, r5
	smull	r3, r7, r1, r4
	mov	ip, r2, asr #31
	mov	r1, lr, asr #31
	ldr	r2, [sp, #4]
	str	r1, [sp, #0]
	rsb	r3, r2, r8, asr #5
	mov	r0, r5, asr #31
	ldr	r8, [sp, #0]
	rsb	r0, r0, r6, asr #5
	ldr	r6, [sp, #60]
	rsb	r2, r8, r9, asr #5
	add	r3, r3, r3, asl #2
	ldr	r8, [sp, #72]
	add	r0, r0, r0, asl #2
	mov	r1, r4, asr #31
	rsb	ip, ip, r6, asr #5
	add	r0, r0, r0, asl #2
	add	r3, r3, r3, asl #2
	sub	r3, r8, r3, asl #2
	sub	r5, r5, r0, asl #2
	rsb	r1, r1, r7, asr #5
	ldr	r0, [sp, #80]
	add	ip, ip, ip, asl #2
	str	r3, [sp, #64]
	add	ip, ip, ip, asl #2
	add	r2, r2, r2, asl #2
	add	r1, r1, r1, asl #2
	sub	r3, r0, ip, asl #2
	add	r2, r2, r2, asl #2
	add	r1, r1, r1, asl #2
	ldr	r6, [sp, #64]
	sub	lr, lr, r2, asl #2
	sub	r4, r4, r1, asl #2
	strb	r3, [sp, #1138]
	ldr	r0, [sp, #1148]
	mov	r3, #0
	ldr	r1, [sp, #12]
	mov	r2, #6
	strb	r6, [sp, #1134]
	strb	lr, [sp, #1135]
	strb	r4, [sp, #1136]
	strb	r5, [sp, #1137]
	strb	r3, [sp, #1139]
	bl	Reply(PLT)
	b	.L109
.L111:
	ldrb	r1, [sp, #1128]	@ zero_extendqisi2
	ldrb	r0, [sp, #1129]	@ zero_extendqisi2
	ldrb	r2, [sp, #1130]	@ zero_extendqisi2
	rsb	r3, r1, r1, asl #5
	rsb	r3, r3, r3, asl #6
	rsb	lr, r0, r0, asl #5
	ldrb	ip, [sp, #1131]	@ zero_extendqisi2
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
	ldrb	r3, [sp, #1132]	@ zero_extendqisi2
	add	r0, r0, r1, asl #8
	add	r0, r0, r2
	add	r0, r0, r3
	str	r0, [sp, #1120]
	ldr	r0, [sp, #1120]
	ldr	r8, [sp, #24]
	mvn	r0, r0
	mov	r3, r5
	add	r2, sl, r8
	mov	r0, r0, lsr #31
	mov	r1, #1
	str	r5, [sp, #1116]
	bl	bwassert(PLT)
	ldr	r2, [sp, #1120]
	ldr	r3, [sp, #1144]
	cmp	r2, r3
	ble	.L113
.L99:
	ldr	r1, [sp, #52]
	mov	r0, fp
	bl	insertIntoStorage(PLT)
	ldr	r3, [sp, #20]
	mov	r1, #1
	add	r2, sl, r3
	ldr	r3, [sp, #1116]
	bl	bwassert(PLT)
	b	.L109
.L113:
	ldr	ip, [sp, #56]
	ldr	r0, [sp, #1148]
	add	r1, sl, ip
	mov	r2, #2
	bl	Reply(PLT)
	b	.L99
.L115:
	.align	2
.L114:
	.word	_GLOBAL_OFFSET_TABLE_-(.L108+8)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	clockNotifier(GOT)
	.word	.LC6(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	1441151881
	.word	1759218605
	.word	1125899907
	.word	1374389535
	.size	clockServer, .-clockServer
	.section	.rodata.str1.4
	.align	2
.LC19:
	.ascii	"<UART1Send_Notifier>: Error with send.\015\012\000"
	.text
	.align	2
	.global	UART1Send_Notifier
	.type	UART1Send_Notifier, %function
UART1Send_Notifier:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L129
	sub	sp, sp, #8
.L126:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r6, r0
	ldr	r0, .L129+4
	ldr	r8, .L129+8
	add	r0, sl, r0
	bl	WhoIs(PLT)
	add	r7, sp, #5
	mov	ip, #3
	mov	r5, r0
	add	r1, sl, r8
	mov	r2, #2
	mov	r0, r6
	mov	r3, r7
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r9, .L129+12
.L127:
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r9
	bl	bwassert(PLT)
.L128:
	mov	r1, #5
	mov	r0, r5
	bl	Delay(PLT)
	mov	r0, #1
	bl	AwaitEvent(PLT)
	ldr	r3, .L129+16
	ldr	ip, [r3, #0]
	tst	ip, #128
	beq	.L128
	tst	ip, #1
	add	r1, sl, r8
	mov	r0, r6
	mov	r2, #2
	mov	r3, r7
	beq	.L128
	ldrb	lr, [sp, #5]	@ zero_extendqisi2
	ldr	ip, .L129+20
	mov	r4, #3
	str	lr, [ip, #0]
	str	r4, [sp, #0]
	bl	Send(PLT)
	b	.L127
.L130:
	.align	2
.L129:
	.word	_GLOBAL_OFFSET_TABLE_-(.L126+8)
	.word	.LC9(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	-2138308584
	.word	-2138308608
	.size	UART1Send_Notifier, .-UART1Send_Notifier
	.align	2
	.global	UART1Receive_Notifier
	.type	UART1Receive_Notifier, %function
UART1Receive_Notifier:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #12
	bl	MyParentTid(PLT)
	add	r7, sp, #9
	mov	r5, r0
	add	r6, sp, #6
.L141:
	mov	r0, #2
	bl	AwaitEvent(PLT)
	ldr	ip, .L142
	mov	r1, r7
	ldr	lr, [ip, #0]
	mov	r2, #2
	tst	lr, #64
	mov	r3, r6
	mov	r0, r5
	beq	.L141
	sub	ip, ip, #24
	ldr	r4, [ip, #0]
	mov	lr, #0
	mov	ip, #3
	strb	lr, [sp, #10]
	strb	r4, [sp, #9]
	str	ip, [sp, #0]
	bl	Send(PLT)
	cmp	r0, #0
	bne	.L141
	bl	Exit(PLT)
	b	.L141
.L143:
	.align	2
.L142:
	.word	-2138308584
	.size	UART1Receive_Notifier, .-UART1Receive_Notifier
	.section	.rodata.str1.4
	.align	2
.LC20:
	.ascii	"<UART2Send_Notifier>: Error with send.\015\012\000"
	.text
	.align	2
	.global	UART2Send_Notifier
	.type	UART2Send_Notifier, %function
UART2Send_Notifier:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L155
	sub	sp, sp, #8
.L153:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	ldr	r7, .L155+4
	add	r6, sp, #5
	mov	ip, #3
	add	r1, sl, r7
	mov	r2, #2
	mov	r3, r6
	mov	r5, r0
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r8, .L155+8
.L154:
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	bl	bwassert(PLT)
.L152:
	mov	r0, #3
	bl	AwaitEvent(PLT)
	ldr	ip, .L155+12
	add	r1, sl, r7
	ldr	lr, [ip, #0]
	mov	r0, r5
	tst	lr, #128
	mov	r2, #2
	mov	r3, r6
	beq	.L152
	ldrb	lr, [sp, #5]	@ zero_extendqisi2
	sub	ip, ip, #24
	str	lr, [ip, #0]
	mov	r4, #3
	str	r4, [sp, #0]
	bl	Send(PLT)
	b	.L154
.L156:
	.align	2
.L155:
	.word	_GLOBAL_OFFSET_TABLE_-(.L153+8)
	.word	.LC6(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	-2138243048
	.size	UART2Send_Notifier, .-UART2Send_Notifier
	.align	2
	.global	UART2Receive_Notifier
	.type	UART2Receive_Notifier, %function
UART2Receive_Notifier:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #12
	bl	MyParentTid(PLT)
	add	r7, sp, #9
	mov	r5, r0
	add	r6, sp, #6
.L167:
	mov	r0, #4
	bl	AwaitEvent(PLT)
	ldr	ip, .L168
	mov	r1, r7
	ldr	lr, [ip, #0]
	mov	r2, #2
	tst	lr, #64
	mov	r3, r6
	mov	r0, r5
	beq	.L167
	sub	ip, ip, #24
	ldr	r4, [ip, #0]
	mov	lr, #0
	mov	ip, #3
	strb	lr, [sp, #10]
	strb	r4, [sp, #9]
	str	ip, [sp, #0]
	bl	Send(PLT)
	cmp	r0, #0
	bne	.L167
	bl	Exit(PLT)
	b	.L167
.L169:
	.align	2
.L168:
	.word	-2138243048
	.size	UART2Receive_Notifier, .-UART2Receive_Notifier
	.section	.rodata.str1.4
	.align	2
.LC21:
	.ascii	"UART1S\000"
	.align	2
.LC22:
	.ascii	"Failed to register Uart1SendServer.\015\012\000"
	.align	2
.LC23:
	.ascii	"<UART1SendServer>: Receive error.\015\012\000"
	.align	2
.LC24:
	.ascii	"<UART1SendServer>: Buffer full. Could not add %c[%d"
	.ascii	"]\015\012\000"
	.align	2
.LC25:
	.ascii	"<Uart1SendServer>: Illegal request code from userTa"
	.ascii	"sk <%d>.\015\012\000"
	.text
	.align	2
	.global	UART1_SendServer
	.type	UART1_SendServer, %function
UART1_SendServer:
	@ args = 0, pretend = 0, frame = 16444
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L198
	ldr	r0, .L198+4
.L192:
	add	sl, pc, sl
	sub	sp, sp, #16384
	sub	sp, sp, #64
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L198+8
	add	r8, sp, #64
	add	r2, sl, r2
	mov	r1, #1
	rsbs	r0, r0, #1
	movcc	r0, #0
	sub	r8, r8, #48
	bl	bwassert(PLT)
	mov	r0, r8
	bl	circularBufferInit(PLT)
	ldr	r3, .L198+12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L198+16
	add	ip, sp, #16384
	mvn	r1, #0
	mov	r2, #0
	str	r3, [sp, #8]
	mov	r3, #1
	str	r0, [ip, #60]
	str	r1, [ip, #44]
	str	r2, [ip, #56]
	add	lr, sp, #16384
	str	r3, [ip, #52]
	str	r1, [ip, #48]
	add	r1, sp, #16384
	add	r5, sp, #16384
	add	r6, sp, #16384
	add	lr, lr, #40
	add	r1, r1, #34
	ldr	r7, .L198+20
	ldr	r9, .L198+24
	ldr	fp, .L198+28
	str	r2, [ip, #40]
	add	r5, r5, #44
	add	r6, r6, #27
	str	lr, [sp, #12]
	str	r1, [sp, #4]
.L193:
	mov	r1, r6
	mov	r2, #7
	mov	r0, r5
	bl	Receive(PLT)
	mvn	r0, r0
	add	r2, sl, r7
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	add	r3, sp, #16384
	ldr	r2, [r3, #44]
	ldr	r3, [r3, #60]
	cmp	r2, r3
	beq	.L194
	add	ip, sp, #16384
	ldrb	r3, [ip, #27]	@ zero_extendqisi2
	cmp	r3, #11
	beq	.L179
	cmp	r3, #81
	beq	.L195
	mov	r3, r2
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, fp
	bl	bwassert(PLT)
	b	.L193
.L195:
	sub	r3, r3, #81
	str	r2, [ip, #48]
	str	r3, [ip, #52]
	ldr	r2, [ip, #56]
	cmp	r2, r3
	beq	.L179
	ldr	r0, [ip, #48]
	add	r1, sl, r9
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
.L179:
	add	lr, sp, #16384
	ldr	r3, [lr, #52]
	cmp	r3, #0
	beq	.L193
	mov	r1, r8
	ldrb	r0, [lr, #28]	@ zero_extendqisi2
	bl	addToBuffer(PLT)
	add	r1, sp, #16384
	ldrb	ip, [r1, #28]	@ zero_extendqisi2
	ldr	lr, [sp, #8]
	mov	r1, #1
	mov	r3, ip
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	add	r1, sp, #16384
	ldr	r3, [r1, #56]
	cmp	r3, #0
	bne	.L196
.L183:
	add	r1, sp, #16384
	ldr	r0, [r1, #44]
	mov	r2, #2
	add	r1, sl, r9
	bl	Reply(PLT)
	b	.L193
.L194:
	ldr	r0, [sp, #12]
	mov	r1, r8
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	bne	.L197
	mov	r3, #1
	add	r1, sp, #16384
	str	r3, [r1, #56]
	ldr	r2, [r1, #52]
	cmp	r2, r3
	beq	.L176
	ldr	r0, [r1, #48]
	mov	r2, #2
	add	r1, sl, r9
	bl	Reply(PLT)
	bl	Exit(PLT)
.L176:
	mov	r3, #0
	add	r2, sp, #16384
	str	r3, [r2, #40]
	b	.L193
.L197:
	add	ip, sp, #16384
	ldr	r3, [ip, #40]
	ldr	r1, [sp, #4]
	add	lr, sp, #16384
	strb	r3, [ip, #34]
	ldr	r0, [ip, #60]
	mov	ip, #0
	mov	r2, #2
	strb	ip, [lr, #35]
	bl	Reply(PLT)
	b	.L176
.L196:
	ldr	r0, [sp, #12]
	mov	r1, r8
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	beq	.L183
	add	ip, sp, #16384
	ldr	r3, [ip, #40]
	add	r2, sp, #16384
	mov	r4, #0
	ldr	r1, [sp, #4]
	ldr	r0, [r2, #60]
	strb	r3, [ip, #34]
	mov	r2, #2
	strb	r4, [ip, #35]
	bl	Reply(PLT)
	add	lr, sp, #16384
	str	r4, [lr, #56]
	b	.L183
.L199:
	.align	2
.L198:
	.word	_GLOBAL_OFFSET_TABLE_-(.L192+8)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	UART1Send_Notifier(GOT)
	.word	.LC24(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC25(GOTOFF)
	.size	UART1_SendServer, .-UART1_SendServer
	.section	.rodata.str1.4
	.align	2
.LC26:
	.ascii	"UART2S\000"
	.align	2
.LC27:
	.ascii	"Failed to register Uart2SendServer.\015\012\000"
	.align	2
.LC28:
	.ascii	"<UART2SendServer>: Receive error.\015\012\000"
	.align	2
.LC29:
	.ascii	"<UART2Server>: Buffer full. Could not add %c[%d]\015"
	.ascii	"\012\000"
	.align	2
.LC30:
	.ascii	"<Uart2SendServer>: Illegal request code from userTa"
	.ascii	"sk <%d>.\015\012\000"
	.text
	.align	2
	.global	UART2_SendServer
	.type	UART2_SendServer, %function
UART2_SendServer:
	@ args = 0, pretend = 0, frame = 16444
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L229
	ldr	r0, .L229+4
.L223:
	add	sl, pc, sl
	sub	sp, sp, #16384
	sub	sp, sp, #64
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L229+8
	add	fp, sp, #64
	add	r2, sl, r2
	mov	r1, #1
	rsbs	r0, r0, #1
	movcc	r0, #0
	sub	fp, fp, #48
	bl	bwassert(PLT)
	mov	r0, fp
	bl	circularBufferInit(PLT)
	ldr	r3, .L229+12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L229+16
	add	ip, sp, #16384
	mvn	r1, #0
	mov	r2, #0
	str	r3, [sp, #4]
	mov	r3, #1
	str	r0, [ip, #60]
	str	r1, [ip, #44]
	str	r2, [ip, #56]
	add	lr, sp, #16384
	str	r3, [ip, #52]
	str	r1, [ip, #48]
	add	r1, sp, #16384
	add	r6, sp, #16384
	add	r5, sp, #16384
	add	lr, lr, #40
	add	r1, r1, #34
	ldr	r7, .L229+20
	ldr	r8, .L229+24
	ldr	r9, .L229+28
	str	r2, [ip, #40]
	add	r6, r6, #44
	add	r5, r5, #27
	str	lr, [sp, #12]
	str	r1, [sp, #8]
.L224:
	mov	r1, r5
	mov	r2, #7
	mov	r0, r6
	bl	Receive(PLT)
	mvn	r0, r0
	add	r2, sl, r7
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	add	r3, sp, #16384
	ldr	r2, [r3, #44]
	ldr	r3, [r3, #60]
	cmp	r2, r3
	beq	.L225
	add	ip, sp, #16384
	ldrb	r3, [ip, #27]	@ zero_extendqisi2
	cmp	r3, #21
	beq	.L209
	cmp	r3, #81
	beq	.L226
	mov	r3, r2
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, r9
	bl	bwassert(PLT)
	b	.L224
.L226:
	sub	r3, r3, #81
	str	r2, [ip, #48]
	str	r3, [ip, #52]
	ldr	r2, [ip, #56]
	cmp	r2, r3
	beq	.L209
	ldr	r0, [ip, #48]
	add	r1, sl, r8
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
.L209:
	add	lr, sp, #16384
	ldr	r3, [lr, #52]
	cmp	r3, #0
	beq	.L224
	ldrb	r0, [lr, #28]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L227
.L213:
	add	r1, sp, #16384
	ldr	r0, [r1, #44]
	mov	r2, #2
	add	r1, sl, r8
	bl	Reply(PLT)
	b	.L224
.L225:
	ldr	r0, [sp, #12]
	mov	r1, fp
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	bne	.L228
	mov	r3, #1
	add	r1, sp, #16384
	str	r3, [r1, #56]
	ldr	r2, [r1, #52]
	cmp	r2, r3
	beq	.L206
	ldr	r0, [r1, #48]
	mov	r2, #2
	add	r1, sl, r8
	bl	Reply(PLT)
	bl	Exit(PLT)
.L206:
	mov	r3, #0
	add	r2, sp, #16384
	str	r3, [r2, #40]
	b	.L224
.L227:
	mov	r1, fp
	bl	addToBuffer(PLT)
	add	r1, sp, #16384
	ldrb	ip, [r1, #28]	@ zero_extendqisi2
	ldr	lr, [sp, #4]
	mov	r1, #1
	mov	r3, ip
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	add	r1, sp, #16384
	ldr	r3, [r1, #56]
	cmp	r3, #0
	beq	.L213
	ldr	r0, [sp, #12]
	mov	r1, fp
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	beq	.L213
	add	ip, sp, #16384
	ldr	r3, [ip, #40]
	add	r2, sp, #16384
	mov	r4, #0
	ldr	r1, [sp, #8]
	ldr	r0, [r2, #60]
	strb	r3, [ip, #34]
	mov	r2, #2
	strb	r4, [ip, #35]
	bl	Reply(PLT)
	add	lr, sp, #16384
	str	r4, [lr, #56]
	b	.L213
.L228:
	add	ip, sp, #16384
	ldr	r3, [ip, #40]
	ldr	r1, [sp, #8]
	add	lr, sp, #16384
	strb	r3, [ip, #34]
	ldr	r0, [ip, #60]
	mov	ip, #0
	mov	r2, #2
	strb	ip, [lr, #35]
	bl	Reply(PLT)
	b	.L206
.L230:
	.align	2
.L229:
	.word	_GLOBAL_OFFSET_TABLE_-(.L223+8)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	UART2Send_Notifier(GOT)
	.word	.LC29(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC30(GOTOFF)
	.size	UART2_SendServer, .-UART2_SendServer
	.section	.rodata.str1.4
	.align	2
.LC31:
	.ascii	"UART2R\000"
	.align	2
.LC32:
	.ascii	"Failed to register UART2ReceiveServer.\015\012\000"
	.align	2
.LC33:
	.ascii	"<UART2ReceiveServer>: Receive error.\015\012\000"
	.align	2
.LC34:
	.ascii	"<UART2ReceiveServer>: UART2_receiveTIDQ Buffer full"
	.ascii	". Cannot add <%d>.\015\012\000"
	.align	2
.LC35:
	.ascii	"<UART2ReceiveServer>: Illegal request code from use"
	.ascii	"rTask <%d>.\015\012\000"
	.text
	.align	2
	.global	UART2_ReceiveServer
	.type	UART2_ReceiveServer, %function
UART2_ReceiveServer:
	@ args = 0, pretend = 0, frame = 16428
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L252
	ldr	r0, .L252+4
.L247:
	add	sl, pc, sl
	sub	sp, sp, #16384
	sub	sp, sp, #44
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L252+8
	add	r4, sp, #44
	add	r2, sl, r2
	mov	r1, #1
	rsbs	r0, r0, #1
	movcc	r0, #0
	sub	r4, r4, #36
	bl	bwassert(PLT)
	mov	r0, r4
	bl	circularBufferInit(PLT)
	ldr	r3, .L252+12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L252+16
	add	ip, sp, #16384
	str	r2, [sp, #4]
	add	r2, sp, #16384
	mvn	r3, #0
	add	r7, sp, #16384
	add	r6, sp, #16384
	add	r5, sp, #16384
	add	r2, r2, #26
	ldr	r8, .L252+20
	ldr	fp, .L252+24
	ldr	r9, .L252+28
	str	r0, [ip, #40]
	str	r3, [ip, #32]
	str	r3, [ip, #36]
	add	r7, r7, #36
	add	r6, r6, #19
	add	r5, r5, #32
	str	r2, [sp, #0]
.L248:
	mov	r1, r6
	mov	r2, #7
	mov	r0, r7
	bl	Receive(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	bl	bwassert(PLT)
	add	r3, sp, #16384
	ldr	ip, [r3, #36]
	ldr	r3, [r3, #40]
	mov	r1, r4
	cmp	ip, r3
	mov	r0, r5
	beq	.L249
	add	r2, sp, #16384
	ldrb	lr, [r2, #19]	@ zero_extendqisi2
	mov	r0, ip
	cmp	lr, #20
	mov	r1, r4
	beq	.L238
	cmp	lr, #81
	mov	r3, ip
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, r9
	beq	.L250
	bl	bwassert(PLT)
	b	.L248
.L238:
	bl	addToBuffer(PLT)
	ldr	r3, [sp, #4]
	add	ip, sp, #16384
	add	r2, sl, r3
	mov	r1, #1
	ldr	r3, [ip, #36]
	bl	bwassert(PLT)
	b	.L248
.L250:
	mov	r0, ip
	add	r1, sl, fp
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
	b	.L248
.L249:
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	ldr	r1, [sp, #0]
	mov	r2, #2
	bne	.L251
.L235:
	add	r2, sp, #16384
	mvn	r3, #0
	add	ip, sp, #16384
	ldr	r0, [r2, #40]
	add	r1, sl, fp
	mov	r2, #2
	str	r3, [ip, #32]
	bl	Reply(PLT)
	b	.L248
.L251:
	add	r3, sp, #16384
	ldrb	ip, [r3, #19]	@ zero_extendqisi2
	ldr	r0, [r3, #32]
	strb	ip, [r3, #26]
	mov	r3, #0
	add	ip, sp, #16384
	strb	r3, [ip, #27]
	bl	Reply(PLT)
	b	.L235
.L253:
	.align	2
.L252:
	.word	_GLOBAL_OFFSET_TABLE_-(.L247+8)
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	UART2Receive_Notifier(GOT)
	.word	.LC34(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC35(GOTOFF)
	.size	UART2_ReceiveServer, .-UART2_ReceiveServer
	.section	.rodata.str1.4
	.align	2
.LC36:
	.ascii	"UART1R\000"
	.align	2
.LC37:
	.ascii	"Failed to register UART1ReceiveServer.\015\012\000"
	.align	2
.LC38:
	.ascii	"<UART1ReceiveServer>: Receive error.\015\012\000"
	.align	2
.LC39:
	.ascii	"<UART1ReceiveServer>: UART1_receiveTIDQ Buffer full"
	.ascii	". Cannot add <%d>.\015\012\000"
	.align	2
.LC40:
	.ascii	"<UART1ReceiveServer>: Illegal request code from use"
	.ascii	"rTask <%d> :%d.\015\012\000"
	.text
	.align	2
	.global	UART1_ReceiveServer
	.type	UART1_ReceiveServer, %function
UART1_ReceiveServer:
	@ args = 0, pretend = 0, frame = 16428
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L275
	ldr	r0, .L275+4
.L270:
	add	sl, pc, sl
	sub	sp, sp, #16384
	sub	sp, sp, #48
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L275+8
	add	r4, sp, #48
	add	r2, sl, r2
	mov	r1, #1
	rsbs	r0, r0, #1
	movcc	r0, #0
	sub	r4, r4, #36
	bl	bwassert(PLT)
	mov	r0, r4
	bl	circularBufferInit(PLT)
	ldr	r3, .L275+12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L275+16
	add	ip, sp, #16384
	str	r2, [sp, #8]
	add	r2, sp, #16384
	mvn	r3, #0
	add	r7, sp, #16384
	add	r6, sp, #16384
	add	r5, sp, #16384
	add	r2, r2, #30
	ldr	r8, .L275+20
	ldr	fp, .L275+24
	ldr	r9, .L275+28
	str	r0, [ip, #44]
	str	r3, [ip, #36]
	str	r3, [ip, #40]
	add	r7, r7, #40
	add	r6, r6, #23
	add	r5, r5, #36
	str	r2, [sp, #4]
.L271:
	mov	r1, r6
	mov	r2, #7
	mov	r0, r7
	bl	Receive(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	bl	bwassert(PLT)
	add	r3, sp, #16384
	ldr	lr, [r3, #40]
	ldr	r3, [r3, #44]
	mov	r1, r4
	cmp	lr, r3
	mov	r0, r5
	beq	.L272
	add	r2, sp, #16384
	ldrb	ip, [r2, #23]	@ zero_extendqisi2
	mov	r0, lr
	cmp	ip, #10
	mov	r1, r4
	beq	.L261
	cmp	ip, #81
	mov	r3, lr
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, r9
	beq	.L273
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	b	.L271
.L261:
	bl	addToBuffer(PLT)
	ldr	r3, [sp, #8]
	add	ip, sp, #16384
	add	r2, sl, r3
	mov	r1, #1
	ldr	r3, [ip, #40]
	bl	bwassert(PLT)
	b	.L271
.L273:
	mov	r0, lr
	add	r1, sl, fp
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
	b	.L271
.L272:
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	ldr	r1, [sp, #4]
	mov	r2, #2
	bne	.L274
.L258:
	add	r2, sp, #16384
	mvn	r3, #0
	add	ip, sp, #16384
	ldr	r0, [r2, #44]
	add	r1, sl, fp
	mov	r2, #2
	str	r3, [ip, #36]
	bl	Reply(PLT)
	b	.L271
.L274:
	add	r3, sp, #16384
	ldrb	ip, [r3, #23]	@ zero_extendqisi2
	ldr	r0, [r3, #36]
	strb	ip, [r3, #30]
	mov	r3, #0
	add	ip, sp, #16384
	strb	r3, [ip, #31]
	bl	Reply(PLT)
	b	.L258
.L276:
	.align	2
.L275:
	.word	_GLOBAL_OFFSET_TABLE_-(.L270+8)
	.word	.LC36(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	UART1Receive_Notifier(GOT)
	.word	.LC39(GOTOFF)
	.word	.LC38(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC40(GOTOFF)
	.size	UART1_ReceiveServer, .-UART1_ReceiveServer
	.section	.rodata.str1.4
	.align	2
.LC41:
	.ascii	"trainServer\000"
	.align	2
.LC42:
	.ascii	"Failed to register trainServer.\015\012\000"
	.align	2
.LC43:
	.ascii	"commandServer\000"
	.align	2
.LC44:
	.ascii	"displayServer\000"
	.align	2
.LC45:
	.ascii	"<trainServer>: Error sending message to CommandServ"
	.ascii	"er.\015\012\000"
	.align	2
.LC46:
	.ascii	"<update switchs>: Displaying switches failed.\000"
	.align	2
.LC47:
	.ascii	"<trainServer>: Receive error.\015\012\000"
	.align	2
.LC48:
	.ascii	"<trainServer>: Illegal request code from userTask <"
	.ascii	"%d>:[%s].\015\012\000"
	.text
	.align	2
	.global	trainServer
	.type	trainServer, %function
trainServer:
	@ args = 0, pretend = 0, frame = 520
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L322
	ldr	r0, .L322+4
.L318:
	add	sl, pc, sl
	sub	sp, sp, #524
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L322+8
	mov	r4, #0
	add	r2, sl, r2
	mov	r1, #1
	cmp	r0, r4
	movne	r0, #0
	moveq	r0, #1
	bl	bwassert(PLT)
	ldr	r0, .L322+12
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	r7, r0
	ldr	r0, .L322+16
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	r5, r0
	ldr	r0, .L322+20
	mvn	r3, #0
	add	r0, sl, r0
	str	r3, [sp, #512]
	str	r4, [sp, #504]
	bl	WhoIs(PLT)
	str	r4, [sp, #504]
	ldr	r3, [sp, #504]
	mov	r6, r0
	cmp	r3, #79
	ble	.L321
	ldr	r2, .L322+24
	add	ip, sp, #516
	add	r3, sp, #440
	add	ip, ip, #3
	add	r0, sp, #508
	ldr	fp, .L322+28
	str	r2, [sp, #28]
	str	r3, [sp, #8]
	str	ip, [sp, #16]
	str	r0, [sp, #24]
.L278:
	mov	r0, r5
	mov	r1, #436
	bl	Delay(PLT)
	mov	r4, #1
	mov	ip, #2
	ldr	r3, [sp, #16]
	mov	r5, #0
	ldr	r1, [sp, #24]
	mov	r2, #4
	strb	ip, [sp, #508]
	mov	r0, r6
	add	ip, ip, r4
	str	ip, [sp, #0]
	strb	r5, [sp, #511]
	strb	r4, [sp, #509]
	strb	r5, [sp, #510]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, r4
	add	r2, sl, fp
	bl	bwassert(PLT)
	str	r4, [sp, #504]
	ldr	r3, [sp, #504]
	cmp	r3, #18
	addgt	r0, sp, #352
	strgt	r0, [sp, #4]
	bgt	.L280
	add	r1, sp, #352
	str	r1, [sp, #4]
.L281:
	ldr	r2, [sp, #504]
	add	r3, sp, #524
	ldr	r0, [sp, #504]
	add	r1, r3, r2, asl #2
	add	ip, sp, #524
	mov	r3, #67
	str	r3, [r1, #-176]
	add	r2, ip, r0, asl #2
	ldr	lr, [r2, #-176]
	ldr	r4, [sp, #504]
	cmp	lr, #83
	mov	ip, #83
	movne	lr, #34
	moveq	lr, #33
	ldr	r3, [sp, #16]
	ldr	r1, [sp, #8]
	mov	r2, #8
	strb	ip, [sp, #440]
	strb	r4, [sp, #442]
	sub	ip, ip, #83
	mov	r0, r7
	mov	r4, #3
	strb	lr, [sp, #441]
	strb	ip, [sp, #443]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r1, [sp, #28]
	mvn	r0, r0
	add	r2, sl, r1
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r0, [sp, #504]
	ldr	r2, [sp, #504]
	add	ip, sp, #524
	add	r3, ip, r2, asl #2
	ldr	r1, [r3, #-176]
	ldr	r2, [sp, #4]
	bl	update_switch(PLT)
	ldr	r3, [sp, #504]
	add	r3, r3, #1
	str	r3, [sp, #504]
	ldr	r2, [sp, #504]
	cmp	r2, #18
	ble	.L281
.L280:
	mov	r3, #153
	str	r3, [sp, #504]
	ldr	r2, [sp, #504]
	cmp	r2, #156
	bgt	.L285
.L312:
	ldr	r2, [sp, #504]
	ldr	r3, [sp, #504]
	add	ip, sp, #524
	ldr	r0, [sp, #504]
	tst	r3, #1
	moveq	r1, #83
	movne	r1, #67
	add	r3, ip, r2, asl #2
	str	r1, [r3, #-712]
	add	r2, ip, r0, asl #2
	ldr	lr, [r2, #-712]
	ldr	r4, [sp, #504]
	cmp	lr, #83
	mov	ip, #83
	movne	lr, #34
	moveq	lr, #33
	ldr	r3, [sp, #16]
	ldr	r1, [sp, #8]
	mov	r2, #8
	strb	ip, [sp, #440]
	strb	r4, [sp, #442]
	sub	ip, ip, #83
	mov	r0, r7
	mov	r4, #3
	strb	lr, [sp, #441]
	strb	ip, [sp, #443]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #28]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r0, [sp, #504]
	ldr	r2, [sp, #504]
	add	ip, sp, #524
	add	r3, ip, r2, asl #2
	ldr	r1, [r3, #-712]
	ldr	r2, [sp, #4]
	bl	update_switch(PLT)
	ldr	r3, [sp, #504]
	add	r3, r3, #1
	str	r3, [sp, #504]
	ldr	r2, [sp, #504]
	cmp	r2, #156
	ble	.L312
.L285:
	mov	lr, #2
	mov	ip, #3
	mov	r4, #0
	ldr	r1, [sp, #24]
	mov	r2, #4
	ldr	r3, [sp, #16]
	mov	r0, r6
	strb	lr, [sp, #509]
	str	ip, [sp, #0]
	strb	lr, [sp, #508]
	strb	r4, [sp, #511]
	strb	r4, [sp, #510]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, fp
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r0, .L322+32
	add	r1, sp, #520
	add	r1, r1, #2
	ldr	fp, .L322+36
	ldr	r8, .L322+40
	str	r0, [sp, #20]
	add	r9, sp, #512
	str	r1, [sp, #12]
.L320:
	ldr	r1, [sp, #24]
	mov	r2, #4
	mov	r0, r9
	bl	Receive(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, fp
	bl	bwassert(PLT)
	ldrb	r3, [sp, #508]	@ zero_extendqisi2
	sub	r3, r3, #76
	cmp	r3, #8
	addls	pc, pc, r3, asl #2
	b	.L294
	.p2align 2
.L299:
	b	.L295
	b	.L294
	b	.L294
	b	.L294
	b	.L294
	b	.L294
	b	.L296
	b	.L297
	b	.L298
.L295:
	ldrb	r4, [sp, #509]	@ zero_extendqisi2
	add	r2, sp, #524
	add	lr, r2, r4, asl #2
	mov	r5, #0
	mov	ip, #76
	str	r5, [lr, #-492]
	ldr	r3, [sp, #16]
	mov	r2, #4
	strb	ip, [sp, #440]
	mov	lr, #16
	sub	ip, ip, #73
	ldr	r1, [sp, #8]
	mov	r0, r7
	strb	lr, [sp, #441]
	strb	r4, [sp, #442]
	strb	r5, [sp, #443]
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #28]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r3
.L319:
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r0, [sp, #512]
	add	r1, sl, r8
	mov	r2, #2
	bl	Reply(PLT)
	b	.L320
.L294:
	ldr	ip, [sp, #20]
	mov	r0, #0
	add	r2, sl, ip
	ldr	ip, [sp, #24]
	ldr	r3, [sp, #512]
	mov	r1, #1
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	b	.L320
.L296:
	ldrb	r4, [sp, #509]	@ zero_extendqisi2
	add	r2, sp, #524
	add	r3, r2, r4, asl #2
	ldrb	r5, [r3, #-492]	@ zero_extendqisi2
	mov	ip, #82
	mov	lr, #3
	mov	r6, #0
	ldr	r1, [sp, #8]
	ldr	r3, [sp, #16]
	mov	r0, r7
	mov	r2, #8
	strb	ip, [sp, #440]
	str	lr, [sp, #0]
	strb	r4, [sp, #441]
	strb	r5, [sp, #442]
	strb	r6, [sp, #443]
	bl	Send(PLT)
	ldr	r3, [sp, #28]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r0, [sp, #512]
	ldr	r1, [sp, #12]
	mov	r2, #2
	strb	r5, [sp, #522]
	strb	r6, [sp, #523]
	bl	Reply(PLT)
	b	.L320
.L297:
	ldrb	r4, [sp, #509]	@ zero_extendqisi2
	ldrb	r5, [sp, #510]	@ zero_extendqisi2
	cmp	r4, #18
	addle	ip, sp, #524
	addgt	r0, sp, #524
	addle	r3, ip, r4, asl #2
	addgt	r3, r0, r4, asl #2
	strle	r5, [r3, #-176]
	strgt	r5, [r3, #-712]
	cmp	r5, #83
	movne	lr, #34
	moveq	lr, #33
	mov	ip, #83
	ldr	r3, [sp, #16]
	ldr	r1, [sp, #8]
	strb	ip, [sp, #440]
	strb	lr, [sp, #441]
	sub	ip, ip, #83
	mov	lr, #3
	mov	r0, r7
	mov	r2, #8
	strb	ip, [sp, #443]
	str	lr, [sp, #0]
	strb	r4, [sp, #442]
	bl	Send(PLT)
	ldr	r1, [sp, #28]
	mvn	r0, r0
	add	r2, sl, r1
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	add	r1, sl, r8
	ldr	r0, [sp, #512]
	mov	r2, #2
	bl	Reply(PLT)
	mov	r0, r4
	mov	r1, r5
	ldr	r2, [sp, #4]
	bl	update_switch(PLT)
	b	.L320
.L298:
	ldrb	r5, [sp, #510]	@ zero_extendqisi2
	ldrb	r4, [sp, #509]	@ zero_extendqisi2
	add	ip, sp, #524
	add	lr, ip, r5, asl #2
	mov	ip, #84
	str	r4, [lr, #-492]
	ldr	r1, [sp, #8]
	mov	r2, #4
	strb	ip, [sp, #440]
	strb	r4, [sp, #441]
	sub	ip, ip, #84
	ldr	r3, [sp, #16]
	mov	r0, r7
	mov	r4, #3
	strb	r5, [sp, #442]
	strb	ip, [sp, #443]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r1, [sp, #28]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r1
	b	.L319
.L321:
	ldr	r0, .L322+24
	add	r2, sp, #516
	add	r1, sp, #440
	add	r2, r2, #3
	add	r3, sp, #508
	ldr	fp, .L322+28
	str	r0, [sp, #28]
	mov	r8, r4
	str	r1, [sp, #8]
	str	r2, [sp, #16]
	str	r3, [sp, #24]
	mov	r9, #3
.L279:
	ldr	r2, [sp, #504]
	add	ip, sp, #524
	ldr	r1, [sp, #504]
	add	r3, ip, r2, asl #2
	str	r8, [r3, #-492]
	add	r2, ip, r1, asl #2
	ldr	lr, [r2, #-492]
	ldr	r4, [sp, #504]
	mov	ip, #84
	ldr	r3, [sp, #16]
	ldr	r1, [sp, #8]
	mov	r2, #4
	mov	r0, r7
	strb	lr, [sp, #441]
	strb	ip, [sp, #440]
	strb	r4, [sp, #442]
	strb	r8, [sp, #443]
	str	r9, [sp, #0]
	bl	Send(PLT)
	ldr	r1, [sp, #28]
	mvn	r0, r0
	add	r2, sl, r1
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r4, [sp, #504]
	ldr	r3, [sp, #16]
	mov	ip, #2
	ldr	r1, [sp, #24]
	mov	r2, #4
	mov	r0, r6
	strb	ip, [sp, #508]
	strb	r4, [sp, #510]
	strb	r8, [sp, #509]
	strb	r8, [sp, #511]
	str	r9, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	add	r2, sl, fp
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r0, r5
	mov	r1, #5
	bl	Delay(PLT)
	ldr	r3, [sp, #504]
	add	r3, r3, #1
	str	r3, [sp, #504]
	ldr	r2, [sp, #504]
	cmp	r2, #79
	ble	.L279
	b	.L278
.L323:
	.align	2
.L322:
	.word	_GLOBAL_OFFSET_TABLE_-(.L318+8)
	.word	.LC41(GOTOFF)
	.word	.LC42(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	.LC45(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC48(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC6(GOTOFF)
	.size	trainServer, .-trainServer
	.section	.rodata.str1.4
	.align	2
.LC49:
	.ascii	"<Grid>: Error with send.\015\012\000"
	.text
	.align	2
	.global	Grid
	.type	Grid, %function
Grid:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L327
	sub	sp, sp, #8
.L326:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	ldr	r1, .L327+4
	mov	ip, #3
	add	r1, sl, r1
	add	r3, sp, #5
	mov	r2, #2
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L327+8
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	bl	Exit(PLT)
	add	sp, sp, #8
	ldmfd	sp!, {sl, pc}
.L328:
	.align	2
.L327:
	.word	_GLOBAL_OFFSET_TABLE_-(.L326+8)
	.word	.LC6(GOTOFF)
	.word	.LC49(GOTOFF)
	.size	Grid, .-Grid
	.section	.rodata.str1.4
	.align	2
.LC50:
	.ascii	"<UserPrompt>: UART2ReceiveServer has not been set u"
	.ascii	"p.\015\012\000"
	.align	2
.LC51:
	.ascii	"<UserPrompt>: could not send prompt response to ser"
	.ascii	"ver. \015\012\000"
	.align	2
.LC52:
	.ascii	"<UserPrompt>: could not send backspace to server. \015"
	.ascii	"\012\000"
	.align	2
.LC53:
	.ascii	"<UserPrompt>: could not send character to server.[%"
	.ascii	"d] \015\012\000"
	.text
	.align	2
	.global	UserPrompt
	.type	UserPrompt, %function
UserPrompt:
	@ args = 0, pretend = 0, frame = 1136
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L353
	sub	sp, sp, #1136
	sub	sp, sp, #4
.L350:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	fp, r0
	ldr	r0, .L353+4
	add	r5, sp, #1056
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L353+8
	mov	r8, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r0, .L353+12
	ldr	r1, .L353+16
	ldr	r3, .L353+20
	str	r0, [sp, #8]
	add	r3, sl, r3
	str	r1, [sp, #4]
	add	r0, sp, #1120
	add	r1, sp, #1120
	mov	r2, #0
	add	r9, sp, #52
	str	r3, [sp, #28]
	add	r5, r5, #8
	mov	r3, #2
	add	ip, sp, #1136
	add	r0, r0, #12
	add	r1, r1, #8
	str	r2, [sp, #32]
	sub	r9, r9, #12
	str	r3, [sp, #36]
	str	r5, [sp, #24]
	str	ip, [sp, #12]
	str	r0, [sp, #16]
	str	r1, [sp, #20]
	strb	r2, [sp, #1139]
.L351:
	mov	r0, r8
	mov	r1, #1
	bl	Getc(PLT)
	strb	r0, [sp, #1139]
	ldrb	r3, [sp, #1139]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L351
	ldr	r5, [sp, #32]
	cmp	r5, #1020
	bge	.L351
	ldrb	r3, [sp, #1139]	@ zero_extendqisi2
	cmp	r3, #13
	beq	.L352
	ldrb	r3, [sp, #1139]	@ zero_extendqisi2
	cmp	r3, #8
	bne	.L340
	ldr	r2, [sp, #36]
	cmp	r2, #2
	ble	.L351
	sub	r2, r2, #1
	ldr	r3, .L353+24
	mov	r5, r2
	str	r2, [sp, #36]
	smull	ip, r2, r3, r5
	mov	lr, r5, asr #31
	rsb	lr, lr, r2, asr #5
	ldr	r0, [sp, #32]
	add	ip, lr, lr, asl #2
	add	r2, sp, #1136
	sub	r0, r0, #1
	add	r2, r2, #4
	add	ip, ip, ip, asl #2
	add	r4, r2, r0
	sub	ip, r5, ip, asl #2
	mov	r5, #0
	str	r0, [sp, #32]
	ldr	r1, [sp, #24]
	ldr	r3, [sp, #12]
	strb	ip, [sp, #1066]
	strb	r5, [r4, #-1100]
	mov	ip, #1
	strb	r5, [sp, #1067]
	mov	r0, fp
	mov	r2, #4
	mov	r5, #3
	strb	ip, [sp, #1064]
	strb	lr, [sp, #1065]
	str	r5, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #8]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, ip
	bl	bwassert(PLT)
	b	.L351
.L340:
	ldr	r0, [sp, #36]
	ldr	r3, .L353+24
	mov	r4, r0, asr #31
	smull	r1, r2, r3, r0
	ldr	r3, [sp, #32]
	rsb	r4, r4, r2, asr #5
	add	r2, sp, #1136
	ldrb	r6, [sp, #1139]	@ zero_extendqisi2
	add	r2, r2, #4
	add	lr, r4, r4, asl #2
	add	r5, r2, r3
	ldrb	r7, [sp, #1139]	@ zero_extendqisi2
	mov	ip, #2
	add	lr, lr, lr, asl #2
	sub	lr, r0, lr, asl #2
	ldr	r1, [sp, #24]
	ldr	r3, [sp, #12]
	mov	r2, #5
	strb	r6, [r5, #-1100]
	strb	ip, [sp, #1064]
	mov	r5, #0
	add	ip, ip, #1
	mov	r0, fp
	str	ip, [sp, #0]
	strb	lr, [sp, #1066]
	strb	r5, [sp, #1068]
	strb	r7, [sp, #1067]
	strb	r4, [sp, #1065]
	bl	Send(PLT)
	ldr	r5, [sp, #4]
	mov	r3, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r5
	bl	bwassert(PLT)
	ldr	ip, [sp, #32]
	ldr	r0, [sp, #36]
	add	ip, ip, #1
	add	r0, r0, #1
	str	ip, [sp, #32]
	str	r0, [sp, #36]
	b	.L351
.L352:
	add	ip, sp, #1136
	add	ip, ip, #4
	add	lr, ip, r5
	mov	r4, #0
	ldr	r3, [sp, #12]
	mov	ip, #20
	ldr	r1, [sp, #24]
	mov	r2, #2
	strb	r4, [lr, #-1100]
	mov	r5, #3
	mov	r0, fp
	strb	ip, [sp, #1064]
	strb	r4, [sp, #1065]
	str	r5, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	ldr	r2, [sp, #28]
	bl	bwassert(PLT)
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #20]
	mov	r0, r9
	bl	parseCommand(PLT)
	ldr	ip, [sp, #1132]
	ldr	lr, [sp, #1128]
	strb	r0, [sp, #1064]
	ldr	r1, [sp, #24]
	mov	r2, #4
	ldr	r3, [sp, #12]
	mov	r0, fp
	strb	ip, [sp, #1065]
	strb	lr, [sp, #1066]
	strb	r4, [sp, #1067]
	str	r5, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	ldr	r2, [sp, #28]
	bl	bwassert(PLT)
	ldr	ip, [sp, #32]
	cmp	ip, r4
	blt	.L336
	mov	r3, r4
	add	r2, ip, #1
	mov	r1, r4
.L338:
	strb	r1, [r3, r9]
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L338
.L336:
	ldrb	r3, [sp, #1064]	@ zero_extendqisi2
	cmp	r3, #10
	movne	r2, #0
	movne	r3, #2
	strne	r2, [sp, #32]
	strne	r3, [sp, #36]
	bne	.L351
	bl	Exit(PLT)
	mov	r0, #0
	mov	r1, #2
	str	r0, [sp, #32]
	str	r1, [sp, #36]
	b	.L351
.L354:
	.align	2
.L353:
	.word	_GLOBAL_OFFSET_TABLE_-(.L350+8)
	.word	.LC31(GOTOFF)
	.word	.LC50(GOTOFF)
	.word	.LC52(GOTOFF)
	.word	.LC53(GOTOFF)
	.word	.LC51(GOTOFF)
	.word	1374389535
	.size	UserPrompt, .-UserPrompt
	.section	.rodata.str1.4
	.align	2
.LC54:
	.ascii	"Failed to register displayServer.\015\012\000"
	.align	2
.LC55:
	.ascii	"<displayGrid>: UART2SendServer has not been set up."
	.ascii	"\015\012\000"
	.align	2
.LC56:
	.ascii	"<displayGrid>: UART2SReceiveServer has not been set"
	.ascii	" up.\015\012\000"
	.align	2
.LC57:
	.ascii	"<displayServer>: Receive error.\015\012\000"
	.align	2
.LC58:
	.ascii	"\033[34;%dH\033[K\000"
	.align	2
.LC59:
	.ascii	"\033[34;%dH%c\000"
	.align	2
.LC60:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KSwitch %d is config"
	.ascii	"ured as %c now.\033[34;1H>\000"
	.align	2
.LC61:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KReversed train %d a"
	.ascii	"t speed %d\033[34;1H>\000"
	.align	2
.LC62:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KUpdated train %d's "
	.ascii	"speed to %d.\033[34;1H>\000"
	.align	2
.LC63:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KSet Train's %d ligh"
	.ascii	"ts on.\033[34;1H>\000"
	.align	2
.LC64:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KPinging Sensors man"
	.ascii	"ually.\033[34;1H>\000"
	.align	2
.LC65:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KExecuting, please w"
	.ascii	"ait.\033[34;1H>\000"
	.align	2
.LC66:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KQuiting Kernel.\033"
	.ascii	"[34;1H>\000"
	.align	2
.LC67:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KIncorrect Command.\033"
	.ascii	"[34;1H>\000"
	.align	2
.LC68:
	.ascii	"\033[s\033[?25l\033[1;10HSensor ping elapse:%dms \033"
	.ascii	"[u\033[?25h\000"
	.align	2
.LC69:
	.ascii	"\033[s\033[?25l\033[%d;13H--->%c%d%d<---\033[u\033["
	.ascii	"?25h\000"
	.align	2
.LC70:
	.ascii	"\033[s\033[?25l\033[%d;13H    \033[%d;20H    \033[u"
	.ascii	"\033[?25h\000"
	.align	2
.LC71:
	.ascii	"\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[KInit"
	.ascii	"ializing Trains %d.\033[34;1H>\033[u\033[?25h\000"
	.align	2
.LC72:
	.ascii	"\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[KInit"
	.ascii	"ializing Switches.\033[34;1H>\033[u\033[?25h\000"
	.align	2
.LC73:
	.ascii	"\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[K\033"
	.ascii	"[34;1H>\033[u\033[?25h\000"
	.align	2
.LC74:
	.ascii	"\033[s\033[?25l\033[%d;11H\033[1m\033[31m%c\033[0m\033"
	.ascii	"[u\033[?25h\000"
	.align	2
.LC75:
	.ascii	"\033[s\033[?25l\033[%d;11H%c\033[u\033[?25h\000"
	.align	2
.LC76:
	.ascii	"\033[s\033[?25l\033[1;125H%d%d:%d%d:%d%d.%d\033[u\033"
	.ascii	"[?25h\000"
	.align	2
.LC77:
	.ascii	"\033[s\033[?25l\033[1;68H%d%% \033[u\033[?25h\000"
	.text
	.align	2
	.global	displayServer
	.type	displayServer, %function
displayServer:
	@ args = 0, pretend = 0, frame = 232
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L420
	ldr	r0, .L420+4
.L408:
	add	sl, pc, sl
	sub	sp, sp, #256
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L420+8
	mov	r1, #1
	add	r2, sl, r2
	rsbs	r0, r0, #1
	movcc	r0, #0
	bl	bwassert(PLT)
	ldr	r0, .L420+12
	mvn	r4, #0
	add	r0, sl, r0
	str	r4, [sp, #148]
	bl	WhoIs(PLT)
	ldr	r2, .L420+16
	str	r0, [sp, #136]
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r0, .L420+20
	ldr	r1, .L420+24
	add	r0, sl, r0
	str	r1, [sp, #52]
	bl	WhoIs(PLT)
	ldr	r2, .L420+28
	str	r0, [sp, #140]
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L420+32
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L420+36
	str	r0, [sp, #144]
	ldr	r1, [sl, r3]
	mov	r0, #4
	bl	Create(PLT)
	ldr	r3, .L420+40
	str	r0, [sp, #156]
	ldr	r1, [sl, r3]
	mov	r0, #4
	bl	Create(PLT)
	ldr	r3, .L420+44
	str	r0, [sp, #160]
	ldr	r1, [sl, r3]
	mov	r0, #4
	bl	Create(PLT)
	str	r0, [sp, #164]
	mov	r0, #0
	str	r4, [sp, #248]
	bl	getTicks4(PLT)
	ldr	r5, .L420+48
	ldr	r2, .L420+52
	ldr	fp, .L420+56
	ldr	ip, .L420+60
	ldr	lr, .L420+64
	ldr	r1, .L420+68
	str	r2, [sp, #32]
	str	r5, [sp, #40]
	ldr	r2, .L420+72
	ldr	r5, .L420+76
	str	fp, [sp, #36]
	str	ip, [sp, #116]
	ldr	fp, .L420+80
	ldr	ip, .L420+84
	str	lr, [sp, #104]
	ldr	lr, .L420+88
	str	r1, [sp, #96]
	ldr	r1, .L420+92
	str	r2, [sp, #88]
	str	r5, [sp, #80]
	ldr	r2, .L420+96
	ldr	r5, .L420+100
	str	fp, [sp, #72]
	str	ip, [sp, #64]
	ldr	fp, .L420+104
	ldr	ip, .L420+108
	str	lr, [sp, #28]
	ldr	lr, .L420+112
	str	r1, [sp, #60]
	ldr	r1, .L420+116
	str	r2, [sp, #56]
	str	r5, [sp, #48]
	ldr	r2, .L420+120
	ldr	r5, .L420+124
	str	fp, [sp, #124]
	str	ip, [sp, #120]
	ldr	fp, .L420+128
	ldr	ip, .L420+132
	str	lr, [sp, #108]
	ldr	lr, .L420+136
	mov	r3, #0
	str	r1, [sp, #100]
	ldr	r1, [sp, #148]
	str	r2, [sp, #44]
	str	r5, [sp, #92]
	str	fp, [sp, #84]
	str	ip, [sp, #76]
	str	lr, [sp, #68]
	str	r3, [sp, #244]
	mov	r9, r3
	mov	r2, #27
	add	r3, r3, #6
	add	r5, sp, #248
	add	fp, sp, #180
	add	ip, sp, #254
	add	lr, sp, #252
	mov	r8, r0
	str	r1, [sp, #152]
	str	r2, [sp, #168]
	str	r3, [sp, #172]
	str	r5, [sp, #132]
	str	fp, [sp, #24]
	str	ip, [sp, #112]
	str	lr, [sp, #128]
.L409:
	ldr	r1, [sp, #24]
	mov	r2, #64
	ldr	r0, [sp, #132]
	bl	Receive(PLT)
	ldr	r3, [sp, #52]
	mov	fp, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r3
	bl	bwassert(PLT)
	ldr	r4, [sp, #248]
	ldr	r5, [sp, #144]
	cmp	r5, r4
	beq	.L410
	ldr	ip, [sp, #148]
	cmp	ip, r4
	beq	.L411
	ldr	lr, [sp, #152]
	cmp	lr, r4
	beq	.L412
	ldr	r5, [sp, #156]
	cmp	r5, r4
	beq	.L413
	ldr	fp, [sp, #164]
	cmp	fp, r4
	beq	.L414
	ldr	r3, [sp, #160]
	cmp	r3, r4
	bne	.L395
	ldrb	r3, [sp, #180]	@ zero_extendqisi2
	cmp	r3, #18
	beq	.L398
	cmp	r3, #19
	beq	.L415
.L397:
	ldr	lr, [sp, #32]
	mov	r0, r4
	add	r1, sl, lr
	mov	r2, #2
	bl	Reply(PLT)
	b	.L409
.L411:
	ldrb	r3, [sp, #180]	@ zero_extendqisi2
	sub	r3, r3, #1
	cmp	r3, #19
	addls	pc, pc, r3, asl #2
	b	.L361
	.p2align 2
.L371:
	b	.L362
	b	.L363
	b	.L361
	b	.L361
	b	.L361
	b	.L361
	b	.L361
	b	.L361
	b	.L361
	b	.L364
	b	.L365
	b	.L366
	b	.L367
	b	.L368
	b	.L369
	b	.L361
	b	.L361
	b	.L361
	b	.L361
	b	.L370
.L362:
	ldrb	r3, [sp, #181]	@ zero_extendqisi2
	ldrb	r2, [sp, #182]	@ zero_extendqisi2
	add	r3, r3, r3, asl #2
	ldr	lr, [sp, #40]
	add	r3, r3, r3, asl #2
	add	r3, r2, r3, asl #2
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, lr
	bl	Printf(PLT)
.L372:
	ldr	ip, [sp, #32]
	ldr	r0, [sp, #248]
	add	r1, sl, ip
	mov	r2, #2
	bl	Reply(PLT)
	b	.L409
.L363:
	ldrb	r3, [sp, #181]	@ zero_extendqisi2
	ldrb	r2, [sp, #182]	@ zero_extendqisi2
	ldr	r5, [sp, #36]
	add	r3, r3, r3, asl #2
	ldrb	ip, [sp, #183]	@ zero_extendqisi2
	add	r3, r3, r3, asl #2
	add	r3, r2, r3, asl #2
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, r5
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L372
.L364:
	ldr	r3, [sp, #64]
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, r3
	bl	Printf(PLT)
	ldr	r5, [sp, #28]
	mov	r0, #0
	ldr	r1, [sl, r5]
	bl	Create(PLT)
	str	r0, [sp, #152]
	b	.L372
.L365:
	ldr	fp, [sp, #116]
	ldrb	ip, [sp, #182]	@ zero_extendqisi2
	ldrb	r3, [sp, #181]	@ zero_extendqisi2
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, fp
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L372
.L366:
	ldr	lr, [sp, #104]
	ldrb	ip, [sp, #182]	@ zero_extendqisi2
	ldrb	r3, [sp, #181]	@ zero_extendqisi2
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L372
.L367:
	ldr	r5, [sp, #96]
	ldrb	ip, [sp, #182]	@ zero_extendqisi2
	ldrb	r3, [sp, #181]	@ zero_extendqisi2
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, r5
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L372
.L368:
	ldr	fp, [sp, #88]
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, fp
	ldrb	r3, [sp, #181]	@ zero_extendqisi2
	bl	Printf(PLT)
	b	.L372
.L369:
	ldr	ip, [sp, #80]
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, ip
	bl	Printf(PLT)
	b	.L372
.L361:
	ldr	fp, [sp, #60]
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, fp
	bl	Printf(PLT)
	b	.L372
.L370:
	ldr	lr, [sp, #72]
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, lr
	bl	Printf(PLT)
	b	.L372
.L413:
	mov	r3, #0
	str	r3, [sp, #244]
	ldr	r2, [sp, #244]
	cmp	r2, fp
	bge	.L377
.L378:
	ldr	r3, [sp, #244]
	ldr	ip, [sp, #172]
	add	lr, sp, #256
	str	ip, [sp, #176]
	add	r2, lr, r3
	ldrb	r1, [r2, #-76]	@ zero_extendqisi2
	mov	r0, #0
	cmp	r9, r1
	beq	.L379
	bl	getTicks4(PLT)
	ldr	r5, [sp, #56]
	rsb	r3, r8, r0
	mov	r1, #1
	ldr	r0, [sp, #136]
	add	r2, sl, r5
	bl	Printf(PLT)
.L379:
	ldr	r3, [sp, #172]
	ldr	ip, [sp, #48]
	mov	r1, #1
	ldr	r9, [sp, #244]
	add	lr, r3, r1
	ldr	r8, [sp, #244]
	add	r2, sl, ip
	ldr	ip, [sp, #244]
	ldr	r5, [sp, #244]
	str	lr, [sp, #172]
	add	lr, sp, #256
	add	r6, lr, ip
	add	lr, lr, r5
	ldrb	r4, [lr, #-76]	@ zero_extendqisi2
	ldrb	ip, [r6, #-76]	@ zero_extendqisi2
	sub	r4, r4, #1
	sub	ip, ip, #1
	mov	lr, r4, asr #31
	mov	r5, ip, asr #31
	mov	lr, lr, lsr #28
	mov	r5, r5, lsr #28
	add	r4, r4, lr
	add	ip, ip, r5
	and	r4, r4, #15
	and	ip, ip, #15
	rsb	r4, lr, r4
	rsb	ip, r5, ip
	ldr	r5, .L420+140
	add	r4, r4, r1
	smull	lr, r7, r5, r4
	add	r5, sp, #256
	add	lr, r5, r8
	ldrb	r6, [lr, #-76]	@ zero_extendqisi2
	ldr	lr, .L420+140
	add	ip, ip, r1
	smull	r5, r8, lr, ip
	subs	lr, r6, #1
	mov	r5, r4, asr #31
	addmi	lr, r6, #14
	rsb	r5, r5, r7, asr #2
	add	r5, r5, r5, asl #2
	mov	lr, lr, asr #4
	mov	ip, ip, asr #31
	add	lr, lr, #65
	rsb	ip, ip, r8, asr #2
	sub	r4, r4, r5, asl #1
	add	r5, sp, #256
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	ldr	r0, [sp, #136]
	str	r4, [sp, #8]
	add	r6, r5, r9
	ldrb	r9, [r6, #-76]	@ zero_extendqisi2
	bl	Printf(PLT)
	ldr	ip, [sp, #124]
	ldr	r3, [sp, #168]
	add	r2, sl, ip
	ldr	r0, [sp, #136]
	mov	r1, #1
	str	r3, [sp, #0]
	bl	Printf(PLT)
	mov	r0, #0
	bl	getTicks4(PLT)
	ldr	r3, [sp, #244]
	ldr	lr, [sp, #172]
	add	r3, r3, #1
	str	r3, [sp, #244]
	ldr	r2, [sp, #244]
	cmp	lr, #27
	ldr	r3, [sp, #176]
	movgt	lr, #6
	cmp	fp, r2
	str	lr, [sp, #172]
	str	r3, [sp, #168]
	mov	r8, r0
	bgt	.L378
	ldr	r4, [sp, #248]
.L377:
	ldr	r5, [sp, #32]
	mov	r0, r4
	add	r1, sl, r5
	mov	r2, #2
	bl	Reply(PLT)
	b	.L409
.L410:
	bl	displayGrid(PLT)
	ldr	fp, [sp, #32]
	mov	r0, r4
	add	r1, sl, fp
	mov	r2, #2
	bl	Reply(PLT)
	b	.L409
.L395:
	ldr	r2, [sp, #32]
	mov	r0, r4
	add	r1, sl, r2
	mov	r2, #2
	bl	Reply(PLT)
	b	.L409
.L414:
	ldrb	r1, [sp, #180]	@ zero_extendqisi2
	ldrb	r3, [sp, #182]	@ zero_extendqisi2
	cmp	r1, #2
	add	r2, r3, #6
	beq	.L416
	cmp	r1, #1
	beq	.L417
	ldr	lr, [sp, #84]
	ldrb	ip, [sp, #181]	@ zero_extendqisi2
	mov	r3, r2
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	Printf(PLT)
.L390:
	ldr	r2, [sp, #32]
	ldr	r0, [sp, #248]
	add	r1, sl, r2
	mov	r2, #2
	bl	Reply(PLT)
	b	.L409
.L412:
	mov	r4, #2
	ldrb	ip, [sp, #180]	@ zero_extendqisi2
	mov	r5, #0
	ldr	r1, [sp, #112]
	mov	r2, r4
	ldr	r3, [sp, #128]
	ldr	r0, [sp, #140]
	strb	ip, [sp, #254]
	strb	r5, [sp, #255]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldrb	ip, [sp, #180]	@ zero_extendqisi2
	ldr	r1, [sp, #112]
	mov	r2, r4
	ldr	r3, [sp, #128]
	ldr	r0, [sp, #136]
	strb	ip, [sp, #254]
	strb	r5, [sp, #255]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #32]
	mov	r2, r4
	add	r1, sl, r3
	ldr	r0, [sp, #248]
	bl	Reply(PLT)
	bl	Exit(PLT)
	b	.L409
.L398:
	ldr	fp, [sp, #76]
	ldrb	r4, [sp, #184]	@ zero_extendqisi2
	ldrb	ip, [sp, #182]	@ zero_extendqisi2
	ldrb	lr, [sp, #183]	@ zero_extendqisi2
	ldrb	r5, [sp, #185]	@ zero_extendqisi2
	ldrb	r6, [sp, #186]	@ zero_extendqisi2
	ldrb	r7, [sp, #187]	@ zero_extendqisi2
	ldrb	r3, [sp, #181]	@ zero_extendqisi2
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, fp
	str	r4, [sp, #8]
	stmia	sp, {ip, lr}	@ phole stm
	str	r5, [sp, #12]
	str	r6, [sp, #16]
	str	r7, [sp, #20]
	bl	Printf(PLT)
	ldr	r4, [sp, #248]
	b	.L397
.L416:
	ldrb	r1, [sp, #181]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L418
	cmp	r1, #1
	beq	.L419
	ldr	r3, [sp, #100]
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, r3
	bl	Printf(PLT)
	ldr	r5, [sp, #44]
	mov	r0, #4
	ldr	r1, [sl, r5]
	bl	Create(PLT)
	str	r0, [sp, #148]
	b	.L390
.L415:
	ldr	ip, [sp, #68]
	ldr	r0, [sp, #136]
	mov	r1, #1
	add	r2, sl, ip
	ldrb	r3, [sp, #181]	@ zero_extendqisi2
	bl	Printf(PLT)
	ldr	r4, [sp, #248]
	b	.L397
.L417:
	ldr	fp, [sp, #92]
	ldrb	ip, [sp, #181]	@ zero_extendqisi2
	mov	r3, r2
	ldr	r0, [sp, #136]
	add	r2, sl, fp
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L390
.L418:
	ldr	ip, [sp, #120]
	ldr	r0, [sp, #136]
	add	r1, r1, #1
	add	r2, sl, ip
	bl	Printf(PLT)
	b	.L390
.L419:
	ldr	lr, [sp, #108]
	ldr	r0, [sp, #136]
	add	r2, sl, lr
	bl	Printf(PLT)
	b	.L390
.L421:
	.align	2
.L420:
	.word	_GLOBAL_OFFSET_TABLE_-(.L408+8)
	.word	.LC44(GOTOFF)
	.word	.LC54(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC55(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC57(GOTOFF)
	.word	.LC56(GOTOFF)
	.word	Grid(GOT)
	.word	displaySensors(GOT)
	.word	displayClock(GOT)
	.word	trainServer(GOT)
	.word	.LC58(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC59(GOTOFF)
	.word	.LC60(GOTOFF)
	.word	.LC61(GOTOFF)
	.word	.LC62(GOTOFF)
	.word	.LC63(GOTOFF)
	.word	.LC64(GOTOFF)
	.word	.LC65(GOTOFF)
	.word	.LC66(GOTOFF)
	.word	DeathServer(GOT)
	.word	.LC67(GOTOFF)
	.word	.LC68(GOTOFF)
	.word	.LC69(GOTOFF)
	.word	.LC70(GOTOFF)
	.word	.LC71(GOTOFF)
	.word	.LC72(GOTOFF)
	.word	.LC73(GOTOFF)
	.word	UserPrompt(GOT)
	.word	.LC74(GOTOFF)
	.word	.LC75(GOTOFF)
	.word	.LC76(GOTOFF)
	.word	.LC77(GOTOFF)
	.word	1717986919
	.size	displayServer, .-displayServer
	.section	.rodata.str1.4
	.align	2
.LC78:
	.ascii	"Could not register as command server.\015\012\000"
	.align	2
.LC79:
	.ascii	"<commandServer>: clockServer has not been set up.\015"
	.ascii	"\012\000"
	.align	2
.LC80:
	.ascii	"<commandServer>: UART1 Send IOServer has not been s"
	.ascii	"et up.\015\012\000"
	.align	2
.LC81:
	.ascii	"<commandServer>: UART1 Receive IOServer has not bee"
	.ascii	"n set up.\015\012\000"
	.align	2
.LC82:
	.ascii	"<commandServer>: Receive error.\015\012\000"
	.align	2
.LC83:
	.ascii	"<Command Server>: could not send second part of rev"
	.ascii	"erse to reverse delay server.[%d] \015\012\000"
	.text
	.align	2
	.global	commandServer
	.type	commandServer, %function
commandServer:
	@ args = 0, pretend = 0, frame = 208
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r0, .L436
	sub	sp, sp, #212
	ldr	sl, .L436+4
	str	r0, [sp, #36]
	ldr	r0, .L436+8
.L435:
	add	sl, pc, sl
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L436+12
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L436+16
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	str	r0, [sp, #108]
	ldr	r0, .L436+20
	ldr	r1, .L436+24
	add	r0, sl, r0
	str	r1, [sp, #12]
	bl	WhoIs(PLT)
	str	r0, [sp, #112]
	ldr	r0, .L436+28
	ldr	r2, .L436+32
	add	r0, sl, r0
	str	r2, [sp, #28]
	bl	WhoIs(PLT)
	mov	fp, r0
	ldr	r0, .L436+36
	add	r8, sp, #204
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r3, [sp, #112]
	ldr	r2, .L436+40
	str	r0, [sp, #116]
	mvn	r0, r3
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r2, .L436+44
	mvn	r0, fp
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r4, [sp, #116]
	ldr	r2, .L436+48
	mvn	r0, r4
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r2, #0
	mvn	r3, #0
	add	ip, sp, #126
	add	lr, sp, #190
	add	r0, sp, #210
	str	r3, [sp, #204]
	str	r2, [sp, #200]
	str	r8, [sp, #24]
	str	ip, [sp, #20]
	str	lr, [sp, #32]
	str	r0, [sp, #16]
.L423:
	ldr	r1, [sp, #20]
	mov	r2, #64
	ldr	r0, [sp, #24]
	bl	Receive(PLT)
	ldr	r3, [sp, #36]
	mov	r4, r0
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldrb	r3, [sp, #126]	@ zero_extendqisi2
	sub	r3, r3, #81
	cmp	r3, #33
	addls	pc, pc, r3, asl #2
	b	.L424
	.p2align 2
.L429:
	b	.L425
	b	.L426
	b	.L427
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L424
	b	.L428
.L425:
	mov	r2, #2
	mov	ip, #81
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #16]
	mov	r4, #0
	ldr	r0, [sp, #116]
	strb	ip, [sp, #190]
	str	r2, [sp, #0]
	strb	r4, [sp, #191]
	bl	Send(PLT)
	ldrb	ip, [sp, #126]	@ zero_extendqisi2
	mov	r2, #2
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #16]
	mov	r0, fp
	strb	ip, [sp, #190]
	str	r2, [sp, #0]
	strb	r4, [sp, #191]
	bl	Send(PLT)
	ldr	r8, [sp, #12]
	mov	r2, #2
	add	r1, sl, r8
	ldr	r0, [sp, #204]
	bl	Reply(PLT)
	bl	Exit(PLT)
.L430:
	ldr	r2, [sp, #12]
	ldr	r0, [sp, #204]
	add	r1, sl, r2
	mov	r2, #2
	bl	Reply(PLT)
	b	.L423
.L426:
	mov	r1, #0
	mov	r2, r1
	mov	r0, fp
	bl	Putc(PLT)
	ldrb	r2, [sp, #127]	@ zero_extendqisi2
	mov	r1, #0
	mov	r0, fp
	bl	Putc(PLT)
	ldr	r0, [sp, #112]
	bl	Time(PLT)
	ldrb	ip, [sp, #128]	@ zero_extendqisi2
	ldr	r2, .L436+52
	add	r3, ip, ip, asl #3
	add	r3, ip, r3, asl #1
	add	r6, r0, r3
	ldr	r3, .L436+56
	add	r6, r6, #170
	smull	lr, r0, r3, r6
	ldr	r3, .L436+60
	smull	r1, lr, r2, r6
	smull	r2, r1, r3, r6
	ldr	r2, .L436+64
	str	ip, [sp, #120]
	smull	r3, r4, r2, r6
	ldr	r3, .L436+68
	ldr	r2, .L436+72
	smull	ip, r8, r3, r6
	ldr	ip, .L436+76
	str	r8, [sp, #52]
	smull	r8, r3, r2, r6
	smull	r2, r7, ip, r6
	mov	ip, r6, asr #31
	rsb	lr, ip, lr, asr #18
	rsb	r4, ip, r4, asr #12
	str	lr, [sp, #92]
	str	r4, [sp, #68]
	ldr	lr, .L436+76
	ldr	r4, [sp, #52]
	rsb	r1, ip, r1, asr #13
	rsb	r0, ip, r0, asr #22
	str	r1, [sp, #80]
	rsb	r7, ip, r7, asr #2
	rsb	r4, ip, r4, asr #6
	smull	r1, r8, lr, r0
	rsb	ip, ip, r3, asr #5
	ldr	r3, [sp, #92]
	str	r4, [sp, #56]
	str	r0, [sp, #104]
	smull	r4, r2, lr, r3
	ldr	r0, [sp, #80]
	ldr	r3, [sp, #68]
	str	r8, [sp, #100]
	smull	r1, r8, lr, r0
	str	r2, [sp, #88]
	ldr	r0, [sp, #56]
	smull	r4, r2, lr, r3
	str	r8, [sp, #76]
	smull	r1, r8, lr, r0
	str	r2, [sp, #64]
	smull	r3, r2, lr, ip
	str	r8, [sp, #48]
	ldr	r0, [sp, #92]
	smull	r8, r4, lr, r7
	ldr	r8, [sp, #68]
	ldr	lr, [sp, #104]
	str	r2, [sp, #44]
	mov	r2, r0, asr #31
	mov	r0, r8, asr #31
	ldr	r8, [sp, #100]
	mov	r3, lr, asr #31
	rsb	r3, r3, r8, asr #2
	ldr	r8, [sp, #88]
	str	r4, [sp, #40]
	ldr	r4, [sp, #80]
	rsb	r2, r2, r8, asr #2
	ldr	r8, [sp, #76]
	mov	r1, r4, asr #31
	rsb	r1, r1, r8, asr #2
	ldr	r8, [sp, #64]
	ldr	r4, [sp, #56]
	rsb	r0, r0, r8, asr #2
	ldr	r8, [sp, #48]
	mov	lr, r4, asr #31
	rsb	lr, lr, r8, asr #2
	add	r2, r2, r2, asl #2
	ldr	r8, [sp, #44]
	str	r2, [sp, #4]
	mov	r4, ip, asr #31
	ldr	r2, [sp, #104]
	rsb	r4, r4, r8, asr #2
	add	r3, r3, r3, asl #2
	ldr	r8, [sp, #40]
	sub	r2, r2, r3, asl #1
	mov	r5, r7, asr #31
	rsb	r5, r5, r8, asr #2
	ldrb	r8, [sp, #127]	@ zero_extendqisi2
	str	r2, [sp, #96]
	ldr	r2, [sp, #4]
	ldr	r3, [sp, #92]
	add	r1, r1, r1, asl #2
	sub	r3, r3, r2, asl #1
	str	r3, [sp, #84]
	ldr	r3, [sp, #80]
	add	r4, r4, r4, asl #2
	sub	r1, r3, r1, asl #1
	str	r1, [sp, #72]
	sub	ip, ip, r4, asl #1
	ldr	r1, [sp, #68]
	ldr	r4, [sp, #120]
	strb	r8, [sp, #190]
	add	r0, r0, r0, asl #2
	ldr	r8, [sp, #96]
	sub	r0, r1, r0, asl #1
	strb	r4, [sp, #191]
	ldr	r4, [sp, #84]
	str	r0, [sp, #60]
	ldr	r2, [sp, #56]
	strb	r8, [sp, #192]
	ldr	r8, [sp, #72]
	add	r9, r7, r7, asl #2
	strb	r4, [sp, #193]
	add	r5, r5, r5, asl #2
	ldr	r4, [sp, #60]
	add	lr, lr, lr, asl #2
	sub	lr, r2, lr, asl #1
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #16]
	strb	r8, [sp, #194]
	strb	ip, [sp, #197]
	sub	r6, r6, r9, asl #1
	mov	ip, #2
	sub	r7, r7, r5, asl #1
	ldr	r0, [sp, #108]
	mov	r2, #10
	mov	r8, #0
	strb	lr, [sp, #196]
	strb	r4, [sp, #195]
	strb	r7, [sp, #198]
	strb	r6, [sp, #199]
	strb	r8, [sp, #200]
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	lr, [sp, #28]
	mov	r3, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, lr
	bl	bwassert(PLT)
	b	.L430
.L427:
	ldrb	r2, [sp, #127]	@ zero_extendqisi2
	mov	r0, fp
	mov	r1, #0
	bl	Putc(PLT)
	ldrb	r2, [sp, #128]	@ zero_extendqisi2
	mov	r0, fp
	mov	r1, #0
	bl	Putc(PLT)
	ldr	r0, [sp, #112]
	mov	r1, #15
	bl	Delay(PLT)
	mov	r0, fp
	mov	r1, #0
	mov	r2, #32
	bl	Putc(PLT)
	b	.L430
.L424:
	mov	r3, #1
	str	r3, [sp, #200]
	ldr	r2, [sp, #200]
	sub	r4, r4, #1
	cmp	r4, r2
	ble	.L430
.L433:
	ldr	r2, [sp, #200]
	add	r1, sp, #212
	add	r3, r1, r2
	ldrb	r2, [r3, #-86]	@ zero_extendqisi2
	mov	r0, fp
	mov	r1, #0
	bl	Putc(PLT)
	ldr	r3, [sp, #200]
	add	r3, r3, #1
	str	r3, [sp, #200]
	ldr	r2, [sp, #200]
	cmp	r2, r4
	blt	.L433
	b	.L430
.L428:
	mov	r0, fp
	mov	r1, #0
	mov	r2, #15
	bl	Putc(PLT)
	ldrb	r2, [sp, #127]	@ zero_extendqisi2
	mov	r0, fp
	mov	r1, #0
	bl	Putc(PLT)
	ldrb	r2, [sp, #128]	@ zero_extendqisi2
	mov	r0, fp
	mov	r1, #0
	bl	Putc(PLT)
	mov	r0, fp
	mov	r1, #0
	ldrb	r2, [sp, #127]	@ zero_extendqisi2
	bl	Putc(PLT)
	b	.L430
.L437:
	.align	2
.L436:
	.word	.LC82(GOTOFF)
	.word	_GLOBAL_OFFSET_TABLE_-(.L435+8)
	.word	.LC43(GOTOFF)
	.word	.LC78(GOTOFF)
	.word	commandReverseDelayServer(GOT)
	.word	.LC9(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC83(GOTOFF)
	.word	.LC36(GOTOFF)
	.word	.LC79(GOTOFF)
	.word	.LC80(GOTOFF)
	.word	.LC81(GOTOFF)
	.word	1125899907
	.word	1801439851
	.word	351843721
	.word	1759218605
	.word	274877907
	.word	1374389535
	.word	1717986919
	.size	commandServer, .-commandServer
	.section	.rodata.str1.4
	.align	2
.LC84:
	.ascii	"<commandReverseDelayServer>: clockServer has not be"
	.ascii	"en set up.\015\012\000"
	.align	2
.LC85:
	.ascii	"<commandReverseDelayServer>: Receive error.\015\012"
	.ascii	"\000"
	.align	2
.LC86:
	.ascii	"<commandReverseDelayServer>: Error sending message "
	.ascii	"to CommandServer.\015\012\000"
	.text
	.align	2
	.global	commandReverseDelayServer
	.type	commandReverseDelayServer, %function
commandReverseDelayServer:
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L442
	ldr	r0, .L442+4
.L441:
	add	sl, pc, sl
	ldr	r3, .L442+8
	sub	sp, sp, #108
	add	r0, sl, r0
	str	r3, [sp, #20]
	bl	WhoIs(PLT)
	ldr	r2, .L442+12
	mov	r8, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	bl	MyParentTid(PLT)
	ldr	r3, .L442+16
	mov	r7, r0
	str	r3, [sp, #4]
	ldr	r3, .L442+20
	add	fp, sp, #26
	str	r3, [sp, #16]
	mvn	r3, #0
	str	r3, [sp, #100]
	add	r3, sp, #100
	str	r3, [sp, #8]
	add	r3, sp, #90
	str	r3, [sp, #12]
	add	r9, sp, #105
.L439:
	ldr	r1, [sp, #12]
	ldr	r0, [sp, #8]
	mov	r2, #10
	bl	Receive(PLT)
	ldr	r3, [sp, #20]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldrb	r0, [sp, #92]	@ zero_extendqisi2
	ldrb	r4, [sp, #93]	@ zero_extendqisi2
	ldrb	r2, [sp, #94]	@ zero_extendqisi2
	rsb	r3, r0, r0, asl #5
	rsb	r1, r4, r4, asl #5
	rsb	lr, r2, r2, asl #5
	ldrb	ip, [sp, #95]	@ zero_extendqisi2
	rsb	r3, r3, r3, asl #6
	rsb	r1, r1, r1, asl #6
	add	r2, r2, lr, asl #2
	add	r0, r0, r3, asl #3
	add	r4, r4, r1, asl #3
	add	r0, r0, r0, asl #2
	ldrb	r1, [sp, #96]	@ zero_extendqisi2
	rsb	r3, ip, ip, asl #5
	mov	r4, r4, asl #6
	add	r2, r2, r2, asl #2
	add	r4, r4, r0, asl #7
	add	ip, ip, r3, asl #2
	add	r2, r2, r2, asl #2
	ldrb	r3, [sp, #97]	@ zero_extendqisi2
	add	ip, ip, ip, asl #2
	add	r4, r4, r2, asl #5
	rsb	r2, r1, r1, asl #5
	add	r4, r4, ip, asl #4
	add	r1, r1, r2, asl #2
	add	r3, r3, r3, asl #2
	ldrb	r2, [sp, #98]	@ zero_extendqisi2
	add	r4, r4, r1, asl #3
	add	r3, r3, r3, asl #2
	add	r4, r4, r3, asl #2
	add	r2, r2, r2, asl #2
	ldrb	r3, [sp, #99]	@ zero_extendqisi2
	add	r4, r4, r2, asl #1
	add	r4, r4, r3
	ldr	r3, [sp, #4]
	mov	r2, #2
	add	r1, sl, r3
	ldr	r0, [sp, #100]
	ldrb	r5, [sp, #90]	@ zero_extendqisi2
	ldrb	r6, [sp, #91]	@ zero_extendqisi2
	bl	Reply(PLT)
	mov	r1, r4
	mov	r0, r8
	bl	DelayUntil(PLT)
	mov	ip, #114
	mov	r1, fp
	mov	r3, r9
	strb	ip, [sp, #26]
	mov	r0, r7
	sub	ip, ip, #114
	mov	r2, #4
	mov	r4, #3
	strb	r5, [sp, #27]
	strb	r6, [sp, #28]
	strb	ip, [sp, #29]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #16]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r3
	bl	bwassert(PLT)
	b	.L439
.L443:
	.align	2
.L442:
	.word	_GLOBAL_OFFSET_TABLE_-(.L441+8)
	.word	.LC9(GOTOFF)
	.word	.LC85(GOTOFF)
	.word	.LC84(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC86(GOTOFF)
	.size	commandReverseDelayServer, .-commandReverseDelayServer
	.section	.rodata.str1.4
	.align	2
.LC87:
	.ascii	"<DeathServer>: Error sending message to CommandServ"
	.ascii	"er.\015\012\000"
	.text
	.align	2
	.global	DeathServer
	.type	DeathServer, %function
DeathServer:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L447
	sub	sp, sp, #72
.L446:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r9, r0
	ldr	r0, .L447+4
	add	r8, sp, #5
	add	r6, sp, #69
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	r4, #81
	mov	r3, r6
	mov	r7, #3
	mov	r1, r8
	mov	r2, #4
	strb	r4, [sp, #5]
	strb	r4, [sp, #6]
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	r3, .L447+8
	mvn	r0, r0
	add	r5, sl, r3
	mov	r2, r5
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r1, r8
	mov	r3, r6
	mov	r0, r9
	mov	r2, #4
	strb	r4, [sp, #6]
	str	r7, [sp, #0]
	strb	r4, [sp, #5]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r2, r5
	mov	r1, #1
	bl	bwassert(PLT)
	bl	Quit(PLT)
	add	sp, sp, #72
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L448:
	.align	2
.L447:
	.word	_GLOBAL_OFFSET_TABLE_-(.L446+8)
	.word	.LC43(GOTOFF)
	.word	.LC87(GOTOFF)
	.size	DeathServer, .-DeathServer
	.ident	"GCC: (GNU) 4.0.2"
