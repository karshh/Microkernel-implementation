	.file	"t2.c"
	.text
	.align	2
	.global	bwpgetc
	.type	bwpgetc, %function
bwpgetc:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L3
	ldr	r3, [fp, #-36]
	cmp	r3, #1
	beq	.L4
	b	.L2
.L3:
	ldr	r3, .L10
	str	r3, [fp, #-24]
	ldr	r3, .L10+4
	str	r3, [fp, #-20]
	b	.L5
.L4:
	ldr	r3, .L10+8
	str	r3, [fp, #-24]
	ldr	r3, .L10+12
	str	r3, [fp, #-20]
	b	.L5
.L2:
	mvn	r3, #0
	str	r3, [fp, #-32]
	b	.L6
.L5:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	mov	r3, r3, lsr #6
	and	r3, r3, #1
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L7
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	str	r3, [fp, #-32]
	b	.L6
.L7:
	mov	r3, #0
	str	r3, [fp, #-32]
.L6:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L11:
	.align	2
.L10:
	.word	-2138308584
	.word	-2138308608
	.word	-2138243048
	.word	-2138243072
	.size	bwpgetc, .-bwpgetc
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\033[%d;2H last character value entered %d\000"
	.align	2
.LC1:
	.ascii	"\033[%d;2H>\033[K\000"
	.align	2
.LC2:
	.ascii	"*\000"
	.align	2
.LC3:
	.ascii	"\033[%d;2H>%s\000"
	.text
	.align	2
	.global	printBuf
	.type	printBuf, %function
printBuf:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L15
.L14:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	mov	r0, #1
	ldr	r3, .L15+4
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #30
	ldr	r3, [fp, #-20]
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L15+8
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #31
	bl	bwprintf(PLT)
	mov	r0, #1
	mov	r1, #42
	bl	bwputc(PLT)
	mov	r0, #1
	mov	r1, #75
	mov	r2, #32
	ldr	r3, .L15+12
	add	r3, sl, r3
	bl	bwputw(PLT)
	mov	r0, #1
	ldr	r3, .L15+16
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #31
	ldr	r3, [fp, #-28]
	bl	bwprintf(PLT)
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L16:
	.align	2
.L15:
	.word	_GLOBAL_OFFSET_TABLE_-(.L14+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.size	printBuf, .-printBuf
	.section	.rodata
	.align	2
.LC4:
	.ascii	"\033[2J\033[H\000"
	.align	2
.LC5:
	.ascii	"\012\015\000"
	.align	2
.LC6:
	.ascii	"*\012\015\000"
	.align	2
.LC7:
	.ascii	"\033[%d;2H>\000"
	.align	2
.LC8:
	.ascii	"\033[?25l\000"
	.align	2
.LC9:
	.ascii	"\033[%d;1H\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #96
	ldr	sl, .L32
.L31:
	add	sl, pc, sl
	str	r0, [fp, #-108]
	str	r1, [fp, #-112]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	strb	r3, [fp, #-104]
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mov	r0, #1
	ldr	r3, .L32+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	mov	r0, #1
	mov	r1, #80
	mov	r2, #42
	ldr	r3, .L32+8
	add	r3, sl, r3
	bl	bwputw(PLT)
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L18
.L19:
	mov	r0, #1
	mov	r1, #42
	bl	bwputc(PLT)
	mov	r0, #1
	mov	r1, #79
	mov	r2, #32
	ldr	r3, .L32+12
	add	r3, sl, r3
	bl	bwputw(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L18:
	ldr	r3, [fp, #-20]
	cmp	r3, #29
	ble	.L19
	mov	r0, #1
	mov	r1, #80
	mov	r2, #42
	ldr	r3, .L32+8
	add	r3, sl, r3
	bl	bwputw(PLT)
	mov	r0, #1
	ldr	r3, .L32+16
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #31
	bl	bwprintf(PLT)
	mov	r0, #1
	ldr	r3, .L32+20
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	b	.L30
.L21:
.L30:
	mov	r0, #1
	bl	bwpgetc(PLT)
	mov	r3, r0
	strb	r3, [fp, #-29]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L22
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	cmp	r3, #113
	beq	.L24
	ldr	r3, [fp, #-28]
	cmp	r3, #74
	bgt	.L22
	ldr	r3, [fp, #-28]
	mvn	r2, #87
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	ldrb	r3, [fp, #-29]
	strb	r3, [r2, #0]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	mvn	r2, #87
	sub	r1, fp, #16
	add	r3, r1, r3
	add	r2, r3, r2
	mov	r3, #0
	strb	r3, [r2, #0]
	mov	r3, #1
	str	r3, [fp, #-24]
.L22:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L21
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	ldr	r2, [fp, #-28]
	sub	ip, fp, #104
	mov	r0, r3
	mov	r1, r2
	mov	r2, ip
	bl	printBuf(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L21
.L24:
	mov	r0, #1
	ldr	r3, .L32+24
	add	r3, sl, r3
	mov	r1, r3
	mov	r2, #33
	bl	bwprintf(PLT)
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L33:
	.align	2
.L32:
	.word	_GLOBAL_OFFSET_TABLE_-(.L31+8)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
