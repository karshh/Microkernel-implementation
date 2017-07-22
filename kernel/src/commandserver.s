	.file	"commandserver.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"commandServer\000"
	.align	2
.LC1:
	.ascii	"Could not register as command server.\015\012\000"
	.align	2
.LC2:
	.ascii	"clockServer\000"
	.align	2
.LC3:
	.ascii	"UART1S\000"
	.align	2
.LC4:
	.ascii	"UART1R\000"
	.align	2
.LC5:
	.ascii	"<commandServer>: clockServer has not been set up.\015"
	.ascii	"\012\000"
	.align	2
.LC6:
	.ascii	"<commandServer>: UART1 Send IOServer has not been s"
	.ascii	"et up.\015\012\000"
	.align	2
.LC7:
	.ascii	"<commandServer>: UART1 Receive IOServer has not bee"
	.ascii	"n set up.\015\012\000"
	.align	2
.LC8:
	.ascii	"<commandServer>: Receive error.\015\012\000"
	.align	2
.LC9:
	.ascii	"1\000"
	.align	2
.LC10:
	.ascii	"0\000"
	.align	2
.LC11:
	.ascii	"<Command Server>: could not send second part of rev"
	.ascii	"erse to reverse delay server.[%d] \015\012\000"
	.text
	.align	2
	.global	commandServer
	.type	commandServer, %function
commandServer:
	@ args = 0, pretend = 0, frame = 544
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L53
	ldr	r0, .L53+4
.L44:
	add	sl, pc, sl
	sub	sp, sp, #548
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L53+8
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L53+12
	mov	r0, #10
	ldr	r4, [sl, r3]
	mov	r1, r4
	bl	Create(PLT)
	mov	r1, r4
	str	r0, [sp, #108]
	mov	r0, #10
	bl	Create(PLT)
	mov	r1, r4
	str	r0, [sp, #112]
	mov	r0, #10
	bl	Create(PLT)
	mov	r1, r4
	str	r0, [sp, #116]
	mov	r0, #10
	bl	Create(PLT)
	str	r0, [sp, #120]
	ldr	r0, .L53+16
	add	r0, sl, r0
	bl	WhoIs(PLT)
	str	r0, [sp, #124]
	ldr	r0, .L53+20
	add	r0, sl, r0
	bl	WhoIs(PLT)
	str	r0, [sp, #128]
	ldr	r0, .L53+24
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	r2, #0
	str	r2, [sp, #540]
	str	r2, [sp, #540]
	ldr	r3, [sp, #540]
	str	r0, [sp, #132]
	cmp	r3, #79
	bgt	.L2
	mov	r1, #1
.L3:
	ldr	r3, [sp, #540]
	add	r0, sp, #548
	add	r2, r0, r3, asl #2
	str	r1, [r2, #-408]
	ldr	r3, [sp, #540]
	add	r3, r3, #1
	str	r3, [sp, #540]
	ldr	r2, [sp, #540]
	cmp	r2, #79
	ble	.L3
.L2:
	ldr	r1, [sp, #124]
	ldr	r2, .L53+28
	mvn	r0, r1
	mov	r3, #0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	str	r3, [sp, #540]
	bl	bwassert(PLT)
	ldr	r2, [sp, #128]
	mov	r1, #1
	mvn	r0, r2
	ldr	r2, .L53+32
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	bl	bwassert(PLT)
	ldr	r3, [sp, #132]
	ldr	r2, .L53+36
	mvn	r0, r3
	ldr	r4, .L53+40
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r7, .L53+44
	mvn	r3, #0
	str	r4, [sp, #24]
	ldr	ip, .L53+48
	ldr	lr, .L53+52
	add	r1, sp, #460
	add	r2, sp, #544
	add	r4, sp, #524
	str	r3, [sp, #536]
	add	r0, sp, #536
	add	r1, r1, #2
	add	r2, r2, #2
	add	r3, sp, #544
	add	r4, r4, #2
	str	r7, [sp, #20]
	str	ip, [sp, #36]
	str	lr, [sp, #32]
	str	r0, [sp, #16]
	stmib	sp, {r1, r2, r3}	@ phole stm
	str	r4, [sp, #28]
.L46:
	mov	r2, #64
	bl	Receive(PLT)
	ldr	r7, [sp, #24]
	mov	r4, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r7
	bl	bwassert(PLT)
	ldrb	r3, [sp, #462]	@ zero_extendqisi2
	sub	r3, r3, #10
	cmp	r3, #27
	addls	pc, pc, r3, asl #2
	b	.L5
	.p2align 2
.L13:
	b	.L6
	b	.L7
	b	.L8
	b	.L9
	b	.L9
	b	.L10
	b	.L11
	b	.L5
	b	.L5
	b	.L5
	b	.L5
	b	.L5
	b	.L5
	b	.L5
	b	.L5
	b	.L5
	b	.L5
	b	.L5
	b	.L12
	b	.L5
	b	.L5
	b	.L5
	b	.L5
	b	.L5
	b	.L5
	b	.L5
	b	.L5
	b	.L9
.L6:
	ldrb	r3, [sp, #463]	@ zero_extendqisi2
	add	r0, sp, #548
	add	ip, r0, r3, asl #2
	mov	r4, #0
	str	r4, [ip, #-408]
	mov	r1, r4
	mov	r2, #15
	ldr	r0, [sp, #128]
	bl	Putc(PLT)
	mov	r1, r4
	ldrb	r2, [sp, #463]	@ zero_extendqisi2
	ldr	r0, [sp, #128]
	bl	Putc(PLT)
	mov	r1, r4
	ldrb	r2, [sp, #464]	@ zero_extendqisi2
	ldr	r0, [sp, #128]
	bl	Putc(PLT)
	mov	r1, r4
	ldr	r0, [sp, #128]
	ldrb	r2, [sp, #463]	@ zero_extendqisi2
	bl	Putc(PLT)
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #16]
	b	.L46
.L7:
	ldrb	r2, [sp, #463]	@ zero_extendqisi2
	mov	r1, #0
	ldr	r0, [sp, #128]
	bl	Putc(PLT)
	ldrb	r2, [sp, #464]	@ zero_extendqisi2
	mov	r1, #0
	ldr	r0, [sp, #128]
	bl	Putc(PLT)
	mov	r1, #15
	ldr	r0, [sp, #124]
	bl	Delay(PLT)
	mov	r1, #0
	mov	r2, #32
	ldr	r0, [sp, #128]
	bl	Putc(PLT)
	ldr	lr, [sp, #20]
	ldr	r0, [sp, #536]
	add	r1, sl, lr
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #16]
	b	.L46
.L8:
	ldrb	r3, [sp, #463]	@ zero_extendqisi2
	add	r0, sp, #548
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-408]
	cmp	r1, #1
	beq	.L48
	ldr	r3, [sp, #20]
	mov	r2, #2
	add	r1, sl, r3
	ldr	r0, [sp, #536]
	bl	Reply(PLT)
	mov	r1, #0
	mov	r2, r1
	ldr	r0, [sp, #128]
	bl	Putc(PLT)
	ldrb	r2, [sp, #463]	@ zero_extendqisi2
	mov	r1, #0
	ldr	r0, [sp, #128]
	bl	Putc(PLT)
	ldr	r0, [sp, #124]
	bl	Time(PLT)
	ldrb	r2, [sp, #464]	@ zero_extendqisi2
	ldrb	r4, [sp, #463]	@ zero_extendqisi2
	add	r3, r2, r2, asl #3
	add	r3, r2, r3, asl #1
	add	r0, r0, r3
	add	fp, r0, #268
	sub	r3, r4, #58
	str	r4, [sp, #136]
	strb	r2, [sp, #527]
	add	fp, fp, #2
	strb	r4, [sp, #526]
	cmp	r3, #18
	addls	pc, pc, r3, asl #2
	b	.L16
	.p2align 2
.L21:
	b	.L17
	b	.L16
	b	.L16
	b	.L16
	b	.L16
	b	.L16
	b	.L16
	b	.L16
	b	.L16
	b	.L16
	b	.L16
	b	.L18
	b	.L19
	b	.L16
	b	.L16
	b	.L16
	b	.L16
	b	.L16
	b	.L20
.L10:
	mov	r1, #0
	mov	r2, #133
	ldr	r0, [sp, #128]
	bl	Putc(PLT)
	ldr	r4, [sp, #20]
	ldr	r0, [sp, #536]
	add	r1, sl, r4
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #16]
	b	.L46
.L11:
	ldr	r3, [sp, #536]
	ldr	r1, [sp, #108]
	cmp	r1, r3
	beq	.L49
	ldr	r2, [sp, #120]
	cmp	r2, r3
	beq	.L50
	ldr	r4, [sp, #116]
	cmp	r4, r3
	beq	.L51
	ldr	r7, [sp, #112]
	cmp	r7, r3
	beq	.L52
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #16]
	b	.L46
.L12:
	mov	r4, #2
	mov	ip, #28
	mov	r5, #0
	ldr	r1, [sp, #8]
	mov	r2, r4
	ldr	r3, [sp, #12]
	ldr	r0, [sp, #132]
	strb	ip, [sp, #546]
	strb	r5, [sp, #547]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldrb	ip, [sp, #462]	@ zero_extendqisi2
	ldr	r3, [sp, #12]
	ldr	r1, [sp, #8]
	mov	r2, r4
	ldr	r0, [sp, #128]
	strb	ip, [sp, #546]
	strb	r5, [sp, #547]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #20]
	mov	r2, r4
	add	r1, sl, ip
	ldr	r0, [sp, #536]
	bl	Reply(PLT)
	bl	Exit(PLT)
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #16]
	b	.L46
.L5:
	ldr	r7, [sp, #36]
	ldr	r0, [sp, #536]
	add	r1, sl, r7
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #16]
	b	.L46
.L9:
	ldrb	r3, [sp, #464]	@ zero_extendqisi2
	add	ip, sp, #548
	add	r2, ip, r3, asl #2
	ldr	r1, [r2, #-408]
	cmp	r1, #0
	bne	.L30
	mov	r3, #1
	str	r3, [sp, #540]
	ldr	r2, [sp, #540]
	sub	r4, r4, #1
	cmp	r4, r2
	ble	.L32
.L38:
	ldr	r2, [sp, #540]
	add	lr, sp, #548
	add	r3, lr, r2
	ldrb	r2, [r3, #-86]	@ zero_extendqisi2
	ldr	r0, [sp, #128]
	mov	r1, #0
	bl	Putc(PLT)
	ldr	r3, [sp, #540]
	add	r3, r3, #1
	str	r3, [sp, #540]
	ldr	r2, [sp, #540]
	cmp	r2, r4
	blt	.L38
.L32:
	ldr	r0, [sp, #536]
	ldr	r2, [sp, #20]
.L45:
	add	r1, sl, r2
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #16]
	b	.L46
.L17:
	ldr	lr, [sp, #108]
	str	lr, [sp, #104]
.L22:
	ldr	r3, .L53+56
	ldr	r1, .L53+60
	smull	r2, ip, r3, fp
	ldr	r2, .L53+64
	smull	r3, lr, r2, fp
	ldr	r3, .L53+68
	ldr	r2, .L53+72
	smull	r7, r4, r3, fp
	smull	r3, r0, r2, fp
	ldr	r3, .L53+76
	str	r0, [sp, #68]
	smull	r0, r7, r3, fp
	ldr	r2, .L53+80
	str	r7, [sp, #52]
	smull	r7, r6, r1, fp
	smull	r3, r0, r2, fp
	mov	r3, fp, asr #31
	rsb	ip, r3, ip, asr #22
	rsb	lr, r3, lr, asr #18
	str	ip, [sp, #100]
	str	lr, [sp, #92]
	ldr	ip, [sp, #68]
	ldr	lr, [sp, #52]
	rsb	r6, r3, r6, asr #2
	rsb	lr, r3, lr, asr #6
	rsb	r4, r3, r4, asr #13
	rsb	ip, r3, ip, asr #12
	rsb	r3, r3, r0, asr #5
	smull	r2, r0, r1, r6
	str	r4, [sp, #84]
	ldr	r2, [sp, #84]
	ldr	r4, [sp, #100]
	str	ip, [sp, #72]
	smull	r7, r8, r1, r4
	str	r0, [sp, #40]
	ldr	ip, [sp, #92]
	smull	r4, r0, r1, r2
	str	lr, [sp, #56]
	smull	lr, r7, r1, ip
	ldr	lr, [sp, #72]
	str	r0, [sp, #80]
	smull	r0, ip, r1, lr
	ldr	r4, [sp, #56]
	str	ip, [sp, #64]
	smull	ip, r2, r1, r4
	smull	r0, lr, r1, r3
	ldr	r4, [sp, #92]
	ldr	r1, [sp, #100]
	str	r2, [sp, #48]
	ldr	ip, [sp, #84]
	mov	r2, r1, asr #31
	mov	r1, r4, asr #31
	rsb	r1, r1, r7, asr #2
	ldr	r7, [sp, #80]
	str	lr, [sp, #44]
	mov	r0, ip, asr #31
	ldr	lr, [sp, #72]
	rsb	r0, r0, r7, asr #2
	ldr	r7, [sp, #64]
	ldr	r4, [sp, #56]
	mov	ip, lr, asr #31
	rsb	ip, ip, r7, asr #2
	ldr	r7, [sp, #48]
	mov	lr, r4, asr #31
	rsb	lr, lr, r7, asr #2
	ldr	r7, [sp, #44]
	mov	r4, r3, asr #31
	rsb	r4, r4, r7, asr #2
	ldr	r7, [sp, #40]
	mov	r5, r6, asr #31
	rsb	r5, r5, r7, asr #2
	rsb	r2, r2, r8, asr #2
	ldr	r7, [sp, #100]
	add	r2, r2, r2, asl #2
	sub	r2, r7, r2, asl #1
	str	r2, [sp, #96]
	ldr	r7, [sp, #84]
	ldr	r2, [sp, #92]
	add	r1, r1, r1, asl #2
	add	r0, r0, r0, asl #2
	sub	r1, r2, r1, asl #1
	sub	r0, r7, r0, asl #1
	add	r4, r4, r4, asl #2
	str	r1, [sp, #88]
	str	r0, [sp, #76]
	ldr	r0, [sp, #72]
	sub	r3, r3, r4, asl #1
	add	ip, ip, ip, asl #2
	ldr	r4, [sp, #136]
	sub	ip, r0, ip, asl #1
	add	r2, sp, #548
	str	ip, [sp, #60]
	add	ip, r2, r4, asl #2
	mov	r4, #1
	ldr	r7, [sp, #96]
	str	r4, [ip, #-408]
	ldr	ip, [sp, #88]
	ldr	r1, [sp, #56]
	add	r9, r6, r6, asl #2
	strb	r7, [sp, #528]
	strb	ip, [sp, #529]
	ldr	r7, [sp, #76]
	ldr	ip, [sp, #60]
	add	lr, lr, lr, asl #2
	add	r5, r5, r5, asl #2
	sub	lr, r1, lr, asl #1
	mov	r2, #10
	ldr	r1, [sp, #28]
	strb	r3, [sp, #533]
	sub	fp, fp, r9, asl #1
	mov	r3, #0
	sub	r6, r6, r5, asl #1
	ldr	r0, [sp, #104]
	strb	ip, [sp, #531]
	strb	lr, [sp, #532]
	strb	r3, [sp, #536]
	strb	r7, [sp, #530]
	strb	r6, [sp, #534]
	strb	fp, [sp, #535]
	bl	Reply(PLT)
	ldr	lr, [sp, #32]
	mov	r3, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, r4
	add	r2, sl, lr
	bl	bwassert(PLT)
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #16]
	b	.L46
.L18:
	ldr	r0, [sp, #120]
	str	r0, [sp, #104]
	b	.L22
.L19:
	ldr	r1, [sp, #116]
	str	r1, [sp, #104]
	b	.L22
.L16:
	mvn	ip, #0
	str	ip, [sp, #104]
	b	.L22
.L20:
	ldr	r7, [sp, #112]
	str	r7, [sp, #104]
	b	.L22
.L30:
	ldr	r3, [sp, #36]
	ldr	r0, [sp, #536]
	add	r1, sl, r3
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #16]
	b	.L46
.L48:
	ldr	r0, [sp, #536]
	ldr	r2, [sp, #36]
	b	.L45
.L49:
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #16]
	mov	r3, #0
	str	r3, [sp, #372]
	b	.L46
.L50:
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #16]
	mov	r3, #0
	str	r3, [sp, #416]
	b	.L46
.L51:
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #16]
	mov	r3, #0
	str	r3, [sp, #420]
	b	.L46
.L52:
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #16]
	mov	r3, #0
	str	r3, [sp, #444]
	b	.L46
.L54:
	.align	2
.L53:
	.word	_GLOBAL_OFFSET_TABLE_-(.L44+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	commandReverseDelayServer(GOT)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	1801439851
	.word	1717986919
	.word	1125899907
	.word	351843721
	.word	1759218605
	.word	274877907
	.word	1374389535
	.size	commandServer, .-commandServer
	.section	.rodata.str1.4
	.align	2
.LC12:
	.ascii	"<commandReverseDelayServer>: clockServer has not be"
	.ascii	"en set up.\015\012\000"
	.align	2
.LC13:
	.ascii	"<commandReverseDelayServer>: Error sending message "
	.ascii	"to CommandServer (init).\015\012\000"
	.align	2
.LC14:
	.ascii	"<commandReverseDelayServer>: Error sending message "
	.ascii	"to CommandServer (delay).\015\012\000"
	.text
	.align	2
	.global	commandReverseDelayServer
	.type	commandReverseDelayServer, %function
commandReverseDelayServer:
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L59
	ldr	r0, .L59+4
	sub	sp, sp, #84
.L58:
	add	sl, pc, sl
	add	r3, sp, #10
	add	r0, sl, r0
	str	r3, [sp, #4]
	bl	WhoIs(PLT)
	ldr	r2, .L59+8
	mov	r8, r0
	mvn	r0, r0
	add	r2, sl, r2
	mov	r1, #1
	mov	r0, r0, lsr #31
	bl	bwassert(PLT)
	bl	MyParentTid(PLT)
	add	fp, sp, #74
	mov	ip, #16
	ldr	r1, [sp, #4]
	mov	r2, #1
	mov	r3, fp
	mov	r4, #10
	strb	ip, [sp, #10]
	mov	r7, r0
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L59+12
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r9, .L59+16
.L56:
	ldrb	ip, [sp, #76]	@ zero_extendqisi2
	ldrb	r1, [sp, #77]	@ zero_extendqisi2
	ldrb	r2, [sp, #78]	@ zero_extendqisi2
	rsb	r3, ip, ip, asl #5
	rsb	r0, r1, r1, asl #5
	ldrb	lr, [sp, #79]	@ zero_extendqisi2
	rsb	r3, r3, r3, asl #6
	rsb	r0, r0, r0, asl #6
	rsb	r4, r2, r2, asl #5
	add	ip, ip, r3, asl #3
	add	r1, r1, r0, asl #3
	add	r2, r2, r4, asl #2
	ldrb	r0, [sp, #80]	@ zero_extendqisi2
	add	ip, ip, ip, asl #2
	rsb	r3, lr, lr, asl #5
	mov	r1, r1, asl #6
	add	r2, r2, r2, asl #2
	add	r1, r1, ip, asl #7
	add	lr, lr, r3, asl #2
	add	r2, r2, r2, asl #2
	ldrb	r3, [sp, #81]	@ zero_extendqisi2
	add	lr, lr, lr, asl #2
	add	r1, r1, r2, asl #5
	rsb	r2, r0, r0, asl #5
	add	r1, r1, lr, asl #4
	add	r0, r0, r2, asl #2
	add	r3, r3, r3, asl #2
	ldrb	r2, [sp, #82]	@ zero_extendqisi2
	add	r1, r1, r0, asl #3
	add	r3, r3, r3, asl #2
	add	r2, r2, r2, asl #2
	add	r1, r1, r3, asl #2
	ldrb	r3, [sp, #83]	@ zero_extendqisi2
	add	r1, r1, r2, asl #1
	add	r1, r1, r3
	ldrb	r5, [sp, #74]	@ zero_extendqisi2
	ldrb	r6, [sp, #75]	@ zero_extendqisi2
	mov	r0, r8
	bl	DelayUntil(PLT)
	mov	r4, #10
	ldr	r1, [sp, #4]
	mov	ip, #0
	mov	r0, r7
	mov	r2, #4
	mov	r3, fp
	strb	r5, [sp, #11]
	strb	r6, [sp, #12]
	strb	ip, [sp, #13]
	str	r4, [sp, #0]
	strb	r4, [sp, #10]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r9
	bl	bwassert(PLT)
	b	.L56
.L60:
	.align	2
.L59:
	.word	_GLOBAL_OFFSET_TABLE_-(.L58+8)
	.word	.LC2(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.size	commandReverseDelayServer, .-commandReverseDelayServer
	.ident	"GCC: (GNU) 4.0.2"
