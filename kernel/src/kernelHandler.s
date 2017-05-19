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
	.ident	"GCC: (GNU) 4.0.2"
