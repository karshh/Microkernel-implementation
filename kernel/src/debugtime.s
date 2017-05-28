	.file	"debugtime.c"
	.text
	.align	2
	.global	startTime
	.type	startTime, %function
startTime:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	ldr	r2, .L3+4
	mov	r1, #136
	str	r2, [r3], #8
	@ lr needed for prologue
	str	r1, [r3, #0]
	bx	lr
.L4:
	.align	2
.L3:
	.word	-2139029376
	.word	2004318071
	.size	startTime, .-startTime
	.global	__floatsidf
	.global	__muldf3
	.global	__fixdfsi
	.align	2
	.global	getTime
	.type	getTime, %function
getTime:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r3, .L7+8
	ldr	r0, .L7+12
	ldr	r2, [r3, #0]
	rsb	r0, r2, r0
	bl	__floatsidf(PLT)
	adr	r2, .L7
	ldmia	r2, {r2-r3}
	bl	__muldf3(PLT)
	bl	__fixdfsi(PLT)
	ldr	pc, [sp], #4
.L8:
	.align	2
.L7:
	.word	1073708797
	.word	4227339590
	.word	-2139029372
	.word	2004318071
	.size	getTime, .-getTime
	.ident	"GCC: (GNU) 4.0.2"
