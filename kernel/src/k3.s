	.file	"k3.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"clockServer\000"
	.align	2
.LC1:
	.ascii	"TD<%d>: Asking God for a delay request.\015\012\000"
	.align	2
.LC2:
	.ascii	"1\000"
	.align	2
.LC3:
	.ascii	"TD<%d>: Received delayTime:%d, numDelays:%d. Enteri"
	.ascii	"ng delay mode.\015\012\000"
	.align	2
.LC4:
	.ascii	"TD<%d>: Delay Interval:[%d-%d]\011Delays completed:"
	.ascii	" %d.\015\012\000"
	.align	2
.LC5:
	.ascii	"TD<%d>: Completed God's delay request. Current time"
	.ascii	" is %d ticks\015\012\000"
	.text
	.align	2
	.global	Task
	.type	Task, %function
Task:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #48
	ldr	sl, .L7
.L6:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	bl	MyTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, .L7+4
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	mov	r3, #3
	strb	r3, [fp, #-17]
	mov	r0, #1
	ldr	r3, .L7+8
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	ldrb	r3, [fp, #-17]	@ zero_extendqisi2
	sub	ip, fp, #35
	str	r3, [sp, #0]
	ldr	r0, [fp, #-32]
	ldr	r3, .L7+12
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #2
	mov	r3, ip
	bl	Send(PLT)
	ldrb	r3, [fp, #-35]	@ zero_extendqisi2
	str	r3, [fp, #-40]
	ldrb	r3, [fp, #-34]	@ zero_extendqisi2
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-48]
	ldr	ip, [fp, #-40]
	ldr	r3, [fp, #-44]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L7+16
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	mov	r3, ip
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L2
.L3:
	ldr	r0, [fp, #-24]
	bl	Time(PLT)
	mov	r3, r0
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-40]
	ldr	r0, [fp, #-24]
	mov	r1, r3
	bl	Delay(PLT)
	ldr	r0, [fp, #-24]
	bl	Time(PLT)
	mov	r3, r0
	str	r3, [fp, #-56]
	ldr	ip, [fp, #-52]
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r2, [sp, #0]
	str	r3, [sp, #4]
	mov	r0, #1
	ldr	r3, .L7+20
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-28]
	mov	r3, ip
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L2:
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	blt	.L3
	ldr	r0, [fp, #-24]
	bl	Time(PLT)
	mov	r3, r0
	mov	r0, #1
	ldr	r2, .L7+24
	add	r2, sl, r2
	mov	r1, r2
	ldr	r2, [fp, #-28]
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L8:
	.align	2
.L7:
	.word	_GLOBAL_OFFSET_TABLE_-(.L6+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.size	Task, .-Task
	.section	.rodata
	.align	2
.LC6:
	.ascii	"\033[2J\033[2;H\000"
	.align	2
.LC7:
	.ascii	"<God>: Sending the following delay parameters to TD"
	.ascii	"<%d>: delayTime:%d, numDelays:%d \015\012\000"
	.align	2
.LC8:
	.ascii	"<God>: Exitting..\015\012\000"
	.text
	.align	2
	.global	God
	.type	God, %function
God:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L12
.L11:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L12+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #2
	ldr	r3, .L12+8
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	CreateNameServer(PLT)
	mov	r0, #2
	ldr	r3, .L12+12
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	CreateClockServer(PLT)
	mov	r0, #3
	ldr	r3, .L12+16
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #4
	ldr	r3, .L12+16
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #5
	ldr	r3, .L12+16
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r0, #6
	ldr	r3, .L12+16
	ldr	r3, [sl, r3]
	mov	r1, r3
	bl	Create(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #4
	str	r3, [fp, #-20]
	sub	r3, fp, #24
	sub	r2, fp, #28
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-20]
	bl	Receive(PLT)
	mov	r3, #10
	strb	r3, [fp, #-31]
	mov	r3, #20
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	ldr	r2, [fp, #-24]
	ldrb	r3, [fp, #-31]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-30]	@ zero_extendqisi2
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L12+20
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-24]
	sub	r2, fp, #31
	mov	r0, r3
	mov	r1, r2
	mov	r2, #3
	bl	Reply(PLT)
	sub	r3, fp, #24
	sub	r2, fp, #28
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-20]
	bl	Receive(PLT)
	mov	r3, #23
	strb	r3, [fp, #-31]
	mov	r3, #9
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	ldr	r2, [fp, #-24]
	ldrb	r3, [fp, #-31]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-30]	@ zero_extendqisi2
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L12+20
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-24]
	sub	r2, fp, #31
	mov	r0, r3
	mov	r1, r2
	mov	r2, #3
	bl	Reply(PLT)
	sub	r3, fp, #24
	sub	r2, fp, #28
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-20]
	bl	Receive(PLT)
	mov	r3, #33
	strb	r3, [fp, #-31]
	mov	r3, #6
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	ldr	r2, [fp, #-24]
	ldrb	r3, [fp, #-31]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-30]	@ zero_extendqisi2
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L12+20
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-24]
	sub	r2, fp, #31
	mov	r0, r3
	mov	r1, r2
	mov	r2, #3
	bl	Reply(PLT)
	sub	r3, fp, #24
	sub	r2, fp, #28
	mov	r0, r3
	mov	r1, r2
	ldr	r2, [fp, #-20]
	bl	Receive(PLT)
	mov	r3, #71
	strb	r3, [fp, #-31]
	mov	r3, #3
	strb	r3, [fp, #-30]
	mov	r3, #0
	strb	r3, [fp, #-29]
	ldr	r2, [fp, #-24]
	ldrb	r3, [fp, #-31]	@ zero_extendqisi2
	mov	ip, r3
	ldrb	r3, [fp, #-30]	@ zero_extendqisi2
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L12+20
	add	r3, sl, r3
	mov	r1, r3
	mov	r3, ip
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-24]
	sub	r2, fp, #31
	mov	r0, r3
	mov	r1, r2
	mov	r2, #3
	bl	Reply(PLT)
	mov	r0, #1
	ldr	r3, .L12+24
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L13:
	.align	2
.L12:
	.word	_GLOBAL_OFFSET_TABLE_-(.L11+8)
	.word	.LC6(GOTOFF)
	.word	NameServerTask(GOT)
	.word	clockServer(GOT)
	.word	Task(GOT)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.size	God, .-God
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L17
.L16:
	add	sl, pc, sl
	MRC p15, 0, r0, c1, c0, 0 
ORR r0, r0, #0x1 <<12 
ORR r0, r0, #0x1 <<2 
MCR p15, 0, r0, c1, c0, 0 

	ldr	r3, .L17+4
	ldr	r3, [sl, r3]
	mov	r0, #3
	mov	r1, r3
	bl	kernelRun(PLT)
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L18:
	.align	2
.L17:
	.word	_GLOBAL_OFFSET_TABLE_-(.L16+8)
	.word	God(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
