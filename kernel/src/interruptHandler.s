	.file	"interruptHandler.c"
	.text
	.align	2
	.global	initHandlers
	.type	initHandlers, %function
initHandlers:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	ldr	r3, .L4+4
	ldr	r3, [sl, r3]
	add	r3, r3, #2195456
	str	r3, [fp, #-20]
	mov	r2, #40
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldr	r3, .L4+8
	ldr	r3, [sl, r3]
	add	r3, r3, #2195456
	str	r3, [fp, #-20]
	mov	r2, #56
	ldr	r3, [fp, #-20]
	str	r3, [r2, #0]
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	swiHandler(GOT)
	.word	hwiHandler(GOT)
	.size	initHandlers, .-initHandlers
	.align	2
	.global	activate
	.type	activate, %function
activate:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #20]
	cmp	r3, #0
	beq	.L7
	ldr	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [r2, #20]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #0]
	stmfd	sp!, {r1, r4-r9, sl, fp, ip, lr }
	msr	cpsr, #0xdf
	mov	sp, r3
	ldmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}
	msr	cpsr, #0xd3
	msr	spsr, r1
	mov	lr, r2
	msr	cpsr, #0xd2
       ldmfd   sp!, {r0-r3}
	msr	cpsr, #0xd3

	subs	pc, lr, #4

	b	.L9
.L7:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #0]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	stmfd	sp!, {r1, r4-r9, sl, fp, ip, lr }
	msr	cpsr, #0xdf
	mov	sp, r2
	ldmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}
	msr	cpsr, #0xd3
	msr	spsr, r1
	mov	lr, r2
	mov	r0, r3

	movs	pc, lr

.L9:
	hwiHandler:
       stmfd   sp!, {r0-r3}
       mov     r0, lr
       mrs     r1, spsr
       msr     cpsr, #0xd3
       mov     lr, r0
       msr     spsr,r1
       mov     r1, #0
swiHandler:mov r0, r1
mrs	r1, spsr
mov	r2, lr
msr	cpsr, #0xdf
stmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}
mov	r2, sp
msr	cpsr, #0xd3
ldmfd	sp!, {r1, r4-r9,sl,fp,ip,lr}
mov r1, r0

	ldr	r3, [fp, #-24]
	str	r2, [r3, #0]
	str	r1, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	activate, .-activate
	.ident	"GCC: (GNU) 4.0.2"
