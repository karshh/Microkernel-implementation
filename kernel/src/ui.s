	.file	"ui.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"UART2S\000"
	.align	2
.LC1:
	.ascii	"<displayGrid>: IOServer has not been set up.\015\012"
	.ascii	"\000"
	.align	2
.LC2:
	.ascii	"\033[2J\000"
	.align	2
.LC3:
	.ascii	"\033[2;1H\000"
	.align	2
.LC4:
	.ascii	"_\000"
	.align	2
.LC5:
	.ascii	"\033[5;1H\000"
	.align	2
.LC6:
	.ascii	"=\000"
	.align	2
.LC7:
	.ascii	"\033[28;1H\000"
	.align	2
.LC8:
	.ascii	"\033[%d;1H|\000"
	.align	2
.LC9:
	.ascii	"\033[%d;12H|\000"
	.align	2
.LC10:
	.ascii	"\033[%d;24H|\000"
	.align	2
.LC11:
	.ascii	"\033[%d;84H|\000"
	.align	2
.LC12:
	.ascii	"\033[%d;134H|\000"
	.align	2
.LC13:
	.ascii	"\033[3;4HSwitch\033[4;3HPosition\000"
	.align	2
.LC14:
	.ascii	"\033[%d;2H00%d\000"
	.align	2
.LC15:
	.ascii	"\033[%d;2H0%d\000"
	.align	2
.LC16:
	.ascii	"\033[%d;2H%d\000"
	.align	2
.LC17:
	.ascii	"\033[3;15HSensor\033[4;14HTriggers\000"
	.align	2
.LC18:
	.ascii	"\033[4;86HCOMMANDS:\000"
	.align	2
.LC19:
	.ascii	"\033[6;86Htr A B\000"
	.align	2
.LC20:
	.ascii	"\033[7;86H   Sets train A's speed to B.\000"
	.align	2
.LC21:
	.ascii	"\033[8;86Hrv A\000"
	.align	2
.LC22:
	.ascii	"\033[9;86H   Reverses train A.\000"
	.align	2
.LC23:
	.ascii	"\033[10;86Hsw X Y\000"
	.align	2
.LC24:
	.ascii	"\033[11;86H   Sets switch X to Y.\000"
	.align	2
.LC25:
	.ascii	"\033[12;86Hq\000"
	.align	2
.LC26:
	.ascii	"\033[13;86H   Quits the program.\000"
	.align	2
.LC27:
	.ascii	"\033[15;86HNote constraints:\000"
	.align	2
.LC28:
	.ascii	"\033[17;86H    1 <= A <= 80\000"
	.align	2
.LC29:
	.ascii	"\033[18;86H    0 <= B <= 14\000"
	.align	2
.LC30:
	.ascii	"\033[19;86H    1 <= X <= 18 || 153 <= X <= 156\000"
	.align	2
.LC31:
	.ascii	"\033[20;86H    Y = 'C' for curved, 'S' for straight"
	.ascii	"\000"
	.align	2
.LC32:
	.ascii	"\033[1;63HIdle:\000"
	.align	2
.LC33:
	.ascii	"\033[1;120HTime:\000"
	.align	2
.LC34:
	.ascii	"\033[6;13H-->\000"
	.align	2
.LC35:
	.ascii	"\033[6;21H<--\000"
	.align	2
.LC36:
	.ascii	"\033[34;1H>\000"
	.text
	.align	2
	.global	displayGrid
	.type	displayGrid, %function
displayGrid:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L33
	ldr	r0, .L33+4
.L24:
	add	sl, pc, sl
	sub	sp, sp, #12
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L33+8
	mov	r4, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r2, .L33+12
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+16
	mov	r3, #2
	add	r2, sl, r2
	mov	r0, r4
	mov	r1, #1
	str	r3, [sp, #8]
	bl	Printf(PLT)
	ldr	r3, [sp, #8]
	cmp	r3, #135
	ble	.L26
.L2:
	ldr	r2, .L33+20
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	mov	r3, #5
	str	r3, [sp, #8]
	ldr	r2, [sp, #8]
	cmp	r2, #28
	ble	.L27
.L4:
	ldr	r2, .L33+24
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	mov	r3, #5
	str	r3, [sp, #8]
	ldr	r2, [sp, #8]
	cmp	r2, #138
	ble	.L28
.L6:
	mov	r3, #3
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r2, #28
	ble	.L29
.L8:
	bl	displayTrack(PLT)
	ldr	r2, .L33+28
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	mov	r3, #4
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r2, #12
	ble	.L30
.L10:
	ldr	r3, [sp, #4]
	cmp	r3, #21
	ble	.L31
.L12:
	ldr	r3, [sp, #4]
	cmp	r3, #25
	ble	.L32
.L14:
	ldr	r2, .L33+32
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+36
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+40
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+44
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+48
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+52
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+56
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+60
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+64
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+68
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+72
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+76
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+80
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+84
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+88
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+92
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+96
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+100
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+104
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+108
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	b	Printf(PLT)
.L26:
	ldr	r5, .L33+112
.L3:
	add	r2, sl, r5
	mov	r0, r4
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r3, [sp, #8]
	add	r3, r3, #1
	str	r3, [sp, #8]
	ldr	r2, [sp, #8]
	cmp	r2, #135
	ble	.L3
	b	.L2
.L32:
	ldr	r5, .L33+116
.L15:
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #2
	add	ip, ip, #131
	add	r2, sl, r5
	mov	r0, r4
	mov	r1, #1
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r2, #25
	ble	.L15
	b	.L14
.L31:
	ldr	r5, .L33+120
.L13:
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #2
	sub	ip, ip, #3
	add	r2, sl, r5
	mov	r0, r4
	mov	r1, #1
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r2, #21
	ble	.L13
	b	.L12
.L30:
	ldr	r5, .L33+124
.L11:
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #2
	sub	ip, ip, #3
	add	r2, sl, r5
	mov	r0, r4
	mov	r1, #1
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r2, #12
	ble	.L11
	b	.L10
.L29:
	ldr	r9, .L33+128
	ldr	r8, .L33+132
	ldr	r7, .L33+136
	ldr	r6, .L33+140
	ldr	r5, .L33+144
.L9:
	ldr	r3, [sp, #4]
	mov	r0, r4
	mov	r1, #1
	add	r2, sl, r9
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	mov	r0, r4
	mov	r1, #1
	add	r2, sl, r8
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	mov	r0, r4
	mov	r1, #1
	add	r2, sl, r7
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	mov	r0, r4
	mov	r1, #1
	add	r2, sl, r6
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	add	r2, sl, r5
	mov	r0, r4
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r2, #28
	ble	.L9
	b	.L8
.L28:
	ldr	r5, .L33+112
.L7:
	add	r2, sl, r5
	mov	r0, r4
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r3, [sp, #8]
	add	r3, r3, #1
	str	r3, [sp, #8]
	ldr	r2, [sp, #8]
	cmp	r2, #138
	ble	.L7
	b	.L6
.L27:
	ldr	r5, .L33+148
.L5:
	add	r2, sl, r5
	mov	r0, r4
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r3, [sp, #8]
	add	r3, r3, #1
	str	r3, [sp, #8]
	ldr	r2, [sp, #8]
	cmp	r2, #28
	ble	.L5
	b	.L4
.L34:
	.align	2
.L33:
	.word	_GLOBAL_OFFSET_TABLE_-(.L24+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	.LC35(GOTOFF)
	.word	.LC36(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC6(GOTOFF)
	.size	displayGrid, .-displayGrid
	.section	.rodata.str1.4
	.align	2
.LC37:
	.ascii	"UART1R\000"
	.align	2
.LC38:
	.ascii	"<UserPrompt>: UART1ReceiveServer has not been set u"
	.ascii	"p.\015\012\000"
	.align	2
.LC39:
	.ascii	"commandServer\000"
	.align	2
.LC40:
	.ascii	"<getSensorData>: Polling sensors failed.\000"
	.text
	.align	2
	.global	getSensorData
	.type	getSensorData, %function
getSensorData:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L74
	mov	r6, r0
	ldr	r0, .L74+4
.L73:
	add	sl, pc, sl
	sub	sp, sp, #12
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L74+8
	mov	r7, r0
	mvn	r0, r0
	add	r2, sl, r2
	mov	r1, #1
	mov	r0, r0, lsr #31
	bl	bwassert(PLT)
	ldr	r0, .L74+12
	mov	r4, #3
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	r5, #0
	mov	r2, r4
	mov	ip, #80
	mvn	lr, #122
	add	r1, sp, #7
	add	r3, sp, #4
	strb	ip, [sp, #7]
	strb	lr, [sp, #8]
	str	r4, [sp, #0]
	strb	r5, [sp, #9]
	bl	Send(PLT)
	ldr	r2, .L74+16
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	add	r4, r4, #13
.L36:
	mov	r1, #0
	mov	r0, r7
	bl	Getc(PLT)
	mov	r1, #0
	mov	r3, r0
	mov	r0, r7
	strb	r3, [sp, #11]
	bl	Getc(PLT)
	strb	r0, [sp, #10]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	tst	r3, #128
	subne	r3, r4, #15
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #64
	subne	r3, r4, #14
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #32
	subne	r3, r4, #13
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #16
	subne	r3, r4, #12
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #8
	subne	r3, r4, #11
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #4
	subne	r3, r4, #10
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #2
	subne	r3, r4, #9
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #1
	subne	r3, r4, #8
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #128
	subne	r3, r4, #7
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #64
	subne	r3, r4, #6
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #32
	subne	r3, r4, #5
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #16
	subne	r3, r4, #4
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #8
	subne	r3, r4, #3
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #4
	subne	r3, r4, #2
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #2
	subne	r3, r4, #1
	strneb	r3, [r6, r5]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r5, r5, #1
	tst	r3, #1
	add	r3, r4, #16
	strneb	r4, [r5, r6]
	and	r4, r3, #255
	addne	r5, r5, #1
	cmp	r4, #96
	bne	.L36
	mov	r0, r5
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L75:
	.align	2
.L74:
	.word	_GLOBAL_OFFSET_TABLE_-(.L73+8)
	.word	.LC37(GOTOFF)
	.word	.LC38(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.size	getSensorData, .-getSensorData
	.section	.rodata.str1.4
	.align	2
.LC41:
	.ascii	"<displaySensors>: Displaying sensors failed.\000"
	.text
	.align	2
	.global	displaySensors
	.type	displaySensors, %function
displaySensors:
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L93
	sub	sp, sp, #76
.L90:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r2, #0
	str	r2, [sp, #68]
	ldr	r3, [sp, #68]
	mov	r5, r0
	cmp	r3, #63
	bgt	.L82
	mov	r0, r2
.L78:
	ldr	r2, [sp, #68]
	ldr	r3, [sp, #68]
	add	ip, sp, #76
	add	r3, r3, #1
	str	r3, [sp, #68]
	add	r1, ip, r2
	ldr	r2, [sp, #68]
	strb	r0, [r1, #-72]
	cmp	r2, #63
	ble	.L78
.L82:
	ldr	r7, .L93+4
	add	r4, sp, #4
	add	r6, sp, #73
.L91:
	mov	r0, r4
	bl	getSensorData(PLT)
	subs	r2, r0, #0
	mov	r1, r4
	mov	r3, r6
	mov	r0, r5
	beq	.L91
.L92:
	mov	ip, #3
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r1, #1
	add	r2, sl, r7
	mov	r0, r0, lsr #31
	bl	bwassert(PLT)
	mov	r0, r4
	bl	getSensorData(PLT)
	subs	r2, r0, #0
	mov	r1, r4
	mov	r3, r6
	mov	r0, r5
	beq	.L91
	b	.L92
.L94:
	.align	2
.L93:
	.word	_GLOBAL_OFFSET_TABLE_-(.L90+8)
	.word	.LC41(GOTOFF)
	.size	displaySensors, .-displaySensors
	.section	.rodata.str1.4
	.align	2
.LC42:
	.ascii	"clockServer\000"
	.align	2
.LC43:
	.ascii	"<UserPrompt>: could not send backspace to server. \015"
	.ascii	"\012\000"
	.text
	.align	2
	.global	displayClock
	.type	displayClock, %function
displayClock:
	@ args = 0, pretend = 0, frame = 52
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L110
	sub	sp, sp, #56
.L107:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	str	r0, [sp, #32]
	ldr	r0, .L110+4
	ldr	r1, .L110+8
	add	r0, sl, r0
	str	r1, [sp, #4]
	bl	WhoIs(PLT)
	mov	r6, #0
	add	r2, sp, #45
	add	r3, sp, #53
	str	r0, [sp, #36]
	str	r6, [sp, #28]
	str	r2, [sp, #12]
	str	r3, [sp, #8]
.L108:
	mov	r1, #10
	ldr	r0, [sp, #36]
	bl	Delay(PLT)
	ldr	r0, [sp, #36]
	bl	Time(PLT)
	ldr	ip, .L110+12
	mov	r2, r0, asr #31
	smull	lr, r3, ip, r0
	rsb	r3, r2, r3, asr #2
	smull	r0, r1, ip, r3
	mov	r5, r3, asr #31
	str	r3, [sp, #40]
	rsb	r1, r5, r1, asr #2
	add	r3, r1, r1, asl #2
	ldr	r1, [sp, #40]
	sub	r3, r1, r3, asl #1
	cmp	r3, #0
	str	r3, [sp, #24]
	beq	.L109
.L97:
	ldr	ip, [sp, #40]
	cmp	r6, ip
	beq	.L108
	ldr	r6, .L110+12
	mov	r0, ip
	smull	r1, ip, r6, r0
	ldr	lr, .L110+16
	rsb	ip, r5, ip, asr #2
	smull	r2, r3, lr, ip
	ldr	r4, .L110+20
	add	r3, r3, ip
	mov	r2, ip, asr #31
	rsb	r8, r2, r3, asr #5
	smull	r3, r0, r4, r8
	mov	r5, r8, asr #31
	rsb	r0, r5, r0, asr #2
	smull	r3, r1, lr, r8
	smull	r3, lr, r4, r0
	mov	r3, r0, asr #31
	rsb	fp, r3, lr, asr #2
	add	r1, r1, r8
	rsb	r9, r5, r1, asr #5
	add	r1, fp, fp, asl #1
	sub	fp, r0, r1, asl #3
	mov	r2, r8
	rsb	lr, r9, r9, asl #4
	rsb	r3, r8, r8, asl #4
	sub	r8, ip, r3, asl #2
	sub	r9, r2, lr, asl #2
	smull	lr, r3, r6, fp
	smull	r0, r2, r6, r9
	smull	ip, r1, r6, r8
	mov	r6, fp, asr #31
	rsb	r6, r6, r3, asr #2
	mov	ip, r9, asr #31
	add	lr, r6, r6, asl #2
	rsb	r2, ip, r2, asr #2
	mov	r0, r8, asr #31
	sub	lr, fp, lr, asl #1
	mov	ip, #18
	rsb	r7, r0, r1, asr #2
	str	r2, [sp, #20]
	strb	ip, [sp, #45]
	strb	lr, [sp, #47]
	sub	ip, ip, #18
	ldr	lr, [sp, #24]
	add	r4, r2, r2, asl #2
	strb	ip, [sp, #53]
	add	r5, r7, r7, asl #2
	ldr	ip, [sp, #20]
	ldr	r1, [sp, #12]
	mov	r2, #9
	ldr	r3, [sp, #8]
	strb	lr, [sp, #52]
	sub	r4, r9, r4, asl #1
	mov	lr, #3
	sub	r5, r8, r5, asl #1
	ldr	r0, [sp, #32]
	str	lr, [sp, #0]
	strb	r6, [sp, #46]
	strb	ip, [sp, #48]
	strb	r4, [sp, #49]
	strb	r5, [sp, #51]
	strb	r7, [sp, #50]
	bl	Send(PLT)
	ldr	lr, [sp, #4]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, lr
	bl	bwassert(PLT)
	ldr	r6, [sp, #40]
	b	.L108
.L109:
	bl	IdlePercentage(PLT)
	ldr	r2, [sp, #28]
	mov	r4, r0
	cmp	r2, r0
	beq	.L97
	mov	lr, #19
	mov	ip, #3
	strb	lr, [sp, #45]
	ldr	lr, [sp, #24]
	mov	r2, ip
	ldr	r1, [sp, #12]
	ldr	r3, [sp, #8]
	ldr	r0, [sp, #32]
	strb	lr, [sp, #47]
	str	ip, [sp, #0]
	strb	r4, [sp, #46]
	bl	Send(PLT)
	ldr	r3, [sp, #4]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r3
	bl	bwassert(PLT)
	str	r4, [sp, #28]
	b	.L97
.L111:
	.align	2
.L110:
	.word	_GLOBAL_OFFSET_TABLE_-(.L107+8)
	.word	.LC42(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	1717986919
	.word	-2004318071
	.word	715827883
	.size	displayClock, .-displayClock
	.ident	"GCC: (GNU) 4.0.2"
