	.file	"nameserver.c"
	.text
	.align	2
	.global	nameServerInit
	.type	nameServerInit, %function
nameServerInit:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	sub	sp, sp, #4
	mov	r4, r0
	bl	MyTid(PLT)
	str	r0, [sp, #0]
	ldr	r3, [sp, #0]
	mov	r0, #1
	str	r3, [r4, #0]
	add	sp, sp, #4
	ldmfd	sp!, {r4, pc}
	.size	nameServerInit, .-nameServerInit
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Failed NameServer initialization.\012\015\000"
	.text
	.align	2
	.global	nameServerRun
	.type	nameServerRun, %function
nameServerRun:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L6
	sub	sp, sp, #4
.L5:
	add	sl, pc, sl
	mov	r0, sp
	bl	nameServerInit(PLT)
	ldr	r2, .L6+4
	mov	r1, #1
	add	r2, sl, r2
	bl	bwassert(PLT)
	mov	r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {sl, pc}
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
	.word	.LC0(GOTOFF)
	.size	nameServerRun, .-nameServerRun
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"01\000"
	.align	2
.LC3:
	.ascii	"10\000"
	.align	2
.LC4:
	.ascii	"DO NOT SEND TO NAME SERVER\000"
	.align	2
.LC2:
	.ascii	"1\000"
	.text
	.align	2
	.global	NameServerTask
	.type	NameServerTask, %function
NameServerTask:
	@ args = 0, pretend = 0, frame = 9584
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #9536
	sub	sp, sp, #48
	ldr	sl, .L34
	add	r8, sp, #48
	sub	r8, r8, #28
.L31:
	add	sl, pc, sl
	mov	r0, r8
	bl	initDictionary(PLT)
	ldr	r1, .L34+4
	ldr	r2, .L34+8
	ldr	r3, .L34+12
	add	ip, sp, #9536
	add	lr, sp, #9536
	add	r5, sp, #9536
	add	r7, sp, #9472
	add	r6, sp, #9536
	add	ip, ip, #4
	add	lr, lr, #24
	add	fp, sp, #9536
	ldr	r9, .L34+16
	str	r1, [sp, #12]
	str	r2, [sp, #8]
	str	r3, [sp, #0]
	add	r5, r5, #36
	add	r7, r7, #48
	add	r6, r6, #43
	str	ip, [sp, #16]
	str	lr, [sp, #4]
	add	fp, fp, #46
.L32:
	add	r3, sp, #8192
	mov	r4, #0
	str	r4, [r3, #1380]
	mov	r0, r5
	mov	r1, r7
	mov	r2, #20
	bl	Receive(PLT)
	add	ip, sp, #8192
	str	r0, [ip, #1376]
	ldr	r3, [ip, #1376]
	cmp	r3, #3
	ble	.L10
	add	lr, sp, #9472
	ldrb	r3, [lr, #48]	@ zero_extendqisi2
	ldrb	r2, [lr, #49]	@ zero_extendqisi2
	strb	r3, [lr, #107]
	strb	r2, [lr, #108]
	strb	r4, [lr, #109]
	str	r4, [ip, #1372]
	str	r4, [ip, #1372]
	ldr	r3, [ip, #1372]
	cmp	r3, #14
	bgt	.L12
.L27:
	add	r1, sp, #8192
	ldr	r2, [r1, #1372]
	add	r3, sp, #9536
	ldr	r1, [r1, #1372]
	add	r3, r3, #48
	add	r0, r3, r2
	add	r3, r3, r1
	ldrb	r2, [r3, #-62]	@ zero_extendqisi2
	add	ip, sp, #8192
	strb	r2, [r0, #-44]
	ldr	r3, [ip, #1372]
	add	r3, r3, #1
	str	r3, [ip, #1372]
	ldr	r2, [ip, #1372]
	cmp	r2, #14
	ble	.L27
.L12:
	mov	r0, r6
	add	r1, sl, r9
	bl	pkstreq_volatile(PLT)
	subs	r4, r0, #0
	beq	.L14
	add	lr, sp, #8192
	mov	r3, #0
	str	r3, [lr, #1368]
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #4]
	str	r3, [lr, #1364]
	mov	r0, r8
	bl	searchDictionary(PLT)
	add	r1, sp, #8192
	str	r0, [r1, #1364]
	ldr	r3, [r1, #1364]
	ldr	ip, [sp, #12]
	cmp	r3, #0
	subeq	r3, r3, #2
	add	r2, sp, #8192
	streq	r3, [r1, #1368]
	ldrh	lr, [sl, ip]
	ldr	r3, [r2, #1368]
	add	ip, sp, #9472
	strh	lr, [ip, #110]	@ movhi
	ldr	r0, [r2, #1380]
	mov	r1, fp
	mov	r2, #2
	strb	r3, [ip, #110]
	bl	Reply(PLT)
	b	.L32
.L14:
	ldr	r2, [sp, #8]
	mov	r0, r6
	add	r1, sl, r2
	bl	pkstreq_volatile(PLT)
	cmp	r0, #0
	beq	.L18
	add	r3, sp, #8192
	ldr	r1, [sp, #16]
	ldr	r2, [r3, #1380]
	mov	r0, r8
	bl	addDictionary(PLT)
	ldr	ip, [sp, #12]
	cmp	r0, #0
	ldrh	lr, [sl, ip]
	addeq	r1, sp, #9472
	add	ip, sp, #9472
	add	r2, sp, #8192
	mvneq	r3, #1
	strh	lr, [ip, #110]	@ movhi
	ldr	r0, [r2, #1380]
	streqb	r3, [r1, #110]
	strneb	r4, [ip, #110]
	mov	r1, fp
	mov	r2, #2
	bl	Reply(PLT)
	b	.L32
.L10:
	ldr	r2, [sp, #0]
	add	lr, sp, #8192
	add	r1, sl, r2
	ldr	r0, [lr, #1380]
	mov	r2, #27
	bl	Reply(PLT)
	b	.L32
.L18:
	ldr	ip, [sp, #0]
	add	r3, sp, #8192
	ldr	r0, [r3, #1380]
	add	r1, sl, ip
	mov	r2, #27
	bl	Reply(PLT)
	b	.L32
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.L31+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	NameServerTask, .-NameServerTask
	.ident	"GCC: (GNU) 4.0.2"
