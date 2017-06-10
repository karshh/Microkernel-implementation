	.file	"interruptHandler.c"
	.text
	.align	2
	.global	initHandlers
	.type	initHandlers, %function
initHandlers:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	sl, [sp, #-4]!
	ldr	sl, .L4
	ldr	r2, .L4+4
.L3:
	add	sl, pc, sl
	ldr	r3, [sl, r2]
	ldr	r1, .L4+8
	add	r3, r3, #2195456
	mov	r2, #40
	str	r3, [r2, #0]
	ldr	r3, [sl, r1]
	add	r2, r2, #16
	add	r3, r3, #2195456
	@ lr needed for prologue
	str	r3, [r2, #0]
	ldmfd	sp!, {sl}
	bx	lr
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #20]
	@ lr needed for prologue
	cmp	r3, #0
	mov	r1, r0
	beq	.L7
	mov	r3, #0
	str	r3, [r0, #20]
	ldr	r2, [r0, #0]
	stmfd	sp!, {r1, r4-r9, sl, fp, ip, lr }
	msr	cpsr, #0xdf
	mov	sp, r2
	ldmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}
	msr	cpsr, #0xd3
	msr	spsr, r1
	mov	lr, r2
	msr	cpsr, #0xdf
       ldmfd   sp!, {r0-r3}
	msr	cpsr, #0xd3

	subs	pc, lr, #4

.L9:
	hwiHandler:
	msr	cpsr, #0xdf
	stmfd	sp!, {r0-r3}
	msr	cpsr, #0xd2
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
mov	r3, sp
msr	cpsr, #0xd3
ldmfd	sp!, {r1, r4-r9,sl,fp,ip,lr}
mov r0, r0

	str	r3, [r1, #0]
	bx	lr
.L7:
	ldr	r2, [r0, #0]
	ldr	r3, [r0, #4]
	stmfd	sp!, {r1, r4-r9, sl, fp, ip, lr }
	msr	cpsr, #0xdf
	mov	sp, r2
	ldmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}
	msr	cpsr, #0xd3
	msr	spsr, r1
	mov	lr, r2
	mov	r0, r3

	movs	pc, lr

	b	.L9
	.size	activate, .-activate
	.ident	"GCC: (GNU) 4.0.2"
