	.file	"td.c"
	.text
	.align	2
	.global	initTD
	.type	initTD, %function
initTD:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #24]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #20]
	ldr	r2, [fp, #-16]
	mov	r3, #1
	str	r3, [r2, #28]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r3, [fp, #-20]
	mov	r3, r3, asl #12
	rsb	r2, r3, #27262976
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #208
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #12]
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	initTD, .-initTD
	.ident	"GCC: (GNU) 4.0.2"
