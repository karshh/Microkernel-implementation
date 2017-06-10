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
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	b	Printf(PLT)
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
	.ascii	"commandServer\000"
	.align	2
.LC42:
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
	mov	r5, r0
	ldr	r0, .L74+4
.L73:
	add	sl, pc, sl
	sub	sp, sp, #12
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	r7, r0
	ldr	r0, .L74+8
	mov	r4, #0
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mvn	ip, #122
	mov	lr, #3
	add	r1, sp, #8
	mov	r2, #2
	add	r3, sp, #5
	strb	ip, [sp, #8]
	str	lr, [sp, #0]
	strb	r4, [sp, #9]
	bl	Send(PLT)
	ldr	r2, .L74+12
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r6, #16
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
	subne	r3, r6, #15
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #64
	subne	r3, r6, #14
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #32
	subne	r3, r6, #13
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #16
	subne	r3, r6, #12
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #8
	subne	r3, r6, #11
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #4
	subne	r3, r6, #10
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #2
	subne	r3, r6, #9
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #11]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #1
	subne	r3, r6, #8
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #128
	subne	r3, r6, #7
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #64
	subne	r3, r6, #6
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #32
	subne	r3, r6, #5
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #16
	subne	r3, r6, #4
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #8
	subne	r3, r6, #3
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #4
	subne	r3, r6, #2
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #2
	subne	r3, r6, #1
	strne	r3, [r5, r4, asl #2]
	ldrb	r3, [sp, #10]	@ zero_extendqisi2
	addne	r4, r4, #1
	tst	r3, #1
	strne	r6, [r5, r4, asl #2]
	add	r6, r6, #16
	addne	r4, r4, #1
	cmp	r6, #96
	bne	.L36
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L75:
	.align	2
.L74:
	.word	_GLOBAL_OFFSET_TABLE_-(.L73+8)
	.word	.LC0(GOTOFF)
	.word	.LC41(GOTOFF)
	.word	.LC42(GOTOFF)
	.size	getSensorData, .-getSensorData
	.section	.rodata.str1.4
	.align	2
.LC43:
	.ascii	"<displaySensors>: Displaying sensors failed.\000"
	.text
	.align	2
	.global	displaySensors
	.type	displaySensors, %function
displaySensors:
	@ args = 0, pretend = 0, frame = 804
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L105
	sub	sp, sp, #808
.L104:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	mov	r2, #0
	str	r2, [sp, #800]
	ldr	r3, [sp, #800]
	mov	r5, r0
	cmp	r3, #63
	bgt	.L92
	mov	r0, r2
.L78:
	ldr	r2, [sp, #800]
	ldr	r3, [sp, #800]
	add	ip, sp, #808
	add	r3, r3, #1
	str	r3, [sp, #800]
	add	r1, ip, r2, asl #2
	ldr	r2, [sp, #800]
	str	r0, [r1, #-292]
	cmp	r2, #63
	ble	.L78
.L92:
	add	r4, sp, #772
	add	r6, sp, #804
	ldr	r8, .L105+4
	add	r7, sp, #260
	add	r4, r4, #1
	add	r9, sp, #516
	add	r6, r6, #1
.L103:
	mov	r2, #0
	str	r2, [sp, #800]
	ldr	r3, [sp, #800]
	cmp	r3, #63
	bgt	.L79
	mov	r0, r2
.L80:
	ldr	r2, [sp, #800]
	ldr	r3, [sp, #800]
	add	ip, sp, #808
	add	r3, r3, #1
	str	r3, [sp, #800]
	add	r1, ip, r2, asl #2
	ldr	r2, [sp, #800]
	str	r0, [r1, #-548]
	cmp	r2, #63
	ble	.L80
.L79:
	mov	r3, #0
	str	r3, [sp, #800]
	ldr	r2, [sp, #800]
	cmp	r2, #63
	bgt	.L81
.L93:
	ldr	ip, [sp, #800]
	ldr	r2, [sp, #800]
	ldr	r3, [sp, #800]
	add	r1, sp, #808
	add	r3, r3, #1
	str	r3, [sp, #800]
	add	r0, r1, r2, asl #2
	ldr	r2, [sp, #800]
	ldr	r1, [r0, #-292]
	cmp	r2, #63
	add	r2, sp, #808
	add	r3, r2, ip, asl #2
	str	r1, [r3, #-804]
	ble	.L93
.L81:
	mov	r0, r7
	bl	getSensorData(PLT)
	mov	r3, #0
	str	r3, [sp, #800]
	ldr	r2, [sp, #800]
	add	ip, sp, #808
	add	r3, ip, r2, asl #2
	ldr	r1, [r3, #-548]
	cmp	r1, #0
	beq	.L83
.L94:
	ldr	ip, [sp, #800]
	ldr	r2, [sp, #800]
	ldr	r3, [sp, #800]
	add	r0, sp, #808
	add	r3, r3, #1
	str	r3, [sp, #800]
	add	r1, r0, r2, asl #2
	ldr	r2, [sp, #800]
	ldr	r0, [r1, #-548]
	add	r1, sp, #808
	add	r3, r1, r2, asl #2
	ldr	r1, [r3, #-548]
	add	r3, sp, #808
	add	r2, r3, ip, asl #2
	cmp	r1, #0
	str	r0, [r2, #-292]
	bne	.L94
.L83:
	ldr	r3, [sp, #800]
	str	r3, [sp, #796]
	ldr	r2, [sp, #800]
	cmp	r2, #63
	bgt	.L85
.L95:
	ldr	ip, [sp, #800]
	ldr	r2, [sp, #800]
	ldr	r1, [sp, #796]
	ldr	r3, [sp, #800]
	rsb	r2, r1, r2
	add	r3, r3, #1
	str	r3, [sp, #800]
	add	r0, sp, #808
	add	r1, r0, r2, asl #2
	ldr	r0, [sp, #800]
	ldr	r2, [r1, #-804]
	add	r1, sp, #808
	add	r3, r1, ip, asl #2
	cmp	r0, #63
	str	r2, [r3, #-292]
	ble	.L95
.L85:
	ldr	r1, [sp, #516]
	cmp	r1, #0
	moveq	r2, r1
	beq	.L89
	mov	r2, #0
	add	r0, r9, #4
.L90:
	strb	r1, [r2, r4]
	ldr	r1, [r0], #4
	add	r2, r2, #1
	subs	r3, r1, #0
	movne	r3, #1
	cmp	r2, #21
	movgt	r3, #0
	cmp	r3, #0
	bne	.L90
.L89:
	mov	r1, r4
	mov	ip, #3
	mov	r0, r5
	mov	r3, r6
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	bl	bwassert(PLT)
	b	.L103
.L106:
	.align	2
.L105:
	.word	_GLOBAL_OFFSET_TABLE_-(.L104+8)
	.word	.LC43(GOTOFF)
	.size	displaySensors, .-displaySensors
	.section	.rodata.str1.4
	.align	2
.LC44:
	.ascii	"clockServer\000"
	.align	2
.LC45:
	.ascii	"\033[s\033[?25l\033[1;68H%d%% \033[u\033[?25h\000"
	.align	2
.LC46:
	.ascii	"\033[s\033[?25l\033[1;125H%s%d:%s%d:%s%d.%d\033[u\033"
	.ascii	"[?25h\000"
	.text
	.align	2
	.global	displayClock
	.type	displayClock, %function
displayClock:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L128
	ldr	r0, .L128+4
.L125:
	add	sl, pc, sl
	sub	sp, sp, #56
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	fp, r0
	ldr	r0, .L128+8
	ldr	r1, .L128+12
	ldr	r2, .L128+16
	add	r0, sl, r0
	str	r1, [sp, #40]
	str	r2, [sp, #36]
	bl	WhoIs(PLT)
	mov	r6, #0
	add	r3, sp, #54
	add	ip, sp, #50
	add	r1, sp, #52
	mov	r9, r0
	str	r6, [sp, #44]
	str	r3, [sp, #24]
	str	ip, [sp, #32]
	str	r1, [sp, #28]
.L126:
	mov	r1, #10
	mov	r0, r9
	bl	Delay(PLT)
	mov	r0, r9
	bl	Time(PLT)
	ldr	ip, .L128+20
	mov	r2, r0, asr #31
	smull	r1, r3, ip, r0
	rsb	r7, r2, r3, asr #2
	smull	r2, r1, ip, r7
	mov	r5, r7, asr #31
	rsb	r8, r5, r1, asr #2
	add	r3, r8, r8, asl #2
	sub	r8, r7, r3, asl #1
	cmp	r8, #0
	beq	.L127
.L109:
	cmp	r6, r7
	beq	.L126
	ldr	r3, .L128+20
	ldr	r6, .L128+24
	smull	r1, lr, r3, r7
	rsb	lr, r5, lr, asr #2
	smull	r2, r3, r6, lr
	ldr	r4, .L128+28
	add	r3, r3, lr
	mov	r2, lr, asr #31
	rsb	r5, r2, r3, asr #5
	smull	r3, r2, r4, r5
	mov	r1, r5
	mov	r5, r5, asr #31
	rsb	r2, r5, r2, asr #2
	smull	r3, ip, r4, r2
	smull	r3, r0, r6, r1
	mov	r3, r2, asr #31
	rsb	r4, r3, ip, asr #2
	add	r0, r0, r1
	add	r3, r4, r4, asl #1
	sub	r4, r2, r3, asl #3
	rsb	ip, r5, r0, asr #5
	rsb	r3, r1, r1, asl #4
	cmp	r4, #9
	rsb	ip, ip, ip, asl #4
	mov	r2, #0
	sub	r5, lr, r3, asl #2
	sub	ip, r1, ip, asl #2
	movle	r3, #48
	strb	r2, [sp, #54]
	strleb	r3, [sp, #54]
	cmp	ip, #9
	movle	r3, #48
	strb	r2, [sp, #50]
	strleb	r3, [sp, #50]
	cmp	r5, #9
	movle	r3, #48
	str	ip, [sp, #8]
	ldr	ip, [sp, #32]
	strb	r2, [sp, #52]
	strleb	r3, [sp, #52]
	ldr	r3, [sp, #36]
	str	ip, [sp, #4]
	ldr	ip, [sp, #28]
	strb	r2, [sp, #55]
	strb	r2, [sp, #53]
	strb	r2, [sp, #51]
	mov	r0, fp
	add	r2, sl, r3
	mov	r1, #1
	ldr	r3, [sp, #24]
	str	r4, [sp, #0]
	str	r5, [sp, #16]
	str	r8, [sp, #20]
	str	ip, [sp, #12]
	bl	Printf(PLT)
	mov	r6, r7
	b	.L126
.L127:
	bl	IdlePercentage(PLT)
	ldr	r3, [sp, #44]
	mov	r4, r0
	cmp	r3, r0
	beq	.L109
	ldr	ip, [sp, #40]
	mov	r0, fp
	mov	r1, #1
	add	r2, sl, ip
	mov	r3, r4
	bl	Printf(PLT)
	str	r4, [sp, #44]
	b	.L109
.L129:
	.align	2
.L128:
	.word	_GLOBAL_OFFSET_TABLE_-(.L125+8)
	.word	.LC0(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	.LC45(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	1717986919
	.word	-2004318071
	.word	715827883
	.size	displayClock, .-displayClock
	.ident	"GCC: (GNU) 4.0.2"
