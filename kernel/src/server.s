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
	add	r2, r2, r3
	mov	r3, r2, lsr #31
	add	r3, r3, r2
	mov	r3, r3, asr #1
	str	r3, [fp, #-24]
	b	.L47
.L38:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
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
.L47:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L38
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #1024]
	cmp	r3, #0
	beq	.L42
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #1024]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	b	.L44
.L45:
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
.L44:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L45
.L42:
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
	bgt	.L49
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L51
.L49:
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
.L51:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	deleteFromStorage, .-deleteFromStorage
	.section	.rodata
	.align	2
.LC5:
	.ascii	"ID: Enter\015\012\000"
	.align	2
.LC6:
	.ascii	"ID: Exit\015\012\000"
	.text
	.align	2
	.global	idleTask
	.type	idleTask, %function
idleTask:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L63
.L62:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-20]
.L54:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L55
.L56:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L55:
	ldr	r2, [fp, #-20]
	ldr	r3, .L63+4
	cmp	r2, r3
	ble	.L56
	mov	r0, #1
	ldr	r3, .L63+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	mov	r0, #1
	ldr	r3, .L63+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L58
.L59:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L58:
	ldr	r2, [fp, #-20]
	ldr	r3, .L63+4
	cmp	r2, r3
	ble	.L59
	b	.L54
.L64:
	.align	2
.L63:
	.word	_GLOBAL_OFFSET_TABLE_-(.L62+8)
	.word	9999
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.size	idleTask, .-idleTask
	.section	.rodata
	.align	2
.LC7:
	.ascii	"clockNotifier: ENTERING NOTIFICATION LOOP\015\012\000"
	.align	2
.LC8:
	.ascii	"clockNotifier: TIMER INTERRUPT\015\012\000"
	.align	2
.LC9:
	.ascii	"clockNotifier: BACK TO AWAITING EVENT\015\012\000"
	.text
	.align	2
	.global	clockNotifier
	.type	clockNotifier, %function
clockNotifier:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L69
.L68:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #3
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L69+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
.L66:
	mov	r0, #0
	bl	AwaitEvent(PLT)
	mov	r0, #1
	ldr	r3, .L69+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	ip, fp, #27
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-24]
	mov	r1, #0
	mov	r2, #0
	mov	r3, ip
	bl	Send(PLT)
	mov	r0, #1
	ldr	r3, .L69+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L66
.L70:
	.align	2
.L69:
	.word	_GLOBAL_OFFSET_TABLE_-(.L68+8)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.size	clockNotifier, .-clockNotifier
	.section	.rodata
	.align	2
.LC10:
	.ascii	"clockServer: CREATING IDLE TASK\015\012\000"
	.align	2
.LC11:
	.ascii	"clockServer: CREATING CLOCK NOTIFIER\015\012\000"
	.align	2
.LC12:
	.ascii	"Invalid code received\015\012\000"
	.align	2
.LC13:
	.ascii	"clockServer: NOTIFIED BY THE GREAT NOTIFIER\015\012"
	.ascii	"\000"
	.align	2
.LC14:
	.ascii	"Could not put back %d into storage.\015\012\000"
	.align	2
.LC15:
	.ascii	"clockServer: BACK TO RECEIVE MODE\015\012\000"
	.align	2
.LC16:
	.ascii	"Could not put %d into storage.\015\012\000"
	.text
	.align	2
	.global	clockServer
	.type	clockServer, %function
clockServer:
	@ args = 0, pretend = 0, frame = 1056
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #1056
	ldr	sl, .L83
.L82:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L83+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #10
	ldr	r3, .L83+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #1
	ldr	r3, .L83+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #6
	ldr	r3, .L83+16
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
	mov	r3, #3
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-1072]
	b	.L81
.L72:
.L81:
	sub	r2, fp, #1056
	sub	r2, r2, #8
	sub	r3, fp, #1056
	sub	r3, r3, #11
	mov	r0, r2
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	Receive(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L83+20
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r2, [fp, #-1064]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L73
	mov	r0, #1
	ldr	r3, .L83+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-1072]
	add	r3, r3, #1
	str	r3, [fp, #-1072]
	b	.L75
.L76:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	ldr	r3, .L83+28
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
.L75:
	sub	r3, fp, #1056
	sub	r3, r3, #4
	sub	r2, fp, #32
	mov	r0, r3
	mov	r1, r2
	bl	deleteFromStorage(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L77
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-1072]
	cmp	r2, r3
	blt	.L76
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
	ldr	r3, .L83+32
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	mov	r0, #1
	ldr	r3, .L83+36
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r0, [fp, #-24]
	ldr	r3, .L83+28
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L72
.L73:
	ldr	r3, [fp, #-1064]
	str	r3, [fp, #-32]
	ldrb	r3, [fp, #-1066]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-1072]
	add	r3, r2, r3
	str	r3, [fp, #-28]
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
	ldr	r3, .L83+40
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	bwassert(PLT)
	b	.L72
.L84:
	.align	2
.L83:
	.word	_GLOBAL_OFFSET_TABLE_-(.L82+8)
	.word	.LC10(GOTOFF)
	.word	idleTask(GOT)
	.word	.LC11(GOTOFF)
	.word	clockNotifier(GOT)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.size	clockServer, .-clockServer
	.ident	"GCC: (GNU) 4.0.2"
