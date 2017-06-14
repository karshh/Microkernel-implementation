	.file	"trackB.c"
	.text
	.align	2
	.global	displayTrack
	.type	displayTrack, %function
displayTrack:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	ldmfd	sp, {fp, sp, pc}
	.size	displayTrack, .-displayTrack
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	ldr	sl, .L6
.L5:
	add	sl, pc, sl
	MRC p15, 0, r0, c1, c0, 0 
ORR r0, r0, #0x1 <<12 
ORR r0, r0, #0x1 <<2 
MCR p15, 0, r0, c1, c0, 0 

	ldr	r3, .L6+4
	ldr	r3, [sl, r3]
	mov	r0, #2
	mov	r1, r3
	bl	kernelRun(PLT)
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp, {sl, fp, sp, pc}
.L7:
	.align	2
.L6:
	.word	_GLOBAL_OFFSET_TABLE_-(.L5+8)
	.word	FirstUserTask(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
