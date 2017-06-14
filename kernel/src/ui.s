	.file	"ui.c"
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L25
.L24:
	add	sl, pc, sl
	ldr	r3, .L25+4
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L25+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+12
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	mov	r3, #2
	str	r3, [fp, #-24]
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+16
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	b	.L2
.L3:
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+20
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L2:
	ldr	r3, [fp, #-24]
	cmp	r3, #135
	ble	.L3
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+24
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	mov	r3, #5
	str	r3, [fp, #-24]
	b	.L5
.L6:
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+28
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L5:
	ldr	r3, [fp, #-24]
	cmp	r3, #28
	ble	.L6
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+32
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	mov	r3, #5
	str	r3, [fp, #-24]
	b	.L8
.L9:
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+20
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L8:
	ldr	r3, [fp, #-24]
	cmp	r3, #138
	ble	.L9
	mov	r3, #3
	str	r3, [fp, #-28]
	b	.L11
.L12:
	ldr	ip, [fp, #-28]
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+36
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
	ldr	ip, [fp, #-28]
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+40
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
	ldr	ip, [fp, #-28]
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+44
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
	ldr	ip, [fp, #-28]
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+48
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
	ldr	ip, [fp, #-28]
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+52
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L11:
	ldr	r3, [fp, #-28]
	cmp	r3, #28
	ble	.L12
	bl	displayTrack(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+56
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	mov	r3, #4
	str	r3, [fp, #-28]
	b	.L14
.L15:
	ldr	r3, [fp, #-28]
	add	ip, r3, #2
	ldr	r3, [fp, #-28]
	sub	r3, r3, #3
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+60
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L14:
	ldr	r3, [fp, #-28]
	cmp	r3, #12
	ble	.L15
	b	.L17
.L18:
	ldr	r3, [fp, #-28]
	add	ip, r3, #2
	ldr	r3, [fp, #-28]
	sub	r3, r3, #3
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+64
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L17:
	ldr	r3, [fp, #-28]
	cmp	r3, #21
	ble	.L18
	b	.L20
.L21:
	ldr	r3, [fp, #-28]
	add	ip, r3, #2
	ldr	r3, [fp, #-28]
	add	r3, r3, #131
	str	r3, [sp, #0]
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+68
	add	r3, sl, r3
	mov	r2, r3
	mov	r3, ip
	bl	Printf(PLT)
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L20:
	ldr	r3, [fp, #-28]
	cmp	r3, #25
	ble	.L21
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+72
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+76
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+80
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+84
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+88
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+92
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+96
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+100
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+104
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+108
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+112
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+116
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+120
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+124
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+128
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+132
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+136
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+140
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+144
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	ldr	r0, [fp, #-20]
	mov	r1, #1
	ldr	r3, .L25+148
	add	r3, sl, r3
	mov	r2, r3
	bl	Printf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L26:
	.align	2
.L25:
	.word	_GLOBAL_OFFSET_TABLE_-(.L24+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
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
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
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
	.size	displayGrid, .-displayGrid
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #36
	ldr	sl, .L65
.L64:
	add	sl, pc, sl
	str	r0, [fp, #-48]
	ldr	r3, .L65+4
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L65+8
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	ldr	r3, .L65+12
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r3, #80
	strb	r3, [fp, #-39]
	mvn	r3, #122
	strb	r3, [fp, #-38]
	mov	r3, #0
	strb	r3, [fp, #-37]
	mov	r3, #3
	str	r3, [fp, #-28]
	sub	r2, fp, #39
	sub	ip, fp, #42
	ldr	r3, [fp, #-28]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-32]
	mov	r1, r2
	mov	r2, #3
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L65+16
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	mov	r3, #0
	strb	r3, [fp, #-21]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	strb	r3, [fp, #-21]
	b	.L28
.L29:
	ldr	r0, [fp, #-36]
	mov	r1, #0
	bl	Getc(PLT)
	mov	r3, r0
	strb	r3, [fp, #-43]
	ldr	r0, [fp, #-36]
	mov	r1, #0
	bl	Getc(PLT)
	mov	r3, r0
	strb	r3, [fp, #-44]
	ldrb	r3, [fp, #-43]
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r3, r3, asl #24
	mov	r3, r3, asr #24
	cmp	r3, #0
	bge	.L30
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #1
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L30:
	ldrb	r3, [fp, #-43]
	and	r3, r3, #255
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L32
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #2
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L32:
	ldrb	r3, [fp, #-43]
	and	r3, r3, #255
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L34
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #3
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L34:
	ldrb	r3, [fp, #-43]
	and	r3, r3, #255
	mov	r3, r3, lsr #4
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L36
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #4
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L36:
	ldrb	r3, [fp, #-43]
	and	r3, r3, #255
	mov	r3, r3, lsr #3
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L38
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #5
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L38:
	ldrb	r3, [fp, #-43]
	and	r3, r3, #255
	mov	r3, r3, lsr #2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L40
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #6
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L40:
	ldrb	r3, [fp, #-43]
	and	r3, r3, #255
	mov	r3, r3, lsr #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L42
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #7
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L42:
	ldrb	r3, [fp, #-43]
	and	r3, r3, #255
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L44
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #8
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L44:
	ldrb	r3, [fp, #-44]
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r3, r3, asl #24
	mov	r3, r3, asr #24
	cmp	r3, #0
	bge	.L46
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #9
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L46:
	ldrb	r3, [fp, #-44]
	and	r3, r3, #255
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L48
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #10
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L48:
	ldrb	r3, [fp, #-44]
	and	r3, r3, #255
	mov	r3, r3, lsr #5
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L50
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #11
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L50:
	ldrb	r3, [fp, #-44]
	and	r3, r3, #255
	mov	r3, r3, lsr #4
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L52
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #12
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L52:
	ldrb	r3, [fp, #-44]
	and	r3, r3, #255
	mov	r3, r3, lsr #3
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L54
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #13
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L54:
	ldrb	r3, [fp, #-44]
	and	r3, r3, #255
	mov	r3, r3, lsr #2
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L56
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #14
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L56:
	ldrb	r3, [fp, #-44]
	and	r3, r3, #255
	mov	r3, r3, lsr #1
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L58
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #15
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L58:
	ldrb	r3, [fp, #-44]
	and	r3, r3, #255
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L60
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	add	r3, r3, #16
	and	r3, r3, #255
	and	r3, r3, #255
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L60:
	ldrb	r3, [fp, #-21]
	add	r3, r3, #1
	strb	r3, [fp, #-21]
.L28:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #4
	bls	.L29
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L66:
	.align	2
.L65:
	.word	_GLOBAL_OFFSET_TABLE_-(.L64+8)
	.word	.LC37(GOTOFF)
	.word	.LC38(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.size	getSensorData, .-getSensorData
	.section	.rodata
	.align	2
.LC41:
	.ascii	"<displaySensors>: Displaying sensors failed.\000"
	.text
	.align	2
	.global	displaySensors
	.type	displaySensors, %function
displaySensors:
	@ args = 0, pretend = 0, frame = 84
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #88
	ldr	sl, .L77
.L76:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-96]
	b	.L68
.L69:
	ldr	r3, [fp, #-96]
	mvn	r2, #75
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-96]
	add	r3, r3, #1
	str	r3, [fp, #-96]
.L68:
	ldr	r3, [fp, #-96]
	cmp	r3, #63
	ble	.L69
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #3
	str	r3, [fp, #-20]
	b	.L75
.L71:
.L75:
	sub	r3, fp, #92
	mov	r0, r3
	bl	getSensorData(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L71
	sub	r2, fp, #92
	sub	ip, fp, #99
	ldr	r3, [fp, #-20]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-28]
	mov	r1, r2
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L77+4
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L71
.L78:
	.align	2
.L77:
	.word	_GLOBAL_OFFSET_TABLE_-(.L76+8)
	.word	.LC41(GOTOFF)
	.size	displaySensors, .-displaySensors
	.section	.rodata
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
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #100
	ldr	sl, .L89
.L88:
	add	sl, pc, sl
	mov	r3, #0
	str	r3, [fp, #-72]
	mov	r3, #0
	str	r3, [fp, #-68]
	bl	MyParentTid(PLT)
	mov	r3, r0
	str	r3, [fp, #-64]
	ldr	r3, .L89+4
	add	r3, sl, r3
	mov	r0, r3
	bl	WhoIs(PLT)
	mov	r3, r0
	str	r3, [fp, #-60]
	mov	r3, #3
	str	r3, [fp, #-56]
	b	.L87
.L80:
.L87:
	ldr	r0, [fp, #-60]
	mov	r1, #10
	bl	Delay(PLT)
	ldr	r0, [fp, #-60]
	bl	Time(PLT)
	mov	r1, r0
	ldr	r3, .L89+8
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-52]
	ldr	r1, [fp, #-52]
	ldr	r3, .L89+8
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-112]
	ldr	r3, [fp, #-112]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-112]
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r1, r3, r1
	str	r1, [fp, #-112]
	ldr	r3, [fp, #-112]
	cmp	r3, #0
	bne	.L81
	bl	IdlePercentage(PLT)
	mov	r3, r0
	str	r3, [fp, #-48]
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	beq	.L81
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-72]
	mov	r3, #19
	strb	r3, [fp, #-80]
	ldr	r3, [fp, #-72]
	and	r3, r3, #255
	strb	r3, [fp, #-79]
	mov	r3, #0
	strb	r3, [fp, #-78]
	sub	r2, fp, #80
	sub	ip, fp, #83
	ldr	r3, [fp, #-56]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-64]
	mov	r1, r2
	mov	r2, #3
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L89+12
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
.L81:
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	beq	.L80
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-68]
	ldr	r1, [fp, #-52]
	ldr	r3, .L89+8
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	rsb	r3, r3, r1
	str	r3, [fp, #-44]
	ldr	r1, [fp, #-52]
	ldr	r3, .L89+8
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-52]
	ldr	r1, [fp, #-52]
	ldr	r3, .L89+16
	smull	r2, r3, r1, r3
	add	r3, r3, r1
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-108]
	ldr	r3, [fp, #-108]
	mov	r3, r3, asl #4
	ldr	r2, [fp, #-108]
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-108]
	ldr	r3, .L89+8
	ldr	r1, [fp, #-108]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	ldr	r1, [fp, #-108]
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-108]
	rsb	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r1, [fp, #-52]
	ldr	r3, .L89+16
	smull	r2, r3, r1, r3
	add	r3, r3, r1
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-104]
	ldr	r3, [fp, #-104]
	mov	r3, r3, asl #4
	ldr	r2, [fp, #-104]
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-104]
	ldr	r3, .L89+8
	ldr	r1, [fp, #-104]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	ldr	r1, [fp, #-104]
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-52]
	ldr	r3, .L89+16
	smull	r1, r3, r2, r3
	add	r3, r3, r2
	mov	r1, r3, asr #5
	mov	r3, r2, asr #31
	rsb	r3, r3, r1
	str	r3, [fp, #-52]
	ldr	r1, [fp, #-52]
	ldr	r3, .L89+16
	smull	r2, r3, r1, r3
	add	r3, r3, r1
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-100]
	ldr	r3, [fp, #-100]
	mov	r3, r3, asl #4
	ldr	r2, [fp, #-100]
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-100]
	ldr	r3, .L89+8
	ldr	r1, [fp, #-100]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	ldr	r1, [fp, #-100]
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-100]
	rsb	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r1, [fp, #-52]
	ldr	r3, .L89+16
	smull	r2, r3, r1, r3
	add	r3, r3, r1
	mov	r2, r3, asr #5
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-96]
	ldr	r3, [fp, #-96]
	mov	r3, r3, asl #4
	ldr	r2, [fp, #-96]
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r1, r3, r1
	str	r1, [fp, #-96]
	ldr	r3, .L89+8
	ldr	r1, [fp, #-96]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	ldr	r1, [fp, #-96]
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r1, [fp, #-52]
	ldr	r3, .L89+20
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-52]
	ldr	r1, [fp, #-52]
	ldr	r3, .L89+20
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-92]
	ldr	r3, [fp, #-92]
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-92]
	add	r3, r3, r2
	mov	r3, r3, asl #3
	rsb	r1, r3, r1
	str	r1, [fp, #-92]
	ldr	r3, .L89+8
	ldr	r1, [fp, #-92]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	ldr	r1, [fp, #-92]
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-92]
	rsb	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-52]
	ldr	r3, .L89+20
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-88]
	ldr	r3, [fp, #-88]
	mov	r3, r3, asl #1
	ldr	r2, [fp, #-88]
	add	r3, r3, r2
	mov	r3, r3, asl #3
	rsb	r1, r3, r1
	str	r1, [fp, #-88]
	ldr	r3, .L89+8
	ldr	r1, [fp, #-88]
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #2
	ldr	r1, [fp, #-88]
	mov	r3, r1, asr #31
	rsb	r3, r3, r2
	str	r3, [fp, #-20]
	mov	r3, #18
	strb	r3, [fp, #-80]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	strb	r3, [fp, #-79]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	strb	r3, [fp, #-78]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	strb	r3, [fp, #-77]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	strb	r3, [fp, #-76]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	strb	r3, [fp, #-75]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	strb	r3, [fp, #-74]
	ldr	r3, [fp, #-44]
	and	r3, r3, #255
	strb	r3, [fp, #-73]
	mov	r3, #0
	strb	r3, [fp, #-72]
	sub	r2, fp, #80
	sub	ip, fp, #83
	ldr	r3, [fp, #-56]
	str	r3, [sp, #0]
	ldr	r0, [fp, #-64]
	mov	r1, r2
	mov	r2, #9
	mov	r3, ip
	bl	Send(PLT)
	mov	r3, r0
	mvn	r3, r3
	mov	r3, r3, lsr #31
	mov	r0, r3
	mov	r1, #1
	ldr	r3, .L89+12
	add	r3, sl, r3
	mov	r2, r3
	bl	bwassert(PLT)
	b	.L80
.L90:
	.align	2
.L89:
	.word	_GLOBAL_OFFSET_TABLE_-(.L88+8)
	.word	.LC42(GOTOFF)
	.word	1717986919
	.word	.LC43(GOTOFF)
	.word	-2004318071
	.word	715827883
	.size	displayClock, .-displayClock
	.ident	"GCC: (GNU) 4.0.2"
