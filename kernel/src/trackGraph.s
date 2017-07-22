	.file	"trackGraph.c"
	.text
	.align	2
	.global	sensor2i
	.type	sensor2i, %function
sensor2i:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	mov	r2, r0
	ldrb	r0, [r0, #2]	@ zero_extendqisi2
	add	r3, r3, r3, asl #2
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	add	r0, r0, r3, asl #1
	add	r0, r0, r1, asl #4
	sub	r0, r0, #1568
	@ lr needed for prologue
	bx	lr
	.size	sensor2i, .-sensor2i
	.align	2
	.global	switch2i
	.type	switch2i, %function
switch2i:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, #80
	@ lr needed for prologue
	bx	lr
	.size	switch2i, .-switch2i
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"<findALTSensor>: Why the hell did we end up here? F"
	.ascii	"IGURE THIS OUT![ALT] %d node %d\000"
	.text
	.align	2
	.global	findAltSensor
	.type	findAltSensor, %function
findAltSensor:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	mov	r4, r1
	mov	r1, r1, asl #6
	mov	r7, r0
	ldr	r0, [r0, r1]
	ldr	sl, .L51
	mov	r3, #0
	cmp	r0, #1
.L44:
	add	sl, pc, sl
	mov	r6, r2
	str	r3, [r2, #0]
	sub	sp, sp, #4
	add	r2, r7, r1
	beq	.L46
	cmp	r0, #2
	beq	.L47
	cmp	r0, #0
	ldreq	r3, [r2, #20]
	streq	r3, [r6, #0]
	ldreq	r4, [r2, #16]
.L13:
	cmp	r4, #0
	ble	.L22
	ldr	r8, .L51+4
.L23:
	add	r5, r7, r4, asl #6
	ldr	ip, [r5, #0]
	mov	r1, #1
	cmp	ip, r1
	mov	r0, #0
	add	r2, sl, r8
	mov	r3, ip
	beq	.L28
.L49:
	bcc	.L27
	cmp	ip, #2
	beq	.L48
	str	r4, [sp, #0]
	bl	bwassert(PLT)
	mov	r0, #0
	ldr	ip, [r5, #0]
	mov	r1, #1
	cmp	ip, r1
	add	r2, sl, r8
	mov	r3, ip
	bne	.L49
.L28:
	ldr	r2, [r5, #12]
	ldr	r1, [r6, #0]
	cmp	r2, #1
	ldreq	r3, [r5, #32]
	ldrne	r3, [r5, #40]
	cmp	r2, #1
	add	r3, r3, r1
	str	r3, [r6, #0]
	ldrne	r4, [r5, #28]
	beq	.L50
.L24:
	cmp	r4, #0
	bgt	.L23
.L22:
	mvn	r4, #0
.L27:
	mov	r0, r4
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L46:
	ldr	r3, [r2, #12]
	cmp	r3, #1
	ldreq	r1, [r2, #32]
	ldrne	r1, [r2, #40]
	cmp	r3, #1
	str	r1, [r6, #0]
	ldreq	r4, [r2, #28]
	ldrne	r4, [r2, #36]
	b	.L13
.L47:
	ldr	r3, [r2, #12]
	cmp	r3, #4
	ldreq	r1, [r2, #56]
	ldrne	r1, [r2, #48]
	cmp	r3, #4
	str	r1, [r6, #0]
	ldreq	r4, [r2, #52]
	ldrne	r4, [r2, #44]
	b	.L13
.L48:
	ldr	r2, [r5, #12]
	ldr	r1, [r6, #0]
	cmp	r2, #4
	ldreq	r3, [r5, #56]
	ldrne	r3, [r5, #48]
	cmp	r2, #4
	add	r3, r3, r1
	str	r3, [r6, #0]
	ldrne	r4, [r5, #52]
	ldreq	r4, [r5, #44]
	b	.L24
.L50:
	ldr	r4, [r5, #36]
	cmp	r4, #0
	bgt	.L23
	b	.L22
.L52:
	.align	2
.L51:
	.word	_GLOBAL_OFFSET_TABLE_-(.L44+8)
	.word	.LC0(GOTOFF)
	.size	findAltSensor, .-findAltSensor
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"<findNextSensor>: Why the hell did we end up here? "
	.ascii	"FIGURE THIS OUT! %d node %d\000"
	.text
	.align	2
	.global	findNextSensor
	.type	findNextSensor, %function
findNextSensor:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	mov	r6, r0
	mov	r0, r1, asl #6
	mov	r4, r1
	ldr	r1, [r6, r0]
	ldr	sl, .L82
	mov	r3, #0
	cmp	r1, #0
.L78:
	add	sl, pc, sl
	mov	r7, r2
	str	r3, [r2, #0]
	sub	sp, sp, #4
	add	r2, r6, r0
	bne	.L54
	ldr	r3, [r2, #20]
	str	r3, [r7, #0]
	ldr	r4, [r2, #16]
	cmn	r4, #1
	beq	.L56
.L54:
	cmp	r4, #0
	ble	.L56
	ldr	r8, .L82+4
.L57:
	add	r5, r6, r4, asl #6
	ldr	ip, [r5, #0]
	mov	r1, #1
	cmp	ip, r1
	mov	r0, #0
	add	r2, sl, r8
	mov	r3, ip
	beq	.L62
.L80:
	bcc	.L61
	cmp	ip, #2
	beq	.L79
	str	r4, [sp, #0]
	bl	bwassert(PLT)
	mov	r0, #0
	ldr	ip, [r5, #0]
	mov	r1, #1
	cmp	ip, r1
	add	r2, sl, r8
	mov	r3, ip
	bne	.L80
.L62:
	ldr	r2, [r5, #12]
	ldr	r1, [r7, #0]
	cmp	r2, #1
	ldreq	r3, [r5, #40]
	ldrne	r3, [r5, #32]
	cmp	r2, #1
	add	r3, r3, r1
	str	r3, [r7, #0]
	ldrne	r4, [r5, #28]
	beq	.L81
.L58:
	cmp	r4, #0
	bgt	.L57
.L56:
	mvn	r4, #0
.L61:
	mov	r0, r4
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L79:
	ldr	r2, [r5, #12]
	ldr	r1, [r7, #0]
	cmp	r2, #4
	ldreq	r3, [r5, #48]
	ldrne	r3, [r5, #56]
	cmp	r2, #4
	add	r3, r3, r1
	str	r3, [r7, #0]
	ldrne	r4, [r5, #52]
	ldreq	r4, [r5, #44]
	b	.L58
.L81:
	ldr	r4, [r5, #36]
	cmp	r4, #0
	bgt	.L57
	b	.L56
.L83:
	.align	2
.L82:
	.word	_GLOBAL_OFFSET_TABLE_-(.L78+8)
	.word	.LC1(GOTOFF)
	.size	findNextSensor, .-findNextSensor
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"A01\000"
	.align	2
.LC3:
	.ascii	"C13\000"
	.align	2
.LC4:
	.ascii	"A02\000"
	.align	2
.LC5:
	.ascii	"A03\000"
	.align	2
.LC6:
	.ascii	"A04\000"
	.align	2
.LC7:
	.ascii	"B16\000"
	.align	2
.LC8:
	.ascii	"A05\000"
	.align	2
.LC9:
	.ascii	"C07\000"
	.align	2
.LC10:
	.ascii	"A06\000"
	.align	2
.LC11:
	.ascii	"B10\000"
	.align	2
.LC12:
	.ascii	"A07\000"
	.align	2
.LC13:
	.ascii	"B12\000"
	.align	2
.LC14:
	.ascii	"A08\000"
	.align	2
.LC15:
	.ascii	"A09\000"
	.align	2
.LC16:
	.ascii	"B08\000"
	.align	2
.LC17:
	.ascii	"A10\000"
	.align	2
.LC18:
	.ascii	"A11\000"
	.align	2
.LC19:
	.ascii	"A12\000"
	.align	2
.LC20:
	.ascii	"A13\000"
	.align	2
.LC21:
	.ascii	"A14\000"
	.align	2
.LC22:
	.ascii	"A15\000"
	.align	2
.LC23:
	.ascii	"A16\000"
	.align	2
.LC24:
	.ascii	"B01\000"
	.align	2
.LC25:
	.ascii	"D14\000"
	.align	2
.LC26:
	.ascii	"B02\000"
	.align	2
.LC27:
	.ascii	"C09\000"
	.align	2
.LC28:
	.ascii	"B03\000"
	.align	2
.LC29:
	.ascii	"C02\000"
	.align	2
.LC30:
	.ascii	"B04\000"
	.align	2
.LC31:
	.ascii	"B05\000"
	.align	2
.LC32:
	.ascii	"D03\000"
	.align	2
.LC33:
	.ascii	"B06\000"
	.align	2
.LC34:
	.ascii	"C12\000"
	.align	2
.LC35:
	.ascii	"B07\000"
	.align	2
.LC36:
	.ascii	"B09\000"
	.align	2
.LC37:
	.ascii	"B11\000"
	.align	2
.LC38:
	.ascii	"B13\000"
	.align	2
.LC39:
	.ascii	"B14\000"
	.align	2
.LC40:
	.ascii	"D16\000"
	.align	2
.LC41:
	.ascii	"B15\000"
	.align	2
.LC42:
	.ascii	"C01\000"
	.align	2
.LC43:
	.ascii	"C03\000"
	.align	2
.LC44:
	.ascii	"C04\000"
	.align	2
.LC45:
	.ascii	"C05\000"
	.align	2
.LC46:
	.ascii	"C06\000"
	.align	2
.LC47:
	.ascii	"C08\000"
	.align	2
.LC48:
	.ascii	"C10\000"
	.align	2
.LC49:
	.ascii	"C11\000"
	.align	2
.LC50:
	.ascii	"E07\000"
	.align	2
.LC51:
	.ascii	"C14\000"
	.align	2
.LC52:
	.ascii	"C15\000"
	.align	2
.LC53:
	.ascii	"D12\000"
	.align	2
.LC54:
	.ascii	"C16\000"
	.align	2
.LC55:
	.ascii	"D01\000"
	.align	2
.LC56:
	.ascii	"D02\000"
	.align	2
.LC57:
	.ascii	"E04\000"
	.align	2
.LC58:
	.ascii	"E05\000"
	.align	2
.LC59:
	.ascii	"D04\000"
	.align	2
.LC60:
	.ascii	"D05\000"
	.align	2
.LC61:
	.ascii	"E06\000"
	.align	2
.LC62:
	.ascii	"D06\000"
	.align	2
.LC63:
	.ascii	"D07\000"
	.align	2
.LC64:
	.ascii	"D08\000"
	.align	2
.LC65:
	.ascii	"E08\000"
	.align	2
.LC66:
	.ascii	"D09\000"
	.align	2
.LC67:
	.ascii	"E12\000"
	.align	2
.LC68:
	.ascii	"D10\000"
	.align	2
.LC69:
	.ascii	"D11\000"
	.align	2
.LC70:
	.ascii	"E11\000"
	.align	2
.LC71:
	.ascii	"D13\000"
	.align	2
.LC72:
	.ascii	"E14\000"
	.align	2
.LC73:
	.ascii	"D15\000"
	.align	2
.LC74:
	.ascii	"E01\000"
	.align	2
.LC75:
	.ascii	"E02\000"
	.align	2
.LC76:
	.ascii	"E15\000"
	.align	2
.LC77:
	.ascii	"E03\000"
	.align	2
.LC78:
	.ascii	"E09\000"
	.align	2
.LC79:
	.ascii	"E10\000"
	.align	2
.LC80:
	.ascii	"E13\000"
	.align	2
.LC81:
	.ascii	"E16\000"
	.text
	.align	2
	.global	TrackGraphInitA
	.type	TrackGraphInitA, %function
TrackGraphInitA:
	@ args = 0, pretend = 0, frame = 292
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r3, #1
	sub	sp, sp, #292
	str	r3, [sp, #288]
	str	r3, [sp, #288]
	ldr	r2, [sp, #288]
	ldr	sl, .L100
	cmp	r2, #98
.L98:
	add	sl, pc, sl
	mov	fp, r0
	bgt	.L85
	mov	r4, #0
	mvn	lr, #0
	b	.L86
.L101:
	.align	2
.L100:
	.word	_GLOBAL_OFFSET_TABLE_-(.L98+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	361
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	538
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	590
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	1163
	.word	.LC26(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	366
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	.LC35(GOTOFF)
	.word	354
	.word	289
	.word	.LC36(GOTOFF)
	.word	649
	.word	.LC37(GOTOFF)
	.word	473
	.word	.LC38(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.word	.LC41(GOTOFF)
	.word	.LC42(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	410
	.word	.LC45(GOTOFF)
	.word	413
	.word	.LC46(GOTOFF)
	.word	481
	.word	.LC47(GOTOFF)
	.word	402
	.word	.LC48(GOTOFF)
	.word	.LC49(GOTOFF)
	.word	.LC50(GOTOFF)
	.word	.LC51(GOTOFF)
	.word	877
	.word	.LC52(GOTOFF)
	.word	.LC53(GOTOFF)
	.word	.LC54(GOTOFF)
	.word	.LC55(GOTOFF)
	.word	302
	.word	.LC56(GOTOFF)
	.word	.LC57(GOTOFF)
	.word	.LC58(GOTOFF)
	.word	.LC59(GOTOFF)
	.word	297
	.word	.LC60(GOTOFF)
	.word	.LC61(GOTOFF)
	.word	.LC64(GOTOFF)
	.word	.LC62(GOTOFF)
	.word	.LC63(GOTOFF)
	.word	406
	.word	483
	.word	.LC66(GOTOFF)
	.word	.LC65(GOTOFF)
	.word	375
	.word	.LC67(GOTOFF)
	.word	.LC68(GOTOFF)
	.word	.LC69(GOTOFF)
	.word	405
	.word	.LC70(GOTOFF)
	.word	.LC71(GOTOFF)
	.word	285
	.word	398
	.word	.LC73(GOTOFF)
	.word	.LC72(GOTOFF)
	.word	287
	.word	.LC74(GOTOFF)
.L99:
	ldr	ip, [sp, #288]
	ldr	r3, [sp, #288]
	ldr	r0, [sp, #288]
	ldr	r2, [sp, #288]
	add	r3, fp, r3, asl #6
	add	r2, fp, r2, asl #6
	ldr	r1, [sp, #288]
	str	r0, [r3, #4]
	str	lr, [r2, #8]
	ldr	r3, [sp, #288]
	add	r1, fp, r1, asl #6
	add	r3, r3, #1
	str	r3, [sp, #288]
	ldr	r2, [sp, #288]
	str	r4, [fp, ip, asl #6]
	cmp	r2, #98
	str	r4, [r1, #12]
	bgt	.L85
.L86:
	ldr	r3, [sp, #288]
	cmp	r3, #80
	ble	.L99
	ldr	ip, [sp, #288]
	ldr	r1, [sp, #288]
	ldr	r2, [sp, #288]
	ldr	r0, [sp, #288]
	sub	r2, r2, #80
	add	r1, fp, r1, asl #6
	add	r0, fp, r0, asl #6
	str	r2, [r1, #4]
	str	lr, [r0, #8]
	mov	r3, #1
	str	r3, [fp, ip, asl #6]
	ldr	r3, [sp, #288]
	add	r3, r3, #1
	str	r3, [sp, #288]
	ldr	r2, [sp, #288]
	cmp	r2, #98
	ble	.L86
.L85:
	ldr	r3, .L100+4
	ldr	r2, .L100+8
	add	r5, sl, r3
	add	r3, fp, #6336
	str	r3, [sp, #280]
	str	r2, [sp, #272]
	add	r2, fp, #6400
	str	r2, [sp, #284]
	ldr	r2, [sp, #280]
	mov	r3, #153
	str	r3, [r2, #4]
	ldr	r3, [sp, #280]
	mov	r2, #154
	str	r2, [r3, #8]
	ldr	r2, [sp, #284]
	mov	r3, #155
	str	r3, [r2, #4]
	ldr	r3, [sp, #284]
	mov	r2, #156
	str	r2, [r3, #8]
	ldr	r2, [sp, #280]
	mov	r1, #2
	str	r1, [r2, #0]
	str	r1, [r3, #0]
	ldr	r3, [sp, #272]
	mov	r0, r5
	add	r3, sl, r3
	str	r3, [sp, #276]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #276]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, .L100+12
	mov	r3, #408
	add	r4, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r4
	str	r2, [sp, #36]
	bl	sensor2i(PLT)
	mvn	r3, #0
	add	r0, fp, r0, asl #6
	str	r3, [r0, #16]
	mov	r0, r4
	bl	sensor2i(PLT)
	ldr	r3, .L100+16
	mov	r2, #500
	add	r3, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #268]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #14
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #268]
	bl	sensor2i(PLT)
	ldr	r2, .L100+20
	add	r0, fp, r0, asl #6
	add	r3, sl, r2
	str	r2, [sp, #260]
	mov	r2, #62
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #264]
	bl	sensor2i(PLT)
	ldr	r3, .L100+24
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #256]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #264]
	bl	sensor2i(PLT)
	ldr	r3, .L100+28
	add	r0, fp, r0, asl #6
	add	r3, sl, r3
	str	r3, [sp, #252]
	mov	r3, #440
	str	r3, [r0, #20]
	ldr	r0, [sp, #252]
	bl	sensor2i(PLT)
	ldr	r3, .L100+32
	ldr	r2, .L100+36
	add	r3, sl, r3
	mov	r4, r0
	mov	r0, r3
	str	r2, [sp, #104]
	str	r3, [sp, #248]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #252]
	bl	sensor2i(PLT)
	ldr	r3, [sp, #104]
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	ldr	r3, .L100+40
	mov	r7, #100
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+44
	ldr	r2, .L100+48
	add	r3, sl, r3
	mov	r4, r0
	mov	r0, r3
	str	r2, [sp, #100]
	str	r3, [sp, #244]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, [sp, #100]
	ldr	r2, .L100+172
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+52
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #240]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+56
	add	r0, fp, r0, asl #6
	add	r3, sl, r3
	str	r3, [sp, #236]
	ldr	r3, .L100+180
	str	r3, [r0, #20]
	ldr	r0, [sp, #236]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #248]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #236]
	bl	sensor2i(PLT)
	ldr	r2, .L100+60
	ldr	r3, .L100+64
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #96]
	bl	sensor2i(PLT)
	ldr	r3, .L100+68
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #232]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+72
	add	r0, fp, r0, asl #6
	add	r6, sl, r3
	ldr	r3, .L100+164
	str	r3, [r0, #20]
	mov	r0, r6
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #248]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r6
	bl	sensor2i(PLT)
	ldr	r3, .L100+76
	mov	r2, #728
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #248]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, .L100+80
	mov	r3, #928
	add	r4, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r4
	str	r2, [sp, #92]
	bl	sensor2i(PLT)
	mvn	r3, #0
	add	r0, fp, r0, asl #6
	str	r3, [r0, #16]
	mov	r0, r4
	bl	sensor2i(PLT)
	ldr	r3, .L100+84
	mov	r2, #60
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #276]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+88
	add	r0, fp, r0, asl #6
	add	r4, sl, r3
	str	r3, [sp, #72]
	ldr	r3, .L100+92
	str	r3, [r0, #20]
	mov	r0, r4
	bl	sensor2i(PLT)
	mvn	r2, #0
	add	r0, fp, r0, asl #6
	str	r2, [r0, #16]
	mov	r0, r4
	bl	sensor2i(PLT)
	ldr	r3, .L100+96
	add	r0, fp, r0, asl #6
	add	r4, sl, r3
	str	r3, [sp, #68]
	mov	r3, #320
	str	r3, [r0, #20]
	mov	r0, r4
	bl	sensor2i(PLT)
	mvn	r2, #0
	add	r0, fp, r0, asl #6
	str	r2, [r0, #16]
	mov	r0, r4
	bl	sensor2i(PLT)
	ldr	r3, .L100+100
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	mov	r3, #145
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #276]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+104
	ldr	r2, .L100+108
	str	r3, [sp, #228]
	ldr	r3, .L100+112
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #64]
	bl	sensor2i(PLT)
	ldr	r2, [sp, #228]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+116
	ldr	r2, .L100+368
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	str	r3, [sp, #224]
	bl	sensor2i(PLT)
	ldr	r3, .L100+120
	mov	r4, r0
	str	r3, [sp, #60]
	ldr	r3, .L100+124
	add	r4, fp, r4, asl #6
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #220]
	bl	sensor2i(PLT)
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, [sp, #60]
	mov	r3, #376
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+128
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #216]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+132
	mov	r2, #230
	add	r8, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r8
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #220]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r8
	bl	sensor2i(PLT)
	ldr	r3, .L100+136
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r3, [sp, #32]
	ldr	r3, .L100+140
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+144
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #212]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+148
	ldr	r2, .L100+152
	add	r3, sl, r3
	str	r3, [sp, #208]
	ldr	r3, .L100+352
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	str	r2, [sp, #200]
	ldr	r0, [sp, #208]
	add	r2, sl, r2
	str	r2, [sp, #204]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #204]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #208]
	bl	sensor2i(PLT)
	ldr	r3, .L100+156
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	ldr	r3, .L100+160
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, r6
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+164
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #232]
	bl	sensor2i(PLT)
	mvn	r2, #0
	add	r0, fp, r0, asl #6
	str	r2, [r0, #16]
	ldr	r0, [sp, #232]
	bl	sensor2i(PLT)
	ldr	r3, .L100+168
	mov	r6, #70
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r6, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #252]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+172
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #244]
	bl	sensor2i(PLT)
	mvn	r2, #0
	add	r0, fp, r0, asl #6
	str	r2, [r0, #16]
	ldr	r0, [sp, #244]
	bl	sensor2i(PLT)
	ldr	r3, .L100+176
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r6, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #236]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+180
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #240]
	bl	sensor2i(PLT)
	mvn	r2, #0
	add	r0, fp, r0, asl #6
	str	r2, [r0, #16]
	ldr	r0, [sp, #240]
	bl	sensor2i(PLT)
	ldr	r3, .L100+184
	add	r0, fp, r0, asl #6
	add	r4, sl, r3
	str	r6, [r0, #20]
	mov	r0, r4
	str	r3, [sp, #196]
	bl	sensor2i(PLT)
	add	r0, fp, r0, asl #6
	str	r7, [r0, #16]
	mov	r0, r4
	bl	sensor2i(PLT)
	ldr	r2, .L100+188
	ldr	r3, .L100+192
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [sp, #192]
	mov	r3, #224
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #28]
	bl	sensor2i(PLT)
	ldr	r2, [sp, #192]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+196
	add	r0, fp, r0, asl #6
	add	r3, sl, r3
	str	r3, [sp, #188]
	mov	r3, #202
	str	r3, [r0, #20]
	ldr	r0, [sp, #188]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #268]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #188]
	bl	sensor2i(PLT)
	mov	r2, #440
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	ldr	r0, [sp, #256]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #15
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #256]
	bl	sensor2i(PLT)
	ldr	r3, .L100+200
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r6, [r0, #20]
	mov	r0, r5
	str	r3, [sp, #24]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, r8
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r2, #230
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	ldr	r0, [sp, #216]
	bl	sensor2i(PLT)
	add	r0, fp, r0, asl #6
	str	r7, [r0, #16]
	ldr	r0, [sp, #216]
	bl	sensor2i(PLT)
	ldr	r3, .L100+204
	add	r0, fp, r0, asl #6
	add	r4, sl, r3
	str	r3, [sp, #20]
	mov	r3, #228
	str	r3, [r0, #20]
	mov	r0, r4
	bl	sensor2i(PLT)
	mvn	r2, #0
	add	r0, fp, r0, asl #6
	str	r2, [r0, #16]
	mov	r0, r4
	bl	sensor2i(PLT)
	ldr	r3, .L100+208
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	ldr	r3, .L100+212
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #18
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+216
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r3, [sp, #16]
	ldr	r3, .L100+220
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #6
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, .L100+224
	mov	r3, #79
	add	r6, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r6
	str	r2, [sp, #12]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #188]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r6
	bl	sensor2i(PLT)
	ldr	r3, .L100+228
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #248]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #5
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #248]
	bl	sensor2i(PLT)
	ldr	r3, .L100+232
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r3, [sp, #8]
	ldr	r3, .L100+236
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #3
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r2, #145
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	ldr	r0, [sp, #220]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #188]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #220]
	bl	sensor2i(PLT)
	ldr	r3, .L100+240
	ldr	r2, .L100+336
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	str	r3, [sp, #4]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #16
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+244
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r3, [sp, #0]
	mov	r3, #146
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #13
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r3, #140
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #204]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #264]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #204]
	bl	sensor2i(PLT)
	mov	r2, #376
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	ldr	r0, [sp, #276]
	bl	sensor2i(PLT)
	ldr	r3, .L100+248
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #184]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #276]
	bl	sensor2i(PLT)
	ldr	r3, .L100+252
	add	r0, fp, r0, asl #6
	add	r3, sl, r3
	str	r3, [sp, #180]
	ldr	r3, .L100+256
	str	r3, [r0, #20]
	ldr	r0, [sp, #180]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #11
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #180]
	bl	sensor2i(PLT)
	ldr	r2, .L100+260
	mov	r3, #60
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #116]
	bl	sensor2i(PLT)
	ldr	r3, .L100+264
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #176]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+268
	ldr	r2, .L100+352
	add	r3, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #172]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, r6
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #172]
	bl	sensor2i(PLT)
	ldr	r3, .L100+272
	add	r0, fp, r0, asl #6
	add	r3, sl, r3
	str	r3, [sp, #168]
	ldr	r3, .L100+276
	str	r3, [r0, #20]
	ldr	r0, [sp, #168]
	bl	sensor2i(PLT)
	mov	r3, #99
	add	r0, fp, r0, asl #6
	str	r3, [r0, #16]
	ldr	r0, [sp, #168]
	bl	sensor2i(PLT)
	ldr	r2, .L100+280
	mov	r3, #227
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #112]
	bl	sensor2i(PLT)
	ldr	r3, .L100+284
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #164]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r3, #200
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #212]
	bl	sensor2i(PLT)
	ldr	r3, .L100+288
	ldr	r2, .L100+292
	add	r6, sl, r3
	mov	r4, r0
	mov	r0, r6
	str	r2, [sp, #108]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #212]
	bl	sensor2i(PLT)
	ldr	r3, [sp, #108]
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	ldr	r3, .L100+296
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #208]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, .L100+300
	ldr	r3, .L100+352
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #88]
	bl	sensor2i(PLT)
	ldr	r3, .L100+304
	ldr	r2, .L100+308
	add	r3, sl, r3
	mov	r4, r0
	mov	r0, r3
	str	r2, [sp, #84]
	str	r3, [sp, #160]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+312
	add	r0, fp, r0, asl #6
	add	r3, sl, r3
	str	r3, [sp, #156]
	ldr	r3, .L100+336
	str	r3, [r0, #20]
	ldr	r0, [sp, #156]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #8
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #156]
	bl	sensor2i(PLT)
	ldr	r3, .L100+316
	add	r0, fp, r0, asl #6
	add	r3, sl, r3
	str	r3, [sp, #152]
	ldr	r3, .L100+320
	str	r3, [r0, #20]
	ldr	r0, [sp, #152]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #8
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #152]
	bl	sensor2i(PLT)
	ldr	r2, [sp, #84]
	ldr	r3, .L100+324
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+328
	mov	r4, r0
	str	r3, [sp, #80]
	ldr	r3, .L100+332
	add	r4, fp, r4, asl #6
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #148]
	bl	sensor2i(PLT)
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, [sp, #80]
	ldr	r3, .L100+336
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+340
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #144]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+344
	mov	r2, #312
	add	r3, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #140]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #9
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #140]
	bl	sensor2i(PLT)
	ldr	r3, .L100+348
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r3, [sp, #76]
	mov	r3, #484
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #172]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+352
	ldr	r2, .L100+356
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	str	r2, [sp, #132]
	ldr	r0, [sp, #176]
	add	r2, sl, r2
	str	r2, [sp, #136]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #136]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #176]
	bl	sensor2i(PLT)
	ldr	r3, .L100+360
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r3, [sp, #56]
	ldr	r3, .L100+364
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, [sp, #224]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, [sp, #228]
	ldr	r2, .L100+368
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+372
	mov	r4, r0
	str	r3, [sp, #52]
	ldr	r3, .L100+376
	add	r4, fp, r4, asl #6
	add	r9, sl, r3
	mov	r0, r9
	bl	sensor2i(PLT)
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, [sp, #52]
	ldr	r3, .L100+380
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, [sp, #196]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, [sp, #192]
	mov	r3, #202
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, r9
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L100+384
	mov	r2, #292
	add	r3, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #128]
	bl	sensor2i(PLT)
	mov	r2, #99
	add	r0, fp, r0, asl #6
	str	r2, [r0, #16]
	ldr	r0, [sp, #128]
	bl	sensor2i(PLT)
	ldr	r3, .L102
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r3, [sp, #48]
	mov	r3, #222
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L102+4
	ldr	r2, .L102+8
	add	r3, sl, r3
	mov	r4, r0
	mov	r0, r3
	str	r2, [sp, #44]
	str	r3, [sp, #124]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, [sp, #44]
	mov	r2, #203
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #168]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r3, #200
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #164]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, r6
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #164]
	bl	sensor2i(PLT)
	ldr	r3, .L102+12
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r6
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #156]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r6
	bl	sensor2i(PLT)
	ldr	r2, .L102+16
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	ldr	r0, [sp, #160]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #10
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #160]
	bl	sensor2i(PLT)
	mov	r3, #74
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #184]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #152]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #184]
	bl	sensor2i(PLT)
	ldr	r3, .L102+16
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #148]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #180]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #148]
	bl	sensor2i(PLT)
	ldr	r3, .L102+20
	ldr	r2, .L102+24
	add	r3, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #120]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #9
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #120]
	bl	sensor2i(PLT)
	ldr	r3, .L102+28
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r3, [sp, #40]
	ldr	r3, .L102+32
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L102+36
	mov	r4, r0
	add	r6, sl, r3
	mov	r0, r6
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, .L102+16
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	ldr	r0, [sp, #136]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #140]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #136]
	bl	sensor2i(PLT)
	mov	r3, #312
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #144]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #7
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #144]
	bl	sensor2i(PLT)
	mov	r3, #65
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r6
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #17
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r6
	bl	sensor2i(PLT)
	mov	r2, #62
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r9
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #120]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r9
	bl	sensor2i(PLT)
	ldr	r3, .L102+16
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #124]
	bl	sensor2i(PLT)
	ldr	r2, [sp, #200]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #124]
	bl	sensor2i(PLT)
	ldr	r3, .L102+40
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	ldr	r3, .L102+44
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #128]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r3, #203
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	sub	r3, r3, #203
	str	r3, [sp, #288]
	b	.L90
.L91:
	ldr	r3, [sp, #288]
	ldr	r2, [sp, #288]
	add	r1, fp, r3, asl #6
	tst	r2, #1
	ldreq	r3, [sp, #288]
	ldrne	r3, [sp, #288]
	subeq	r2, r3, #1
	addne	r2, r3, #1
	ldr	r3, [sp, #288]
	str	r2, [r1, #24]
	add	r3, r3, #1
	str	r3, [sp, #288]
.L90:
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, [sp, #288]
	cmp	r0, r3
	bge	.L91
	mov	r0, #1
	bl	switch2i(PLT)
	ldr	r2, [sp, #96]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #1
	bl	switch2i(PLT)
	mov	r3, #210
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #2
	bl	switch2i(PLT)
	ldr	r3, [sp, #100]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #2
	bl	switch2i(PLT)
	mov	r3, #211
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #3
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, #2
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #3
	bl	switch2i(PLT)
	mov	r3, #182
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #4
	bl	switch2i(PLT)
	ldr	r2, [sp, #72]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #4
	bl	switch2i(PLT)
	mov	r3, #215
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #5
	bl	switch2i(PLT)
	ldr	r2, [sp, #132]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #5
	bl	switch2i(PLT)
	ldr	r3, .L102+48
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #6
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, #5
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #6
	bl	switch2i(PLT)
	ldr	r3, .L102+52
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #7
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, #18
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #7
	bl	switch2i(PLT)
	ldr	r3, .L102+56
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #8
	bl	switch2i(PLT)
	ldr	r3, [sp, #40]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #8
	bl	switch2i(PLT)
	mov	r2, #218
	add	r0, fp, r0, asl #6
	str	r2, [r0, #32]
	mov	r0, #9
	bl	switch2i(PLT)
	ldr	r3, [sp, #88]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #9
	bl	switch2i(PLT)
	mov	r3, #213
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #10
	bl	switch2i(PLT)
	ldr	r2, [sp, #44]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #10
	bl	switch2i(PLT)
	mov	r6, #220
	add	r0, fp, r0, asl #6
	str	r6, [r0, #32]
	mov	r0, #11
	bl	switch2i(PLT)
	ldr	r3, [sp, #260]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #11
	bl	switch2i(PLT)
	ldr	r3, .L102+60
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #12
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, #4
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #12
	bl	switch2i(PLT)
	mov	r3, #185
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #13
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, r5
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #13
	bl	switch2i(PLT)
	mov	r2, #230
	add	r0, fp, r0, asl #6
	str	r2, [r0, #32]
	mov	r0, #14
	bl	switch2i(PLT)
	ldr	r3, [sp, #0]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #14
	bl	switch2i(PLT)
	ldr	r3, .L102+64
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #15
	bl	switch2i(PLT)
	ldr	r2, [sp, #4]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #15
	bl	switch2i(PLT)
	ldr	r3, .L102+68
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #16
	bl	switch2i(PLT)
	ldr	r3, [sp, #60]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #16
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r6, [r0, #32]
	mov	r0, #17
	bl	switch2i(PLT)
	ldr	r2, [sp, #52]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #17
	bl	switch2i(PLT)
	mov	r3, #230
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #18
	bl	switch2i(PLT)
	ldr	r2, [sp, #12]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #18
	bl	switch2i(PLT)
	ldr	r3, .L102+72
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #1
	bl	switch2i(PLT)
	ldr	r3, [sp, #92]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #1
	bl	switch2i(PLT)
	ldr	r3, .L102+76
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #2
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, #1
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #2
	bl	switch2i(PLT)
	mov	r3, #191
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #3
	bl	switch2i(PLT)
	ldr	r2, [sp, #104]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #3
	bl	switch2i(PLT)
	mov	r3, #216
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #4
	bl	switch2i(PLT)
	ldr	r3, [sp, #68]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #4
	bl	switch2i(PLT)
	ldr	r3, .L102+80
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #5
	bl	switch2i(PLT)
	ldr	r2, [sp, #20]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #5
	bl	switch2i(PLT)
	mov	r3, #226
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #6
	bl	switch2i(PLT)
	ldr	r3, [sp, #116]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #6
	bl	switch2i(PLT)
	mov	r5, #223
	add	r0, fp, r0, asl #6
	str	r5, [r0, #40]
	mov	r0, #7
	bl	switch2i(PLT)
	ldr	r2, [sp, #76]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #7
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r6, [r0, #40]
	mov	r0, #8
	bl	switch2i(PLT)
	ldr	r3, [sp, #80]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #8
	bl	switch2i(PLT)
	ldr	r3, .L102+84
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #9
	bl	switch2i(PLT)
	ldr	r2, [sp, #84]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #9
	bl	switch2i(PLT)
	ldr	r3, .L102+88
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #10
	bl	switch2i(PLT)
	ldr	r3, [sp, #108]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #10
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r5, [r0, #40]
	mov	r0, #11
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, #12
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #11
	bl	switch2i(PLT)
	mov	r3, #190
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #12
	bl	switch2i(PLT)
	ldr	r2, [sp, #36]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #12
	bl	switch2i(PLT)
	mov	r3, #218
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #13
	bl	switch2i(PLT)
	ldr	r2, [sp, #32]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #13
	bl	switch2i(PLT)
	mov	r3, #214
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #14
	bl	switch2i(PLT)
	ldr	r3, [sp, #272]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #14
	bl	switch2i(PLT)
	ldr	r3, .L102+92
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #15
	bl	switch2i(PLT)
	ldr	r2, [sp, #16]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #15
	bl	switch2i(PLT)
	ldr	r3, .L102+32
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #16
	bl	switch2i(PLT)
	ldr	r3, [sp, #64]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #16
	bl	switch2i(PLT)
	mov	r2, #230
	add	r0, fp, r0, asl #6
	str	r2, [r0, #40]
	mov	r0, #17
	bl	switch2i(PLT)
	ldr	r3, [sp, #56]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #17
	bl	switch2i(PLT)
	mov	r3, #225
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #18
	bl	switch2i(PLT)
	ldr	r2, [sp, #8]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #18
	bl	switch2i(PLT)
	ldr	r2, [sp, #24]
	mov	r3, #215
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	add	r0, sl, r2
	bl	sensor2i(PLT)
	ldr	r3, [sp, #280]
	ldr	r2, [sp, #280]
	str	r0, [r3, #44]
	mov	r3, #228
	str	r3, [r2, #48]
	ldr	r3, [sp, #28]
	add	r0, sl, r3
	bl	sensor2i(PLT)
	ldr	r2, [sp, #280]
	mov	r3, #224
	str	r3, [r2, #56]
	ldr	r3, [sp, #112]
	str	r0, [r2, #52]
	add	r0, sl, r3
	bl	sensor2i(PLT)
	ldr	r2, [sp, #284]
	mov	r3, #227
	str	r3, [r2, #48]
	ldr	r3, [sp, #48]
	str	r0, [r2, #44]
	add	r0, sl, r3
	bl	sensor2i(PLT)
	ldr	r2, [sp, #284]
	mov	r3, #222
	str	r3, [r2, #56]
	str	r0, [r2, #52]
	add	sp, sp, #292
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L103:
	.align	2
.L102:
	.word	.LC75(GOTOFF)
	.word	.LC76(GOTOFF)
	.word	.LC77(GOTOFF)
	.word	294
	.word	375
	.word	.LC78(GOTOFF)
	.word	877
	.word	.LC79(GOTOFF)
	.word	411
	.word	.LC80(GOTOFF)
	.word	.LC81(GOTOFF)
	.word	370
	.word	399
	.word	525
	.word	521
	.word	507
	.word	314
	.word	305
	.word	417
	.word	410
	.word	394
	.word	291
	.word	290
	.word	505
	.size	TrackGraphInitA, .-TrackGraphInitA
	.align	2
	.global	TrackGraphInitB
	.type	TrackGraphInitB, %function
TrackGraphInitB:
	@ args = 0, pretend = 0, frame = 284
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r2, #1
	sub	sp, sp, #284
	str	r2, [sp, #280]
	str	r2, [sp, #280]
	ldr	r3, [sp, #280]
	ldr	sl, .L120
	cmp	r3, #98
.L118:
	add	sl, pc, sl
	mov	fp, r0
	bgt	.L105
	mov	r5, r2
	mov	r4, #0
	mvn	lr, #0
	b	.L106
.L121:
	.align	2
.L120:
	.word	_GLOBAL_OFFSET_TABLE_-(.L118+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	814
	.word	.LC4(GOTOFF)
	.word	419
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	542
	.word	.LC16(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	783
	.word	.LC23(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	609
	.word	.LC22(GOTOFF)
	.word	325
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	359
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	367
	.word	.LC34(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC35(GOTOFF)
	.word	351
	.word	.LC36(GOTOFF)
	.word	642
	.word	.LC37(GOTOFF)
	.word	470
	.word	.LC38(GOTOFF)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.word	.LC41(GOTOFF)
	.word	437
	.word	.LC42(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	514
	.word	.LC45(GOTOFF)
	.word	394
	.word	.LC46(GOTOFF)
	.word	483
	.word	.LC47(GOTOFF)
	.word	.LC48(GOTOFF)
	.word	.LC49(GOTOFF)
	.word	.LC50(GOTOFF)
	.word	.LC51(GOTOFF)
	.word	.LC52(GOTOFF)
	.word	.LC53(GOTOFF)
	.word	.LC54(GOTOFF)
	.word	.LC55(GOTOFF)
	.word	.LC56(GOTOFF)
	.word	.LC59(GOTOFF)
	.word	.LC57(GOTOFF)
	.word	.LC58(GOTOFF)
	.word	289
	.word	.LC60(GOTOFF)
	.word	.LC61(GOTOFF)
	.word	.LC62(GOTOFF)
	.word	282
	.word	.LC63(GOTOFF)
	.word	.LC64(GOTOFF)
	.word	.LC65(GOTOFF)
	.word	.LC66(GOTOFF)
	.word	.LC69(GOTOFF)
	.word	.LC67(GOTOFF)
	.word	.LC68(GOTOFF)
	.word	471
	.word	.LC70(GOTOFF)
	.word	.LC71(GOTOFF)
	.word	274
	.word	.LC72(GOTOFF)
	.word	.LC73(GOTOFF)
.L119:
	ldr	ip, [sp, #280]
	ldr	r3, [sp, #280]
	ldr	r0, [sp, #280]
	ldr	r2, [sp, #280]
	add	r3, fp, r3, asl #6
	add	r2, fp, r2, asl #6
	ldr	r1, [sp, #280]
	str	r0, [r3, #4]
	str	lr, [r2, #8]
	ldr	r3, [sp, #280]
	add	r1, fp, r1, asl #6
	add	r3, r3, #1
	str	r3, [sp, #280]
	ldr	r2, [sp, #280]
	str	r4, [fp, ip, asl #6]
	cmp	r2, #98
	str	r4, [r1, #12]
	bgt	.L105
.L106:
	ldr	r3, [sp, #280]
	cmp	r3, #80
	ble	.L119
	ldr	ip, [sp, #280]
	ldr	r0, [sp, #280]
	ldr	r1, [sp, #280]
	ldr	r3, [sp, #280]
	ldr	r2, [sp, #280]
	sub	r3, r3, #80
	add	r2, fp, r2, asl #6
	add	r1, fp, r1, asl #6
	str	r3, [r1, #4]
	str	lr, [r2, #8]
	ldr	r3, [sp, #280]
	add	r0, fp, r0, asl #6
	add	r3, r3, #1
	str	r3, [sp, #280]
	ldr	r2, [sp, #280]
	str	r5, [fp, ip, asl #6]
	cmp	r2, #98
	str	r5, [r0, #12]
	ble	.L106
.L105:
	ldr	r3, .L120+4
	ldr	r2, .L120+8
	add	r5, sl, r3
	add	r3, fp, #6336
	str	r3, [sp, #272]
	str	r2, [sp, #264]
	add	r2, fp, #6400
	str	r2, [sp, #276]
	ldr	r2, [sp, #272]
	mov	r3, #153
	str	r3, [r2, #4]
	ldr	r3, [sp, #272]
	mov	r2, #154
	str	r2, [r3, #8]
	ldr	r2, [sp, #276]
	mov	r3, #155
	str	r3, [r2, #4]
	ldr	r3, [sp, #276]
	mov	r2, #156
	str	r2, [r3, #8]
	ldr	r2, [sp, #272]
	mov	r1, #2
	str	r1, [r2, #0]
	str	r1, [r3, #0]
	mov	r3, #3
	str	r3, [r2, #12]
	ldr	r2, [sp, #276]
	mov	r0, r5
	str	r3, [r2, #12]
	ldr	r3, [sp, #264]
	ldr	r8, .L120+12
	add	r3, sl, r3
	str	r3, [sp, #268]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #268]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, .L120+16
	ldr	r3, .L120+20
	add	r4, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r4
	str	r2, [sp, #88]
	bl	sensor2i(PLT)
	mvn	r3, #0
	add	r0, fp, r0, asl #6
	str	r3, [r0, #16]
	mov	r0, r4
	bl	sensor2i(PLT)
	ldr	r3, .L120+24
	mov	r2, #504
	add	r3, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #260]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #14
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #260]
	bl	sensor2i(PLT)
	ldr	r2, .L120+28
	add	r0, fp, r0, asl #6
	add	r3, sl, r2
	str	r2, [sp, #252]
	mov	r2, #43
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #256]
	bl	sensor2i(PLT)
	ldr	r3, .L120+32
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #248]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #256]
	bl	sensor2i(PLT)
	ldr	r3, .L120+36
	add	r0, fp, r0, asl #6
	add	r3, sl, r3
	str	r3, [sp, #244]
	ldr	r3, .L120+208
	str	r3, [r0, #20]
	ldr	r0, [sp, #244]
	bl	sensor2i(PLT)
	ldr	r3, .L120+40
	ldr	r2, .L120+44
	add	r3, sl, r3
	mov	r4, r0
	mov	r0, r3
	str	r2, [sp, #72]
	str	r3, [sp, #240]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #244]
	bl	sensor2i(PLT)
	ldr	r3, [sp, #72]
	ldr	r2, .L120+136
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+48
	mov	r4, r0
	str	r3, [sp, #68]
	ldr	r3, .L120+52
	add	r4, fp, r4, asl #6
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #236]
	bl	sensor2i(PLT)
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, [sp, #68]
	ldr	r3, .L120+180
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+56
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #232]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+60
	ldr	r2, .L120+188
	add	r3, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #228]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #240]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #228]
	bl	sensor2i(PLT)
	ldr	r3, .L120+64
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r3, [sp, #64]
	ldr	r3, .L120+68
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+72
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #224]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+76
	ldr	r2, .L120+296
	add	r3, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #220]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #240]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #220]
	bl	sensor2i(PLT)
	ldr	r3, .L120+80
	mov	r2, #229
	add	r7, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r7
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #240]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r7
	bl	sensor2i(PLT)
	ldr	r3, .L120+84
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r3, [sp, #60]
	ldr	r3, .L120+88
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+92
	mov	r4, r0
	add	r6, sl, r3
	mov	r0, r6
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+96
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r8, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #268]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, .L120+100
	ldr	r3, .L120+104
	add	r4, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r4
	str	r2, [sp, #40]
	bl	sensor2i(PLT)
	mvn	r3, #0
	add	r0, fp, r0, asl #6
	str	r3, [r0, #16]
	mov	r0, r4
	bl	sensor2i(PLT)
	ldr	r2, .L120+108
	ldr	r3, .L120+112
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #36]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, r7
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	add	r0, fp, r0, asl #6
	str	r8, [r0, #20]
	mov	r0, r6
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #268]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r6
	bl	sensor2i(PLT)
	ldr	r3, .L120+116
	ldr	r2, .L120+120
	add	r5, sl, r3
	str	r3, [sp, #32]
	add	r0, fp, r0, asl #6
	mov	r3, #648
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #216]
	bl	sensor2i(PLT)
	ldr	r3, [sp, #216]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, .L120+124
	mov	r3, #404
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #212]
	bl	sensor2i(PLT)
	ldr	r3, .L120+128
	ldr	r2, .L120+132
	add	r3, sl, r3
	mov	r4, r0
	mov	r0, r3
	str	r2, [sp, #28]
	str	r3, [sp, #208]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, [sp, #28]
	ldr	r2, .L120+136
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+140
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #204]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+144
	add	r0, fp, r0, asl #6
	add	r6, sl, r3
	mov	r3, #201
	str	r3, [r0, #20]
	mov	r0, r6
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #208]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r6
	bl	sensor2i(PLT)
	ldr	r2, .L120+148
	ldr	r3, .L120+152
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #4]
	bl	sensor2i(PLT)
	ldr	r3, .L120+156
	mov	r4, r0
	str	r3, [sp, #188]
	ldr	r3, .L120+160
	add	r4, fp, r4, asl #6
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #200]
	bl	sensor2i(PLT)
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+164
	mov	r2, #404
	add	r3, sl, r3
	str	r3, [sp, #196]
	ldr	r3, [sp, #188]
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	add	r3, sl, r3
	ldr	r0, [sp, #196]
	str	r3, [sp, #192]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #192]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #196]
	bl	sensor2i(PLT)
	ldr	r3, .L120+168
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	ldr	r3, .L120+172
	mov	r8, #100
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #220]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, .L120+296
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	ldr	r0, [sp, #224]
	bl	sensor2i(PLT)
	mvn	r3, #0
	add	r0, fp, r0, asl #6
	str	r3, [r0, #16]
	ldr	r0, [sp, #224]
	bl	sensor2i(PLT)
	ldr	r3, .L120+176
	mov	r2, #43
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #244]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+180
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #236]
	bl	sensor2i(PLT)
	mvn	r2, #0
	add	r0, fp, r0, asl #6
	str	r2, [r0, #16]
	ldr	r0, [sp, #236]
	bl	sensor2i(PLT)
	ldr	r3, .L120+184
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	mov	r3, #50
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #228]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, .L120+188
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	ldr	r0, [sp, #232]
	bl	sensor2i(PLT)
	mvn	r3, #0
	add	r0, fp, r0, asl #6
	str	r3, [r0, #16]
	ldr	r0, [sp, #232]
	bl	sensor2i(PLT)
	ldr	r2, .L120+192
	mov	r3, #50
	add	r4, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r4
	str	r2, [sp, #184]
	bl	sensor2i(PLT)
	add	r0, fp, r0, asl #6
	str	r8, [r0, #16]
	mov	r0, r4
	bl	sensor2i(PLT)
	ldr	r2, .L120+196
	ldr	r3, .L120+200
	add	r5, sl, r2
	str	r2, [sp, #0]
	add	r0, fp, r0, asl #6
	mov	r2, #239
	str	r2, [r0, #20]
	mov	r0, r5
	str	r3, [sp, #180]
	bl	sensor2i(PLT)
	ldr	r3, [sp, #180]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+204
	mov	r2, #214
	add	r7, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r7
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #260]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r7
	bl	sensor2i(PLT)
	ldr	r3, .L120+208
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #248]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #15
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #248]
	bl	sensor2i(PLT)
	ldr	r2, .L120+212
	mov	r3, #50
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #116]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, r6
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r2, #201
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	ldr	r0, [sp, #204]
	bl	sensor2i(PLT)
	add	r0, fp, r0, asl #6
	str	r8, [r0, #16]
	ldr	r0, [sp, #204]
	bl	sensor2i(PLT)
	ldr	r3, .L120+216
	mov	r2, #246
	add	r4, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r4
	str	r3, [sp, #112]
	bl	sensor2i(PLT)
	mvn	r3, #0
	add	r0, fp, r0, asl #6
	str	r3, [r0, #16]
	mov	r0, r4
	bl	sensor2i(PLT)
	ldr	r3, .L120+220
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	ldr	r3, .L120+224
	mov	r6, #128
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #18
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, .L120+228
	ldr	r3, .L120+232
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #108]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #6
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, .L120+236
	mov	r3, #61
	add	r8, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r8
	str	r2, [sp, #104]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, r7
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r8
	bl	sensor2i(PLT)
	ldr	r3, .L120+240
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #240]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #5
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #240]
	bl	sensor2i(PLT)
	ldr	r3, .L120+244
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r3, [sp, #100]
	mov	r3, #231
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #3
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	add	r0, fp, r0, asl #6
	str	r6, [r0, #20]
	ldr	r0, [sp, #208]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, r7
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #208]
	bl	sensor2i(PLT)
	ldr	r2, .L120+248
	mov	r3, #376
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #96]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #16
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, .L120+252
	add	r0, fp, r0, asl #6
	add	r5, sl, r2
	str	r6, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #92]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #13
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r3, #120
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #192]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #256]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #192]
	bl	sensor2i(PLT)
	mov	r3, #376
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #268]
	bl	sensor2i(PLT)
	ldr	r3, .L120+256
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #176]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #268]
	bl	sensor2i(PLT)
	ldr	r3, .L120+260
	mov	r2, #780
	add	r3, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #172]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #11
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #172]
	bl	sensor2i(PLT)
	ldr	r3, .L120+264
	mov	r2, #50
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	str	r3, [sp, #84]
	bl	sensor2i(PLT)
	ldr	r3, .L120+268
	mov	r4, r0
	add	r7, sl, r3
	mov	r0, r7
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+272
	add	r0, fp, r0, asl #6
	add	r6, sl, r3
	mov	r3, #404
	str	r3, [r0, #20]
	mov	r0, r6
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, r8
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r6
	bl	sensor2i(PLT)
	ldr	r3, .L120+276
	mov	r2, #300
	add	r3, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #168]
	bl	sensor2i(PLT)
	mov	r2, #99
	add	r0, fp, r0, asl #6
	str	r2, [r0, #16]
	ldr	r0, [sp, #168]
	bl	sensor2i(PLT)
	ldr	r3, .L120+280
	mov	r2, #246
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	str	r3, [sp, #80]
	bl	sensor2i(PLT)
	ldr	r3, .L120+284
	mov	r4, r0
	str	r3, [sp, #76]
	ldr	r3, .L120+288
	add	r4, fp, r4, asl #6
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #164]
	bl	sensor2i(PLT)
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r2, #201
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	ldr	r0, [sp, #200]
	bl	sensor2i(PLT)
	ldr	r3, [sp, #76]
	mov	r4, r0
	add	r5, sl, r3
	ldr	r3, .L120+292
	add	r4, fp, r4, asl #6
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #160]
	bl	sensor2i(PLT)
	str	r0, [r4, #16]
	ldr	r0, [sp, #200]
	bl	sensor2i(PLT)
	ldr	r2, .L120+296
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #196]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+300
	mov	r2, #404
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	str	r3, [sp, #56]
	bl	sensor2i(PLT)
	ldr	r3, .L120+304
	mov	r4, r0
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #156]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+308
	ldr	r8, .L120+312
	add	r3, sl, r3
	add	r0, fp, r0, asl #6
	str	r8, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #152]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #8
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #152]
	bl	sensor2i(PLT)
	ldr	r3, .L120+316
	mov	r2, #384
	add	r3, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #148]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #8
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #148]
	bl	sensor2i(PLT)
	ldr	r3, .L120+320
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r3, [sp, #52]
	mov	r3, #464
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+324
	ldr	r2, .L120+328
	add	r3, sl, r3
	mov	r4, r0
	mov	r0, r3
	str	r2, [sp, #48]
	str	r3, [sp, #144]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, [sp, #48]
	mov	r2, #376
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+332
	mov	r4, r0
	str	r3, [sp, #44]
	ldr	r3, .L120+336
	add	r4, fp, r4, asl #6
	add	r3, sl, r3
	mov	r0, r3
	str	r3, [sp, #140]
	bl	sensor2i(PLT)
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+340
	add	r0, fp, r0, asl #6
	add	r3, sl, r3
	str	r8, [r0, #20]
	mov	r0, r3
	str	r3, [sp, #136]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #9
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #136]
	bl	sensor2i(PLT)
	ldr	r2, [sp, #44]
	ldr	r3, .L120+344
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, r6
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+348
	mov	r2, #404
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	str	r3, [sp, #128]
	mov	r0, r7
	add	r3, sl, r3
	str	r3, [sp, #132]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #132]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r7
	bl	sensor2i(PLT)
	ldr	r2, .L120+352
	ldr	r3, .L120+356
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	str	r2, [sp, #24]
	bl	sensor2i(PLT)
	ldr	r3, [sp, #212]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, [sp, #216]
	mov	r3, #404
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L120+360
	ldr	r2, .L120+364
	add	r3, sl, r3
	mov	r4, r0
	mov	r0, r3
	str	r2, [sp, #20]
	str	r3, [sp, #124]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, [sp, #20]
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	str	r8, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, [sp, #184]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, [sp, #180]
	mov	r2, #214
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #124]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r3, .L122
	add	r0, fp, r0, asl #6
	add	r3, sl, r3
	str	r3, [sp, #120]
	ldr	r3, .L122+4
	str	r3, [r0, #20]
	ldr	r0, [sp, #120]
	bl	sensor2i(PLT)
	mov	r2, #99
	add	r0, fp, r0, asl #6
	str	r2, [r0, #16]
	ldr	r0, [sp, #120]
	bl	sensor2i(PLT)
	ldr	r3, .L122+8
	mov	r2, #239
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	str	r3, [sp, #16]
	bl	sensor2i(PLT)
	ldr	r3, .L122+12
	mov	r4, r0
	str	r3, [sp, #12]
	ldr	r3, .L122+16
	add	r4, fp, r4, asl #6
	add	r9, sl, r3
	mov	r0, r9
	bl	sensor2i(PLT)
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	ldr	r2, [sp, #12]
	mov	r3, #201
	add	r5, sl, r2
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #168]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r2, #201
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	ldr	r0, [sp, #164]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #160]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #164]
	bl	sensor2i(PLT)
	ldr	r3, .L122+4
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #160]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #152]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #160]
	bl	sensor2i(PLT)
	add	r0, fp, r0, asl #6
	str	r8, [r0, #20]
	ldr	r0, [sp, #156]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #10
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #156]
	bl	sensor2i(PLT)
	mov	r2, #50
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	ldr	r0, [sp, #176]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #148]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #176]
	bl	sensor2i(PLT)
	mov	r3, #376
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	ldr	r0, [sp, #144]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #172]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #144]
	bl	sensor2i(PLT)
	ldr	r3, .L122+20
	mov	r2, #780
	add	r7, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r7
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #9
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r7
	bl	sensor2i(PLT)
	ldr	r3, .L122+24
	ldr	r2, .L122+28
	add	r5, sl, r3
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	mov	r0, r5
	str	r3, [sp, #8]
	bl	sensor2i(PLT)
	ldr	r3, .L122+32
	mov	r4, r0
	add	r6, sl, r3
	mov	r0, r6
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	add	r0, fp, r0, asl #6
	str	r8, [r0, #20]
	ldr	r0, [sp, #132]
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #136]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #132]
	bl	sensor2i(PLT)
	add	r0, fp, r0, asl #6
	str	r8, [r0, #20]
	ldr	r0, [sp, #140]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #7
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #140]
	bl	sensor2i(PLT)
	mov	r3, #43
	add	r0, fp, r0, asl #6
	str	r3, [r0, #20]
	mov	r0, r6
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, #17
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r6
	bl	sensor2i(PLT)
	mov	r2, #43
	add	r0, fp, r0, asl #6
	str	r2, [r0, #20]
	ldr	r0, [sp, #124]
	bl	sensor2i(PLT)
	mov	r4, r0
	mov	r0, r7
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	ldr	r0, [sp, #124]
	bl	sensor2i(PLT)
	add	r0, fp, r0, asl #6
	str	r8, [r0, #20]
	mov	r0, r9
	bl	sensor2i(PLT)
	ldr	r3, [sp, #188]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r9
	bl	sensor2i(PLT)
	ldr	r3, .L122+36
	add	r0, fp, r0, asl #6
	add	r5, sl, r3
	ldr	r3, .L122+40
	mov	r8, r5
	str	r3, [r0, #20]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r4, r0
	ldr	r0, [sp, #120]
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #16]
	mov	r0, r5
	bl	sensor2i(PLT)
	mov	r2, #201
	add	r0, fp, r0, asl #6
	mov	r3, #0
	str	r2, [r0, #20]
	str	r3, [sp, #280]
	b	.L110
.L111:
	ldr	r3, [sp, #280]
	ldr	r2, [sp, #280]
	add	r1, fp, r3, asl #6
	tst	r2, #1
	ldreq	r3, [sp, #280]
	ldrne	r3, [sp, #280]
	subeq	r2, r3, #1
	addne	r2, r3, #1
	ldr	r3, [sp, #280]
	str	r2, [r1, #24]
	add	r3, r3, #1
	str	r3, [sp, #280]
.L110:
	mov	r0, r8
	bl	sensor2i(PLT)
	ldr	r3, [sp, #280]
	cmp	r0, r3
	bge	.L111
	mov	r0, #1
	bl	switch2i(PLT)
	ldr	r3, [sp, #64]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #1
	bl	switch2i(PLT)
	mov	r6, #229
	add	r0, fp, r0, asl #6
	str	r6, [r0, #32]
	mov	r0, #2
	bl	switch2i(PLT)
	ldr	r2, [sp, #68]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #2
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r6, [r0, #32]
	mov	r0, #3
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, #2
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #3
	bl	switch2i(PLT)
	mov	r7, #185
	add	r0, fp, r0, asl #6
	str	r7, [r0, #32]
	mov	r0, #4
	bl	switch2i(PLT)
	ldr	r3, [sp, #40]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #4
	bl	switch2i(PLT)
	mov	r3, #236
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #5
	bl	switch2i(PLT)
	ldr	r2, [sp, #128]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #5
	bl	switch2i(PLT)
	ldr	r3, .L122+44
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #6
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, #5
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #6
	bl	switch2i(PLT)
	ldr	r5, .L122+48
	add	r0, fp, r0, asl #6
	str	r5, [r0, #32]
	mov	r0, #7
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, #18
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #7
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r5, [r0, #32]
	mov	r0, #8
	bl	switch2i(PLT)
	ldr	r3, [sp, #8]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #8
	bl	switch2i(PLT)
	mov	r5, #239
	add	r0, fp, r0, asl #6
	str	r5, [r0, #32]
	mov	r0, #9
	bl	switch2i(PLT)
	ldr	r2, [sp, #56]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #9
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r6, [r0, #32]
	mov	r0, #10
	bl	switch2i(PLT)
	ldr	r3, [sp, #12]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #10
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r5, [r0, #32]
	mov	r0, #11
	bl	switch2i(PLT)
	ldr	r2, [sp, #252]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #11
	bl	switch2i(PLT)
	ldr	r3, .L122+52
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #12
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, #4
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #12
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r7, [r0, #32]
	mov	r0, #13
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, r8
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #13
	bl	switch2i(PLT)
	add	r7, r7, #61
	add	r0, fp, r0, asl #6
	str	r7, [r0, #32]
	mov	r0, #14
	bl	switch2i(PLT)
	ldr	r3, [sp, #92]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #14
	bl	switch2i(PLT)
	ldr	r3, .L122+56
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #15
	bl	switch2i(PLT)
	ldr	r2, [sp, #96]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #15
	bl	switch2i(PLT)
	ldr	r3, .L122+60
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #16
	bl	switch2i(PLT)
	ldr	r3, [sp, #28]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #16
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r5, [r0, #32]
	mov	r0, #17
	bl	switch2i(PLT)
	ldr	r2, [sp, #20]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #17
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r7, [r0, #32]
	mov	r0, #18
	bl	switch2i(PLT)
	ldr	r3, [sp, #104]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #28]
	mov	r0, #18
	bl	switch2i(PLT)
	ldr	r3, .L122+64
	add	r0, fp, r0, asl #6
	str	r3, [r0, #32]
	mov	r0, #1
	bl	switch2i(PLT)
	ldr	r2, [sp, #60]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #1
	bl	switch2i(PLT)
	ldr	r3, .L122+68
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #2
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, #1
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #2
	bl	switch2i(PLT)
	mov	r8, #188
	add	r0, fp, r0, asl #6
	str	r8, [r0, #40]
	mov	r0, #3
	bl	switch2i(PLT)
	ldr	r3, [sp, #72]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #3
	bl	switch2i(PLT)
	add	r6, r6, #2
	add	r0, fp, r0, asl #6
	str	r6, [r0, #40]
	mov	r0, #4
	bl	switch2i(PLT)
	ldr	r2, [sp, #36]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #4
	bl	switch2i(PLT)
	ldr	r3, .L122+72
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #5
	bl	switch2i(PLT)
	ldr	r3, [sp, #112]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #5
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r5, [r0, #40]
	mov	r0, #6
	bl	switch2i(PLT)
	ldr	r2, [sp, #84]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #6
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r5, [r0, #40]
	mov	r0, #7
	bl	switch2i(PLT)
	ldr	r3, [sp, #44]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #7
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r6, [r0, #40]
	mov	r0, #8
	bl	switch2i(PLT)
	ldr	r2, [sp, #48]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #8
	bl	switch2i(PLT)
	mov	r3, #316
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #9
	bl	switch2i(PLT)
	ldr	r3, [sp, #52]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #9
	bl	switch2i(PLT)
	ldr	r3, .L122+76
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #10
	bl	switch2i(PLT)
	ldr	r2, [sp, #76]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #10
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r5, [r0, #40]
	mov	r0, #11
	bl	switch2i(PLT)
	mov	r4, r0
	mov	r0, #12
	bl	switch2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #11
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r8, [r0, #40]
	mov	r0, #12
	bl	switch2i(PLT)
	ldr	r3, [sp, #88]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #12
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r6, [r0, #40]
	mov	r0, #13
	bl	switch2i(PLT)
	ldr	r2, [sp, #4]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #13
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r6, [r0, #40]
	mov	r0, #14
	bl	switch2i(PLT)
	ldr	r3, [sp, #264]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #14
	bl	switch2i(PLT)
	ldr	r3, .L122+80
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #15
	bl	switch2i(PLT)
	ldr	r2, [sp, #108]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #15
	bl	switch2i(PLT)
	ldr	r3, .L122+84
	add	r0, fp, r0, asl #6
	str	r3, [r0, #40]
	mov	r0, #16
	bl	switch2i(PLT)
	ldr	r3, [sp, #32]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #16
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r6, [r0, #40]
	mov	r0, #17
	bl	switch2i(PLT)
	ldr	r2, [sp, #24]
	mov	r4, r0
	add	r0, sl, r2
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #17
	bl	switch2i(PLT)
	add	r0, fp, r0, asl #6
	str	r5, [r0, #40]
	mov	r0, #18
	bl	switch2i(PLT)
	ldr	r3, [sp, #100]
	mov	r4, r0
	add	r0, sl, r3
	bl	sensor2i(PLT)
	add	r4, fp, r4, asl #6
	str	r0, [r4, #36]
	mov	r0, #18
	bl	switch2i(PLT)
	ldr	r2, [sp, #116]
	add	r0, fp, r0, asl #6
	str	r6, [r0, #40]
	add	r0, sl, r2
	bl	sensor2i(PLT)
	ldr	r3, [sp, #272]
	ldr	r2, [sp, #0]
	str	r0, [r3, #44]
	str	r7, [r3, #48]
	add	r0, sl, r2
	bl	sensor2i(PLT)
	ldr	r3, [sp, #272]
	ldr	r2, [sp, #80]
	str	r0, [r3, #52]
	str	r5, [r3, #56]
	add	r0, sl, r2
	bl	sensor2i(PLT)
	ldr	r3, [sp, #276]
	ldr	r2, [sp, #16]
	str	r0, [r3, #44]
	str	r7, [r3, #48]
	add	r0, sl, r2
	bl	sensor2i(PLT)
	ldr	r3, [sp, #276]
	str	r5, [r3, #56]
	str	r0, [r3, #52]
	add	sp, sp, #284
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L123:
	.align	2
.L122:
	.word	.LC74(GOTOFF)
	.word	289
	.word	.LC75(GOTOFF)
	.word	.LC77(GOTOFF)
	.word	.LC76(GOTOFF)
	.word	.LC78(GOTOFF)
	.word	.LC79(GOTOFF)
	.word	394
	.word	.LC80(GOTOFF)
	.word	.LC81(GOTOFF)
	.word	366
	.word	414
	.word	526
	.word	538
	.word	333
	.word	326
	.word	371
	.word	282
	.word	275
	.word	309
	.word	545
	.word	433
	.size	TrackGraphInitB, .-TrackGraphInitB
	.section	.rodata.str1.4
	.align	2
.LC82:
	.ascii	"<findEdge>: couldn't find edge between %d and %d\000"
	.text
	.align	2
	.global	findEdge
	.type	findEdge, %function
findEdge:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	mov	r3, r1, asl #6
	ldr	ip, [r0, r3]
	ldr	sl, .L146
	cmp	ip, #1
.L140:
	add	sl, pc, sl
	sub	sp, sp, #4
	mov	lr, r2
	add	r0, r0, r3
	beq	.L127
	bcc	.L126
	cmp	ip, #2
	beq	.L143
	ldr	r2, .L146+4
	mov	r3, r1
	mov	r0, #0
	add	r2, sl, r2
	mov	r1, #1
	str	lr, [sp, #0]
	bl	bwassert(PLT)
	mov	r0, #0
.L129:
	add	sp, sp, #4
	ldmfd	sp!, {sl, pc}
.L126:
	ldr	r3, [r0, #16]
	cmp	r2, r3
	movne	r0, #0
	moveq	r0, #1
	b	.L129
.L127:
	ldr	r3, [r0, #12]
	cmp	r3, #2
	beq	.L144
	cmp	r3, #1
	bne	.L133
	ldr	r3, [r0, #36]
	cmp	r2, r3
	beq	.L132
.L133:
	mov	r0, #0
	b	.L129
.L143:
	ldr	r3, [r0, #12]
	cmp	r3, #4
	beq	.L145
	cmp	r3, #3
	bne	.L133
	ldr	r3, [r0, #52]
	cmp	r2, r3
	bne	.L133
.L132:
	mov	r0, #1
	b	.L129
.L144:
	ldr	r3, [r0, #28]
	cmp	r2, r3
	beq	.L132
	mov	r0, #0
	b	.L129
.L145:
	ldr	r3, [r0, #44]
	cmp	r2, r3
	beq	.L132
	mov	r0, #0
	b	.L129
.L147:
	.align	2
.L146:
	.word	_GLOBAL_OFFSET_TABLE_-(.L140+8)
	.word	.LC82(GOTOFF)
	.size	findEdge, .-findEdge
	.align	2
	.global	getEdgeDistance
	.type	getEdgeDistance, %function
getEdgeDistance:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, sl, lr}
	mov	r3, r1, asl #6
	ldr	lr, [r0, r3]
	ldr	sl, .L166
	cmp	lr, #1
.L164:
	add	sl, pc, sl
	sub	sp, sp, #4
	mov	r5, r1
	mov	r6, r2
	add	r4, r0, r3
	beq	.L151
	bcc	.L150
	cmp	lr, #2
	beq	.L165
	ldr	r2, .L166+4
	mov	r3, r1
	mov	r0, #0
	add	r2, sl, r2
	mov	r1, #1
	str	r6, [sp, #0]
	bl	bwassert(PLT)
	mov	r0, #0
.L155:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, sl, pc}
.L150:
	bl	findEdge(PLT)
	cmp	r0, #0
	ldrne	r0, [r4, #20]
	moveq	r0, #0
	b	.L155
.L151:
	ldr	r3, [r4, #28]
	cmp	r2, r3
	ldreq	r0, [r4, #32]
	beq	.L155
	ldr	r3, [r4, #36]
	cmp	r2, r3
	ldreq	r0, [r4, #40]
	movne	r0, #0
	b	.L155
.L165:
	ldr	r3, [r4, #44]
	cmp	r2, r3
	ldreq	r0, [r4, #48]
	beq	.L155
	ldr	r3, [r4, #52]
	cmp	r2, r3
	ldreq	r0, [r4, #56]
	movne	r0, #0
	b	.L155
.L167:
	.align	2
.L166:
	.word	_GLOBAL_OFFSET_TABLE_-(.L164+8)
	.word	.LC82(GOTOFF)
	.size	getEdgeDistance, .-getEdgeDistance
	.align	2
	.global	getEdgeInfo
	.type	getEdgeInfo, %function
getEdgeInfo:
	@ args = 4, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	sub	r2, r2, #1
	sub	sp, sp, #4
	mov	r4, #0
	str	r4, [sp, #0]
	str	r2, [sp, #0]
	ldr	r2, [sp, #0]
	ldr	r6, [sp, #28]
	cmp	r2, r4
	mov	r8, r0
	mov	r5, r1
	mov	r7, r3
	str	r4, [r6, #0]
	ble	.L169
.L172:
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #0]
	ldr	r1, [r5, r2, asl #2]
	add	r3, r5, r3, asl #2
	ldr	r2, [r3, #-4]
	mov	r0, r8
	bl	getEdgeDistance(PLT)
	ldr	r3, [sp, #0]
	str	r0, [r7, r4, asl #2]
	sub	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r4, [r6, #0]
	ldr	r3, [sp, #0]
	add	r2, r4, #1
	cmp	r3, #0
	mov	r4, r2
	str	r2, [r6, #0]
	bgt	.L172
.L169:
	mov	r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, pc}
	.size	getEdgeInfo, .-getEdgeInfo
	.section	.rodata.str1.4
	.align	2
.LC83:
	.ascii	"<TrackGraphFind>:ERROR 1, Could not add %d to cb.\000"
	.align	2
.LC84:
	.ascii	"<TrackGraphFind>:ERROR 2, Could not add %d to cb.\000"
	.align	2
.LC85:
	.ascii	"<TrackGraphFind>:ERROR 3, Could not add %d to cb.\000"
	.align	2
.LC86:
	.ascii	"<TrackGraphFind>:ERROR 4, Could not add %d to cb.\000"
	.align	2
.LC87:
	.ascii	"<TrackGraphFind>:ERROR 5, Could not add %d to cb.\000"
	.align	2
.LC88:
	.ascii	"<TrackGraphFind>:ERROR 6, Could not add %d to cb.\000"
	.align	2
.LC89:
	.ascii	"<TrackGraphFind>:ERROR 7, Could not add %d to cb.\000"
	.text
	.align	2
	.global	getShortestPathPlus
	.type	getShortestPathPlus, %function
getShortestPathPlus:
	@ args = 12, pretend = 0, frame = 17212
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #17152
	sub	sp, sp, #60
	ldr	sl, .L288
	mov	fp, r1
	cmp	r2, #0
	cmpgt	r1, #0
	mov	ip, #0
	add	r1, sp, #16384
.L280:
	add	sl, pc, sl
	mov	r8, r2
	mov	r6, r0
	str	r3, [sp, #4]
	str	ip, [r1, #824]
	ldr	r5, [r1, #872]
	ble	.L175
	cmp	fp, r2
	beq	.L177
	add	r3, r0, fp, asl #6
	ldr	r2, [r3, #24]
	cmp	fp, r2
	beq	.L177
	mov	r3, ip
	add	r0, sp, #16384
	add	ip, sp, #16640
	add	ip, ip, #164
	add	r0, r0, #16
	mov	r1, r3
	mvn	r2, #0
.L181:
	str	r1, [r3, ip]
	str	r2, [r3, r0]
	add	r3, r3, #4
	cmp	r3, #404
	bne	.L181
	add	r7, sp, #60
	sub	r7, r7, #52
	mov	r0, r7
	bl	circularBufferInit(PLT)
	add	r2, sp, #17152
	add	r2, r2, #60
	add	r3, r2, fp, asl #2
	mov	r4, #1
	mov	r1, r7
	str	r4, [r3, #-408]
	mov	r0, fp
	bl	addToBuffer(PLT)
	ldr	r2, .L288+4
	mov	r1, r4
	add	r2, sl, r2
	mov	r3, fp
	bl	bwassert(PLT)
	add	r3, sp, #17152
	add	r3, r3, #56
	mov	r0, r3
	mov	r1, r7
	str	r3, [sp, #0]
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	mov	r9, r4
	beq	.L197
.L184:
	add	r1, sp, #16384
	ldr	ip, [r1, #824]
	mov	r3, ip, asl #6
	ldr	r2, [r6, r3]
	add	r0, r6, r3
	cmp	r2, #0
	bne	.L185
	cmp	r5, #0
	ldr	r4, [r0, #16]
	ble	.L187
	add	r3, sp, #16384
	mov	r1, r2
	ldr	r2, [r3, #868]
	b	.L189
.L190:
	cmp	r5, r1
	add	r2, r2, #8
	beq	.L187
.L189:
	ldr	r3, [r2, #4]
	add	r1, r1, #1
	cmp	ip, r3
	bne	.L190
	ldr	r3, [r2, #0]
	cmp	r4, r3
	bne	.L190
	mov	r1, #1
.L193:
	cmp	r4, #0
	ble	.L194
	add	r3, sp, #17152
	add	r3, r3, #60
	add	r2, r3, r4, asl #2
	ldr	r3, [r2, #-408]
	orrs	r1, r1, r3
	beq	.L282
.L194:
	add	r3, r6, ip, asl #6
	cmp	r5, #0
	ldr	r4, [r3, #24]
	ble	.L198
	add	r3, sp, #16384
	ldr	r2, [r3, #868]
	mov	r1, #0
	b	.L200
.L201:
	cmp	r5, r1
	add	r2, r2, #8
	beq	.L198
.L200:
	ldr	r3, [r2, #4]
	add	r1, r1, #1
	cmp	ip, r3
	bne	.L201
	ldr	r3, [r2, #0]
	cmp	r4, r3
	bne	.L201
	mov	r1, #1
.L204:
	cmp	r4, #0
	ble	.L279
	add	r3, sp, #17152
	add	r3, r3, #60
	add	r2, r3, r4, asl #2
	ldr	r3, [r2, #-408]
	orrs	r1, r1, r3
	beq	.L283
.L279:
	ldr	r0, [sp, #0]
.L284:
	mov	r1, r7
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	bne	.L184
.L197:
	add	r1, sp, #17152
	add	r1, r1, #60
	add	r3, r1, r8, asl #2
	ldr	r2, [r3, #-812]
	cmn	r2, #1
	beq	.L175
	add	r2, sp, #16384
	ldr	r2, [r2, #864]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r2, r8
.L248:
	ldr	r1, [sp, #4]
	str	r2, [r1, r3, asl #2]
	add	r1, sp, #17152
	add	r1, r1, #60
	add	r3, r1, r2, asl #2
	add	r1, sp, #16384
	ldr	r1, [r1, #864]
	ldr	r2, [r3, #-812]
	ldr	r3, [r1, #0]
	cmp	fp, r2
	add	r3, r3, #1
	str	r3, [r1, #0]
	bne	.L248
	ldr	r1, [sp, #4]
	mov	r0, #1
	str	r2, [r1, r3, asl #2]
	add	r2, sp, #16384
	ldr	r2, [r2, #864]
	ldr	r3, [r2, #0]
	add	r3, r3, r0
	str	r3, [r2, #0]
	b	.L180
.L283:
	mov	r1, r7
	str	ip, [r2, #-812]
	str	r9, [r2, #-408]
	mov	r0, r4
	bl	addToBuffer(PLT)
	ldr	r2, .L288+8
	mov	r1, r9
.L281:
	add	r2, sl, r2
	mov	r3, r4
	bl	bwassert(PLT)
	cmp	r8, r4
	beq	.L197
	ldr	r0, [sp, #0]
	b	.L284
.L177:
	add	r1, sp, #16384
	ldr	r2, [sp, #4]
	ldr	r1, [r1, #864]
	mov	r3, #1
	str	fp, [r2, #0]
	mov	r0, r3
	str	r3, [r1, #0]
.L180:
	add	sp, sp, #828
	add	sp, sp, #16384
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L185:
	cmp	r2, #1
	beq	.L285
	cmp	r5, #0
	ldr	r4, [r0, #44]
	ble	.L228
	add	r1, sp, #16384
	ldr	r2, [r1, #868]
	mov	r1, #0
	b	.L230
.L231:
	cmp	r5, r1
	add	r2, r2, #8
	beq	.L228
.L230:
	ldr	r3, [r2, #4]
	add	r1, r1, #1
	cmp	ip, r3
	bne	.L231
	ldr	r3, [r2, #0]
	cmp	r4, r3
	bne	.L231
	mov	r1, #1
.L234:
	cmp	r4, #0
	ble	.L235
	add	r3, sp, #17152
	add	r3, r3, #60
	add	r2, r3, r4, asl #2
	ldr	r3, [r2, #-408]
	orrs	r1, r1, r3
	beq	.L286
.L235:
	add	r3, r6, ip, asl #6
	cmp	r5, #0
	ldr	r4, [r3, #52]
	ble	.L238
	add	r3, sp, #16384
	ldr	r2, [r3, #868]
	mov	r1, #0
	b	.L240
.L241:
	cmp	r5, r1
	add	r2, r2, #8
	beq	.L238
.L240:
	ldr	r3, [r2, #4]
	add	r1, r1, #1
	cmp	ip, r3
	bne	.L241
	ldr	r3, [r2, #0]
	cmp	r4, r3
	bne	.L241
	mov	r1, #1
.L244:
	cmp	r4, #0
	ble	.L279
	add	r3, sp, #17152
	add	r3, r3, #60
	add	r2, r3, r4, asl #2
	ldr	r3, [r2, #-408]
	orrs	r1, r1, r3
	bne	.L279
	mov	r1, r7
	str	ip, [r2, #-812]
	str	r9, [r2, #-408]
	mov	r0, r4
	bl	addToBuffer(PLT)
	ldr	r2, .L288+12
	mov	r1, r9
	b	.L281
.L187:
	mov	r1, #0
	b	.L193
.L198:
	mov	r1, #0
	b	.L204
.L228:
	mov	r1, #0
	b	.L234
.L238:
	mov	r1, #0
	b	.L244
.L285:
	cmp	r5, #0
	ldr	r4, [r0, #28]
	ble	.L209
	add	r1, sp, #16384
	ldr	r2, [r1, #868]
	mov	r1, #0
	b	.L211
.L212:
	cmp	r5, r1
	add	r2, r2, #8
	beq	.L209
.L211:
	ldr	r3, [r2, #4]
	add	r1, r1, #1
	cmp	ip, r3
	bne	.L212
	ldr	r3, [r2, #0]
	cmp	r4, r3
	bne	.L212
	mov	r1, #1
	b	.L215
.L209:
	mov	r1, #0
.L215:
	cmp	r4, #0
	ble	.L216
	add	r3, sp, #17152
	add	r3, r3, #60
	add	r2, r3, r4, asl #2
	ldr	r3, [r2, #-408]
	orrs	r1, r1, r3
	beq	.L287
.L216:
	add	r3, r6, ip, asl #6
	cmp	r5, #0
	ldr	r4, [r3, #36]
	ble	.L219
	add	r3, sp, #16384
	ldr	r2, [r3, #868]
	mov	r1, #0
	b	.L221
.L222:
	cmp	r5, r1
	add	r2, r2, #8
	beq	.L219
.L221:
	ldr	r3, [r2, #4]
	add	r1, r1, #1
	cmp	ip, r3
	bne	.L222
	ldr	r3, [r2, #0]
	cmp	r4, r3
	bne	.L222
	mov	r1, #1
	b	.L225
.L219:
	mov	r1, #0
.L225:
	cmp	r4, #0
	ble	.L279
	add	r3, sp, #17152
	add	r3, r3, #60
	add	r2, r3, r4, asl #2
	ldr	r3, [r2, #-408]
	orrs	r1, r1, r3
	bne	.L279
	mov	r1, r7
	str	ip, [r2, #-812]
	str	r9, [r2, #-408]
	mov	r0, r4
	bl	addToBuffer(PLT)
	ldr	r2, .L288+16
	mov	r1, r9
	b	.L281
.L282:
	str	ip, [r2, #-812]
	mov	r1, r7
	str	r9, [r2, #-408]
	mov	r0, r4
	bl	addToBuffer(PLT)
	ldr	r2, .L288+20
	mov	r1, r9
	add	r2, sl, r2
	mov	r3, r4
	bl	bwassert(PLT)
	cmp	r8, r4
	beq	.L197
	add	r1, sp, #16384
	ldr	ip, [r1, #824]
	b	.L194
.L286:
	str	ip, [r2, #-812]
	mov	r1, r7
	str	r9, [r2, #-408]
	mov	r0, r4
	bl	addToBuffer(PLT)
	ldr	r2, .L288+24
	mov	r1, r9
	add	r2, sl, r2
	mov	r3, r4
	bl	bwassert(PLT)
	cmp	r8, r4
	beq	.L197
	add	r1, sp, #16384
	ldr	ip, [r1, #824]
	b	.L235
.L287:
	str	ip, [r2, #-812]
	mov	r1, r7
	str	r9, [r2, #-408]
	mov	r0, r4
	bl	addToBuffer(PLT)
	ldr	r2, .L288+28
	mov	r1, r9
	add	r2, sl, r2
	mov	r3, r4
	bl	bwassert(PLT)
	cmp	r8, r4
	beq	.L197
	add	r1, sp, #16384
	ldr	ip, [r1, #824]
	b	.L216
.L175:
	mov	r0, #0
	b	.L180
.L289:
	.align	2
.L288:
	.word	_GLOBAL_OFFSET_TABLE_-(.L280+8)
	.word	.LC83(GOTOFF)
	.word	.LC85(GOTOFF)
	.word	.LC89(GOTOFF)
	.word	.LC87(GOTOFF)
	.word	.LC84(GOTOFF)
	.word	.LC88(GOTOFF)
	.word	.LC86(GOTOFF)
	.size	getShortestPathPlus, .-getShortestPathPlus
	.section	.rodata.str1.4
	.align	2
.LC90:
	.ascii	"Shortest path, reversed from end to start:\015\012\000"
	.align	2
.LC91:
	.ascii	"%c%d%d <- \000"
	.align	2
.LC92:
	.ascii	"sw %d <- \000"
	.align	2
.LC93:
	.ascii	"multsw %d %d <- \000"
	.align	2
.LC94:
	.ascii	"%c%d%d\015\012\015\012\000"
	.text
	.align	2
	.global	getShortestPath
	.type	getShortestPath, %function
getShortestPath:
	@ args = 4, pretend = 0, frame = 16816
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L364
	sub	sp, sp, #16640
	sub	sp, sp, #180
	cmp	r2, #0
	cmpgt	r1, #0
.L352:
	add	sl, pc, sl
	str	r1, [sp, #8]
	mov	r9, r2
	movgt	r4, #0
	movle	r4, #1
	mov	r8, r0
	str	r3, [sp, #4]
	ble	.L291
	cmp	r1, r2
	beq	.L355
	add	r7, sp, #180
	add	r2, sp, #16384
	sub	r7, r7, #168
	mov	r0, r7
	str	r4, [r2, #432]
	bl	circularBufferInit(PLT)
	add	r3, sp, #16384
	str	r4, [r3, #428]
	ldr	r3, [r3, #428]
	add	ip, sp, #16384
	cmp	r3, #100
	str	r4, [ip, #424]
	ble	.L356
.L296:
	mov	r1, r7
	ldr	r0, [sp, #8]
	bl	addToBuffer(PLT)
	ldr	r2, .L364+4
	add	ip, sp, #16384
	ldr	r3, [ip, #428]
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	add	fp, sp, #16640
	add	fp, fp, #168
.L354:
	mov	r0, fp
	mov	r1, r7
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	beq	.L291
.L357:
	add	r0, sp, #16384
	ldr	r1, [r0, #424]
	mov	r3, r1, asl #6
	ldr	r4, [r8, r3]
	add	r0, r8, r3
	cmp	r4, #0
	bne	.L300
	ldr	r4, [r0, #16]
	cmp	r4, #0
	ble	.L354
	add	r3, sp, #16640
	add	r3, r3, #180
	add	r2, r3, r4, asl #2
	ldr	r3, [r2, #-416]
	cmp	r3, #0
	bgt	.L354
	cmp	r9, r4
	str	r1, [r2, #-416]
	beq	.L304
	mov	r1, r7
	mov	r0, r4
	bl	addToBuffer(PLT)
	ldr	r2, .L364+8
	mov	r3, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r0, fp
	mov	r1, r7
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	bne	.L357
.L291:
	mov	r0, #0
.L295:
	add	sp, sp, #436
	add	sp, sp, #16384
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L355:
	str	r1, [r3, #0]
	add	r1, sp, #16384
	mov	ip, #1
	ldr	r1, [r1, #472]
	mov	r0, ip
	str	ip, [r1, #0]
	b	.L295
.L300:
	cmp	r4, #1
	beq	.L358
	ldr	r4, [r0, #44]
	ldr	r5, [r0, #52]
	cmp	r4, #0
	ble	.L315
	add	r3, sp, #16640
	add	r3, r3, #180
	add	r2, r3, r4, asl #2
	ldr	r3, [r2, #-416]
	cmp	r3, #0
	ble	.L359
.L315:
	cmp	r5, #0
	ble	.L354
	add	ip, sp, #16640
	add	ip, ip, #180
	add	r2, ip, r5, asl #2
	ldr	r3, [r2, #-416]
	cmp	r3, #0
	bgt	.L354
	add	r0, sp, #16384
	ldr	r3, [r0, #424]
	cmp	r9, r5
	str	r3, [r2, #-416]
	beq	.L304
	mov	r1, r7
	mov	r0, r5
	bl	addToBuffer(PLT)
	ldr	r2, .L364+12
	mov	r3, r5
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	b	.L354
.L358:
	ldr	r5, [r0, #28]
	ldr	r6, [r0, #36]
	cmp	r5, #0
	ble	.L308
	add	ip, sp, #16640
	add	ip, ip, #180
	add	r2, ip, r5, asl #2
	ldr	r3, [r2, #-416]
	cmp	r3, #0
	ble	.L360
.L308:
	cmp	r6, #0
	ble	.L354
	add	r0, sp, #16640
	add	r0, r0, #180
	add	r2, r0, r6, asl #2
	ldr	r3, [r2, #-416]
	cmp	r3, #0
	bgt	.L354
	add	r1, sp, #16384
	ldr	r3, [r1, #424]
	cmp	r9, r6
	str	r3, [r2, #-416]
	beq	.L304
	mov	r1, r7
	mov	r0, r6
	bl	addToBuffer(PLT)
	ldr	r2, .L364+16
	mov	r3, r6
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	b	.L354
.L359:
	cmp	r9, r4
	str	r1, [r2, #-416]
	beq	.L304
	mov	r1, r7
	mov	r0, r4
	bl	addToBuffer(PLT)
	ldr	r2, .L364+20
	mov	r3, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	b	.L315
.L360:
	cmp	r9, r5
	str	r1, [r2, #-416]
	beq	.L304
	mov	r1, r7
	mov	r0, r5
	bl	addToBuffer(PLT)
	ldr	r2, .L364+24
	mov	r1, r4
	add	r2, sl, r2
	mov	r3, r5
	bl	bwassert(PLT)
	b	.L308
.L356:
	mov	r0, r4
.L297:
	add	r1, sp, #16384
	ldr	r2, [r1, #428]
	add	ip, sp, #16640
	ldr	r3, [r1, #428]
	add	ip, ip, #180
	add	r1, ip, r2, asl #2
	add	r3, r3, #1
	add	r2, sp, #16384
	str	r3, [r2, #428]
	ldr	r2, [r2, #428]
	str	r0, [r1, #-416]
	cmp	r2, #100
	ble	.L297
	b	.L296
.L304:
	add	r1, sp, #16384
	str	r9, [r1, #428]
	ldr	r3, [r1, #428]
	ldr	r2, [sp, #8]
	mov	ip, #0
	cmp	r2, r3
	ldr	r3, [r1, #472]
	str	ip, [r3, #0]
	beq	.L341
.L344:
	add	r0, sp, #16384
	ldr	r2, [r0, #428]
	ldr	r3, [sp, #4]
	ldr	r1, [r0, #428]
	str	r2, [r3, ip, asl #2]
	add	ip, sp, #16640
	add	ip, ip, #180
	add	r3, ip, r1, asl #2
	ldr	r2, [r3, #-416]
	ldr	r0, [r0, #472]
	add	r1, sp, #16384
	ldr	ip, [r0, #0]
	str	r2, [r1, #428]
	ldr	r3, [r1, #428]
	ldr	r2, [sp, #8]
	add	ip, ip, #1
	cmp	r3, r2
	str	ip, [r0, #0]
	bne	.L344
	mov	r1, r2
.L322:
	ldr	r0, [sp, #4]
	add	r2, sp, #16384
	ldr	r2, [r2, #472]
	str	r1, [r0, ip, asl #2]
	add	ip, sp, #16384
	ldr	r3, [r2, #0]
	ldr	r2, [ip, #432]
	ldr	r0, [ip, #472]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r0, #0]
	moveq	r0, #1
	beq	.L295
.L361:
	ldr	r1, .L364+28
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	add	r1, sp, #16384
	str	r9, [r1, #428]
	ldr	r3, [r1, #428]
	ldr	r2, [sp, #8]
	cmp	r2, r3
	moveq	r3, r2
	beq	.L326
	ldr	r8, .L364+32
	ldr	r7, .L364+36
	b	.L327
.L328:
	add	ip, sp, #16384
	ldr	r3, [ip, #428]
	ldr	r1, .L364+40
	cmp	r3, #97
	mov	r0, #1
	add	r1, sl, r1
	ble	.L362
	add	r0, sp, #16384
	ldr	r2, [r0, #428]
	ldr	r3, [r0, #428]
	cmp	r2, #99
	ldr	r1, .L364+44
	movne	r2, #155
	moveq	r2, #153
	cmp	r3, #99
	movne	r3, #156
	moveq	r3, #154
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
.L330:
	add	r1, sp, #16384
	ldr	r3, [r1, #428]
	add	ip, sp, #16640
	add	ip, ip, #180
	add	r2, ip, r3, asl #2
	ldr	r1, [r2, #-416]
	add	r0, sp, #16384
	str	r1, [r0, #428]
	ldr	r3, [r0, #428]
	ldr	r1, [sp, #8]
	cmp	r1, r3
	beq	.L363
.L327:
	add	ip, sp, #16384
	ldr	r3, [ip, #428]
	mov	r0, #1
	cmp	r3, #80
	add	r1, sl, r7
	bgt	.L328
	ldr	r4, [ip, #428]
	ldr	r3, [ip, #428]
	ldr	ip, [ip, #428]
	sub	r3, r3, #1
	sub	ip, ip, #1
	mov	r2, ip, asr #31
	mov	r2, r2, lsr #28
	add	ip, ip, r2
	mov	lr, r3, asr #31
	mov	lr, lr, lsr #28
	and	ip, ip, #15
	rsb	ip, r2, ip
	add	r3, r3, lr
	add	ip, ip, r0
	and	r3, r3, #15
	smull	r2, r5, r8, ip
	rsb	r3, lr, r3
	add	r3, r3, r0
	smull	r2, r6, r8, r3
	mov	lr, ip, asr #31
	subs	r2, r4, #1
	addmi	r2, r4, #14
	rsb	lr, lr, r5, asr #2
	add	lr, lr, lr, asl #2
	mov	r2, r2, asr #4
	mov	r3, r3, asr #31
	sub	ip, ip, lr, asl #1
	rsb	r3, r3, r6, asr #2
	add	r2, r2, #65
	str	ip, [sp, #0]
	bl	bwprintf(PLT)
	b	.L330
.L341:
	add	r3, sp, #16384
	ldr	r3, [r3, #472]
	ldr	r1, [sp, #8]
	ldr	ip, [r3, #0]
	b	.L322
.L362:
	ldr	r2, [ip, #428]
	sub	r2, r2, #80
	bl	bwprintf(PLT)
	b	.L330
.L363:
	mov	r3, r1
.L326:
	sub	r2, r3, #1
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #28
	add	ip, r2, r3
	and	ip, ip, #15
	rsb	ip, r3, ip
	ldr	r3, .L364+32
	add	ip, ip, #1
	smull	r0, r1, r3, ip
	mov	r3, ip, asr #31
	ldr	r0, [sp, #8]
	rsb	r3, r3, r1, asr #2
	cmp	r2, #0
	add	r1, r3, r3, asl #2
	addlt	r2, r0, #14
	sub	ip, ip, r1, asl #1
	ldr	r1, .L364+48
	mov	r2, r2, asr #4
	mov	r0, #1
	add	r1, sl, r1
	add	r2, r2, #65
	str	ip, [sp, #0]
	bl	bwprintf(PLT)
	mov	r0, #1
	b	.L295
.L365:
	.align	2
.L364:
	.word	_GLOBAL_OFFSET_TABLE_-(.L352+8)
	.word	.LC83(GOTOFF)
	.word	.LC85(GOTOFF)
	.word	.LC89(GOTOFF)
	.word	.LC87(GOTOFF)
	.word	.LC88(GOTOFF)
	.word	.LC86(GOTOFF)
	.word	.LC90(GOTOFF)
	.word	1717986919
	.word	.LC91(GOTOFF)
	.word	.LC92(GOTOFF)
	.word	.LC93(GOTOFF)
	.word	.LC94(GOTOFF)
	.size	getShortestPath, .-getShortestPath
	.section	.rodata.str1.4
	.align	2
.LC95:
	.ascii	"Beginning Djikstra find SensorStart %c%d%d.\015\012"
	.ascii	"\000"
	.align	2
.LC96:
	.ascii	"Selected node %c%d%d[weight:%d].\015\012\000"
	.align	2
.LC97:
	.ascii	"Selected node %d[weight:%d].\015\012\000"
	.align	2
.LC98:
	.ascii	"Selected node [multiswitch] %d[weight:%d].\015\012\000"
	.align	2
.LC99:
	.ascii	"Invalid index %d.\015\012\000"
	.align	2
.LC100:
	.ascii	"Arrived at %c%d%d. Breaking...\015\012\000"
	.align	2
.LC101:
	.ascii	"<getShortestPathDjikstra> Invalid node type[2].\000"
	.align	2
.LC102:
	.ascii	"prevSwitch stack full.\015\012\000"
	.align	2
.LC103:
	.ascii	"<getShortestPathDjikstra> Invalid node type[1].\000"
	.align	2
.LC104:
	.ascii	"\015\012\000"
	.align	2
.LC105:
	.ascii	"%d \000"
	.align	2
.LC106:
	.ascii	"i=%d\015\012\000"
	.text
	.align	2
	.global	getShortestPathDjikstra
	.type	getShortestPathDjikstra, %function
getShortestPathDjikstra:
	@ args = 4, pretend = 0, frame = 1644
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #1648
	sub	sp, sp, #4
	cmp	r1, #0
	movgt	r5, #0
	movle	r5, #1
	ldr	sl, .L495
	str	r2, [sp, #16]
	cmp	r2, #0
	movgt	r2, r5
	orrle	r2, r5, #1
	cmp	r2, #0
.L476:
	add	sl, pc, sl
	mov	fp, r1
	str	r0, [sp, #20]
	str	r3, [sp, #12]
	bne	.L367
	ldr	r0, [sp, #16]
	cmp	r1, r0
	beq	.L479
	str	r2, [sp, #1648]
	str	r2, [sp, #1644]
	ldr	r3, [sp, #1644]
	cmp	r3, #100
	bgt	.L372
	mov	r8, r2
	mvn	r6, #-2147483648
	mvn	r7, #0
.L373:
	ldr	r2, [sp, #1644]
	ldr	r1, [sp, #1644]
	ldr	ip, [sp, #1644]
	ldr	lr, [sp, #1644]
	ldr	r3, [sp, #1644]
	add	r0, sp, #1648
	add	r3, r3, #1
	add	r0, r0, #4
	str	r3, [sp, #1644]
	add	r4, r0, r2, asl #2
	ldr	r2, [sp, #1644]
	add	r0, r0, r1, asl #2
	cmp	r2, #100
	add	r2, sp, #1648
	add	r2, r2, #4
	add	r1, r2, ip, asl #2
	mov	r3, #1
	add	r2, r2, lr, asl #2
	str	r3, [r2, #-1620]
	str	r6, [r4, #-812]
	str	r7, [r0, #-1216]
	str	r8, [r1, #-408]
	ble	.L373
.L372:
	ldr	r3, [sp, #1648]
	add	ip, sp, #1648
	add	ip, ip, #4
	add	r1, ip, fp, asl #2
	mov	r2, #0
	cmp	r3, #0
	str	r2, [r1, #-812]
	bne	.L480
	cmp	r5, #0
	moveq	r9, r5
	moveq	r4, fp
	bne	.L367
.L377:
	subs	r6, r4, #1
	mov	r2, r6, asr #31
	mov	r2, r2, lsr #28
	add	r3, r6, r2
	and	r3, r3, #15
	rsb	r3, r2, r3
	ldr	r1, .L495+4
	add	r3, r3, #1
	smull	r2, r0, r1, r3
	add	ip, r4, #14
	mov	r2, r3, asr #31
	mov	r1, ip
	rsb	r7, r2, r0, asr #2
	movpl	r1, r6
	mov	r1, r1, asr #4
	add	r2, r7, r7, asl #2
	ldr	r0, [sp, #20]
	sub	r3, r3, r2, asl #1
	add	r1, r1, #65
	str	ip, [sp, #8]
	str	r3, [sp, #24]
	str	r1, [sp, #28]
	add	r5, r0, r4, asl #6
	mov	r8, r4, asl #2
.L380:
	ldr	r3, [sp, #1648]
	cmp	r3, #0
	beq	.L381
	cmp	r4, #80
	ble	.L481
	cmp	r4, #98
	ble	.L482
	cmp	r4, #100
	bgt	.L387
	add	r1, sp, #1648
	add	r1, r1, #4
	add	r2, r8, r1
	ldr	r1, .L495+8
.L477:
	ldr	r3, [r2, #-1620]
	add	r1, sl, r1
	mov	r0, #1
	sub	r2, r4, #80
	bl	bwprintf(PLT)
.L381:
	ldr	r2, [sp, #16]
	add	r3, sp, #1648
	add	r3, r3, #4
	add	lr, r8, r3
	mov	r0, #0
	cmp	r2, r4
	str	r0, [lr, #-1620]
	beq	.L483
.L389:
	ldr	ip, [r5, #0]
	cmp	ip, #1
	beq	.L395
	bcc	.L394
	cmp	ip, #2
	beq	.L484
	ldr	r2, .L495+12
	mov	r1, #1
	add	r2, sl, r2
	bl	bwassert(PLT)
	ldr	ip, [r5, #0]
.L397:
	cmp	ip, #1
	beq	.L408
.L463:
	bcc	.L407
	cmp	ip, #2
	beq	.L485
	ldr	r2, .L495+16
	mov	r0, #0
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	b	.L380
.L395:
	ldr	r3, [r5, #28]
	add	r2, sp, #1648
	add	r2, r2, #4
	ldr	r0, [lr, #-812]
	add	r1, r2, r3, asl #2
	ldr	r2, [r5, #32]
	ldr	r3, [r1, #-812]
	add	r2, r0, r2
	cmp	r2, r3
	strlt	r2, [r1, #-812]
	strlt	r4, [r1, #-1216]
	ldr	r3, [r5, #36]
	add	ip, sp, #1648
	add	ip, ip, #4
	ldrlt	r0, [lr, #-812]
	ldr	r1, [r5, #40]
	add	r3, ip, r3, asl #2
	ldr	r2, [r3, #-812]
	add	r1, r0, r1
	cmp	r1, r2
	strlt	r1, [r3, #-812]
	strlt	r4, [r3, #-1216]
.L408:
	ldr	r0, [r5, #28]
	add	r1, sp, #1648
	add	r1, r1, #4
	add	r3, r1, r0, asl #2
	ldr	r2, [r3, #-1620]
	cmp	r2, #0
	beq	.L412
	ldr	r3, [r5, #36]
	add	r2, r1, r3, asl #2
	ldr	r1, [r2, #-1620]
	cmp	r1, #0
	bne	.L486
.L378:
	mov	r4, r0
.L379:
	cmp	r4, #0
	bgt	.L377
.L367:
	mov	r0, #0
.L371:
	add	sp, sp, #628
	add	sp, sp, #1024
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L394:
	ldr	r2, [r5, #16]
	cmn	r2, #1
	beq	.L397
	add	r1, sp, #1648
	add	r1, r1, #4
	add	r0, r1, r2, asl #2
	ldr	r3, [lr, #-812]
	ldr	r2, [r5, #20]
	ldr	r1, [r0, #-812]
	add	r3, r3, r2
	cmp	r3, r1
	strlt	r3, [r0, #-812]
	strlt	r4, [r0, #-1216]
	b	.L397
.L407:
	ldr	r4, [r5, #16]
	cmn	r4, #1
	bne	.L379
	cmp	r9, #0
	ble	.L367
	add	ip, sp, #1648
	sub	r9, r9, #1
	add	ip, ip, #4
	add	r3, ip, r9, asl #2
	ldr	r4, [r3, #-408]
	b	.L379
.L412:
	ldr	r4, [r5, #36]
	add	r0, sp, #1648
	add	r0, r0, #4
	add	r3, r0, r4, asl #2
	ldr	r2, [r3, #-1620]
	cmp	r2, #0
	bne	.L379
	cmp	r9, #0
	ble	.L367
	sub	r9, r9, #1
	add	r3, r0, r9, asl #2
	ldr	r4, [r3, #-408]
	b	.L379
.L481:
	add	r1, sp, #1648
	add	r1, r1, #4
	add	r3, r8, r1
	ldr	ip, [r3, #-1620]
	ldr	r1, .L495+20
	str	ip, [sp, #4]
	ldr	ip, [sp, #24]
	mov	r0, #1
	ldr	r2, [sp, #28]
	mov	r3, r7
	add	r1, sl, r1
	str	ip, [sp, #0]
	bl	bwprintf(PLT)
	ldr	r2, [sp, #16]
	add	r3, sp, #1648
	add	r3, r3, #4
	add	lr, r8, r3
	mov	r0, #0
	cmp	r2, r4
	str	r0, [lr, #-1620]
	bne	.L389
.L483:
	ldr	r3, [sp, #1648]
	cmp	r3, r0
	beq	.L391
	mov	r3, r6, asr #31
	mov	r3, r3, lsr #28
	add	ip, r6, r3
	and	ip, ip, #15
	rsb	ip, r3, ip
	ldr	r0, .L495+4
	add	ip, ip, #1
	smull	r2, r1, r0, ip
	mov	r3, ip, asr #31
	rsb	r3, r3, r1, asr #2
	ldr	r2, [sp, #8]
	add	r1, r3, r3, asl #2
	cmp	r6, #0
	sub	ip, ip, r1, asl #1
	movge	r2, r6
	ldr	r1, .L495+24
	mov	r2, r2, asr #4
	add	r1, sl, r1
	add	r2, r2, #65
	mov	r0, #1
	str	ip, [sp, #0]
	bl	bwprintf(PLT)
.L391:
	ldr	r3, [sp, #1648]
	cmp	r3, #0
	beq	.L426
	mov	r3, #0
	str	r3, [sp, #1644]
	ldr	r2, [sp, #1644]
	cmp	r2, #100
	bgt	.L426
	ldr	r6, .L495+28
	ldr	r5, .L495+32
	b	.L428
.L486:
	ldr	r2, .L495+36
	cmp	r9, #99
	movgt	r0, #0
	movle	r0, #1
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	add	ip, sp, #1648
	ldr	r1, [r5, #32]
	ldr	r3, [r5, #40]
	add	ip, ip, #4
	add	r2, ip, r9, asl #2
	cmp	r1, r3
	str	r4, [r2, #-408]
	add	r9, r9, #1
	ldrge	r4, [r5, #36]
	ldrlt	r4, [r5, #28]
	b	.L379
.L387:
	ldr	r1, .L495+40
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, r4
	bl	bwprintf(PLT)
	b	.L381
.L484:
	ldr	r3, [r5, #44]
	add	r2, sp, #1648
	add	r2, r2, #4
	add	r1, r2, r3, asl #2
	ldr	r0, [lr, #-812]
	ldr	r2, [r5, #48]
	ldr	r3, [r1, #-812]
	add	r2, r0, r2
	cmp	r2, r3
	strlt	r2, [r1, #-812]
	strlt	r4, [r1, #-1216]
	ldr	r3, [r5, #52]
	add	r2, sp, #1648
	add	r2, r2, #4
	ldrlt	r0, [lr, #-812]
	ldr	r1, [r5, #56]
	add	r3, r2, r3, asl #2
	ldr	r2, [r3, #-812]
	add	r1, r0, r1
	cmp	r1, r2
	bge	.L465
	cmp	ip, #1
	str	r1, [r3, #-812]
	str	r4, [r3, #-1216]
	b	.L463
.L482:
	add	r0, sp, #1648
	add	r0, r0, #4
	ldr	r1, .L495+44
	add	r2, r8, r0
	b	.L477
.L485:
	ldr	r0, [r5, #44]
	add	r1, sp, #1648
	add	r1, r1, #4
	add	r3, r1, r0, asl #2
	ldr	r2, [r3, #-1620]
	cmp	r2, #0
	beq	.L420
	ldr	r3, [r5, #52]
	add	r2, r1, r3, asl #2
	ldr	r1, [r2, #-1620]
	cmp	r1, #0
	beq	.L378
	ldr	r2, .L495+36
	cmp	r9, #99
	movgt	r0, #0
	movle	r0, #1
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	add	ip, sp, #1648
	ldr	r1, [r5, #48]
	ldr	r3, [r5, #56]
	add	ip, ip, #4
	add	r2, ip, r9, asl #2
	cmp	r1, r3
	str	r4, [r2, #-408]
	add	r9, r9, #1
	ldrge	r4, [r5, #52]
	ldrlt	r4, [r5, #44]
	b	.L379
.L479:
	add	r2, r2, #1
	str	r1, [r3, #0]
	ldr	r1, [sp, #1688]
	mov	r0, r2
	str	r2, [r1, #0]
	b	.L371
.L465:
	cmp	ip, #1
	b	.L463
.L420:
	cmp	r9, #0
	ble	.L367
	add	r0, sp, #1648
	sub	r9, r9, #1
	add	r0, r0, #4
	add	r3, r0, r9, asl #2
	ldr	r4, [r3, #-408]
	b	.L379
.L480:
	sub	r2, fp, #1
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #28
	add	ip, r2, r3
	and	ip, ip, #15
	rsb	ip, r3, ip
	ldr	r3, .L495+4
	add	ip, ip, #1
	smull	r0, r1, r3, ip
	mov	r3, ip, asr #31
	rsb	r3, r3, r1, asr #2
	cmp	r2, #0
	add	r1, r3, r3, asl #2
	addlt	r2, fp, #14
	sub	ip, ip, r1, asl #1
	ldr	r1, .L495+48
	mov	r2, r2, asr #4
	add	r1, sl, r1
	add	r2, r2, #65
	mov	r0, #1
	str	ip, [sp, #0]
	bl	bwprintf(PLT)
	cmp	r5, #0
	moveq	r9, r5
	moveq	r4, fp
	beq	.L377
	b	.L367
.L493:
	bl	bwprintf(PLT)
.L429:
	ldr	r3, [sp, #1644]
	add	r1, sp, #1648
	add	r1, r1, #4
	add	ip, r1, r3, asl #2
	ldr	r2, [ip, #-812]
	mov	r0, #1
	add	r1, sl, r6
	bl	bwprintf(PLT)
	ldr	r3, [sp, #1644]
	add	r3, r3, #1
	str	r3, [sp, #1644]
	ldr	r2, [sp, #1644]
	cmp	r2, #100
	bgt	.L426
.L428:
	ldr	r3, [sp, #1644]
	mov	r0, #1
	tst	r3, #15
	add	r1, sl, r5
	bne	.L429
	b	.L493
.L426:
	ldr	r3, [sp, #1648]
	cmp	r3, #0
	beq	.L431
	mov	r3, #0
	str	r3, [sp, #1644]
	ldr	r2, [sp, #1644]
	cmp	r2, #100
	bgt	.L431
	ldr	r6, .L495+28
	ldr	r5, .L495+32
	b	.L433
.L494:
	bl	bwprintf(PLT)
.L434:
	ldr	r3, [sp, #1644]
	add	r2, sp, #1648
	add	r2, r2, #4
	add	ip, r2, r3, asl #2
	ldr	r2, [ip, #-1216]
	mov	r0, #1
	add	r1, sl, r6
	bl	bwprintf(PLT)
	ldr	r3, [sp, #1644]
	add	r3, r3, #1
	str	r3, [sp, #1644]
	ldr	r2, [sp, #1644]
	cmp	r2, #100
	bgt	.L431
.L433:
	ldr	r3, [sp, #1644]
	mov	r0, #1
	tst	r3, #15
	add	r1, sl, r5
	bne	.L434
	b	.L494
.L431:
	str	r4, [sp, #1644]
	ldr	r3, [sp, #1644]
	mov	r2, #0
	cmp	fp, r3
	ldr	r3, [sp, #1688]
	str	r2, [r3, #0]
	beq	.L437
	ldr	r3, [sp, #1644]
	cmp	r3, #0
	bge	.L466
	b	.L440
.L441:
	ldr	r1, [sp, #1688]
	ldr	r0, [sp, #1644]
	ldr	ip, [r1, #0]
	ldr	r3, [sp, #1644]
	add	r1, sp, #1648
	add	r1, r1, #4
	add	r2, r1, r3, asl #2
	ldr	r1, [r2, #-1216]
	ldr	r2, [sp, #12]
	str	r0, [r2, ip, asl #2]
	ldr	ip, [sp, #1688]
	str	r1, [sp, #1644]
	ldr	r3, [sp, #1644]
	ldr	r2, [ip, #0]
	cmp	fp, r3
	add	r2, r2, #1
	str	r2, [ip, #0]
	beq	.L437
	ldr	r3, [sp, #1644]
	cmp	r3, #0
	blt	.L490
.L466:
	ldr	r3, [sp, #1648]
	ldr	r1, .L495+52
	cmp	r3, #0
	add	r1, sl, r1
	mov	r0, #1
	beq	.L441
	ldr	r2, [sp, #1644]
	bl	bwprintf(PLT)
	b	.L441
.L437:
	ldr	r0, [sp, #12]
	ldr	r1, [sp, #1688]
	str	fp, [r0, r2, asl #2]
	ldr	r3, [r1, #0]
	ldr	r2, [sp, #1648]
	add	r3, r3, #1
	cmp	r2, #0
	str	r3, [r1, #0]
	bne	.L491
.L478:
	mov	r0, #1
	b	.L371
.L490:
.L440:
.L475:
	b	.L475
.L491:
	ldr	r1, .L495+56
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	str	r4, [sp, #1644]
	ldr	r3, [sp, #1644]
	cmp	fp, r3
	beq	.L445
	ldr	r8, .L495+4
	ldr	r7, .L495+60
	b	.L446
.L447:
	ldr	r3, [sp, #1644]
	ldr	r1, .L495+64
	cmp	r3, #97
	mov	r0, #1
	add	r1, sl, r1
	ble	.L492
	ldr	r2, [sp, #1644]
	ldr	r3, [sp, #1644]
	cmp	r2, #99
	ldr	r1, .L495+68
	movne	r2, #155
	moveq	r2, #153
	cmp	r3, #99
	movne	r3, #156
	moveq	r3, #154
	add	r1, sl, r1
	mov	r0, #1
	bl	bwprintf(PLT)
.L449:
	ldr	r3, [sp, #1644]
	add	ip, sp, #1648
	add	ip, ip, #4
	add	r2, ip, r3, asl #2
	ldr	r1, [r2, #-1216]
	str	r1, [sp, #1644]
	ldr	r3, [sp, #1644]
	cmp	fp, r3
	beq	.L445
.L446:
	ldr	r3, [sp, #1644]
	mov	r0, #1
	cmp	r3, #80
	add	r1, sl, r7
	bgt	.L447
	ldr	r4, [sp, #1644]
	ldr	r3, [sp, #1644]
	ldr	ip, [sp, #1644]
	sub	r3, r3, #1
	sub	ip, ip, #1
	mov	r2, ip, asr #31
	mov	r2, r2, lsr #28
	add	ip, ip, r2
	mov	lr, r3, asr #31
	mov	lr, lr, lsr #28
	and	ip, ip, #15
	rsb	ip, r2, ip
	add	r3, r3, lr
	add	ip, ip, r0
	and	r3, r3, #15
	smull	r2, r5, r8, ip
	rsb	r3, lr, r3
	add	r3, r3, r0
	smull	r2, r6, r8, r3
	mov	lr, ip, asr #31
	subs	r2, r4, #1
	addmi	r2, r4, #14
	rsb	lr, lr, r5, asr #2
	add	lr, lr, lr, asl #2
	mov	r2, r2, asr #4
	mov	r3, r3, asr #31
	sub	ip, ip, lr, asl #1
	rsb	r3, r3, r6, asr #2
	add	r2, r2, #65
	str	ip, [sp, #0]
	bl	bwprintf(PLT)
	b	.L449
.L492:
	ldr	r2, [sp, #1644]
	sub	r2, r2, #80
	bl	bwprintf(PLT)
	b	.L449
.L445:
	sub	r2, fp, #1
	mov	r3, r2, asr #31
	mov	r3, r3, lsr #28
	add	ip, r2, r3
	and	ip, ip, #15
	rsb	ip, r3, ip
	ldr	r3, .L495+4
	add	ip, ip, #1
	smull	r0, r1, r3, ip
	mov	r3, ip, asr #31
	rsb	r3, r3, r1, asr #2
	cmp	r2, #0
	add	r1, r3, r3, asl #2
	sub	ip, ip, r1, asl #1
	addlt	r2, fp, #14
	ldr	r1, .L495+72
	mov	r2, r2, asr #4
	add	r1, sl, r1
	add	r2, r2, #65
	mov	r0, #1
	str	ip, [sp, #0]
	bl	bwprintf(PLT)
	b	.L478
.L496:
	.align	2
.L495:
	.word	_GLOBAL_OFFSET_TABLE_-(.L476+8)
	.word	1717986919
	.word	.LC98(GOTOFF)
	.word	.LC101(GOTOFF)
	.word	.LC103(GOTOFF)
	.word	.LC96(GOTOFF)
	.word	.LC100(GOTOFF)
	.word	.LC105(GOTOFF)
	.word	.LC104(GOTOFF)
	.word	.LC102(GOTOFF)
	.word	.LC99(GOTOFF)
	.word	.LC97(GOTOFF)
	.word	.LC95(GOTOFF)
	.word	.LC106(GOTOFF)
	.word	.LC90(GOTOFF)
	.word	.LC91(GOTOFF)
	.word	.LC92(GOTOFF)
	.word	.LC93(GOTOFF)
	.word	.LC94(GOTOFF)
	.size	getShortestPathDjikstra, .-getShortestPathDjikstra
	.ident	"GCC: (GNU) 4.0.2"
