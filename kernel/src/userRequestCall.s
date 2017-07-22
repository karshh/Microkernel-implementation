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
	mov	r3, #6
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
	mov	r3, #7
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
	mov	r3, #8
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
	mov	r3, #9
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
	mov	r3, #4
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
	mov	r3, #5
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
	mov	r3, #10
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
	mov	r3, #11
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
	mov	ip, #1
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
	.global	Receive
	.type	Receive, %function
Receive:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	stmib	sp, {r0, r1}	@ phole stm
	mov	r3, #2
	mov	r1, sp
	ldr	r0, .L45
	str	r3, [sp, #0]
	str	r2, [sp, #12]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L46:
	.align	2
.L45:
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
	mov	r3, #3
	mov	r1, sp
	ldr	r0, .L49
	str	r3, [sp, #0]
	str	r2, [sp, #12]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L50:
	.align	2
.L49:
	.word	-559038737
	.size	Reply, .-Reply
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
	ldr	r0, .L59
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
	blt	.L54
	ldrb	r3, [sp, #50]	@ zero_extendqisi2
	tst	r3, #128
	sub	r0, r3, #256
	moveq	r0, r3
.L54:
	add	sp, sp, #52
	ldmfd	sp!, {r4, r5, pc}
.L60:
	.align	2
.L59:
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
	ldr	r0, .L68
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
	blt	.L64
	ldrb	r3, [sp, #50]	@ zero_extendqisi2
	tst	r3, #128
	sub	r0, r3, #256
	moveq	r0, r3
.L64:
	add	sp, sp, #52
	ldmfd	sp!, {r4, r5, pc}
.L69:
	.align	2
.L68:
	.word	-559038737
	.size	RegisterAs, .-RegisterAs
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
	.global	Putstr
	.type	Putstr, %function
Putstr:
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	cmp	r1, #1
	sub	sp, sp, #96
	mov	r6, r0
	bls	.L138
.L122:
	mvn	r0, #0
.L131:
	add	sp, sp, #96
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L138:
	ldrb	lr, [r2, #0]	@ zero_extendqisi2
	cmp	lr, #0
	addne	r3, r1, r1, asl #2
	movne	r3, r3, asl #1
	addne	r3, r3, #11
	movne	r4, r2
	andne	r7, r3, #255
	movne	r2, #0
	beq	.L129
.L124:
	add	r2, r2, #1
	add	ip, sp, #96
	add	r3, ip, r2
	cmp	r2, #64
	mov	r5, #0
	ldr	r0, .L141
	add	r1, sp, #68
	strb	lr, [r3, #-94]
	beq	.L139
.L125:
	ldrb	lr, [r4, #1]!	@ zero_extendqisi2
	cmp	lr, #0
	bne	.L124
	cmp	r2, #0
	bgt	.L140
.L129:
	mov	r0, #0
	b	.L131
.L140:
	add	r3, sp, #96
	add	ip, r2, #2
	add	r2, r3, r2
	mov	r3, #17
	str	r3, [sp, #68]
	add	r3, sp, #2
	strb	r7, [sp, #2]
	str	r3, [sp, #76]
	strb	lr, [r2, #-93]
	add	r3, sp, #93
	mov	r2, #3
	ldr	r0, .L141
	add	r1, sp, #68
	str	r6, [sp, #72]
	str	ip, [sp, #80]
	str	r3, [sp, #84]
	str	r2, [sp, #88]
	bl	user_contextswitch(PLT)
	cmp	r0, #2
	bne	.L122
	mov	r0, #0
	b	.L131
.L139:
	mov	r3, #17
	str	r3, [sp, #68]
	add	r2, sp, #2
	add	r3, r3, #49
	str	r2, [sp, #76]
	str	r3, [sp, #80]
	add	r2, sp, #93
	sub	r3, r3, #63
	str	r2, [sp, #84]
	str	r3, [sp, #88]
	strb	r7, [sp, #2]
	strb	r5, [sp, #67]
	str	r6, [sp, #72]
	bl	user_contextswitch(PLT)
	cmp	r0, #2
	mov	r2, r5
	beq	.L125
	b	.L122
.L142:
	.align	2
.L141:
	.word	-559038737
	.size	Putstr, .-Putstr
	.align	2
	.global	Putx
	.type	Putx, %function
Putx:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	and	r3, r2, #255
	sub	sp, sp, #4
	mov	r6, r0
	mov	r0, r3, lsr #4
	mov	r4, r2
	mov	r5, r1
	bl	c2x(PLT)
	strb	r0, [sp, #1]
	and	r0, r4, #15
	bl	c2x(PLT)
	mov	r3, #0
	strb	r0, [sp, #2]
	mov	r1, r5
	mov	r0, r6
	add	r2, sp, #1
	strb	r3, [sp, #3]
	bl	Putstr(PLT)
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, pc}
	.size	Putx, .-Putx
	.align	2
	.global	sPutx
	.type	sPutx, %function
sPutx:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	and	r0, r2, #255
	stmfd	sp!, {r4, r5, lr}
	mov	r0, r0, lsr #4
	mov	r5, r3
	mov	r4, r2
	bl	c2x(PLT)
	strb	r0, [r5, #0]
	and	r0, r4, #15
	bl	c2x(PLT)
	strb	r0, [r5, #1]
	mov	r0, #2
	ldmfd	sp!, {r4, r5, pc}
	.size	sPutx, .-sPutx
	.align	2
	.global	Putr
	.type	Putr, %function
Putr:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	sub	sp, sp, #16
	mov	ip, #0
	add	r9, sp, #6
	mov	r3, #32
	str	r2, [sp, #0]
	strb	r3, [sp, #14]
	strb	ip, [sp, #15]
	mov	r6, r0
	mov	r7, r1
	strb	ip, [sp, #6]
	mov	r8, sp
	mov	r5, r9
	mov	r4, #3
.L148:
	ldrb	r2, [r8, r4]	@ zero_extendqisi2
	mov	r3, r5
	mov	r0, r6
	mov	r1, r7
	bl	sPutx(PLT)
	sub	r4, r4, #1
	cmn	r4, #1
	add	r5, r5, r0
	bne	.L148
	mov	r0, r6
	mov	r1, r7
	mov	r2, r9
	bl	Putstr(PLT)
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
	.size	Putr, .-Putr
	.align	2
	.global	Putw
	.type	Putw, %function
Putw:
	@ args = 4, pretend = 0, frame = 1024
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #1024
	ldr	ip, [sp, #1044]
	mov	lr, #0
	ldrb	r5, [ip, #0]	@ zero_extendqisi2
	mov	r6, r0
	cmp	r5, #0
	mov	r7, r1
	strb	lr, [sp, #0]
	mov	r1, r2
	and	r0, r3, #255
	add	ip, ip, #1
	bne	.L172
.L154:
	mov	lr, r1
.L158:
	cmp	lr, #0
	movle	r1, #0
	sub	lr, lr, #1
	movle	r4, sp
	ble	.L162
	mov	r1, #0
	mov	r4, sp
.L163:
	sub	lr, lr, #1
	add	r3, lr, #1
	cmp	r3, #0
	strb	r0, [r1, r4]
	add	r1, r1, #1
	bgt	.L163
.L162:
	and	r3, r5, #255
	cmp	r3, #0
	beq	.L164
	add	r2, r4, r1
	mov	lr, #0
.L166:
	strb	r3, [r2], #1
	ldrb	r3, [lr, ip]	@ zero_extendqisi2
	add	r1, r1, #1
	cmp	r3, #0
	add	lr, lr, #1
	bne	.L166
.L164:
	add	r3, sp, #1024
	add	ip, r3, r1
	mov	r3, #0
	mov	r0, r6
	mov	r1, r7
	mov	r2, sp
	strb	r3, [ip, #-1024]
	bl	Putstr(PLT)
	add	sp, sp, #1024
	ldmfd	sp!, {r4, r5, r6, r7, pc}
.L172:
	cmp	r2, #0
	movgt	lr, r2
	movgt	r2, #0
	ble	.L154
.L157:
	ldrb	r3, [ip, r2]	@ zero_extendqisi2
	sub	lr, lr, #1
	cmp	r3, #0
	add	r2, r2, #1
	beq	.L158
	cmp	r2, r1
	bne	.L157
	b	.L158
	.size	Putw, .-Putw
	.align	2
	.global	sPutw
	.type	sPutw, %function
sPutw:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldrb	r4, [r2, #0]	@ zero_extendqisi2
	mov	r5, r2
	cmp	r4, #0
	mov	r2, r3
	and	r1, r1, #255
	add	r6, r5, #1
	bne	.L195
.L174:
	cmp	r0, #0
	movle	r3, r2
	sub	r0, r0, #1
	movle	ip, #0
	ble	.L182
	mov	ip, #0
.L183:
	sub	r0, r0, #1
	add	r3, r0, #1
	cmp	r3, #0
	strb	r1, [r2, ip]
	add	ip, ip, #1
	bgt	.L183
	ldrb	r4, [r5, #0]	@ zero_extendqisi2
	add	r3, r2, ip
.L182:
	and	r2, r4, #255
	cmp	r2, #0
	beq	.L185
	mov	r1, r6
.L187:
	strb	r2, [r3], #1
	ldrb	r2, [r1], #1	@ zero_extendqisi2
	add	ip, ip, #1
	cmp	r2, #0
	bne	.L187
.L185:
	mov	r0, ip
	ldmfd	sp!, {r4, r5, r6, pc}
.L195:
	cmp	r0, #0
	movgt	lr, r0
	movgt	ip, #0
	ble	.L174
.L177:
	ldrb	r3, [ip, r6]	@ zero_extendqisi2
	sub	lr, lr, #1
	cmp	r3, #0
	add	ip, ip, #1
	beq	.L178
	cmp	r0, ip
	bne	.L177
.L178:
	mov	r0, lr
	b	.L174
	.size	sPutw, .-sPutw
	.align	2
	.global	IOFormat
	.type	IOFormat, %function
IOFormat:
	@ args = 0, pretend = 0, frame = 4116
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	sub	sp, sp, #4096
	sub	sp, sp, #20
	mov	r8, r0
	mov	r6, r3
	add	r0, sp, #4096
	ldr	r3, .L231
	add	r0, r0, #20
	add	r7, sp, #20
	str	r2, [r0, r3]
	sub	r7, r7, #16
	mov	r2, #0
	add	r3, r3, #4
	mov	r9, r1
	mov	r5, r7
	strb	r2, [r0, r3]
.L227:
	ldr	r1, .L231
	add	r3, sp, #4096
	add	r3, r3, #20
	ldr	r2, [r3, r1]
	add	r0, sp, #4096
	mov	r3, r2
	ldrb	ip, [r3], #1	@ zero_extendqisi2
	add	r0, r0, #20
	cmp	ip, #0
	str	r3, [r0, r1]
	beq	.L229
	cmp	ip, #37
	strneb	ip, [r5], #1
	bne	.L227
.L199:
	mov	r3, #0
	add	ip, sp, #4096
	str	r3, [ip, #16]
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	add	ip, sp, #4096
	add	r3, r2, #2
	add	ip, ip, #20
	cmp	r0, #48
	str	r3, [ip, r1]
	beq	.L202
	bcc	.L201
	cmp	r0, #57
	bhi	.L201
	add	r1, sp, #20
	add	r3, sp, #4096
	sub	r1, r1, #20
	mov	r2, #10
	add	r3, r3, #16
	bl	bwa2i(PLT)
.L201:
	cmp	r0, #115
	beq	.L208
	bhi	.L211
	cmp	r0, #99
	beq	.L206
	bhi	.L212
	cmp	r0, #0
	bne	.L230
.L214:
	add	sp, sp, #20
	add	sp, sp, #4096
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, pc}
.L211:
	cmp	r0, #117
	beq	.L209
	cmp	r0, #120
	bne	.L227
	add	r4, sp, #4096
	ldr	r0, [r6, #0]
	add	r4, r4, #4
	mov	r1, #16
.L226:
	mov	r2, r4
	bl	bwui2a(PLT)
	add	r1, sp, #4096
	ldr	r0, [r1, #16]
	mov	r2, r4
	mov	r3, r5
.L225:
	mov	r1, #48
	bl	sPutw(PLT)
	add	r3, r6, #4
	add	r5, r5, r0
	mov	r6, r3
	b	.L227
.L208:
	add	ip, sp, #4096
	mov	r3, r5
	ldr	r2, [r6, #0]
	ldr	r0, [ip, #16]
	mov	r1, #32
	bl	sPutw(PLT)
	add	r3, r6, #4
	add	r5, r5, r0
	mov	r6, r3
	b	.L227
.L202:
	ldrb	r0, [r2, #2]	@ zero_extendqisi2
	add	r3, r2, #3
	add	r2, sp, #4096
	add	r2, r2, #20
	str	r3, [r2, r1]
	b	.L201
.L229:
	mov	r0, r8
	mov	r1, r9
	mov	r2, r7
	strb	ip, [r5, #0]
	bl	Putstr(PLT)
	b	.L214
.L212:
	cmp	r0, #100
	bne	.L227
	add	r4, sp, #4096
	add	r4, r4, #4
	ldr	r0, [r6, #0]
	mov	r1, r4
	bl	bwi2a(PLT)
	add	ip, sp, #4096
	ldr	r0, [ip, #16]
	mov	r2, r4
	mov	r3, r5
	b	.L225
.L230:
	cmp	r0, #37
	streqb	r0, [r5], #1
	b	.L227
.L209:
	add	r4, sp, #4096
	ldr	r0, [r6, #0]
	add	r4, r4, #4
	mov	r1, #10
	b	.L226
.L206:
	ldrb	r3, [r6, #0]	@ zero_extendqisi2
	add	r6, r6, #4
	strb	r3, [r5], #1
	b	.L227
.L232:
	.align	2
.L231:
	.word	-4116
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
