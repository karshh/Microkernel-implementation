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
	.ascii	"ROCK, PAPER & SCISSORS\015\012By: Paily & Karsh\015"
	.ascii	"\012\015\012\000"
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
	.ascii	"rock\000"
	.align	2
.LC6:
	.ascii	"paper\000"
	.align	2
.LC7:
	.ascii	"scissors\000"
	.align	2
.LC8:
	.ascii	"quit\000"
	.align	2
.LC9:
	.ascii	"\015\012TID <%d> quits.\015\012\000"
	.align	2
.LC10:
	.ascii	"success\000"
	.align	2
.LC11:
	.ascii	"\015\012No more players left. Quitting...\015\012\000"
	.align	2
.LC12:
	.ascii	"TID <%d> enters the game.\015\012\000"
	.align	2
.LC13:
	.ascii	"\015\012GAME:\015\012\000"
	.align	2
.LC14:
	.ascii	"    TID <%d> chooses %s.\015\012\000"
	.align	2
.LC15:
	.ascii	"RESULT: Tie!.\015\012\000"
	.align	2
.LC16:
	.ascii	"tie\000"
	.align	2
.LC17:
	.ascii	"RESULT: TID <%d> wins!.\015\012\000"
	.align	2
.LC18:
	.ascii	"win\000"
	.align	2
.LC19:
	.ascii	"lose\000"
	.align	2
.LC20:
	.ascii	"Press any key to continue...\015\012\000"
	.text
	.align	2
	.global	referee
	.type	referee, %function
referee:
	@ args = 0, pretend = 0, frame = 308
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L115
	ldr	r1, .L115+4
	sub	sp, sp, #312
.L103:
	add	sl, pc, sl
	add	r3, sp, #96
	add	r1, sl, r1
	mov	r0, #1
	str	r3, [sp, #92]
	bl	bwprintf(PLT)
	ldr	r0, [sp, #92]
	bl	circularBufferInit(PLT)
	ldr	ip, .L115+8
	ldr	lr, .L115+12
	ldr	r0, .L115+16
	ldr	r1, .L115+20
	str	ip, [sp, #76]
	ldr	ip, .L115+24
	str	lr, [sp, #72]
	str	r0, [sp, #68]
	ldr	lr, .L115+28
	ldr	r0, .L115+32
	str	r1, [sp, #64]
	str	ip, [sp, #60]
	ldr	r1, .L115+36
	ldr	ip, .L115+40
	str	lr, [sp, #56]
	str	r0, [sp, #52]
	ldr	lr, .L115+44
	ldr	r0, .L115+48
	str	r1, [sp, #48]
	str	ip, [sp, #40]
	ldr	r1, .L115+52
	ldr	ip, .L115+56
	str	lr, [sp, #36]
	str	r0, [sp, #32]
	ldr	lr, .L115+60
	ldr	r0, .L115+64
	str	r1, [sp, #28]
	str	ip, [sp, #24]
	ldr	r1, .L115+68
	ldr	ip, .L115+72
	mov	r3, #0
	str	lr, [sp, #20]
	str	r0, [sp, #16]
	ldr	lr, .L115+76
	ldr	r0, .L115+80
	mvn	r2, #0
	mov	r7, r3
	str	r1, [sp, #12]
	str	ip, [sp, #8]
	str	r3, [sp, #296]
	mov	r6, r3
	add	r1, sp, #300
	add	r3, sp, #308
	add	ip, sp, #304
	ldr	fp, .L115+84
	str	lr, [sp, #4]
	str	r0, [sp, #44]
	str	r2, [sp, #300]
	str	r2, [sp, #308]
	str	r2, [sp, #304]
	str	r1, [sp, #88]
	add	r9, sp, #232
	str	r3, [sp, #80]
	str	ip, [sp, #84]
.L107:
	mov	r2, #0
	str	r2, [sp, #296]
	ldr	r3, [sp, #296]
	cmp	r3, #63
	bgt	.L7
	mov	r0, r2
.L8:
	ldr	r2, [sp, #296]
	ldr	r3, [sp, #296]
	add	lr, sp, #312
	add	r3, r3, #1
	str	r3, [sp, #296]
	add	r1, lr, r2
	ldr	r2, [sp, #296]
	strb	r0, [r1, #-80]
	cmp	r2, #63
	ble	.L8
.L7:
	mov	r1, r9
	mov	r2, #64
	ldr	r0, [sp, #88]
	bl	Receive(PLT)
	ldr	lr, [sp, #76]
	mov	ip, r0
	mvn	r0, r0
	ldr	r3, [sp, #300]
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	bwassert(PLT)
	ldr	r3, [sp, #72]
	mov	r0, r9
	add	r1, sl, r3
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L9
	ldr	r5, [sp, #300]
	ldr	r3, [sp, #308]
	cmp	r5, r3
	beq	.L48
	ldr	r3, [sp, #304]
	cmp	r5, r3
	beq	.L48
	ldr	r1, [sp, #92]
	mov	r0, r5
	bl	addToBuffer(PLT)
	ldr	ip, [sp, #68]
	mov	r1, #1
	add	r2, sl, ip
	ldr	r3, [sp, #300]
	bl	bwassert(PLT)
	ldr	r2, [sp, #308]
.L14:
	cmn	r2, #1
	beq	.L109
.L52:
	ldr	r3, [sp, #304]
	cmn	r3, #1
	beq	.L110
.L55:
	cmp	r6, #0
	cmpne	r7, #0
	beq	.L107
	ldr	r3, [sp, #28]
	mov	r0, #1
	add	r1, sl, r3
	bl	bwprintf(PLT)
	cmp	r6, r7
	beq	.L111
	cmp	r7, #2
	movne	r4, #0
	moveq	r4, #1
	cmp	r6, #1
	cmpeq	r7, #2
	beq	.L72
	cmp	r6, #2
	cmpeq	r7, #3
	beq	.L72
	cmp	r6, #3
	cmpeq	r7, #1
	movne	r8, #1
	beq	.L72
.L76:
	cmp	r6, #1
	ldreq	r1, [sp, #64]
	ldr	r2, [sp, #308]
	addeq	r3, sl, r1
	beq	.L79
	cmp	r6, #2
	ldreq	ip, [sp, #60]
	ldrne	lr, [sp, #56]
	addeq	r3, sl, ip
	addne	r3, sl, lr
.L79:
	ldr	ip, [sp, #24]
	mov	r0, #1
	add	r1, sl, ip
	bl	bwprintf(PLT)
	cmp	r7, #1
	ldreq	lr, [sp, #64]
	ldr	r2, [sp, #304]
	addeq	r3, sl, lr
	beq	.L84
	cmp	r4, #0
	ldrne	r0, [sp, #60]
	ldreq	r1, [sp, #56]
	addne	r3, sl, r0
	addeq	r3, sl, r1
.L84:
	ldr	ip, [sp, #24]
	mov	r0, #1
	add	r1, sl, ip
	bl	bwprintf(PLT)
	ldr	lr, [sp, #12]
	cmp	r8, #1
	ldreq	r2, [sp, #308]
	ldrne	r2, [sp, #304]
	add	r1, sl, lr
	mov	r0, #1
	bl	bwprintf(PLT)
	ldr	r0, [sp, #8]
	cmp	r8, #1
	add	r4, sl, r0
	mov	r0, r4
	ldreq	r5, [sp, #308]
	ldrne	r5, [sp, #304]
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	cmp	r8, #1
	ldr	r1, [sp, #4]
	ldreq	r5, [sp, #304]
	ldrne	r5, [sp, #308]
	add	r4, sl, r1
.L106:
	mov	r0, r4
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r3, [sp, #44]
	mov	r0, #1
	add	r1, sl, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	bl	bwgetc(PLT)
	mov	r7, #0
	mov	r6, r7
	b	.L107
.L72:
	mov	r8, #2
	b	.L76
.L33:
	ldr	lr, [sp, #52]
	mov	r0, r9
	add	r1, sl, lr
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L42
	ldr	r5, [sp, #300]
	ldr	r3, [sp, #308]
	cmp	r5, r3
	beq	.L112
	ldr	r3, [sp, #304]
	cmp	r5, r3
	beq	.L113
.L48:
	add	r4, sl, fp
.L104:
	mov	r0, r4
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r2, [sp, #308]
	cmn	r2, #1
	bne	.L52
.L109:
	ldr	r0, [sp, #80]
	ldr	r1, [sp, #92]
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	beq	.L52
	ldr	r0, [sp, #40]
	ldr	r5, [sp, #308]
	add	r4, sl, r0
	mov	r0, r4
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r3, [sp, #32]
	mov	r0, #1
	add	r1, sl, r3
	ldr	r2, [sp, #308]
	bl	bwprintf(PLT)
	ldr	r3, [sp, #304]
	mov	r6, #0
	cmn	r3, #1
	bne	.L55
.L110:
	ldr	r0, [sp, #84]
	ldr	r1, [sp, #92]
	bl	getFromBuffer(PLT)
	cmp	r0, #0
	beq	.L55
	ldr	ip, [sp, #40]
	ldr	r5, [sp, #304]
	add	r4, sl, ip
	mov	r0, r4
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	lr, [sp, #32]
	mov	r0, #1
	add	r1, sl, lr
	ldr	r2, [sp, #304]
	bl	bwprintf(PLT)
	mov	r7, #0
	b	.L55
.L9:
	ldr	lr, [sp, #64]
	mov	r0, r9
	add	r1, sl, lr
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L15
	ldr	r5, [sp, #300]
	ldr	r2, [sp, #308]
	cmp	r5, r2
	beq	.L17
	ldr	r3, [sp, #304]
	cmp	r5, r3
	beq	.L17
	add	r4, sl, fp
	mov	r0, r4
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r5, [sp, #300]
	ldr	r2, [sp, #308]
.L17:
	cmp	r5, r2
	cmpeq	r6, #0
	moveq	r6, #1
	beq	.L14
	ldr	r3, [sp, #304]
	cmp	r5, r3
	cmpeq	r7, #0
	moveq	r7, #1
	beq	.L14
	b	.L48
.L15:
	ldr	r3, [sp, #60]
	mov	r0, r9
	add	r1, sl, r3
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L24
	ldr	r5, [sp, #300]
	ldr	r2, [sp, #308]
	cmp	r5, r2
	beq	.L26
	ldr	r3, [sp, #304]
	cmp	r5, r3
	beq	.L26
	add	r4, sl, fp
	mov	r0, r4
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r5, [sp, #300]
	ldr	r2, [sp, #308]
.L26:
	cmp	r5, r2
	cmpeq	r6, #0
	moveq	r6, #2
	beq	.L14
	ldr	r3, [sp, #304]
	cmp	r5, r3
	cmpeq	r7, #0
	moveq	r7, #2
	beq	.L14
	b	.L48
.L111:
	cmp	r7, #1
	ldreq	ip, [sp, #64]
	ldr	r2, [sp, #308]
	addeq	r3, sl, ip
	beq	.L63
	cmp	r7, #2
	ldreq	lr, [sp, #60]
	ldrne	r0, [sp, #56]
	addeq	r3, sl, lr
	addne	r3, sl, r0
.L63:
	ldr	ip, [sp, #24]
	mov	r0, #1
	add	r1, sl, ip
	bl	bwprintf(PLT)
	cmp	r6, #1
	ldreq	lr, [sp, #64]
	ldr	r2, [sp, #304]
	addeq	r3, sl, lr
	beq	.L68
	cmp	r6, #2
	ldreq	r0, [sp, #60]
	ldrne	r1, [sp, #56]
	addeq	r3, sl, r0
	addne	r3, sl, r1
.L68:
	ldr	ip, [sp, #24]
	mov	r0, #1
	add	r1, sl, ip
	bl	bwprintf(PLT)
	ldr	lr, [sp, #16]
	ldr	r0, [sp, #20]
	add	r4, sl, lr
	add	r1, sl, r0
	mov	r0, #1
	bl	bwprintf(PLT)
	mov	r0, r4
	ldr	r5, [sp, #308]
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r5, [sp, #304]
	b	.L106
.L24:
	ldr	ip, [sp, #56]
	mov	r0, r9
	add	r1, sl, ip
	bl	strequal(PLT)
	subs	r8, r0, #0
	beq	.L33
	ldr	r5, [sp, #300]
	ldr	r2, [sp, #308]
	cmp	r5, r2
	beq	.L35
	ldr	r3, [sp, #304]
	cmp	r5, r3
	beq	.L35
	add	r4, sl, fp
	mov	r0, r4
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r5, [sp, #300]
	ldr	r2, [sp, #308]
.L35:
	cmp	r5, r2
	cmpeq	r6, #0
	moveq	r6, #3
	beq	.L14
	ldr	r3, [sp, #304]
	cmp	r5, r3
	cmpeq	r7, #0
	moveq	r7, #3
	beq	.L14
	b	.L48
.L113:
	ldr	ip, [sp, #40]
	ldr	r3, [sp, #48]
	add	r4, sl, ip
	mov	r2, r5
	add	r1, sl, r3
	mov	r0, #1
	bl	bwprintf(PLT)
	mvn	r3, #0
	mov	r0, r4
	str	r3, [sp, #304]
	ldr	r5, [sp, #300]
	bl	strlength(PLT)
	mov	r1, r4
	mov	r2, r0
	mov	r0, r5
	bl	Reply(PLT)
	ldr	r3, [sp, #308]
	cmn	r3, #1
	movne	r7, r8
	bne	.L52
	ldr	lr, [sp, #36]
	mov	r0, #1
	add	r1, sl, lr
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	ldr	r2, [sp, #308]
	mov	r7, r8
	b	.L14
.L42:
	ldr	r5, [sp, #300]
	add	r4, sl, fp
	b	.L104
.L112:
	ldr	r3, [sp, #48]
	ldr	ip, [sp, #40]
	add	r1, sl, r3
	mov	r2, r5
	mov	r0, #1
	add	r5, sl, ip
	bl	bwprintf(PLT)
	mvn	r2, #0
	mov	r0, r5
	ldr	r4, [sp, #300]
	str	r2, [sp, #308]
	bl	strlength(PLT)
	mov	r1, r5
	mov	r2, r0
	mov	r0, r4
	bl	Reply(PLT)
	ldr	r3, [sp, #304]
	cmn	r3, #1
	beq	.L114
.L105:
	ldr	r2, [sp, #308]
	mov	r6, r8
	b	.L14
.L114:
	ldr	lr, [sp, #36]
	mov	r0, #1
	add	r1, sl, lr
	bl	bwprintf(PLT)
	bl	Exit(PLT)
	b	.L105
.L116:
	.align	2
.L115:
	.word	_GLOBAL_OFFSET_TABLE_-(.L103+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
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
	.word	.LC3(GOTOFF)
	.size	referee, .-referee
	.section	.rodata.str1.4
	.align	2
.LC21:
	.ascii	"Player 1 Error sending signup to referee.\015\012\000"
	.align	2
.LC22:
	.ascii	"Player 1 Error sending %s to referee on game %d.\015"
	.ascii	"\012\000"
	.text
	.align	2
	.global	player1
	.type	player1, %function
player1:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L142
	ldr	r3, .L142+4
	sub	sp, sp, #28
.L140:
	add	sl, pc, sl
	mov	r2, #0
	ldr	r7, .L142+8
	ldr	r5, .L142+12
	str	r2, [sp, #24]
	add	r4, sl, r3
	str	r2, [sp, #20]
	add	r6, sp, #4
.L118:
	mov	r2, #0
	str	r2, [sp, #24]
	ldr	r3, [sp, #24]
	cmp	r3, #15
	bgt	.L119
	mov	r0, r2
.L120:
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #24]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #24]
	add	r1, ip, r2
	ldr	r2, [sp, #24]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L120
.L119:
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r3, r6
	mov	r1, r4
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r7
	bl	bwassert(PLT)
	mov	r0, r6
	add	r1, sl, r5
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L118
	mov	r3, #0
	str	r3, [sp, #20]
	ldr	r2, [sp, #20]
	cmp	r2, #29
	bgt	.L122
	ldr	r7, .L142+16
.L123:
	mov	r2, #0
	str	r2, [sp, #24]
	ldr	r3, [sp, #24]
	cmp	r3, #15
	bgt	.L124
	mov	r0, r2
.L125:
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #24]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #24]
	add	r1, ip, r2
	ldr	r2, [sp, #24]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L125
.L124:
	bl	getTime(PLT)
	ldr	r3, .L142+20
	mov	r4, r0
	smull	r1, r2, r3, r0
	sub	r2, r2, r0, asr #31
	add	r3, r2, r2, asl #1
	subs	r2, r0, r3
	bne	.L126
	ldr	r3, .L142+24
	add	r5, sl, r3
.L128:
	mov	r0, r5
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r5
	mov	r3, r6
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r3, r5
	add	r2, sl, r7
	mov	r0, r0, lsr #31
	mov	r1, #1
	str	r4, [sp, #0]
	bl	bwassert(PLT)
	ldr	r3, [sp, #20]
	add	r3, r3, #1
	str	r3, [sp, #20]
	ldr	r2, [sp, #20]
	cmp	r2, #29
	ble	.L123
.L122:
	mov	r2, #0
	str	r2, [sp, #24]
	ldr	r3, [sp, #24]
	cmp	r3, #15
	bgt	.L131
	mov	r0, r2
.L132:
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #24]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #24]
	add	r1, ip, r2
	ldr	r2, [sp, #24]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L132
.L131:
	ldr	r3, .L142+28
	add	r4, sl, r3
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r4
	mov	r3, r6
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	bl	Exit(PLT)
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L126:
	cmp	r2, #1
	ldrne	r3, .L142+32
	addne	r5, sl, r3
	bne	.L128
.L141:
	ldr	r3, .L142+36
	add	r5, sl, r3
	b	.L128
.L143:
	.align	2
.L142:
	.word	_GLOBAL_OFFSET_TABLE_-(.L140+8)
	.word	.LC2(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	1431655766
	.word	.LC5(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC6(GOTOFF)
	.size	player1, .-player1
	.align	2
	.global	player2
	.type	player2, %function
player2:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L169
	ldr	r3, .L169+4
	sub	sp, sp, #28
.L167:
	add	sl, pc, sl
	mov	r2, #0
	ldr	r7, .L169+8
	ldr	r5, .L169+12
	str	r2, [sp, #24]
	add	r4, sl, r3
	str	r2, [sp, #20]
	add	r6, sp, #4
.L145:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L146
	mov	r0, r2
.L147:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L147
.L146:
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r3, r6
	mov	r1, r4
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r7
	bl	bwassert(PLT)
	mov	r0, r6
	add	r1, sl, r5
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L145
	mov	r3, #0
	str	r3, [sp, #24]
	ldr	r2, [sp, #24]
	cmp	r2, #19
	bgt	.L149
	ldr	r7, .L169+16
.L150:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L151
	mov	r0, r2
.L152:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L152
.L151:
	bl	getTime(PLT)
	ldr	r3, .L169+20
	mov	r4, r0
	smull	r1, r2, r3, r0
	sub	r2, r2, r0, asr #31
	add	r3, r2, r2, asl #1
	subs	r2, r0, r3
	bne	.L153
	ldr	r3, .L169+24
	add	r5, sl, r3
.L155:
	mov	r0, r5
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r5
	mov	r3, r6
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r3, r5
	add	r2, sl, r7
	mov	r0, r0, lsr #31
	mov	r1, #1
	str	r4, [sp, #0]
	bl	bwassert(PLT)
	ldr	r3, [sp, #24]
	add	r3, r3, #1
	str	r3, [sp, #24]
	ldr	r2, [sp, #24]
	cmp	r2, #19
	ble	.L150
.L149:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L158
	mov	r0, r2
.L159:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L159
.L158:
	ldr	r3, .L169+28
	add	r4, sl, r3
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r4
	mov	r3, r6
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	bl	Exit(PLT)
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L153:
	cmp	r2, #1
	ldrne	r3, .L169+32
	addne	r5, sl, r3
	bne	.L155
.L168:
	ldr	r3, .L169+36
	add	r5, sl, r3
	b	.L155
.L170:
	.align	2
.L169:
	.word	_GLOBAL_OFFSET_TABLE_-(.L167+8)
	.word	.LC2(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	1431655766
	.word	.LC5(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC6(GOTOFF)
	.size	player2, .-player2
	.align	2
	.global	player3
	.type	player3, %function
player3:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L196
	ldr	r3, .L196+4
	sub	sp, sp, #28
.L194:
	add	sl, pc, sl
	mov	r2, #0
	ldr	r7, .L196+8
	ldr	r5, .L196+12
	str	r2, [sp, #24]
	add	r4, sl, r3
	str	r2, [sp, #20]
	add	r6, sp, #4
.L172:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L173
	mov	r0, r2
.L174:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L174
.L173:
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r3, r6
	mov	r1, r4
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r7
	bl	bwassert(PLT)
	mov	r0, r6
	add	r1, sl, r5
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L172
	mov	r3, #0
	str	r3, [sp, #24]
	ldr	r2, [sp, #24]
	cmp	r2, #19
	bgt	.L176
	ldr	r7, .L196+16
.L177:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L178
	mov	r0, r2
.L179:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L179
.L178:
	bl	getTime(PLT)
	ldr	r3, .L196+20
	mov	r4, r0
	smull	r1, r2, r3, r0
	sub	r2, r2, r0, asr #31
	add	r3, r2, r2, asl #1
	subs	r2, r0, r3
	bne	.L180
	ldr	r3, .L196+24
	add	r5, sl, r3
.L182:
	mov	r0, r5
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r5
	mov	r3, r6
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r3, r5
	add	r2, sl, r7
	mov	r0, r0, lsr #31
	mov	r1, #1
	str	r4, [sp, #0]
	bl	bwassert(PLT)
	ldr	r3, [sp, #24]
	add	r3, r3, #1
	str	r3, [sp, #24]
	ldr	r2, [sp, #24]
	cmp	r2, #19
	ble	.L177
.L176:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L185
	mov	r0, r2
.L186:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L186
.L185:
	ldr	r3, .L196+28
	add	r4, sl, r3
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r4
	mov	r3, r6
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	bl	Exit(PLT)
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L180:
	cmp	r2, #1
	ldrne	r3, .L196+32
	addne	r5, sl, r3
	bne	.L182
.L195:
	ldr	r3, .L196+36
	add	r5, sl, r3
	b	.L182
.L197:
	.align	2
.L196:
	.word	_GLOBAL_OFFSET_TABLE_-(.L194+8)
	.word	.LC2(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	1431655766
	.word	.LC5(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC6(GOTOFF)
	.size	player3, .-player3
	.align	2
	.global	player4
	.type	player4, %function
player4:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, sl, lr}
	ldr	sl, .L223
	ldr	r3, .L223+4
	sub	sp, sp, #28
.L221:
	add	sl, pc, sl
	mov	r2, #0
	ldr	r7, .L223+8
	ldr	r5, .L223+12
	str	r2, [sp, #24]
	add	r4, sl, r3
	str	r2, [sp, #20]
	add	r6, sp, #4
.L199:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L200
	mov	r0, r2
.L201:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L201
.L200:
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r3, r6
	mov	r1, r4
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r7
	bl	bwassert(PLT)
	mov	r0, r6
	add	r1, sl, r5
	bl	strequal(PLT)
	cmp	r0, #0
	beq	.L199
	mov	r3, #0
	str	r3, [sp, #24]
	ldr	r2, [sp, #24]
	cmp	r2, #9
	bgt	.L203
	ldr	r7, .L223+16
.L204:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L205
	mov	r0, r2
.L206:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L206
.L205:
	bl	getTime(PLT)
	ldr	r3, .L223+20
	mov	r4, r0
	smull	r1, r2, r3, r0
	sub	r2, r2, r0, asr #31
	add	r3, r2, r2, asl #1
	subs	r2, r0, r3
	bne	.L207
	ldr	r3, .L223+24
	add	r5, sl, r3
.L209:
	mov	r0, r5
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r5
	mov	r3, r6
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r3, r5
	add	r2, sl, r7
	mov	r0, r0, lsr #31
	mov	r1, #1
	str	r4, [sp, #0]
	bl	bwassert(PLT)
	ldr	r3, [sp, #24]
	add	r3, r3, #1
	str	r3, [sp, #24]
	ldr	r2, [sp, #24]
	cmp	r2, #9
	ble	.L204
.L203:
	mov	r2, #0
	str	r2, [sp, #20]
	ldr	r3, [sp, #20]
	cmp	r3, #15
	bgt	.L212
	mov	r0, r2
.L213:
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #20]
	add	ip, sp, #28
	add	r3, r3, #1
	str	r3, [sp, #20]
	add	r1, ip, r2
	ldr	r2, [sp, #20]
	strb	r0, [r1, #-24]
	cmp	r2, #15
	ble	.L213
.L212:
	ldr	r3, .L223+28
	add	r4, sl, r3
	mov	r0, r4
	bl	strlength(PLT)
	mov	ip, #16
	mov	r2, r0
	mov	r1, r4
	mov	r3, r6
	mov	r0, #1
	str	ip, [sp, #0]
	bl	Send(PLT)
	bl	Exit(PLT)
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, sl, pc}
.L207:
	cmp	r2, #1
	ldrne	r3, .L223+32
	addne	r5, sl, r3
	bne	.L209
.L222:
	ldr	r3, .L223+36
	add	r5, sl, r3
	b	.L209
.L224:
	.align	2
.L223:
	.word	_GLOBAL_OFFSET_TABLE_-(.L221+8)
	.word	.LC2(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	1431655766
	.word	.LC5(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC6(GOTOFF)
	.size	player4, .-player4
	.align	2
	.global	God
	.type	God, %function
God:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L228
	ldr	r3, .L228+4
.L227:
	add	sl, pc, sl
	ldr	r1, [sl, r3]
	mov	r0, #5
	bl	Create(PLT)
	ldr	r3, .L228+8
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L228+12
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L228+16
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L228+20
	mov	r0, #6
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldmfd	sp!, {sl, lr}
	b	Exit(PLT)
.L229:
	.align	2
.L228:
	.word	_GLOBAL_OFFSET_TABLE_-(.L227+8)
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
	ldr	sl, .L233
.L232:
	add	sl, pc, sl
	MRC p15, 0, r0, c1, c0, 0 
ORR r0, r0, #0x1 <<12 
ORR r0, r0, #0x1 <<2 
MCR p15, 0, r0, c1, c0, 0 

	bl	startTime(PLT)
	ldr	r3, .L233+4
	mov	r0, #1
	ldr	r1, [sl, r3]
	bl	kernelRun(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L234:
	.align	2
.L233:
	.word	_GLOBAL_OFFSET_TABLE_-(.L232+8)
	.word	God(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
