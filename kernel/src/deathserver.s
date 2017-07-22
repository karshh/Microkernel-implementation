	.file	"deathserver.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"commandServer\000"
	.align	2
.LC1:
	.ascii	"<DeathServer>: Error sending message to CommandServ"
	.ascii	"er.\015\012\000"
	.text
	.align	2
	.global	DeathServer
	.type	DeathServer, %function
DeathServer:
	@ args = 0, pretend = 0, frame = 68
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L4
	sub	sp, sp, #72
.L3:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	fp, r0
	ldr	r0, .L4+4
	add	r9, sp, #5
	add	r5, sp, #69
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	r8, #28
	mov	r3, r5
	mov	r6, #0
	mov	r7, #3
	mov	r1, r9
	mov	r2, #4
	strb	r8, [sp, #5]
	strb	r6, [sp, #6]
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	r3, .L4+8
	mvn	r0, r0
	add	r4, sl, r3
	mov	r2, r4
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r1, r9
	mov	r3, r5
	mov	r0, fp
	mov	r2, #2
	strb	r8, [sp, #5]
	strb	r6, [sp, #6]
	str	r7, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r2, r4
	mov	r1, #1
	bl	bwassert(PLT)
	bl	Quit(PLT)
	add	sp, sp, #72
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	DeathServer, .-DeathServer
	.ident	"GCC: (GNU) 4.0.2"
