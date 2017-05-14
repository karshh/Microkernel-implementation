	.file	"main.c"
	.text
	.align	2
	.global	kernelEnter
	.type	kernelEnter, %function
kernelEnter:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	bl	PL(PLT)
	ldmfd	sp, {fp, sp, pc}
	.size	kernelEnter, .-kernelEnter
	.align	2
	.global	_switch
	.type	_switch, %function
_switch:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	swi 0
	ldmfd	sp, {fp, sp, pc}
	.size	_switch, .-_switch
	.section	.rodata
	.align	2
.LC0:
	.ascii	"CONTEXT SWITCH SUCCEEDED!\000"
	.text
	.align	2
	.global	PL
	.type	PL, %function
PL:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L8
.L7:
	add	sl, pc, sl
	mov	r0, #1
	ldr	r3, .L8+4
	add	r3, sl, r3
	mov	r1, r3
	bl	bwprintf(PLT)
	ldmfd	sp, {sl, fp, sp, pc}
.L9:
	.align	2
.L8:
	.word	_GLOBAL_OFFSET_TABLE_-(.L7+8)
	.word	.LC0(GOTOFF)
	.size	PL, .-PL
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L13
.L12:
	add	sl, pc, sl
	mov	r0, #1
	mov	r1, #0
	bl	bwsetfifo(PLT)
	mov	r2, #40
	ldr	r3, .L13+4
	ldr	r3, [sl, r3]
	add	r3, r3, #2195456
	str	r3, [r2, #0]
	bl	_switch(PLT)
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L14:
	.align	2
.L13:
	.word	_GLOBAL_OFFSET_TABLE_-(.L12+8)
	.word	kernelEnter(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
