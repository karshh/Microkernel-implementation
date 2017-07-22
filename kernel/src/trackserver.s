	.file	"trackserver.c"
	.text
	.align	2
	.global	shortEdge
	.type	shortEdge, %function
shortEdge:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r0, r1, asl #6
	ldr	r0, [r1, #20]
	@ lr needed for prologue
	cmp	r0, #199
	movgt	r0, #0
	movle	r0, #1
	bx	lr
	.size	shortEdge, .-shortEdge
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"clockServer\000"
	.align	2
.LC1:
	.ascii	"<trackServerPing>: Error sending message to TrackSe"
	.ascii	"rver[%d].\015\012\000"
	.text
	.align	2
	.global	trackServerPing
	.type	trackServerPing, %function
trackServerPing:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	sl, .L8
	ldr	r0, .L8+4
.L6:
	add	sl, pc, sl
	sub	sp, sp, #12
	add	r0, sl, r0
	bl	WhoIs(PLT)
	mov	r6, r0
	bl	MyParentTid(PLT)
	ldr	r9, .L8+8
	mov	r4, r0
	add	r8, sp, #7
	add	r7, sp, #10
	mov	r5, #2
.L4:
	mov	r0, r6
	mov	r1, #25
	bl	Delay(PLT)
	mov	r1, r8
	mov	r2, r5
	mov	r3, r7
	mov	ip, #38
	mov	lr, #0
	mov	r0, r4
	strb	ip, [sp, #7]
	strb	lr, [sp, #8]
	str	r5, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r9
	mov	r3, r4
	bl	bwassert(PLT)
	b	.L4
.L9:
	.align	2
.L8:
	.word	_GLOBAL_OFFSET_TABLE_-(.L6+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.size	trackServerPing, .-trackServerPing
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"trackServer\000"
	.align	2
.LC3:
	.ascii	"Failed to register trackServer.\015\012\000"
	.align	2
.LC4:
	.ascii	"commandServer\000"
	.align	2
.LC5:
	.ascii	"Failed to get CommandServerTID.\015\012\000"
	.align	2
.LC6:
	.ascii	"displayServer\000"
	.align	2
.LC7:
	.ascii	"trainServer\000"
	.align	2
.LC8:
	.ascii	"<trackServer>: Receive error.\015\012\000"
	.align	2
.LC9:
	.ascii	"D10          \000"
	.align	2
.LC10:
	.ascii	"D11Switch Delay:%d\000"
	.align	2
.LC11:
	.ascii	"<trackServer>: Error sending message to CommandServ"
	.ascii	"er.\015\012\000"
	.align	2
.LC12:
	.ascii	"1\000"
	.align	2
.LC13:
	.ascii	"<trackServer>: Error sending message to TrainServer"
	.ascii	"[%d].\015\012\000"
	.align	2
.LC14:
	.ascii	"D24GETNEXTSENSOR cur:%d, next:%d, dist:%d fol:%d fo"
	.ascii	"ld:%d, hasAlt:%d alt:%d altd:%d\000"
	.align	2
.LC15:
	.ascii	"<trackServer> Invalid index %d.\015\012\000"
	.align	2
.LC16:
	.ascii	"<trackServer>: Error sending message to display ser"
	.ascii	"ver.\015\012\000"
	.align	2
.LC17:
	.ascii	"E09\000"
	.align	2
.LC18:
	.ascii	"D10\000"
	.align	2
.LC19:
	.ascii	"E06\000"
	.align	2
.LC20:
	.ascii	"D08\000"
	.align	2
.LC21:
	.ascii	"A04\000"
	.align	2
.LC22:
	.ascii	"C10\000"
	.align	2
.LC23:
	.ascii	"D10 sw15:%d\000"
	.align	2
.LC24:
	.ascii	"B01\000"
	.align	2
.LC25:
	.ascii	"C07\000"
	.align	2
.LC26:
	.ascii	"<trackServer>: Error sending message to DisplayServ"
	.ascii	"er.\015\012\000"
	.align	2
.LC27:
	.ascii	"C05\000"
	.align	2
.LC28:
	.ascii	"0\000"
	.align	2
.LC29:
	.ascii	"<trainServer>: Error sending message to CommandServ"
	.ascii	"er.\015\012\000"
	.align	2
.LC30:
	.ascii	"userPrompt\000"
	.align	2
.LC31:
	.ascii	"sensorServer\000"
	.align	2
.LC32:
	.ascii	"<trackServer>:Invalid code %d from %d [trainTID=%d,"
	.ascii	" commandServerTID=%d, dspTID=%d, userPrompt=%d, sen"
	.ascii	"sorServer=%d]\015\012\000"
	.text
	.align	2
	.global	trackServer
	.type	trackServer, %function
trackServer:
	@ args = 0, pretend = 0, frame = 7932
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L178
	ldr	r0, .L178+4
.L158:
	add	sl, pc, sl
	sub	sp, sp, #7936
	sub	sp, sp, #20
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L178+8
	mov	r1, #1
	add	r2, sl, r2
	rsbs	r0, r0, #1
	movcc	r0, #0
	bl	bwassert(PLT)
	ldr	r0, .L178+12
	ldr	r4, .L178+16
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L178+20
	mov	fp, r0
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r0, .L178+24
	add	r0, sl, r0
	bl	WhoIs(PLT)
	str	r0, [sp, #168]
.L159:
	add	r0, sl, r4
	bl	WhoIs(PLT)
	cmp	r0, #0
	str	r0, [sp, #172]
	bge	.L11
	bl	Pass(PLT)
	b	.L159
.L11:
	ldr	r0, .L178+28
	add	r9, sp, #212
	add	r0, sl, r0
	bl	WhoIs(PLT)
	sub	r9, r9, #24
	str	r0, [sp, #176]
	mov	r0, r9
	bl	TrackGraphInit(PLT)
	ldr	r3, .L178+32
	mov	r0, #10
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	add	r0, sp, #4096
	mov	r1, #0
	str	r1, [r0, #3852]
	str	r1, [r0, #3848]
	str	r1, [r0, #3852]
	ldr	r3, [r0, #3852]
	mvn	r2, #0
	cmp	r3, #79
	str	r2, [r0, #3856]
	bgt	.L13
	mov	r4, r1
.L14:
	add	r1, sp, #4096
	ldr	r2, [r1, #3852]
	ldr	r0, [r1, #3852]
	ldr	r3, [r1, #3852]
	add	r3, sp, #4096
	ldr	r1, [r1, #3852]
	ldr	ip, [r3, #3852]
	ldr	r3, [r3, #3852]
	add	r8, sp, #4096
	add	r3, r3, #1
	add	r6, sp, #7936
	add	r6, r6, #20
	str	r3, [r8, #3852]
	add	lr, r6, r2, asl #2
	ldr	r2, [r8, #3852]
	add	r1, r6, r0, asl #2
	add	r3, r6, ip, asl #2
	cmp	r2, #79
	str	r4, [lr, #-600]
	str	r4, [r1, #-920]
	str	r4, [r3, #-1240]
	ble	.L14
.L13:
	ldr	ip, .L178+36
	ldr	r0, .L178+40
	ldr	r1, .L178+44
	ldr	lr, .L178+48
	str	ip, [sp, #72]
	str	r0, [sp, #164]
	str	r1, [sp, #160]
	ldr	r2, .L178+52
	ldr	r4, .L178+56
	ldr	r6, .L178+60
	ldr	r8, .L178+64
	ldr	ip, .L178+68
	ldr	r0, .L178+72
	ldr	r1, .L178+76
	str	lr, [sp, #68]
	ldr	lr, .L178+80
	str	r2, [sp, #156]
	str	r4, [sp, #152]
	str	r6, [sp, #148]
	str	r8, [sp, #144]
	str	ip, [sp, #140]
	str	r0, [sp, #132]
	str	r1, [sp, #128]
	ldr	r2, .L178+84
	ldr	r4, .L178+88
	ldr	r6, .L178+92
	ldr	r8, .L178+96
	ldr	ip, .L178+100
	ldr	r0, .L178+104
	ldr	r1, .L178+108
	str	lr, [sp, #136]
	ldr	lr, .L178+112
	str	r2, [sp, #116]
	str	r4, [sp, #112]
	str	r6, [sp, #108]
	str	r8, [sp, #104]
	str	ip, [sp, #100]
	str	r0, [sp, #92]
	str	r1, [sp, #88]
	ldr	r2, .L178+116
	ldr	r4, .L178+120
	ldr	r6, .L178+124
	ldr	r8, .L178+128
	ldr	ip, .L178+132
	add	r0, sp, #7936
	add	r1, sp, #7744
	mov	r3, #0
	str	lr, [sp, #96]
	add	r0, r0, #16
	add	lr, sp, #4096
	add	r1, r1, #60
	str	r3, [lr, #3844]
	str	r3, [sp, #180]
	str	r2, [sp, #84]
	str	r4, [sp, #80]
	str	r6, [sp, #56]
	str	r8, [sp, #52]
	str	ip, [sp, #48]
	str	r3, [sp, #184]
	str	r0, [sp, #24]
	str	r1, [sp, #76]
	add	r2, sp, #7872
	add	r3, sp, #7808
	add	r4, sp, #6976
	add	r6, sp, #7872
	add	r8, sp, #7872
	add	ip, sp, #7872
	add	lr, sp, #7872
	add	r0, sp, #7936
	add	r1, sp, #7616
	add	r2, r2, #60
	add	r3, r3, #60
	add	r4, r4, #60
	add	r6, r6, #36
	add	r8, r8, #44
	add	ip, ip, #56
	add	lr, lr, #28
	add	r0, r0, #4
	add	r1, r1, #60
	str	r2, [sp, #32]
	str	r3, [sp, #64]
	str	r4, [sp, #120]
	str	r6, [sp, #44]
	str	r8, [sp, #40]
	str	ip, [sp, #36]
	str	lr, [sp, #60]
	str	r0, [sp, #28]
	str	r1, [sp, #124]
.L160:
	ldr	r1, [sp, #76]
	mov	r2, #64
	ldr	r0, [sp, #24]
	bl	Receive(PLT)
	ldr	r3, [sp, #72]
	mov	r6, r0
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r4, sp, #7680
	bl	bwassert(PLT)
	ldrb	r8, [r4, #124]	@ zero_extendqisi2
	sub	r3, r8, #1
	cmp	r3, #37
	addls	pc, pc, r3, asl #2
	b	.L16
	.p2align 2
.L26:
	b	.L17
	b	.L160
	b	.L16
	b	.L18
	b	.L19
	b	.L20
	b	.L16
	b	.L16
	b	.L16
	b	.L21
	b	.L22
	b	.L23
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
	b	.L16
	b	.L16
	b	.L24
	b	.L16
	b	.L16
	b	.L25
.L17:
	add	ip, sp, #4096
	mov	r3, #1
	str	r3, [ip, #3852]
	ldr	r2, [ip, #3852]
	cmp	r2, #18
	bgt	.L36
.L143:
	add	lr, sp, #4096
	ldr	r3, [lr, #3852]
	ldr	r0, [lr, #3852]
	add	r3, r9, r3, asl #6
	add	r3, r3, #5120
	mov	r2, #2
	str	r2, [r3, #12]
	mov	r1, #11
	add	r2, sp, #7680
	add	r0, r9, r0, asl #6
	strb	r1, [r2, #252]
	add	r0, r0, #5120
	ldr	ip, [r0, #12]
	ldr	lr, [lr, #3852]
	cmp	ip, #1
	movne	ip, #34
	moveq	ip, #33
	add	r4, sp, #7680
	ldr	r3, [sp, #64]
	ldr	r1, [sp, #32]
	strb	ip, [r4, #253]
	mov	ip, #0
	strb	ip, [r4, #255]
	strb	lr, [r4, #254]
	mov	r2, #8
	mov	r0, fp
	mov	r4, #32
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r6, [sp, #160]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r6
	add	r8, sp, #4096
	bl	bwassert(PLT)
	ldr	r2, [sp, #120]
	ldr	r0, [r8, #3852]
	mov	r1, r9
	bl	update_switch(PLT)
	add	ip, sp, #4096
	ldr	r3, [ip, #3852]
	add	r3, r3, #1
	str	r3, [ip, #3852]
	ldr	r2, [ip, #3852]
	cmp	r2, #18
	ble	.L143
.L36:
	add	lr, sp, #4096
	mov	r3, #99
	str	r3, [lr, #3852]
	ldr	r2, [lr, #3852]
	cmp	r2, #100
	bgt	.L41
.L144:
	add	r0, sp, #4096
	ldr	r4, [r0, #3852]
	ldr	r5, [r0, #3852]
	mov	ip, #4
	cmp	r5, #99
	add	r4, r9, r4, asl #6
	movne	r5, #155
	moveq	r5, #153
	str	ip, [r4, #12]
	mov	lr, #34
	add	r4, sp, #7680
	mov	r6, #11
	mov	r7, #0
	ldr	r3, [sp, #64]
	ldr	r1, [sp, #32]
	mov	r8, #32
	strb	lr, [r4, #253]
	strb	r6, [r4, #252]
	strb	r5, [r4, #254]
	strb	r7, [r4, #255]
	mov	r2, #8
	mov	r0, fp
	str	r8, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #160]
	mvn	r0, r0
	add	r2, sl, ip
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	add	lr, sp, #4096
	ldr	r4, [lr, #3852]
	add	ip, sp, #7680
	cmp	r4, #99
	ldr	r3, [sp, #64]
	movne	r4, #156
	moveq	r4, #154
	ldr	r1, [sp, #32]
	add	lr, sp, #7680
	strb	r6, [ip, #252]
	mov	ip, #33
	strb	r4, [lr, #254]
	strb	ip, [lr, #253]
	strb	r7, [lr, #255]
	mov	r2, #8
	mov	r0, fp
	str	r8, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #160]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r4, sp, #7680
	bl	bwassert(PLT)
	add	r6, sp, #4096
	ldr	r2, [sp, #120]
	ldrb	r0, [r4, #254]	@ zero_extendqisi2
	mov	r1, r9
	bl	update_switch(PLT)
	ldr	r3, [r6, #3852]
	add	r3, r3, #1
	str	r3, [r6, #3852]
	ldr	r2, [r6, #3852]
	cmp	r2, #100
	ble	.L144
.L41:
	add	r8, sp, #4096
	mov	r3, #1
	str	r3, [r8, #3852]
	ldr	r2, [r8, #3852]
	cmp	r2, #18
	bgt	.L49
.L145:
	add	lr, sp, #4096
	ldr	ip, [lr, #3852]
	mov	r6, #1
	cmp	ip, #5
	ldr	r1, [sp, #32]
	mov	r2, #8
	ldr	r3, [sp, #64]
	mov	r0, fp
	ble	.L51
	ldr	ip, [lr, #3852]
	cmp	ip, #10
	ble	.L53
.L51:
	add	r4, sp, #4096
	ldr	ip, [r4, #3852]
	cmp	ip, #12
	ble	.L54
	ldr	ip, [r4, #3852]
	cmp	ip, #17
	bgt	.L54
.L53:
	add	r8, sp, #4096
	ldr	lr, [r8, #3852]
	ldr	r4, [r8, #3852]
	add	lr, r9, lr, asl #6
	add	lr, lr, #5120
	str	r6, [lr, #12]
	mov	ip, #11
	add	lr, sp, #7680
	strb	ip, [lr, #252]
	add	r4, r9, r4, asl #6
	add	ip, ip, #21
	ldr	r5, [r8, #3852]
	add	r4, r4, #5120
	str	ip, [sp, #0]
	ldr	lr, [r4, #12]
	sub	ip, ip, #32
	cmp	lr, #1
	add	r4, sp, #7680
	movne	lr, #34
	moveq	lr, #33
	strb	lr, [r4, #253]
	strb	ip, [r4, #255]
	strb	r5, [r4, #254]
	bl	Send(PLT)
	mov	r1, r6
	ldr	r6, [sp, #160]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r6
	add	r8, sp, #4096
	bl	bwassert(PLT)
	ldr	r0, [r8, #3852]
	mov	r1, r9
	ldr	r2, [sp, #120]
	bl	update_switch(PLT)
.L54:
	add	ip, sp, #4096
	ldr	r3, [ip, #3852]
	add	r3, r3, #1
	str	r3, [ip, #3852]
	ldr	r2, [ip, #3852]
	cmp	r2, #18
	ble	.L145
	b	.L49
.L18:
	ldr	r2, [sp, #84]
	add	r1, sp, #4096
	ldr	r0, [r1, #3856]
	add	r1, sl, r2
	mov	r2, #2
	bl	Reply(PLT)
	b	.L160
.L19:
	add	ip, sp, #7680
	ldrb	r5, [ip, #125]	@ zero_extendqisi2
	add	lr, sp, #7936
	add	lr, lr, #20
	add	r4, lr, r5, asl #2
	ldr	r0, [r4, #-1240]
	ldrb	r3, [ip, #126]	@ zero_extendqisi2
	cmp	r0, #0
	mvn	ip, #0
	str	ip, [r4, #-600]
	str	r3, [r4, #-920]
	moveq	lr, r3
	bne	.L162
.L103:
	add	r8, sp, #7424
	mov	ip, #31
	ldr	r3, [sp, #64]
	ldr	r1, [sp, #124]
	ldr	r0, [sp, #168]
	strb	ip, [r8, #252]
	sub	ip, ip, #31
	strb	lr, [r8, #254]
	strb	ip, [r8, #255]
	strb	r5, [r8, #253]
	mov	r4, #32
	mov	r2, #4
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #92]
	mvn	r0, r0
	add	r2, sl, ip
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	ip, #13
	add	lr, sp, #7680
	ldr	r1, [sp, #76]
	ldr	r3, [sp, #64]
	ldr	r0, [sp, #172]
	add	r6, sp, #7680
	strb	ip, [lr, #124]
	mov	lr, #14
	mov	r2, #3
	strb	lr, [r6, #125]
	strb	r5, [r6, #126]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r8, [sp, #152]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r8
	mov	r1, #1
	ldr	r3, [sp, #172]
	bl	bwassert(PLT)
.L121:
	ldr	lr, [sp, #156]
	add	ip, sp, #4096
	ldr	r0, [ip, #3856]
	add	r1, sl, lr
	mov	r2, #2
	bl	Reply(PLT)
	b	.L160
.L20:
	add	r3, sp, #7680
	ldrb	r4, [r3, #125]	@ zero_extendqisi2
	ldrb	r8, [r3, #126]	@ zero_extendqisi2
	cmp	r4, #18
	bgt	.L105
	cmp	r8, #67
	add	r3, r9, r4, asl #6
	movne	r1, #1
	moveq	r1, #2
	add	r3, r3, #5120
	cmp	r8, #83
	mov	r2, #11
	add	r6, sp, #7680
	str	r1, [r3, #12]
	movne	ip, #34
	strb	r2, [r6, #252]
	beq	.L163
.L112:
	add	r6, sp, #7680
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #64]
	mov	lr, #32
	strb	ip, [r6, #253]
	mov	ip, #0
	strb	ip, [r6, #255]
	mov	r0, fp
	str	lr, [sp, #0]
	mov	r2, #8
	strb	r4, [r6, #254]
	bl	Send(PLT)
	ldr	r8, [sp, #80]
	mvn	r0, r0
	add	r2, sl, r8
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r0, r4
	mov	r1, r9
	ldr	r2, [sp, #120]
	bl	update_switch(PLT)
	b	.L121
.L23:
	mov	ip, #13
	add	r4, sp, #7680
	ldr	r1, [sp, #76]
	ldr	r3, [sp, #64]
	mov	r2, r6
	ldr	r0, [sp, #172]
	strb	ip, [r4, #124]
	mov	r4, #32
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r6, [sp, #152]
	mvn	r0, r0
	add	r2, sl, r6
	mov	r0, r0, lsr #31
	mov	r1, #1
	ldr	r3, [sp, #172]
	add	r8, sp, #4096
	bl	bwassert(PLT)
	ldr	r0, [r8, #3856]
	ldr	r1, [sp, #64]
	mov	r2, #2
	bl	Reply(PLT)
	b	.L160
.L24:
	ldr	r1, [sp, #76]
	mov	r2, r6
	ldr	r3, [sp, #64]
	mov	r4, #32
	ldr	r0, [sp, #168]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r3, [sp, #140]
	mvn	r0, r0
	add	r2, sl, r3
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	add	r8, sp, #4096
	mov	r3, #1
	str	r3, [r8, #3848]
	ldr	r2, [r8, #3848]
	cmp	r2, r6
	bge	.L67
	mov	r7, r4
	mov	r8, #0
.L68:
	mov	r3, #58
	add	ip, sp, #4096
	str	r3, [ip, #3852]
.L161:
	add	r4, sp, #4096
	ldr	r3, [r4, #3852]
	cmp	r3, #76
	bgt	.L164
.L70:
	add	lr, sp, #4096
	ldr	r3, [lr, #3852]
	add	r0, sp, #7936
	add	r0, r0, #20
	add	r2, r0, r3, asl #2
	ldr	r1, [r2, #-920]
	cmp	r1, #0
	beq	.L71
	ldr	r2, [lr, #3852]
	ldr	r1, [lr, #3848]
	add	ip, r0, r2, asl #2
	add	r3, r0, r1
	ldrb	r0, [r3, #-152]	@ zero_extendqisi2
	ldr	r2, [ip, #-920]
	cmp	r2, r0
	beq	.L73
	ldr	r3, [lr, #3852]
	add	r1, sp, #7936
	add	r1, r1, #20
	add	r2, r1, r3, asl #2
	ldr	r0, [r2, #-920]
	bl	markedOutSensor(PLT)
	cmp	r0, #0
	bne	.L165
.L71:
	add	lr, sp, #4096
	ldr	r3, [lr, #3852]
	cmp	r3, #58
	addeq	r3, r3, #11
	streq	r3, [lr, #3852]
	beq	.L161
	add	r0, sp, #4096
	ldr	r3, [r0, #3852]
	cmp	r3, #69
	addeq	r3, r3, #1
	streq	r3, [r0, #3852]
	beq	.L161
	add	r1, sp, #4096
	ldr	r3, [r1, #3852]
	add	r4, sp, #4096
	cmp	r3, #70
	addeq	r3, r3, #6
	movne	r3, #99
	addne	r2, sp, #4096
	streq	r3, [r1, #3852]
	strne	r3, [r2, #3852]
	ldr	r3, [r4, #3852]
	cmp	r3, #76
	ble	.L70
.L164:
	ldr	r3, [r4, #3848]
	add	r3, r3, #1
	str	r3, [r4, #3848]
	ldr	r2, [r4, #3848]
	cmp	r6, r2
	bgt	.L68
.L67:
	ldr	r8, [sp, #156]
	add	r6, sp, #4096
	ldr	r0, [r6, #3856]
	add	r1, sl, r8
	mov	r2, #2
	bl	Reply(PLT)
	b	.L160
.L21:
	add	r3, sp, #7680
	ldrb	r1, [r3, #125]	@ zero_extendqisi2
	and	ip, r1, #255
	mov	r3, ip, asl #6
	ldr	r2, [r9, r3]
	add	r0, r9, r3
	cmp	r2, #1
	beq	.L61
	ldrcc	r3, [r0, #16]
	addcc	r4, sp, #7680
	strccb	r3, [r4, #188]
	bcc	.L63
	cmp	r2, #2
	beq	.L166
	mov	r3, ip
	ldr	ip, [sp, #144]
	mov	r1, #1
	mov	r0, #0
	add	r2, sl, ip
	bl	bwassert(PLT)
	add	lr, sp, #7680
	ldrb	r1, [lr, #125]	@ zero_extendqisi2
.L63:
	add	r0, sp, #7680
	ldrb	r2, [r0, #188]	@ zero_extendqisi2
	mov	r0, r9
	bl	getEdgeDistance(PLT)
	add	r1, sp, #4096
	str	r0, [r1, #3852]
	ldr	ip, [r1, #3852]
	ldr	r2, .L178+136
	ldr	r4, [r1, #3852]
	smull	r3, r0, r2, ip
	smull	r6, r1, r2, r4
	mov	r3, r4, asr #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	mov	ip, ip, asr #31
	rsb	ip, ip, r0, asr #5
	add	lr, sp, #7680
	sub	r4, r4, r3, asl #2
	add	r8, sp, #4096
	ldr	r1, [sp, #64]
	ldr	r0, [r8, #3856]
	mov	r2, #3
	strb	ip, [lr, #189]
	strb	r4, [lr, #190]
	bl	Reply(PLT)
	b	.L160
.L22:
	add	lr, sp, #7680
	ldrb	ip, [lr, #125]	@ zero_extendqisi2
	add	r3, sp, #4096
	mov	r1, ip
	str	ip, [r3, #3804]
	ldr	r2, [sp, #44]
	mov	r0, r9
	bl	findNextSensor(PLT)
	add	r4, sp, #4096
	mov	r3, r0
	mov	r1, r0
	str	r3, [r4, #3808]
	mov	r0, r9
	ldr	r2, [sp, #40]
	bl	findNextSensor(PLT)
	add	r6, sp, #4096
	ldr	ip, [r6, #3804]
	str	r0, [r6, #3816]
	add	r3, r9, ip, asl #6
	ldr	r1, [r3, #16]
	ldr	r4, [r9, r1, asl #6]
	cmp	r4, #1
	movne	r3, #0
	addne	lr, sp, #4096
	strne	r3, [lr, #3824]
	beq	.L167
.L35:
	add	r6, sp, #4096
	mov	r2, ip
	ldr	ip, [r6, #3812]
	add	r0, sp, #4096
	ldr	r3, [r0, #3808]
	str	ip, [sp, #0]
	ldr	lr, [r6, #3816]
	ldr	r4, [sp, #148]
	str	lr, [sp, #4]
	ldr	ip, [r6, #3820]
	add	r1, sl, r4
	str	ip, [sp, #8]
	ldr	lr, [r6, #3824]
	ldr	r0, [sp, #168]
	str	lr, [sp, #12]
	ldr	ip, [r6, #3828]
	add	r8, sp, #4096
	str	ip, [sp, #16]
	ldr	r4, [r6, #3832]
	str	r4, [sp, #20]
	bl	iodebug(PLT)
	ldr	r0, [r8, #3856]
	ldr	r1, [sp, #60]
	mov	r2, #32
	bl	Reply(PLT)
	b	.L160
.L16:
	ldr	r1, [sp, #56]
	add	r2, sp, #4096
	add	r0, sl, r1
	ldr	r4, [r2, #3856]
	bl	WhoIs(PLT)
	add	r6, sp, #4096
	ldr	r3, [r6, #3856]
	ldr	ip, [sp, #52]
	cmp	r0, r3
	movne	r7, #0
	moveq	r7, #1
	add	r0, sl, ip
	bl	WhoIs(PLT)
	add	lr, sp, #4096
	ldr	r5, [lr, #3856]
	ldr	r1, [sp, #168]
	ldr	r2, [sp, #172]
	mov	r3, r8
	ldr	r8, [sp, #48]
	cmp	r1, r4
	movne	lr, #0
	moveq	lr, #1
	cmp	r4, r2
	movne	ip, #0
	moveq	ip, #1
	cmp	r0, r5
	movne	r6, #0
	moveq	r6, #1
	cmp	fp, r4
	movne	r4, #0
	moveq	r4, #1
	mov	r0, #0
	mov	r1, #1
	add	r2, sl, r8
	str	ip, [sp, #4]
	str	r4, [sp, #8]
	str	lr, [sp, #12]
	str	r7, [sp, #16]
	str	r6, [sp, #20]
	str	r5, [sp, #0]
	bl	bwassert(PLT)
	b	.L160
.L25:
	ldr	r6, [sp, #180]
	cmp	r6, #0
	bne	.L168
.L27:
	ldr	lr, [sp, #184]
	cmp	lr, #0
	bne	.L169
.L49:
	ldr	r2, [sp, #156]
	add	lr, sp, #4096
	add	r1, sl, r2
	ldr	r0, [lr, #3856]
	mov	r2, #2
	bl	Reply(PLT)
	b	.L160
.L165:
	add	r3, sp, #4096
	ldr	r2, [r3, #3848]
	add	r4, sp, #7936
	ldr	r1, [r3, #3852]
	add	r4, r4, #20
	add	r3, r4, r1, asl #2
	add	ip, r4, r2
	ldr	r1, [r3, #-920]
	mov	r0, r9
	ldr	r2, [sp, #28]
	ldrb	r4, [ip, #-152]	@ zero_extendqisi2
	bl	findNextSensor(PLT)
	cmp	r4, r0
	bne	.L71
.L73:
	add	lr, sp, #4096
	ldr	ip, [lr, #3852]
	add	r0, sp, #7936
	ldr	r2, [lr, #3848]
	ldr	r1, [lr, #3852]
	add	r0, r0, #20
	add	r3, r0, r2
	cmp	r1, #58
	add	r1, sp, #7936
	ldrb	r0, [r3, #-152]	@ zero_extendqisi2
	add	r1, r1, #20
	add	r3, r1, ip, asl #2
	str	r0, [r3, #-600]
	beq	.L170
.L76:
	add	lr, sp, #4096
	ldr	r3, [lr, #3852]
	cmp	r3, #69
	beq	.L171
.L90:
	add	r0, sp, #4096
	ldr	r4, [r0, #3852]
	add	ip, sp, #7936
	ldr	r1, [r0, #3852]
	add	ip, ip, #20
	add	r3, ip, r1, asl #2
	ldr	r2, [sp, #28]
	ldr	r1, [r3, #-600]
	mov	r0, r9
	bl	findNextSensor(PLT)
	add	lr, sp, #4096
	add	r2, sp, #7936
	ldr	r5, [lr, #3852]
	add	r2, r2, #20
	ldr	r1, [lr, #3852]
	add	r3, r2, r4, asl #2
	str	r0, [r3, #-920]
	add	r2, r2, r1, asl #2
	ldr	lr, [r2, #-920]
	add	r4, sp, #7424
	mov	ip, #31
	ldr	r1, [sp, #124]
	ldr	r0, [sp, #168]
	ldr	r3, [sp, #64]
	mov	r2, #4
	strb	ip, [r4, #252]
	strb	r5, [r4, #253]
	strb	lr, [r4, #254]
	strb	r8, [r4, #255]
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #92]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, ip
	bl	bwassert(PLT)
	b	.L71
.L171:
	ldr	r0, [sp, #96]
	ldr	r3, [lr, #3852]
	add	r1, sp, #7936
	add	r1, r1, #20
	add	r5, sl, r0
	add	r2, r1, r3, asl #2
	mov	r0, r5
	ldr	r4, [r2, #-600]
	bl	sensor2i(PLT)
	cmp	r4, r0
	beq	.L172
.L92:
	add	lr, sp, #4096
	ldr	r3, [lr, #3852]
	ldr	r1, [sp, #116]
	add	r4, sp, #7936
	add	r4, r4, #20
	add	r2, r4, r3, asl #2
	add	r0, sl, r1
	ldr	r4, [r2, #-600]
	bl	sensor2i(PLT)
	cmp	r4, r0
	beq	.L94
	add	ip, sp, #4096
	ldr	r3, [ip, #3852]
	ldr	lr, [sp, #88]
	add	r1, sp, #7936
	add	r1, r1, #20
	add	r2, r1, r3, asl #2
	add	r0, sl, lr
	ldr	r4, [r2, #-600]
	bl	sensor2i(PLT)
	cmp	r4, r0
	bne	.L90
.L94:
	add	r2, sp, #4096
	ldr	r3, [r2, #3852]
	add	lr, sp, #7680
	ldr	r4, [r2, #3852]
	mov	ip, #13
	ldr	r1, [sp, #76]
	ldr	r3, [sp, #64]
	ldr	r0, [sp, #172]
	strb	ip, [lr, #124]
	add	ip, sp, #7680
	mov	lr, #9
	strb	lr, [ip, #125]
	strb	r4, [ip, #126]
	mov	r2, #3
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	lr, [sp, #152]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, lr
	ldr	r3, [sp, #172]
	bl	bwassert(PLT)
	b	.L90
.L179:
	.align	2
.L178:
	.word	_GLOBAL_OFFSET_TABLE_-(.L158+8)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC0(GOTOFF)
	.word	trackServerPing(GOT)
	.word	.LC8(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	.LC27(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	1374389535
	.word	5708
	.word	6092
.L170:
	ldr	r2, [sp, #136]
	ldr	r3, [lr, #3852]
	add	r0, sl, r2
	add	r2, r1, r3, asl #2
	ldr	r4, [r2, #-600]
	bl	sensor2i(PLT)
	cmp	r4, r0
	beq	.L78
	add	r4, sp, #4096
	ldr	r3, [r4, #3852]
	ldr	ip, [sp, #132]
	add	lr, sp, #7936
	add	lr, lr, #20
	add	r2, lr, r3, asl #2
	add	r0, sl, ip
	ldr	r4, [r2, #-600]
	bl	sensor2i(PLT)
	cmp	r4, r0
	beq	.L78
.L80:
	add	r0, sp, #4096
	ldr	r3, [r0, #3852]
	ldr	r1, [sp, #128]
	add	r4, sp, #7936
	add	r4, r4, #20
	add	r2, r4, r3, asl #2
	add	r0, sl, r1
	ldr	r4, [r2, #-600]
	bl	sensor2i(PLT)
	cmp	r4, r0
	beq	.L81
	add	ip, sp, #4096
	ldr	r3, [ip, #3852]
	ldr	lr, [sp, #116]
	add	r1, sp, #7936
	add	r1, r1, #20
	add	r2, r1, r3, asl #2
	add	r0, sl, lr
	ldr	r4, [r2, #-600]
	bl	sensor2i(PLT)
	cmp	r4, r0
	beq	.L81
.L83:
	add	r2, sp, #4096
	ldr	r4, [sp, #112]
	ldr	r3, [r2, #3852]
	add	ip, sp, #7936
	add	ip, ip, #20
	add	r0, sl, r4
	add	r2, ip, r3, asl #2
	ldr	r4, [r2, #-600]
	bl	sensor2i(PLT)
	cmp	r4, r0
	beq	.L173
.L84:
	add	r0, sp, #4096
	ldr	r3, [r0, #3852]
	ldr	r1, [sp, #108]
	add	r4, sp, #7936
	add	r4, r4, #20
	add	r2, r4, r3, asl #2
	add	r0, sl, r1
	ldr	r4, [r2, #-600]
	bl	sensor2i(PLT)
	cmp	r4, r0
	beq	.L174
.L86:
	add	lr, sp, #4096
	ldr	r3, [lr, #3852]
	ldr	r1, [sp, #128]
	add	r4, sp, #7936
	add	r4, r4, #20
	add	r2, r4, r3, asl #2
	add	r0, sl, r1
	ldr	r4, [r2, #-600]
	bl	sensor2i(PLT)
	cmp	r4, r0
	beq	.L88
	add	ip, sp, #4096
	ldr	r3, [ip, #3852]
	ldr	lr, [sp, #100]
	add	r1, sp, #7936
	add	r1, r1, #20
	add	r2, r1, r3, asl #2
	add	r0, sl, lr
	ldr	r4, [r2, #-600]
	bl	sensor2i(PLT)
	cmp	r4, r0
	bne	.L76
.L88:
	add	r4, sp, #7680
	mov	ip, #13
	ldr	r1, [sp, #76]
	ldr	r3, [sp, #64]
	ldr	r0, [sp, #172]
	mov	lr, #14
	strb	ip, [r4, #124]
	add	ip, ip, #56
	strb	ip, [r4, #126]
	strb	lr, [r4, #125]
	mov	r2, #3
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #152]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, ip
	ldr	r3, [sp, #172]
	bl	bwassert(PLT)
	b	.L76
.L81:
	ldr	r0, [sp, #176]
	bl	Time(PLT)
	str	r0, [sp, #184]
	b	.L83
.L78:
	add	r4, sp, #4096
	mov	ip, #2
	str	ip, [r4, #1800]
	mov	lr, #11
	add	ip, sp, #7680
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #64]
	strb	lr, [ip, #252]
	mov	ip, #34
	add	lr, sp, #7680
	strb	ip, [lr, #253]
	add	r4, sp, #7680
	mov	lr, #9
	strb	lr, [r4, #254]
	strb	r8, [r4, #255]
	mov	r2, #4
	mov	r0, fp
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #160]
	mvn	r0, r0
	add	r2, sl, ip
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	add	lr, sp, #4096
	ldr	r0, [lr, #3852]
	mov	r1, r9
	ldr	r2, [sp, #120]
	bl	update_switch(PLT)
	b	.L80
.L105:
	cmp	r4, #19
	beq	.L175
	cmp	r4, #20
	bne	.L121
	cmp	r8, #68
	movne	r3, #3
	moveq	r3, #4
	add	r0, sp, #4096
	mov	r2, #11
	add	r1, sp, #7680
	str	r3, [r0, #2504]
	movne	ip, #33
	strb	r2, [r1, #252]
	beq	.L176
.L128:
	add	lr, sp, #7680
	ldr	r3, [sp, #64]
	ldr	r1, [sp, #32]
	mov	r5, #0
	strb	ip, [lr, #253]
	mvn	ip, #100
	strb	ip, [lr, #254]
	strb	r5, [lr, #255]
	mov	r6, #32
	mov	r2, #8
	mov	r0, fp
	str	r6, [sp, #0]
	bl	Send(PLT)
	ldr	r1, [sp, #80]
	mvn	r0, r0
	add	r7, sl, r1
	mov	r2, r7
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	cmp	r8, #68
	mov	ip, #11
	add	r8, sp, #7680
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #64]
	movne	r4, #34
	moveq	r4, #33
	strb	ip, [r8, #252]
	sub	ip, ip, #111
	strb	ip, [r8, #254]
	strb	r4, [r8, #253]
	strb	r5, [r8, #255]
	mov	r2, #8
	mov	r0, fp
	str	r6, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r2, r7
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r0, #156
	mov	r1, r9
	ldr	r2, [sp, #120]
	bl	update_switch(PLT)
	b	.L121
.L162:
	add	r6, sp, #7680
	ldr	r1, [sp, #64]
	mov	r2, #2
	strb	r3, [r6, #188]
	strb	ip, [r6, #189]
	bl	Reply(PLT)
	ldr	lr, [r4, #-920]
	mov	r3, #0
	str	r3, [r4, #-1240]
	b	.L103
.L169:
	ldr	r0, [sp, #176]
	bl	Time(PLT)
	ldr	r1, [sp, #184]
	rsb	r0, r1, r0
	cmp	r0, #24
	ble	.L49
	ldr	ip, .L178+140
	mov	r4, #1
	str	r4, [r9, ip]
	add	r6, sp, #7680
	mov	lr, #32
	mov	ip, #11
	ldr	r3, [sp, #64]
	ldr	r1, [sp, #32]
	str	lr, [sp, #0]
	mov	r5, #0
	add	lr, lr, r4
	strb	ip, [r6, #252]
	sub	ip, ip, #2
	strb	lr, [r6, #253]
	strb	ip, [r6, #254]
	mov	r2, #4
	mov	r0, fp
	strb	r5, [r6, #255]
	bl	Send(PLT)
	ldr	r8, [sp, #160]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, r4
	add	r2, sl, r8
	bl	bwassert(PLT)
	add	ip, sp, #4096
	ldr	r0, [ip, #3852]
	mov	r1, r9
	ldr	r2, [sp, #120]
	bl	update_switch(PLT)
	str	r5, [sp, #184]
	b	.L49
.L168:
	ldr	r0, [sp, #176]
	bl	Time(PLT)
	rsb	r0, r6, r0
	cmp	r0, #99
	ble	.L27
	ldr	r8, [sp, #68]
	ldr	r0, [sp, #168]
	add	r1, sl, r8
	bl	iodebug(PLT)
	ldr	r0, [sp, #176]
	bl	Time(PLT)
	ldr	ip, [sp, #164]
	rsb	r2, r6, r0
	add	r1, sl, ip
	ldr	r0, [sp, #168]
	bl	iodebug(PLT)
	ldr	ip, .L178+144
	mov	r4, #1
	mov	lr, #32
	str	r4, [r9, ip]
	mov	r2, #4
	str	lr, [sp, #0]
	mov	ip, #11
	add	lr, sp, #7680
	ldr	r3, [sp, #64]
	ldr	r1, [sp, #32]
	add	r6, sp, #7680
	strb	ip, [lr, #252]
	mov	r5, #0
	add	ip, ip, r2
	mov	lr, #33
	strb	lr, [r6, #253]
	strb	ip, [r6, #254]
	mov	r0, fp
	strb	r5, [r6, #255]
	bl	Send(PLT)
	ldr	r8, [sp, #160]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, r4
	add	r2, sl, r8
	bl	bwassert(PLT)
	add	ip, sp, #4096
	ldr	r0, [ip, #3852]
	mov	r1, r9
	ldr	r2, [sp, #120]
	bl	update_switch(PLT)
	str	r5, [sp, #180]
	b	.L27
.L61:
	ldr	r3, [r0, #12]
	add	r6, sp, #7680
	cmp	r3, #2
	ldreqb	r3, [r0, #28]	@ zero_extendqisi2
	ldrneb	r3, [r0, #36]	@ zero_extendqisi2
	strb	r3, [r6, #188]
	b	.L63
.L174:
	ldr	r0, [sp, #176]
	bl	Time(PLT)
	ldr	ip, [sp, #104]
	str	r0, [sp, #180]
	add	r1, sl, ip
	ldr	r0, [sp, #168]
	ldr	r2, [sp, #180]
	bl	iodebug(PLT)
	b	.L86
.L173:
	ldr	ip, .L178+144
	mov	r4, #2
	str	r4, [r9, ip]
	mov	r2, #4
	add	r4, sp, #7680
	mov	lr, #11
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #64]
	mov	ip, #34
	strb	lr, [r4, #252]
	add	lr, lr, r2
	strb	lr, [r4, #254]
	strb	ip, [r4, #253]
	strb	r8, [r4, #255]
	mov	r0, fp
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #160]
	mvn	r0, r0
	add	r2, sl, ip
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	add	lr, sp, #4096
	ldr	r0, [lr, #3852]
	mov	r1, r9
	ldr	r2, [sp, #120]
	bl	update_switch(PLT)
	b	.L84
.L172:
	mov	r0, r5
	bl	sensor2i(PLT)
	add	lr, sp, #4096
	mvn	ip, #0
	str	ip, [lr, #3492]
	add	ip, sp, #7424
	mov	lr, #31
	ldr	r3, [sp, #64]
	ldr	r1, [sp, #124]
	mov	r4, r0
	ldr	r0, [sp, #168]
	strb	lr, [ip, #252]
	add	lr, sp, #7424
	mov	ip, #58
	strb	ip, [lr, #253]
	add	ip, sp, #4096
	str	r4, [ip, #3172]
	strb	r4, [lr, #254]
	strb	r8, [lr, #255]
	mov	r2, #4
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	lr, [sp, #92]
	mvn	r0, r0
	add	r2, sl, lr
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	add	r4, sp, #7680
	mov	ip, #39
	ldr	r1, [sp, #76]
	ldr	r3, [sp, #64]
	ldr	r0, [sp, #172]
	mov	r2, #2
	strb	ip, [r4, #124]
	strb	r8, [r4, #125]
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #152]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, ip
	ldr	r3, [sp, #172]
	bl	bwassert(PLT)
	b	.L92
.L167:
	mov	r0, r9
	ldr	r2, [sp, #36]
	bl	findAltSensor(PLT)
	add	r8, sp, #4096
	ldr	ip, [r8, #3804]
	str	r0, [r8, #3828]
	str	r4, [r8, #3824]
	b	.L35
.L163:
	mov	ip, #33
	b	.L112
.L175:
	cmp	r8, #68
	add	ip, sp, #4096
	movne	r3, #3
	moveq	r3, #4
	mov	r2, #11
	add	lr, sp, #7680
	str	r3, [ip, #2440]
	strb	r2, [lr, #252]
	movne	ip, #33
	beq	.L177
.L120:
	add	lr, sp, #7680
	ldr	r3, [sp, #64]
	ldr	r1, [sp, #32]
	mov	r6, #0
	strb	ip, [lr, #253]
	mvn	ip, #102
	strb	ip, [lr, #254]
	strb	r6, [lr, #255]
	mov	r7, #32
	mov	r0, fp
	mov	r2, #8
	str	r7, [sp, #0]
	bl	Send(PLT)
	ldr	r1, [sp, #80]
	mvn	r0, r0
	add	r5, sl, r1
	mov	r2, r5
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	cmp	r8, #68
	mov	ip, #11
	add	r8, sp, #7680
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #64]
	movne	r4, #34
	moveq	r4, #33
	strb	ip, [r8, #252]
	sub	ip, ip, #113
	strb	ip, [r8, #254]
	strb	r4, [r8, #253]
	strb	r6, [r8, #255]
	mov	r0, fp
	mov	r2, #8
	str	r7, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r2, r5
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	mov	r0, #154
	mov	r1, r9
	ldr	r2, [sp, #120]
	bl	update_switch(PLT)
	b	.L121
.L166:
	ldr	r3, [r0, #44]
	add	r8, sp, #7680
	strb	r3, [r8, #188]
	b	.L63
.L177:
	mov	ip, #34
	b	.L120
.L176:
	mov	ip, #34
	b	.L128
	.size	trackServer, .-trackServer
	.ident	"GCC: (GNU) 4.0.2"
