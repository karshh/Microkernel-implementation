	.file	"k1.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"mytid:%d.        myparenttid:%d.\015\012\000"
	.align	2
.LC1:
	.ascii	"MyTid:%d.        MyParentTid:%d.\015\012\000"
	.text
	.align	2
	.global	otherUserTask
	.type	otherUserTask, %function
otherUserTask:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L4+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L4+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	otherUserTask, .-otherUserTask
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Invalid priority.\015\012\000"
	.align	2
.LC3:
	.ascii	"Out of task descriptors.\015\012\000"
	.align	2
.LC4:
	.ascii	"Created:<%d>.\015\012\000"
	.align	2
.LC5:
	.ascii	"FirstUserTask: exiting.\015\012\000"
	.text
	.align	2
	.global	firstUserTask
	.type	firstUserTask, %function
firstUserTask:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L19
.L18:
	add	sl, pc, sl
	mov	r3, #3
	str	r3, [fp, #-28]
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L7
.L8:
	ldr	r0, [fp, #-28]
	ldr	r3, .L19+4
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmn	r3, #1
	bne	.L9
	mov	r0, #1
	ldr	r3, .L19+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	b	.L11
.L9:
	ldr	r3, [fp, #-20]
	cmn	r3, #2
	bne	.L12
	mov	r0, #1
	ldr	r3, .L19+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	b	.L11
.L12:
	mov	r0, #1
	ldr	r3, .L19+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	bl	bwprintf(PLT)
.L11:
	ldr	r3, [fp, #-24]
	cmp	r3, #2
	bne	.L14
	mov	r3, #1
	str	r3, [fp, #-28]
.L14:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L7:
	ldr	r3, [fp, #-24]
	cmp	r3, #4
	ble	.L8
	mov	r0, #1
	ldr	r3, .L19+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L20:
	.align	2
.L19:
	.word	_GLOBAL_OFFSET_TABLE_-(.L18+8)
	.word	otherUserTask(GOT)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.size	firstUserTask, .-firstUserTask
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L24
.L23:
	add	sl, pc, sl
	ldr	r3, .L24+4
	ldr	r3, [sl, r3]
	mov	r0, #2
	mov	r1, r3
	bl	kernelRun(PLT)
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L25:
	.align	2
.L24:
	.word	_GLOBAL_OFFSET_TABLE_-(.L23+8)
	.word	firstUserTask(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
