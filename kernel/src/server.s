	.file	"server.c"
	.section	.rodata
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
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L4+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	CreateNameServer(PLT)
	mov	r0, #2
	ldr	r3, .L4+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	CreateClockServer(PLT)
	mov	r0, #31
	ldr	r3, .L4+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #2
	ldr	r3, .L4+16
	ldr	r3, [sl, r3]
	mov	r1, r3
	mov	r2, #2
	bl	CreateIOServer(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L4+20
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r0, #2
	ldr	r3, .L4+24
	ldr	r3, [sl, r3]
	mov	r1, r3
	mov	r2, #4
	bl	CreateIOServer(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L4+28
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r0, #2
	ldr	r3, .L4+32
	ldr	r3, [sl, r3]
	mov	r1, r3
	mov	r2, #1
	bl	CreateIOServer(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L4+36
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r0, #2
	ldr	r3, .L4+40
	ldr	r3, [sl, r3]
	mov	r1, r3
	mov	r2, #3
	bl	CreateIOServer(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L4+44
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r0, #3
	ldr	r3, .L4+48
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #3
	ldr	r3, .L4+52
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	nameServerInit, .-nameServerInit
	.section	.rodata
	.align	2
.LC4:
	.ascii	"Failed NameServer initialization.\012\015\000"
	.text
	.align	2
	.global	nameServerRun
	.type	nameServerRun, %function
nameServerRun:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L11
.L10:
	add	sl, pc, sl
	sub	r3, fp, #20
	mov	r0, r3
	bl	nameServerInit(PLT)
	mov	r3, r0
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L11+4
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	.LC4(GOTOFF)
	.size	nameServerRun, .-nameServerRun
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 9596
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #9536
	sub	sp, sp, #60
	ldr	sl, .L34
.L33:
	add	sl, pc, sl
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #60
	mov	r0, r3
	bl	initDictionary(PLT)
	b	.L32
.L14:
.L32:
	ldr	r2, .L34+4
	mov	r3, #0
	sub	r0, fp, #16
	str	r3, [r0, r2]
	mov	r3, #20
	str	r3, [fp, #-48]
	sub	r2, fp, #9536
	sub	r2, r2, #16
	sub	r3, fp, #9536
	sub	r3, r3, #16
	sub	r3, r3, #20
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-48]
	bl	Receive(PLT)
	mov	r2, r0
	ldr	r3, .L34+8
	sub	r1, fp, #16
	str	r2, [r1, r3]
	ldr	r3, .L34+8
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	cmp	r3, #3
	ble	.L15
	ldr	r3, .L34+12
	sub	ip, fp, #16
	ldrb	r3, [ip, r3]	@ zero_extendqisi2
	ldr	r2, .L34+16
	sub	r0, fp, #16
	strb	r3, [r0, r2]
	ldr	r3, .L34+12
	mov	r2, #1
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r3, .L34+16
	mov	r2, #1
	sub	ip, fp, #16
	add	r3, ip, r3
	add	r2, r3, r2
	mov	r3, r1
	strb	r3, [r2, #0]
	ldr	r3, .L34+16
	mov	r2, #2
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r2, .L34+20
	mov	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	ldr	r2, .L34+20
	mov	r3, #0
	sub	ip, fp, #16
	str	r3, [ip, r2]
	b	.L17
.L18:
	ldr	r3, .L34+20
	sub	r1, fp, #16
	ldr	r0, [r1, r3]
	ldr	r3, .L34+20
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	add	r3, r3, #2
	ldr	r2, .L34+12
	sub	ip, fp, #16
	add	r3, ip, r3
	add	r3, r3, r2
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r2, .L34+24
	sub	ip, fp, #16
	add	r3, ip, r0
	add	r2, r3, r2
	mov	r3, r1
	strb	r3, [r2, #0]
	ldr	r3, .L34+20
	sub	r0, fp, #16
	ldr	r3, [r0, r3]
	add	r2, r3, #1
	ldr	r3, .L34+20
	sub	r1, fp, #16
	str	r2, [r1, r3]
.L17:
	ldr	r3, .L34+20
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	cmp	r3, #14
	ble	.L18
	sub	r3, fp, #9536
	sub	r3, r3, #16
	sub	r3, r3, #23
	mov	r0, r3
	ldr	r3, .L34+28
	add	r3, sl, r3
	mov	r1, r3
	bl	pkstreq_volatile(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L20
	ldr	r2, .L34+32
	mov	r3, #0
	sub	ip, fp, #16
	str	r3, [ip, r2]
	ldr	r2, .L34+36
	mov	r3, #0
	sub	r0, fp, #16
	str	r3, [r0, r2]
	sub	r1, fp, #9472
	sub	r1, r1, #16
	sub	r1, r1, #60
	sub	r2, fp, #9536
	sub	r2, r2, #16
	sub	r2, r2, #39
	sub	r3, fp, #9536
	sub	r3, r3, #16
	sub	r3, r3, #52
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	searchDictionary(PLT)
	mov	r2, r0
	ldr	r3, .L34+36
	sub	r1, fp, #16
	str	r2, [r1, r3]
	ldr	r3, .L34+36
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	cmp	r3, #0
	bne	.L22
	ldr	r2, .L34+32
	mvn	r3, #1
	sub	ip, fp, #16
	str	r3, [ip, r2]
.L22:
	ldr	r2, .L34+40
	ldr	r3, .L34+44
	add	r3, sl, r3
	ldrh	r3, [r3, #0]	@ movhi
	sub	r0, fp, #16
	strh	r3, [r0, r2]	@ movhi
	ldr	r3, .L34+32
	sub	r1, fp, #16
	ldr	r3, [r1, r3]
	and	r3, r3, #255
	ldr	r2, .L34+40
	sub	ip, fp, #16
	strb	r3, [ip, r2]
	mov	r3, #2
	str	r3, [fp, #-44]
	ldr	r3, .L34+4
	sub	r0, fp, #16
	ldr	r2, [r0, r3]
	sub	r3, fp, #9536
	sub	r3, r3, #16
	sub	r3, r3, #58
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
	b	.L14
.L20:
	sub	r3, fp, #9536
	sub	r3, r3, #16
	sub	r3, r3, #23
	mov	r0, r3
	ldr	r3, .L34+48
	add	r3, sl, r3
	mov	r1, r3
	bl	pkstreq_volatile(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L25
	ldr	r3, .L34+4
	sub	r1, fp, #16
	ldr	ip, [r1, r3]
	sub	r2, fp, #9472
	sub	r2, r2, #16
	sub	r2, r2, #60
	sub	r3, fp, #9536
	sub	r3, r3, #16
	sub	r3, r3, #39
	mov	r0, r2
	mov	r1, r3
	mov	r2, ip
	bl	addDictionary(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r2, .L34+52
	ldr	r3, .L34+44
	add	r3, sl, r3
	ldrh	r3, [r3, #0]	@ movhi
	sub	ip, fp, #16
	strh	r3, [ip, r2]	@ movhi
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L27
	ldr	r3, .L34+52
	mov	r2, #0
	sub	r0, fp, #16
	strb	r2, [r0, r3]
	b	.L29
.L27:
	ldr	r3, .L34+52
	mvn	r2, #1
	sub	r1, fp, #16
	strb	r2, [r1, r3]
.L29:
	mov	r3, #2
	str	r3, [fp, #-36]
	ldr	r3, .L34+4
	sub	ip, fp, #16
	ldr	r2, [ip, r3]
	sub	r3, fp, #9536
	sub	r3, r3, #16
	sub	r3, r3, #60
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-36]
	bl	Reply(PLT)
	b	.L14
.L25:
	ldr	r3, .L34+56
	add	r3, sl, r3
	str	r3, [fp, #-32]
	mov	r3, #27
	str	r3, [fp, #-28]
	ldr	r3, .L34+4
	sub	r0, fp, #16
	ldr	r3, [r0, r3]
	mov	r0, r3
	ldr	r1, [fp, #-32]
	ldr	r2, [fp, #-28]
	bl	Reply(PLT)
	b	.L14
.L15:
	ldr	r3, .L34+56
	add	r3, sl, r3
	str	r3, [fp, #-24]
	mov	r3, #27
	str	r3, [fp, #-20]
	ldr	r3, .L34+4
	sub	r1, fp, #16
	ldr	r3, [r1, r3]
	mov	r0, r3
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	bl	Reply(PLT)
	b	.L14
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.L33+8)
	.word	-9536
	.word	-9580
	.word	-9556
	.word	-9559
	.word	-9584
	.word	-9575
	.word	.LC5(GOTOFF)
	.word	-9588
	.word	-9592
	.word	-9594
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	-9596
	.word	.LC8(GOTOFF)
	.size	NameServerTask, .-NameServerTask
	.align	2
	.global	initStorage
	.type	initStorage, %function
initStorage:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #1024]
	ldmfd	sp, {r3, fp, sp, pc}
	.size	initStorage, .-initStorage
	.align	2
	.global	insertIntoStorage
	.type	insertIntoStorage, %function
insertIntoStorage:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #1024]
	cmp	r3, #127
	ble	.L39
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L41
.L39:
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #1024]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	sub	r2, r3, #1
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	str	r3, [fp, #-24]
	b	.L56
.L43:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	sub	r2, r3, #1
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	mov	r1, #4
	mov	r3, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	ble	.L44
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L42
.L44:
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-20]
.L42:
.L56:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L43
	b	.L47
.L48:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L47:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #1024]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	ble	.L49
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	mov	r1, #4
	mov	r3, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bgt	.L48
.L49:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #1024]
	cmp	r3, #0
	beq	.L51
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #1024]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	b	.L53
.L54:
	ldr	r3, [fp, #-28]
	add	ip, r3, #1
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-32]
	mov	r3, r3, asl #3
	add	r3, r3, r2
	ldmia	r3, {r1-r2}
	ldr	r0, [fp, #-32]
	mov	r3, ip, asl #3
	add	r3, r3, r0
	stmia	r3, {r1-r2}
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L53:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L54
.L51:
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	str	r2, [r3, r1, asl #3]
	ldr	r0, [fp, #-24]
	ldr	r3, [fp, #-36]
	ldr	ip, [r3, #4]
	ldr	r2, [fp, #-32]
	mov	r1, #4
	mov	r3, r0, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	str	ip, [r3, #0]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #1024]
	add	r2, r3, #1
	ldr	r3, [fp, #-32]
	str	r2, [r3, #1024]
	mov	r3, #1
	str	r3, [fp, #-40]
.L41:
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	insertIntoStorage, .-insertIntoStorage
	.align	2
	.global	deleteFromStorage
	.type	deleteFromStorage, %function
deleteFromStorage:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1024]
	cmp	r3, #0
	bgt	.L58
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L60
.L58:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1024]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, r2, asl #3]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1024]
	sub	r3, r3, #1
	ldr	r2, [fp, #-16]
	mov	r1, #4
	mov	r3, r3, asl #3
	add	r3, r3, r2
	add	r3, r3, r1
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #1024]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #1024]
	mov	r3, #1
	str	r3, [fp, #-24]
.L60:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	deleteFromStorage, .-deleteFromStorage
	.align	2
	.global	idleTask
	.type	idleTask, %function
idleTask:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
.L63:
	b	.L63
	.size	idleTask, .-idleTask
	.align	2
	.global	clockNotifier
	.type	clockNotifier, %function
clockNotifier:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r3, #3
	str	r3, [fp, #-16]
.L66:
	mov	r0, #0
	bl	AwaitEvent(PLT)
	sub	ip, fp, #23
	ldr	r3, [fp, #-16]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, #0
	mov	r2, #0
	mov	r3, ip
	bl	Send(PLT)
	b	.L66
	.size	clockNotifier, .-clockNotifier
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 1096
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #1088
	sub	sp, sp, #8
	ldr	sl, .L87
.L86:
	add	sl, pc, sl
	ldr	r3, .L87+4
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L87+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r0, #1
	ldr	r3, .L87+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	sub	r3, fp, #1056
	sub	r3, r3, #4
	mov	r0, r3
	bl	initStorage(PLT)
	mvn	r3, #0
	str	r3, [fp, #-1064]
	mov	r3, #7
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-1076]
	b	.L85
.L69:
.L85:
	sub	r2, fp, #1056
	sub	r2, r2, #8
	sub	r3, fp, #1056
	sub	r3, r3, #15
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	Receive(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L87+16
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r2, [fp, #-1064]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L70
	ldr	r3, [fp, #-1076]
	add	r3, r3, #1
	str	r3, [fp, #-1076]
.L72:
	sub	r3, fp, #1056
	sub	r3, r3, #4
	sub	r2, fp, #32
	mov	r0, r3
	mov	r1, r2
	bl	deleteFromStorage(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L73
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-1076]
	cmp	r2, r3
	ble	.L75
	sub	r3, fp, #1056
	sub	r3, r3, #4
	sub	r2, fp, #32
	mov	r0, r3
	mov	r1, r2
	bl	insertIntoStorage(PLT)
	mov	r3, r0
	ldr	ip, [fp, #-32]
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L87+20
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L73
.L75:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	ldr	r3, .L87+24
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L72
.L73:
	ldr	r0, [fp, #-24]
	ldr	r3, .L87+24
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L69
.L70:
	ldrb	r3, [fp, #-1071]	@ zero_extendqisi2
	str	r3, [fp, #-1088]
	ldr	r2, [fp, #-1088]
	str	r2, [fp, #-1112]
	ldr	r3, [fp, #-1112]
	cmp	r3, #10
	beq	.L79
	ldr	r2, [fp, #-1112]
	cmp	r2, #10
	blt	.L78
	ldr	r3, [fp, #-1112]
	cmp	r3, #11
	beq	.L80
	ldr	r2, [fp, #-1112]
	cmp	r2, #12
	beq	.L81
	b	.L78
.L79:
	ldr	r3, [fp, #-1064]
	str	r3, [fp, #-32]
	ldrb	r3, [fp, #-1070]	@ zero_extendqisi2
	mov	r1, r3
	mov	r2, r1
	mov	r2, r2, asl #5
	rsb	r2, r1, r2
	mov	r3, r2, asl #6
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	add	r3, r3, r1
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #8
	mov	r0, r3
	ldrb	r3, [fp, #-1069]	@ zero_extendqisi2
	mov	r1, r3
	mov	r2, r1
	mov	r2, r2, asl #5
	rsb	r2, r1, r2
	mov	r3, r2, asl #6
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	add	r3, r3, r1
	mov	r3, r3, asl #6
	add	r1, r0, r3
	ldrb	r3, [fp, #-1067]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r0, r3
	ldrb	r3, [fp, #-1068]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #5
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r0, r3
	add	r2, r1, r3
	ldrb	r3, [fp, #-1066]	@ zero_extendqisi2
	add	r2, r2, r3
	ldr	r3, [fp, #-1076]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	ldr	ip, [fp, #-1064]
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L87+28
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	sub	r3, fp, #1056
	sub	r3, r3, #4
	sub	r2, fp, #32
	mov	r0, r3
	mov	r1, r2
	bl	insertIntoStorage(PLT)
	mov	r3, r0
	ldr	ip, [fp, #-32]
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L87+32
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L69
.L80:
	ldr	r3, [fp, #-1076]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	ldr	ip, [fp, #-1064]
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L87+36
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	ldr	r1, [fp, #-1076]
	ldr	r3, .L87+40
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #25
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L87+44
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-1108]
	ldr	r3, [fp, #-1108]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-1108]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-1108]
	ldr	r2, [fp, #-1108]
	and	r3, r2, #255
	strb	r3, [fp, #-1082]
	ldr	r1, [fp, #-1076]
	ldr	r3, .L87+48
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #18
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L87+44
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-1104]
	ldr	r3, [fp, #-1104]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-1104]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-1104]
	ldr	r2, [fp, #-1104]
	and	r3, r2, #255
	strb	r3, [fp, #-1081]
	ldr	r1, [fp, #-1076]
	ldr	r3, .L87+52
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #12
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L87+44
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-1100]
	ldr	r3, [fp, #-1100]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-1100]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-1100]
	ldr	r2, [fp, #-1100]
	and	r3, r2, #255
	strb	r3, [fp, #-1080]
	ldr	r1, [fp, #-1076]
	ldr	r3, .L87+44
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L87+44
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-1096]
	ldr	r3, [fp, #-1096]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-1096]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-1096]
	ldr	r2, [fp, #-1096]
	and	r3, r2, #255
	strb	r3, [fp, #-1079]
	ldr	r1, [fp, #-1076]
	ldr	r3, .L87+44
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-1092]
	ldr	r3, [fp, #-1092]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-1092]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-1092]
	ldr	r2, [fp, #-1092]
	and	r3, r2, #255
	strb	r3, [fp, #-1078]
	mov	r3, #0
	strb	r3, [fp, #-1077]
	ldr	r2, [fp, #-1064]
	sub	r3, fp, #1072
	sub	r3, r3, #10
	mov	r0, r2
	mov	r1, r3
	mov	r2, #6
	bl	Reply(PLT)
	b	.L69
.L81:
	ldr	r3, [fp, #-1064]
	str	r3, [fp, #-32]
	ldrb	r3, [fp, #-1070]	@ zero_extendqisi2
	mov	r1, r3
	mov	r2, r1
	mov	r2, r2, asl #5
	rsb	r2, r1, r2
	mov	r3, r2, asl #6
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	add	r3, r3, r1
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #8
	mov	r0, r3
	ldrb	r3, [fp, #-1069]	@ zero_extendqisi2
	mov	r1, r3
	mov	r2, r1
	mov	r2, r2, asl #5
	rsb	r2, r1, r2
	mov	r3, r2, asl #6
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	add	r3, r3, r1
	mov	r3, r3, asl #6
	add	r1, r0, r3
	ldrb	r3, [fp, #-1067]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r0, r3
	ldrb	r3, [fp, #-1068]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #5
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	add	r3, r0, r3
	add	r2, r1, r3
	ldrb	r3, [fp, #-1066]	@ zero_extendqisi2
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	ldr	ip, [fp, #-1064]
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L87+56
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-1076]
	cmp	r2, r3
	bgt	.L82
	ldr	r3, [fp, #-1064]
	mov	r0, r3
	ldr	r3, .L87+24
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
.L82:
	sub	r3, fp, #1056
	sub	r3, r3, #4
	sub	r2, fp, #32
	mov	r0, r3
	mov	r1, r2
	bl	insertIntoStorage(PLT)
	mov	r3, r0
	ldr	ip, [fp, #-32]
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L87+60
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L69
.L78:
	ldr	r3, [fp, #-1088]
	mov	r0, #0
	mov	r1, #1
	ldr	r2, .L87+64
	add	r2, sl, r2
	bl	bwassert(PLT)
	b	.L69
.L88:
	.align	2
.L87:
	.word	_GLOBAL_OFFSET_TABLE_-(.L86+8)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	clockNotifier(GOT)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	1441151881
	.word	1374389535
	.word	1125899907
	.word	1759218605
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.size	clockServer, .-clockServer
	.section	.rodata
	.align	2
.LC19:
	.ascii	"<UART1Send_Notifier>: Error with send.\015\012\000"
	.text
	.align	2
	.global	UART1Send_Notifier
	.type	UART1Send_Notifier, %function
UART1Send_Notifier:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L97
.L96:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, .L97+4
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #3
	str	r3, [fp, #-20]
	sub	ip, fp, #31
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	ldr	r3, .L97+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L97+12
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L95
.L90:
.L95:
	ldr	r0, [fp, #-24]
	mov	r1, #5
	bl	Delay(PLT)
	mov	r0, #1
	bl	AwaitEvent(PLT)
	ldr	r3, .L97+16
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #7
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L90
	ldr	r3, .L97+16
	ldr	r3, [r3, #0]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L90
	ldr	r2, .L97+20
	ldrb	r3, [fp, #-31]	@ zero_extendqisi2
	str	r3, [r2, #0]
	sub	ip, fp, #31
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	ldr	r3, .L97+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L97+12
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L90
.L98:
	.align	2
.L97:
	.word	_GLOBAL_OFFSET_TABLE_-(.L96+8)
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r3, #3
	str	r3, [fp, #-16]
	b	.L105
.L100:
.L105:
	mov	r0, #2
	bl	AwaitEvent(PLT)
	ldr	r3, .L106
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L100
	ldr	r3, .L106+4
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-23]
	mov	r3, #0
	strb	r3, [fp, #-22]
	sub	r2, fp, #23
	sub	ip, fp, #26
	ldr	r3, [fp, #-16]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r2
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L100
	bl	Exit(PLT)
	b	.L100
.L107:
	.align	2
.L106:
	.word	-2138308584
	.word	-2138308608
	.size	UART1Receive_Notifier, .-UART1Receive_Notifier
	.section	.rodata
	.align	2
.LC20:
	.ascii	"<UART2Send_Notifier>: Error with send.\015\012\000"
	.text
	.align	2
	.global	UART2Send_Notifier
	.type	UART2Send_Notifier, %function
UART2Send_Notifier:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L115
.L114:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #3
	str	r3, [fp, #-20]
	sub	ip, fp, #27
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-24]
	ldr	r3, .L115+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L115+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L113
.L109:
.L113:
	mov	r0, #3
	bl	AwaitEvent(PLT)
	ldr	r3, .L115+12
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #7
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L109
	ldr	r2, .L115+16
	ldrb	r3, [fp, #-27]	@ zero_extendqisi2
	str	r3, [r2, #0]
	sub	ip, fp, #27
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-24]
	ldr	r3, .L115+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L115+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L109
.L116:
	.align	2
.L115:
	.word	_GLOBAL_OFFSET_TABLE_-(.L114+8)
	.word	.LC6(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	-2138243048
	.word	-2138243072
	.size	UART2Send_Notifier, .-UART2Send_Notifier
	.align	2
	.global	UART2Receive_Notifier
	.type	UART2Receive_Notifier, %function
UART2Receive_Notifier:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r3, #3
	str	r3, [fp, #-16]
	b	.L123
.L118:
.L123:
	mov	r0, #4
	bl	AwaitEvent(PLT)
	ldr	r3, .L124
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L118
	ldr	r3, .L124+4
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-23]
	mov	r3, #0
	strb	r3, [fp, #-22]
	sub	r2, fp, #23
	sub	ip, fp, #26
	ldr	r3, [fp, #-16]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, r2
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L118
	bl	Exit(PLT)
	b	.L118
.L125:
	.align	2
.L124:
	.word	-2138243048
	.word	-2138243072
	.size	UART2Receive_Notifier, .-UART2Receive_Notifier
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 16440
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16384
	sub	sp, sp, #60
	ldr	sl, .L147
.L146:
	add	sl, pc, sl
	ldr	r3, .L147+4
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L147+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #12
	mov	r0, r3
	bl	circularBufferInit(PLT)
	mov	r0, #1
	ldr	r3, .L147+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r2, r0
	ldr	r3, .L147+16
	sub	r0, fp, #16
	str	r2, [r0, r3]
	ldr	r2, .L147+20
	mov	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	ldr	r2, .L147+24
	mov	r3, #1
	sub	r0, fp, #16
	str	r3, [r0, r2]
	ldr	r2, .L147+28
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	ldr	r2, .L147+32
	mvn	r3, #0
	sub	r0, fp, #16
	str	r3, [r0, r2]
	mov	r3, #7
	str	r3, [fp, #-20]
	ldr	r2, .L147+36
	mov	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	b	.L145
.L127:
.L145:
	sub	r2, fp, #16384
	sub	r2, r2, #16
	sub	r2, r2, #32
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #39
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	Receive(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L147+40
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, .L147+32
	sub	r0, fp, #16
	ldr	r2, [r0, r3]
	ldr	r3, .L147+16
	sub	r1, fp, #16
	ldr	r3, [r1, r3]
	cmp	r2, r3
	bne	.L128
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #52
	sub	r2, fp, #16384
	sub	r2, r2, #16
	sub	r2, r2, #12
	mov	r0, r3
	mov	r1, r2
	bl	getFromBuffer(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L130
	ldr	r3, .L147+36
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	and	r3, r3, #255
	ldr	r2, .L147+44
	sub	r0, fp, #16
	strb	r3, [r0, r2]
	ldr	r3, .L147+44
	mov	r2, #1
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, .L147+16
	sub	r0, fp, #16
	ldr	r2, [r0, r3]
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #45
	mov	r0, r2
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L132
.L130:
	ldr	r2, .L147+20
	mov	r3, #1
	sub	r1, fp, #16
	str	r3, [r1, r2]
	ldr	r3, .L147+24
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	cmp	r3, #1
	beq	.L132
	ldr	r3, .L147+28
	sub	r0, fp, #16
	ldr	r3, [r0, r3]
	mov	r0, r3
	ldr	r3, .L147+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
.L132:
	ldr	r2, .L147+36
	mov	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	b	.L127
.L128:
	ldr	r3, .L147+52
	sub	r2, fp, #16
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	sub	r0, fp, #16384
	str	r3, [r0, #-72]
	sub	r1, fp, #16384
	ldr	r1, [r1, #-72]
	cmp	r1, #11
	beq	.L136
	sub	r2, fp, #16384
	ldr	r2, [r2, #-72]
	cmp	r2, #81
	beq	.L137
	b	.L135
.L137:
	ldr	r3, .L147+32
	sub	r0, fp, #16
	ldr	r2, [r0, r3]
	ldr	r3, .L147+28
	sub	r1, fp, #16
	str	r2, [r1, r3]
	ldr	r2, .L147+24
	mov	r3, #0
	sub	r0, fp, #16
	str	r3, [r0, r2]
	ldr	r3, .L147+20
	sub	r1, fp, #16
	ldr	r3, [r1, r3]
	cmp	r3, #0
	beq	.L136
	ldr	r3, .L147+28
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	mov	r0, r3
	ldr	r3, .L147+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
.L136:
	ldr	r3, .L147+24
	sub	r0, fp, #16
	ldr	r3, [r0, r3]
	cmp	r3, #0
	beq	.L127
	ldr	r3, .L147+52
	mov	r2, #1
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #12
	mov	r0, r2
	mov	r1, r3
	bl	addToBuffer(PLT)
	mov	r1, r0
	ldr	r3, .L147+52
	mov	r2, #1
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r3, .L147+52
	mov	r2, #1
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, #1
	ldr	r3, .L147+56
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	ldr	r3, .L147+20
	sub	r1, fp, #16
	ldr	r3, [r1, r3]
	cmp	r3, #0
	beq	.L141
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #52
	sub	r2, fp, #16384
	sub	r2, r2, #16
	sub	r2, r2, #12
	mov	r0, r3
	mov	r1, r2
	bl	getFromBuffer(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L141
	ldr	r3, .L147+36
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	and	r3, r3, #255
	ldr	r2, .L147+44
	sub	r0, fp, #16
	strb	r3, [r0, r2]
	ldr	r3, .L147+44
	mov	r2, #1
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, .L147+16
	sub	r0, fp, #16
	ldr	r2, [r0, r3]
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #45
	mov	r0, r2
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r2, .L147+20
	mov	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
.L141:
	ldr	r3, .L147+32
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	mov	r0, r3
	ldr	r3, .L147+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L127
.L135:
	ldr	r3, .L147+32
	sub	r0, fp, #16
	ldr	ip, [r0, r3]
	mov	r0, #0
	mov	r1, #1
	ldr	r3, .L147+60
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L127
.L148:
	.align	2
.L147:
	.word	_GLOBAL_OFFSET_TABLE_-(.L146+8)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	UART1Send_Notifier(GOT)
	.word	-16400
	.word	-16404
	.word	-16408
	.word	-16412
	.word	-16416
	.word	-16436
	.word	.LC23(GOTOFF)
	.word	-16429
	.word	.LC6(GOTOFF)
	.word	-16423
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.size	UART1_SendServer, .-UART1_SendServer
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 16440
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16384
	sub	sp, sp, #60
	ldr	sl, .L171
.L170:
	add	sl, pc, sl
	ldr	r3, .L171+4
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L171+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #12
	mov	r0, r3
	bl	circularBufferInit(PLT)
	mov	r0, #1
	ldr	r3, .L171+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r2, r0
	ldr	r3, .L171+16
	sub	r0, fp, #16
	str	r2, [r0, r3]
	ldr	r2, .L171+20
	mov	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	ldr	r2, .L171+24
	mov	r3, #1
	sub	r0, fp, #16
	str	r3, [r0, r2]
	ldr	r2, .L171+28
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	ldr	r2, .L171+32
	mvn	r3, #0
	sub	r0, fp, #16
	str	r3, [r0, r2]
	mov	r3, #7
	str	r3, [fp, #-20]
	ldr	r2, .L171+36
	mov	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	b	.L169
.L150:
.L169:
	sub	r2, fp, #16384
	sub	r2, r2, #16
	sub	r2, r2, #32
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #39
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	Receive(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L171+40
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, .L171+32
	sub	r0, fp, #16
	ldr	r2, [r0, r3]
	ldr	r3, .L171+16
	sub	r1, fp, #16
	ldr	r3, [r1, r3]
	cmp	r2, r3
	bne	.L151
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #52
	sub	r2, fp, #16384
	sub	r2, r2, #16
	sub	r2, r2, #12
	mov	r0, r3
	mov	r1, r2
	bl	getFromBuffer(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L153
	ldr	r3, .L171+36
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	and	r3, r3, #255
	ldr	r2, .L171+44
	sub	r0, fp, #16
	strb	r3, [r0, r2]
	ldr	r3, .L171+44
	mov	r2, #1
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, .L171+16
	sub	r0, fp, #16
	ldr	r2, [r0, r3]
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #45
	mov	r0, r2
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L155
.L153:
	ldr	r2, .L171+20
	mov	r3, #1
	sub	r1, fp, #16
	str	r3, [r1, r2]
	ldr	r3, .L171+24
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	cmp	r3, #1
	beq	.L155
	ldr	r3, .L171+28
	sub	r0, fp, #16
	ldr	r3, [r0, r3]
	mov	r0, r3
	ldr	r3, .L171+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
.L155:
	ldr	r2, .L171+36
	mov	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	b	.L150
.L151:
	ldr	r3, .L171+52
	sub	r2, fp, #16
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	sub	r0, fp, #16384
	str	r3, [r0, #-72]
	sub	r1, fp, #16384
	ldr	r1, [r1, #-72]
	cmp	r1, #21
	beq	.L159
	sub	r2, fp, #16384
	ldr	r2, [r2, #-72]
	cmp	r2, #81
	beq	.L160
	b	.L158
.L160:
	ldr	r3, .L171+32
	sub	r0, fp, #16
	ldr	r2, [r0, r3]
	ldr	r3, .L171+28
	sub	r1, fp, #16
	str	r2, [r1, r3]
	ldr	r2, .L171+24
	mov	r3, #0
	sub	r0, fp, #16
	str	r3, [r0, r2]
	ldr	r3, .L171+20
	sub	r1, fp, #16
	ldr	r3, [r1, r3]
	cmp	r3, #0
	beq	.L159
	ldr	r3, .L171+28
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	mov	r0, r3
	ldr	r3, .L171+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
.L159:
	ldr	r3, .L171+24
	sub	r0, fp, #16
	ldr	r3, [r0, r3]
	cmp	r3, #0
	beq	.L150
	ldr	r3, .L171+52
	mov	r2, #1
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L164
	ldr	r3, .L171+52
	mov	r2, #1
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #12
	mov	r0, r2
	mov	r1, r3
	bl	addToBuffer(PLT)
	mov	r1, r0
	ldr	r3, .L171+52
	mov	r2, #1
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r3, .L171+52
	mov	r2, #1
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	str	r3, [sp, #0]
	mov	r0, r1
	mov	r1, #1
	ldr	r3, .L171+56
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	ldr	r3, .L171+20
	sub	r1, fp, #16
	ldr	r3, [r1, r3]
	cmp	r3, #0
	beq	.L164
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #52
	sub	r2, fp, #16384
	sub	r2, r2, #16
	sub	r2, r2, #12
	mov	r0, r3
	mov	r1, r2
	bl	getFromBuffer(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L164
	ldr	r3, .L171+36
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	and	r3, r3, #255
	ldr	r2, .L171+44
	sub	r0, fp, #16
	strb	r3, [r0, r2]
	ldr	r3, .L171+44
	mov	r2, #1
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, .L171+16
	sub	r0, fp, #16
	ldr	r2, [r0, r3]
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #45
	mov	r0, r2
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r2, .L171+20
	mov	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
.L164:
	ldr	r3, .L171+32
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	mov	r0, r3
	ldr	r3, .L171+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L150
.L158:
	ldr	r3, .L171+32
	sub	r0, fp, #16
	ldr	ip, [r0, r3]
	mov	r0, #0
	mov	r1, #1
	ldr	r3, .L171+60
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L150
.L172:
	.align	2
.L171:
	.word	_GLOBAL_OFFSET_TABLE_-(.L170+8)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	UART2Send_Notifier(GOT)
	.word	-16400
	.word	-16404
	.word	-16408
	.word	-16412
	.word	-16416
	.word	-16436
	.word	.LC28(GOTOFF)
	.word	-16429
	.word	.LC6(GOTOFF)
	.word	-16423
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.size	UART2_SendServer, .-UART2_SendServer
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 16432
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16384
	sub	sp, sp, #48
	ldr	sl, .L186
.L185:
	add	sl, pc, sl
	ldr	r3, .L186+4
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L186+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #16
	mov	r0, r3
	bl	circularBufferInit(PLT)
	mov	r0, #1
	ldr	r3, .L186+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r2, r0
	ldr	r3, .L186+16
	sub	r1, fp, #16
	str	r2, [r1, r3]
	ldr	r2, .L186+20
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	mov	r3, #7
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r2, .L186+24
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	b	.L184
.L174:
.L184:
	sub	r2, fp, #16384
	sub	r2, r2, #16
	sub	r2, r2, #24
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #31
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	Receive(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L186+28
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, .L186+20
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	ldr	r3, .L186+16
	sub	r1, fp, #16
	ldr	r3, [r1, r3]
	cmp	r2, r3
	bne	.L175
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #44
	sub	r2, fp, #16384
	sub	r2, r2, #16
	sub	r2, r2, #16
	mov	r0, r3
	mov	r1, r2
	bl	getFromBuffer(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L177
	ldr	r3, .L186+32
	sub	r2, fp, #16
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	ldr	r2, .L186+36
	sub	r1, fp, #16
	strb	r3, [r1, r2]
	ldr	r3, .L186+36
	mov	r2, #1
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, .L186+24
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #37
	mov	r0, r2
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
.L177:
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r2, .L186+24
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	ldr	r3, .L186+16
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	mov	r0, r3
	ldr	r3, .L186+40
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L174
.L175:
	ldr	r3, .L186+32
	sub	r1, fp, #16
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	sub	r2, fp, #16384
	str	r3, [r2, #-64]
	sub	r3, fp, #16384
	ldr	r3, [r3, #-64]
	cmp	r3, #20
	beq	.L181
	sub	r1, fp, #16384
	ldr	r1, [r1, #-64]
	cmp	r1, #81
	beq	.L182
	b	.L180
.L181:
	ldr	r3, .L186+20
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #16
	mov	r0, r2
	mov	r1, r3
	bl	addToBuffer(PLT)
	mov	r2, r0
	ldr	r3, .L186+20
	sub	r1, fp, #16
	ldr	ip, [r1, r3]
	mov	r0, r2
	mov	r1, #1
	ldr	r3, .L186+44
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L174
.L182:
	ldr	r3, .L186+20
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	mov	r0, r3
	ldr	r3, .L186+40
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
	b	.L174
.L180:
	ldr	r3, .L186+20
	sub	r1, fp, #16
	ldr	ip, [r1, r3]
	mov	r0, #0
	mov	r1, #1
	ldr	r3, .L186+48
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L174
.L187:
	.align	2
.L186:
	.word	_GLOBAL_OFFSET_TABLE_-(.L185+8)
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	UART2Receive_Notifier(GOT)
	.word	-16404
	.word	-16408
	.word	-16428
	.word	.LC33(GOTOFF)
	.word	-16415
	.word	-16421
	.word	.LC6(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	.LC35(GOTOFF)
	.size	UART2_ReceiveServer, .-UART2_ReceiveServer
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 16432
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16384
	sub	sp, sp, #52
	ldr	sl, .L201
.L200:
	add	sl, pc, sl
	ldr	r3, .L201+4
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L201+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #16
	mov	r0, r3
	bl	circularBufferInit(PLT)
	mov	r0, #1
	ldr	r3, .L201+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r2, r0
	ldr	r3, .L201+16
	sub	r1, fp, #16
	str	r2, [r1, r3]
	ldr	r2, .L201+20
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	mov	r3, #7
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r2, .L201+24
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	b	.L199
.L189:
.L199:
	sub	r2, fp, #16384
	sub	r2, r2, #16
	sub	r2, r2, #24
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #31
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-24]
	bl	Receive(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L201+28
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, .L201+20
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	ldr	r3, .L201+16
	sub	r1, fp, #16
	ldr	r3, [r1, r3]
	cmp	r2, r3
	bne	.L190
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #44
	sub	r2, fp, #16384
	sub	r2, r2, #16
	sub	r2, r2, #16
	mov	r0, r3
	mov	r1, r2
	bl	getFromBuffer(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L192
	ldr	r3, .L201+32
	sub	r2, fp, #16
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	ldr	r2, .L201+36
	sub	r1, fp, #16
	strb	r3, [r1, r2]
	ldr	r3, .L201+36
	mov	r2, #1
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, .L201+24
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #37
	mov	r0, r2
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
.L192:
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r2, .L201+24
	mvn	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	ldr	r3, .L201+16
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	mov	r0, r3
	ldr	r3, .L201+40
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L189
.L190:
	ldr	r3, .L201+32
	sub	r1, fp, #16
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	sub	r2, fp, #16384
	str	r3, [r2, #-64]
	sub	r3, fp, #16384
	ldr	r3, [r3, #-64]
	cmp	r3, #10
	beq	.L196
	sub	r1, fp, #16384
	ldr	r1, [r1, #-64]
	cmp	r1, #81
	beq	.L197
	b	.L195
.L196:
	ldr	r3, .L201+20
	sub	r1, fp, #16
	ldr	r2, [r1, r3]
	sub	r3, fp, #16384
	sub	r3, r3, #16
	sub	r3, r3, #16
	mov	r0, r2
	mov	r1, r3
	bl	addToBuffer(PLT)
	mov	r2, r0
	ldr	r3, .L201+20
	sub	r1, fp, #16
	ldr	ip, [r1, r3]
	mov	r0, r2
	mov	r1, #1
	ldr	r3, .L201+44
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L189
.L197:
	ldr	r3, .L201+20
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	mov	r0, r3
	ldr	r3, .L201+40
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
	b	.L189
.L195:
	ldr	r3, .L201+20
	sub	r1, fp, #16
	ldr	ip, [r1, r3]
	ldr	r3, .L201+32
	sub	r2, fp, #16
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	str	r3, [sp, #0]
	mov	r0, #0
	mov	r1, #1
	ldr	r3, .L201+48
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L189
.L202:
	.align	2
.L201:
	.word	_GLOBAL_OFFSET_TABLE_-(.L200+8)
	.word	.LC36(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	UART1Receive_Notifier(GOT)
	.word	-16404
	.word	-16408
	.word	-16428
	.word	.LC38(GOTOFF)
	.word	-16415
	.word	-16421
	.word	.LC6(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.size	UART1_ReceiveServer, .-UART1_ReceiveServer
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 552
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #556
	ldr	sl, .L239
.L238:
	add	sl, pc, sl
	ldr	r3, .L239+4
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L239+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, .L239+12
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	ldr	r3, .L239+16
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-52]
	mvn	r3, #0
	str	r3, [fp, #-468]
	mov	r3, #4
	str	r3, [fp, #-48]
	mov	r3, #3
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-544]
	mov	r3, #4
	str	r3, [fp, #-40]
	ldr	r3, .L239+20
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-544]
	b	.L204
.L205:
	ldr	r3, [fp, #-544]
	ldr	r2, .L239+24
	mov	r3, r3, asl #2
	sub	r0, fp, #16
	add	r3, r3, r0
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r3, #84
	strb	r3, [fp, #-536]
	ldr	r3, [fp, #-544]
	ldr	r2, .L239+24
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-535]
	ldr	r3, [fp, #-544]
	and	r3, r3, #255
	strb	r3, [fp, #-534]
	mov	r3, #0
	strb	r3, [fp, #-533]
	sub	r2, fp, #536
	sub	ip, fp, #536
	sub	ip, ip, #3
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-56]
	mov	r1, r2
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L239+28
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #2
	strb	r3, [fp, #-472]
	mov	r3, #0
	strb	r3, [fp, #-471]
	ldr	r3, [fp, #-544]
	and	r3, r3, #255
	strb	r3, [fp, #-470]
	mov	r3, #0
	strb	r3, [fp, #-469]
	sub	r2, fp, #472
	sub	ip, fp, #536
	sub	ip, ip, #3
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r2
	ldr	r2, [fp, #-40]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L239+32
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r0, [fp, #-52]
	mov	r1, #5
	bl	Delay(PLT)
	ldr	r3, [fp, #-544]
	add	r3, r3, #1
	str	r3, [fp, #-544]
.L204:
	ldr	r3, [fp, #-544]
	cmp	r3, #79
	ble	.L205
	ldr	r0, [fp, #-52]
	mov	r1, #436
	bl	Delay(PLT)
	mov	r3, #2
	strb	r3, [fp, #-472]
	mov	r3, #1
	strb	r3, [fp, #-471]
	mov	r3, #0
	strb	r3, [fp, #-470]
	mov	r3, #0
	strb	r3, [fp, #-469]
	sub	r2, fp, #472
	sub	ip, fp, #536
	sub	ip, ip, #3
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r2
	ldr	r2, [fp, #-40]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L239+32
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #1
	str	r3, [fp, #-544]
	b	.L207
.L208:
	ldr	r3, [fp, #-544]
	sub	r3, r3, #1
	ldr	r2, .L239+36
	mov	r3, r3, asl #2
	sub	r0, fp, #16
	add	r3, r3, r0
	add	r2, r3, r2
	mov	r3, #67
	str	r3, [r2, #0]
	mov	r3, #83
	strb	r3, [fp, #-536]
	ldr	r3, [fp, #-544]
	sub	r3, r3, #1
	ldr	r2, .L239+36
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	cmp	r3, #83
	bne	.L209
	mov	r2, #33
	str	r2, [fp, #-568]
	b	.L211
.L209:
	mov	r3, #34
	str	r3, [fp, #-568]
.L211:
	ldr	r0, [fp, #-568]
	mov	r3, r0
	strb	r3, [fp, #-535]
	ldr	r3, [fp, #-544]
	and	r3, r3, #255
	strb	r3, [fp, #-534]
	mov	r3, #0
	strb	r3, [fp, #-533]
	sub	r2, fp, #536
	sub	ip, fp, #536
	sub	ip, ip, #3
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-56]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L239+28
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r1, [fp, #-544]
	ldr	r3, [fp, #-544]
	sub	r3, r3, #1
	ldr	r2, .L239+36
	mov	r3, r3, asl #2
	sub	r0, fp, #16
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	sub	r2, fp, #464
	mov	r0, r1
	mov	r1, r3
	bl	update_switch(PLT)
	ldr	r3, [fp, #-544]
	add	r3, r3, #1
	str	r3, [fp, #-544]
.L207:
	ldr	r3, [fp, #-544]
	cmp	r3, #18
	ble	.L208
	mov	r3, #153
	str	r3, [fp, #-544]
	b	.L213
.L214:
	ldr	r3, [fp, #-544]
	sub	r3, r3, #135
	str	r3, [fp, #-564]
	ldr	r3, [fp, #-544]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L215
	mov	r1, #67
	str	r1, [fp, #-560]
	b	.L217
.L215:
	mov	r2, #83
	str	r2, [fp, #-560]
.L217:
	ldr	r2, .L239+36
	ldr	r0, [fp, #-564]
	mov	r3, r0, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r3, r3, r2
	ldr	r2, [fp, #-560]
	str	r2, [r3, #0]
	mov	r3, #83
	strb	r3, [fp, #-536]
	ldr	r3, [fp, #-544]
	sub	r3, r3, #135
	ldr	r2, .L239+36
	mov	r3, r3, asl #2
	sub	r0, fp, #16
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	cmp	r3, #83
	bne	.L218
	mov	r1, #33
	str	r1, [fp, #-556]
	b	.L220
.L218:
	mov	r2, #34
	str	r2, [fp, #-556]
.L220:
	ldr	r0, [fp, #-556]
	mov	r3, r0
	strb	r3, [fp, #-535]
	ldr	r3, [fp, #-544]
	and	r3, r3, #255
	strb	r3, [fp, #-534]
	mov	r3, #0
	strb	r3, [fp, #-533]
	sub	r2, fp, #536
	sub	ip, fp, #536
	sub	ip, ip, #3
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-56]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L239+28
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r1, [fp, #-544]
	ldr	r3, [fp, #-544]
	sub	r3, r3, #135
	ldr	r2, .L239+36
	mov	r3, r3, asl #2
	sub	r0, fp, #16
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	sub	r2, fp, #464
	mov	r0, r1
	mov	r1, r3
	bl	update_switch(PLT)
	ldr	r3, [fp, #-544]
	add	r3, r3, #1
	str	r3, [fp, #-544]
.L213:
	ldr	r3, [fp, #-544]
	cmp	r3, #156
	ble	.L214
	mov	r3, #2
	strb	r3, [fp, #-472]
	mov	r3, #2
	strb	r3, [fp, #-471]
	mov	r3, #0
	strb	r3, [fp, #-470]
	mov	r3, #0
	strb	r3, [fp, #-469]
	sub	r2, fp, #472
	sub	ip, fp, #536
	sub	ip, ip, #3
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r2
	ldr	r2, [fp, #-40]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L239+32
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L237
.L222:
.L237:
	sub	r3, fp, #468
	sub	r2, fp, #472
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-48]
	bl	Receive(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L239+40
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldrb	r3, [fp, #-472]	@ zero_extendqisi2
	sub	r3, r3, #76
	cmp	r3, #8
	addls	pc, pc, r3, asl #2
	b	.L223
	.p2align 2
.L228:
	b	.L224
	b	.L223
	b	.L223
	b	.L223
	b	.L223
	b	.L223
	b	.L225
	b	.L226
	b	.L227
.L224:
	ldrb	r3, [fp, #-471]	@ zero_extendqisi2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldr	r2, .L239+24
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r2, r3, r2
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r3, #76
	strb	r3, [fp, #-536]
	ldr	r3, [fp, #-32]
	ldr	r2, .L239+24
	mov	r3, r3, asl #2
	sub	r0, fp, #16
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	add	r3, r3, #16
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [fp, #-535]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	strb	r3, [fp, #-534]
	mov	r3, #0
	strb	r3, [fp, #-533]
	sub	r2, fp, #536
	sub	ip, fp, #536
	sub	ip, ip, #3
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-56]
	mov	r1, r2
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L239+28
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, [fp, #-468]
	mov	r0, r3
	ldr	r3, .L239+44
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L222
.L227:
	ldrb	r3, [fp, #-471]	@ zero_extendqisi2
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-470]	@ zero_extendqisi2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldr	r2, .L239+24
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r2, r3, r2
	ldr	r3, [fp, #-28]
	str	r3, [r2, #0]
	mov	r3, #84
	strb	r3, [fp, #-536]
	ldr	r3, [fp, #-32]
	ldr	r2, .L239+24
	mov	r3, r3, asl #2
	sub	r0, fp, #16
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-535]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	strb	r3, [fp, #-534]
	mov	r3, #0
	strb	r3, [fp, #-533]
	sub	r2, fp, #536
	sub	ip, fp, #536
	sub	ip, ip, #3
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-56]
	mov	r1, r2
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L239+28
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, [fp, #-468]
	mov	r0, r3
	ldr	r3, .L239+44
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L222
.L225:
	ldrb	r3, [fp, #-471]	@ zero_extendqisi2
	str	r3, [fp, #-32]
	mov	r3, #82
	strb	r3, [fp, #-536]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	strb	r3, [fp, #-535]
	ldr	r3, [fp, #-32]
	ldr	r2, .L239+24
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-534]
	mov	r3, #0
	strb	r3, [fp, #-533]
	sub	r2, fp, #536
	sub	ip, fp, #536
	sub	ip, ip, #3
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-56]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L239+28
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, [fp, #-32]
	ldr	r2, .L239+24
	mov	r3, r3, asl #2
	sub	r0, fp, #16
	add	r3, r3, r0
	add	r3, r3, r2
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-546]
	mov	r3, #0
	strb	r3, [fp, #-545]
	ldr	r2, [fp, #-468]
	sub	r3, fp, #544
	sub	r3, r3, #2
	mov	r0, r2
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L222
.L226:
	ldrb	r3, [fp, #-471]	@ zero_extendqisi2
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-470]	@ zero_extendqisi2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r3, #18
	bgt	.L230
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	ldr	r2, .L239+36
	mov	r3, r3, asl #2
	sub	r1, fp, #16
	add	r3, r3, r1
	add	r2, r3, r2
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	b	.L232
.L230:
	ldr	r3, [fp, #-24]
	sub	r3, r3, #135
	ldr	r2, .L239+36
	mov	r3, r3, asl #2
	sub	r0, fp, #16
	add	r3, r3, r0
	add	r2, r3, r2
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
.L232:
	mov	r3, #83
	strb	r3, [fp, #-536]
	ldr	r3, [fp, #-20]
	cmp	r3, #83
	bne	.L233
	mov	r1, #33
	str	r1, [fp, #-552]
	b	.L235
.L233:
	mov	r2, #34
	str	r2, [fp, #-552]
.L235:
	ldr	r0, [fp, #-552]
	mov	r3, r0
	strb	r3, [fp, #-535]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	strb	r3, [fp, #-534]
	mov	r3, #0
	strb	r3, [fp, #-533]
	sub	r2, fp, #536
	sub	ip, fp, #536
	sub	ip, ip, #3
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-56]
	mov	r1, r2
	mov	r2, #8
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L239+28
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, [fp, #-468]
	mov	r0, r3
	ldr	r3, .L239+44
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	sub	r3, fp, #464
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-20]
	mov	r2, r3
	bl	update_switch(PLT)
	b	.L222
.L223:
	ldr	ip, [fp, #-468]
	sub	r3, fp, #472
	str	r3, [sp, #0]
	mov	r0, #0
	mov	r1, #1
	ldr	r3, .L239+48
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L222
.L240:
	.align	2
.L239:
	.word	_GLOBAL_OFFSET_TABLE_-(.L238+8)
	.word	.LC41(GOTOFF)
	.word	.LC42(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	-360
	.word	.LC45(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	-448
	.word	.LC47(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC48(GOTOFF)
	.size	trainServer, .-trainServer
	.section	.rodata
	.align	2
.LC49:
	.ascii	"<Grid>: Error with send.\015\012\000"
	.text
	.align	2
	.global	Grid
	.type	Grid, %function
Grid:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L244
.L243:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #3
	str	r3, [fp, #-20]
	sub	ip, fp, #27
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-24]
	ldr	r3, .L244+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L244+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L245:
	.align	2
.L244:
	.word	_GLOBAL_OFFSET_TABLE_-(.L243+8)
	.word	.LC6(GOTOFF)
	.word	.LC49(GOTOFF)
	.size	Grid, .-Grid
	.section	.rodata
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
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #1136
	sub	sp, sp, #4
	ldr	sl, .L264
.L263:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-44]
	ldr	r3, .L264+4
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L264+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #2
	str	r3, [fp, #-32]
	mov	r3, #0
	strb	r3, [fp, #-1069]
	mov	r3, #3
	str	r3, [fp, #-28]
	b	.L262
.L247:
.L262:
	ldr	r0, [fp, #-40]
	mov	r1, #1
	bl	Getc(PLT)
	mov	r3, r0
	strb	r3, [fp, #-1069]
	ldrb	r3, [fp, #-1069]
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L247
	ldr	r2, [fp, #-36]
	ldr	r3, .L264+12
	cmp	r2, r3
	bgt	.L247
	ldrb	r3, [fp, #-1069]
	and	r3, r3, #255
	cmp	r3, #13
	bne	.L251
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	ldr	r2, .L264+16
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	mov	r3, #20
	strb	r3, [fp, #-1133]
	mov	r3, #0
	strb	r3, [fp, #-1132]
	sub	r2, fp, #1120
	sub	r2, r2, #13
	sub	ip, fp, #1136
	ldr	r3, [fp, #-28]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r2
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L264+20
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	sub	r1, fp, #1056
	sub	r1, r1, #12
	sub	r2, fp, #1136
	sub	r2, r2, #4
	sub	r3, fp, #1136
	sub	r3, r3, #8
	mov	r0, r1
	mov	r1, r2
	mov	r2, r3
	bl	parseCommand(PLT)
	mov	r3, r0
	and	r3, r3, #255
	strb	r3, [fp, #-1133]
	ldr	r3, [fp, #-1140]
	and	r3, r3, #255
	strb	r3, [fp, #-1132]
	ldr	r3, [fp, #-1144]
	and	r3, r3, #255
	strb	r3, [fp, #-1131]
	mov	r3, #0
	strb	r3, [fp, #-1130]
	sub	r2, fp, #1120
	sub	r2, r2, #13
	sub	ip, fp, #1136
	ldr	r3, [fp, #-28]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r2
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L264+20
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L253
.L254:
	ldr	r3, [fp, #-24]
	ldr	r2, .L264+16
	sub	ip, fp, #16
	add	r3, ip, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L253:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	ble	.L254
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #2
	str	r3, [fp, #-32]
	ldrb	r3, [fp, #-1133]	@ zero_extendqisi2
	cmp	r3, #10
	bne	.L247
	bl	Exit(PLT)
	b	.L247
.L251:
	ldrb	r3, [fp, #-1069]
	and	r3, r3, #255
	cmp	r3, #8
	bne	.L258
	ldr	r3, [fp, #-32]
	cmp	r3, #2
	ble	.L247
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r2, .L264+16
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
	mov	r3, #1
	strb	r3, [fp, #-1133]
	ldr	r1, [fp, #-32]
	ldr	r3, .L264+24
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	and	r3, r3, #255
	strb	r3, [fp, #-1132]
	ldr	r1, [fp, #-32]
	ldr	r3, .L264+24
	smull	ip, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-1152]
	ldr	r3, [fp, #-1152]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-1152]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-1152]
	ldr	ip, [fp, #-1152]
	and	r3, ip, #255
	strb	r3, [fp, #-1131]
	mov	r3, #0
	strb	r3, [fp, #-1130]
	sub	r2, fp, #1120
	sub	r2, r2, #13
	sub	ip, fp, #1136
	ldr	r3, [fp, #-28]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r2
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L264+28
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L247
.L258:
	ldr	r1, [fp, #-36]
	ldrb	r3, [fp, #-1069]
	and	r0, r3, #255
	ldr	r2, .L264+16
	sub	ip, fp, #16
	add	r3, ip, r1
	add	r2, r3, r2
	mov	r3, r0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	mov	r3, #2
	strb	r3, [fp, #-1133]
	ldr	r1, [fp, #-32]
	ldr	r3, .L264+24
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	and	r3, r3, #255
	strb	r3, [fp, #-1132]
	ldr	r1, [fp, #-32]
	ldr	r3, .L264+24
	smull	ip, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-1148]
	ldr	r3, [fp, #-1148]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-1148]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-1148]
	ldr	ip, [fp, #-1148]
	and	r3, ip, #255
	strb	r3, [fp, #-1131]
	ldrb	r3, [fp, #-1069]
	and	r3, r3, #255
	strb	r3, [fp, #-1130]
	mov	r3, #0
	strb	r3, [fp, #-1129]
	sub	r2, fp, #1120
	sub	r2, r2, #13
	sub	ip, fp, #1136
	ldr	r3, [fp, #-28]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r2
	mov	r2, #5
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L264+32
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	bwassert(PLT)
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	b	.L247
.L265:
	.align	2
.L264:
	.word	_GLOBAL_OFFSET_TABLE_-(.L263+8)
	.word	.LC31(GOTOFF)
	.word	.LC50(GOTOFF)
	.word	1019
	.word	-1052
	.word	.LC51(GOTOFF)
	.word	1374389535
	.word	.LC52(GOTOFF)
	.word	.LC53(GOTOFF)
	.size	UserPrompt, .-UserPrompt
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 168
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {r4, sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #192
	ldr	sl, .L317
.L316:
	add	sl, pc, sl
	ldr	r3, .L317+4
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L317+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, .L317+12
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-100]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L317+16
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, .L317+20
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-96]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L317+24
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r0, #4
	ldr	r3, .L317+28
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-92]
	mvn	r3, #0
	str	r3, [fp, #-88]
	mvn	r3, #0
	str	r3, [fp, #-84]
	mov	r0, #4
	ldr	r3, .L317+32
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-80]
	mov	r0, #4
	ldr	r3, .L317+36
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-76]
	mov	r0, #4
	ldr	r3, .L317+40
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-72]
	mvn	r3, #0
	str	r3, [fp, #-104]
	mov	r3, #64
	str	r3, [fp, #-68]
	mvn	r3, #0
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-60]
	mov	r3, #27
	str	r3, [fp, #-56]
	mov	r3, #6
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-40]
	mov	r0, #0
	bl	getTicks4(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	strb	r3, [fp, #-25]
	mov	r3, #0
	str	r3, [fp, #-172]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L315
.L267:
.L315:
	sub	r3, fp, #104
	sub	r2, fp, #168
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-68]
	bl	Receive(PLT)
	mov	r3, r0
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L317+44
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r2, [fp, #-104]
	ldr	r3, [fp, #-92]
	cmp	r2, r3
	bne	.L268
	bl	displayGrid(PLT)
	ldr	r0, [fp, #-92]
	ldr	r3, .L317+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L267
.L268:
	ldr	r2, [fp, #-104]
	ldr	r3, [fp, #-88]
	cmp	r2, r3
	bne	.L271
	ldrb	r3, [fp, #-168]	@ zero_extendqisi2
	sub	r3, r3, #1
	cmp	r3, #19
	addls	pc, pc, r3, asl #2
	b	.L273
	.p2align 2
.L283:
	b	.L274
	b	.L275
	b	.L273
	b	.L273
	b	.L273
	b	.L273
	b	.L273
	b	.L273
	b	.L273
	b	.L276
	b	.L277
	b	.L278
	b	.L279
	b	.L280
	b	.L281
	b	.L273
	b	.L273
	b	.L273
	b	.L273
	b	.L282
.L274:
	ldrb	r3, [fp, #-167]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldrb	r3, [fp, #-166]	@ zero_extendqisi2
	add	r3, r2, r3
	str	r3, [fp, #-60]
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+52
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-60]
	bl	Printf(PLT)
	mov	r3, #0
	str	r3, [fp, #-60]
	b	.L284
.L275:
	ldrb	r3, [fp, #-167]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldrb	r3, [fp, #-166]	@ zero_extendqisi2
	add	r3, r2, r3
	str	r3, [fp, #-60]
	ldrb	r3, [fp, #-165]
	strb	r3, [fp, #-25]
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+56
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-60]
	bl	Printf(PLT)
	mov	r3, #0
	str	r3, [fp, #-60]
	mov	r3, #0
	strb	r3, [fp, #-25]
	b	.L284
.L277:
	ldrb	r3, [fp, #-167]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-166]	@ zero_extendqisi2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+60
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
	b	.L284
.L278:
	ldrb	r3, [fp, #-167]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-166]	@ zero_extendqisi2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+64
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
	b	.L284
.L279:
	ldrb	r3, [fp, #-167]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-166]	@ zero_extendqisi2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+68
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
	b	.L284
.L280:
	ldrb	r3, [fp, #-167]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+72
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
	b	.L284
.L281:
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+76
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	b	.L284
.L282:
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+80
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	b	.L284
.L276:
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+84
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	mov	r0, #0
	ldr	r3, .L317+88
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-84]
	b	.L284
.L273:
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+92
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
.L284:
	ldr	r3, [fp, #-104]
	mov	r0, r3
	ldr	r3, .L317+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L267
.L271:
	ldr	r2, [fp, #-104]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	bne	.L285
	ldrb	r3, [fp, #-168]	@ zero_extendqisi2
	strb	r3, [fp, #-174]
	mov	r3, #0
	strb	r3, [fp, #-173]
	sub	r2, fp, #174
	sub	ip, fp, #176
	mov	r3, #2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-96]
	mov	r1, r2
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	ldrb	r3, [fp, #-168]	@ zero_extendqisi2
	strb	r3, [fp, #-174]
	mov	r3, #0
	strb	r3, [fp, #-173]
	sub	r2, fp, #174
	sub	ip, fp, #176
	mov	r3, #2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-100]
	mov	r1, r2
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-104]
	mov	r0, r3
	ldr	r3, .L317+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
	b	.L267
.L285:
	ldr	r2, [fp, #-104]
	ldr	r3, [fp, #-80]
	cmp	r2, r3
	bne	.L287
	mov	r3, #0
	str	r3, [fp, #-172]
	b	.L289
.L290:
	ldr	r3, [fp, #-172]
	mvn	r2, #147
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	beq	.L291
	mov	r0, #0
	bl	getTicks4(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	rsb	ip, r3, r2
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+96
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
.L291:
	ldr	r3, [fp, #-172]
	mvn	r2, #147
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-172]
	mvn	r2, #147
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sub	r3, r3, #1
	add	r2, r3, #15
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #4
	add	r0, r3, #65
	ldr	r3, [fp, #-172]
	mvn	r2, #147
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sub	r2, r3, #1
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #28
	add	r3, r2, r1
	and	r3, r3, #15
	rsb	r3, r1, r3
	add	r1, r3, #1
	ldr	r3, .L317+100
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	ip, r3, r2
	ldr	r3, [fp, #-172]
	mvn	r2, #147
	sub	r1, fp, #20
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sub	r2, r3, #1
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #28
	add	r3, r2, r1
	and	r3, r3, #15
	rsb	r3, r1, r3
	add	r1, r3, #1
	ldr	r3, .L317+100
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-188]
	ldr	r3, [fp, #-188]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-188]
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r1, r3, r1
	str	r1, [fp, #-188]
	str	r0, [sp, #0]
	str	ip, [sp, #4]
	ldr	r3, [fp, #-188]
	str	r3, [sp, #8]
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+104
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-40]
	bl	Printf(PLT)
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+108
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-44]
	bl	Printf(PLT)
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-40]
	add	r2, r3, #1
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	bgt	.L293
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-184]
	b	.L295
.L293:
	ldr	r1, [fp, #-52]
	str	r1, [fp, #-184]
.L295:
	ldr	r2, [fp, #-184]
	str	r2, [fp, #-40]
	mov	r0, #0
	bl	getTicks4(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-172]
	add	r3, r3, #1
	str	r3, [fp, #-172]
.L289:
	ldr	r2, [fp, #-172]
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	blt	.L290
	ldr	r3, [fp, #-104]
	mov	r0, r3
	ldr	r3, .L317+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L267
.L287:
	ldr	r2, [fp, #-104]
	ldr	r3, [fp, #-72]
	cmp	r2, r3
	bne	.L297
	ldrb	r3, [fp, #-166]	@ zero_extendqisi2
	add	r3, r3, #6
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-168]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L299
	ldrb	r3, [fp, #-167]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L301
	ldrb	r3, [fp, #-166]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+112
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
	b	.L306
.L301:
	ldrb	r3, [fp, #-167]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L304
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+116
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	b	.L306
.L304:
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+120
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	mov	r0, #4
	ldr	r3, .L317+124
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-88]
	b	.L306
.L299:
	ldrb	r3, [fp, #-168]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L307
	ldrb	r3, [fp, #-167]	@ zero_extendqisi2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+128
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	bl	Printf(PLT)
	b	.L306
.L307:
	ldrb	r3, [fp, #-167]	@ zero_extendqisi2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+132
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	bl	Printf(PLT)
.L306:
	ldr	r3, [fp, #-104]
	mov	r0, r3
	ldr	r3, .L317+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L267
.L297:
	ldr	r2, [fp, #-104]
	ldr	r3, [fp, #-76]
	cmp	r2, r3
	bne	.L309
	ldrb	r3, [fp, #-168]	@ zero_extendqisi2
	str	r3, [fp, #-180]
	ldr	r3, [fp, #-180]
	cmp	r3, #18
	beq	.L312
	ldr	r1, [fp, #-180]
	cmp	r1, #19
	beq	.L313
	b	.L311
.L312:
	ldrb	r3, [fp, #-167]	@ zero_extendqisi2
	mov	lr, r3
	ldrb	r3, [fp, #-166]	@ zero_extendqisi2
	mov	r4, r3
	ldrb	r3, [fp, #-165]	@ zero_extendqisi2
	mov	r2, r3
	ldrb	r3, [fp, #-164]	@ zero_extendqisi2
	mov	r1, r3
	ldrb	r3, [fp, #-163]	@ zero_extendqisi2
	mov	r0, r3
	ldrb	r3, [fp, #-162]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-161]	@ zero_extendqisi2
	str	r4, [sp, #0]
	str	r2, [sp, #4]
	str	r1, [sp, #8]
	str	r0, [sp, #12]
	str	ip, [sp, #16]
	str	r3, [sp, #20]
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+136
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, lr
	bl	Printf(PLT)
	b	.L311
.L313:
	ldrb	r3, [fp, #-167]	@ zero_extendqisi2
	mov	ip, r3
	ldr	r0, [fp, #-100]
	mov	r1, #1
	ldr	r3, .L317+140
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
.L311:
	ldr	r3, [fp, #-104]
	mov	r0, r3
	ldr	r3, .L317+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L267
.L309:
	ldr	r3, [fp, #-104]
	mov	r0, r3
	ldr	r3, .L317+48
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L267
.L318:
	.align	2
.L317:
	.word	_GLOBAL_OFFSET_TABLE_-(.L316+8)
	.word	.LC44(GOTOFF)
	.word	.LC54(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC55(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC56(GOTOFF)
	.word	Grid(GOT)
	.word	displaySensors(GOT)
	.word	displayClock(GOT)
	.word	trainServer(GOT)
	.word	.LC57(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC58(GOTOFF)
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
	.word	1717986919
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
	.size	displayServer, .-displayServer
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #156
	ldr	sl, .L332
.L331:
	add	sl, pc, sl
	ldr	r3, .L332+4
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L332+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r0, #4
	ldr	r3, .L332+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-48]
	ldr	r3, .L332+16
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-44]
	ldr	r3, .L332+20
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r3, .L332+24
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-44]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L332+28
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, [fp, #-40]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L332+32
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, [fp, #-36]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L332+36
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mvn	r3, #0
	str	r3, [fp, #-52]
	mov	r3, #64
	str	r3, [fp, #-32]
	mvn	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-120]
.L320:
	sub	r3, fp, #52
	sub	r2, fp, #116
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-32]
	bl	Receive(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L332+40
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldrb	r3, [fp, #-116]	@ zero_extendqisi2
	sub	r3, r3, #81
	cmp	r3, #33
	addls	pc, pc, r3, asl #2
	b	.L321
	.p2align 2
.L326:
	b	.L322
	b	.L323
	b	.L324
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L321
	b	.L325
.L322:
	ldrb	r3, [fp, #-116]	@ zero_extendqisi2
	strb	r3, [fp, #-122]
	mov	r3, #0
	strb	r3, [fp, #-121]
	sub	r2, fp, #122
	sub	ip, fp, #124
	mov	r3, #2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	mov	r1, r2
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	ldrb	r3, [fp, #-116]	@ zero_extendqisi2
	strb	r3, [fp, #-122]
	mov	r3, #0
	strb	r3, [fp, #-121]
	sub	r2, fp, #122
	sub	ip, fp, #124
	mov	r3, #2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-40]
	mov	r1, r2
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	ldr	r3, [fp, #-52]
	mov	r0, r3
	ldr	r3, .L332+44
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
	b	.L327
.L324:
	ldrb	r3, [fp, #-115]	@ zero_extendqisi2
	ldr	r0, [fp, #-40]
	mov	r1, #0
	mov	r2, r3
	bl	Putc(PLT)
	ldrb	r3, [fp, #-114]	@ zero_extendqisi2
	ldr	r0, [fp, #-40]
	mov	r1, #0
	mov	r2, r3
	bl	Putc(PLT)
	ldr	r0, [fp, #-44]
	mov	r1, #15
	bl	Delay(PLT)
	ldr	r0, [fp, #-40]
	mov	r1, #0
	mov	r2, #32
	bl	Putc(PLT)
	b	.L327
.L323:
	ldr	r0, [fp, #-40]
	mov	r1, #0
	mov	r2, #0
	bl	Putc(PLT)
	ldrb	r3, [fp, #-115]	@ zero_extendqisi2
	ldr	r0, [fp, #-40]
	mov	r1, #0
	mov	r2, r3
	bl	Putc(PLT)
	ldr	r0, [fp, #-44]
	bl	Time(PLT)
	mov	r1, r0
	ldrb	r3, [fp, #-114]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #3
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	add	r3, r1, r3
	add	r3, r3, #170
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-115]	@ zero_extendqisi2
	strb	r3, [fp, #-134]
	ldrb	r3, [fp, #-114]	@ zero_extendqisi2
	strb	r3, [fp, #-133]
	ldr	r1, [fp, #-24]
	ldr	r3, .L332+48
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #22
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L332+52
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-168]
	ldr	r3, [fp, #-168]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-168]
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r1, r3, r1
	str	r1, [fp, #-168]
	ldr	r1, [fp, #-168]
	and	r3, r1, #255
	strb	r3, [fp, #-132]
	ldr	r1, [fp, #-24]
	ldr	r3, .L332+56
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #18
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L332+52
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-164]
	ldr	r3, [fp, #-164]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-164]
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r1, r3, r1
	str	r1, [fp, #-164]
	ldr	r1, [fp, #-164]
	and	r3, r1, #255
	strb	r3, [fp, #-131]
	ldr	r1, [fp, #-24]
	ldr	r3, .L332+60
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #13
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L332+52
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-160]
	ldr	r3, [fp, #-160]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-160]
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r1, r3, r1
	str	r1, [fp, #-160]
	ldr	r1, [fp, #-160]
	and	r3, r1, #255
	strb	r3, [fp, #-130]
	ldr	r1, [fp, #-24]
	ldr	r3, .L332+64
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #12
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L332+52
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-156]
	ldr	r3, [fp, #-156]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-156]
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r1, r3, r1
	str	r1, [fp, #-156]
	ldr	r1, [fp, #-156]
	and	r3, r1, #255
	strb	r3, [fp, #-129]
	ldr	r1, [fp, #-24]
	ldr	r3, .L332+68
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #6
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L332+52
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-152]
	ldr	r3, [fp, #-152]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-152]
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r1, r3, r1
	str	r1, [fp, #-152]
	ldr	r1, [fp, #-152]
	and	r3, r1, #255
	strb	r3, [fp, #-128]
	ldr	r1, [fp, #-24]
	ldr	r3, .L332+72
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L332+52
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-148]
	ldr	r3, [fp, #-148]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-148]
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r1, r3, r1
	str	r1, [fp, #-148]
	ldr	r1, [fp, #-148]
	and	r3, r1, #255
	strb	r3, [fp, #-127]
	ldr	r1, [fp, #-24]
	ldr	r3, .L332+52
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L332+52
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-144]
	ldr	r3, [fp, #-144]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-144]
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r1, r3, r1
	str	r1, [fp, #-144]
	ldr	r1, [fp, #-144]
	and	r3, r1, #255
	strb	r3, [fp, #-126]
	ldr	r1, [fp, #-24]
	ldr	r3, .L332+52
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-140]
	ldr	r3, [fp, #-140]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-140]
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r1, r3, r1
	str	r1, [fp, #-140]
	ldr	r1, [fp, #-140]
	and	r3, r1, #255
	strb	r3, [fp, #-125]
	mov	r3, #0
	strb	r3, [fp, #-124]
	sub	r2, fp, #134
	sub	ip, fp, #136
	mov	r3, #2
	str	r3, [sp, #0]
	ldr	r0, [fp, #-48]
	mov	r1, r2
	mov	r2, #10
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L332+76
	add	r3, sl, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	bl	bwassert(PLT)
	b	.L327
.L325:
	ldr	r0, [fp, #-40]
	mov	r1, #0
	mov	r2, #15
	bl	Putc(PLT)
	ldrb	r3, [fp, #-115]	@ zero_extendqisi2
	ldr	r0, [fp, #-40]
	mov	r1, #0
	mov	r2, r3
	bl	Putc(PLT)
	ldrb	r3, [fp, #-114]	@ zero_extendqisi2
	ldr	r0, [fp, #-40]
	mov	r1, #0
	mov	r2, r3
	bl	Putc(PLT)
	ldrb	r3, [fp, #-115]	@ zero_extendqisi2
	ldr	r0, [fp, #-40]
	mov	r1, #0
	mov	r2, r3
	bl	Putc(PLT)
	b	.L327
.L321:
	mov	r3, #1
	str	r3, [fp, #-120]
	b	.L328
.L329:
	ldr	r3, [fp, #-120]
	mvn	r2, #99
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-40]
	mov	r1, #0
	mov	r2, r3
	bl	Putc(PLT)
	ldr	r3, [fp, #-120]
	add	r3, r3, #1
	str	r3, [fp, #-120]
.L328:
	ldr	r3, [fp, #-28]
	sub	r2, r3, #1
	ldr	r3, [fp, #-120]
	cmp	r2, r3
	bgt	.L329
.L327:
	ldr	r3, [fp, #-52]
	mov	r0, r3
	ldr	r3, .L332+44
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L320
.L333:
	.align	2
.L332:
	.word	_GLOBAL_OFFSET_TABLE_-(.L331+8)
	.word	.LC43(GOTOFF)
	.word	.LC78(GOTOFF)
	.word	commandReverseDelayServer(GOT)
	.word	.LC9(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC36(GOTOFF)
	.word	.LC79(GOTOFF)
	.word	.LC80(GOTOFF)
	.word	.LC81(GOTOFF)
	.word	.LC82(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	1801439851
	.word	1717986919
	.word	1125899907
	.word	351843721
	.word	1759218605
	.word	274877907
	.word	1374389535
	.word	.LC83(GOTOFF)
	.size	commandServer, .-commandServer
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 116
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #120
	ldr	sl, .L338
.L337:
	add	sl, pc, sl
	ldr	r3, .L338+4
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L338+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-44]
	mvn	r3, #0
	str	r3, [fp, #-52]
	mov	r3, #10
	str	r3, [fp, #-40]
	mvn	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #3
	str	r3, [fp, #-20]
.L335:
	sub	r3, fp, #52
	sub	r2, fp, #62
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-40]
	bl	Receive(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L338+12
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldrb	r3, [fp, #-62]	@ zero_extendqisi2
	str	r3, [fp, #-32]
	ldrb	r3, [fp, #-61]	@ zero_extendqisi2
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-60]	@ zero_extendqisi2
	mov	r1, r3
	mov	r2, r1
	mov	r2, r2, asl #5
	rsb	r2, r1, r2
	mov	r3, r2, asl #6
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	add	r3, r3, r1
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #7
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-59]	@ zero_extendqisi2
	mov	r1, r3
	mov	r2, r1
	mov	r2, r2, asl #5
	rsb	r2, r1, r2
	mov	r3, r2, asl #6
	rsb	r3, r2, r3
	mov	r3, r3, asl #3
	add	r3, r3, r1
	mov	r3, r3, asl #6
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-58]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #5
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #5
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-57]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #5
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #4
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-56]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #5
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-55]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-54]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-53]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-52]
	mov	r0, r3
	ldr	r3, .L338+16
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r0, [fp, #-48]
	ldr	r1, [fp, #-24]
	bl	DelayUntil(PLT)
	mov	r3, #114
	strb	r3, [fp, #-126]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	strb	r3, [fp, #-125]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	strb	r3, [fp, #-124]
	mov	r3, #0
	strb	r3, [fp, #-123]
	sub	r2, fp, #126
	sub	ip, fp, #129
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-44]
	mov	r1, r2
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L338+20
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L335
.L339:
	.align	2
.L338:
	.word	_GLOBAL_OFFSET_TABLE_-(.L337+8)
	.word	.LC9(GOTOFF)
	.word	.LC84(GOTOFF)
	.word	.LC85(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC86(GOTOFF)
	.size	commandReverseDelayServer, .-commandReverseDelayServer
	.section	.rodata
	.align	2
.LC87:
	.ascii	"<DeathServer>: Error sending message to CommandServ"
	.ascii	"er.\015\012\000"
	.text
	.align	2
	.global	DeathServer
	.type	DeathServer, %function
DeathServer:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #84
	ldr	sl, .L343
.L342:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, .L343+4
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #3
	str	r3, [fp, #-20]
	mov	r3, #81
	strb	r3, [fp, #-92]
	mov	r3, #81
	strb	r3, [fp, #-91]
	sub	r2, fp, #92
	sub	ip, fp, #95
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-24]
	mov	r1, r2
	mov	r2, #4
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L343+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #81
	strb	r3, [fp, #-92]
	mov	r3, #81
	strb	r3, [fp, #-91]
	sub	r2, fp, #92
	sub	ip, fp, #95
	ldr	r3, [fp, #-20]
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
	ldr	r3, .L343+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	bl	Quit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L344:
	.align	2
.L343:
	.word	_GLOBAL_OFFSET_TABLE_-(.L342+8)
	.word	.LC43(GOTOFF)
	.word	.LC87(GOTOFF)
	.size	DeathServer, .-DeathServer
	.ident	"GCC: (GNU) 4.0.2"
