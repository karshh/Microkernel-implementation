	.file	"server.c"
	.text
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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Failed NameServer initialization.\012\015\000"
	.text
	.align	2
	.global	nameServerRun
	.type	nameServerRun, %function
nameServerRun:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L6
	sub	sp, sp, #4
.L5:
	add	sl, pc, sl
	mov	r0, sp
	bl	nameServerInit(PLT)
	ldr	r2, .L6+4
	mov	r1, #1
	add	r2, sl, r2
	bl	bwassert(PLT)
	mov	r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {sl, pc}
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
	.word	.LC0(GOTOFF)
	.size	nameServerRun, .-nameServerRun
	.section	.rodata.str1.4
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
	@ args = 0, pretend = 0, frame = 9584
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #9536
	sub	sp, sp, #48
	ldr	sl, .L34
	add	r8, sp, #48
	sub	r8, r8, #28
.L31:
	add	sl, pc, sl
	mov	r0, r8
	bl	initDictionary(PLT)
	ldr	r1, .L34+4
	ldr	r2, .L34+8
	ldr	r3, .L34+12
	add	ip, sp, #9536
	add	lr, sp, #9536
	add	r5, sp, #9536
	add	r7, sp, #9472
	add	r6, sp, #9536
	add	ip, ip, #4
	add	lr, lr, #24
	add	fp, sp, #9536
	ldr	r9, .L34+16
	str	r1, [sp, #12]
	str	r2, [sp, #8]
	str	r3, [sp, #0]
	add	r5, r5, #36
	add	r7, r7, #48
	add	r6, r6, #43
	str	ip, [sp, #16]
	str	lr, [sp, #4]
	add	fp, fp, #46
.L32:
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
	ble	.L10
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
	bgt	.L12
.L27:
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
	ble	.L27
.L12:
	mov	r0, r6
	add	r1, sl, r9
	bl	pkstreq_volatile(PLT)
	subs	r4, r0, #0
	beq	.L14
	add	lr, sp, #8192
	mov	r3, #0
	str	r3, [lr, #1368]
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #4]
	str	r3, [lr, #1364]
	mov	r0, r8
	bl	searchDictionary(PLT)
	add	r1, sp, #8192
	str	r0, [r1, #1364]
	ldr	r3, [r1, #1364]
	ldr	ip, [sp, #12]
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
	b	.L32
.L14:
	ldr	r2, [sp, #8]
	mov	r0, r6
	add	r1, sl, r2
	bl	pkstreq_volatile(PLT)
	cmp	r0, #0
	beq	.L18
	add	r3, sp, #8192
	ldr	r1, [sp, #16]
	ldr	r2, [r3, #1380]
	mov	r0, r8
	bl	addDictionary(PLT)
	ldr	ip, [sp, #12]
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
	b	.L32
.L10:
	ldr	r2, [sp, #0]
	add	lr, sp, #8192
	add	r1, sl, r2
	ldr	r0, [lr, #1380]
	mov	r2, #27
	bl	Reply(PLT)
	b	.L32
.L18:
	ldr	ip, [sp, #0]
	add	r3, sp, #8192
	ldr	r0, [r3, #1380]
	add	r1, sl, ip
	mov	r2, #27
	bl	Reply(PLT)
	b	.L32
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.L31+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC1(GOTOFF)
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
	bgt	.L41
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
	b	.L67
.L43:
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
.L67:
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #8]
	cmp	r2, r3
	bne	.L43
	ldr	r3, [sp, #4]
	cmp	r0, r3
	ble	.L48
.L65:
	ldr	r3, [sp, #4]
	add	r3, r4, r3, asl #3
	ldr	r1, [r3, #4]
	ldr	r2, [r5, #4]
	cmp	r1, r2
	ble	.L48
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r0, r2
	bgt	.L65
.L48:
	cmp	r0, #0
	beq	.L50
	sub	r3, r0, #1
	b	.L66
.L68:
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
.L66:
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bge	.L68
.L50:
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
.L41:
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
	ble	.L72
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
.L72:
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
.L76:
	b	.L76
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
.L79:
	mov	r0, #0
	bl	AwaitEvent(PLT)
	mov	r1, #0
	mov	r0, r4
	mov	r2, r1
	mov	r3, r6
	str	r5, [sp, #0]
	bl	Send(PLT)
	b	.L79
	.size	clockNotifier, .-clockNotifier
	.section	.rodata.str1.4
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
	@ args = 0, pretend = 0, frame = 1152
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L109
	ldr	r0, .L109+4
.L103:
	add	sl, pc, sl
	sub	sp, sp, #1152
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L109+8
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L109+12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	add	fp, sp, #96
	sub	fp, fp, #8
	str	r0, [sp, #84]
	mov	r0, fp
	bl	initStorage(PLT)
	ldr	r2, .L109+16
	ldr	r3, .L109+20
	ldr	r0, .L109+24
	ldr	r1, .L109+28
	ldr	r6, .L109+32
	ldr	r8, .L109+36
	str	r2, [sp, #8]
	str	r3, [sp, #48]
	mov	r2, #0
	mvn	r3, #0
	str	r0, [sp, #56]
	str	r1, [sp, #52]
	str	r6, [sp, #40]
	str	r8, [sp, #36]
	ldr	ip, .L109+40
	ldr	r0, .L109+44
	ldr	r1, .L109+48
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
	str	ip, [sp, #28]
	str	r0, [sp, #24]
	str	r1, [sp, #20]
	str	r2, [sp, #12]
	str	r3, [sp, #32]
	str	r6, [sp, #44]
	str	r8, [sp, #16]
.L104:
	ldr	r1, [sp, #32]
	mov	r2, #7
	ldr	r0, [sp, #12]
	bl	Receive(PLT)
	ldr	ip, [sp, #56]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, ip
	bl	bwassert(PLT)
	ldr	r5, [sp, #1148]
	ldr	r0, [sp, #84]
	cmp	r0, r5
	beq	.L105
	ldrb	r3, [sp, #1127]	@ zero_extendqisi2
	str	r3, [sp, #1140]
	ldr	r3, [sp, #1140]
	cmp	r3, #10
	beq	.L91
	blt	.L90
	cmp	r3, #11
	beq	.L92
	cmp	r3, #12
	beq	.L106
.L90:
	ldr	r6, [sp, #20]
	ldr	r3, [sp, #1140]
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, r6
	bl	bwassert(PLT)
	b	.L104
.L105:
	ldr	r3, [sp, #1144]
	add	r3, r3, #1
	str	r3, [sp, #1144]
	b	.L85
.L107:
	ldr	r0, [sp, #1120]
	ldr	r3, [sp, #1144]
	cmp	r0, r3
	bgt	.L98
	ldr	r0, [sp, #1116]
	bl	Reply(PLT)
.L85:
	ldr	r1, [sp, #44]
	mov	r0, fp
	bl	deleteFromStorage(PLT)
	ldr	r2, [sp, #8]
	cmp	r0, #0
	add	r1, sl, r2
	mov	r2, #2
	bne	.L107
	ldr	r3, [sp, #8]
	ldr	r0, [sp, #84]
	add	r1, sl, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L104
.L91:
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
	ldr	r8, [sp, #48]
	mvn	r0, r0
	mov	r3, r5
	add	r2, sl, r8
	mov	r0, r0, lsr #31
	mov	r1, #1
	str	r5, [sp, #1116]
	bl	bwassert(PLT)
	ldr	r1, [sp, #44]
	mov	r0, fp
	bl	insertIntoStorage(PLT)
	ldr	ip, [sp, #40]
	mov	r1, #1
	add	r2, sl, ip
	ldr	r3, [sp, #1116]
	bl	bwassert(PLT)
	b	.L104
.L98:
	ldr	r1, [sp, #44]
	mov	r0, fp
	bl	insertIntoStorage(PLT)
	ldr	r6, [sp, #52]
	ldr	r3, [sp, #1116]
	add	r2, sl, r6
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, [sp, #8]
	ldr	r0, [sp, #84]
	add	r1, sl, r3
	mov	r2, #2
	bl	Reply(PLT)
	b	.L104
.L92:
	ldr	r0, [sp, #1144]
	ldr	r1, [sp, #36]
	mvn	r0, r0
	add	r2, sl, r1
	mov	r3, r5
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r2, [sp, #1144]
	ldr	r3, .L109+52
	ldr	lr, [sp, #1144]
	smull	r6, r8, r3, r2
	ldr	r4, [sp, #1144]
	str	r2, [sp, #76]
	ldr	r3, .L109+56
	ldr	r2, .L109+60
	ldr	r1, .L109+64
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
	ldr	r1, [sp, #16]
	mov	r2, #6
	strb	r6, [sp, #1134]
	strb	lr, [sp, #1135]
	strb	r4, [sp, #1136]
	strb	r5, [sp, #1137]
	strb	r3, [sp, #1139]
	bl	Reply(PLT)
	b	.L104
.L106:
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
	ldr	r8, [sp, #28]
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
	ble	.L108
.L94:
	ldr	r1, [sp, #44]
	mov	r0, fp
	bl	insertIntoStorage(PLT)
	ldr	r3, [sp, #24]
	mov	r1, #1
	add	r2, sl, r3
	ldr	r3, [sp, #1116]
	bl	bwassert(PLT)
	b	.L104
.L108:
	ldr	ip, [sp, #8]
	ldr	r0, [sp, #1148]
	add	r1, sl, ip
	mov	r2, #2
	bl	Reply(PLT)
	b	.L94
.L110:
	.align	2
.L109:
	.word	_GLOBAL_OFFSET_TABLE_-(.L103+8)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	clockNotifier(GOT)
	.word	.LC2(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	1441151881
	.word	1759218605
	.word	1125899907
	.word	1374389535
	.size	clockServer, .-clockServer
	.section	.rodata.str1.4
	.align	2
.LC15:
	.ascii	"ioServer\000"
	.align	2
.LC16:
	.ascii	"\033[s\033[?25l\033[1;68H%d%% \033[u\033[?25h\000"
	.align	2
.LC17:
	.ascii	"\033[s\033[?25l\033[1;125H%s%d:%s%d:%s%d.%d\033[u\033"
	.ascii	"[?25h\000"
	.text
	.align	2
	.global	ClockDisplay
	.type	ClockDisplay, %function
ClockDisplay:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L132
	ldr	r0, .L132+4
.L129:
	add	sl, pc, sl
	sub	sp, sp, #56
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	fp, r0
	ldr	r0, .L132+8
	ldr	r1, .L132+12
	ldr	r2, .L132+16
	add	r0, sl, r0
	str	r1, [sp, #40]
	str	r2, [sp, #36]
	bl	WhoIs(PLT)
	mov	r6, #0
	add	r3, sp, #54
	add	ip, sp, #50
	add	r1, sp, #52
	mov	r9, r0
	str	r6, [sp, #44]
	str	r3, [sp, #24]
	str	ip, [sp, #32]
	str	r1, [sp, #28]
.L130:
	mov	r1, #10
	mov	r0, r9
	bl	Delay(PLT)
	mov	r0, r9
	bl	Time(PLT)
	ldr	ip, .L132+20
	mov	r2, r0, asr #31
	smull	r1, r3, ip, r0
	rsb	r7, r2, r3, asr #2
	smull	r2, r1, ip, r7
	mov	r5, r7, asr #31
	rsb	r8, r5, r1, asr #2
	add	r3, r8, r8, asl #2
	sub	r8, r7, r3, asl #1
	cmp	r8, #0
	beq	.L131
.L113:
	cmp	r6, r7
	beq	.L130
	ldr	r3, .L132+20
	ldr	r6, .L132+24
	smull	r1, lr, r3, r7
	rsb	lr, r5, lr, asr #2
	smull	r2, r3, r6, lr
	ldr	r4, .L132+28
	add	r3, r3, lr
	mov	r2, lr, asr #31
	rsb	r5, r2, r3, asr #5
	smull	r3, r2, r4, r5
	mov	r1, r5
	mov	r5, r5, asr #31
	rsb	r2, r5, r2, asr #2
	smull	r3, ip, r4, r2
	smull	r3, r0, r6, r1
	mov	r3, r2, asr #31
	rsb	r4, r3, ip, asr #2
	add	r0, r0, r1
	add	r3, r4, r4, asl #1
	sub	r4, r2, r3, asl #3
	rsb	ip, r5, r0, asr #5
	rsb	r3, r1, r1, asl #4
	cmp	r4, #9
	rsb	ip, ip, ip, asl #4
	mov	r2, #0
	sub	r5, lr, r3, asl #2
	sub	ip, r1, ip, asl #2
	movle	r3, #48
	strb	r2, [sp, #54]
	strleb	r3, [sp, #54]
	cmp	ip, #9
	movle	r3, #48
	strb	r2, [sp, #50]
	strleb	r3, [sp, #50]
	cmp	r5, #9
	movle	r3, #48
	str	ip, [sp, #8]
	ldr	ip, [sp, #32]
	strb	r2, [sp, #52]
	strleb	r3, [sp, #52]
	ldr	r3, [sp, #36]
	str	ip, [sp, #4]
	ldr	ip, [sp, #28]
	strb	r2, [sp, #55]
	strb	r2, [sp, #53]
	strb	r2, [sp, #51]
	mov	r0, fp
	add	r2, sl, r3
	mov	r1, #1
	ldr	r3, [sp, #24]
	str	r4, [sp, #0]
	str	r5, [sp, #16]
	str	r8, [sp, #20]
	str	ip, [sp, #12]
	bl	Printf(PLT)
	mov	r6, r7
	b	.L130
.L131:
	bl	IdlePercentage(PLT)
	ldr	r3, [sp, #44]
	mov	r4, r0
	cmp	r3, r0
	beq	.L113
	ldr	ip, [sp, #40]
	mov	r0, fp
	mov	r1, #1
	add	r2, sl, ip
	mov	r3, r4
	bl	Printf(PLT)
	str	r4, [sp, #44]
	b	.L113
.L133:
	.align	2
.L132:
	.word	_GLOBAL_OFFSET_TABLE_-(.L129+8)
	.word	.LC15(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	1717986919
	.word	-2004318071
	.word	715827883
	.size	ClockDisplay, .-ClockDisplay
	.align	2
	.global	FirstUserTask
	.type	FirstUserTask, %function
FirstUserTask:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L137
	ldr	r3, .L137+4
.L136:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	CreateNameServer(PLT)
	ldr	r3, .L137+8
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	CreateClockServer(PLT)
	ldr	r3, .L137+12
	mov	r0, #31
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L137+16
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	CreateIOServer(PLT)
	ldr	r3, .L137+20
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L138:
	.align	2
.L137:
	.word	_GLOBAL_OFFSET_TABLE_-(.L136+8)
	.word	NameServerTask(GOT)
	.word	clockServer(GOT)
	.word	idleTask(GOT)
	.word	ioServer(GOT)
	.word	ClockDisplay(GOT)
	.size	FirstUserTask, .-FirstUserTask
	.section	.rodata.str1.4
	.align	2
.LC18:
	.ascii	"<UART1Send_Notifier>: Error with send.\015\012\000"
	.text
	.align	2
	.global	UART1Send_Notifier
	.type	UART1Send_Notifier, %function
UART1Send_Notifier:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L152
	sub	sp, sp, #8
.L149:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	ldr	r7, .L152+4
	add	r6, sp, #5
	mov	ip, #3
	add	r1, sl, r7
	mov	r2, #2
	mov	r3, r6
	mov	r5, r0
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r8, .L152+8
.L150:
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	bl	bwassert(PLT)
.L151:
	mov	r0, #1
	bl	AwaitEvent(PLT)
	ldr	r3, .L152+12
	ldr	ip, [r3, #0]
	tst	ip, #128
	beq	.L151
	tst	ip, #1
	add	r1, sl, r7
	mov	r0, r5
	mov	r2, #2
	mov	r3, r6
	beq	.L151
	ldrb	lr, [sp, #5]	@ zero_extendqisi2
	ldr	ip, .L152+16
	mov	r4, #3
	str	lr, [ip, #0]
	str	r4, [sp, #0]
	bl	Send(PLT)
	b	.L150
.L153:
	.align	2
.L152:
	.word	_GLOBAL_OFFSET_TABLE_-(.L149+8)
	.word	.LC2(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	-2138308584
	.word	-2138308608
	.size	UART1Send_Notifier, .-UART1Send_Notifier
	.section	.rodata.str1.4
	.align	2
.LC19:
	.ascii	"<UART1Receive_Notifier>: Error with send.\015\012\000"
	.text
	.align	2
	.global	UART1Receive_Notifier
	.type	UART1Receive_Notifier, %function
UART1Receive_Notifier:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L165
	sub	sp, sp, #12
.L163:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	ldr	r8, .L165+4
	mov	r5, r0
	add	r7, sp, #9
	add	r6, sp, #6
.L164:
	mov	r0, #2
	bl	AwaitEvent(PLT)
	ldr	ip, .L165+8
	mov	r1, r7
	ldr	lr, [ip, #0]
	mov	r0, r5
	tst	lr, #64
	mov	r2, #2
	mov	r3, r6
	beq	.L164
	sub	ip, ip, #24
	ldr	r4, [ip, #0]
	mov	lr, #0
	mov	ip, #3
	strb	lr, [sp, #10]
	strb	r4, [sp, #9]
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	bl	bwassert(PLT)
	b	.L164
.L166:
	.align	2
.L165:
	.word	_GLOBAL_OFFSET_TABLE_-(.L163+8)
	.word	.LC19(GOTOFF)
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
	ldr	sl, .L178
	sub	sp, sp, #8
.L176:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	ldr	r7, .L178+4
	add	r6, sp, #5
	mov	ip, #3
	add	r1, sl, r7
	mov	r2, #2
	mov	r3, r6
	mov	r5, r0
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r8, .L178+8
.L177:
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	bl	bwassert(PLT)
.L175:
	mov	r0, #3
	bl	AwaitEvent(PLT)
	ldr	ip, .L178+12
	add	r1, sl, r7
	ldr	lr, [ip, #0]
	mov	r0, r5
	tst	lr, #128
	mov	r2, #2
	mov	r3, r6
	beq	.L175
	ldrb	lr, [sp, #5]	@ zero_extendqisi2
	sub	ip, ip, #24
	str	lr, [ip, #0]
	mov	r4, #3
	str	r4, [sp, #0]
	bl	Send(PLT)
	b	.L177
.L179:
	.align	2
.L178:
	.word	_GLOBAL_OFFSET_TABLE_-(.L176+8)
	.word	.LC2(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	-2138243048
	.size	UART2Send_Notifier, .-UART2Send_Notifier
	.section	.rodata.str1.4
	.align	2
.LC21:
	.ascii	"<UART2Receive_Notifier>: Error with send.\015\012\000"
	.text
	.align	2
	.global	UART2Receive_Notifier
	.type	UART2Receive_Notifier, %function
UART2Receive_Notifier:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L191
	sub	sp, sp, #12
.L189:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	ldr	r8, .L191+4
	mov	r5, r0
	add	r7, sp, #9
	add	r6, sp, #6
.L190:
	mov	r0, #4
	bl	AwaitEvent(PLT)
	ldr	ip, .L191+8
	mov	r1, r7
	ldr	lr, [ip, #0]
	mov	r0, r5
	tst	lr, #64
	mov	r2, #2
	mov	r3, r6
	beq	.L190
	sub	ip, ip, #24
	ldr	r4, [ip, #0]
	mov	lr, #0
	mov	ip, #3
	strb	lr, [sp, #10]
	strb	r4, [sp, #9]
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	bl	bwassert(PLT)
	b	.L190
.L192:
	.align	2
.L191:
	.word	_GLOBAL_OFFSET_TABLE_-(.L189+8)
	.word	.LC21(GOTOFF)
	.word	-2138243048
	.size	UART2Receive_Notifier, .-UART2Receive_Notifier
	.section	.rodata.str1.4
	.align	2
.LC22:
	.ascii	"Failed to register ioServer.\015\012\000"
	.align	2
.LC23:
	.ascii	"<ioServer>: Receive error.\015\012\000"
	.align	2
.LC24:
	.ascii	"<ioServer>: UART1_receiveTIDQ Buffer full. Cannot a"
	.ascii	"dd <%d>.\015\012\000"
	.align	2
.LC25:
	.ascii	"<IOServer>: Buffer full. Could not add %c[%d]\015\012"
	.ascii	"\000"
	.align	2
.LC26:
	.ascii	"<ioServer>: UART2_receiveTIDQ Buffer full. Cannot a"
	.ascii	"dd <%d>.\015\012\000"
	.align	2
.LC27:
	.ascii	"<ioServer>: Illegal request code from userTask <%d>"
	.ascii	".\015\012\000"
	.text
	.align	2
	.global	ioServer
	.type	ioServer, %function
ioServer:
	@ args = 0, pretend = 0, frame = 65652
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L251
	sub	sp, sp, #65536
	sub	sp, sp, #120
	ldr	r0, .L251+4
.L237:
	add	sl, pc, sl
	add	r1, sp, #49152
	add	r1, r1, #120
	add	r0, sl, r0
	str	r1, [sp, #12]
	bl	RegisterAs(PLT)
	ldr	r3, [sp, #12]
	ldr	r2, .L251+8
	sub	r3, r3, #60
	add	r2, sl, r2
	mov	r1, #1
	rsbs	r0, r0, #1
	movcc	r0, #0
	str	r3, [sp, #12]
	bl	bwassert(PLT)
	add	ip, sp, #16384
	add	ip, ip, #120
	add	fp, sp, #32768
	ldr	r0, [sp, #12]
	str	ip, [sp, #4]
	add	fp, fp, #120
	bl	circularBufferInit(PLT)
	ldr	lr, [sp, #4]
	sub	fp, fp, #68
	sub	lr, lr, #76
	mov	r0, fp
	add	r4, sp, #120
	str	lr, [sp, #4]
	sub	r4, r4, #84
	bl	circularBufferInit(PLT)
	ldr	r0, [sp, #4]
	bl	circularBufferInit(PLT)
	mov	r0, r4
	bl	circularBufferInit(PLT)
	ldr	r3, .L251+12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L251+16
	mov	r2, r0
	ldr	r1, [sl, r3]
	add	r3, sp, #65536
	str	r2, [r3, #116]
	mov	r0, #1
	bl	Create(PLT)
	ldr	r3, .L251+20
	mov	r2, r0
	add	ip, sp, #65536
	str	r2, [ip, #112]
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	Create(PLT)
	ldr	r3, .L251+24
	mov	r2, r0
	add	lr, sp, #65536
	ldr	r1, [sl, r3]
	str	r2, [lr, #108]
	mov	r0, #1
	bl	Create(PLT)
	ldr	r1, .L251+28
	ldr	lr, .L251+32
	str	r1, [sp, #32]
	ldr	r1, .L251+36
	ldr	ip, .L251+40
	str	lr, [sp, #24]
	str	r1, [sp, #20]
	add	lr, sp, #65536
	add	r1, sp, #65536
	mov	r3, #0
	mvn	r2, #0
	str	ip, [sp, #28]
	add	r6, sp, #65536
	add	ip, sp, #65536
	add	r5, sp, #65536
	add	r9, sp, #65536
	add	lr, lr, #78
	add	r1, r1, #84
	ldr	r7, .L251+44
	ldr	r8, .L251+48
	str	r0, [ip, #104]
	str	r3, [ip, #88]
	str	r3, [ip, #100]
	str	r2, [ip, #84]
	str	r2, [ip, #92]
	str	r3, [ip, #96]
	add	r6, r6, #92
	add	r5, r5, #71
	add	r9, r9, #88
	str	lr, [sp, #16]
	str	r1, [sp, #8]
.L240:
	mov	r1, r5
	mov	r2, #7
	mov	r0, r6
	bl	Receive(PLT)
	mvn	r0, r0
	add	r2, sl, r7
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	add	r3, sp, #65536
	ldr	r2, [r3, #92]
	ldr	r3, [r3, #116]
	cmp	r2, r3
	beq	.L241
	add	ip, sp, #65536
	ldr	r3, [ip, #112]
	cmp	r2, r3
	beq	.L242
	add	r1, sp, #65536
	ldr	r3, [r1, #108]
	cmp	r2, r3
	beq	.L243
	add	ip, sp, #65536
	ldr	r3, [ip, #104]
	cmp	r2, r3
	beq	.L244
	add	r1, sp, #65536
	ldrb	r3, [r1, #71]	@ zero_extendqisi2
	sub	r3, r3, #10
	cmp	r3, #11
	addls	pc, pc, r3, asl #2
	b	.L213
	.p2align 2
.L218:
	b	.L214
	b	.L215
	b	.L213
	b	.L213
	b	.L213
	b	.L213
	b	.L213
	b	.L213
	b	.L213
	b	.L213
	b	.L216
	b	.L217
.L214:
	mov	r1, fp
	mov	r0, r2
	bl	addToBuffer(PLT)
	ldr	r3, [sp, #32]
	add	ip, sp, #65536
	add	r2, sl, r3
	mov	r1, #1
	ldr	r3, [ip, #92]
	bl	bwassert(PLT)
	b	.L240
.L215:
	add	lr, sp, #65536
	ldrb	r0, [lr, #72]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L245
.L223:
	mov	r0, r2
	add	r1, sl, r8
	mov	r2, #2
	bl	Reply(PLT)
	b	.L240
.L213:
	ldr	ip, [sp, #20]
	mov	r3, r2
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, ip
	bl	bwassert(PLT)
	b	.L240
.L216:
	mov	r1, r4
	mov	r0, r2
	bl	addToBuffer(PLT)
	ldr	r3, [sp, #24]
	add	ip, sp, #65536
	add	r2, sl, r3
	mov	r1, #1
	ldr	r3, [ip, #92]
	bl	bwassert(PLT)
	b	.L240
.L217:
	add	lr, sp, #65536
	ldrb	r0, [lr, #72]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L223
	ldr	r1, [sp, #4]
	bl	addToBuffer(PLT)
	add	r1, sp, #65536
	ldrb	ip, [r1, #72]	@ zero_extendqisi2
	ldr	lr, [sp, #28]
	mov	r1, #1
	mov	r3, ip
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	add	r1, sp, #65536
	ldr	r3, [r1, #96]
	cmp	r3, #0
	bne	.L246
.L231:
	add	ip, sp, #65536
	ldr	r2, [ip, #92]
	b	.L223
.L241:
	ldr	r1, [sp, #12]
	mov	r0, r9
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	moveq	r3, #1
	addeq	r1, sp, #65536
	streq	r3, [r1, #100]
	bne	.L247
.L208:
	mov	r3, #0
	add	r2, sp, #65536
	str	r3, [r2, #88]
	b	.L240
.L242:
	ldr	r0, [sp, #8]
	mov	r1, fp
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	bne	.L248
.L202:
	add	r1, sp, #65536
	ldr	r0, [r1, #112]
.L238:
	add	ip, sp, #65536
	mov	r3, #0
	str	r3, [ip, #88]
	add	lr, sp, #65536
	mvn	ip, #0
	add	r1, sl, r8
	mov	r2, #2
	str	ip, [lr, #84]
	bl	Reply(PLT)
	b	.L240
.L243:
	ldr	r1, [sp, #4]
	mov	r0, r9
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	moveq	r3, #1
	addeq	r1, sp, #65536
	streq	r3, [r1, #96]
	beq	.L208
	add	r2, sp, #65536
	ldr	r1, [sp, #16]
	ldr	r0, [r2, #108]
	add	ip, sp, #65536
	mov	r2, #2
.L239:
	ldr	r3, [ip, #88]
	add	lr, sp, #65536
	strb	r3, [ip, #78]
	mov	ip, #0
	strb	ip, [lr, #79]
	bl	Reply(PLT)
	b	.L208
.L244:
	ldr	r0, [sp, #8]
	mov	r1, r4
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	bne	.L249
.L211:
	add	r1, sp, #65536
	ldr	r0, [r1, #104]
	b	.L238
.L247:
	add	ip, sp, #65536
	ldr	r0, [ip, #116]
	ldr	r1, [sp, #16]
	mov	r2, #2
	b	.L239
.L248:
	add	lr, sp, #65536
	ldrb	ip, [lr, #71]	@ zero_extendqisi2
	mov	r3, #0
	ldr	r1, [sp, #16]
	ldr	r0, [lr, #84]
	mov	r2, #2
	strb	ip, [lr, #78]
	strb	r3, [lr, #79]
	bl	Reply(PLT)
	b	.L202
.L245:
	ldr	r1, [sp, #12]
	bl	addToBuffer(PLT)
	add	r1, sp, #65536
	ldrb	ip, [r1, #72]	@ zero_extendqisi2
	ldr	lr, [sp, #28]
	mov	r1, #1
	mov	r3, ip
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	add	r1, sp, #65536
	ldr	r3, [r1, #100]
	cmp	r3, #0
	beq	.L231
	mov	r0, r9
	ldr	r1, [sp, #12]
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	bne	.L250
.L232:
	add	lr, sp, #65536
	ldr	r2, [lr, #92]
	b	.L223
.L249:
	add	lr, sp, #65536
	ldrb	ip, [lr, #71]	@ zero_extendqisi2
	mov	r3, #0
	ldr	r1, [sp, #16]
	ldr	r0, [lr, #84]
	mov	r2, #2
	strb	ip, [lr, #78]
	strb	r3, [lr, #79]
	bl	Reply(PLT)
	b	.L211
.L246:
	mov	r0, r9
	ldr	r1, [sp, #4]
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	beq	.L232
	add	ip, sp, #65536
	ldr	r3, [ip, #88]
	add	r2, sp, #65536
	mov	lr, #0
	ldr	r1, [sp, #16]
	ldr	r0, [r2, #108]
	strb	r3, [ip, #78]
	mov	r2, #2
	strb	lr, [ip, #79]
	bl	Reply(PLT)
	add	r1, sp, #65536
	ldr	r2, [r1, #92]
	mov	r3, #0
	str	r3, [r1, #96]
	b	.L223
.L250:
	add	ip, sp, #65536
	ldr	r3, [ip, #88]
	add	r2, sp, #65536
	mov	lr, #0
	ldr	r1, [sp, #16]
	ldr	r0, [r2, #116]
	strb	r3, [ip, #78]
	mov	r2, #2
	strb	lr, [ip, #79]
	bl	Reply(PLT)
	add	r1, sp, #65536
	ldr	r2, [r1, #92]
	mov	r3, #0
	str	r3, [r1, #100]
	b	.L223
.L252:
	.align	2
.L251:
	.word	_GLOBAL_OFFSET_TABLE_-(.L237+8)
	.word	.LC15(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	UART1Send_Notifier(GOT)
	.word	UART1Receive_Notifier(GOT)
	.word	UART2Send_Notifier(GOT)
	.word	UART2Receive_Notifier(GOT)
	.word	.LC24(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	ioServer, .-ioServer
	.ident	"GCC: (GNU) 4.0.2"
