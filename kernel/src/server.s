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
	.align	2
	.global	FirstUserTask
	.type	FirstUserTask, %function
FirstUserTask:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L114
	ldr	r3, .L114+4
.L113:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	CreateNameServer(PLT)
	ldr	r3, .L114+8
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	CreateClockServer(PLT)
	ldr	r3, .L114+12
	mov	r0, #31
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L114+16
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	CreateIOServer(PLT)
	ldr	r3, .L114+20
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L114+24
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L114+28
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L115:
	.align	2
.L114:
	.word	_GLOBAL_OFFSET_TABLE_-(.L113+8)
	.word	NameServerTask(GOT)
	.word	clockServer(GOT)
	.word	idleTask(GOT)
	.word	ioServer(GOT)
	.word	displayServer(GOT)
	.word	commandServer(GOT)
	.word	trainServer(GOT)
	.size	FirstUserTask, .-FirstUserTask
	.section	.rodata.str1.4
	.align	2
.LC15:
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
	.word	.LC5(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	-2138308584
	.word	-2138308608
	.size	UART1Send_Notifier, .-UART1Send_Notifier
	.section	.rodata.str1.4
	.align	2
.LC16:
	.ascii	"<UART1Receive_Notifier>: Error with send.\015\012\000"
	.text
	.align	2
	.global	UART1Receive_Notifier
	.type	UART1Receive_Notifier, %function
UART1Receive_Notifier:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L142
	sub	sp, sp, #12
.L140:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	ldr	r8, .L142+4
	mov	r5, r0
	add	r7, sp, #9
	add	r6, sp, #6
.L141:
	mov	r0, #2
	bl	AwaitEvent(PLT)
	ldr	ip, .L142+8
	mov	r1, r7
	ldr	lr, [ip, #0]
	mov	r0, r5
	tst	lr, #64
	mov	r2, #2
	mov	r3, r6
	beq	.L141
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
	b	.L141
.L143:
	.align	2
.L142:
	.word	_GLOBAL_OFFSET_TABLE_-(.L140+8)
	.word	.LC16(GOTOFF)
	.word	-2138308584
	.size	UART1Receive_Notifier, .-UART1Receive_Notifier
	.section	.rodata.str1.4
	.align	2
.LC17:
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
	.word	.LC2(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	-2138243048
	.size	UART2Send_Notifier, .-UART2Send_Notifier
	.section	.rodata.str1.4
	.align	2
.LC18:
	.ascii	"<UART2Receive_Notifier>: Error with send.\015\012\000"
	.text
	.align	2
	.global	UART2Receive_Notifier
	.type	UART2Receive_Notifier, %function
UART2Receive_Notifier:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L168
	sub	sp, sp, #12
.L166:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	ldr	r8, .L168+4
	mov	r5, r0
	add	r7, sp, #9
	add	r6, sp, #6
.L167:
	mov	r0, #4
	bl	AwaitEvent(PLT)
	ldr	ip, .L168+8
	mov	r1, r7
	ldr	lr, [ip, #0]
	mov	r0, r5
	tst	lr, #64
	mov	r2, #2
	mov	r3, r6
	beq	.L167
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
	b	.L167
.L169:
	.align	2
.L168:
	.word	_GLOBAL_OFFSET_TABLE_-(.L166+8)
	.word	.LC18(GOTOFF)
	.word	-2138243048
	.size	UART2Receive_Notifier, .-UART2Receive_Notifier
	.section	.rodata.str1.4
	.align	2
.LC19:
	.ascii	"ioServer\000"
	.align	2
.LC20:
	.ascii	"Failed to register ioServer.\015\012\000"
	.align	2
.LC21:
	.ascii	"<ioServer>: Receive error.\015\012\000"
	.align	2
.LC22:
	.ascii	"<ioServer>: UART1_receiveTIDQ Buffer full. Cannot a"
	.ascii	"dd <%d>.\015\012\000"
	.align	2
.LC23:
	.ascii	"<IOServer>: Buffer full. Could not add %c[%d]\015\012"
	.ascii	"\000"
	.align	2
.LC24:
	.ascii	"<ioServer>: UART2_receiveTIDQ Buffer full. Cannot a"
	.ascii	"dd <%d>.\015\012\000"
	.align	2
.LC25:
	.ascii	"<ioServer>: Illegal request code from userTask <%d>"
	.ascii	".\015\012\000"
	.text
	.align	2
	.global	ioServer
	.type	ioServer, %function
ioServer:
	@ args = 0, pretend = 0, frame = 65656
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L224
	ldr	r0, .L224+4
.L211:
	add	sl, pc, sl
	sub	sp, sp, #65536
	sub	sp, sp, #124
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L224+8
	add	r3, sp, #32768
	add	r3, r3, #124
	add	r2, sl, r2
	mov	r1, #1
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	fp, sp, #49152
	str	r3, [sp, #24]
	add	fp, fp, #124
	bl	bwassert(PLT)
	ldr	ip, [sp, #24]
	sub	fp, fp, #60
	add	lr, sp, #16384
	add	lr, lr, #124
	sub	ip, ip, #68
	mov	r0, fp
	str	lr, [sp, #32]
	str	ip, [sp, #24]
	bl	circularBufferInit(PLT)
	ldr	r1, [sp, #32]
	add	r2, sp, #124
	sub	r1, r1, #76
	ldr	r0, [sp, #24]
	str	r2, [sp, #20]
	str	r1, [sp, #32]
	bl	circularBufferInit(PLT)
	ldr	r3, [sp, #20]
	ldr	r0, [sp, #32]
	sub	r3, r3, #84
	str	r3, [sp, #20]
	bl	circularBufferInit(PLT)
	ldr	r0, [sp, #20]
	bl	circularBufferInit(PLT)
	ldr	r3, .L224+12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L224+16
	add	ip, sp, #65536
	mov	r2, r0
	str	r2, [ip, #120]
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	Create(PLT)
	ldr	r3, .L224+20
	mov	r2, r0
	add	lr, sp, #65536
	str	r2, [lr, #116]
	ldr	r1, [sl, r3]
	mov	r0, #1
	bl	Create(PLT)
	ldr	r3, .L224+24
	mov	r2, r0
	ldr	r1, [sl, r3]
	add	r3, sp, #65536
	str	r2, [r3, #112]
	mov	r0, #1
	bl	Create(PLT)
	ldr	lr, .L224+28
	ldr	ip, .L224+32
	ldr	r1, .L224+36
	mvn	r2, #0
	str	lr, [sp, #4]
	add	lr, sp, #65536
	str	ip, [sp, #8]
	str	r1, [sp, #36]
	ldr	ip, .L224+40
	str	r2, [lr, #88]
	str	r2, [lr, #96]
	add	r1, sp, #65536
	add	r2, sp, #65536
	mov	r3, #0
	add	r6, sp, #65536
	add	r5, sp, #65536
	add	r9, sp, #65536
	add	r1, r1, #82
	add	r2, r2, #88
	ldr	r7, .L224+44
	ldr	r8, .L224+48
	str	r0, [lr, #108]
	str	ip, [sp, #28]
	str	r3, [lr, #104]
	str	r3, [lr, #92]
	str	r3, [lr, #100]
	add	r6, r6, #96
	add	r5, r5, #75
	add	r9, r9, #92
	str	r1, [sp, #16]
	str	r2, [sp, #12]
.L214:
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
	ldr	r2, [r3, #96]
	ldr	r3, [r3, #120]
	cmp	r2, r3
	beq	.L215
	add	ip, sp, #65536
	ldr	r3, [ip, #116]
	cmp	r2, r3
	beq	.L216
	add	r1, sp, #65536
	ldr	r3, [r1, #112]
	cmp	r2, r3
	beq	.L217
	add	ip, sp, #65536
	ldr	r3, [ip, #108]
	cmp	r2, r3
	beq	.L218
	add	r1, sp, #65536
	ldrb	r3, [r1, #75]	@ zero_extendqisi2
	sub	r3, r3, #10
	cmp	r3, #11
	addls	pc, pc, r3, asl #2
	b	.L190
	.p2align 2
.L195:
	b	.L191
	b	.L192
	b	.L190
	b	.L190
	b	.L190
	b	.L190
	b	.L190
	b	.L190
	b	.L190
	b	.L190
	b	.L193
	b	.L194
.L191:
	ldr	r1, [sp, #24]
	mov	r0, r2
	bl	addToBuffer(PLT)
	ldr	r3, [sp, #8]
	add	ip, sp, #65536
	add	r2, sl, r3
	mov	r1, #1
	ldr	r3, [ip, #96]
	bl	bwassert(PLT)
	b	.L214
.L192:
	add	lr, sp, #65536
	mov	r1, fp
	ldrb	r0, [lr, #76]	@ zero_extendqisi2
	bl	addToBuffer(PLT)
	add	r1, sp, #65536
	ldrb	ip, [r1, #76]	@ zero_extendqisi2
	ldr	lr, [sp, #4]
	mov	r1, #1
	mov	r3, ip
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	add	r1, sp, #65536
	ldr	r3, [r1, #104]
	cmp	r3, #0
	bne	.L219
.L196:
	add	r1, sp, #65536
	ldr	r0, [r1, #96]
	mov	r2, #2
	add	r1, sl, r8
	bl	Reply(PLT)
	b	.L214
.L190:
	ldr	ip, [sp, #28]
	mov	r3, r2
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, ip
	bl	bwassert(PLT)
	b	.L214
.L193:
	ldr	r1, [sp, #20]
	mov	r0, r2
	bl	addToBuffer(PLT)
	ldr	r3, [sp, #36]
	add	ip, sp, #65536
	add	r2, sl, r3
	mov	r1, #1
	ldr	r3, [ip, #96]
	bl	bwassert(PLT)
	b	.L214
.L194:
	add	lr, sp, #65536
	ldrb	r0, [lr, #76]	@ zero_extendqisi2
	cmp	r0, #0
	bne	.L220
.L199:
	mov	r0, r2
	add	r1, sl, r8
	mov	r2, #2
	bl	Reply(PLT)
	b	.L214
.L215:
	mov	r1, fp
	mov	r0, r9
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	moveq	r3, #1
	addeq	r1, sp, #65536
	streq	r3, [r1, #104]
	bne	.L221
.L185:
	mov	r3, #0
	add	r2, sp, #65536
	str	r3, [r2, #92]
	b	.L214
.L216:
	ldr	r0, [sp, #12]
	ldr	r1, [sp, #24]
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	bne	.L222
.L179:
	add	r1, sp, #65536
	ldr	r0, [r1, #116]
.L212:
	add	ip, sp, #65536
	mov	r3, #0
	str	r3, [ip, #92]
	add	lr, sp, #65536
	mvn	ip, #0
	add	r1, sl, r8
	mov	r2, #2
	str	ip, [lr, #88]
	bl	Reply(PLT)
	b	.L214
.L217:
	ldr	r1, [sp, #32]
	mov	r0, r9
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	moveq	r3, #1
	addeq	r1, sp, #65536
	streq	r3, [r1, #100]
	beq	.L185
	add	r2, sp, #65536
	ldr	r1, [sp, #16]
	ldr	r0, [r2, #112]
	add	ip, sp, #65536
	mov	r2, #2
.L213:
	ldr	r3, [ip, #92]
	add	lr, sp, #65536
	strb	r3, [ip, #82]
	mov	ip, #0
	strb	ip, [lr, #83]
	bl	Reply(PLT)
	b	.L185
.L218:
	ldr	r0, [sp, #12]
	ldr	r1, [sp, #20]
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	bne	.L223
.L188:
	add	r1, sp, #65536
	ldr	r0, [r1, #108]
	b	.L212
.L221:
	add	ip, sp, #65536
	ldr	r0, [ip, #120]
	ldr	r1, [sp, #16]
	mov	r2, #2
	b	.L213
.L222:
	add	lr, sp, #65536
	ldrb	ip, [lr, #75]	@ zero_extendqisi2
	mov	r3, #0
	ldr	r1, [sp, #16]
	ldr	r0, [lr, #88]
	mov	r2, #2
	strb	ip, [lr, #82]
	strb	r3, [lr, #83]
	bl	Reply(PLT)
	b	.L179
.L219:
	mov	r0, r9
	mov	r1, fp
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	beq	.L196
	add	ip, sp, #65536
	ldr	r3, [ip, #92]
	add	r2, sp, #65536
	mov	r4, #0
	ldr	r1, [sp, #16]
	ldr	r0, [r2, #120]
	strb	r3, [ip, #82]
	mov	r2, #2
	strb	r4, [ip, #83]
	bl	Reply(PLT)
	add	lr, sp, #65536
	str	r4, [lr, #104]
	b	.L196
.L220:
	ldr	r1, [sp, #32]
	bl	addToBuffer(PLT)
	add	r1, sp, #65536
	ldrb	ip, [r1, #76]	@ zero_extendqisi2
	ldr	lr, [sp, #4]
	mov	r1, #1
	mov	r3, ip
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	add	r1, sp, #65536
	ldr	r3, [r1, #100]
	cmp	r3, #0
	addeq	r1, sp, #65536
	ldreq	r2, [r1, #96]
	beq	.L199
	mov	r0, r9
	ldr	r1, [sp, #32]
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	addeq	r3, sp, #65536
	ldreq	r2, [r3, #96]
	beq	.L199
	add	ip, sp, #65536
	ldr	r3, [ip, #92]
	add	r2, sp, #65536
	mov	r4, #0
	ldr	r1, [sp, #16]
	ldr	r0, [r2, #112]
	strb	r3, [ip, #82]
	mov	r2, #2
	strb	r4, [ip, #83]
	bl	Reply(PLT)
	add	lr, sp, #65536
	ldr	r2, [lr, #96]
	str	r4, [lr, #100]
	b	.L199
.L223:
	add	lr, sp, #65536
	ldrb	ip, [lr, #75]	@ zero_extendqisi2
	mov	r3, #0
	ldr	r1, [sp, #16]
	ldr	r0, [lr, #88]
	mov	r2, #2
	strb	ip, [lr, #82]
	strb	r3, [lr, #83]
	bl	Reply(PLT)
	b	.L188
.L225:
	.align	2
.L224:
	.word	_GLOBAL_OFFSET_TABLE_-(.L211+8)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	UART1Send_Notifier(GOT)
	.word	UART1Receive_Notifier(GOT)
	.word	UART2Send_Notifier(GOT)
	.word	UART2Receive_Notifier(GOT)
	.word	.LC23(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	ioServer, .-ioServer
	.section	.rodata.str1.4
	.align	2
.LC26:
	.ascii	"trainServer\000"
	.align	2
.LC27:
	.ascii	"Failed to register trainServer.\015\012\000"
	.align	2
.LC28:
	.ascii	"commandServer\000"
	.align	2
.LC29:
	.ascii	"<trainServer>: Receive error.\015\012\000"
	.align	2
.LC30:
	.ascii	"<trainServer>: Error sending message to CommandServ"
	.ascii	"er.\015\012\000"
	.align	2
.LC31:
	.ascii	"<trainServer>: Illegal request code from userTask <"
	.ascii	"%d>:[%s].\015\012\000"
	.text
	.align	2
	.global	trainServer
	.type	trainServer, %function
trainServer:
	@ args = 0, pretend = 0, frame = 420
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L249
	ldr	r0, .L249+4
.L245:
	add	sl, pc, sl
	sub	sp, sp, #424
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L249+8
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r0, .L249+12
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	r3, #0
	str	r3, [sp, #408]
	ldr	r2, [sp, #408]
	sub	r3, r3, #1
	cmp	r2, #79
	mov	r7, r0
	str	r3, [sp, #416]
	bgt	.L236
.L239:
	ldr	r3, [sp, #408]
	add	r3, r3, #1
	str	r3, [sp, #408]
	ldr	r2, [sp, #408]
	cmp	r2, #79
	ble	.L239
	ldr	r3, .L249+16
	ldr	ip, .L249+20
	str	r3, [sp, #8]
	ldr	r3, .L249+24
	str	ip, [sp, #20]
	str	r3, [sp, #4]
	ldr	ip, .L249+28
	add	r3, sp, #416
	str	r3, [sp, #12]
	add	r8, sp, #420
	mov	r3, #0
	str	ip, [sp, #16]
	add	fp, sp, #412
	add	r9, sp, #344
	add	r8, r8, #1
	str	r3, [sp, #24]
.L247:
	mov	r1, fp
	mov	r2, #4
	ldr	r0, [sp, #12]
	bl	Receive(PLT)
	ldr	r3, [sp, #8]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldrb	ip, [sp, #412]	@ zero_extendqisi2
	mov	r5, #0
	cmp	ip, #82
	mov	r1, r9
	mov	r3, r8
	mov	r0, r7
	mov	r2, #7
	beq	.L232
	mov	r6, #3
	cmp	ip, #84
	mov	r2, r6
	beq	.L233
	cmp	ip, #76
	sub	r6, r6, #3
	beq	.L248
	ldr	ip, [sp, #16]
	mov	r0, #0
	ldr	r3, [sp, #416]
	mov	r1, #1
	add	r2, sl, ip
	str	fp, [sp, #0]
	bl	bwassert(PLT)
	b	.L247
.L232:
	ldrb	r4, [sp, #413]	@ zero_extendqisi2
	mov	ip, #15
	strb	ip, [sp, #346]
	add	ip, sp, #424
	add	lr, ip, r4, asl #2
	ldr	ip, [lr, #-400]
	strb	r5, [sp, #349]
	strb	ip, [sp, #348]
	mov	ip, #3
	strb	r4, [sp, #350]
	str	ip, [sp, #0]
	strb	r5, [sp, #344]
	strb	r4, [sp, #345]
	strb	r4, [sp, #347]
.L246:
	bl	Send(PLT)
	ldr	r3, [sp, #20]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	ip, [sp, #4]
	ldr	r0, [sp, #416]
	add	r1, sl, ip
	mov	r2, #2
	bl	Reply(PLT)
	b	.L247
.L233:
	ldrb	r5, [sp, #414]	@ zero_extendqisi2
	ldrb	lr, [sp, #413]	@ zero_extendqisi2
	add	ip, sp, #424
	add	r4, ip, r5, asl #2
	mov	ip, #0
	str	r6, [sp, #0]
	strb	ip, [sp, #346]
	str	lr, [r4, #-400]
	strb	lr, [sp, #344]
	strb	r5, [sp, #345]
	b	.L246
.L248:
	ldrb	r4, [sp, #413]	@ zero_extendqisi2
	sub	ip, ip, #60
	strb	ip, [sp, #344]
	add	ip, sp, #424
	add	lr, ip, r4, asl #2
	str	r6, [lr, #-400]
	strb	r6, [sp, #346]
	str	r2, [sp, #0]
	strb	r4, [sp, #345]
	b	.L246
.L236:
	ldr	ip, .L249+16
	ldr	r3, .L249+20
	str	ip, [sp, #8]
	ldr	ip, .L249+24
	str	r3, [sp, #20]
	add	r8, sp, #420
	ldr	r3, .L249+28
	str	ip, [sp, #4]
	add	fp, sp, #412
	add	ip, sp, #416
	add	r9, sp, #344
	add	r8, r8, #1
	str	r3, [sp, #16]
	str	ip, [sp, #12]
	b	.L247
.L250:
	.align	2
.L249:
	.word	_GLOBAL_OFFSET_TABLE_-(.L245+8)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC31(GOTOFF)
	.size	trainServer, .-trainServer
	.align	2
	.global	Grid
	.type	Grid, %function
Grid:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L254
	sub	sp, sp, #8
.L253:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	ldr	r1, .L254+4
	mov	ip, #3
	add	r1, sl, r1
	add	r3, sp, #5
	mov	r2, #2
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L254+8
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	bl	Exit(PLT)
	add	sp, sp, #8
	ldmfd	sp!, {sl, pc}
.L255:
	.align	2
.L254:
	.word	_GLOBAL_OFFSET_TABLE_-(.L253+8)
	.word	.LC2(GOTOFF)
	.word	.LC15(GOTOFF)
	.size	Grid, .-Grid
	.section	.rodata.str1.4
	.align	2
.LC32:
	.ascii	"<displayGrid>: IOServer has not been set up.\015\012"
	.ascii	"\000"
	.align	2
.LC33:
	.ascii	"<DisplayPrompt>: could not send prompt response to "
	.ascii	"server. \015\012\000"
	.align	2
.LC34:
	.ascii	"<DisplayPrompt>: could not send backspace to server"
	.ascii	". \015\012\000"
	.align	2
.LC35:
	.ascii	"<DisplayPrompt>: could not send character to server"
	.ascii	".[%d] \015\012\000"
	.text
	.align	2
	.global	UserPrompt
	.type	UserPrompt, %function
UserPrompt:
	@ args = 0, pretend = 0, frame = 1136
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L278
	sub	sp, sp, #1136
	sub	sp, sp, #4
.L275:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	str	r0, [sp, #36]
	add	r0, sp, #52
	str	r0, [sp, #32]
	ldr	r0, .L278+4
	ldr	r5, .L278+8
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L278+12
	mov	r8, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r1, .L278+16
	ldr	r2, .L278+20
	ldr	ip, [sp, #32]
	str	r1, [sp, #24]
	str	r2, [sp, #16]
	add	r0, sp, #1120
	add	r1, sp, #1120
	add	r2, sp, #1056
	mov	r3, #0
	str	r5, [sp, #12]
	sub	ip, ip, #12
	add	r0, r0, #12
	add	r1, r1, #8
	add	r2, r2, #8
	add	r5, sp, #1136
	mov	r9, r3
	str	ip, [sp, #32]
	mov	fp, #2
	str	r0, [sp, #20]
	str	r1, [sp, #28]
	stmib	sp, {r2, r5}	@ phole stm
	strb	r3, [sp, #1139]
.L276:
	mov	r0, r8
	mov	r1, #1
	bl	Getc(PLT)
	strb	r0, [sp, #1139]
	ldrb	r3, [sp, #1139]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L276
	cmp	r9, #1020
	bge	.L276
	ldrb	r3, [sp, #1139]	@ zero_extendqisi2
	cmp	r3, #13
	beq	.L277
	ldrb	r3, [sp, #1139]	@ zero_extendqisi2
	cmp	r3, #8
	bne	.L265
	cmp	fp, #2
	ble	.L276
	ldr	r3, .L278+24
	sub	fp, fp, #1
	smull	ip, r2, r3, fp
	mov	r4, fp, asr #31
	add	r0, sp, #1136
	rsb	r4, r4, r2, asr #5
	sub	r9, r9, #1
	add	r0, r0, #4
	add	ip, r0, r9
	mov	r5, #0
	add	lr, r4, r4, asl #2
	ldmib	sp, {r1, r3}	@ phole ldm
	ldr	r0, [sp, #36]
	add	lr, lr, lr, asl #2
	strb	r5, [ip, #-1100]
	mov	ip, #3
	sub	lr, fp, lr, asl #2
	str	ip, [sp, #0]
	mov	r2, #4
	mov	ip, #1
	strb	lr, [sp, #1066]
	strb	ip, [sp, #1064]
	strb	r4, [sp, #1065]
	strb	r5, [sp, #1067]
	bl	Send(PLT)
	ldr	r3, [sp, #16]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r3
	bl	bwassert(PLT)
	b	.L276
.L265:
	ldr	r3, .L278+24
	mov	r4, fp, asr #31
	smull	r5, r2, r3, fp
	add	ip, sp, #1136
	rsb	r4, r4, r2, asr #5
	ldrb	r6, [sp, #1139]	@ zero_extendqisi2
	add	ip, ip, #4
	add	lr, r4, r4, asl #2
	add	r5, ip, r9
	ldrb	r7, [sp, #1139]	@ zero_extendqisi2
	mov	ip, #2
	add	lr, lr, lr, asl #2
	sub	lr, fp, lr, asl #2
	ldmib	sp, {r1, r3}	@ phole ldm
	mov	r2, #5
	ldr	r0, [sp, #36]
	strb	ip, [sp, #1064]
	strb	r6, [r5, #-1100]
	add	ip, ip, #1
	mov	r5, #0
	strb	lr, [sp, #1066]
	str	ip, [sp, #0]
	strb	r7, [sp, #1067]
	strb	r4, [sp, #1065]
	strb	r5, [sp, #1068]
	bl	Send(PLT)
	ldr	ip, [sp, #12]
	mov	r3, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, ip
	bl	bwassert(PLT)
	add	r9, r9, #1
	add	fp, fp, #1
	b	.L276
.L277:
	add	ip, sp, #1136
	add	ip, ip, #4
	add	r3, ip, r9
	mov	r4, #0
	ldr	r1, [sp, #20]
	ldr	r2, [sp, #28]
	ldr	r0, [sp, #32]
	strb	r4, [r3, #-1100]
	bl	parseCommand(PLT)
	ldr	ip, [sp, #1132]
	ldr	lr, [sp, #1128]
	strb	r0, [sp, #1064]
	ldr	r1, [sp, #4]
	mov	r2, #4
	ldr	r3, [sp, #8]
	strb	ip, [sp, #1065]
	ldr	r0, [sp, #36]
	mov	ip, #3
	strb	lr, [sp, #1066]
	str	ip, [sp, #0]
	strb	r4, [sp, #1067]
	bl	Send(PLT)
	ldr	r3, [sp, #24]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r3
	bl	bwassert(PLT)
	cmp	r9, r4
	blt	.L258
	mov	r2, r4
	add	r3, r9, #1
	mov	r1, r4
.L264:
	ldr	r5, [sp, #32]
	strb	r1, [r2, r5]
	add	r2, r2, #1
	cmp	r2, r3
	bne	.L264
.L258:
	mov	r9, #0
	mov	fp, #2
	b	.L276
.L279:
	.align	2
.L278:
	.word	_GLOBAL_OFFSET_TABLE_-(.L275+8)
	.word	.LC19(GOTOFF)
	.word	.LC35(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	1374389535
	.size	UserPrompt, .-UserPrompt
	.section	.rodata.str1.4
	.align	2
.LC36:
	.ascii	"<displayServer>: Receive error.\015\012\000"
	.align	2
.LC37:
	.ascii	"\033[34;%dH\033[K\000"
	.align	2
.LC38:
	.ascii	"\033[34;%dH%c\000"
	.align	2
.LC39:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KSwitch %d is config"
	.ascii	"ured as %c now.\033[34;1H>\000"
	.align	2
.LC40:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KReversed train %d.\033"
	.ascii	"[34;1H>\000"
	.align	2
.LC41:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KUpdated train %d's "
	.ascii	"speed to %d.\033[34;1H>\000"
	.align	2
.LC42:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KSet Train's %d ligh"
	.ascii	"ts on.\033[34;1H>\000"
	.align	2
.LC43:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KPinging Sensors man"
	.ascii	"ually.\033[34;1H>\000"
	.align	2
.LC44:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KIncorrect Command.\033"
	.ascii	"[34;1H>\000"
	.align	2
.LC45:
	.ascii	"\033[%d;17H%c%d \000"
	.text
	.align	2
	.global	displayServer
	.type	displayServer, %function
displayServer:
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L314
	ldr	r0, .L314+4
.L310:
	add	sl, pc, sl
	sub	sp, sp, #128
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L314+8
	mov	r6, r0
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L314+12
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L314+16
	mov	r9, r0
	ldr	r1, [sl, r3]
	mov	r0, #4
	bl	Create(PLT)
	ldr	r3, .L314+20
	mov	fp, r0
	ldr	r1, [sl, r3]
	mov	r0, #4
	bl	Create(PLT)
	ldr	r1, .L314+24
	ldr	r3, .L314+28
	ldr	r2, .L314+32
	ldr	ip, .L314+36
	ldr	lr, .L314+40
	str	r1, [sp, #48]
	str	r3, [sp, #32]
	ldr	r1, .L314+44
	ldr	r3, .L314+48
	str	r2, [sp, #44]
	str	ip, [sp, #24]
	ldr	r2, .L314+52
	ldr	ip, .L314+56
	mvn	r4, #0
	str	lr, [sp, #40]
	str	r1, [sp, #28]
	str	r3, [sp, #16]
	add	lr, sp, #124
	mov	r3, #0
	add	r1, sp, #56
	ldr	r8, .L314+60
	ldr	r7, .L314+64
	str	r0, [sp, #52]
	str	r2, [sp, #20]
	str	ip, [sp, #12]
	str	r4, [sp, #124]
	str	r3, [sp, #120]
	str	lr, [sp, #8]
	str	r1, [sp, #36]
.L311:
	ldr	r1, [sp, #36]
	mov	r2, #64
	ldr	r0, [sp, #8]
	bl	Receive(PLT)
	ldr	r3, [sp, #48]
	mov	r5, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r3
	bl	bwassert(PLT)
	ldr	r4, [sp, #124]
	cmp	r9, r4
	beq	.L312
	cmp	fp, r4
	beq	.L313
	ldr	lr, [sp, #52]
	cmp	lr, r4
	bne	.L297
	mov	r3, #0
	str	r3, [sp, #120]
	ldr	r2, [sp, #120]
	cmp	r2, r5
	bge	.L297
.L305:
	ldr	r3, [sp, #120]
	ldr	r1, [sp, #120]
	ldr	r0, [sp, #120]
	add	r2, sp, #128
	add	ip, r2, r1
	add	r2, r2, r0
	ldrb	r4, [r2, #-72]	@ zero_extendqisi2
	ldrb	r1, [ip, #-72]	@ zero_extendqisi2
	sub	r4, r4, #1
	mov	r2, r4, asr #31
	mov	r2, r2, lsr #28
	subs	ip, r1, #1
	add	r4, r4, r2
	addmi	ip, r1, #14
	and	r4, r4, #15
	rsb	r4, r2, r4
	mov	ip, ip, asr #4
	add	ip, ip, #65
	add	r3, r3, #6
	add	r2, sl, r7
	add	r4, r4, #1
	mov	r0, r6
	mov	r1, #1
	str	ip, [sp, #0]
	str	r4, [sp, #4]
	bl	Printf(PLT)
	ldr	r3, [sp, #120]
	add	r3, r3, #1
	str	r3, [sp, #120]
	ldr	r2, [sp, #120]
	cmp	r2, r5
	blt	.L305
	ldr	r4, [sp, #124]
.L297:
	mov	r0, r4
	add	r1, sl, r8
	mov	r2, #2
	bl	Reply(PLT)
	b	.L311
.L313:
	ldrb	r3, [sp, #56]	@ zero_extendqisi2
	sub	r3, r3, #1
	cmp	r3, #14
	addls	pc, pc, r3, asl #2
	b	.L286
	.p2align 2
.L295:
	b	.L287
	b	.L288
	b	.L286
	b	.L286
	b	.L286
	b	.L286
	b	.L286
	b	.L286
	b	.L286
	b	.L289
	b	.L290
	b	.L291
	b	.L292
	b	.L293
	b	.L294
.L287:
	ldrb	r3, [sp, #57]	@ zero_extendqisi2
	ldrb	r2, [sp, #58]	@ zero_extendqisi2
	add	r3, r3, r3, asl #2
	ldr	ip, [sp, #44]
	add	r3, r3, r3, asl #2
	add	r3, r2, r3, asl #2
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, ip
	bl	Printf(PLT)
.L296:
	ldr	r0, [sp, #124]
	add	r1, sl, r8
	mov	r2, #2
	bl	Reply(PLT)
	b	.L311
.L288:
	ldrb	r3, [sp, #57]	@ zero_extendqisi2
	ldrb	r2, [sp, #58]	@ zero_extendqisi2
	ldr	lr, [sp, #32]
	add	r3, r3, r3, asl #2
	ldrb	ip, [sp, #59]	@ zero_extendqisi2
	add	r3, r3, r3, asl #2
	add	r3, r2, r3, asl #2
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L296
.L286:
	ldr	ip, [sp, #12]
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, ip
	bl	Printf(PLT)
	b	.L296
.L289:
	bl	Quit(PLT)
	b	.L296
.L290:
	ldr	lr, [sp, #24]
	ldrb	ip, [sp, #58]	@ zero_extendqisi2
	ldrb	r3, [sp, #57]	@ zero_extendqisi2
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L296
.L291:
	ldr	lr, [sp, #40]
	ldrb	ip, [sp, #58]	@ zero_extendqisi2
	ldrb	r3, [sp, #57]	@ zero_extendqisi2
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L296
.L292:
	ldr	lr, [sp, #28]
	ldrb	ip, [sp, #58]	@ zero_extendqisi2
	ldrb	r3, [sp, #57]	@ zero_extendqisi2
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L296
.L293:
	ldr	lr, [sp, #20]
	ldrb	ip, [sp, #58]	@ zero_extendqisi2
	ldrb	r3, [sp, #57]	@ zero_extendqisi2
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L296
.L294:
	ldr	r3, [sp, #16]
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, r3
	bl	Printf(PLT)
	b	.L296
.L312:
	bl	displayGrid(PLT)
	mov	r0, r4
	add	r1, sl, r8
	mov	r2, #2
	bl	Reply(PLT)
	b	.L311
.L315:
	.align	2
.L314:
	.word	_GLOBAL_OFFSET_TABLE_-(.L310+8)
	.word	.LC19(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	Grid(GOT)
	.word	UserPrompt(GOT)
	.word	displaySensors(GOT)
	.word	.LC36(GOTOFF)
	.word	.LC38(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.word	.LC41(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC42(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC45(GOTOFF)
	.size	displayServer, .-displayServer
	.section	.rodata.str1.4
	.align	2
.LC46:
	.ascii	"Could not register as command server.\015\012\000"
	.align	2
.LC47:
	.ascii	"<commandServer>: Receive error.\015\012\000"
	.text
	.align	2
	.global	commandServer
	.type	commandServer, %function
commandServer:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L324
	ldr	r0, .L324+4
.L323:
	add	sl, pc, sl
	sub	sp, sp, #72
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L324+8
	mov	r1, #1
	add	r2, sl, r2
	rsbs	r0, r0, #1
	movcc	r0, #0
	bl	bwassert(PLT)
	ldr	r0, .L324+12
	ldr	r9, .L324+16
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L324+20
	mov	r5, r0
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r8, .L324+24
	mvn	r3, #0
	mov	r2, #0
	str	r3, [sp, #68]
	str	r2, [sp, #64]
	add	r7, sp, #68
.L317:
	mov	r1, sp
	mov	r2, #64
	mov	r0, r7
	bl	Receive(PLT)
	mov	r4, r0
	mvn	r0, r0
	add	r2, sl, r9
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r3, #0
	str	r3, [sp, #64]
	ldr	r2, [sp, #64]
	sub	r4, r4, #1
	cmp	r4, r2
	ble	.L318
.L321:
	ldr	r2, [sp, #64]
	add	r1, sp, #72
	add	r3, r1, r2
	ldrb	r2, [r3, #-72]	@ zero_extendqisi2
	mov	r0, r5
	mov	r1, #0
	bl	Putc(PLT)
	ldr	r3, [sp, #64]
	add	r3, r3, #1
	str	r3, [sp, #64]
	ldr	r2, [sp, #64]
	cmp	r2, r4
	blt	.L321
.L318:
	ldr	r0, [sp, #68]
	add	r1, sl, r8
	mov	r2, #2
	bl	Reply(PLT)
	b	.L317
.L325:
	.align	2
.L324:
	.word	_GLOBAL_OFFSET_TABLE_-(.L323+8)
	.word	.LC28(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC2(GOTOFF)
	.size	commandServer, .-commandServer
	.ident	"GCC: (GNU) 4.0.2"
