	.file	"td.c"
	.text
	.align	2
	.global	initInbox
	.type	initInbox, %function
initInbox:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #768]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #772]
	mov	r3, #1
	mov	r0, r3
	ldmfd	sp, {r3, fp, sp, pc}
	.size	initInbox, .-initInbox
	.align	2
	.global	checkMail
	.type	checkMail, %function
checkMail:
	@ args = 0, pretend = 0, frame = 796
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #796
	str	r0, [fp, #-796]
	str	r1, [fp, #-800]
	ldr	r3, [fp, #-796]
	sub	r2, fp, #792
	add	r3, r3, #44
	mov	ip, #776
	mov	r0, r2
	mov	r1, r3
	mov	r2, ip
	bl	memcpy(PLT)
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	cmp	r3, #31
	bgt	.L4
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-808]
	b	.L6
.L4:
	mov	r2, #0
	str	r2, [fp, #-808]
.L6:
	ldr	r3, [fp, #-808]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L7
	mov	r2, #0
	str	r2, [fp, #-804]
	b	.L9
.L7:
	ldr	r2, [fp, #-20]
	ldr	r1, [fp, #-800]
	ldr	r0, .L11
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #3
	sub	r2, fp, #12
	add	r3, r3, r2
	add	r3, r3, r0
	mov	lr, r1
	mov	ip, r3
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1}
	stmia	lr, {r0, r1}
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
	mov	r3, #1
	str	r3, [fp, #-804]
.L9:
	ldr	r3, [fp, #-804]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	-780
	.size	checkMail, .-checkMail
	.align	2
	.global	putMail
	.type	putMail, %function
putMail:
	@ args = 24, pretend = 12, frame = 792
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	sub	sp, sp, #12
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #16
	sub	sp, sp, #792
	str	r0, [fp, #-796]
	add	r0, fp, #4
	stmia	r0, {r1, r2, r3}
	ldr	r3, [fp, #-796]
	sub	r2, fp, #792
	add	r3, r3, #44
	mov	ip, #776
	mov	r0, r2
	mov	r1, r3
	mov	r2, ip
	bl	memcpy(PLT)
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	cmp	r3, #31
	bgt	.L14
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-804]
	b	.L16
.L14:
	mov	r2, #0
	str	r2, [fp, #-804]
.L16:
	ldr	r3, [fp, #-804]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L17
	mov	r2, #0
	str	r2, [fp, #-800]
	b	.L19
.L17:
	ldr	r2, [fp, #-20]
	ldr	r1, .L21
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r3, r3, asl #3
	sub	r2, fp, #12
	add	r3, r3, r2
	add	r3, r3, r1
	mov	lr, r3
	add	ip, fp, #4
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1}
	stmia	lr, {r0, r1}
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
	mov	r3, #1
	str	r3, [fp, #-800]
.L19:
	ldr	r3, [fp, #-800]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L22:
	.align	2
.L21:
	.word	-780
	.size	putMail, .-putMail
	.align	2
	.global	initTD
	.type	initTD, %function
initTD:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	str	r3, [r2, #16]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #24]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #20]
	ldr	r2, [fp, #-16]
	mov	r3, #4
	str	r3, [r2, #28]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #32]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #4]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #0]
	ldr	r2, [fp, #-16]
	mov	r3, #208
	str	r3, [r2, #8]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #12]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #36]
	ldr	r2, [fp, #-16]
	mov	r3, #0
	str	r3, [r2, #40]
	ldr	r3, [fp, #-16]
	add	r3, r3, #44
	mov	r0, r3
	bl	initInbox(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L24
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L26
.L24:
	mov	r3, #1
	str	r3, [fp, #-28]
.L26:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	initTD, .-initTD
	.ident	"GCC: (GNU) 4.0.2"
