	.file	"k2.c"
	.text
	.align	2
	.global	strlength
	.type	strlength, %function
strlength:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #4
	add	r1, sp, #4
	mov	r3, #0
	str	r3, [r1, #-4]!
	mov	r1, sp
	bl	pkstrlen(PLT)
	ldr	r0, [sp, #0]
	add	r0, r0, #1
	add	sp, sp, #4
	ldmfd	sp!, {pc}
	.size	strlength, .-strlength
	.align	2
	.global	strequal
	.type	strequal, %function
strequal:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	b	pkstreql(PLT)
	.size	strequal, .-strequal
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\015\012\015\012\015\012\015\012ROCK, PAPER & SCISS"
	.ascii	"ORS\015\012By: Paily & Karsh\015\012\015\012\000"
	.align	2
.LC1:
	.ascii	"ERROR: Task %d returned the following code: %d\015\012"
	.ascii	"\000"
	.align	2
.LC2:
	.ascii	"signup\000"
	.align	2
.LC3:
	.ascii	"fail\000"
	.align	2
.LC4:
	.ascii	"COULD NOT ADD %d, BUFFER IS FULL.\000"
	.align	2
.LC5:
	.ascii	"Referee: TID <%d> has been added to the game waitli"
	.ascii	"st.\015\012\000"
	.align	2
.LC6:
	.ascii	"rock\000"
	.align	2
.LC7:
	.ascii	"paper\000"
	.align	2
.LC8:
	.ascii	"scissors\000"
	.align	2
.LC9:
	.ascii	"quit\000"
	.align	2
.LC10:
	.ascii	"\015\012Referee: Referee: TID <%d> quits.\015\012\000"
	.align	2
.LC11:
	.ascii	"success\000"
	.align	2
.LC12:
	.ascii	"Referee: Informing TID <%d> that his/her/it's partn"
	.ascii	"er quit and kick them out.\015\012\000"
	.align	2
.LC13:
	.ascii	"\015\012Referee: TID <%d> quits.\015\012\000"
	.align	2
.LC14:
	.ascii	"Referee: TID <%d> enters the game.\015\012\000"
	.align	2
.LC15:
	.ascii	"Referee: No more players in the game. Quitting...\015"
	.ascii	"\012\000"
	.align	2
.LC16:
	.ascii	"\015\012GAME:\015\012\000"
	.align	2
.LC17:
	.ascii	"    TID <%d> chooses %s.\015\012\000"
	.align	2
.LC18:
	.ascii	"RESULT: Tie!.\015\012\000"
	.align	2
.LC19:
	.ascii	"tie\000"
	.align	2
.LC20:
	.ascii	"RESULT: TID <%d> wins!.\015\012\000"
	.align	2
.LC21:
	.ascii	"win\000"
	.align	2
.LC22:
	.ascii	"lose\000"
	.align	2
.LC23:
	.ascii	"Referee: Press any key to continue...\015\012\000"
	.text
	.align	2
	.global	referee
	.type	referee, %function
referee:
	@ args = 0, pretend = 0, frame = 332
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L117
	ldr	r1, .L117+4
	sub	sp, sp, #332
.L106:
	add	sl, pc, sl
	add	r2, sp, #112
	add	r1, sl, r1
	mov	r0, #1
	str	r2, [sp, #88]
	bl	bwprintf(PLT)
	ldr	r0, [sp, #88]
	bl	circularBufferInit(PLT)
	ldr	ip, .L117+8
	ldr	r0, .L117+12
	ldr	r1, .L117+16
	ldr	r2, .L117+20
	str	ip, [sp, #32]
	ldr	ip, .L117+24
	str	r0, [sp, #28]
	str	r1, [sp, #24]
	ldr	r0, .L117+28
	ldr	r1, .L117+32
	str	r2, [sp, #20]
	str	ip, [sp, #16]
	ldr	r2, .L117+36
	ldr	ip, .L117+40
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	ldr	r0, .L117+44
	ldr	r1, .L117+48
	str	r2, [sp, #4]
	str	ip, [sp, #0]
	ldr	r2, .L117+52
	ldr	ip, .L117+56
	str	r0, [sp, #84]
	str	r1, [sp, #80]
	ldr	r0, .L117+60
	ldr	r1, .L117+64
	str	r2, [sp, #76]
	str	ip, [sp, #72]
	ldr	r2, .L117+68
	ldr	ip, .L117+72
	str	r0, [sp, #68]
	str	r1, [sp, #64]
	ldr	r0, .L117+76
	ldr	r1, .L117+80
	str	r2, [sp, #60]
	str	ip, [sp, #56]
	ldr	r2, .L117+84
	ldr	ip, .L117+88
	mov	r3, #0
	str	r0, [sp, #52]
	str	r1, [sp, #48]
	ldr	r0, .L117+92
	ldr	r1, .L117+96
	mvn	r6, #0
	str	r3, [sp, #316]
	mov	r8, r3
	str	r2, [sp, #104]
	str	ip, [sp, #100]
	str	r3, [sp, #312]
	mov	r7, r3
	add	r2, sp, #320
	add	r3, sp, #328
	add	ip, sp, #324
	str	r0, [sp, #96]
	str	r1, [sp, #92]
	str	r6, [sp, #320]
	str	r6, [sp, #328]
	str	r6, [sp, #324]
	str	r2, [sp, #44]
	add	r9, sp, #248
	str	r3, [sp, #36]
	str	ip, [sp, #40]
.L109:
	mov	r2, #0
	str	r2, [sp, #316]
	ldr	r3, [sp, #316]
	cmp	r3, #63
	bgt	.L7
	mov	r0, r2
.L8:
	ldr	r2, [sp, #316]
	ldr	r3, [sp, #316]
	add	ip, sp, #332
	add	r3, r3, #1
	str	r3, [sp, #316]
	add	r1, ip, r2
	ldr	r2, [sp, #316]
	strb	r0, [r1, #-84]
	cmp	r2, #63
	ble	.L8
.L7:
	mov	r1, r9
	mov	r2, #64
	ldr	r0, [sp, #44]
	bl	Receive(PLT)
	str	r0, [sp, #312]
	ldr	r0, [sp, #312]
	ldr	r3, [sp, #32]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r1, #1
	mov	r0, r0, lsr #31
	ldr	r3, [sp, #320]
	bl	bwassert(PLT)
	ldr	ip, [sp, #28]
	mov	r0, r9
	add	r1, sl, ip
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L9
	ldr	r5, [sp, #320]
	ldr	r3, [sp, #328]
	cmp	r5, r3
	beq	.L48
	ldr	r3, [sp, #324]
	cmp	r5, r3
	beq	.L48
	ldr	r1, [sp, #88]
	mov	r0, r5
	bl	addToBuffer(PLT)
	ldr	r3, [sp, #20]
	mov	r1, #1
	add	r2, sl, r3
	ldr	r3, [sp, #320]
	bl	bwassert(PLT)
	ldr	ip, [sp, #16]
	mov	r0, #1
	add	r1, sl, ip
	ldr	r2, [sp, #320]
	bl	bwprintf(PLT)
	ldr	r6, [sp, #328]
.L14:
	cmn	r6, #1
	beq	.L52
.L53:
	ldr	r3, [sp, #324]
	cmn	r3, #1
	beq	.L111
.L55:
	ldr	r3, [sp, #328]
	cmn	r3, #1
	beq	.L112
.L58:
	cmp	r7, #0
	cmpne	r8, #0
	beq	.L109
	ldr	ip, [sp, #60]
	mov	r0, #1
	add	r1, sl, ip
	bl	bwprintf(PLT)
	cmp	r7, r8
	beq	.L113
	cmp	r8, #2
	movne	r4, #0
	moveq	r4, #1
	cmp	r7, #1
	cmpeq	r8, #2
	beq	.L75
	cmp	r7, #2
	cmpeq	r8, #3
	beq	.L75
	cmp	r7, #3
	cmpeq	r8, #1
	movne	r6, #1
	beq	.L75
.L79:
	cmp	r7, #1
	ldreq	ip, [sp, #12]
	ldr	r2, [sp, #328]
	addeq	r3, sl, ip
	beq	.L82
	cmp	r7, #2
	ldreq	r0, [sp, #8]
	ldrne	r1, [sp, #4]
	addeq	r3, sl, r0
	addne	r3, sl, r1
.L82:
	ldr	ip, [sp, #56]
	mov	r0, #1
	add	r1, sl, ip
	bl	bwprintf(PLT)
	cmp	r8, #1
	ldreq	r0, [sp, #12]
	ldr	r2, [sp, #324]
	addeq	r3, sl, r0
	beq	.L87
	cmp	r4, #0
	ldrne	r1, [sp, #8]
	ldreq	ip, [sp, #4]
	addne	r3, sl, r1
	addeq	r3, sl, ip
.L87:
	ldr	ip, [sp, #56]
	mov	r0, #1
	add	r1, sl, ip
	bl	bwprintf(PLT)
	ldr	r3, [sp, #104]
	cmp	r6, #1
	mov	r0, #1
	ldreq	r2, [sp, #328]
	ldrne	r2, [sp, #324]
	add	r1, sl, r3
	bl	bwprintf(PLT)
	cmp	r6, #1
	ldrne	r0, [sp, #96]
	ldreq	ip, [sp, #100]
	addne	r4, sl, r0
	addeq	r4, sl, ip
	moveq	r0, r4
	movne	r0, r4
	ldr	r5, [sp, #328]
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	cmp	r6, #1
	ldreq	r1, [sp, #96]
	ldrne	r2, [sp, #100]
	addeq	r4, sl, r1
	addne	r4, sl, r2
	ldr	r5, [sp, #324]
	moveq	r0, r4
	movne	r0, r4
.L98:
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r3, [sp, #92]
	mov	r0, #1
	add	r1, sl, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	bl	bwgetc(PLT)
	mov	r8, #0
	mov	r7, r8
	b	.L109
.L75:
	mov	r6, #2
	b	.L79
.L33:
	ldr	r0, [sp, #0]
	add	r0, sl, r0
	str	r0, [sp, #108]
	ldr	r1, [sp, #108]
	mov	r0, r9
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L42
	ldr	r5, [sp, #320]
	ldr	r3, [sp, #328]
	cmp	r5, r3
	beq	.L114
	ldr	r3, [sp, #324]
	cmp	r5, r3
	beq	.L115
.L48:
	ldr	r0, [sp, #24]
	add	r4, sl, r0
.L107:
	mov	r0, r4
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r6, [sp, #328]
	cmn	r6, #1
	bne	.L53
.L52:
	ldr	r0, [sp, #36]
	ldr	r1, [sp, #88]
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	beq	.L53
.L116:
	ldr	r2, [sp, #80]
	ldr	r5, [sp, #328]
	add	r4, sl, r2
	mov	r0, r4
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r3, [sp, #68]
	mov	r0, #1
	add	r1, sl, r3
	ldr	r2, [sp, #328]
	bl	bwprintf(PLT)
	ldr	r3, [sp, #324]
	mov	r7, #0
	cmn	r3, #1
	bne	.L55
.L111:
	ldr	r0, [sp, #40]
	ldr	r1, [sp, #88]
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	beq	.L55
	ldr	ip, [sp, #80]
	ldr	r5, [sp, #324]
	add	r4, sl, ip
	mov	r0, r4
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r2, [sp, #68]
	mov	r0, #1
	add	r1, sl, r2
	ldr	r2, [sp, #324]
	bl	bwprintf(PLT)
	ldr	r3, [sp, #328]
	mov	r8, #0
	cmn	r3, #1
	bne	.L58
.L112:
	ldr	r3, [sp, #324]
	cmn	r3, #1
	bne	.L58
	ldr	r3, [sp, #64]
	mov	r0, #1
	add	r1, sl, r3
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	b	.L58
.L9:
	ldr	r2, [sp, #12]
	mov	r0, r9
	add	r1, sl, r2
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L15
	ldr	r5, [sp, #320]
	ldr	r6, [sp, #328]
	cmp	r5, r6
	beq	.L17
	ldr	r3, [sp, #324]
	cmp	r5, r3
	beq	.L17
	ldr	r3, [sp, #24]
	add	r4, sl, r3
	mov	r0, r4
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r5, [sp, #320]
	ldr	r6, [sp, #328]
.L17:
	cmp	r5, r6
	cmpeq	r7, #0
	moveq	r7, #1
	beq	.L14
	ldr	r3, [sp, #324]
	cmp	r5, r3
	cmpeq	r8, #0
	moveq	r8, #1
	beq	.L14
	ldr	ip, [sp, #24]
	add	r4, sl, ip
	b	.L107
.L15:
	ldr	r2, [sp, #8]
	mov	r0, r9
	add	r1, sl, r2
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L24
	ldr	r5, [sp, #320]
	ldr	r6, [sp, #328]
	cmp	r5, r6
	beq	.L26
	ldr	r3, [sp, #324]
	cmp	r5, r3
	beq	.L26
	ldr	r3, [sp, #24]
	add	r4, sl, r3
	mov	r0, r4
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r5, [sp, #320]
	ldr	r6, [sp, #328]
.L26:
	cmp	r5, r6
	cmpeq	r7, #0
	moveq	r7, #2
	beq	.L14
	ldr	r3, [sp, #324]
	cmp	r5, r3
	cmpeq	r8, #0
	moveq	r8, #2
	beq	.L14
	ldr	ip, [sp, #24]
	add	r4, sl, ip
	b	.L107
.L113:
	cmp	r8, #1
	ldreq	r0, [sp, #12]
	ldr	r2, [sp, #328]
	addeq	r3, sl, r0
	beq	.L66
	cmp	r8, #2
	ldreq	r1, [sp, #8]
	ldrne	ip, [sp, #4]
	addeq	r3, sl, r1
	addne	r3, sl, ip
.L66:
	ldr	ip, [sp, #56]
	mov	r0, #1
	add	r1, sl, ip
	bl	bwprintf(PLT)
	cmp	r7, #1
	ldreq	r0, [sp, #12]
	ldr	r2, [sp, #324]
	addeq	r3, sl, r0
	beq	.L71
	cmp	r7, #2
	ldreq	r1, [sp, #8]
	ldrne	ip, [sp, #4]
	addeq	r3, sl, r1
	addne	r3, sl, ip
.L71:
	ldr	r0, [sp, #56]
	add	r1, sl, r0
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r2, [sp, #52]
	ldr	r1, [sp, #48]
	mov	r0, #1
	add	r4, sl, r1
	add	r1, sl, r2
	bl	bwprintf(PLT)
	mov	r0, r4
	ldr	r5, [sp, #328]
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r5, [sp, #324]
	mov	r0, r4
	b	.L98
.L24:
	ldr	r2, [sp, #4]
	mov	r0, r9
	add	r1, sl, r2
	bl	strequal(PLT)
	subs	fp, r0, #0
	beq	.L33
	ldr	r5, [sp, #320]
	ldr	r6, [sp, #328]
	cmp	r5, r6
	beq	.L35
	ldr	r3, [sp, #324]
	cmp	r5, r3
	beq	.L35
	ldr	r3, [sp, #24]
	add	r4, sl, r3
	mov	r0, r4
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r5, [sp, #320]
	ldr	r6, [sp, #328]
.L35:
	cmp	r5, r6
	cmpeq	r7, #0
	moveq	r7, #3
	beq	.L14
	ldr	r3, [sp, #324]
	cmp	r5, r3
	cmpeq	r8, #0
	moveq	r8, #3
	beq	.L14
	ldr	ip, [sp, #24]
	add	r4, sl, ip
	b	.L107
.L115:
	ldr	ip, [sp, #72]
	ldr	r3, [sp, #80]
	mov	r2, r5
	add	r1, sl, ip
	add	r5, sl, r3
	mov	r0, #1
	bl	bwprintf(PLT)
	mvn	r6, #0
	mov	r0, r5
	ldr	r4, [sp, #320]
	str	r6, [sp, #324]
	bl	strlength(PLT)
	mov	r1, r5
	mov	r2, r0
	mov	r0, r4
	bl	Reply(PLT)
	ldr	r2, [sp, #328]
	cmp	r2, r6
	moveq	r8, fp
	beq	.L52
	ldr	ip, [sp, #76]
	mov	r0, #1
	add	r1, sl, ip
	bl	bwprintf(PLT)
	ldr	r0, [sp, #108]
	ldr	r4, [sp, #328]
	bl	strlength(PLT)
	ldr	r1, [sp, #108]
	mov	r2, r0
	mov	r0, r4
	bl	Reply(PLT)
	ldr	r0, [sp, #36]
	ldr	r1, [sp, #88]
	str	r6, [sp, #328]
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	mov	r8, fp
	beq	.L53
	b	.L116
.L42:
	ldr	r1, [sp, #24]
	ldr	r5, [sp, #320]
	add	r4, sl, r1
	b	.L107
.L114:
	ldr	r3, [sp, #84]
	ldr	ip, [sp, #80]
	mov	r2, r5
	add	r1, sl, r3
	add	r5, sl, ip
	mov	r0, #1
	bl	bwprintf(PLT)
	mvn	r6, #0
	mov	r0, r5
	ldr	r4, [sp, #320]
	str	r6, [sp, #328]
	bl	strlength(PLT)
	mov	r1, r5
	mov	r2, r0
	mov	r0, r4
	bl	Reply(PLT)
	ldr	r2, [sp, #324]
	cmp	r2, r6
	beq	.L108
	ldr	r3, [sp, #76]
	mov	r0, #1
	add	r1, sl, r3
	bl	bwprintf(PLT)
	ldr	r0, [sp, #108]
	ldr	r4, [sp, #324]
	bl	strlength(PLT)
	ldr	r1, [sp, #108]
	mov	r2, r0
	mov	r0, r4
	bl	Reply(PLT)
	str	r6, [sp, #324]
.L108:
	ldr	r6, [sp, #328]
	mov	r7, fp
	b	.L14
.L118:
	.align	2
.L117:
	.word	_GLOBAL_OFFSET_TABLE_-(.L106+8)
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
	.size	referee, .-referee
	.section	.rodata.str1.4
	.align	2
.LC24:
	.ascii	"TID<%d>: Sending a signup request.\015\012\000"
	.align	2
.LC25:
	.ascii	"TID<%d>: Error sending signup to referee.\015\012\000"
	.align	2
.LC26:
	.ascii	"TID<%d>: Referee has given me a heads up that it's "
	.ascii	"my turn to play. Getting my first move ready.\015\012"
	.ascii	"\000"
	.align	2
.LC27:
	.ascii	"TID<%d>: Sending the following request to referee: "
	.ascii	"%s.\015\012\000"
	.align	2
.LC28:
	.ascii	"TID<%d>: Error sending %s to referee on game %d.\015"
	.ascii	"\012\000"
	.align	2
.LC29:
	.ascii	"TID<%d>: Alas, my partner has quit and I have conse"
	.ascii	"quently been kicked out...\015\012\000"
	.align	2
.LC30:
	.ascii	"TID<%d>: Got the following reply from referee: %s.\015"
	.ascii	"\012\000"
	.align	2
.LC31:
	.ascii	"TID<%d>: calling quits.\015\012\000"
	.text
	.align	2
	.global	player1
	.type	player1, %function
player1:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L148
	sub	sp, sp, #28
.L146:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L148+4
	mov	r2, #0
	ldr	r9, .L148+8
	ldr	r8, .L148+12
	ldr	r5, .L148+16
	str	r2, [sp, #24]
	mov	r6, r0
	str	r2, [sp, #20]
	add	r4, sl, r3
	add	r7, sp, #4
.L120:
	mov	r2, #0
	str	r2, [sp, #24]
	ldr	r3, [sp, #24]
	cmp	r3, #15
	bgt	.L121
	mov	r0, r2
.L122:
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #24]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #24]
	add	r1, ip, r2
	ldr	r2, [sp, #24]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L122
.L121:
	add	r1, sl, r9
	mov	r2, r6
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r4
	mov	r3, r7
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	mov	r3, r6
	bl	bwassert(PLT)
	mov	r0, r7
	add	r1, sl, r5
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L120
	ldr	r1, .L148+20
	mov	r2, r6
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [sp, #20]
	ldr	r2, [sp, #20]
	cmp	r2, #19
	bgt	.L139
	ldr	r8, .L148+24
	ldr	r9, .L148+28
	ldr	fp, .L148+32
.L125:
	mov	r2, #0
	str	r2, [sp, #24]
	ldr	r3, [sp, #24]
	cmp	r3, #15
	bgt	.L126
	mov	r0, r2
.L127:
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #24]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #24]
	add	r1, ip, r2
	ldr	r2, [sp, #24]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L127
.L126:
	bl	getTime(PLT)
	ldr	r3, .L148+36
	mov	r4, r0
	smull	r1, r2, r3, r0
	sub	r2, r2, r0, asr #31
	add	r3, r2, r2, asl #1
	subs	r2, r0, r3
	bne	.L128
	ldr	r3, .L148+40
	add	r5, sl, r3
.L130:
	add	r1, sl, r8
	mov	r2, r6
	mov	r3, r5
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r5
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r5
	mov	r3, r7
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r3, r5
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r9
	str	r4, [sp, #0]
	bl	bwassert(PLT)
	mov	r0, r7
	add	r1, sl, fp
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L133
	ldr	r1, .L148+44
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, r6
	bl	bwprintf(PLT)
	bl	Exit(PLT)
.L135:
	ldr	r3, [sp, #20]
	add	r3, r3, #1
	str	r3, [sp, #20]
	ldr	r2, [sp, #20]
	cmp	r2, #19
	ble	.L125
.L124:
	mov	r2, #0
	str	r2, [sp, #24]
	ldr	r3, [sp, #24]
	cmp	r3, #15
	bgt	.L136
	mov	r0, r2
.L137:
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #24]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #24]
	add	r1, ip, r2
	ldr	r2, [sp, #24]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L137
.L136:
	ldr	r1, .L148+48
	mov	r2, r6
	add	r1, sl, r1
	add	r4, sl, fp
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r4
	mov	r3, r7
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	bl	Exit(PLT)
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L133:
	ldr	r1, .L148+52
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, r6
	mov	r3, r7
	bl	bwprintf(PLT)
	b	.L135
.L128:
	cmp	r2, #1
	ldrne	r3, .L148+56
	addne	r5, sl, r3
	bne	.L130
.L147:
	ldr	r3, .L148+60
	add	r5, sl, r3
	b	.L130
.L139:
	ldr	fp, .L148+32
	b	.L124
.L149:
	.align	2
.L148:
	.word	_GLOBAL_OFFSET_TABLE_-(.L146+8)
	.word	.LC2(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	1431655766
	.word	.LC6(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC7(GOTOFF)
	.size	player1, .-player1
	.align	2
	.global	player2
	.type	player2, %function
player2:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L179
	sub	sp, sp, #28
.L177:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L179+4
	mov	r2, #0
	ldr	r9, .L179+8
	ldr	r8, .L179+12
	ldr	r5, .L179+16
	str	r2, [sp, #24]
	mov	r6, r0
	str	r2, [sp, #20]
	add	r4, sl, r3
	add	r7, sp, #4
.L151:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L152
	mov	r0, r2
.L153:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L153
.L152:
	add	r1, sl, r9
	mov	r2, r6
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r4
	mov	r3, r7
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	mov	r3, r6
	bl	bwassert(PLT)
	mov	r0, r7
	add	r1, sl, r5
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L151
	ldr	r1, .L179+20
	mov	r2, r6
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [sp, #24]
	ldr	r2, [sp, #24]
	cmp	r2, #4
	bgt	.L170
	ldr	r8, .L179+24
	ldr	r9, .L179+28
	ldr	fp, .L179+32
.L156:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L157
	mov	r0, r2
.L158:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L158
.L157:
	bl	getTime(PLT)
	ldr	r3, .L179+36
	mov	r4, r0
	smull	r1, r2, r3, r0
	sub	r2, r2, r0, asr #31
	add	r3, r2, r2, asl #1
	subs	r2, r0, r3
	bne	.L159
	ldr	r3, .L179+40
	add	r5, sl, r3
.L161:
	add	r1, sl, r8
	mov	r2, r6
	mov	r3, r5
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r5
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r5
	mov	r3, r7
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r3, r5
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r9
	str	r4, [sp, #0]
	bl	bwassert(PLT)
	mov	r0, r7
	add	r1, sl, fp
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L164
	ldr	r1, .L179+44
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, r6
	bl	bwprintf(PLT)
	bl	Exit(PLT)
.L166:
	ldr	r3, [sp, #24]
	add	r3, r3, #1
	str	r3, [sp, #24]
	ldr	r2, [sp, #24]
	cmp	r2, #4
	ble	.L156
.L155:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L167
	mov	r0, r2
.L168:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L168
.L167:
	ldr	r1, .L179+48
	mov	r2, r6
	add	r1, sl, r1
	add	r4, sl, fp
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r4
	mov	r3, r7
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	bl	Exit(PLT)
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L164:
	ldr	r1, .L179+52
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, r6
	mov	r3, r7
	bl	bwprintf(PLT)
	b	.L166
.L159:
	cmp	r2, #1
	ldrne	r3, .L179+56
	addne	r5, sl, r3
	bne	.L161
.L178:
	ldr	r3, .L179+60
	add	r5, sl, r3
	b	.L161
.L170:
	ldr	fp, .L179+32
	b	.L155
.L180:
	.align	2
.L179:
	.word	_GLOBAL_OFFSET_TABLE_-(.L177+8)
	.word	.LC2(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	1431655766
	.word	.LC6(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC7(GOTOFF)
	.size	player2, .-player2
	.align	2
	.global	player3
	.type	player3, %function
player3:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L210
	sub	sp, sp, #28
.L208:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L210+4
	mov	r2, #0
	ldr	r9, .L210+8
	ldr	r8, .L210+12
	ldr	r5, .L210+16
	str	r2, [sp, #24]
	mov	r6, r0
	str	r2, [sp, #20]
	add	r4, sl, r3
	add	r7, sp, #4
.L182:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L183
	mov	r0, r2
.L184:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L184
.L183:
	add	r1, sl, r9
	mov	r2, r6
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r4
	mov	r3, r7
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	mov	r3, r6
	bl	bwassert(PLT)
	mov	r0, r7
	add	r1, sl, r5
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L182
	ldr	r1, .L210+20
	mov	r2, r6
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [sp, #24]
	ldr	r2, [sp, #24]
	cmp	r2, #4
	bgt	.L201
	ldr	r8, .L210+24
	ldr	r9, .L210+28
	ldr	fp, .L210+32
.L187:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L188
	mov	r0, r2
.L189:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L189
.L188:
	bl	getTime(PLT)
	ldr	r3, .L210+36
	mov	r4, r0
	smull	r1, r2, r3, r0
	sub	r2, r2, r0, asr #31
	add	r3, r2, r2, asl #1
	subs	r2, r0, r3
	bne	.L190
	ldr	r3, .L210+40
	add	r5, sl, r3
.L192:
	add	r1, sl, r8
	mov	r2, r6
	mov	r3, r5
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r5
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r5
	mov	r3, r7
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r3, r5
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r9
	str	r4, [sp, #0]
	bl	bwassert(PLT)
	mov	r0, r7
	add	r1, sl, fp
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L195
	ldr	r1, .L210+44
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, r6
	bl	bwprintf(PLT)
	bl	Exit(PLT)
.L197:
	ldr	r3, [sp, #24]
	add	r3, r3, #1
	str	r3, [sp, #24]
	ldr	r2, [sp, #24]
	cmp	r2, #4
	ble	.L187
.L186:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L198
	mov	r0, r2
.L199:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L199
.L198:
	ldr	r1, .L210+48
	mov	r2, r6
	add	r1, sl, r1
	add	r4, sl, fp
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r4
	mov	r3, r7
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	bl	Exit(PLT)
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L195:
	ldr	r1, .L210+52
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, r6
	mov	r3, r7
	bl	bwprintf(PLT)
	b	.L197
.L190:
	cmp	r2, #1
	ldrne	r3, .L210+56
	addne	r5, sl, r3
	bne	.L192
.L209:
	ldr	r3, .L210+60
	add	r5, sl, r3
	b	.L192
.L201:
	ldr	fp, .L210+32
	b	.L186
.L211:
	.align	2
.L210:
	.word	_GLOBAL_OFFSET_TABLE_-(.L208+8)
	.word	.LC2(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	1431655766
	.word	.LC6(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC7(GOTOFF)
	.size	player3, .-player3
	.align	2
	.global	player4
	.type	player4, %function
player4:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L241
	sub	sp, sp, #28
.L239:
	add	sl, pc, sl
	bl	MyTid(PLT)
	ldr	r3, .L241+4
	mov	r2, #0
	ldr	r9, .L241+8
	ldr	r8, .L241+12
	ldr	r5, .L241+16
	str	r2, [sp, #24]
	mov	r6, r0
	str	r2, [sp, #20]
	add	r4, sl, r3
	add	r7, sp, #4
.L213:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L214
	mov	r0, r2
.L215:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L215
.L214:
	add	r1, sl, r9
	mov	r2, r6
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r4
	mov	r3, r7
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r8
	mov	r3, r6
	bl	bwassert(PLT)
	mov	r0, r7
	add	r1, sl, r5
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L213
	ldr	r1, .L241+20
	mov	r2, r6
	mov	r0, #1
	add	r1, sl, r1
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [sp, #24]
	ldr	r2, [sp, #24]
	cmp	r2, #19
	bgt	.L232
	ldr	r8, .L241+24
	ldr	r9, .L241+28
	ldr	fp, .L241+32
.L218:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L219
	mov	r0, r2
.L220:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L220
.L219:
	bl	getTime(PLT)
	ldr	r3, .L241+36
	mov	r4, r0
	smull	r1, r2, r3, r0
	sub	r2, r2, r0, asr #31
	add	r3, r2, r2, asl #1
	subs	r2, r0, r3
	bne	.L221
	ldr	r3, .L241+40
	add	r5, sl, r3
.L223:
	add	r1, sl, r8
	mov	r2, r6
	mov	r3, r5
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r5
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r5
	mov	r3, r7
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r3, r5
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r9
	str	r4, [sp, #0]
	bl	bwassert(PLT)
	mov	r0, r7
	add	r1, sl, fp
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L226
	ldr	r1, .L241+44
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, r6
	bl	bwprintf(PLT)
	bl	Exit(PLT)
.L228:
	ldr	r3, [sp, #24]
	add	r3, r3, #1
	str	r3, [sp, #24]
	ldr	r2, [sp, #24]
	cmp	r2, #19
	ble	.L218
.L217:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L229
	mov	r0, r2
.L230:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L230
.L229:
	ldr	r1, .L241+48
	mov	r2, r6
	add	r1, sl, r1
	add	r4, sl, fp
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r4
	mov	r3, r7
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	bl	Exit(PLT)
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L226:
	ldr	r1, .L241+52
	mov	r0, #1
	add	r1, sl, r1
	mov	r2, r6
	mov	r3, r7
	bl	bwprintf(PLT)
	b	.L228
.L221:
	cmp	r2, #1
	ldrne	r3, .L241+56
	addne	r5, sl, r3
	bne	.L223
.L240:
	ldr	r3, .L241+60
	add	r5, sl, r3
	b	.L223
.L232:
	ldr	fp, .L241+32
	b	.L217
.L242:
	.align	2
.L241:
	.word	_GLOBAL_OFFSET_TABLE_-(.L239+8)
	.word	.LC2(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	1431655766
	.word	.LC6(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC7(GOTOFF)
	.size	player4, .-player4
	.align	2
	.global	God
	.type	God, %function
God:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L246
	ldr	r3, .L246+4
.L245:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #6
	bl	Create(PLT)
	ldr	r3, .L246+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L246+12
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L246+16
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L246+20
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L247:
	.align	2
.L246:
	.word	_GLOBAL_OFFSET_TABLE_-(.L245+8)
	.word	referee(GOT)
	.word	player1(GOT)
	.word	player2(GOT)
	.word	player3(GOT)
	.word	player4(GOT)
	.size	God, .-God
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L251
.L250:
	add	sl, pc, sl
	MRC p15, 0, r0, c1, c0, 0 
ORR r0, r0, #0x1 <<12 
ORR r0, r0, #0x1 <<2 
MCR p15, 0, r0, c1, c0, 0 

	bl	startTime(PLT)
	ldr	r3, .L251+4
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	kernelRun(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L252:
	.align	2
.L251:
	.word	_GLOBAL_OFFSET_TABLE_-(.L250+8)
	.word	God(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
