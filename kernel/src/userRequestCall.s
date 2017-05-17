	.file	"userRequestCall.c"
	.text
	.align	2
	.global	user_contextswitch
	.type	user_contextswitch, %function
user_contextswitch:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	swi 0
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	user_contextswitch, .-user_contextswitch
	.section	.rodata
	.align	2
.LC0:
	.ascii	"got tid\012\015\000"
	.text
	.align	2
	.global	MyTid
	.type	MyTid, %function
MyTid:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L6
.L5:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-24]
	sub	r3, fp, #24
	mov	r0, r3
	mov	r1, #3
	mov	r2, #1
	mov	r3, #4
	bl	user_contextswitch(PLT)
	mov	r0, #1
	ldr	r3, .L6+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
	.word	.LC0(GOTOFF)
	.size	MyTid, .-MyTid
	.section	.rodata
	.align	2
.LC1:
	.ascii	"got parent tid\012\015\000"
	.text
	.align	2
	.global	MyParentTid
	.type	MyParentTid, %function
MyParentTid:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L11
.L10:
	add	sl, pc, sl
	mov	r3, #1
	str	r3, [fp, #-24]
	sub	r3, fp, #24
	mov	r0, r3
	mov	r1, #0
	mov	r2, #0
	mov	r3, #0
	bl	user_contextswitch(PLT)
	mov	r0, #1
	ldr	r3, .L11+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.L10+8)
	.word	.LC1(GOTOFF)
	.size	MyParentTid, .-MyParentTid
	.ident	"GCC: (GNU) 4.0.2"
