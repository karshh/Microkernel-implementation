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
	.ascii	"\033[31;1H\000"
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
	.ascii	"\033[%d;41H|\000"
	.align	2
.LC12:
	.ascii	"\033[%d;51H|\000"
	.align	2
.LC13:
	.ascii	"\033[3;4HSwitch\033[4;3HPosition\000"
	.align	2
.LC14:
	.ascii	"\033[%d;2H00%d\000"
	.align	2
.LC15:
	.ascii	"\033[%d;26H%d: \000"
	.align	2
.LC16:
	.ascii	"\033[%d;43H%d: \000"
	.align	2
.LC17:
	.ascii	"\033[%d;2H0%d\000"
	.align	2
.LC18:
	.ascii	"\033[%d;2H%d\000"
	.align	2
.LC19:
	.ascii	"\033[3;15HSensor\033[4;14HTriggers\000"
	.align	2
.LC20:
	.ascii	"\033[3;30HSensor\033[4;27HAttribution\000"
	.align	2
.LC21:
	.ascii	"\033[3;44HArr\303\252t\033[4;44HFinal\000"
	.align	2
.LC22:
	.ascii	"\033[1;63HIdle:\000"
	.align	2
.LC23:
	.ascii	"\033[1;120HTime:\000"
	.align	2
.LC24:
	.ascii	"\033[6;13H-->\000"
	.align	2
.LC25:
	.ascii	"\033[6;21H<--\000"
	.align	2
.LC26:
	.ascii	"\033[34;1H>\000"
	.text
	.align	2
	.global	displayGrid
	.type	displayGrid, %function
displayGrid:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L34
	ldr	r0, .L34+4
.L25:
	add	sl, pc, sl
	sub	sp, sp, #12
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L34+8
	mov	r6, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r2, .L34+12
	mov	r0, r6
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L34+16
	mov	r3, #2
	add	r2, sl, r2
	mov	r0, r6
	mov	r1, #1
	str	r3, [sp, #8]
	bl	Printf(PLT)
	ldr	r3, [sp, #8]
	cmp	r3, #52
	ble	.L27
.L2:
	ldr	r2, .L34+20
	mov	r0, r6
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	mov	r3, #5
	str	r3, [sp, #8]
	ldr	r2, [sp, #8]
	cmp	r2, #55
	ble	.L28
.L4:
	ldr	r2, .L34+24
	mov	r0, r6
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	mov	r3, #5
	str	r3, [sp, #8]
	ldr	r2, [sp, #8]
	cmp	r2, #55
	ble	.L29
.L6:
	mov	r3, #3
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r2, #31
	ble	.L30
.L8:
	ldr	r2, .L34+28
	mov	r0, r6
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	mov	r3, #4
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r2, #12
	ble	.L31
	ldr	r4, .L34+32
	ldr	r7, .L34+36
.L10:
	ldr	r3, [sp, #4]
	cmp	r3, #21
	ble	.L32
.L12:
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r5, sl, r4
	add	ip, ip, #54
	add	r3, r3, #2
	mov	r0, r6
	mov	r1, #1
	mov	r2, r5
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r4, sl, r7
	add	ip, ip, #54
	add	r3, r3, #2
	mov	r0, r6
	mov	r1, #1
	mov	r2, r4
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #3
	add	ip, ip, #55
	mov	r0, r6
	mov	r1, #1
	mov	r2, r5
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #3
	add	ip, ip, #55
	mov	r0, r6
	mov	r1, #1
	mov	r2, r4
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #4
	add	ip, ip, #56
	mov	r0, r6
	mov	r1, #1
	mov	r2, r5
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #4
	add	ip, ip, #56
	mov	r0, r6
	mov	r1, #1
	mov	r2, r4
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	mov	r2, r5
	add	ip, ip, #57
	add	r3, r3, #5
	mov	r0, r6
	mov	r1, #1
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #5
	add	ip, ip, #57
	mov	r2, r4
	mov	r0, r6
	mov	r1, #1
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	cmp	r3, #25
	ble	.L33
.L14:
	ldr	r2, .L34+40
	mov	r0, r6
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L34+44
	mov	r0, r6
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L34+48
	mov	r1, #1
	add	r2, sl, r2
	mov	r0, r6
	bl	Printf(PLT)
	mov	r0, r6
	bl	drawTrack(PLT)
	ldr	r2, .L34+52
	mov	r0, r6
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L34+56
	mov	r0, r6
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L34+60
	mov	r0, r6
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L34+64
	mov	r0, r6
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L34+68
	mov	r0, r6
	add	r2, sl, r2
	mov	r1, #1
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	b	Printf(PLT)
.L27:
	ldr	r4, .L34+72
.L3:
	add	r2, sl, r4
	mov	r0, r6
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r3, [sp, #8]
	add	r3, r3, #1
	str	r3, [sp, #8]
	ldr	r2, [sp, #8]
	cmp	r2, #52
	ble	.L3
	b	.L2
.L33:
	ldr	r4, .L34+76
.L15:
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #2
	add	ip, ip, #131
	add	r2, sl, r4
	mov	r0, r6
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
.L32:
	ldr	r5, .L34+80
.L13:
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #2
	sub	ip, ip, #3
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, r5
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #2
	add	ip, ip, #54
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, r4
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #2
	add	ip, ip, #54
	add	r2, sl, r7
	mov	r0, r6
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
.L31:
	ldr	r5, .L34+84
	ldr	r4, .L34+32
	ldr	r7, .L34+36
.L11:
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #2
	sub	ip, ip, #3
	mov	r0, r6
	add	r2, sl, r5
	mov	r1, #1
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #2
	add	ip, ip, #54
	mov	r0, r6
	add	r2, sl, r4
	mov	r1, #1
	str	ip, [sp, #0]
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	ldr	ip, [sp, #4]
	add	r3, r3, #2
	add	ip, ip, #54
	add	r2, sl, r7
	mov	r0, r6
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
.L30:
	ldr	r9, .L34+88
	ldr	r8, .L34+92
	ldr	r7, .L34+96
	ldr	r5, .L34+100
	ldr	r4, .L34+104
.L9:
	ldr	r3, [sp, #4]
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, r9
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, r8
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, r7
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	mov	r0, r6
	mov	r1, #1
	add	r2, sl, r5
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	add	r2, sl, r4
	mov	r0, r6
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r2, #31
	ble	.L9
	b	.L8
.L29:
	ldr	r4, .L34+72
.L7:
	add	r2, sl, r4
	mov	r0, r6
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r3, [sp, #8]
	add	r3, r3, #1
	str	r3, [sp, #8]
	ldr	r2, [sp, #8]
	cmp	r2, #55
	ble	.L7
	b	.L6
.L28:
	ldr	r4, .L34+108
.L5:
	add	r2, sl, r4
	mov	r0, r6
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r3, [sp, #8]
	add	r3, r3, #1
	str	r3, [sp, #8]
	ldr	r2, [sp, #8]
	cmp	r2, #55
	ble	.L5
	b	.L4
.L35:
	.align	2
.L34:
	.word	_GLOBAL_OFFSET_TABLE_-(.L25+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC17(GOTOFF)
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
.LC27:
	.ascii	"clockServer\000"
	.align	2
.LC28:
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
	ldr	sl, .L55
	sub	sp, sp, #56
.L51:
	add	sl, pc, sl
	bl	MyParentTid(PLT)
	str	r0, [sp, #32]
	ldr	r0, .L55+4
	ldr	r1, .L55+8
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
.L52:
	mov	r1, #10
	bl	Delay(PLT)
	ldr	r0, [sp, #36]
	bl	Time(PLT)
	ldr	ip, .L55+12
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
	movne	ip, r1
	beq	.L53
.L38:
	cmp	r6, ip
	beq	.L50
.L54:
	ldr	r6, .L55+12
	mov	r0, ip
	smull	r1, ip, r6, r0
	ldr	lr, .L55+16
	rsb	ip, r5, ip, asr #2
	smull	r2, r3, lr, ip
	ldr	r4, .L55+20
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
	ldr	r0, [sp, #36]
	b	.L52
.L53:
	bl	IdlePercentage(PLT)
	ldr	r2, [sp, #28]
	mov	r4, r0
	cmp	r2, r0
	ldreq	ip, [sp, #40]
	beq	.L38
	mov	lr, #19
	mov	ip, #3
	strb	lr, [sp, #45]
	ldr	lr, [sp, #24]
	mov	r2, ip
	ldr	r1, [sp, #12]
	ldr	r3, [sp, #8]
	ldr	r0, [sp, #32]
	str	ip, [sp, #0]
	strb	lr, [sp, #47]
	strb	r4, [sp, #46]
	bl	Send(PLT)
	ldr	r3, [sp, #4]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r3
	bl	bwassert(PLT)
	ldr	ip, [sp, #40]
	str	r4, [sp, #28]
	cmp	r6, ip
	bne	.L54
.L50:
	ldr	r0, [sp, #36]
	b	.L52
.L56:
	.align	2
.L55:
	.word	_GLOBAL_OFFSET_TABLE_-(.L51+8)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	1717986919
	.word	-2004318071
	.word	715827883
	.size	displayClock, .-displayClock
	.ident	"GCC: (GNU) 4.0.2"
