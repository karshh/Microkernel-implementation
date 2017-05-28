	.file	"k1.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	bl	MyTid(PLT)
	mov	r4, r0
	bl	MyParentTid(PLT)
	ldr	r1, .L4+4
	mov	r3, r0
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Pass(PLT)
	bl	MyTid(PLT)
	mov	r4, r0
	bl	MyParentTid(PLT)
	ldr	r1, .L4+8
	mov	r3, r0
	mov	r2, r4
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, sl, lr}
	b	Exit(PLT)
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	otherUserTask, .-otherUserTask
	.section	.rodata.str1.4
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L22
	ldr	r6, .L22+4
	mov	r5, #3
	mov	r4, #1
.L19:
	add	sl, pc, sl
.L7:
	ldr	r1, [sl, r6]
	mov	r0, r5
	bl	Create(PLT)
	ldr	r1, .L22+8
	mov	r2, r0
	cmn	r2, #1
	mov	r0, #1
	add	r1, sl, r1
	beq	.L20
	ldr	r1, .L22+12
	cmn	r2, #2
	mov	r0, #1
	add	r1, sl, r1
	beq	.L20
	ldr	r1, .L22+16
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
.L10:
	cmp	r4, #2
	add	r4, r4, #1
	moveq	r5, #1
	cmp	r4, #5
	bne	.L7
	ldr	r1, .L22+20
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	ldmfd	sp!, {r4, r5, r6, sl, lr}
	b	Exit(PLT)
.L20:
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	b	.L10
.L23:
	.align	2
.L22:
	.word	_GLOBAL_OFFSET_TABLE_-(.L19+8)
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
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L27
	ldr	r3, .L27+4
.L26:
	add	sl, pc, sl
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	kernelRun(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L28:
	.align	2
.L27:
	.word	_GLOBAL_OFFSET_TABLE_-(.L26+8)
	.word	firstUserTask(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
