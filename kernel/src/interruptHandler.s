	.file	"interruptHandler.c"
	.text
	.align	2
	.global	swiHandlerEntry
	.type	swiHandlerEntry, %function
swiHandlerEntry:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	# switching to user mode
	msr	cpsr, #159
	mov	ip, sp
	# r1 = spsr, r2 = lr
	mrs	r1, spsr
	mov	r2, lr
	# placing all registers except r0-r3 on stack.
	stmfd	sp!, {r1, r2, r4-r10, fp, ip, lr, pc}
	# store this stack ptr on r3, will use it to get registers back.
	mov 	r3, sp
	#Note that at this point, r1 = spsr, r2 = lr, r3 = sp. Switch to supervisor mode now.
	msr	cpsr, #147
	str	r1, [r3]
	ldmfd	sp!, {r1, r2, r4-r10, fp, ip, lr, pc}
	bl	PROCESSREQUEST
	ldr	r3, [r1]
	stmfd	sp!, {r1, r2, r4-r10, fp, ip, lr, pc}
	msr	cpsr, #159
	mov	sp, r3
	ldmfd	sp!, {r1, r2, r4-r10, fp, ip, lr, pc}
	msr 	cpsr, #147
	msr	spsr, r3
	movs	pc, r1	
	#
	.size	swiHandlerEntry, .-swiHandlerEntry
	.align	2
	.global	swiHandlerExit
	.type	swiHandlerExit, %function
swiHandlerExit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	ldmfd	sp, {fp, sp, pc}
	.size	swiHandlerExit, .-swiHandlerExit
	.ident	"GCC: (GNU) 4.0.2"
