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
	.global	MyTid
	.type	MyTid, %function
MyTid:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #24
	mov	r3, #1
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
	ldr	r0, .L13
	str	r3, [sp, #0]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L14:
	.align	2
.L13:
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
	mov	r3, #4
	mov	r1, sp
	ldr	r0, .L17
	str	r3, [sp, #0]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L18:
	.align	2
.L17:
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
	mov	r3, #5
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
	.size	Exit, .-Exit
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
	mov	ip, #6
	mov	r1, sp
	ldr	r0, .L25
	str	ip, [sp, #0]
	str	r2, [sp, #12]
	str	r3, [sp, #20]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L26:
	.align	2
.L25:
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
	mov	r3, #7
	mov	r1, sp
	ldr	r0, .L29
	str	r3, [sp, #0]
	str	r2, [sp, #12]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L30:
	.align	2
.L29:
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
	mov	r3, #8
	mov	r1, sp
	ldr	r0, .L33
	str	r3, [sp, #0]
	str	r2, [sp, #12]
	bl	user_contextswitch(PLT)
	add	sp, sp, #24
	ldmfd	sp!, {pc}
.L34:
	.align	2
.L33:
	.word	-559038737
	.size	Reply, .-Reply
	.ident	"GCC: (GNU) 4.0.2"
