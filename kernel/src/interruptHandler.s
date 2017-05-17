	.file	"interruptHandler.c"
	.text
	.align	2
	.global	activate
	.type	activate, %function
activate:
	mov	r3, r1
	stmfd	sp!, {r1, r4-r10, fp, ip, lr}
	msr	cpsr, #0xdf
	mov	sp, r3
	ldmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}
	msr	cpsr, #0xd3
	msr	spsr, r1
	movs	pc, r2	
	.size	activate, .-activate
	.align	2
	.global	swiHandler
	.type	swiHandler, %function
swiHandler:
	mrs	r1, spsr
	mov	r2, lr
	msr	cpsr, #0xdf
	stmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}
	mov	r3, sp
	msr	cpsr, #0xd3
	ldmfd	sp!, {r1, r4-r10, fp, ip}
	mov	r1, r3
	ldmfd	sp!, {pc}
	.size	swiHandler, .-swiHandler
	.ident	"GCC: (GNU) 4.0.2"
