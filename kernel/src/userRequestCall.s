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
	.section	.rodata
	.align	2
.LC0:
	.ascii	"arg1 %x \012\015\000"
	.align	2
.LC1:
	.ascii	"arg2 %x \012\015\000"
	.text
	.align	2
	.global	Create
	.type	Create, %function
Create:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L6
.L5:
	add	sl, pc, sl
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	mov	r3, #3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L6+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-32]
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-36]
	mov	r0, #1
	ldr	r3, .L6+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	sub	r3, fp, #28
	ldr	r0, .L6+12
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	-559038737
	.size	Create, .-Create
	.align	2
	.global	MyTid
	.type	MyTid, %function
MyTid:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	mov	r3, #1
	str	r3, [fp, #-24]
	sub	r3, fp, #24
	ldr	r0, .L10
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L11:
	.align	2
.L10:
	.word	-559038737
	.size	MyTid, .-MyTid
	.align	2
	.global	MyParentTid
	.type	MyParentTid, %function
MyParentTid:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	mov	r3, #2
	str	r3, [fp, #-24]
	sub	r3, fp, #24
	ldr	r0, .L14
	mov	r1, r3
	bl	user_contextswitch(PLT)
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L15:
	.align	2
.L14:
	.word	-559038737
	.size	MyParentTid, .-MyParentTid
	.align	2
	.global	Pass
	.type	Pass, %function
Pass:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	mov	r3, #4
	str	r3, [fp, #-24]
	sub	r3, fp, #24
	ldr	r0, .L18
	mov	r1, r3
	bl	user_contextswitch(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L19:
	.align	2
.L18:
	.word	-559038737
	.size	Pass, .-Pass
	.align	2
	.global	Exit
	.type	Exit, %function
Exit:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	mov	r3, #5
	str	r3, [fp, #-24]
	sub	r3, fp, #24
	ldr	r0, .L22
	mov	r1, r3
	bl	user_contextswitch(PLT)
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L23:
	.align	2
.L22:
	.word	-559038737
	.size	Exit, .-Exit
	.ident	"GCC: (GNU) 4.0.2"
