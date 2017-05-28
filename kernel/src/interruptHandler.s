	.file	"interruptHandler.c"
	.text
	.align	2
	.global	activate
	.type	activate, %function
activate:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	sl, [sp, #-4]!
	ldr	sl, .L4
	ldr	r3, .L4+4
.L3:
	add	sl, pc, sl
	ldr	r2, [sl, r3]
	mov	ip, #40
	add	r2, r2, #2195456
	@ lr needed for prologue
	str	r2, [ip, #0]
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

	swiHandler:
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
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	swiHandler(GOT)
	.size	activate, .-activate
	.ident	"GCC: (GNU) 4.0.2"
