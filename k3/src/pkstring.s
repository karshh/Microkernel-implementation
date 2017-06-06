	.file	"pkstring.c"
	.text
	.align	2
	.global	pkmemcpy
	.type	pkmemcpy, %function
pkmemcpy:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	str	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L2
.L3:
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r1, r2, r3
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r1, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L2:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pkmemcpy, .-pkmemcpy
	.align	2
	.global	pkstrlen
	.type	pkstrlen, %function
pkstrlen:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [r2, #0]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L7
.L8:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L7:
	ldr	r3, [fp, #-20]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L8
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pkstrlen, .-pkstrlen
	.align	2
	.global	pkstrcpy
	.type	pkstrcpy, %function
pkstrcpy:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L12
.L13:
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r1, r2, r3
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r1, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L12:
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L13
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #0
	strb	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pkstrcpy, .-pkstrcpy
	.align	2
	.global	pkstreql
	.type	pkstreql, %function
pkstreql:
	@ args = 0, pretend = 0, frame = 28
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #28
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L17
.L18:
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r1, r3, #255
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	cmp	r1, r3
	beq	.L19
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L21
.L19:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L17:
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L22
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L18
.L22:
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L24
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L24
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L27
.L24:
	mov	r3, #0
	str	r3, [fp, #-36]
.L27:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-40]
.L21:
	ldr	r3, [fp, #-40]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pkstreql, .-pkstreql
	.align	2
	.global	pkstrcpy_volatile
	.type	pkstrcpy_volatile, %function
pkstrcpy_volatile:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-28]
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L30
.L31:
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r1, r2, r3
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r1, #0]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L30:
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L31
	ldr	r3, [fp, #-24]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #0
	strb	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pkstrcpy_volatile, .-pkstrcpy_volatile
	.align	2
	.global	pkstrcmp_volatile
	.type	pkstrcmp_volatile, %function
pkstrcmp_volatile:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
.L35:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r1, r3, #255
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	cmp	r1, r3
	beq	.L36
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r1, r3, #255
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	cmp	r1, r3
	bcs	.L38
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L40
.L38:
	mov	r3, #1
	str	r3, [fp, #-28]
.L40:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
	b	.L41
.L36:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L42
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L41
.L42:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L35
.L41:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pkstrcmp_volatile, .-pkstrcmp_volatile
	.align	2
	.global	pkstrcmp
	.type	pkstrcmp, %function
pkstrcmp:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
.L46:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r1, r3
	beq	.L47
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r1, r3
	bcs	.L49
	mvn	r3, #0
	str	r3, [fp, #-28]
	b	.L51
.L49:
	mov	r3, #1
	str	r3, [fp, #-28]
.L51:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
	b	.L52
.L47:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L53
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L52
.L53:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L46
.L52:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pkstrcmp, .-pkstrcmp
	.align	2
	.global	pkstreq
	.type	pkstreq, %function
pkstreq:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	bl	pkstrcmp(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L57
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L59
.L57:
	mov	r3, #0
	str	r3, [fp, #-28]
.L59:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pkstreq, .-pkstreq
	.align	2
	.global	pkstreq_volatile
	.type	pkstreq_volatile, %function
pkstreq_volatile:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-24]
	bl	pkstrcmp_volatile(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L62
	mov	r3, #1
	str	r3, [fp, #-28]
	b	.L64
.L62:
	mov	r3, #0
	str	r3, [fp, #-28]
.L64:
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pkstreq_volatile, .-pkstreq_volatile
	.align	2
	.global	pkstrcpy_firstn
	.type	pkstrcpy_firstn, %function
pkstrcpy_firstn:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #16
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L67
.L68:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L69
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r1, r2, r3
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [r1, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L67:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L68
.L69:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #0
	strb	r3, [r2, #0]
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pkstrcpy_firstn, .-pkstrcpy_firstn
	.align	2
	.global	pkstrcpy_aftern
	.type	pkstrcpy_aftern, %function
pkstrcpy_aftern:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L73
.L74:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L75
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L77
.L75:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L73:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L74
.L77:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L78
	ldr	r3, [fp, #-24]
	mov	r2, #0
	strb	r2, [r3, #0]
	b	.L82
.L78:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	rsb	r3, r3, r2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r1, r2, r3
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [r1, #0]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L82
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L78
.L82:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pkstrcpy_aftern, .-pkstrcpy_aftern
	.align	2
	.global	pkstrcpy_aftern_append
	.type	pkstrcpy_aftern_append, %function
pkstrcpy_aftern_append:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-16]
.L84:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r1, r2, r3
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	strb	r3, [r1, #0]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L89
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	add	r2, r2, r3
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bne	.L84
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	mov	r3, #0
	strb	r3, [r2, #0]
.L89:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	pkstrcpy_aftern_append, .-pkstrcpy_aftern_append
	.ident	"GCC: (GNU) 4.0.2"
