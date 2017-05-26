	.file	"interruptHandler.c"
	.text
	.align	2
	.global	activate
	.type	activate, %function
activate:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	ldr	sl, .L5
.L4:
	add	sl, pc, sl
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, .L5+4
	add	r3, sl, r3
	str	r3, [fp, #-24]
	mov	r2, #40
	ldr	r3, [fp, #-24]
	str	r3, [r2, #0]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-32]
	stmfd	sp!, {r1, r4-r9, sl, fp, ip, lr }
	msr	cpsr, #0xdf
	mov	sp, r2
	ldmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}
	msr	cpsr, #0xd3
	msr	spsr, r1
	mov	lr, r2
	mov	r0, r3

	movs	pc, lr

.L2:
	mov r0, r1
mrs	r1, spsr
mov	r2, lr
msr	cpsr, #0xdf
stmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}
mov	r2, sp
msr	cpsr, #0xd3
ldmfd	sp!, {r1, r4-r9,sl,fp,ip,lr}
mov r1, r0

	ldr	r3, [fp, #-36]
	str	r2, [r3, #0]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L6:
	.align	2
.L5:
	.word	_GLOBAL_OFFSET_TABLE_-(.L4+8)
	.word	.L2(GOTOFF)
	.size	activate, .-activate
	.ident	"GCC: (GNU) 4.0.2"
