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
	mov	r3, #6
	str	r3, [fp, #-36]
	sub	r3, fp, #36
	ldr	r0, .L25
	mov	r1, r3
	bl	user_contextswitch(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L26:
	.align	2
.L25:
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
	.size	Exit, .-Exit
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
	mov	r3, #8
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
	ldr	r0, .L33
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L34:
	.align	2
.L33:
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
	mov	r3, #11
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
	ldr	r0, .L42
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	bge	.L36
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-80]
	b	.L38
.L36:
	ldrb	r3, [fp, #-66]	@ zero_extendqisi2
	and	r3, r3, #255
	mov	r3, r3, asl #24
	mov	r3, r3, asr #24
	cmp	r3, #0
	bge	.L39
	ldrb	r3, [fp, #-66]	@ zero_extendqisi2
	sub	r3, r3, #256
	str	r3, [fp, #-80]
	b	.L38
.L39:
	ldrb	r3, [fp, #-66]	@ zero_extendqisi2
	str	r3, [fp, #-80]
.L38:
	ldr	r3, [fp, #-80]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L43:
	.align	2
.L42:
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
	ldr	r0, .L51
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	bge	.L45
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-80]
	b	.L47
.L45:
	ldrb	r3, [fp, #-66]	@ zero_extendqisi2
	and	r3, r3, #255
	mov	r3, r3, asl #24
	mov	r3, r3, asr #24
	cmp	r3, #0
	bge	.L48
	ldrb	r3, [fp, #-66]	@ zero_extendqisi2
	sub	r3, r3, #256
	str	r3, [fp, #-80]
	b	.L47
.L48:
	ldrb	r3, [fp, #-66]	@ zero_extendqisi2
	str	r3, [fp, #-80]
.L47:
	ldr	r3, [fp, #-80]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L52:
	.align	2
.L51:
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
	mov	r3, #9
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-24]
	sub	r3, fp, #36
	ldr	r0, .L55
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L56:
	.align	2
.L55:
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
	mov	r3, #10
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-24]
	sub	r3, fp, #36
	ldr	r0, .L59
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L60:
	.align	2
.L59:
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
	mov	r3, #13
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-32]
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
	.size	AwaitEvent, .-AwaitEvent
	.ident	"GCC: (GNU) 4.0.2"
