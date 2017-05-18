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
	.global	MyTid
	.type	MyTid, %function
MyTid:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	mov	r3, #1
	str	r3, [fp, #-16]
	sub	r3, fp, #16
	ldr	r0, .L5
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L6:
	.align	2
.L5:
	.word	-559038737
	.size	MyTid, .-MyTid
	.align	2
	.global	MyParentTid
	.type	MyParentTid, %function
MyParentTid:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	mov	r3, #2
	str	r3, [fp, #-16]
	sub	r3, fp, #16
	ldr	r0, .L9
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
.L10:
	.align	2
.L9:
	.word	-559038737
	.size	MyParentTid, .-MyParentTid
	.align	2
	.global	Pass
	.type	Pass, %function
Pass:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	mov	r3, #4
	str	r3, [fp, #-16]
	sub	r3, fp, #16
	ldr	r0, .L13
	mov	r1, r3
	bl	user_contextswitch(PLT)
	ldmfd	sp, {r3, fp, sp, pc}
.L14:
	.align	2
.L13:
	.word	-559038737
	.size	Pass, .-Pass
	.align	2
	.global	Exit
	.type	Exit, %function
Exit:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	mov	r3, #5
	str	r3, [fp, #-16]
	sub	r3, fp, #16
	ldr	r0, .L17
	mov	r1, r3
	bl	user_contextswitch(PLT)
	ldmfd	sp, {r3, fp, sp, pc}
.L18:
	.align	2
.L17:
	.word	-559038737
	.size	Exit, .-Exit
	.ident	"GCC: (GNU) 4.0.2"
