	.file	"userRequestCall.c"
	.text
	.align	2
	.global	user_contextswitch
	.type	user_contextswitch, %function
user_contextswitch:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	swi 0
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	user_contextswitch, .-user_contextswitch
	.align	2
	.global	Create
	.type	Create, %function
Create:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	mov	r3, #3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-28]
	sub	r3, fp, #36
	ldr	r0, .L5
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L6:
	.align	2
.L5:
	.word	-559038737
	.size	Create, .-Create
	.align	2
	.global	CreateNameServer
	.type	CreateNameServer, %function
CreateNameServer:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	mov	r3, #4
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-28]
	sub	r3, fp, #36
	ldr	r0, .L9
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L10:
	.align	2
.L9:
	.word	-559038737
	.size	CreateNameServer, .-CreateNameServer
	.align	2
	.global	CreateClockServer
	.type	CreateClockServer, %function
CreateClockServer:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	mov	r3, #5
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-28]
	sub	r3, fp, #36
	ldr	r0, .L13
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L14:
	.align	2
.L13:
	.word	-559038737
	.size	CreateClockServer, .-CreateClockServer
	.align	2
	.global	CreateIOServer
	.type	CreateIOServer, %function
CreateIOServer:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	mov	r3, #6
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-24]
	sub	r3, fp, #36
	ldr	r0, .L17
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L18:
	.align	2
.L17:
	.word	-559038737
	.size	CreateIOServer, .-CreateIOServer
	.align	2
	.global	MyTid
	.type	MyTid, %function
MyTid:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	mov	r3, #1
	str	r3, [fp, #-36]
	sub	r3, fp, #36
	ldr	r0, .L21
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	-559038737
	.size	MyTid, .-MyTid
	.align	2
	.global	MyParentTid
	.type	MyParentTid, %function
MyParentTid:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	mov	r3, #2
	str	r3, [fp, #-36]
	sub	r3, fp, #36
	ldr	r0, .L25
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	-559038737
	.size	MyParentTid, .-MyParentTid
	.align	2
	.global	Pass
	.type	Pass, %function
Pass:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	mov	r3, #7
	str	r3, [fp, #-36]
	sub	r3, fp, #36
	ldr	r0, .L29
	mov	r1, r3
	bl	user_contextswitch(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L30:
	.align	2
.L29:
	.word	-559038737
	.size	Pass, .-Pass
	.align	2
	.global	Exit
	.type	Exit, %function
Exit:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	mov	r3, #8
	str	r3, [fp, #-36]
	sub	r3, fp, #36
	ldr	r0, .L33
	mov	r1, r3
	bl	user_contextswitch(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L34:
	.align	2
.L33:
	.word	-559038737
	.size	Exit, .-Exit
	.align	2
	.global	Quit
	.type	Quit, %function
Quit:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	mov	r3, #19
	str	r3, [fp, #-36]
	sub	r3, fp, #36
	ldr	r0, .L37
	mov	r1, r3
	bl	user_contextswitch(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L38:
	.align	2
.L37:
	.word	-559038737
	.size	Quit, .-Quit
	.align	2
	.global	Send
	.type	Send, %function
Send:
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	str	r3, [fp, #-52]
	mov	r3, #9
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #4]
	str	r3, [fp, #-16]
	sub	r3, fp, #36
	ldr	r0, .L41
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L42:
	.align	2
.L41:
	.word	-559038737
	.size	Send, .-Send
	.align	2
	.global	WhoIs
	.type	WhoIs, %function
WhoIs:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #68
	str	r0, [fp, #-76]
	ldr	r3, [fp, #-76]
	str	r3, [fp, #-20]
	mov	r3, #48
	strb	r3, [fp, #-38]
	mov	r3, #49
	strb	r3, [fp, #-37]
	sub	r3, fp, #38
	mov	r0, r3
	ldr	r1, [fp, #-20]
	mov	r2, #2
	mov	r3, #17
	bl	pkstrcpy_aftern_append(PLT)
	mov	r3, #12
	str	r3, [fp, #-64]
	mov	r3, #0
	strb	r3, [fp, #-66]
	mov	r3, #0
	strb	r3, [fp, #-65]
	mov	r3, #2
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-60]
	sub	r3, fp, #38
	str	r3, [fp, #-56]
	mov	r3, #18
	str	r3, [fp, #-52]
	sub	r3, fp, #66
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-44]
	sub	r3, fp, #64
	ldr	r0, .L50
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	bge	.L44
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-80]
	b	.L46
.L44:
	ldrb	r3, [fp, #-66]	@ zero_extendqisi2
	and	r3, r3, #255
	mov	r3, r3, asl #24
	mov	r3, r3, asr #24
	cmp	r3, #0
	bge	.L47
	ldrb	r3, [fp, #-66]	@ zero_extendqisi2
	sub	r3, r3, #256
	str	r3, [fp, #-80]
	b	.L46
.L47:
	ldrb	r3, [fp, #-66]	@ zero_extendqisi2
	str	r3, [fp, #-80]
.L46:
	ldr	r3, [fp, #-80]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L51:
	.align	2
.L50:
	.word	-559038737
	.size	WhoIs, .-WhoIs
	.align	2
	.global	RegisterAs
	.type	RegisterAs, %function
RegisterAs:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #68
	str	r0, [fp, #-76]
	ldr	r3, [fp, #-76]
	str	r3, [fp, #-20]
	mov	r3, #49
	strb	r3, [fp, #-38]
	mov	r3, #48
	strb	r3, [fp, #-37]
	sub	r3, fp, #38
	mov	r0, r3
	ldr	r1, [fp, #-20]
	mov	r2, #2
	mov	r3, #17
	bl	pkstrcpy_aftern_append(PLT)
	mov	r3, #13
	str	r3, [fp, #-64]
	mov	r3, #0
	strb	r3, [fp, #-66]
	mov	r3, #0
	strb	r3, [fp, #-65]
	mov	r3, #2
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-60]
	sub	r3, fp, #38
	str	r3, [fp, #-56]
	mov	r3, #18
	str	r3, [fp, #-52]
	sub	r3, fp, #66
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-44]
	sub	r3, fp, #64
	ldr	r0, .L59
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	bge	.L53
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-80]
	b	.L55
.L53:
	ldrb	r3, [fp, #-66]	@ zero_extendqisi2
	and	r3, r3, #255
	mov	r3, r3, asl #24
	mov	r3, r3, asr #24
	cmp	r3, #0
	bge	.L56
	ldrb	r3, [fp, #-66]	@ zero_extendqisi2
	sub	r3, r3, #256
	str	r3, [fp, #-80]
	b	.L55
.L56:
	ldrb	r3, [fp, #-66]	@ zero_extendqisi2
	str	r3, [fp, #-80]
.L55:
	ldr	r3, [fp, #-80]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L60:
	.align	2
.L59:
	.word	-559038737
	.size	RegisterAs, .-RegisterAs
	.align	2
	.global	Receive
	.type	Receive, %function
Receive:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	mov	r3, #10
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-24]
	sub	r3, fp, #36
	ldr	r0, .L63
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L64:
	.align	2
.L63:
	.word	-559038737
	.size	Receive, .-Receive
	.align	2
	.global	Reply
	.type	Reply, %function
Reply:
	@ args = 0, pretend = 0, frame = 36
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	mov	r3, #11
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-24]
	sub	r3, fp, #36
	ldr	r0, .L67
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L68:
	.align	2
.L67:
	.word	-559038737
	.size	Reply, .-Reply
	.align	2
	.global	AwaitEvent
	.type	AwaitEvent, %function
AwaitEvent:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-40]
	mov	r3, #14
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-32]
	sub	r3, fp, #36
	ldr	r0, .L71
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L72:
	.align	2
.L71:
	.word	-559038737
	.size	AwaitEvent, .-AwaitEvent
	.align	2
	.global	Delay
	.type	Delay, %function
Delay:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #80
	str	r0, [fp, #-60]
	str	r1, [fp, #-64]
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	bgt	.L74
	mvn	r2, #1
	str	r2, [fp, #-92]
	b	.L76
.L74:
	mov	r3, #10
	strb	r3, [fp, #-27]
	ldr	r1, [fp, #-64]
	ldr	r3, .L81
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #25
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L81+4
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-88]
	ldr	r3, [fp, #-88]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-88]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-88]
	ldr	r2, [fp, #-88]
	and	r3, r2, #255
	strb	r3, [fp, #-26]
	ldr	r1, [fp, #-64]
	ldr	r3, .L81+8
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #18
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L81+4
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-84]
	ldr	r3, [fp, #-84]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-84]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-84]
	ldr	r2, [fp, #-84]
	and	r3, r2, #255
	strb	r3, [fp, #-25]
	ldr	r1, [fp, #-64]
	ldr	r3, .L81+12
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #12
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L81+4
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-80]
	ldr	r3, [fp, #-80]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-80]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-80]
	ldr	r2, [fp, #-80]
	and	r3, r2, #255
	strb	r3, [fp, #-24]
	ldr	r1, [fp, #-64]
	ldr	r3, .L81+4
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L81+4
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-76]
	ldr	r3, [fp, #-76]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-76]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-76]
	ldr	r2, [fp, #-76]
	and	r3, r2, #255
	strb	r3, [fp, #-23]
	ldr	r1, [fp, #-64]
	ldr	r3, .L81+4
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-72]
	ldr	r3, [fp, #-72]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-72]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-72]
	ldr	r2, [fp, #-72]
	and	r3, r2, #255
	strb	r3, [fp, #-22]
	mov	r3, #0
	strb	r3, [fp, #-21]
	mov	r3, #7
	str	r3, [fp, #-20]
	mov	r3, #2
	str	r3, [fp, #-16]
	mov	r3, #16
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-52]
	sub	r3, fp, #27
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-44]
	sub	r3, fp, #29
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-36]
	sub	r3, fp, #56
	ldr	r0, .L81+16
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	cmp	r3, #2
	bne	.L77
	mov	r3, #0
	str	r3, [fp, #-68]
	b	.L79
.L77:
	mvn	r2, #2
	str	r2, [fp, #-68]
.L79:
	ldr	r3, [fp, #-68]
	str	r3, [fp, #-92]
.L76:
	ldr	r3, [fp, #-92]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L82:
	.align	2
.L81:
	.word	1441151881
	.word	1374389535
	.word	1125899907
	.word	1759218605
	.word	-559038737
	.size	Delay, .-Delay
	.align	2
	.global	Time
	.type	Time, %function
Time:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #48
	str	r0, [fp, #-56]
	mov	r3, #11
	strb	r3, [fp, #-22]
	mov	r3, #0
	strb	r3, [fp, #-21]
	mov	r3, #2
	str	r3, [fp, #-20]
	mov	r3, #6
	str	r3, [fp, #-16]
	mov	r3, #16
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-48]
	sub	r3, fp, #22
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-40]
	sub	r3, fp, #28
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-32]
	sub	r3, fp, #52
	ldr	r0, .L88
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	cmp	r3, #6
	bne	.L84
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
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
	ldrb	r3, [fp, #-27]	@ zero_extendqisi2
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
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	mov	r0, r3
	ldrb	r3, [fp, #-26]	@ zero_extendqisi2
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
	ldrb	r3, [fp, #-24]	@ zero_extendqisi2
	add	r2, r2, r3
	str	r2, [fp, #-60]
	b	.L86
.L84:
	mvn	r3, #0
	str	r3, [fp, #-60]
.L86:
	ldr	r3, [fp, #-60]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L89:
	.align	2
.L88:
	.word	-559038737
	.size	Time, .-Time
	.align	2
	.global	IdlePercentage
	.type	IdlePercentage, %function
IdlePercentage:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	mov	r3, #18
	str	r3, [fp, #-36]
	sub	r3, fp, #36
	ldr	r0, .L92
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L93:
	.align	2
.L92:
	.word	-559038737
	.size	IdlePercentage, .-IdlePercentage
	.align	2
	.global	DelayUntil
	.type	DelayUntil, %function
DelayUntil:
	@ args = 0, pretend = 0, frame = 76
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #76
	str	r0, [fp, #-60]
	str	r1, [fp, #-64]
	mov	r3, #12
	strb	r3, [fp, #-27]
	ldr	r1, [fp, #-64]
	ldr	r3, .L99
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #25
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L99+4
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-88]
	ldr	r3, [fp, #-88]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-88]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-88]
	ldr	r2, [fp, #-88]
	and	r3, r2, #255
	strb	r3, [fp, #-26]
	ldr	r1, [fp, #-64]
	ldr	r3, .L99+8
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #18
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L99+4
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-84]
	ldr	r3, [fp, #-84]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-84]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-84]
	ldr	r2, [fp, #-84]
	and	r3, r2, #255
	strb	r3, [fp, #-25]
	ldr	r1, [fp, #-64]
	ldr	r3, .L99+12
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #12
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L99+4
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-80]
	ldr	r3, [fp, #-80]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-80]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-80]
	ldr	r2, [fp, #-80]
	and	r3, r2, #255
	strb	r3, [fp, #-24]
	ldr	r1, [fp, #-64]
	ldr	r3, .L99+4
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r1, r3, r2
	ldr	r3, .L99+4
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-76]
	ldr	r3, [fp, #-76]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-76]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-76]
	ldr	r2, [fp, #-76]
	and	r3, r2, #255
	strb	r3, [fp, #-23]
	ldr	r1, [fp, #-64]
	ldr	r3, .L99+4
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-72]
	ldr	r3, [fp, #-72]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-72]
	add	r3, r3, r2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-72]
	ldr	r2, [fp, #-72]
	and	r3, r2, #255
	strb	r3, [fp, #-22]
	mov	r3, #0
	strb	r3, [fp, #-21]
	mov	r3, #7
	str	r3, [fp, #-20]
	mov	r3, #2
	str	r3, [fp, #-16]
	mov	r3, #16
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-52]
	sub	r3, fp, #27
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-44]
	sub	r3, fp, #29
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-36]
	sub	r3, fp, #56
	ldr	r0, .L99+16
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	cmp	r3, #2
	bne	.L95
	mov	r3, #0
	str	r3, [fp, #-68]
	b	.L97
.L95:
	mvn	r2, #2
	str	r2, [fp, #-68]
.L97:
	ldr	r3, [fp, #-68]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L100:
	.align	2
.L99:
	.word	1441151881
	.word	1374389535
	.word	1125899907
	.word	1759218605
	.word	-559038737
	.size	DelayUntil, .-DelayUntil
	.align	2
	.global	Getc
	.type	Getc, %function
Getc:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #56
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	blt	.L102
	ldr	r3, [fp, #-60]
	cmp	r3, #1
	ble	.L104
.L102:
	mov	r3, #255
	str	r3, [fp, #-68]
	b	.L105
.L104:
	ldr	r2, [fp, #-60]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	and	r3, r3, #255
	add	r3, r3, #10
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [fp, #-22]
	mov	r3, #0
	strb	r3, [fp, #-21]
	mov	r3, #2
	str	r3, [fp, #-20]
	mov	r3, #3
	str	r3, [fp, #-16]
	mov	r3, #17
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-48]
	sub	r3, fp, #22
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-40]
	sub	r3, fp, #25
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-32]
	sub	r3, fp, #52
	ldr	r0, .L110
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	cmp	r3, #2
	bne	.L106
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	str	r3, [fp, #-64]
	b	.L108
.L106:
	mov	r3, #253
	str	r3, [fp, #-64]
.L108:
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-68]
.L105:
	ldr	r3, [fp, #-68]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L111:
	.align	2
.L110:
	.word	-559038737
	.size	Getc, .-Getc
	.align	2
	.global	Putc
	.type	Putc, %function
Putc:
	@ args = 0, pretend = 0, frame = 60
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #60
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	mov	r3, r2
	strb	r3, [fp, #-64]
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	blt	.L113
	ldr	r3, [fp, #-60]
	cmp	r3, #1
	ble	.L115
.L113:
	mvn	r3, #0
	str	r3, [fp, #-72]
	b	.L116
.L115:
	ldr	r2, [fp, #-60]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	and	r3, r3, #255
	add	r3, r3, #11
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [fp, #-23]
	ldrb	r3, [fp, #-64]
	strb	r3, [fp, #-22]
	mov	r3, #0
	strb	r3, [fp, #-21]
	mov	r3, #3
	str	r3, [fp, #-20]
	mov	r3, #3
	str	r3, [fp, #-16]
	mov	r3, #17
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-48]
	sub	r3, fp, #23
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-40]
	sub	r3, fp, #26
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-32]
	sub	r3, fp, #52
	ldr	r0, .L121
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	cmp	r3, #2
	bne	.L117
	mov	r3, #0
	str	r3, [fp, #-68]
	b	.L119
.L117:
	mvn	r3, #2
	str	r3, [fp, #-68]
.L119:
	ldr	r3, [fp, #-68]
	str	r3, [fp, #-72]
.L116:
	ldr	r3, [fp, #-72]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L122:
	.align	2
.L121:
	.word	-559038737
	.size	Putc, .-Putc
	.align	2
	.global	Putx
	.type	Putx, %function
Putx:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	mov	r3, r2
	strb	r3, [fp, #-28]
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, lsr #4
	and	r3, r3, #255
	mov	r0, r3
	bl	c2x(PLT)
	mov	r3, r0
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	and	r3, r3, #15
	mov	r0, r3
	bl	c2x(PLT)
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	mov	r2, r3
	bl	Putc(PLT)
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	mov	r2, r3
	bl	Putc(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	Putx, .-Putx
	.align	2
	.global	Putr
	.type	Putr, %function
Putr:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	sub	r3, fp, #32
	str	r3, [fp, #-16]
	mov	r3, #3
	str	r3, [fp, #-20]
	b	.L126
.L127:
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	Putx(PLT)
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L126:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L127
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, #32
	bl	Putc(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	Putr, .-Putr
	.align	2
	.global	Putstr
	.type	Putstr, %function
Putstr:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	b	.L131
.L132:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	mov	r2, r3
	bl	Putc(PLT)
	mov	r3, r0
	cmp	r3, #0
	bge	.L133
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L135
.L133:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L131:
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L132
	mov	r3, #0
	str	r3, [fp, #-28]
.L135:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	Putstr, .-Putstr
	.align	2
	.global	Putw
	.type	Putw, %function
Putw:
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	strb	r3, [fp, #-36]
	ldr	r3, [fp, #4]
	str	r3, [fp, #-16]
	b	.L139
.L140:
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
.L139:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	eor	r3, r2, #1
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L143
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bgt	.L140
	b	.L143
.L144:
	ldrb	r3, [fp, #-36]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	Putc(PLT)
.L143:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
	cmp	r2, #0
	bne	.L144
	b	.L146
.L147:
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	Putc(PLT)
.L146:
	ldr	r3, [fp, #4]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-17]
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	ldr	r3, [fp, #4]
	add	r3, r3, #1
	str	r3, [fp, #4]
	cmp	r2, #0
	bne	.L147
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	Putw, .-Putw
	.align	2
	.global	IOFormat
	.type	IOFormat, %function
IOFormat:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #48
	str	r0, [fp, #-36]
	str	r1, [fp, #-40]
	str	r2, [fp, #-44]
	str	r3, [fp, #-48]
	b	.L169
.L152:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L153
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r2, r3
	bl	Putc(PLT)
	b	.L151
.L153:
	mov	r3, #0
	strb	r3, [fp, #-13]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-44]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-44]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	cmp	r3, #48
	beq	.L156
	ldr	r3, [fp, #-56]
	cmp	r3, #48
	blt	.L155
	ldr	r3, [fp, #-56]
	cmp	r3, #57
	bgt	.L155
	b	.L157
.L156:
	mov	r3, #1
	strb	r3, [fp, #-13]
	ldr	r2, [fp, #-44]
	ldrb	r3, [r2, #0]
	strb	r3, [fp, #-14]
	add	r3, r2, #1
	str	r3, [fp, #-44]
	b	.L155
.L157:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	sub	r2, fp, #44
	sub	ip, fp, #32
	mov	r0, r3
	mov	r1, r2
	mov	r2, #10
	mov	r3, ip
	bl	bwa2i(PLT)
	mov	r3, r0
	strb	r3, [fp, #-14]
.L155:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #115
	beq	.L162
	ldr	r3, [fp, #-52]
	cmp	r3, #115
	bgt	.L165
	ldr	r3, [fp, #-52]
	cmp	r3, #99
	beq	.L160
	ldr	r3, [fp, #-52]
	cmp	r3, #99
	bgt	.L166
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	beq	.L168
	ldr	r3, [fp, #-52]
	cmp	r3, #37
	beq	.L159
	b	.L151
.L166:
	ldr	r3, [fp, #-52]
	cmp	r3, #100
	beq	.L161
	b	.L151
.L165:
	ldr	r3, [fp, #-52]
	cmp	r3, #117
	beq	.L163
	ldr	r3, [fp, #-52]
	cmp	r3, #120
	beq	.L164
	b	.L151
.L160:
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r2, r3
	bl	Putc(PLT)
	b	.L151
.L162:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r3, #0
	bl	Putw(PLT)
	b	.L151
.L163:
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #10
	bl	bwui2a(PLT)
	ldr	r2, [fp, #-32]
	ldrb	ip, [fp, #-13]	@ zero_extendqisi2
	sub	r3, fp, #26
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r3, ip
	bl	Putw(PLT)
	b	.L151
.L161:
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, r2
	bl	bwi2a(PLT)
	ldr	r2, [fp, #-32]
	ldrb	ip, [fp, #-13]	@ zero_extendqisi2
	sub	r3, fp, #26
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r3, ip
	bl	Putw(PLT)
	b	.L151
.L164:
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	ldr	r3, [r3, #0]
	sub	r2, fp, #26
	mov	r0, r3
	mov	r1, #16
	bl	bwui2a(PLT)
	ldr	r2, [fp, #-32]
	ldrb	ip, [fp, #-13]	@ zero_extendqisi2
	sub	r3, fp, #26
	str	r3, [sp, #0]
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r3, ip
	bl	Putw(PLT)
	b	.L151
.L159:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	ldr	r0, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r2, r3
	bl	Putc(PLT)
.L151:
.L169:
	ldr	r1, [fp, #-44]
	ldrb	r3, [r1, #0]
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	and	r2, r3, #255
	add	r3, r1, #1
	str	r3, [fp, #-44]
	cmp	r2, #0
	bne	.L152
.L168:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	IOFormat, .-IOFormat
	.align	2
	.global	Printf
	.type	Printf, %function
Printf:
	@ args = 4, pretend = 8, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 1
	mov	ip, sp
	stmfd	sp!, {r2, r3}
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #12
	sub	sp, sp, #12
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	add	r3, fp, #8
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #4]
	ldr	r3, [fp, #-16]
	bl	IOFormat(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	Printf, .-Printf
	.ident	"GCC: (GNU) 4.0.2"
