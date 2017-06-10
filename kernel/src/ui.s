	.file	"ui.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ioServer\000"
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
	.ascii	"\033[7;13H->\000"
	.align	2
.LC36:
	.ascii	"\033[8;13H>\000"
	.align	2
.LC37:
	.ascii	"\033[6;21H<--\000"
	.align	2
.LC38:
	.ascii	"\033[7;22H<-\000"
	.align	2
.LC39:
	.ascii	"\033[8;23H<\000"
	.align	2
.LC40:
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
	bl	Printf(PLT)
	ldr	r2, .L33+112
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+116
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+120
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L33+124
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	b	Exit(PLT)
.L26:
	ldr	r5, .L33+128
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
	ldr	r5, .L33+132
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
	ldr	r5, .L33+136
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
	ldr	r5, .L33+140
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
	ldr	r9, .L33+144
	ldr	r8, .L33+148
	ldr	r7, .L33+152
	ldr	r6, .L33+156
	ldr	r5, .L33+160
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
	ldr	r5, .L33+128
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
	ldr	r5, .L33+164
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
	.word	.LC37(GOTOFF)
	.word	.LC38(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
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
.LC41:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KUpdated train %d's "
	.ascii	"speed to %d.\033[34;1H>\000"
	.align	2
.LC42:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KUpdated train %d's "
	.ascii	"speed to 0, but turning on lights.\033[34;1H>\000"
	.align	2
.LC43:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KPinging Sensors man"
	.ascii	"ually.\033[34;1H>\000"
	.align	2
.LC44:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KReversed train %d.\033"
	.ascii	"[34;1H>\000"
	.align	2
.LC45:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KSwitch %d is config"
	.ascii	"ured as %c now.\033[34;1H>\000"
	.align	2
.LC46:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KIncorrect Command.\033"
	.ascii	"[34;1H>\000"
	.align	2
.LC47:
	.ascii	"\033[34;%dH\033[K\000"
	.align	2
.LC48:
	.ascii	"\033[34;%dH%c\000"
	.text
	.align	2
	.global	displayUserPrompt
	.type	displayUserPrompt, %function
displayUserPrompt:
	@ args = 0, pretend = 0, frame = 1068
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L78
	ldr	r0, .L78+4
.L73:
	add	sl, pc, sl
	sub	sp, sp, #1072
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L78+8
	mov	r5, r0
	mvn	r0, r0
	add	r2, sl, r2
	mov	r1, #1
	mov	r0, r0, lsr #31
	bl	bwassert(PLT)
	ldr	r1, .L78+12
	ldr	r2, .L78+16
	ldr	ip, .L78+20
	str	r1, [sp, #28]
	ldr	r1, .L78+24
	str	r2, [sp, #24]
	str	ip, [sp, #20]
	str	r1, [sp, #16]
	ldr	r2, .L78+28
	ldr	ip, .L78+32
	ldr	r1, .L78+36
	mov	r3, #0
	add	r6, sp, #48
	add	r9, sp, #1056
	add	r8, sp, #1056
	ldr	r7, .L78+40
	str	r2, [sp, #12]
	stmib	sp, {r1, ip}	@ phole stm
	strb	r3, [sp, #1071]
	str	r3, [sp, #32]
	sub	r6, r6, #12
	mov	fp, #2
	add	r9, r9, #8
	add	r8, r8, #4
.L76:
	mov	r0, r5
	mov	r1, #1
	bl	Getc(PLT)
	strb	r0, [sp, #1071]
	ldrb	r3, [sp, #1071]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L76
	ldrb	r3, [sp, #1071]	@ zero_extendqisi2
	cmp	r3, #13
	beq	.L77
	ldrb	r3, [sp, #1071]	@ zero_extendqisi2
	cmp	r3, #8
	bne	.L60
	cmp	fp, #2
	ble	.L76
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #4]
	sub	r1, r1, #1
	add	r2, sp, #1072
	add	r4, r2, r1
	sub	fp, fp, #1
	mov	ip, #0
	str	r1, [sp, #32]
	add	r2, sl, r3
	mov	r0, r5
	mov	r1, #1
	mov	r3, fp
	strb	ip, [r4, #-1036]
	bl	Printf(PLT)
	b	.L76
.L60:
	ldr	r2, [sp, #32]
	ldrb	ip, [sp, #1071]	@ zero_extendqisi2
	add	r1, sp, #1072
	add	lr, r1, r2
	ldrb	r4, [sp, #1071]	@ zero_extendqisi2
	mov	r3, fp
	strb	ip, [lr, #-1036]
	mov	r0, r5
	mov	r1, #1
	add	r2, sl, r7
	str	r4, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #32]
	add	fp, fp, #1
	add	r3, r3, #1
	str	r3, [sp, #32]
	b	.L76
.L77:
	ldr	r3, [sp, #32]
	add	r2, sp, #1072
	add	ip, r2, r3
	mov	r3, #0
	mov	r0, r6
	mov	r1, r9
	mov	r2, r8
	strb	r3, [ip, #-1036]
	bl	parseCommand(PLT)
	sub	r0, r0, #10
	cmp	r0, #5
	addls	pc, pc, r0, asl #2
	b	.L40
	.p2align 2
.L47:
	b	.L41
	b	.L42
	b	.L43
	b	.L44
	b	.L45
	b	.L46
.L41:
	bl	Quit(PLT)
.L44:
	ldr	ip, [sp, #32]
	cmp	ip, #0
	blt	.L48
	mov	r3, #0
	mov	r2, r3
.L50:
	strb	r2, [r3, r6]
	ldr	r1, [sp, #32]
	add	r3, r3, #1
	cmp	r1, r3
	bge	.L50
.L48:
	ldr	r3, [sp, #1064]
	ldr	ip, [sp, #28]
	mov	r0, r5
	mov	r1, #1
.L74:
	add	r2, sl, ip
	ldr	ip, [sp, #1060]
	mov	fp, #2
	str	ip, [sp, #0]
	bl	Printf(PLT)
	mov	r1, #0
	str	r1, [sp, #32]
	b	.L76
.L45:
	ldr	r2, [sp, #32]
	cmp	r2, #0
	movge	r3, #0
	movge	r2, r3
	blt	.L53
.L52:
	strb	r2, [r3, r6]
	ldr	ip, [sp, #32]
	add	r3, r3, #1
	cmp	ip, r3
	bge	.L52
.L53:
	ldr	r3, [sp, #24]
	mov	r0, r5
	add	r2, sl, r3
	mov	r1, #1
	ldr	r3, [sp, #1064]
	bl	Printf(PLT)
	mov	fp, #2
	mov	ip, #0
	str	ip, [sp, #32]
	b	.L76
.L46:
	ldr	r1, [sp, #32]
	cmp	r1, #0
	movge	r3, #0
	movge	r2, r3
	blt	.L56
.L55:
	strb	r2, [r3, r6]
	ldr	r1, [sp, #32]
	add	r3, r3, #1
	cmp	r1, r3
	bge	.L55
.L56:
	ldr	r3, [sp, #20]
	mov	r0, r5
	mov	r1, #1
	b	.L75
.L40:
	ldr	ip, [sp, #32]
	cmp	ip, #0
	movge	r3, #0
	movge	r2, r3
	blt	.L59
.L58:
	strb	r2, [r3, r6]
	ldr	ip, [sp, #32]
	add	r3, r3, #1
	cmp	ip, r3
	bge	.L58
.L59:
	ldr	r3, [sp, #8]
	mov	r0, r5
	mov	r1, #1
.L75:
	add	r2, sl, r3
	bl	Printf(PLT)
	mov	fp, #2
	mov	ip, #0
	str	ip, [sp, #32]
	b	.L76
.L42:
	ldr	r3, [sp, #1064]
	ldr	ip, [sp, #12]
	mov	r0, r5
	mov	r1, #1
	b	.L74
.L43:
	ldr	r3, [sp, #1064]
	ldr	ip, [sp, #16]
	mov	r0, r5
	mov	r1, #1
	b	.L74
.L79:
	.align	2
.L78:
	.word	_GLOBAL_OFFSET_TABLE_-(.L73+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC41(GOTOFF)
	.word	.LC42(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	.LC45(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC48(GOTOFF)
	.size	displayUserPrompt, .-displayUserPrompt
	.section	.rodata.str1.4
	.align	2
.LC49:
	.ascii	"clockServer\000"
	.align	2
.LC50:
	.ascii	"\033[%d;17H%d\000"
	.text
	.align	2
	.global	displaySensors
	.type	displaySensors, %function
displaySensors:
	@ args = 0, pretend = 0, frame = 264
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	ldr	sl, .L99
	ldr	r0, .L99+4
.L97:
	add	sl, pc, sl
	sub	sp, sp, #268
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	r4, r0
	ldr	r0, .L99+8
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	r2, #0
	str	r2, [sp, #264]
	ldr	r3, [sp, #264]
	mov	r6, r0
	cmp	r3, #63
	bgt	.L81
	mov	r0, r2
.L82:
	ldr	r2, [sp, #264]
	ldr	r3, [sp, #264]
	add	ip, sp, #268
	add	r3, r3, #1
	str	r3, [sp, #264]
	add	r1, ip, r2, asl #2
	ldr	r2, [sp, #264]
	str	r0, [r1, #-264]
	cmp	r2, #63
	ble	.L82
.L81:
	mov	r3, #0
	ldr	r5, .L99+12
	str	r3, [sp, #260]
.L83:
	mov	r3, #0
	str	r3, [sp, #264]
	ldr	r2, [sp, #264]
	cmp	r2, #21
	bgt	.L84
.L91:
	ldr	r2, [sp, #264]
	ldr	r0, [sp, #260]
	ldr	r3, [sp, #260]
	add	ip, sp, #268
	add	r3, r3, #1
	str	r3, [sp, #260]
	add	r1, ip, r2, asl #2
	ldr	r2, [sp, #264]
	str	r0, [r1, #-264]
	add	r2, r2, #1
	str	r2, [sp, #264]
	ldr	r3, [sp, #264]
	cmp	r3, #21
	ble	.L91
.L84:
	mov	r3, #0
	b	.L98
.L92:
	ldr	r3, [sp, #264]
	ldr	r1, [sp, #264]
	add	ip, sp, #268
	add	r2, ip, r1, asl #2
	ldr	ip, [r2, #-264]
	add	r3, r3, #6
	mov	r0, r4
	mov	r1, #1
	add	r2, sl, r5
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #264]
	add	r3, r3, #1
.L98:
	str	r3, [sp, #264]
	ldr	r2, [sp, #264]
	add	r0, sp, #268
	add	r3, r0, r2, asl #2
	ldr	r1, [r3, #-264]
	cmp	r1, #0
	beq	.L86
	ldr	r3, [sp, #264]
	cmp	r3, #21
	ble	.L92
.L86:
	mov	r0, r6
	mov	r1, #100
	bl	Delay(PLT)
	b	.L83
.L100:
	.align	2
.L99:
	.word	_GLOBAL_OFFSET_TABLE_-(.L97+8)
	.word	.LC0(GOTOFF)
	.word	.LC49(GOTOFF)
	.word	.LC50(GOTOFF)
	.size	displaySensors, .-displaySensors
	.ident	"GCC: (GNU) 4.0.2"
