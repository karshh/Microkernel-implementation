	.file	"interruptHandler.c"
	.text
	.align	2
	.global	activate
	.type	activate, %function
activate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.L2:
	str	sl, [sp, #-4]!
	ldr	sl, .L5
	ldr	r3, .L5+4
.L4:
	add	sl, pc, sl
	add	ip, sl, r3
	mov	r2, #40
	@ lr needed for prologue
	str	ip, [r2, #0]
	ldr	r3, [r1, #0]
	stmfd	sp!, {r1, r4-r9, sl, fp, ip, lr }
	msr	cpsr, #0xdf
	mov	sp, r3
	ldmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}
	msr	cpsr, #0xd3
	msr	spsr, r1
	mov	lr, r2
	mov	r0, r0

	movs	pc, lr

	mov r0, r1
mrs	r1, spsr
mov	r2, lr
msr	cpsr, #0xdf
stmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}
mov	r3, sp
msr	cpsr, #0xd3
ldmfd	sp!, {r1, r4-r9,sl,fp,ip,lr}
mov r0, r0

	str	r3, [r1, #0]
	ldmfd	sp!, {sl}
	bx	lr
.L6:
	.align	2
.L5:
	.word	_GLOBAL_OFFSET_TABLE_-(.L4+8)
	.word	.L2(GOTOFF)
	.size	activate, .-activate
	.ident	"GCC: (GNU) 4.0.2"
