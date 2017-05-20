	.file	"td.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%d %x %x\012\015\000"
	.text
	.align	2
	.global	initTD
	.type	initTD, %function
initTD:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	str	r3, [r2, #16]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #24]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #20]
	ldr	r2, [fp, #-20]
	mov	r3, #4
	str	r3, [r2, #28]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #17
	ldr	r3, [fp, #-28]
	rsb	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	mov	r2, r3, asl #17
	ldr	r3, [fp, #-28]
	rsb	ip, r2, r3
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #0]
	str	r3, [sp, #0]
	mov	r0, #1
	ldr	r3, .L4+4
	add	r3, sl, r3
	mov	r1, r3
	ldr	r2, [fp, #-24]
	mov	r3, ip
	bl	bwprintf(PLT)
	ldr	r2, [fp, #-20]
	mov	r3, #208
	str	r3, [r2, #8]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #12]
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.size	initTD, .-initTD
	.ident	"GCC: (GNU) 4.0.2"
