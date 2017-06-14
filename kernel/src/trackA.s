	.file	"trackA.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"UART2S\000"
	.align	2
.LC1:
	.ascii	"<displayGrid>: IOServer has not been set up.\015\012"
	.ascii	"\000"
	.align	2
.LC2:
	.ascii	"\033[8;34H    _____________________________        "
	.ascii	"\000"
	.align	2
.LC3:
	.ascii	"\033[9;34H     _____/ /____________________\\    \000"
	.align	2
.LC4:
	.ascii	"\033[10;34H\011        /  /     \\        /     \\ "
	.ascii	"    \000"
	.align	2
.LC5:
	.ascii	"\033[11;34H\011        |  |      \\      /      |  "
	.ascii	"   \000"
	.align	2
.LC6:
	.ascii	"\033[12;34H\011        |  |       \\    /       |  "
	.ascii	"   \000"
	.align	2
.LC7:
	.ascii	"\033[13;34H         |  |        \\||/        |     "
	.ascii	"\000"
	.align	2
.LC8:
	.ascii	"\033[14;34H         |  |         ||         |     \000"
	.align	2
.LC9:
	.ascii	"\033[15;34H         |  |         ||         |     \000"
	.align	2
.LC10:
	.ascii	"\033[16;34H         |  |        /||\\        |    \000"
	.align	2
.LC11:
	.ascii	"\033[17;34H         |  |       /    \\       |    \000"
	.align	2
.LC12:
	.ascii	"\033[18;34H         |  |      /      \\      |    \000"
	.align	2
.LC13:
	.ascii	"\033[19;34H          \\ \\_____/________\\_____/   "
	.ascii	" \000"
	.align	2
.LC14:
	.ascii	"\033[20;34H    ______\\ \\____ ________ ______/    "
	.ascii	"\000"
	.align	2
.LC15:
	.ascii	"\033[21;34H __________\\     \\        /           "
	.ascii	"\000"
	.align	2
.LC16:
	.ascii	"\033[22;34H____________\\_____\\______/__________  "
	.ascii	"\000"
	.text
	.align	2
	.global	displayTrack
	.type	displayTrack, %function
displayTrack:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, sl, lr}
	ldr	sl, .L4
	ldr	r0, .L4+4
.L3:
	add	sl, pc, sl
	add	r0, sl, r0
	bl	WhoIs(PLT)
	ldr	r2, .L4+8
	mov	r4, r0
	mvn	r0, r0
	add	r2, sl, r2
	mov	r0, r0, lsr #31
	mov	r1, #1
	bl	bwassert(PLT)
	ldr	r2, .L4+12
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+16
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+20
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+24
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+28
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+32
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+36
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+40
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+44
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+48
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+52
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+56
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+60
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+64
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	bl	Printf(PLT)
	ldr	r2, .L4+68
	mov	r0, r4
	add	r2, sl, r2
	mov	r1, #1
	ldmfd	sp!, {r4, sl, lr}
	b	Printf(PLT)
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.word	.LC1(GOTOFF)
	.word	.LC2(GOTOFF)
	.word	.LC3(GOTOFF)
	.word	.LC4(GOTOFF)
	.word	.LC5(GOTOFF)
	.word	.LC6(GOTOFF)
	.word	.LC7(GOTOFF)
	.word	.LC8(GOTOFF)
	.word	.LC9(GOTOFF)
	.word	.LC10(GOTOFF)
	.word	.LC11(GOTOFF)
	.word	.LC12(GOTOFF)
	.word	.LC13(GOTOFF)
	.word	.LC14(GOTOFF)
	.word	.LC15(GOTOFF)
	.word	.LC16(GOTOFF)
	.size	displayTrack, .-displayTrack
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {sl, lr}
	ldr	sl, .L9
.L8:
	add	sl, pc, sl
	MRC p15, 0, r0, c1, c0, 0 
ORR r0, r0, #0x1 <<12 
ORR r0, r0, #0x1 <<2 
MCR p15, 0, r0, c1, c0, 0 

	ldr	r3, .L9+4
	mov	r0, #2
	ldr	r1, [sl, r3]
	bl	kernelRun(PLT)
	mov	r0, #0
	ldmfd	sp!, {sl, pc}
.L10:
	.align	2
.L9:
	.word	_GLOBAL_OFFSET_TABLE_-(.L8+8)
	.word	FirstUserTask(GOT)
	.size	main, .-main
	.ident	"GCC: (GNU) 4.0.2"
