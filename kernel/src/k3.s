	.file	"k3.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L9
	sub	sp, sp, #32
.L6:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r5, r0
	bl	MyTid(PLT)
	mov	r7, r0
	ldr	r0, .L9+4
	mov	r4, #0
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r1, .L9+8
	mov	r2, r7
	add	r1, sl, r1
	mov	r6, r0
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r1, .L9+12
	mov	ip, #3
	add	r1, sl, r1
	mov	r2, #2
	add	r3, sp, #29
	mov	r0, r5
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldrb	r3, [sp, #29]	@ zero_extendqisi2
	ldrb	r2, [sp, #30]	@ zero_extendqisi2
	str	r3, [sp, #24]
	ldr	r1, .L9+16
	str	r2, [sp, #20]
	str	r4, [sp, #16]
	ldr	r3, [sp, #24]
	ldr	ip, [sp, #20]
	mov	r2, r7
	add	r1, sl, r1
	mov	r0, #1
	str	ip, [sp, #0]
	bl	bwprintf(PLT)
	str	r4, [sp, #12]
	str	r4, [sp, #8]
	str	r4, [sp, #16]
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	blt	.L8
.L2:
	mov	r0, r6
	bl	Time(PLT)
	ldr	r1, .L9+20
	mov	r3, r0
	mov	r2, r7
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #32
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L8:
	ldr	r4, .L9+24
.L3:
	mov	r0, r6
	bl	Time(PLT)
	str	r0, [sp, #12]
	ldr	r1, [sp, #24]
	mov	r0, r6
	bl	Delay(PLT)
	mov	r0, r6
	bl	Time(PLT)
	str	r0, [sp, #8]
	ldr	r3, [sp, #12]
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	mov	r2, r7
	add	ip, ip, #1
	mov	r0, #1
	add	r1, sl, r4
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	bl	bwprintf(PLT)
	ldr	r3, [sp, #16]
	add	r3, r3, #1
	str	r3, [sp, #16]
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #20]
	cmp	r2, r3
	blt	.L3
	b	.L2
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L6+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC4(GOTOFF)
	.size	Task, .-Task
	.section	.rodata.str1.4
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
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L14
	ldr	r1, .L14+4
.L13:
	add	sl, pc, sl
	sub	sp, sp, #16
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r3, .L14+8
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	CreateNameServer(PLT)
	ldr	r3, .L14+12
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	CreateClockServer(PLT)
	ldr	r3, .L14+16
	mov	r0, #3
	ldr	r4, [sl, r3]
	add	r9, sp, #8
	mov	r1, r4
	bl	Create(PLT)
	mov	r1, r4
	mov	r0, #4
	bl	Create(PLT)
	mov	r1, r4
	mov	r0, #5
	bl	Create(PLT)
	add	r7, sp, #4
	mov	r1, r4
	mov	r0, #6
	bl	Create(PLT)
	mov	r5, #0
	mov	r1, r7
	mov	r2, #4
	mov	r0, r9
	str	r5, [sp, #8]
	bl	Receive(PLT)
	ldr	r3, .L14+20
	mov	lr, #10
	add	r6, sl, r3
	mov	ip, #20
	mov	r3, lr
	add	r8, sp, #13
	ldr	r2, [sp, #8]
	mov	r1, r6
	mov	r0, #1
	strb	lr, [sp, #13]
	str	ip, [sp, #0]
	strb	ip, [sp, #14]
	strb	r5, [sp, #15]
	bl	bwprintf(PLT)
	mov	r1, r8
	mov	r2, #3
	ldr	r0, [sp, #8]
	bl	Reply(PLT)
	mov	r4, #23
	mov	r1, r7
	mov	r0, r9
	mov	r2, #4
	bl	Receive(PLT)
	mov	ip, #9
	mov	r3, r4
	ldr	r2, [sp, #8]
	mov	r1, r6
	mov	r0, #1
	str	ip, [sp, #0]
	strb	ip, [sp, #14]
	strb	r4, [sp, #13]
	strb	r5, [sp, #15]
	bl	bwprintf(PLT)
	mov	r1, r8
	mov	r2, #3
	ldr	r0, [sp, #8]
	bl	Reply(PLT)
	add	r4, r4, #10
	mov	r1, r7
	mov	r0, r9
	mov	r2, #4
	bl	Receive(PLT)
	mov	ip, #6
	mov	r3, r4
	ldr	r2, [sp, #8]
	mov	r1, r6
	mov	r0, #1
	str	ip, [sp, #0]
	strb	ip, [sp, #14]
	strb	r4, [sp, #13]
	strb	r5, [sp, #15]
	bl	bwprintf(PLT)
	mov	r1, r8
	mov	r2, #3
	ldr	r0, [sp, #8]
	bl	Reply(PLT)
	mov	r1, r7
	mov	r0, r9
	mov	r2, #4
	bl	Receive(PLT)
	mov	ip, #71
	mov	r3, ip
	sub	r4, r4, #30
	mov	r1, r6
	ldr	r2, [sp, #8]
	mov	r0, #1
	strb	ip, [sp, #13]
	strb	r5, [sp, #15]
	strb	r4, [sp, #14]
	str	r4, [sp, #0]
	bl	bwprintf(PLT)
	mov	r1, r8
	mov	r2, r4
	ldr	r0, [sp, #8]
	bl	Reply(PLT)
	ldr	r1, .L14+24
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L15:
	.align	2
.L14:
	.word	_GLOBAL_OFFSET_TABLE_-(.L13+8)
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
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L19
.L18:
	add	sl, pc, sl
	MRC p15, 0, r0, c1, c0, 0 
ORR r0, r0, #0x1 <<12 
ORR r0, r0, #0x1 <<2 
MCR p15, 0, r0, c1, c0, 0 

	ldr	r3, .L19+4
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	kernelRun(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L20:
	.align	2
.L19:
	.word	_GLOBAL_OFFSET_TABLE_-(.L18+8)
	.word	God(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
