	.file	"displayserver.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"userPrompt\000"
	.align	2
.LC1:
	.ascii	"UART2R\000"
	.align	2
.LC2:
	.ascii	"<UserPrompt>: UART2ReceiveServer has not been set u"
	.ascii	"p.\015\012\000"
	.align	2
.LC3:
	.ascii	"<UserPrompt>: could not send prompt response to ser"
	.ascii	"ver. \015\012\000"
	.align	2
.LC4:
	.ascii	"<UserPrompt>: could not send backspace to server. \015"
	.ascii	"\012\000"
	.align	2
.LC5:
	.ascii	"<UserPrompt>: could not send character to server.[%"
	.ascii	"d] \015\012\000"
	.text
	.align	2
	.global	UserPrompt
	.type	UserPrompt, %function
UserPrompt:
	@ args = 0, pretend = 0, frame = 312
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r0, .L27
	sub	sp, sp, #316
	ldr	sl, .L27+4
	str	r0, [sp, #16]
	ldr	r0, .L27+8
.L23:
	add	sl, pc, sl
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	bl	MyParentTid(PLT)
	str	r0, [sp, #40]
	ldr	r0, .L27+12
	ldr	r1, .L27+16
	add	r0, sl, r0
	str	r1, [sp, #12]
	bl	WhoIs(PLT)
	ldr	r2, .L27+20
	mov	fp, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r3, .L27+24
	mov	r2, #0
	add	r3, sl, r3
	str	r3, [sp, #36]
	add	r3, sp, #236
	str	r3, [sp, #28]
	add	r5, sp, #172
	add	ip, sp, #48
	add	r0, sp, #308
	add	r1, sp, #304
	add	r3, sp, #300
	str	r2, [sp, #44]
	mov	r8, #2
	str	r5, [sp, #24]
	stmib	sp, {r0, ip}	@ phole stm
	str	r1, [sp, #20]
	str	r3, [sp, #32]
	strb	r2, [sp, #315]
.L24:
	mov	r0, fp
	mov	r1, #1
	bl	Getc(PLT)
	strb	r0, [sp, #315]
	ldrb	r3, [sp, #315]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L24
	ldr	ip, [sp, #44]
	cmp	ip, #31
	ble	.L5
	ldrb	r3, [sp, #315]	@ zero_extendqisi2
	cmp	r3, #8
	bne	.L24
.L5:
	ldrb	r3, [sp, #315]	@ zero_extendqisi2
	cmp	r3, #13
	beq	.L26
	ldrb	r3, [sp, #315]	@ zero_extendqisi2
	cmp	r3, #8
	bne	.L13
	cmp	r8, #2
	ble	.L24
	ldr	r5, .L27+28
	sub	r8, r8, #1
	smull	ip, r3, r5, r8
	mov	lr, r8, asr #31
	rsb	lr, lr, r3, asr #5
	ldr	r0, [sp, #44]
	add	ip, lr, lr, asl #2
	sub	r0, r0, #1
	add	r2, sp, #316
	add	ip, ip, ip, asl #2
	add	r4, r2, r0
	sub	ip, r8, ip, asl #2
	mov	r5, #0
	str	r0, [sp, #44]
	ldr	r1, [sp, #28]
	ldr	r0, [sp, #40]
	ldr	r3, [sp, #24]
	strb	ip, [sp, #238]
	strb	r5, [r4, #-268]
	mov	ip, #1
	strb	r5, [sp, #239]
	mov	r2, #4
	mov	r5, #64
	strb	ip, [sp, #236]
	strb	lr, [sp, #237]
	str	r5, [sp, #0]
	bl	Send(PLT)
	ldr	ip, [sp, #16]
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, ip
	bl	bwassert(PLT)
	b	.L24
.L13:
	ldr	r0, .L27+28
	mov	r4, r8, asr #31
	smull	r1, r3, r0, r8
	rsb	r4, r4, r3, asr #5
	ldr	r3, [sp, #44]
	ldrb	r6, [sp, #315]	@ zero_extendqisi2
	add	r2, sp, #316
	add	lr, r4, r4, asl #2
	add	r5, r2, r3
	ldrb	r7, [sp, #315]	@ zero_extendqisi2
	mov	ip, #2
	add	lr, lr, lr, asl #2
	sub	lr, r8, lr, asl #2
	ldr	r1, [sp, #28]
	ldr	r3, [sp, #24]
	mov	r2, #5
	ldr	r0, [sp, #40]
	strb	ip, [sp, #236]
	strb	r6, [r5, #-268]
	add	ip, ip, #62
	mov	r5, #0
	str	ip, [sp, #0]
	strb	lr, [sp, #238]
	strb	r5, [sp, #240]
	strb	r7, [sp, #239]
	strb	r4, [sp, #237]
	bl	Send(PLT)
	ldr	r5, [sp, #12]
	mov	r3, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, r5
	bl	bwassert(PLT)
	ldr	ip, [sp, #44]
	add	r8, r8, #1
	add	ip, ip, #1
	str	ip, [sp, #44]
	b	.L24
.L26:
	ldr	r5, [sp, #44]
	add	r0, sp, #316
	add	lr, r0, r5
	mov	r9, #0
	mov	ip, #20
	ldr	r3, [sp, #24]
	ldr	r1, [sp, #28]
	mov	r2, #2
	ldr	r0, [sp, #40]
	strb	ip, [sp, #236]
	strb	r9, [lr, #-268]
	add	ip, ip, #44
	str	ip, [sp, #0]
	strb	r9, [sp, #237]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	ldr	r2, [sp, #36]
	bl	bwassert(PLT)
	ldr	r1, [sp, #4]
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #32]
	ldr	r0, [sp, #8]
	bl	parseCommand(PLT)
	ldr	r7, [sp, #300]
	ldr	ip, .L27+28
	ldr	r3, .L27+32
	ldr	r2, .L27+36
	smull	r1, r6, r3, r7
	smull	r5, r3, r2, r7
	smull	r1, r5, ip, r7
	mov	r4, r7, asr #31
	rsb	r5, r4, r5, asr #5
	mov	r2, ip
	rsb	r6, r4, r6, asr #18
	rsb	r4, r4, r3, asr #12
	smull	r3, r8, r2, r5
	smull	r3, ip, r2, r6
	smull	r1, lr, r2, r4
	mov	r1, r5, asr #31
	mov	r3, r6, asr #31
	mov	r2, r4, asr #31
	rsb	r1, r1, r8, asr #5
	rsb	r3, r3, ip, asr #5
	rsb	r2, r2, lr, asr #5
	add	ip, r5, r5, asl #2
	add	r1, r1, r1, asl #2
	add	r1, r1, r1, asl #2
	add	ip, ip, ip, asl #2
	add	r3, r3, r3, asl #2
	add	r2, r2, r2, asl #2
	sub	r5, r5, r1, asl #2
	ldr	lr, [sp, #304]
	add	r3, r3, r3, asl #2
	add	r2, r2, r2, asl #2
	sub	r7, r7, ip, asl #2
	ldr	ip, [sp, #308]
	strb	r0, [sp, #236]
	sub	r6, r6, r3, asl #2
	sub	r4, r4, r2, asl #2
	ldr	r1, [sp, #28]
	mov	r2, #8
	ldr	r3, [sp, #24]
	strb	r5, [sp, #241]
	ldr	r0, [sp, #40]
	mov	r5, #64
	strb	ip, [sp, #237]
	strb	lr, [sp, #238]
	strb	r6, [sp, #239]
	strb	r4, [sp, #240]
	strb	r7, [sp, #242]
	strb	r9, [sp, #243]
	str	r5, [sp, #0]
	bl	Send(PLT)
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	ldr	r2, [sp, #36]
	bl	bwassert(PLT)
	ldr	ip, [sp, #44]
	cmp	ip, r9
	blt	.L9
	mov	r3, r9
	mov	r2, r9
.L11:
	ldr	r0, [sp, #8]
	strb	r2, [r3, r0]
	ldr	r1, [sp, #44]
	add	r3, r3, #1
	cmp	r1, r3
	bge	.L11
.L9:
	ldrb	r3, [sp, #236]	@ zero_extendqisi2
	cmp	r3, #10
	movne	r5, #0
	strne	r5, [sp, #44]
	movne	r8, #2
	bne	.L24
	bl	Exit(PLT)
	mov	r8, #2
	mov	r2, #0
	str	r2, [sp, #44]
	b	.L24
.L28:
	.align	2
.L27:
	.word	.LC4(GOTOFF)
	.word	_GLOBAL_OFFSET_TABLE_-(.L23+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	1374389535
	.word	1125899907
	.word	1759218605
	.size	UserPrompt, .-UserPrompt
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"<trainServer>: Debug Statement failed\000"
	.text
	.align	2
	.global	ioformat
	.type	ioformat, %function
ioformat:
	@ args = 0, pretend = 0, frame = 4124
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #4096
	sub	sp, sp, #32
	ldr	r3, .L64
	mov	r8, r0
	add	r0, sp, #4096
	add	r0, r0, #32
	add	r7, sp, #32
	ldr	sl, .L64+4
	sub	r7, r7, #21
	mov	r6, r2
	str	r1, [r0, r3]
	mov	r2, #0
	add	r3, r3, #7
	mov	r5, r7
	strb	r2, [r0, r3]
.L58:
	add	sl, pc, sl
.L60:
	ldr	ip, .L64
	add	r2, sp, #4096
	add	r2, r2, #32
	ldr	r1, [r2, ip]
	add	r0, sp, #4096
	mov	r3, r1
	ldrb	r2, [r3], #1	@ zero_extendqisi2
	add	r0, r0, #32
	cmp	r2, #0
	str	r3, [r0, ip]
	beq	.L62
	cmp	r2, #37
	strneb	r2, [r5], #1
	bne	.L60
.L32:
	mov	r3, #0
	add	r2, sp, #4096
	str	r3, [r2, #28]
	ldrb	r0, [r1, #1]	@ zero_extendqisi2
	add	r2, sp, #4096
	add	r3, r1, #2
	add	r2, r2, #32
	cmp	r0, #48
	str	r3, [r2, ip]
	beq	.L35
	bcc	.L34
	cmp	r0, #57
	bhi	.L34
	add	r1, sp, #32
	add	r3, sp, #4096
	sub	r1, r1, #28
	mov	r2, #10
	add	r3, r3, #28
	bl	bwa2i(PLT)
.L34:
	cmp	r0, #115
	beq	.L41
	bhi	.L44
	cmp	r0, #99
	beq	.L39
	bhi	.L45
	cmp	r0, #0
	bne	.L63
.L47:
	add	sp, sp, #32
	add	sp, sp, #4096
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L44:
	cmp	r0, #117
	beq	.L42
	cmp	r0, #120
	bne	.L60
	add	r4, sp, #4096
	add	r4, r4, #11
	ldr	r0, [r6, #0]
	mov	r1, #16
	mov	r2, r4
	bl	bwui2a(PLT)
.L59:
	add	r1, sp, #4096
	mov	r3, r5
	ldr	r0, [r1, #28]
	mov	r2, r4
	mov	r1, #48
	bl	sPutw(PLT)
	add	r3, r6, #4
	add	r5, r5, r0
	mov	r6, r3
	b	.L60
.L41:
	add	r1, sp, #4096
	mov	r3, r5
	ldr	r2, [r6, #0]
	ldr	r0, [r1, #28]
	mov	r1, #32
	bl	sPutw(PLT)
	add	r3, r6, #4
	add	r5, r5, r0
	mov	r6, r3
	b	.L60
.L35:
	ldrb	r0, [r1, #2]	@ zero_extendqisi2
	add	r3, r1, #3
	add	r1, sp, #4096
	add	r1, r1, #32
	str	r3, [r1, ip]
	b	.L34
.L62:
	strb	r2, [r5], #1
	add	r3, sp, #4096
	mov	r1, r7
	rsb	r2, r7, r5
	mov	ip, #5
	mov	r0, r8
	add	r3, r3, #23
	str	ip, [sp, #0]
	bl	Send(PLT)
	ldr	r2, .L64+8
	mvn	r0, r0
	mov	r0, r0, lsr #31
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	b	.L47
.L45:
	cmp	r0, #100
	bne	.L60
	add	r4, sp, #4096
	add	r4, r4, #11
	ldr	r0, [r6, #0]
	mov	r1, r4
	bl	bwi2a(PLT)
	b	.L59
.L63:
	cmp	r0, #37
	streqb	r0, [r5], #1
	b	.L60
.L42:
	add	r4, sp, #4096
	add	r4, r4, #11
	ldr	r0, [r6, #0]
	mov	r1, #10
	mov	r2, r4
	bl	bwui2a(PLT)
	b	.L59
.L39:
	ldrb	r3, [r6, #0]	@ zero_extendqisi2
	add	r6, r6, #4
	strb	r3, [r5], #1
	b	.L60
.L65:
	.align	2
.L64:
	.word	-4124
	.word	_GLOBAL_OFFSET_TABLE_-(.L58+8)
	.word	.LC6(GOTOFF)
	.size	ioformat, .-ioformat
	.align	2
	.global	iodebug
	.type	iodebug, %function
iodebug:
	@ args = 4, pretend = 12, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 1
	stmfd	sp!, {r1, r2, r3}
	str	lr, [sp, #-4]!
	ldr	r1, [sp, #4]
	add	r2, sp, #8
	bl	ioformat(PLT)
	ldr	lr, [sp], #4
	add	sp, sp, #12
	bx	lr
	.size	iodebug, .-iodebug
	.section	.rodata.str1.4
	.align	2
.LC7:
	.ascii	"displayServer\000"
	.align	2
.LC8:
	.ascii	"Failed to register displayServer.\015\012\000"
	.align	2
.LC9:
	.ascii	"UART2S\000"
	.align	2
.LC10:
	.ascii	"<displayGrid>: UART2SendServer has not been set up."
	.ascii	"\015\012\000"
	.align	2
.LC11:
	.ascii	"<displayGrid>: UART2SReceiveServer has not been set"
	.ascii	" up.\015\012\000"
	.align	2
.LC12:
	.ascii	"clockServer\000"
	.align	2
.LC13:
	.ascii	"<displayServer>: Receive error.\015\012\000"
	.align	2
.LC14:
	.ascii	"\033[34;%dH\033[K\000"
	.align	2
.LC15:
	.ascii	"\033[34;%dH%c\000"
	.align	2
.LC16:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KSwitch %d is config"
	.ascii	"ured as %c now.\033[34;1H>\000"
	.align	2
.LC17:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KReversed train %d a"
	.ascii	"t speed %d\033[34;1H>\000"
	.align	2
.LC18:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KUpdated train %d's "
	.ascii	"speed to %d.\033[34;1H>\000"
	.align	2
.LC19:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KSet Train's %d ligh"
	.ascii	"ts on.\033[34;1H>\000"
	.align	2
.LC20:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KPinging Sensor %c%2"
	.ascii	"d manually.\033[34;1H>\000"
	.align	2
.LC21:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KExecuting, please w"
	.ascii	"ait.\033[34;1H>\000"
	.align	2
.LC22:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KPath for train %d s"
	.ascii	"et up en route to sensor %d and stop %d mm\033[34;1"
	.ascii	"H>\000"
	.align	2
.LC23:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KCould not set up pa"
	.ascii	"th for train %d to sensor %d.\033[34;1H>\000"
	.align	2
.LC24:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KProgram is now awai"
	.ascii	"ting train %d to flick sensor %d in order to comple"
	.ascii	"te registration.\033[34;1H>\000"
	.align	2
.LC25:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KCould not init trai"
	.ascii	"n %d on sensor %d due to track reservation.\033[34;"
	.ascii	"1H>\000"
	.align	2
.LC26:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KQuiting Kernel.\033"
	.ascii	"[34;1H>\000"
	.align	2
.LC27:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KTrain Reverse Locke"
	.ascii	"d.Cannot turn on Train %d's lights.\033[34;1H>\000"
	.align	2
.LC28:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KTrain Reverse Locke"
	.ascii	"d.Cannot Change Train %d's speed.\033[34;1H>\000"
	.align	2
.LC29:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KTrain Reverse Locke"
	.ascii	"d.Cannot Reverse Train %d.\033[34;1H>\000"
	.align	2
.LC30:
	.ascii	"\033[s\033[?25l\033[%d;71H\033[K\000"
	.align	2
.LC31:
	.ascii	"\033[u\033[?25h\000"
	.align	2
.LC32:
	.ascii	"1\000"
	.align	2
.LC33:
	.ascii	"\033[s\033[?25l\033[1;10HSensor ping elapse:%dms \033"
	.ascii	"[u\033[?25h\000"
	.align	2
.LC34:
	.ascii	"\033[s\033[?25l\033[%d;13H--->%c%d%d<---\033[u\033["
	.ascii	"?25h\000"
	.align	2
.LC35:
	.ascii	"\033[s\033[?25l\033[%d;13H    \033[%d;20H    \033[u"
	.ascii	"\033[?25h\000"
	.align	2
.LC36:
	.ascii	"\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[KInit"
	.ascii	"ializing Trains %d.\033[34;1H>\033[u\033[?25h\000"
	.align	2
.LC37:
	.ascii	"\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[KInit"
	.ascii	"ializing Switches.\033[34;1H>\033[u\033[?25h\000"
	.align	2
.LC38:
	.ascii	"\033[s\033[?25l\033[34;1H\033[K\033[35;1H\033[K\033"
	.ascii	"[34;1H>\033[u\033[?25h\000"
	.align	2
.LC39:
	.ascii	"\033[s\033[?25l\033[%d;30H%c%d%d\033[u\033[?25h\000"
	.align	2
.LC40:
	.ascii	"\033[s\033[?25l\033[%d;11H\033[1m\033[31m%c\033[0m\033"
	.ascii	"[u\033[?25h\000"
	.align	2
.LC41:
	.ascii	"\033[s\033[?25l\033[%d;11H%c\033[u\033[?25h\000"
	.global	__divsi3
	.align	2
.LC42:
	.ascii	"\033[s\033[?25l\033[%d;%dH                 \033[s\033"
	.ascii	"[?25l\033[%d;%dH%dms[%dum/ms]\033[u\033[?25h\000"
	.align	2
.LC43:
	.ascii	"\033[s\033[?25l\033[1;125H%d%d:%d%d:%d%d.%d\033[u\033"
	.ascii	"[?25h\000"
	.align	2
.LC44:
	.ascii	"\033[s\033[?25l\033[1;68H%d%% \033[u\033[?25h\000"
	.align	2
.LC45:
	.ascii	"\033[s\033[?25l\033[%d;35H%d\033[u\033[?25h\000"
	.align	2
.LC46:
	.ascii	"\033[s\033[?25l\033[2;68HDelta Time: %10d Delta Dis"
	.ascii	"t:%10d \033[u\033[?25h\000"
	.align	2
.LC47:
	.ascii	"\033[34;1H\033[K\033[35;1H\033[KIncorrect Command.\033"
	.ascii	"[34;1H>\000"
	.text
	.align	2
	.global	displayServer
	.type	displayServer, %function
displayServer:
	@ args = 0, pretend = 0, frame = 300
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	sl, .L132
	ldr	r0, .L132+4
.L128:
	add	sl, pc, sl
	sub	sp, sp, #324
	add	r0, sl, r0
	bl	RegisterAs(PLT)
	ldr	r2, .L132+8
	mov	r4, #0
	cmp	r0, r4
	movne	r0, #0
	moveq	r0, #1
	add	r2, sl, r2
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r0, .L132+12
	ldr	fp, .L132+16
	str	r0, [sp, #184]
	ldr	r0, .L132+20
	mov	r9, r4
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L132+24
	str	r0, [sp, #188]
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r0, .L132+28
	ldr	r1, .L132+32
	add	r0, sl, r0
	str	r1, [sp, #180]
	bl	WhoIs(PLT)
	ldr	r2, .L132+36
	str	r0, [sp, #192]
	mvn	r0, r0
	mov	r1, #1
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	bl	bwassert(PLT)
	ldr	r0, .L132+40
	ldr	r2, .L132+44
	add	r0, sl, r0
	str	r2, [sp, #176]
	bl	WhoIs(PLT)
	ldr	r3, .L132+48
	mov	r0, #10
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	ldr	r3, .L132+52
	mov	r0, #3
	ldr	r1, [sl, r3]
	bl	Create(PLT)
	mvn	r3, #0
	mov	r0, r4
	str	r3, [sp, #316]
	bl	getTicks4(PLT)
	str	r4, [sp, #312]
	mov	r5, r0
	str	r4, [sp, #308]
	bl	displayGrid(PLT)
	ldr	r3, .L132+56
	ldr	ip, .L132+60
	str	fp, [sp, #168]
	ldr	lr, .L132+64
	ldr	r0, .L132+68
	ldr	r1, .L132+72
	ldr	fp, .L132+76
	str	r3, [sp, #172]
	str	ip, [sp, #164]
	ldr	r2, .L132+80
	ldr	r3, .L132+84
	ldr	ip, .L132+88
	str	lr, [sp, #160]
	str	r0, [sp, #108]
	str	r1, [sp, #104]
	str	fp, [sp, #92]
	ldr	lr, .L132+92
	ldr	r0, .L132+96
	ldr	r1, .L132+100
	ldr	fp, .L132+104
	str	r2, [sp, #100]
	str	r3, [sp, #96]
	str	ip, [sp, #88]
	ldr	r2, .L132+108
	ldr	r3, .L132+112
	ldr	ip, .L132+116
	str	lr, [sp, #84]
	str	r0, [sp, #56]
	str	r1, [sp, #80]
	str	fp, [sp, #152]
	ldr	lr, .L132+120
	ldr	r0, .L132+124
	ldr	r1, .L132+128
	ldr	fp, .L132+132
	str	r2, [sp, #76]
	str	r3, [sp, #72]
	str	ip, [sp, #148]
	ldr	r2, .L132+136
	ldr	r3, .L132+140
	ldr	ip, .L132+144
	str	lr, [sp, #144]
	str	r0, [sp, #140]
	str	r1, [sp, #136]
	str	fp, [sp, #124]
	ldr	lr, .L132+148
	ldr	r0, .L132+152
	ldr	r1, .L132+156
	ldr	fp, .L132+160
	str	r2, [sp, #132]
	str	r3, [sp, #128]
	str	ip, [sp, #120]
	ldr	r2, .L132+164
	ldr	r3, .L132+168
	ldr	ip, .L132+172
	str	lr, [sp, #112]
	str	r0, [sp, #116]
	str	r1, [sp, #52]
	str	fp, [sp, #40]
	ldr	r0, .L132+176
	ldr	r1, .L132+180
	ldr	lr, .L132+184
	add	fp, sp, #320
	str	r2, [sp, #48]
	str	r3, [sp, #44]
	str	ip, [sp, #36]
	add	r4, sp, #316
	mov	r8, r5
	mov	r2, #27
	add	r5, sp, #208
	mov	r3, #6
	add	fp, fp, #2
	add	ip, sp, #320
	str	r0, [sp, #28]
	str	lr, [sp, #32]
	mov	r0, r4
	str	r1, [sp, #24]
	str	r2, [sp, #196]
	str	r3, [sp, #200]
	str	r4, [sp, #68]
	str	r5, [sp, #156]
	str	fp, [sp, #60]
	str	ip, [sp, #64]
	mov	r1, r5
.L69:
	mov	r2, #100
	bl	Receive(PLT)
	ldr	lr, [sp, #184]
	mov	fp, r0
	mvn	r0, r0
	mov	r0, r0, lsr #31
	mov	r1, #1
	add	r2, sl, lr
	bl	bwassert(PLT)
	ldrb	r3, [sp, #208]	@ zero_extendqisi2
	sub	r3, r3, #1
	cmp	r3, #67
	addls	pc, pc, r3, asl #2
	b	.L70
	.p2align 2
.L98:
	b	.L71
	b	.L72
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L73
	b	.L74
	b	.L75
	b	.L76
	b	.L77
	b	.L78
	b	.L70
	b	.L70
	b	.L79
	b	.L80
	b	.L81
	b	.L82
	b	.L83
	b	.L84
	b	.L85
	b	.L86
	b	.L87
	b	.L88
	b	.L89
	b	.L70
	b	.L90
	b	.L91
	b	.L92
	b	.L93
	b	.L94
	b	.L95
	b	.L96
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L70
	b	.L97
.L71:
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	ldrb	r2, [sp, #210]	@ zero_extendqisi2
	add	r3, r3, r3, asl #2
	ldr	r4, [sp, #180]
	add	r3, r3, r3, asl #2
	add	r3, r2, r3, asl #2
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, r4
	bl	Printf(PLT)
.L99:
	ldr	fp, [sp, #144]
	ldr	r0, [sp, #316]
	add	r1, sl, fp
	mov	r2, #2
	bl	Reply(PLT)
	ldr	r1, [sp, #156]
	ldr	r0, [sp, #68]
	b	.L69
.L72:
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	ldrb	r2, [sp, #210]	@ zero_extendqisi2
	ldr	r5, [sp, #176]
	add	r3, r3, r3, asl #2
	ldrb	ip, [sp, #211]	@ zero_extendqisi2
	add	r3, r3, r3, asl #2
	add	r3, r2, r3, asl #2
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, r5
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L99
.L73:
	ldr	r3, [sp, #84]
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, r3
	bl	Printf(PLT)
	ldr	r4, [sp, #56]
	mov	r0, #0
	ldr	r1, [sl, r4]
	bl	Create(PLT)
	b	.L99
.L74:
	ldr	fp, [sp, #172]
	ldrb	ip, [sp, #210]	@ zero_extendqisi2
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, fp
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L99
.L75:
	ldr	lr, [sp, #168]
	ldrb	ip, [sp, #210]	@ zero_extendqisi2
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L99
.L76:
	ldr	r4, [sp, #164]
	ldrb	ip, [sp, #210]	@ zero_extendqisi2
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, r4
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L99
.L77:
	ldr	r5, [sp, #160]
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, r5
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	bl	Printf(PLT)
	b	.L99
.L78:
	ldrb	r1, [sp, #209]	@ zero_extendqisi2
	ldr	fp, [sp, #108]
	subs	r3, r1, #1
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #28
	add	ip, r3, r2
	and	ip, ip, #15
	addmi	r3, r1, #14
	rsb	ip, r2, ip
	mov	r3, r3, asr #4
	add	ip, ip, #1
	ldr	r0, [sp, #188]
	add	r3, r3, #65
	mov	r1, #1
	add	r2, sl, fp
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L99
.L79:
	ldr	fp, [sp, #40]
	ldrb	ip, [sp, #210]	@ zero_extendqisi2
	ldrb	lr, [sp, #211]	@ zero_extendqisi2
	ldrb	r4, [sp, #212]	@ zero_extendqisi2
	ldrb	r5, [sp, #213]	@ zero_extendqisi2
	ldrb	r6, [sp, #214]	@ zero_extendqisi2
	ldrb	r7, [sp, #215]	@ zero_extendqisi2
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, fp
	stmia	sp, {ip, lr}	@ phole stm
	str	r4, [sp, #8]
	str	r5, [sp, #12]
	str	r6, [sp, #16]
	str	r7, [sp, #20]
	bl	Printf(PLT)
	b	.L99
.L80:
	ldr	ip, [sp, #36]
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, ip
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	bl	Printf(PLT)
	b	.L99
.L81:
	ldr	ip, [sp, #104]
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, ip
	bl	Printf(PLT)
	b	.L99
.L82:
	ldrb	ip, [sp, #212]	@ zero_extendqisi2
	ldrb	r1, [sp, #211]	@ zero_extendqisi2
	rsb	r2, ip, ip, asl #5
	add	ip, ip, r2, asl #2
	rsb	r3, r1, r1, asl #5
	ldrb	r2, [sp, #213]	@ zero_extendqisi2
	rsb	r3, r3, r3, asl #6
	add	ip, ip, ip, asl #2
	add	r1, r1, r3, asl #3
	mov	ip, ip, asl #4
	add	r2, r2, r2, asl #2
	add	ip, ip, r1, asl #6
	add	r2, r2, r2, asl #2
	ldrb	r1, [sp, #214]	@ zero_extendqisi2
	ldr	r4, [sp, #100]
	add	ip, ip, r2, asl #2
	ldrb	lr, [sp, #210]	@ zero_extendqisi2
	add	ip, ip, r1
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, r4
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	bl	Printf(PLT)
	b	.L99
.L83:
	ldr	fp, [sp, #92]
	ldrb	ip, [sp, #210]	@ zero_extendqisi2
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, fp
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L99
.L84:
	ldr	r5, [sp, #96]
	ldrb	ip, [sp, #210]	@ zero_extendqisi2
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, r5
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L99
.L85:
	ldr	r5, [sp, #80]
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, r5
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	bl	Printf(PLT)
	b	.L99
.L86:
	ldr	fp, [sp, #76]
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, fp
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	bl	Printf(PLT)
	b	.L99
.L87:
	ldr	ip, [sp, #72]
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, ip
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	bl	Printf(PLT)
	b	.L99
.L88:
	ldrb	r1, [sp, #214]	@ zero_extendqisi2
	ldrb	r3, [sp, #215]	@ zero_extendqisi2
	ldrb	ip, [sp, #211]	@ zero_extendqisi2
	rsb	r2, r1, r1, asl #5
	add	r3, r3, r3, asl #2
	ldrb	r0, [sp, #212]	@ zero_extendqisi2
	add	r1, r1, r2, asl #2
	add	r3, r3, r3, asl #2
	add	r1, r1, r1, asl #2
	rsb	r2, ip, ip, asl #5
	ldrb	lr, [sp, #216]	@ zero_extendqisi2
	add	r0, r0, r0, asl #2
	mov	r3, r3, asl #2
	add	ip, ip, r2, asl #2
	add	r3, r3, r1, asl #4
	add	r0, r0, r0, asl #2
	ldrb	r1, [sp, #210]	@ zero_extendqisi2
	add	r3, r3, lr
	add	ip, ip, ip, asl #2
	mov	r0, r0, asl #2
	ldrb	lr, [sp, #213]	@ zero_extendqisi2
	add	r0, r0, ip, asl #4
	rsb	r1, r1, r1, asl #4
	rsb	r2, r3, r3, asl #5
	adds	r4, r0, lr
	add	r3, r3, r2, asl #2
	mov	r1, r1, asl #1
	mov	r0, r3, asl #3
	add	r6, r1, #53
	ldrb	r5, [sp, #209]	@ zero_extendqisi2
	moveq	ip, r4
	beq	.L118
	mov	r1, r4
	bl	__divsi3(PLT)
	mov	ip, r0
.L118:
	ldr	fp, [sp, #44]
	mov	r3, r5
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, fp
	str	r6, [sp, #8]
	str	r4, [sp, #12]
	str	ip, [sp, #16]
	str	r6, [sp, #0]
	str	r5, [sp, #4]
	bl	Printf(PLT)
	b	.L99
.L89:
	mov	r4, #2
	mov	r5, #0
	ldr	r1, [sp, #60]
	mov	r2, r4
	ldr	r3, [sp, #64]
	mov	ip, #28
	ldr	r0, [sp, #192]
	strb	ip, [sp, #322]
	strb	r5, [sp, #323]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldrb	ip, [sp, #208]	@ zero_extendqisi2
	ldr	r1, [sp, #60]
	mov	r2, r4
	ldr	r3, [sp, #64]
	ldr	r0, [sp, #188]
	strb	ip, [sp, #322]
	strb	r5, [sp, #323]
	str	r4, [sp, #0]
	bl	Send(PLT)
	ldr	r0, [sp, #144]
	mov	r2, r4
	add	r1, sl, r0
	ldr	r0, [sp, #316]
	bl	Reply(PLT)
	bl	Exit(PLT)
	b	.L99
.L90:
	ldrb	r1, [sp, #209]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L129
	cmp	r1, #1
	beq	.L130
	ldr	r5, [sp, #120]
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, r5
	bl	Printf(PLT)
	ldr	fp, [sp, #112]
	mov	r0, #20
	ldr	r1, [sl, fp]
	bl	Create(PLT)
	b	.L99
.L91:
	ldrb	r1, [sp, #210]	@ zero_extendqisi2
	ldr	r5, [sp, #116]
	sub	lr, r1, #1
	mov	r3, lr, asr #31
	mov	r3, r3, lsr #28
	add	ip, lr, r3
	and	ip, ip, #15
	rsb	ip, r3, ip
	ldr	r3, .L132+188
	add	ip, ip, #1
	smull	r0, r2, r3, ip
	cmp	lr, #0
	mov	r4, ip, asr #31
	addlt	lr, r1, #14
	rsb	r4, r4, r2, asr #2
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	add	r2, r4, r4, asl #2
	mov	lr, lr, asr #4
	sub	ip, ip, r2, asl #1
	add	lr, lr, #65
	sub	r3, r3, #52
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, r5
	str	lr, [sp, #0]
	stmib	sp, {r4, ip}	@ phole stm
	bl	Printf(PLT)
	b	.L99
.L92:
	ldrb	r3, [sp, #210]	@ zero_extendqisi2
	ldr	fp, [sp, #52]
	ldrb	ip, [sp, #209]	@ zero_extendqisi2
	add	r3, r3, #6
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, fp
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L99
.L95:
	mov	r3, #1
	str	r3, [sp, #312]
	ldr	r2, [sp, #312]
	cmp	r2, fp
	ldrlt	r1, [sp, #200]
	blt	.L106
	b	.L99
.L127:
	mov	r1, lr
.L106:
	ldr	r3, [sp, #312]
	add	r4, sp, #324
	str	r1, [sp, #204]
	add	r2, r4, r3
	ldrb	r1, [r2, #-116]	@ zero_extendqisi2
	mov	r0, #0
	cmp	r9, r1
	beq	.L107
	bl	getTicks4(PLT)
	ldr	r5, [sp, #140]
	rsb	r3, r8, r0
	mov	r1, #1
	ldr	r0, [sp, #188]
	add	r2, sl, r5
	bl	Printf(PLT)
.L107:
	ldr	ip, [sp, #136]
	ldr	r3, [sp, #200]
	ldr	r9, [sp, #312]
	mov	r1, #1
	ldr	r8, [sp, #312]
	add	r2, sl, ip
	ldr	ip, [sp, #312]
	ldr	r5, [sp, #312]
	add	lr, r3, r1
	add	r4, sp, #324
	str	lr, [sp, #200]
	add	r6, r4, ip
	add	lr, r4, r5
	ldrb	r4, [lr, #-116]	@ zero_extendqisi2
	ldrb	ip, [r6, #-116]	@ zero_extendqisi2
	sub	r4, r4, #1
	sub	ip, ip, #1
	mov	lr, r4, asr #31
	mov	r5, ip, asr #31
	mov	lr, lr, lsr #28
	mov	r5, r5, lsr #28
	add	r4, r4, lr
	add	ip, ip, r5
	and	r4, r4, #15
	and	ip, ip, #15
	rsb	r4, lr, r4
	rsb	ip, r5, ip
	ldr	r5, .L132+188
	add	r4, r4, r1
	smull	lr, r7, r5, r4
	add	r5, sp, #324
	add	lr, r5, r8
	ldrb	r6, [lr, #-116]	@ zero_extendqisi2
	ldr	lr, .L132+188
	add	ip, ip, r1
	smull	r5, r8, lr, ip
	subs	lr, r6, #1
	mov	r5, r4, asr #31
	addmi	lr, r6, #14
	rsb	r5, r5, r7, asr #2
	add	r5, r5, r5, asl #2
	mov	lr, lr, asr #4
	mov	ip, ip, asr #31
	add	lr, lr, #65
	rsb	ip, ip, r8, asr #2
	sub	r4, r4, r5, asl #1
	add	r5, sp, #324
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	ldr	r0, [sp, #188]
	str	r4, [sp, #8]
	add	r6, r5, r9
	ldrb	r9, [r6, #-116]	@ zero_extendqisi2
	bl	Printf(PLT)
	ldr	ip, [sp, #132]
	ldr	r3, [sp, #196]
	add	r2, sl, ip
	ldr	r0, [sp, #188]
	mov	r1, #1
	str	r3, [sp, #0]
	bl	Printf(PLT)
	mov	r0, #0
	bl	getTicks4(PLT)
	ldr	r3, [sp, #312]
	ldr	lr, [sp, #200]
	add	r3, r3, #1
	str	r3, [sp, #312]
	ldr	r2, [sp, #312]
	cmp	lr, #27
	movgt	lr, #6
	cmp	fp, r2
	ldr	r2, [sp, #204]
	str	lr, [sp, #200]
	mov	r8, r0
	str	r2, [sp, #196]
	bgt	.L127
	b	.L99
.L96:
	ldr	lr, [sp, #88]
	ldrb	ip, [sp, #210]	@ zero_extendqisi2
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L99
.L70:
	ldr	r5, [sp, #24]
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, r5
	bl	Printf(PLT)
	b	.L99
.L97:
	mov	r3, #0
	mov	r2, #1
	str	r3, [sp, #308]
	str	r2, [sp, #312]
	ldr	r3, [sp, #312]
	add	lr, sp, #324
	add	r2, lr, r3
	ldrb	r1, [r2, #-116]	@ zero_extendqisi2
	cmp	r1, #47
	bhi	.L131
.L100:
	ldr	r5, [sp, #152]
	ldr	r3, [sp, #308]
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, r5
	bl	Printf(PLT)
	ldr	r3, [sp, #312]
	cmp	fp, r3
	bgt	.L121
.L104:
	ldr	lr, [sp, #148]
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, lr
	bl	Printf(PLT)
	b	.L99
.L121:
	ldr	r2, [sp, #312]
	add	ip, sp, #324
	add	r3, ip, r2
	ldrb	r2, [r3, #-116]	@ zero_extendqisi2
	ldr	r0, [sp, #188]
	mov	r1, #1
	bl	Putc(PLT)
	ldr	r3, [sp, #312]
	add	r3, r3, #1
	str	r3, [sp, #312]
	ldr	r2, [sp, #312]
	cmp	r2, fp
	blt	.L121
	b	.L104
.L93:
	ldrb	r3, [sp, #210]	@ zero_extendqisi2
	ldr	lr, [sp, #48]
	ldrb	ip, [sp, #209]	@ zero_extendqisi2
	add	r3, r3, #6
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, lr
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L99
.L94:
	ldrb	r1, [sp, #213]	@ zero_extendqisi2
	ldrb	r4, [sp, #214]	@ zero_extendqisi2
	ldrb	r0, [sp, #216]	@ zero_extendqisi2
	ldrb	r5, [sp, #217]	@ zero_extendqisi2
	ldrb	r2, [sp, #210]	@ zero_extendqisi2
	ldrb	r6, [sp, #211]	@ zero_extendqisi2
	rsb	ip, r1, r1, asl #5
	add	r4, r4, r4, asl #2
	rsb	lr, r0, r0, asl #5
	add	r1, r1, ip, asl #2
	add	r5, r5, r5, asl #2
	add	r4, r4, r4, asl #2
	rsb	r3, r2, r2, asl #5
	add	r0, r0, lr, asl #2
	add	r1, r1, r1, asl #2
	ldrb	lr, [sp, #215]	@ zero_extendqisi2
	add	r6, r6, r6, asl #2
	add	r5, r5, r5, asl #2
	mov	r4, r4, asl #2
	ldrb	r7, [sp, #218]	@ zero_extendqisi2
	add	r2, r2, r3, asl #2
	add	r0, r0, r0, asl #2
	add	r4, r4, r1, asl #4
	add	r6, r6, r6, asl #2
	mov	r5, r5, asl #2
	ldrb	ip, [sp, #212]	@ zero_extendqisi2
	ldrb	r3, [sp, #209]	@ zero_extendqisi2
	add	r2, r2, r2, asl #2
	add	r5, r5, r0, asl #4
	add	r4, r4, lr
	mov	r6, r6, asl #2
	ldr	lr, [sp, #32]
	add	r6, r6, r2, asl #4
	add	r5, r5, r7
	add	r6, r6, ip
	ldr	r0, [sp, #188]
	rsb	r4, r5, r4
	add	r2, sl, lr
	sub	r3, r3, #52
	mov	r1, #1
	str	r6, [sp, #0]
	bl	Printf(PLT)
	mul	r1, r4, r6
	ldr	r3, .L132+192
	mov	ip, r1, asr #31
	smull	r0, r2, r3, r1
	mov	r3, r4
	ldr	r4, [sp, #28]
	rsb	ip, ip, r2, asr #6
	ldr	r0, [sp, #188]
	mov	r1, #1
	add	r2, sl, r4
	str	ip, [sp, #0]
	bl	Printf(PLT)
	b	.L99
.L131:
	ldr	r3, [sp, #312]
	add	ip, sp, #324
	add	r2, ip, r3
	ldrb	r1, [r2, #-116]	@ zero_extendqisi2
	cmp	r1, #57
	bhi	.L100
.L120:
	ldr	r2, [sp, #308]
	ldr	r0, [sp, #312]
	add	r3, sp, #324
	add	r1, r3, r0
	ldrb	r3, [r1, #-116]	@ zero_extendqisi2
	add	r2, r2, r2, asl #2
	add	r3, r3, r2, asl #1
	sub	r3, r3, #48
	str	r3, [sp, #308]
	ldr	r2, [sp, #312]
	add	r4, sp, #324
	add	r2, r2, #1
	str	r2, [sp, #312]
	ldr	r3, [sp, #312]
	add	r2, r4, r3
	ldrb	r1, [r2, #-116]	@ zero_extendqisi2
	cmp	r1, #47
	bls	.L100
	ldr	r3, [sp, #312]
	add	r2, r4, r3
	ldrb	r1, [r2, #-116]	@ zero_extendqisi2
	cmp	r1, #57
	bls	.L120
	b	.L100
.L129:
	ldr	r3, [sp, #128]
	ldr	r0, [sp, #188]
	add	r2, sl, r3
	add	r1, r1, #1
	ldrb	r3, [sp, #210]	@ zero_extendqisi2
	bl	Printf(PLT)
	b	.L99
.L130:
	ldr	r4, [sp, #124]
	ldr	r0, [sp, #188]
	add	r2, sl, r4
	bl	Printf(PLT)
	b	.L99
.L133:
	.align	2
.L132:
	.word	_GLOBAL_OFFSET_TABLE_-(.L128+8)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC17(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	displayClock(GOT)
	.word	trainTask(GOT)
	.word	.LC16(GOTOFF)
	.word	.LC18(GOTOFF)
	.word	.LC19(GOTOFF)
	.word	.LC20(GOTOFF)
	.word	.LC21(GOTOFF)
	.word	.LC24(GOTOFF)
	.word	.LC22(GOTOFF)
	.word	.LC23(GOTOFF)
	.word	.LC25(GOTOFF)
	.word	.LC26(GOTOFF)
	.word	DeathServer(GOT)
	.word	.LC27(GOTOFF)
	.word	.LC30(GOTOFF)
	.word	.LC28(GOTOFF)
	.word	.LC29(GOTOFF)
	.word	.LC31(GOTOFF)
	.word	.LC32(GOTOFF)
	.word	.LC33(GOTOFF)
	.word	.LC34(GOTOFF)
	.word	.LC37(GOTOFF)
	.word	.LC35(GOTOFF)
	.word	.LC36(GOTOFF)
	.word	.LC38(GOTOFF)
	.word	UserPrompt(GOT)
	.word	.LC39(GOTOFF)
	.word	.LC40(GOTOFF)
	.word	.LC43(GOTOFF)
	.word	.LC41(GOTOFF)
	.word	.LC42(GOTOFF)
	.word	.LC44(GOTOFF)
	.word	.LC46(GOTOFF)
	.word	.LC47(GOTOFF)
	.word	.LC45(GOTOFF)
	.word	1717986919
	.word	274877907
	.size	displayServer, .-displayServer
	.ident	"GCC: (GNU) 4.0.2"
