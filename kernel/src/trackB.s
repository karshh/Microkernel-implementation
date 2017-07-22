	.file	"trackB.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"C09\000"
	.text
	.align	2
	.global	markedOutSensor
	.type	markedOutSensor, %function
markedOutSensor:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L4
	mov	r4, r0
	ldr	r0, .L4+4
.L3:
	add	sl, pc, sl
	add	r0, sl, r0
	bl	sensor2i(PLT)
	cmp	r0, r4
	movne	r0, #0
	moveq	r0, #1
	ldmfd	sp!, {r4, sl, pc}
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.size	markedOutSensor, .-markedOutSensor
	.align	2
	.global	TrackGraphInit
	.type	TrackGraphInit, %function
TrackGraphInit:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	b	TrackGraphInitB(PLT)
	.size	TrackGraphInit, .-TrackGraphInit
	.align	2
	.global	drawTrack
	.type	drawTrack, %function
drawTrack:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	bx	lr
	.size	drawTrack, .-drawTrack
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L13
.L12:
	add	sl, pc, sl
	MRC p15, 0, r0, c1, c0, 0 
ORR r0, r0, #0x1 <<30 
ORR r0, r0, #0x1 <<12 
ORR r0, r0, #0x1 <<2 
MCR p15, 0, r0, c1, c0, 0 

	ldr	r3, .L13+4
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	kernelRun(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L14:
	.align	2
.L13:
	.word	_GLOBAL_OFFSET_TABLE_-(.L12+8)
	.word	FirstUserTask(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
