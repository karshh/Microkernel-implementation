	.file	"ioserver.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"1\000"
	.align	2
.LC1:
	.ascii	"<UART1Send_Notifier>: Error with send.\015\012\000"
	.text
	.align	2
	.global	UART1Send_Notifier
	.type	UART1Send_Notifier, %function
UART1Send_Notifier:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L7
	sub	sp, sp, #8
.L4:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	ldr	r7, .L7+4
	add	r6, sp, #5
	mov	ip, #3
	add	r1, sl, r7
	mov	r2, #2
	mov	r3, r6
	mov	r4, r0
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r5, .L7+8
.L5:
	mvn	r0, r0
	mov	r1, #1
	add	r2, sl, r5
	mov	r0, r0, lsr #31
	bl	bwassert(PLT)
	ldrb	r2, [sp, #5]	@ zero_extendqisi2
	ldr	r3, .L7+12
	mov	r0, #1
	str	r2, [r3, #0]
	bl	AwaitEvent(PLT)
	mov	ip, #3
	add	r1, sl, r7
	mov	r0, r4
	mov	r2, #2
	mov	r3, r6
	str	ip, [sp, #0]
	bl	Send(PLT)
	b	.L5
.L8:
	.align	2
.L7:
	.word	_GLOBAL_OFFSET_TABLE_-(.L4+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	-2138308608
	.size	UART1Send_Notifier, .-UART1Send_Notifier
	.align	2
	.global	UART1Receive_Notifier
	.type	UART1Receive_Notifier, %function
UART1Receive_Notifier:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #12
	bl	MyParentTid(PLT)
	add	r7, sp, #9
	mov	r5, r0
	add	r6, sp, #6
.L18:
	mov	r0, #2
	bl	AwaitEvent(PLT)
	ldr	r3, .L19
	mov	ip, #0
	ldr	lr, [r3, #0]
	mov	r1, r7
	mov	r2, #2
	mov	r3, r6
	mov	r0, r5
	mov	r4, #3
	strb	lr, [sp, #9]
	strb	ip, [sp, #10]
	str	r4, [sp, #0]
	bl	Send(PLT)
	cmp	r0, #0
	bne	.L18
	bl	Exit(PLT)
	b	.L18
.L20:
	.align	2
.L19:
	.word	-2138308608
	.size	UART1Receive_Notifier, .-UART1Receive_Notifier
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"<UART2Send_Notifier>: Error with send.\015\012\000"
	.text
	.align	2
	.global	UART2Send_Notifier
	.type	UART2Send_Notifier, %function
UART2Send_Notifier:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L32
	sub	sp, sp, #8
.L30:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	ldr	r7, .L32+4
	add	r6, sp, #5
	mov	ip, #3
	add	r1, sl, r7
	mov	r2, #2
	mov	r3, r6
	mov	r5, r0
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r8, .L32+8
.L31:
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	bl	bwassert(PLT)
.L29:
	mov	r0, #3
	bl	AwaitEvent(PLT)
	ldr	ip, .L32+12
	add	r1, sl, r7
	ldr	lr, [ip, #0]
	mov	r0, r5
	tst	lr, #128
	mov	r2, #2
	mov	r3, r6
	beq	.L29
	ldrb	lr, [sp, #5]	@ zero_extendqisi2
	sub	ip, ip, #24
	str	lr, [ip, #0]
	mov	r4, #3
	str	r4, [sp, #0]
	bl	Send(PLT)
	b	.L31
.L33:
	.align	2
.L32:
	.word	_GLOBAL_OFFSET_TABLE_-(.L30+8)
	.word	.LC0(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	-2138243048
	.size	UART2Send_Notifier, .-UART2Send_Notifier
	.align	2
	.global	UART2Receive_Notifier
	.type	UART2Receive_Notifier, %function
UART2Receive_Notifier:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #12
	bl	MyParentTid(PLT)
	add	r7, sp, #9
	mov	r5, r0
	add	r6, sp, #6
.L44:
	mov	r0, #4
	bl	AwaitEvent(PLT)
	ldr	ip, .L45
	mov	r1, r7
	ldr	lr, [ip, #0]
	mov	r2, #2
	tst	lr, #64
	mov	r3, r6
	mov	r0, r5
	beq	.L44
	sub	ip, ip, #24
	ldr	r4, [ip, #0]
	mov	lr, #0
	mov	ip, #3
	strb	lr, [sp, #10]
	strb	r4, [sp, #9]
	str	ip, [sp, #0]
	bl	Send(PLT)
	cmp	r0, #0
	bne	.L44
	bl	Exit(PLT)
	b	.L44
.L46:
	.align	2
.L45:
	.word	-2138243048
	.size	UART2Receive_Notifier, .-UART2Receive_Notifier
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"UART1S\000"
	.align	2
.LC4:
	.ascii	"Failed to register Uart1SendServer.\015\012\000"
	.align	2
.LC5:
	.ascii	"<UART1SendServer>: Receive error.\015\012\000"
	.align	2
.LC6:
	.ascii	"<UART1SendServer>: Buffer full. Could not add %c[%d"
	.ascii	"]\015\012\000"
	.align	2
.LC7:
	.ascii	"<Uart1SendServer>: Illegal request code from userTa"
	.ascii	"sk <%d>.\015\012\000"
	.text
	.align	2
	.global	UART1_SendServer
	.type	UART1_SendServer, %function
UART1_SendServer:
	@ args = 0, pretend = 0, frame = 102460
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L75
	ldr	r0, .L75+4
.L69:
	add	sl, pc, sl
	sub	sp, sp, #102400
	sub	sp, sp, #64
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L75+8
	add	r8, sp, #64
	add	r2, sl, r2
	mov	r1, #1
	rsbs	r0, r0, #1
	movcc	r0, #0
	sub	r8, r8, #48
	bl	bwassert(PLT)
	mov	r0, r8
	bl	circularBufferInitB(PLT)
	ldr	r3, .L75+12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L75+16
	add	ip, sp, #102400
	mvn	r1, #0
	mov	r2, #0
	str	r3, [sp, #12]
	mov	r3, #1
	str	r0, [ip, #56]
	str	r1, [ip, #40]
	str	r2, [ip, #52]
	add	lr, sp, #102400
	str	r3, [ip, #48]
	str	r1, [ip, #44]
	add	r1, sp, #102400
	add	r5, sp, #102400
	add	r6, sp, #102400
	add	lr, lr, #63
	add	r1, r1, #34
	ldr	r7, .L75+20
	ldr	r9, .L75+24
	ldr	fp, .L75+28
	strb	r2, [ip, #63]
	add	r5, r5, #40
	add	r6, r6, #27
	stmib	sp, {r1, lr}	@ phole stm
.L70:
	mov	r1, r6
	mov	r2, #7
	mov	r0, r5
	bl	Receive(PLT)
	mvn	r0, r0
	add	r2, sl, r7
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	add	r3, sp, #102400
	ldr	r2, [r3, #40]
	ldr	r3, [r3, #56]
	cmp	r2, r3
	beq	.L71
	add	ip, sp, #102400
	ldrb	r3, [ip, #27]	@ zero_extendqisi2
	cmp	r3, #11
	beq	.L56
	cmp	r3, #28
	beq	.L72
	mov	r3, r2
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, fp
	bl	bwassert(PLT)
	b	.L70
.L72:
	sub	r3, r3, #28
	str	r2, [ip, #44]
	str	r3, [ip, #48]
	ldr	r2, [ip, #52]
	cmp	r2, r3
	beq	.L56
	ldr	r0, [ip, #44]
	add	r1, sl, r9
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
.L56:
	add	lr, sp, #102400
	ldr	r3, [lr, #48]
	cmp	r3, #0
	beq	.L70
	mov	r1, r8
	ldrb	r0, [lr, #28]	@ zero_extendqisi2
	bl	addToBufferB(PLT)
	add	r1, sp, #102400
	ldrb	ip, [r1, #28]	@ zero_extendqisi2
	ldr	lr, [sp, #12]
	mov	r1, #1
	mov	r3, ip
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	add	r1, sp, #102400
	ldr	r3, [r1, #52]
	cmp	r3, #0
	bne	.L73
.L60:
	add	r1, sp, #102400
	ldr	r0, [r1, #40]
	mov	r2, #2
	add	r1, sl, r9
	bl	Reply(PLT)
	b	.L70
.L71:
	ldr	r0, [sp, #8]
	mov	r1, r8
	bl	getFromBufferB(PLT)
	cmp	r0, #0
	bne	.L74
	mov	r3, #1
	add	r1, sp, #102400
	str	r3, [r1, #52]
	ldr	r2, [r1, #48]
	cmp	r2, r3
	beq	.L53
	ldr	r0, [r1, #44]
	mov	r2, #2
	add	r1, sl, r9
	bl	Reply(PLT)
	bl	Exit(PLT)
.L53:
	mov	r3, #0
	add	r2, sp, #102400
	strb	r3, [r2, #63]
	b	.L70
.L74:
	add	ip, sp, #102400
	ldr	r0, [ip, #56]
	ldrb	ip, [ip, #63]	@ zero_extendqisi2
	add	lr, sp, #102400
	mov	r3, #0
	ldr	r1, [sp, #4]
	mov	r2, #2
	strb	ip, [lr, #34]
	strb	r3, [lr, #35]
	bl	Reply(PLT)
	b	.L53
.L73:
	ldr	r0, [sp, #8]
	mov	r1, r8
	bl	getFromBufferB(PLT)
	cmp	r0, #0
	beq	.L60
	add	r2, sp, #102400
	ldrb	r3, [r2, #63]	@ zero_extendqisi2
	add	ip, sp, #102400
	mov	r4, #0
	ldr	r1, [sp, #4]
	ldr	r0, [r2, #56]
	strb	r3, [ip, #34]
	mov	r2, #2
	strb	r4, [ip, #35]
	bl	Reply(PLT)
	add	lr, sp, #102400
	str	r4, [lr, #52]
	b	.L60
.L76:
	.align	2
.L75:
	.word	_GLOBAL_OFFSET_TABLE_-(.L69+8)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	UART1Send_Notifier(GOT)
	.word	.LC6(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC0(GOTOFF)
	.word	.LC7(GOTOFF)
	.size	UART1_SendServer, .-UART1_SendServer
	.section	.rodata.str1.4
	.align	2
.LC8:
	.ascii	"UART2S\000"
	.align	2
.LC9:
	.ascii	"Failed to register Uart2SendServer.\015\012\000"
	.align	2
.LC10:
	.ascii	"<UART2SendServer>: Receive error.\015\012\000"
	.align	2
.LC11:
	.ascii	"<UART2Server>: Buffer full. Could not add %c[%d]\015"
	.ascii	"\012\000"
	.align	2
.LC12:
	.ascii	"<Uart2SendServer>: Illegal request code from userTa"
	.ascii	"sk <%d>.\015\012\000"
	.text
	.align	2
	.global	UART2_SendServer
	.type	UART2_SendServer, %function
UART2_SendServer:
	@ args = 0, pretend = 0, frame = 102524
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L107
	ldr	r0, .L107+4
.L102:
	add	sl, pc, sl
	sub	sp, sp, #102400
	sub	sp, sp, #128
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L107+8
	add	r5, sp, #128
	add	r2, sl, r2
	mov	r1, #1
	rsbs	r0, r0, #1
	movcc	r0, #0
	sub	r5, r5, #108
	bl	bwassert(PLT)
	mov	r0, r5
	bl	circularBufferInitB(PLT)
	ldr	r3, .L107+12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L107+16
	ldr	ip, .L107+20
	str	r3, [sp, #16]
	ldr	r3, .L107+24
	mvn	r1, #0
	mov	r2, #0
	str	ip, [sp, #4]
	str	r3, [sp, #12]
	add	ip, sp, #102400
	mov	r3, #1
	str	r0, [ip, #120]
	str	r1, [ip, #104]
	str	r2, [ip, #116]
	str	r3, [ip, #112]
	str	r1, [ip, #108]
	add	r1, sp, #102400
	add	fp, sp, #102400
	add	r6, sp, #102400
	add	r7, sp, #102400
	add	r1, r1, #94
	ldr	r9, .L107+28
	strb	r2, [ip, #127]
	add	fp, fp, #104
	add	r6, r6, #28
	add	r7, r7, #127
	str	r1, [sp, #8]
.L103:
	mov	r1, r6
	mov	r2, #66
	mov	r0, fp
	bl	Receive(PLT)
	ldr	r3, [sp, #16]
	mov	r4, r0
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	add	ip, sp, #102400
	ldr	r2, [ip, #104]
	ldr	r3, [ip, #120]
	cmp	r2, r3
	beq	.L104
	add	r1, sp, #102400
	ldrb	r3, [r1, #28]	@ zero_extendqisi2
	cmp	r3, #21
	beq	.L86
	cmp	r3, #28
	beq	.L105
	ldr	ip, [sp, #12]
	mov	r3, r2
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, ip
	bl	bwassert(PLT)
	b	.L103
.L105:
	sub	r3, r3, #28
	str	r2, [r1, #108]
	str	r3, [r1, #112]
	ldr	r2, [r1, #116]
	cmp	r2, r3
	beq	.L86
	ldr	r2, [sp, #4]
	ldr	r0, [r1, #108]
	add	r1, sl, r2
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
.L86:
	add	ip, sp, #102400
	ldr	r3, [ip, #112]
	cmp	r3, #0
	beq	.L103
	mov	r2, #0
	str	r2, [ip, #100]
	ldr	r3, [ip, #100]
	sub	r4, r4, #2
	cmp	r4, r3
	ble	.L90
	mov	r8, r2
	b	.L91
.L92:
	add	r2, sp, #102400
	ldr	r3, [r2, #100]
	add	r3, r3, #1
	str	r3, [r2, #100]
	ldr	r2, [r2, #100]
	cmp	r4, r2
	ble	.L90
.L91:
	add	r1, sp, #102400
	ldr	r3, [r1, #100]
	mov	r1, r5
	add	r3, r6, r3
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	bl	addToBufferB(PLT)
	add	r2, sp, #102400
	ldrb	ip, [r2, #29]	@ zero_extendqisi2
	mov	r1, #1
	mov	r3, ip
	add	r2, sl, r9
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	add	ip, sp, #102400
	ldr	r3, [ip, #116]
	mov	r1, r5
	cmp	r3, #0
	mov	r0, r7
	beq	.L92
	bl	getFromBufferB(PLT)
	cmp	r0, #0
	ldr	r1, [sp, #8]
	mov	r2, #2
	beq	.L92
	add	r3, sp, #102400
	ldr	r0, [r3, #120]
	ldrb	r3, [r3, #127]	@ zero_extendqisi2
	add	ip, sp, #102400
	strb	r3, [ip, #94]
	strb	r8, [ip, #95]
	bl	Reply(PLT)
	add	r1, sp, #102400
	str	r8, [r1, #116]
	add	r2, sp, #102400
	ldr	r3, [r2, #100]
	add	r3, r3, #1
	str	r3, [r2, #100]
	ldr	r2, [r2, #100]
	cmp	r4, r2
	bgt	.L91
.L90:
	ldr	ip, [sp, #4]
	add	r3, sp, #102400
	ldr	r0, [r3, #104]
	add	r1, sl, ip
	mov	r2, #2
	bl	Reply(PLT)
	b	.L103
.L104:
	mov	r0, r7
	mov	r1, r5
	bl	getFromBufferB(PLT)
	cmp	r0, #0
	bne	.L106
	mov	r3, #1
	add	r1, sp, #102400
	str	r3, [r1, #116]
	ldr	r2, [r1, #112]
	cmp	r2, r3
	beq	.L83
	ldr	r2, [sp, #4]
	ldr	r0, [r1, #108]
	add	r1, sl, r2
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
.L83:
	mov	r3, #0
	add	ip, sp, #102400
	strb	r3, [ip, #127]
	b	.L103
.L106:
	add	r1, sp, #102400
	ldrb	ip, [r1, #127]	@ zero_extendqisi2
	add	r3, sp, #102400
	ldr	r0, [r1, #120]
	ldr	r1, [sp, #8]
	strb	ip, [r3, #94]
	mov	r3, #0
	add	ip, sp, #102400
	mov	r2, #2
	strb	r3, [ip, #95]
	bl	Reply(PLT)
	b	.L83
.L108:
	.align	2
.L107:
	.word	_GLOBAL_OFFSET_TABLE_-(.L102+8)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	UART2Send_Notifier(GOT)
	.word	.LC10(GOTOFF)
	.word	.LC0(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC11(GOTOFF)
	.size	UART2_SendServer, .-UART2_SendServer
	.section	.rodata.str1.4
	.align	2
.LC13:
	.ascii	"UART2R\000"
	.align	2
.LC14:
	.ascii	"Failed to register UART2ReceiveServer.\015\012\000"
	.align	2
.LC15:
	.ascii	"<UART2ReceiveServer>: Receive error.\015\012\000"
	.align	2
.LC16:
	.ascii	"<UART2ReceiveServer>: UART2_receiveTIDQ Buffer full"
	.ascii	". Cannot add <%d>.\015\012\000"
	.align	2
.LC17:
	.ascii	"<UART2ReceiveServer>: Illegal request code from use"
	.ascii	"rTask <%d>.\015\012\000"
	.text
	.align	2
	.global	UART2_ReceiveServer
	.type	UART2_ReceiveServer, %function
UART2_ReceiveServer:
	@ args = 0, pretend = 0, frame = 16428
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L130
	ldr	r0, .L130+4
.L125:
	add	sl, pc, sl
	sub	sp, sp, #16384
	sub	sp, sp, #44
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L130+8
	add	r4, sp, #44
	add	r2, sl, r2
	mov	r1, #1
	rsbs	r0, r0, #1
	movcc	r0, #0
	sub	r4, r4, #36
	bl	bwassert(PLT)
	mov	r0, r4
	bl	circularBufferInit(PLT)
	ldr	r3, .L130+12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L130+16
	add	ip, sp, #16384
	str	r2, [sp, #4]
	add	r2, sp, #16384
	mvn	r3, #0
	add	r7, sp, #16384
	add	r6, sp, #16384
	add	r5, sp, #16384
	add	r2, r2, #26
	ldr	r8, .L130+20
	ldr	fp, .L130+24
	ldr	r9, .L130+28
	str	r0, [ip, #40]
	str	r3, [ip, #32]
	str	r3, [ip, #36]
	add	r7, r7, #36
	add	r6, r6, #19
	add	r5, r5, #32
	str	r2, [sp, #0]
.L126:
	mov	r1, r6
	mov	r2, #7
	mov	r0, r7
	bl	Receive(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	bl	bwassert(PLT)
	add	r3, sp, #16384
	ldr	ip, [r3, #36]
	ldr	r3, [r3, #40]
	mov	r1, r4
	cmp	ip, r3
	mov	r0, r5
	beq	.L127
	add	r2, sp, #16384
	ldrb	lr, [r2, #19]	@ zero_extendqisi2
	mov	r0, ip
	cmp	lr, #20
	mov	r1, r4
	beq	.L116
	cmp	lr, #28
	mov	r3, ip
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, r9
	beq	.L128
	bl	bwassert(PLT)
	b	.L126
.L116:
	bl	addToBuffer(PLT)
	ldr	r3, [sp, #4]
	add	ip, sp, #16384
	add	r2, sl, r3
	mov	r1, #1
	ldr	r3, [ip, #36]
	bl	bwassert(PLT)
	b	.L126
.L128:
	mov	r0, ip
	add	r1, sl, fp
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
	b	.L126
.L127:
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	ldr	r1, [sp, #0]
	mov	r2, #2
	bne	.L129
.L113:
	add	r2, sp, #16384
	mvn	r3, #0
	add	ip, sp, #16384
	ldr	r0, [r2, #40]
	add	r1, sl, fp
	mov	r2, #2
	str	r3, [ip, #32]
	bl	Reply(PLT)
	b	.L126
.L129:
	add	r3, sp, #16384
	ldrb	ip, [r3, #19]	@ zero_extendqisi2
	ldr	r0, [r3, #32]
	strb	ip, [r3, #26]
	mov	r3, #0
	add	ip, sp, #16384
	strb	r3, [ip, #27]
	bl	Reply(PLT)
	b	.L113
.L131:
	.align	2
.L130:
	.word	_GLOBAL_OFFSET_TABLE_-(.L125+8)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	UART2Receive_Notifier(GOT)
	.word	.LC16(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC0(GOTOFF)
	.word	.LC17(GOTOFF)
	.size	UART2_ReceiveServer, .-UART2_ReceiveServer
	.section	.rodata.str1.4
	.align	2
.LC18:
	.ascii	"UART1R\000"
	.align	2
.LC19:
	.ascii	"Failed to register UART1ReceiveServer.\015\012\000"
	.align	2
.LC20:
	.ascii	"<UART1ReceiveServer>: Receive error.\015\012\000"
	.align	2
.LC21:
	.ascii	"<UART1ReceiveServer>: UART1_receiveTIDQ Buffer full"
	.ascii	". Cannot add <%d>.\015\012\000"
	.align	2
.LC22:
	.ascii	"<UART1ReceiveServer>: Illegal request code from use"
	.ascii	"rTask <%d> :%d.\015\012\000"
	.text
	.align	2
	.global	UART1_ReceiveServer
	.type	UART1_ReceiveServer, %function
UART1_ReceiveServer:
	@ args = 0, pretend = 0, frame = 16428
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L153
	ldr	r0, .L153+4
.L148:
	add	sl, pc, sl
	sub	sp, sp, #16384
	sub	sp, sp, #48
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L153+8
	add	r4, sp, #48
	add	r2, sl, r2
	mov	r1, #1
	rsbs	r0, r0, #1
	movcc	r0, #0
	sub	r4, r4, #36
	bl	bwassert(PLT)
	mov	r0, r4
	bl	circularBufferInit(PLT)
	ldr	r3, .L153+12
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r2, .L153+16
	add	ip, sp, #16384
	str	r2, [sp, #8]
	add	r2, sp, #16384
	mvn	r3, #0
	add	r7, sp, #16384
	add	r6, sp, #16384
	add	r5, sp, #16384
	add	r2, r2, #30
	ldr	r8, .L153+20
	ldr	fp, .L153+24
	ldr	r9, .L153+28
	str	r0, [ip, #44]
	str	r3, [ip, #36]
	str	r3, [ip, #40]
	add	r7, r7, #40
	add	r6, r6, #23
	add	r5, r5, #36
	str	r2, [sp, #4]
.L149:
	mov	r1, r6
	mov	r2, #7
	mov	r0, r7
	bl	Receive(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	bl	bwassert(PLT)
	add	r3, sp, #16384
	ldr	lr, [r3, #40]
	ldr	r3, [r3, #44]
	mov	r1, r4
	cmp	lr, r3
	mov	r0, r5
	beq	.L150
	add	r2, sp, #16384
	ldrb	ip, [r2, #23]	@ zero_extendqisi2
	mov	r0, lr
	cmp	ip, #10
	mov	r1, r4
	beq	.L139
	cmp	ip, #28
	mov	r3, lr
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, r9
	beq	.L151
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	b	.L149
.L139:
	bl	addToBuffer(PLT)
	ldr	r3, [sp, #8]
	add	ip, sp, #16384
	add	r2, sl, r3
	mov	r1, #1
	ldr	r3, [ip, #40]
	bl	bwassert(PLT)
	b	.L149
.L151:
	mov	r0, lr
	add	r1, sl, fp
	mov	r2, #2
	bl	Reply(PLT)
	bl	Exit(PLT)
	b	.L149
.L150:
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	ldr	r1, [sp, #4]
	mov	r2, #2
	bne	.L152
.L136:
	add	r2, sp, #16384
	mvn	r3, #0
	add	ip, sp, #16384
	ldr	r0, [r2, #44]
	add	r1, sl, fp
	mov	r2, #2
	str	r3, [ip, #36]
	bl	Reply(PLT)
	b	.L149
.L152:
	add	r3, sp, #16384
	ldrb	ip, [r3, #23]	@ zero_extendqisi2
	ldr	r0, [r3, #36]
	strb	ip, [r3, #30]
	mov	r3, #0
	add	ip, sp, #16384
	strb	r3, [ip, #31]
	bl	Reply(PLT)
	b	.L136
.L154:
	.align	2
.L153:
	.word	_GLOBAL_OFFSET_TABLE_-(.L148+8)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	UART1Receive_Notifier(GOT)
	.word	.LC21(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC0(GOTOFF)
	.word	.LC22(GOTOFF)
	.size	UART1_ReceiveServer, .-UART1_ReceiveServer
	.ident	"GCC: (GNU) 4.0.2"
