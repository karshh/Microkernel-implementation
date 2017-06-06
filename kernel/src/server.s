	.file	"server.c"
	.text
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
.LC0:
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
	ldr	sl, .L6
.L5:
	add	sl, pc, sl
	sub	r3, fp, #20
	mov	r0, r3
	bl	nameServerInit(PLT)
	mov	r3, r0
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L6+4
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
	.word	.LC0(GOTOFF)
	.size	nameServerRun, .-nameServerRun
	.section	.rodata
	.align	2
.LC1:
	.ascii	"01\000"
	.align	2
.LC3:
	.ascii	"10\000"
	.align	2
.LC4:
	.ascii	"DO NOT SEND TO NAME SERVER\000"
	.align	2
.LC2:
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
	ldr	sl, .L29
.L28:
	add	sl, pc, sl
	sub	r3, fp, #9472
	sub	r3, r3, #16
	sub	r3, r3, #60
	mov	r0, r3
	bl	initDictionary(PLT)
	b	.L27
.L9:
.L27:
	ldr	r2, .L29+4
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
	ldr	r3, .L29+8
	sub	r1, fp, #16
	str	r2, [r1, r3]
	ldr	r3, .L29+8
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	cmp	r3, #3
	ble	.L10
	ldr	r3, .L29+12
	sub	ip, fp, #16
	ldrb	r3, [ip, r3]	@ zero_extendqisi2
	ldr	r2, .L29+16
	sub	r0, fp, #16
	strb	r3, [r0, r2]
	ldr	r3, .L29+12
	mov	r2, #1
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r3, r3, r2
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r3, .L29+16
	mov	r2, #1
	sub	ip, fp, #16
	add	r3, ip, r3
	add	r2, r3, r2
	mov	r3, r1
	strb	r3, [r2, #0]
	ldr	r3, .L29+16
	mov	r2, #2
	sub	r0, fp, #16
	add	r3, r0, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r2, .L29+20
	mov	r3, #0
	sub	r1, fp, #16
	str	r3, [r1, r2]
	ldr	r2, .L29+20
	mov	r3, #0
	sub	ip, fp, #16
	str	r3, [ip, r2]
	b	.L12
.L13:
	ldr	r3, .L29+20
	sub	r1, fp, #16
	ldr	r0, [r1, r3]
	ldr	r3, .L29+20
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	add	r3, r3, #2
	ldr	r2, .L29+12
	sub	ip, fp, #16
	add	r3, ip, r3
	add	r3, r3, r2
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r2, .L29+24
	sub	ip, fp, #16
	add	r3, ip, r0
	add	r2, r3, r2
	mov	r3, r1
	strb	r3, [r2, #0]
	ldr	r3, .L29+20
	sub	r0, fp, #16
	ldr	r3, [r0, r3]
	add	r2, r3, #1
	ldr	r3, .L29+20
	sub	r1, fp, #16
	str	r2, [r1, r3]
.L12:
	ldr	r3, .L29+20
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	cmp	r3, #14
	ble	.L13
	sub	r3, fp, #9536
	sub	r3, r3, #16
	sub	r3, r3, #23
	mov	r0, r3
	ldr	r3, .L29+28
	add	r3, sl, r3
	mov	r1, r3
	bl	pkstreq_volatile(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L15
	ldr	r2, .L29+32
	mov	r3, #0
	sub	ip, fp, #16
	str	r3, [ip, r2]
	ldr	r2, .L29+36
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
	ldr	r3, .L29+36
	sub	r1, fp, #16
	str	r2, [r1, r3]
	ldr	r3, .L29+36
	sub	r2, fp, #16
	ldr	r3, [r2, r3]
	cmp	r3, #0
	bne	.L17
	ldr	r2, .L29+32
	mvn	r3, #1
	sub	ip, fp, #16
	str	r3, [ip, r2]
.L17:
	ldr	r2, .L29+40
	ldr	r3, .L29+44
	add	r3, sl, r3
	ldrh	r3, [r3, #0]	@ movhi
	sub	r0, fp, #16
	strh	r3, [r0, r2]	@ movhi
	ldr	r3, .L29+32
	sub	r1, fp, #16
	ldr	r3, [r1, r3]
	and	r3, r3, #255
	ldr	r2, .L29+40
	sub	ip, fp, #16
	strb	r3, [ip, r2]
	mov	r3, #2
	str	r3, [fp, #-44]
	ldr	r3, .L29+4
	sub	r0, fp, #16
	ldr	r2, [r0, r3]
	sub	r3, fp, #9536
	sub	r3, r3, #16
	sub	r3, r3, #58
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-44]
	bl	Reply(PLT)
	b	.L9
.L15:
	sub	r3, fp, #9536
	sub	r3, r3, #16
	sub	r3, r3, #23
	mov	r0, r3
	ldr	r3, .L29+48
	add	r3, sl, r3
	mov	r1, r3
	bl	pkstreq_volatile(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L20
	ldr	r3, .L29+4
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
	ldr	r2, .L29+52
	ldr	r3, .L29+44
	add	r3, sl, r3
	ldrh	r3, [r3, #0]	@ movhi
	sub	ip, fp, #16
	strh	r3, [ip, r2]	@ movhi
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L22
	ldr	r3, .L29+52
	mov	r2, #0
	sub	r0, fp, #16
	strb	r2, [r0, r3]
	b	.L24
.L22:
	ldr	r3, .L29+52
	mvn	r2, #1
	sub	r1, fp, #16
	strb	r2, [r1, r3]
.L24:
	mov	r3, #2
	str	r3, [fp, #-36]
	ldr	r3, .L29+4
	sub	ip, fp, #16
	ldr	r2, [ip, r3]
	sub	r3, fp, #9536
	sub	r3, r3, #16
	sub	r3, r3, #60
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-36]
	bl	Reply(PLT)
	b	.L9
.L20:
	ldr	r3, .L29+56
	add	r3, sl, r3
	str	r3, [fp, #-32]
	mov	r3, #27
	str	r3, [fp, #-28]
	ldr	r3, .L29+4
	sub	r0, fp, #16
	ldr	r3, [r0, r3]
	mov	r0, r3
	ldr	r1, [fp, #-32]
	ldr	r2, [fp, #-28]
	bl	Reply(PLT)
	b	.L9
.L10:
	ldr	r3, .L29+56
	add	r3, sl, r3
	str	r3, [fp, #-24]
	mov	r3, #27
	str	r3, [fp, #-20]
	ldr	r3, .L29+4
	sub	r1, fp, #16
	ldr	r3, [r1, r3]
	mov	r0, r3
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	bl	Reply(PLT)
	b	.L9
.L30:
	.align	2
.L29:
	.word	_GLOBAL_OFFSET_TABLE_-(.L28+8)
	.word	-9536
	.word	-9580
	.word	-9556
	.word	-9559
	.word	-9584
	.word	-9575
	.word	.LC1(GOTOFF)
	.word	-9588
	.word	-9592
	.word	-9594
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	-9596
	.word	.LC4(GOTOFF)
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
	ble	.L34
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L36
.L34:
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
	b	.L51
.L38:
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
	ble	.L39
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L37
.L39:
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-20]
.L37:
.L51:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L38
	b	.L42
.L43:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L42:
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #1024]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	ble	.L44
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
	bgt	.L43
.L44:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #1024]
	cmp	r3, #0
	beq	.L46
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #1024]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	b	.L48
.L49:
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
.L48:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L49
.L46:
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
.L36:
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
	bgt	.L53
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L55
.L53:
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
.L55:
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
.L58:
	b	.L58
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
.L61:
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
	b	.L61
	.size	clockNotifier, .-clockNotifier
	.section	.rodata
	.align	2
.LC5:
	.ascii	"clockServer\000"
	.align	2
.LC6:
	.ascii	"Failed to register clockServer.\015\012\000"
	.align	2
.LC7:
	.ascii	"Invalid code received\015\012\000"
	.align	2
.LC8:
	.ascii	"<ClockServer>: Reinsertion error: Could not put bac"
	.ascii	"k TD<%d> into storage.\015\012\000"
	.align	2
.LC9:
	.ascii	"<ClockServer>: Delay overflow error. Could not dela"
	.ascii	"y TD<%d>.\015\012\000"
	.align	2
.LC10:
	.ascii	"<ClockServer>: Delay storage error. Could not put %"
	.ascii	"d into storage.\015\012\000"
	.align	2
.LC11:
	.ascii	"<ClockServer>: Time overflow error. Could not send "
	.ascii	"time to TD<%d>.\015\012\000"
	.align	2
.LC12:
	.ascii	"<ClockServer>: DelayUntil overflow error. Could not"
	.ascii	" delay TD<%d>.\015\012\000"
	.align	2
.LC13:
	.ascii	"<ClockServer>: DelayUntil storage error. Could not "
	.ascii	"put TD<%d> into storage.\015\012\000"
	.align	2
.LC14:
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
	ldr	sl, .L82
.L81:
	add	sl, pc, sl
	ldr	r3, .L82+4
	add	r3, sl, r3
	mov	r0, r3
	bl	RegisterAs(PLT)
	mov	r3, r0
	cmp	r3, #0
	movne	r3, #0
	moveq	r3, #1
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L82+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r0, #31
	ldr	r3, .L82+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #1
	ldr	r3, .L82+16
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
	b	.L80
.L64:
.L80:
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
	ldr	r3, .L82+20
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r2, [fp, #-1064]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L65
	ldr	r3, [fp, #-1076]
	add	r3, r3, #1
	str	r3, [fp, #-1076]
.L67:
	sub	r3, fp, #1056
	sub	r3, r3, #4
	sub	r2, fp, #32
	mov	r0, r3
	mov	r1, r2
	bl	deleteFromStorage(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L68
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-1076]
	cmp	r2, r3
	ble	.L70
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
	ldr	r3, .L82+24
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L68
.L70:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	ldr	r3, .L82+28
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L67
.L68:
	ldr	r0, [fp, #-24]
	ldr	r3, .L82+28
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L64
.L65:
	ldrb	r3, [fp, #-1071]	@ zero_extendqisi2
	str	r3, [fp, #-1088]
	ldr	r2, [fp, #-1088]
	str	r2, [fp, #-1112]
	ldr	r3, [fp, #-1112]
	cmp	r3, #10
	beq	.L74
	ldr	r2, [fp, #-1112]
	cmp	r2, #10
	blt	.L73
	ldr	r3, [fp, #-1112]
	cmp	r3, #11
	beq	.L75
	ldr	r2, [fp, #-1112]
	cmp	r2, #12
	beq	.L76
	b	.L73
.L74:
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
	ldr	r3, .L82+32
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
	ldr	r3, .L82+36
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L64
.L75:
	ldr	r3, [fp, #-1076]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	ldr	ip, [fp, #-1064]
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L82+40
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	ldr	r1, [fp, #-1076]
	ldr	r3, .L82+44
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #25
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L82+48
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
	ldr	r3, .L82+52
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #18
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L82+48
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
	ldr	r3, .L82+56
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #12
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L82+48
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
	ldr	r3, .L82+48
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L82+48
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
	ldr	r3, .L82+48
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
	b	.L64
.L76:
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
	ldr	r3, .L82+60
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-1076]
	cmp	r2, r3
	bgt	.L77
	ldr	r3, [fp, #-1064]
	mov	r0, r3
	ldr	r3, .L82+28
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
.L77:
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
	ldr	r3, .L82+64
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L64
.L73:
	ldr	r3, [fp, #-1088]
	mov	r0, #0
	mov	r1, #1
	ldr	r2, .L82+68
	add	r2, sl, r2
	bl	bwassert(PLT)
	b	.L64
.L83:
	.align	2
.L82:
	.word	_GLOBAL_OFFSET_TABLE_-(.L81+8)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	idleTask(GOT)
	.word	clockNotifier(GOT)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	1441151881
	.word	1374389535
	.word	1125899907
	.word	1759218605
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.size	clockServer, .-clockServer
	.align	2
	.global	FirstUserTask
	.type	FirstUserTask, %function
FirstUserTask:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L87
.L86:
	add	sl, pc, sl
	mov	r0, #2
	ldr	r3, .L87+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	CreateNameServer(PLT)
	mov	r0, #2
	ldr	r3, .L87+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	CreateClockServer(PLT)
	bl	Exit(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L88:
	.align	2
.L87:
	.word	_GLOBAL_OFFSET_TABLE_-(.L86+8)
	.word	NameServerTask(GOT)
	.word	clockServer(GOT)
	.size	FirstUserTask, .-FirstUserTask
	.align	2
	.global	UART1Send_Notifier
	.type	UART1Send_Notifier, %function
UART1Send_Notifier:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L93
.L92:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #3
	str	r3, [fp, #-20]
.L90:
	mov	r0, #1
	bl	AwaitEvent(PLT)
	sub	ip, fp, #27
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-24]
	ldr	r3, .L93+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	b	.L90
.L94:
	.align	2
.L93:
	.word	_GLOBAL_OFFSET_TABLE_-(.L92+8)
	.word	.LC2(GOTOFF)
	.size	UART1Send_Notifier, .-UART1Send_Notifier
	.align	2
	.global	UART1Receive_Notifier
	.type	UART1Receive_Notifier, %function
UART1Receive_Notifier:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L99
.L98:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #3
	str	r3, [fp, #-20]
.L96:
	mov	r0, #2
	bl	AwaitEvent(PLT)
	sub	ip, fp, #27
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-24]
	ldr	r3, .L99+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	b	.L96
.L100:
	.align	2
.L99:
	.word	_GLOBAL_OFFSET_TABLE_-(.L98+8)
	.word	.LC2(GOTOFF)
	.size	UART1Receive_Notifier, .-UART1Receive_Notifier
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
	ldr	sl, .L105
.L104:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #3
	str	r3, [fp, #-20]
.L102:
	mov	r0, #3
	bl	AwaitEvent(PLT)
	sub	ip, fp, #27
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-24]
	ldr	r3, .L105+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	b	.L102
.L106:
	.align	2
.L105:
	.word	_GLOBAL_OFFSET_TABLE_-(.L104+8)
	.word	.LC2(GOTOFF)
	.size	UART2Send_Notifier, .-UART2Send_Notifier
	.align	2
	.global	UART2Receive_Notifier
	.type	UART2Receive_Notifier, %function
UART2Receive_Notifier:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L111
.L110:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #3
	str	r3, [fp, #-20]
.L108:
	mov	r0, #4
	bl	AwaitEvent(PLT)
	sub	ip, fp, #27
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-24]
	ldr	r3, .L111+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	b	.L108
.L112:
	.align	2
.L111:
	.word	_GLOBAL_OFFSET_TABLE_-(.L110+8)
	.word	.LC2(GOTOFF)
	.size	UART2Receive_Notifier, .-UART2Receive_Notifier
	.section	.rodata
	.align	2
.LC15:
	.ascii	"<ioServer>: Receive error.\015\012\000"
	.align	2
.LC16:
	.ascii	"<ioServer>: Illegal request code from userTask <%d>"
	.ascii	".\015\012\000"
	.text
	.align	2
	.global	ioServer
	.type	ioServer, %function
ioServer:
	@ args = 0, pretend = 0, frame = 584
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #584
	ldr	sl, .L145
.L144:
	add	sl, pc, sl
	sub	r3, fp, #156
	mov	r0, r3
	bl	circularBufferInit(PLT)
	sub	r3, fp, #292
	mov	r0, r3
	bl	circularBufferInit(PLT)
	sub	r3, fp, #428
	mov	r0, r3
	bl	circularBufferInit(PLT)
	sub	r3, fp, #564
	mov	r0, r3
	bl	circularBufferInit(PLT)
	mov	r0, #1
	ldr	r3, .L145+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-568]
	mov	r0, #1
	ldr	r3, .L145+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-572]
	mov	r0, #1
	ldr	r3, .L145+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-576]
	mov	r0, #1
	ldr	r3, .L145+16
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-580]
	mvn	r3, #0
	str	r3, [fp, #-584]
	mov	r3, #7
	str	r3, [fp, #-20]
	mov	r3, #0
	strb	r3, [fp, #-598]
	b	.L143
.L114:
.L143:
	sub	r2, fp, #584
	sub	r3, fp, #588
	sub	r3, r3, #3
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	Receive(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L145+20
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r2, [fp, #-584]
	ldr	r3, [fp, #-568]
	cmp	r2, r3
	bne	.L115
	ldr	r3, .L145+24
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L117
	ldr	r3, .L145+24
	ldr	r3, [r3, #0]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L117
	sub	r3, fp, #596
	sub	r3, r3, #2
	sub	r2, fp, #156
	mov	r0, r3
	mov	r1, r2
	bl	getFromBuffer(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L117
	ldr	r3, .L145+28
	ldrb	r2, [fp, #-598]	@ zero_extendqisi2
	str	r2, [r3, #0]
.L117:
	ldr	r3, [fp, #-584]
	mov	r0, r3
	ldr	r3, .L145+32
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L114
.L115:
	ldr	r2, [fp, #-584]
	ldr	r3, [fp, #-572]
	cmp	r2, r3
	bne	.L122
	ldr	r3, .L145+24
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L124
	ldr	r3, .L145+28
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-598]
	ldrb	r3, [fp, #-598]	@ zero_extendqisi2
	sub	r2, fp, #292
	mov	r0, r3
	mov	r1, r2
	bl	addToBuffer(PLT)
.L124:
	ldr	r3, [fp, #-584]
	mov	r0, r3
	ldr	r3, .L145+32
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L114
.L122:
	ldr	r2, [fp, #-584]
	ldr	r3, [fp, #-576]
	cmp	r2, r3
	bne	.L126
	ldr	r3, .L145+36
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L128
	ldr	r3, .L145+36
	ldr	r3, [r3, #0]
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L128
	sub	r3, fp, #596
	sub	r3, r3, #2
	sub	r2, fp, #428
	mov	r0, r3
	mov	r1, r2
	bl	getFromBuffer(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L128
	ldr	r3, .L145+40
	ldrb	r2, [fp, #-598]	@ zero_extendqisi2
	str	r2, [r3, #0]
.L128:
	ldr	r3, [fp, #-584]
	mov	r0, r3
	ldr	r3, .L145+32
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L114
.L126:
	ldr	r2, [fp, #-584]
	ldr	r3, [fp, #-580]
	cmp	r2, r3
	bne	.L132
	ldr	r3, .L145+36
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L134
	ldr	r3, .L145+40
	ldr	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [fp, #-598]
	ldrb	r3, [fp, #-598]	@ zero_extendqisi2
	sub	r2, fp, #564
	mov	r0, r3
	mov	r1, r2
	bl	addToBuffer(PLT)
.L134:
	ldr	r3, [fp, #-584]
	mov	r0, r3
	ldr	r3, .L145+32
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L114
.L132:
	ldrb	r3, [fp, #-591]	@ zero_extendqisi2
	sub	r3, r3, #10
	cmp	r3, #11
	addls	pc, pc, r3, asl #2
	b	.L136
	.p2align 2
.L141:
	b	.L137
	b	.L138
	b	.L136
	b	.L136
	b	.L136
	b	.L136
	b	.L136
	b	.L136
	b	.L136
	b	.L136
	b	.L139
	b	.L140
.L137:
	sub	r3, fp, #596
	sub	r3, r3, #2
	sub	r2, fp, #292
	mov	r0, r3
	mov	r1, r2
	bl	getFromBuffer(PLT)
	ldrb	r3, [fp, #-598]	@ zero_extendqisi2
	strb	r3, [fp, #-597]
	mov	r3, #0
	strb	r3, [fp, #-596]
	ldr	r2, [fp, #-584]
	sub	r3, fp, #596
	sub	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L114
.L138:
	ldrb	r3, [fp, #-590]	@ zero_extendqisi2
	strb	r3, [fp, #-598]
	ldrb	r3, [fp, #-598]	@ zero_extendqisi2
	sub	r2, fp, #156
	mov	r0, r3
	mov	r1, r2
	bl	addToBuffer(PLT)
	ldr	r3, [fp, #-584]
	mov	r0, r3
	ldr	r3, .L145+32
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L114
.L139:
	sub	r3, fp, #596
	sub	r3, r3, #2
	sub	r2, fp, #564
	mov	r0, r3
	mov	r1, r2
	bl	getFromBuffer(PLT)
	ldrb	r3, [fp, #-598]	@ zero_extendqisi2
	strb	r3, [fp, #-597]
	mov	r3, #0
	strb	r3, [fp, #-596]
	ldr	r2, [fp, #-584]
	sub	r3, fp, #596
	sub	r3, r3, #1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L114
.L140:
	ldrb	r3, [fp, #-590]	@ zero_extendqisi2
	strb	r3, [fp, #-598]
	ldrb	r3, [fp, #-598]	@ zero_extendqisi2
	sub	r2, fp, #428
	mov	r0, r3
	mov	r1, r2
	bl	addToBuffer(PLT)
	ldr	r3, [fp, #-584]
	mov	r0, r3
	ldr	r3, .L145+32
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L114
.L136:
	ldr	r3, [fp, #-584]
	mov	r0, #0
	mov	r1, #1
	ldr	r2, .L145+44
	add	r2, sl, r2
	bl	bwassert(PLT)
	b	.L114
.L146:
	.align	2
.L145:
	.word	_GLOBAL_OFFSET_TABLE_-(.L144+8)
	.word	UART1Send_Notifier(GOT)
	.word	UART1Receive_Notifier(GOT)
	.word	UART2Send_Notifier(GOT)
	.word	UART2Receive_Notifier(GOT)
	.word	.LC15(GOTOFF)
	.word	-2138308584
	.word	-2138308608
	.word	.LC2(GOTOFF)
	.word	-2138243048
	.word	-2138243072
	.word	.LC16(GOTOFF)
	.size	ioServer, .-ioServer
	.ident	"GCC: (GNU) 4.0.2"
