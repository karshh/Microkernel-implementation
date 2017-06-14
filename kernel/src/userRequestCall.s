	.file	"userRequestCall.c"
	.text
	.align	2
	.global	user_contextswitch
	.type	user_contextswitch, %function
user_contextswitch:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	swi 0
	bx	lr
	.size	user_contextswitch, .-user_contextswitch
	.align	2
	.global	Create
	.type	Create, %function
Create:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	stmib	sp, {r0, r1}	@ phole stm
	mov	r3, #3
	mov	r1, sp
	ldr	r0, .L5
	str	r3, [sp, #0]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L6:
	.align	2
.L5:
	.word	-559038737
	.size	Create, .-Create
	.align	2
	.global	CreateNameServer
	.type	CreateNameServer, %function
CreateNameServer:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	stmib	sp, {r0, r1}	@ phole stm
	mov	r3, #4
	mov	r1, sp
	ldr	r0, .L9
	str	r3, [sp, #0]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L10:
	.align	2
.L9:
	.word	-559038737
	.size	CreateNameServer, .-CreateNameServer
	.align	2
	.global	CreateClockServer
	.type	CreateClockServer, %function
CreateClockServer:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	stmib	sp, {r0, r1}	@ phole stm
	mov	r3, #5
	mov	r1, sp
	ldr	r0, .L13
	str	r3, [sp, #0]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L14:
	.align	2
.L13:
	.word	-559038737
	.size	CreateClockServer, .-CreateClockServer
	.align	2
	.global	CreateIOServer
	.type	CreateIOServer, %function
CreateIOServer:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	stmib	sp, {r0, r1}	@ phole stm
	mov	r3, #6
	mov	r1, sp
	ldr	r0, .L17
	str	r3, [sp, #0]
	str	r2, [sp, #12]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
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
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	mov	r3, #1
	mov	r1, sp
	ldr	r0, .L21
	str	r3, [sp, #0]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
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
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	mov	r3, #2
	mov	r1, sp
	ldr	r0, .L25
	str	r3, [sp, #0]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
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
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	mov	r3, #7
	mov	r1, sp
	ldr	r0, .L29
	str	r3, [sp, #0]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
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
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	mov	r3, #8
	mov	r1, sp
	ldr	r0, .L33
	str	r3, [sp, #0]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
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
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	mov	r3, #19
	mov	r1, sp
	ldr	r0, .L37
	str	r3, [sp, #0]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L38:
	.align	2
.L37:
	.word	-559038737
	.size	Quit, .-Quit
	.align	2
	.global	Send
	.type	Send, %function
Send:
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	str	r3, [sp, #16]
	ldr	r3, [sp, #28]
	stmib	sp, {r0, r1}	@ phole stm
	mov	ip, #9
	mov	r1, sp
	ldr	r0, .L41
	str	ip, [sp, #0]
	str	r2, [sp, #12]
	str	r3, [sp, #20]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L42:
	.align	2
.L41:
	.word	-559038737
	.size	Send, .-Send
	.align	2
	.global	WhoIs
	.type	WhoIs, %function
WhoIs:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #52
	add	r5, sp, #26
	mov	r1, r0
	mov	ip, #48
	mov	r0, r5
	mov	r2, #2
	mov	r3, #17
	mov	r4, #49
	strb	ip, [sp, #26]
	strb	r4, [sp, #27]
	bl	pkstrcpy_aftern_append(PLT)
	mov	r3, #12
	str	r3, [sp, #0]
	add	r3, r3, #6
	mov	ip, #0
	str	r3, [sp, #12]
	add	r2, sp, #50
	sub	r3, r3, #16
	mov	r1, sp
	ldr	r0, .L51
	str	r3, [sp, #20]
	str	ip, [sp, #4]
	str	r5, [sp, #8]
	str	r2, [sp, #16]
	strb	ip, [sp, #50]
	strb	ip, [sp, #51]
	bl	user_contextswitch(PLT)
	str	r0, [sp, #44]
	ldr	r3, [sp, #44]
	cmp	r3, #0
	ldrlt	r0, [sp, #44]
	blt	.L46
	ldrb	r3, [sp, #50]	@ zero_extendqisi2
	tst	r3, #128
	sub	r0, r3, #256
	moveq	r0, r3
.L46:
	add	sp, sp, #52
	ldmfd	sp!, {r4, r5, pc}
.L52:
	.align	2
.L51:
	.word	-559038737
	.size	WhoIs, .-WhoIs
	.align	2
	.global	RegisterAs
	.type	RegisterAs, %function
RegisterAs:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #52
	add	r5, sp, #26
	mov	r1, r0
	mov	ip, #49
	mov	r0, r5
	mov	r2, #2
	mov	r3, #17
	mov	r4, #48
	strb	ip, [sp, #26]
	strb	r4, [sp, #27]
	bl	pkstrcpy_aftern_append(PLT)
	mov	r3, #13
	str	r3, [sp, #0]
	add	r3, r3, #5
	mov	ip, #0
	str	r3, [sp, #12]
	add	r2, sp, #50
	sub	r3, r3, #16
	mov	r1, sp
	ldr	r0, .L60
	str	r3, [sp, #20]
	str	ip, [sp, #4]
	str	r5, [sp, #8]
	str	r2, [sp, #16]
	strb	ip, [sp, #50]
	strb	ip, [sp, #51]
	bl	user_contextswitch(PLT)
	str	r0, [sp, #44]
	ldr	r3, [sp, #44]
	cmp	r3, #0
	ldrlt	r0, [sp, #44]
	blt	.L56
	ldrb	r3, [sp, #50]	@ zero_extendqisi2
	tst	r3, #128
	sub	r0, r3, #256
	moveq	r0, r3
.L56:
	add	sp, sp, #52
	ldmfd	sp!, {r4, r5, pc}
.L61:
	.align	2
.L60:
	.word	-559038737
	.size	RegisterAs, .-RegisterAs
	.align	2
	.global	Receive
	.type	Receive, %function
Receive:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	stmib	sp, {r0, r1}	@ phole stm
	mov	r3, #10
	mov	r1, sp
	ldr	r0, .L64
	str	r3, [sp, #0]
	str	r2, [sp, #12]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L65:
	.align	2
.L64:
	.word	-559038737
	.size	Receive, .-Receive
	.align	2
	.global	Reply
	.type	Reply, %function
Reply:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	stmib	sp, {r0, r1}	@ phole stm
	mov	r3, #11
	mov	r1, sp
	ldr	r0, .L68
	str	r3, [sp, #0]
	str	r2, [sp, #12]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L69:
	.align	2
.L68:
	.word	-559038737
	.size	Reply, .-Reply
	.align	2
	.global	AwaitEvent
	.type	AwaitEvent, %function
AwaitEvent:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	str	r0, [sp, #4]
	mov	r3, #14
	mov	r1, sp
	ldr	r0, .L72
	str	r3, [sp, #0]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L73:
	.align	2
.L72:
	.word	-559038737
	.size	AwaitEvent, .-AwaitEvent
	.align	2
	.global	Delay
	.type	Delay, %function
Delay:
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
	subs	fp, r1, #0
	sub	sp, sp, #64
	mov	r9, r0
	ldr	lr, .L82
	mov	ip, fp, asr #31
	add	r1, sp, #28
	mvn	r3, #1
	ldr	r0, .L82+4
	bgt	.L81
.L77:
	mov	r0, r3
	add	sp, sp, #64
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, pc}
.L81:
	ldr	r3, .L82+8
	str	r9, [sp, #32]
	smull	r4, r2, r3, fp
	str	r2, [sp, #20]
	ldr	r2, .L82+12
	smull	r3, r7, r2, fp
	str	r7, [sp, #8]
	smull	r7, r5, lr, fp
	ldr	r3, .L82+16
	rsb	r5, ip, r5, asr #5
	smull	r4, r6, r3, fp
	ldr	r2, [sp, #20]
	smull	r7, r4, lr, r5
	rsb	r2, ip, r2, asr #25
	ldr	r3, [sp, #8]
	str	r2, [sp, #24]
	rsb	r3, ip, r3, asr #18
	rsb	r6, ip, r6, asr #12
	str	r4, [sp, #0]
	smull	ip, r4, lr, r2
	ldr	ip, [sp, #24]
	str	r3, [sp, #12]
	smull	r2, r8, lr, r3
	smull	r3, r7, lr, r6
	mov	r3, ip, asr #31
	ldr	ip, [sp, #12]
	rsb	r3, r3, r4, asr #5
	mov	r2, ip, asr #31
	mov	ip, r6, asr #31
	rsb	ip, ip, r7, asr #5
	add	r3, r3, r3, asl #2
	ldr	r7, [sp, #24]
	add	r3, r3, r3, asl #2
	sub	r3, r7, r3, asl #2
	rsb	r2, r2, r8, asr #5
	ldr	r4, [sp, #0]
	str	r3, [sp, #16]
	add	r2, r2, r2, asl #2
	ldr	r3, [sp, #12]
	mov	lr, r5, asr #31
	add	r2, r2, r2, asl #2
	sub	r2, r3, r2, asl #2
	rsb	lr, lr, r4, asr #5
	mov	r3, #10
	add	r4, r5, r5, asl #2
	strb	r3, [sp, #55]
	strb	r2, [sp, #57]
	sub	r3, r3, #10
	mov	r2, #16
	add	ip, ip, ip, asl #2
	add	lr, lr, lr, asl #2
	add	ip, ip, ip, asl #2
	add	lr, lr, lr, asl #2
	ldr	r7, [sp, #16]
	strb	r3, [sp, #61]
	str	r2, [sp, #28]
	add	r3, sp, #55
	sub	r2, r2, #9
	add	r4, r4, r4, asl #2
	sub	r6, r6, ip, asl #2
	sub	r5, r5, lr, asl #2
	str	r3, [sp, #36]
	str	r2, [sp, #40]
	add	r3, sp, #62
	sub	r2, r2, #5
	sub	r4, fp, r4, asl #2
	str	r3, [sp, #44]
	strb	r7, [sp, #56]
	strb	r6, [sp, #58]
	strb	r5, [sp, #59]
	strb	r4, [sp, #60]
	str	r2, [sp, #48]
	bl	user_contextswitch(PLT)
	cmp	r0, #2
	mvnne	r3, #2
	moveq	r3, #0
	b	.L77
.L83:
	.align	2
.L82:
	.word	1374389535
	.word	-559038737
	.word	1441151881
	.word	1125899907
	.word	1759218605
	.size	Delay, .-Delay
	.align	2
	.global	Time
	.type	Time, %function
Time:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r3, #11
	sub	sp, sp, #32
	strb	r3, [sp, #30]
	mov	r2, #0
	add	r3, r3, #5
	strb	r2, [sp, #31]
	str	r3, [sp, #0]
	add	r2, sp, #30
	sub	r3, r3, #14
	stmib	sp, {r0, r2, r3}	@ phole stm
	add	r2, sp, #24
	add	r3, r3, #4
	mov	r1, sp
	ldr	r0, .L89
	str	r2, [sp, #16]
	str	r3, [sp, #20]
	bl	user_contextswitch(PLT)
	cmp	r0, #6
	mvn	r0, #0
	bne	.L87
	ldrb	r1, [sp, #24]	@ zero_extendqisi2
	ldrb	lr, [sp, #25]	@ zero_extendqisi2
	ldrb	r2, [sp, #26]	@ zero_extendqisi2
	rsb	r3, r1, r1, asl #5
	rsb	r3, r3, r3, asl #6
	rsb	ip, lr, lr, asl #5
	ldrb	r0, [sp, #27]	@ zero_extendqisi2
	rsb	r4, r2, r2, asl #5
	add	r1, r1, r3, asl #3
	add	r2, r2, r4, asl #2
	rsb	ip, ip, ip, asl #6
	add	lr, lr, ip, asl #3
	add	r1, r1, r1, asl #2
	add	r0, r0, r0, asl #2
	add	r2, r2, r2, asl #2
	add	r0, r0, r0, asl #2
	add	r1, r1, r1, asl #2
	mov	lr, lr, asl #6
	mov	r2, r2, asl #4
	add	r2, r2, r0, asl #2
	add	lr, lr, r1, asl #8
	ldrb	r3, [sp, #28]	@ zero_extendqisi2
	add	lr, lr, r2
	add	r0, lr, r3
.L87:
	add	sp, sp, #32
	ldmfd	sp!, {r4, pc}
.L90:
	.align	2
.L89:
	.word	-559038737
	.size	Time, .-Time
	.align	2
	.global	IdlePercentage
	.type	IdlePercentage, %function
IdlePercentage:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	mov	r3, #18
	mov	r1, sp
	ldr	r0, .L93
	str	r3, [sp, #0]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L94:
	.align	2
.L93:
	.word	-559038737
	.size	IdlePercentage, .-IdlePercentage
	.align	2
	.global	DelayUntil
	.type	DelayUntil, %function
DelayUntil:
	@ args = 0, pretend = 0, frame = 44
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
	ldr	r3, .L100
	mov	r8, r1
	smull	r2, r1, r3, r8
	ldr	r2, .L100+4
	ldr	ip, .L100+8
	smull	r3, r6, r2, r8
	ldr	r3, .L100+12
	sub	sp, sp, #44
	str	r1, [sp, #0]
	smull	r7, r2, r3, r8
	smull	r1, r5, ip, r8
	ldr	r3, [sp, #0]
	mov	r4, r8, asr #31
	rsb	r3, r4, r3, asr #25
	str	r3, [sp, #4]
	rsb	r5, r4, r5, asr #5
	rsb	r6, r4, r6, asr #18
	rsb	r4, r4, r2, asr #12
	smull	r2, lr, ip, r3
	smull	r1, r7, ip, r5
	smull	r3, r9, ip, r6
	ldr	r2, [sp, #4]
	smull	r1, fp, ip, r4
	mov	r3, r2, asr #31
	mov	ip, r5, asr #31
	mov	r2, r6, asr #31
	rsb	r3, r3, lr, asr #5
	rsb	r2, r2, r9, asr #5
	rsb	ip, ip, r7, asr #5
	add	r3, r3, r3, asl #2
	ldr	r7, [sp, #4]
	mov	r1, r4, asr #31
	add	r3, r3, r3, asl #2
	add	r2, r2, r2, asl #2
	sub	r9, r7, r3, asl #2
	rsb	r1, r1, fp, asr #5
	add	r2, r2, r2, asl #2
	mov	r3, #12
	sub	r6, r6, r2, asl #2
	strb	r3, [sp, #35]
	add	lr, r5, r5, asl #2
	sub	r3, r3, #12
	mov	r2, #16
	add	r1, r1, r1, asl #2
	add	ip, ip, ip, asl #2
	add	ip, ip, ip, asl #2
	add	lr, lr, lr, asl #2
	strb	r3, [sp, #41]
	str	r2, [sp, #8]
	add	r3, sp, #35
	add	r1, r1, r1, asl #2
	sub	r2, r2, #9
	sub	r4, r4, r1, asl #2
	sub	r8, r8, lr, asl #2
	str	r0, [sp, #12]
	sub	r5, r5, ip, asl #2
	str	r3, [sp, #16]
	str	r2, [sp, #20]
	add	r3, sp, #42
	sub	r2, r2, #5
	add	r1, sp, #8
	ldr	r0, .L100+16
	strb	r9, [sp, #36]
	strb	r6, [sp, #37]
	strb	r4, [sp, #38]
	strb	r5, [sp, #39]
	strb	r8, [sp, #40]
	str	r3, [sp, #24]
	str	r2, [sp, #28]
	bl	user_contextswitch(PLT)
	cmp	r0, #2
	mvnne	r0, #2
	moveq	r0, #0
	add	sp, sp, #44
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, fp, pc}
.L101:
	.align	2
.L100:
	.word	1441151881
	.word	1125899907
	.word	1374389535
	.word	1759218605
	.word	-559038737
	.size	DelayUntil, .-DelayUntil
	.align	2
	.global	Getc
	.type	Getc, %function
Getc:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, r1
	add	r3, r1, r1, asl #2
	sub	sp, sp, #32
	mov	r3, r3, asl #1
	cmp	r2, #1
	mov	ip, r0
	add	r3, r3, #10
	mov	r1, sp
	mov	r2, #255
	ldr	r0, .L109
	bhi	.L105
	strb	r3, [sp, #30]
	mov	r2, #17
	mov	r3, #0
	strb	r3, [sp, #31]
	str	r2, [sp, #0]
	add	r3, sp, #30
	sub	r2, r2, #15
	str	r3, [sp, #8]
	str	r2, [sp, #12]
	add	r3, sp, #27
	add	r2, r2, #1
	str	r2, [sp, #20]
	str	ip, [sp, #4]
	str	r3, [sp, #16]
	bl	user_contextswitch(PLT)
	cmp	r0, #2
	mov	r2, #253
	ldreqb	r2, [sp, #27]	@ zero_extendqisi2
.L105:
	mov	r0, r2
	add	sp, sp, #32
	ldmfd	sp!, {pc}
.L110:
	.align	2
.L109:
	.word	-559038737
	.size	Getc, .-Getc
	.align	2
	.global	Putc
	.type	Putc, %function
Putc:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r3, r1
	add	r1, r1, r1, asl #2
	mov	r1, r1, asl #1
	sub	sp, sp, #32
	cmp	r3, #1
	add	lr, r1, #11
	mov	ip, r0
	mov	r4, #3
	mov	r1, sp
	mvn	r3, #0
	ldr	r0, .L119
	and	r2, r2, #255
	bls	.L118
.L114:
	mov	r0, r3
	add	sp, sp, #32
	ldmfd	sp!, {r4, pc}
.L118:
	strb	r2, [sp, #30]
	mov	r3, #0
	mov	r2, #17
	strb	r3, [sp, #31]
	str	r2, [sp, #0]
	add	r3, sp, #29
	add	r2, sp, #26
	str	r3, [sp, #8]
	strb	lr, [sp, #29]
	str	ip, [sp, #4]
	str	r2, [sp, #16]
	str	r4, [sp, #20]
	str	r4, [sp, #12]
	bl	user_contextswitch(PLT)
	cmp	r0, #2
	mvnne	r3, #2
	moveq	r3, #0
	b	.L114
.L120:
	.align	2
.L119:
	.word	-559038737
	.size	Putc, .-Putc
	.align	2
	.global	Putx
	.type	Putx, %function
Putx:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	and	r3, r2, #255
	stmfd	sp!, {r4, r5, r6, r7, lr}
	mov	r7, r0
	mov	r0, r3, lsr #4
	mov	r4, r2
	mov	r6, r1
	bl	c2x(PLT)
	mov	r5, r0
	and	r0, r4, #15
	bl	c2x(PLT)
	mov	r1, r6
	mov	r4, r0
	mov	r2, r5
	mov	r0, r7
	bl	Putc(PLT)
	mov	r0, r7
	mov	r1, r6
	mov	r2, r4
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	b	Putc(PLT)
	.size	Putx, .-Putx
	.align	2
	.global	Putr
	.type	Putr, %function
Putr:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #4
	add	r7, sp, #4
	str	r2, [r7, #-4]!
	mov	r5, r0
	mov	r6, r1
	mov	r4, #3
.L124:
	ldrb	r2, [r7, r4]	@ zero_extendqisi2
	mov	r0, r5
	sub	r4, r4, #1
	mov	r1, r6
	bl	Putx(PLT)
	cmn	r4, #1
	bne	.L124
	mov	r0, r5
	mov	r1, r6
	mov	r2, #32
	bl	Putc(PLT)
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, pc}
	.size	Putr, .-Putr
	.align	2
	.global	Putstr
	.type	Putstr, %function
Putstr:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r3, r2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	mov	r5, r0
	cmp	r2, #0
	mov	r4, r1
	bne	.L138
.L130:
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
.L138:
	mov	r6, r3
	b	.L132
.L133:
	ldrb	r2, [r6, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L130
.L132:
	mov	r0, r5
	mov	r1, r4
	bl	Putc(PLT)
	cmp	r0, #0
	bge	.L133
	mvn	r0, #0
	ldmfd	sp!, {r4, r5, r6, pc}
	.size	Putstr, .-Putstr
	.align	2
	.global	Putw
	.type	Putw, %function
Putw:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	ldr	r9, [sp, #28]
	mov	r7, r0
	ldrb	ip, [r9, #0]	@ zero_extendqisi2
	mov	r6, r1
	cmp	ip, #0
	and	r5, r3, #255
	add	r8, r9, #1
	bne	.L159
.L140:
	cmp	r2, #0
	sub	r4, r2, #1
	ble	.L146
.L153:
	sub	r4, r4, #1
	mov	r0, r7
	mov	r1, r6
	mov	r2, r5
	bl	Putc(PLT)
	add	r3, r4, #1
	cmp	r3, #0
	bgt	.L153
	ldrb	ip, [r9, #0]	@ zero_extendqisi2
.L146:
	and	r2, ip, #255
	cmp	r2, #0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
	mov	r4, r8
.L151:
	mov	r0, r7
	mov	r1, r6
	bl	Putc(PLT)
	ldrb	r2, [r4], #1	@ zero_extendqisi2
	cmp	r2, #0
	ldmeqfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
	mov	r0, r7
	mov	r1, r6
	bl	Putc(PLT)
	ldrb	r2, [r4], #1	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L151
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L159:
	cmp	r2, #0
	movgt	r0, r2
	movgt	r1, #0
	ble	.L140
.L143:
	ldrb	r3, [r1, r8]	@ zero_extendqisi2
	sub	r0, r0, #1
	cmp	r3, #0
	add	r1, r1, #1
	beq	.L144
	cmp	r2, r1
	bne	.L143
.L144:
	mov	r2, r0
	b	.L140
	.size	Putw, .-Putw
	.align	2
	.global	IOFormat
	.type	IOFormat, %function
IOFormat:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #24
	mov	r7, r0
	mov	r6, r1
	mov	r5, r3
	add	r8, sp, #8
	str	r2, [sp, #4]
.L187:
	ldr	r1, [sp, #4]
	mov	r3, r1
	ldrb	r2, [r3], #1	@ zero_extendqisi2
	cmp	r2, #0
	str	r3, [sp, #4]
	beq	.L178
	cmp	r2, #37
	bne	.L184
	mov	r4, #0
	str	r4, [sp, #20]
	ldrb	r0, [r1, #1]	@ zero_extendqisi2
	add	r3, r1, #2
	cmp	r0, #48
	str	r3, [sp, #4]
	beq	.L166
	bcc	.L168
	cmp	r0, #57
	addls	r1, sp, #4
	movls	r2, #10
	addls	r3, sp, #20
	blls	bwa2i(PLT)
.L168:
	cmp	r0, #115
	beq	.L173
.L189:
	bhi	.L176
	cmp	r0, #99
	beq	.L171
	bhi	.L177
	cmp	r0, #0
	bne	.L188
.L178:
	add	sp, sp, #24
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
.L188:
	cmp	r0, #37
	bne	.L187
	mov	r2, r0
.L184:
	mov	r0, r7
	mov	r1, r6
	bl	Putc(PLT)
	b	.L187
.L176:
	cmp	r0, #117
	beq	.L174
	cmp	r0, #120
	bne	.L187
	ldr	r0, [r5, #0]
	mov	r1, #16
	b	.L185
.L166:
	ldrb	r0, [r1, #2]	@ zero_extendqisi2
	add	r3, r1, #3
	cmp	r0, #115
	mov	r4, #1
	str	r3, [sp, #4]
	bne	.L189
.L173:
	ldr	ip, [r5, #0]
	mov	r3, #0
	ldr	r2, [sp, #20]
	mov	r0, r7
	mov	r1, r6
	str	ip, [sp, #0]
	bl	Putw(PLT)
	add	r3, r5, #4
	mov	r5, r3
	b	.L187
.L177:
	cmp	r0, #100
	bne	.L187
	ldr	r0, [r5, #0]
	mov	r1, r8
	bl	bwi2a(PLT)
	b	.L186
.L174:
	ldr	r0, [r5, #0]
	mov	r1, #10
.L185:
	mov	r2, r8
	bl	bwui2a(PLT)
.L186:
	mov	r3, r4
	ldr	r2, [sp, #20]
	mov	r0, r7
	mov	r1, r6
	str	r8, [sp, #0]
	bl	Putw(PLT)
	add	r3, r5, #4
	mov	r5, r3
	b	.L187
.L171:
	ldrb	r2, [r5, #0]	@ zero_extendqisi2
	mov	r0, r7
	mov	r1, r6
	bl	Putc(PLT)
	add	r3, r5, #4
	mov	r5, r3
	b	.L187
	.size	IOFormat, .-IOFormat
	.align	2
	.global	Printf
	.type	Printf, %function
Printf:
	@ args = 4, pretend = 8, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 1
	stmfd	sp!, {r2, r3}
	str	lr, [sp, #-4]!
	ldr	r2, [sp, #4]
	add	r3, sp, #8
	bl	IOFormat(PLT)
	ldr	lr, [sp], #4
	add	sp, sp, #8
	bx	lr
	.size	Printf, .-Printf
	.ident	"GCC: (GNU) 4.0.2"
