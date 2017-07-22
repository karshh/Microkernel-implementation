	.file	"usertasks.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Failed Create UART1TR Server.\012\015\000"
	.align	2
.LC1:
	.ascii	"Failed Create UART2TR Server.\012\015\000"
	.align	2
.LC2:
	.ascii	"Failed Create UART1TS Server.\012\015\000"
	.align	2
.LC3:
	.ascii	"Failed Create UART2TS Server.\012\015\000"
	.text
	.align	2
	.global	FirstUserTask
	.type	FirstUserTask, %function
FirstUserTask:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L4
	ldr	r3, .L4+4
.L3:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #2
	bl	CreateNameServer(PLT)
	ldr	r3, .L4+8
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	CreateClockServer(PLT)
	ldr	r3, .L4+12
	mov	r0, #31
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L4+16
	mov	r0, #2
	ldr	r1, [sl, r3]
	mov	r2, r0
	bl	CreateIOServer(PLT)
	ldr	r2, .L4+20
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L4+24
	mov	r2, #4
	ldr	r1, [sl, r3]
	mov	r0, #2
	bl	CreateIOServer(PLT)
	ldr	r2, .L4+28
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L4+32
	mov	r2, #1
	ldr	r1, [sl, r3]
	mov	r0, #2
	bl	CreateIOServer(PLT)
	ldr	r2, .L4+36
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L4+40
	mov	r2, #3
	ldr	r1, [sl, r3]
	mov	r0, #2
	bl	CreateIOServer(PLT)
	ldr	r2, .L4+44
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L4+48
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L4+52
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	NameServerTask(GOT)
	.word	clockServer(GOT)
	.word	idleTask(GOT)
	.word	UART1_ReceiveServer(GOT)
	.word	.LC0(GOTOFF)
	.word	UART2_ReceiveServer(GOT)
	.word	.LC1(GOTOFF)
	.word	UART1_SendServer(GOT)
	.word	.LC2(GOTOFF)
	.word	UART2_SendServer(GOT)
	.word	.LC3(GOTOFF)
	.word	commandServer(GOT)
	.word	displayServer(GOT)
	.size	FirstUserTask, .-FirstUserTask
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Failed Create trackServer.\012\015\000"
	.align	2
.LC5:
	.ascii	"Failed Create sensorServer.\012\015\000"
	.align	2
.LC6:
	.ascii	"Failed Create trainServer.\012\015\000"
	.text
	.align	2
	.global	trainTask
	.type	trainTask, %function
trainTask:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L9
	ldr	r3, .L9+4
.L8:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #4
	bl	Create(PLT)
	ldr	r2, .L9+8
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L9+12
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L9+16
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L9+20
	mov	r0, #4
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L9+24
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	trackServer(GOT)
	.word	.LC4(GOTOFF)
	.word	sensorServer(GOT)
	.word	.LC5(GOTOFF)
	.word	trainServer(GOT)
	.word	.LC6(GOTOFF)
	.size	trainTask, .-trainTask
	.align	2
	.global	idleTask
	.type	idleTask, %function
idleTask:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
.L13:
	b	.L13
	.size	idleTask, .-idleTask
	.ident	"GCC: (GNU) 4.0.2"
