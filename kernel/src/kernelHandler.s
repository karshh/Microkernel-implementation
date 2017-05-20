	.file	"kernelHandler.c"
	.text
	.align	2
	.global	getNextTID
	.type	getNextTID, %function
getNextTID:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #32]
	cmp	r3, #128
	bne	.L2
	mvn	r3, #0
	str	r3, [fp, #-24]
	b	.L4
.L2:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #32]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #32]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #32]
	mov	r3, #0
	str	r3, [fp, #-24]
.L4:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	getNextTID, .-getNextTID
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Task Memory start at %x to %x \015\012\000"
	.text
	.align	2
	.global	initKernel
	.type	initKernel, %function
initKernel:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	ldr	sl, .L12
.L11:
	add	sl, pc, sl
	str	r0, [fp, #-28]
	ldr	r2, [fp, #-28]
	mov	r3, #5
	str	r3, [r2, #32]
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #5632
	add	r3, r3, #36
	add	r3, r3, #16777216
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	add	ip, r3, #-16777216
	mov	r0, #1
	ldr	r3, .L12+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	mov	r3, ip
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-20]
	mov	r3, r2, asr #31
	mov	r1, r3, lsr #28
	add	r3, r2, r1
	and	r3, r3, #15
	rsb	r3, r1, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	rsb	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	add	ip, r3, #-16777216
	mov	r0, #1
	ldr	r3, .L12+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-20]
	mov	r3, ip
	bl	bwprintf(PLT)
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L7
.L8:
	ldr	r3, [fp, #-28]
	add	r1, r3, #36
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	mov	r0, r3
	ldr	r1, [fp, #-24]
	ldr	r2, [fp, #-20]
	bl	initTD(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L7:
	ldr	r3, [fp, #-24]
	cmp	r3, #127
	ble	.L8
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L13:
	.align	2
.L12:
	.word	_GLOBAL_OFFSET_TABLE_-(.L11+8)
	.word	.LC0(GOTOFF)
	.size	initKernel, .-initKernel
	.section	.rodata
	.align	2
.LC1:
	.ascii	"---------------------------...\015\012\000"
	.align	2
.LC2:
	.ascii	"Hur?---------------------------...\015\012\000"
	.align	2
.LC3:
	.ascii	"Hur?%x---------------------------...\015\012\000"
	.text
	.align	2
	.global	setTask
	.type	setTask, %function
setTask:
	@ args = 4, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L20
.L19:
	add	sl, pc, sl
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	mov	r0, #1
	ldr	r3, .L20+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-24]
	add	r1, r3, #36
	ldr	r2, [fp, #-28]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	str	r3, [fp, #-20]
	mov	r0, #1
	ldr	r3, .L20+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	str	r3, [r2, #28]
	mov	r0, #1
	ldr	r3, .L20+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #20]
	mov	r0, #1
	ldr	r3, .L20+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-32]
	cmn	r3, #1
	bne	.L15
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #24]
	b	.L17
.L15:
	ldr	r3, [fp, #-24]
	add	r1, r3, #36
	ldr	r2, [fp, #-32]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r2, r1, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #24]
.L17:
	mov	r0, #1
	ldr	r3, .L20+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-20]
	mov	r3, #2
	str	r3, [r2, #40]
	mov	r0, #1
	ldr	r3, .L20+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-20]
	mov	r3, #208
	str	r3, [r2, #8]
	mov	r0, #1
	ldr	r3, .L20+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #4]
	mov	r0, #1
	ldr	r3, .L20+8
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L20+12
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	sub	r2, r3, #44
	ldr	r3, [fp, #4]
	str	r3, [r2, #0]
	mov	r0, #1
	ldr	r3, .L20+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	sub	r2, r3, #48
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	str	r3, [r2, #0]
	mov	r0, #1
	ldr	r3, .L20+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	sub	r2, r3, #48
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	mov	r0, #1
	ldr	r3, .L20+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L21:
	.align	2
.L20:
	.word	_GLOBAL_OFFSET_TABLE_-(.L19+8)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.size	setTask, .-setTask
	.ident	"GCC: (GNU) 4.0.2"
