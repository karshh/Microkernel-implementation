	.file	"pkstring.c"
	.text
	.align	2
	.global	pkmemcpy
	.type	pkmemcpy, %function
pkmemcpy:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r3, #0
	sub	sp, sp, #4
	str	r3, [sp, #0]
	str	r3, [sp, #0]
	ldr	ip, [sp, #0]
	mov	lr, r2
	cmp	r2, ip
	mov	r4, r0
	mov	ip, r1
	ble	.L4
.L5:
	ldr	r0, [sp, #0]
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #0]
	ldrb	r1, [ip, r2]	@ zero_extendqisi2
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	strb	r1, [r4, r0]
	cmp	lr, r2
	bgt	.L5
.L4:
	add	sp, sp, #4
	ldmfd	sp!, {r4, pc}
	.size	pkmemcpy, .-pkmemcpy
	.align	2
	.global	pkstrlen
	.type	pkstrlen, %function
pkstrlen:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #0
	sub	sp, sp, #4
	str	ip, [sp, #0]
	str	ip, [sp, #0]
	ldr	r2, [sp, #0]
	str	ip, [r1, #0]
	ldrb	r3, [r0, r2]	@ zero_extendqisi2
	mov	lr, r1
	cmp	r3, ip
	beq	.L11
.L12:
	ldr	r3, [sp, #0]
	add	r1, ip, #1
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	str	r1, [lr, #0]
	ldrb	r3, [r0, r2]	@ zero_extendqisi2
	mov	ip, r1
	cmp	r3, #0
	bne	.L12
.L11:
	add	sp, sp, #4
	ldmfd	sp!, {pc}
	.size	pkstrlen, .-pkstrlen
	.align	2
	.global	pkstrcpy
	.type	pkstrcpy, %function
pkstrcpy:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, #0
	sub	sp, sp, #4
	str	r3, [sp, #0]
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	mov	ip, r1
	ldrb	r3, [r1, r2]	@ zero_extendqisi2
	mov	lr, r0
	cmp	r3, #0
	beq	.L15
.L18:
	ldr	r0, [sp, #0]
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #0]
	ldrb	r1, [ip, r2]	@ zero_extendqisi2
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	strb	r1, [lr, r0]
	ldrb	r3, [ip, r2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L18
.L15:
	ldr	r2, [sp, #0]
	mov	r3, #0
	strb	r3, [lr, r2]
	add	sp, sp, #4
	ldmfd	sp!, {pc}
	.size	pkstrcpy, .-pkstrcpy
	.align	2
	.global	pkstreql
	.type	pkstreql, %function
pkstreql:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #4
	mov	r3, #0
	str	r3, [sp, #0]
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	@ lr needed for prologue
	ldrb	r3, [r0, r2]	@ zero_extendqisi2
	mov	ip, r1
	cmp	r3, #0
	bne	.L35
.L21:
	ldr	r3, [sp, #0]
	ldrb	r2, [r0, r3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L24
	ldr	r3, [sp, #0]
	ldrb	r2, [ip, r3]	@ zero_extendqisi2
	cmp	r2, #0
	moveq	r0, #1
	bne	.L24
.L29:
	add	sp, sp, #4
	bx	lr
.L35:
	ldr	r3, [sp, #0]
	ldrb	r2, [r1, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L21
	ldr	r3, [sp, #0]
	ldrb	r1, [r0, r3]	@ zero_extendqisi2
	ldr	r2, [sp, #0]
	ldrb	r3, [ip, r2]	@ zero_extendqisi2
	cmp	r1, r3
	beq	.L33
.L24:
	mov	r0, #0
	b	.L29
.L33:
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	ldrb	r3, [r0, r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L21
	ldr	r3, [sp, #0]
	ldrb	r2, [ip, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L21
	ldr	r3, [sp, #0]
	ldrb	r1, [r0, r3]	@ zero_extendqisi2
	ldr	r2, [sp, #0]
	ldrb	r3, [ip, r2]	@ zero_extendqisi2
	cmp	r1, r3
	beq	.L33
	mov	r0, #0
	b	.L29
	.size	pkstreql, .-pkstreql
	.align	2
	.global	pkstrcpy_volatile
	.type	pkstrcpy_volatile, %function
pkstrcpy_volatile:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, #0
	sub	sp, sp, #4
	str	r3, [sp, #0]
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	mov	ip, r1
	ldrb	r3, [r1, r2]	@ zero_extendqisi2
	mov	lr, r0
	cmp	r3, #0
	beq	.L37
.L40:
	ldr	r0, [sp, #0]
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #0]
	ldrb	r1, [ip, r2]	@ zero_extendqisi2
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	strb	r1, [lr, r0]
	ldrb	r3, [ip, r2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L40
.L37:
	ldr	r2, [sp, #0]
	mov	r3, #0
	strb	r3, [lr, r2]
	add	sp, sp, #4
	ldmfd	sp!, {pc}
	.size	pkstrcpy_volatile, .-pkstrcpy_volatile
	.align	2
	.global	pkstrcmp_volatile
	.type	pkstrcmp_volatile, %function
pkstrcmp_volatile:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r3, #0
	sub	sp, sp, #4
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	mov	lr, r0
	ldrb	ip, [r0, r2]	@ zero_extendqisi2
	ldr	r0, [sp, #0]
	mov	r4, r1
	ldrb	r3, [r1, r0]	@ zero_extendqisi2
	cmp	ip, r3
	beq	.L53
.L44:
	ldr	r3, [sp, #0]
	ldrb	r1, [lr, r3]	@ zero_extendqisi2
	ldr	r2, [sp, #0]
	ldrb	r3, [r4, r2]	@ zero_extendqisi2
	cmp	r1, r3
	mvncc	r0, #0
	movcs	r0, #1
.L47:
	add	sp, sp, #4
	ldmfd	sp!, {r4, pc}
.L53:
	ldr	r3, [sp, #0]
	ldrb	r2, [lr, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L49
.L55:
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	ldrb	r1, [lr, r2]	@ zero_extendqisi2
	ldr	r3, [sp, #0]
	ldrb	r2, [r4, r3]	@ zero_extendqisi2
	cmp	r1, r2
	bne	.L44
	ldr	r3, [sp, #0]
	ldrb	r2, [lr, r3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L55
.L49:
	mov	r0, #0
	b	.L47
	.size	pkstrcmp_volatile, .-pkstrcmp_volatile
	.align	2
	.global	pkstrcmp
	.type	pkstrcmp, %function
pkstrcmp:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r3, #0
	sub	sp, sp, #4
	str	r3, [sp, #0]
	ldr	ip, [sp, #0]
	ldr	lr, [sp, #0]
	ldrb	r2, [r0, ip]	@ zero_extendqisi2
	ldrb	r3, [r1, lr]	@ zero_extendqisi2
	mov	r4, r0
	cmp	r2, r3
	mov	r5, r1
	beq	.L67
.L58:
	ldr	r2, [sp, #0]
	ldr	r1, [sp, #0]
	ldrb	r0, [r4, r2]	@ zero_extendqisi2
	ldrb	r3, [r5, r1]	@ zero_extendqisi2
	cmp	r0, r3
	mvncc	r0, #0
	movcs	r0, #1
.L61:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, pc}
.L67:
	ldr	r3, [sp, #0]
	ldrb	r2, [r4, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L63
.L69:
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	ldr	r1, [sp, #0]
	ldrb	r0, [r4, r2]	@ zero_extendqisi2
	ldrb	r3, [r5, r1]	@ zero_extendqisi2
	cmp	r0, r3
	bne	.L58
	ldr	r3, [sp, #0]
	ldrb	r2, [r4, r3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L69
.L63:
	mov	r0, #0
	b	.L61
	.size	pkstrcmp, .-pkstrcmp
	.align	2
	.global	pkstreq
	.type	pkstreq, %function
pkstreq:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #4
	bl	pkstrcmp(PLT)
	str	r0, [sp, #0]
	ldr	r0, [sp, #0]
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	sp, sp, #4
	ldmfd	sp!, {pc}
	.size	pkstreq, .-pkstreq
	.align	2
	.global	pkstreq_volatile
	.type	pkstreq_volatile, %function
pkstreq_volatile:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #4
	bl	pkstrcmp_volatile(PLT)
	str	r0, [sp, #0]
	ldr	r0, [sp, #0]
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	sp, sp, #4
	ldmfd	sp!, {pc}
	.size	pkstreq_volatile, .-pkstreq_volatile
	.align	2
	.global	pkstrcpy_firstn
	.type	pkstrcpy_firstn, %function
pkstrcpy_firstn:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, #0
	sub	sp, sp, #4
	str	r3, [sp, #0]
	str	r3, [sp, #0]
	ldr	ip, [sp, #0]
	mov	lr, r2
	cmp	r2, ip
	mov	ip, r1
	ble	.L76
.L77:
	ldr	r3, [sp, #0]
	ldrb	r2, [ip, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L76
	ldr	r1, [sp, #0]
	ldr	r2, [sp, #0]
	ldrb	r3, [ip, r2]	@ zero_extendqisi2
	and	r3, r3, #255
	strb	r3, [r0, r1]
	ldr	r2, [sp, #0]
	add	r2, r2, #1
	str	r2, [sp, #0]
	ldr	r3, [sp, #0]
	cmp	lr, r3
	bgt	.L77
.L76:
	ldr	r2, [sp, #0]
	mov	r3, #0
	strb	r3, [r2, r0]
	add	sp, sp, #4
	ldmfd	sp!, {pc}
	.size	pkstrcpy_firstn, .-pkstrcpy_firstn
	.align	2
	.global	pkstrcpy_aftern
	.type	pkstrcpy_aftern, %function
pkstrcpy_aftern:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r3, #0
	sub	sp, sp, #8
	str	r3, [sp, #4]
	str	r3, [sp, #0]
	str	r3, [sp, #4]
	ldr	ip, [sp, #4]
	mov	lr, r2
	cmp	r2, ip
	mov	ip, r1
	ble	.L83
.L84:
	ldr	r3, [sp, #4]
	ldrb	r2, [ip, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L96
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r2, lr
	blt	.L84
.L83:
	ldr	r3, [sp, #0]
	cmp	r3, #0
	movne	r3, #0
	strneb	r3, [r0, #0]
	beq	.L87
.L91:
	add	sp, sp, #8
	ldmfd	sp!, {pc}
.L93:
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
.L87:
	ldr	r1, [sp, #4]
	ldr	r2, [sp, #4]
	rsb	r1, lr, r1
	ldrb	r3, [ip, r2]	@ zero_extendqisi2
	and	r3, r3, #255
	strb	r3, [r0, r1]
	ldr	r2, [sp, #4]
	ldrb	r3, [ip, r2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L93
	b	.L91
.L96:
	mov	r3, #1
	str	r3, [sp, #0]
	b	.L83
	.size	pkstrcpy_aftern, .-pkstrcpy_aftern
	.align	2
	.global	pkstrcpy_aftern_append
	.type	pkstrcpy_aftern_append, %function
pkstrcpy_aftern_append:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, #0
	sub	sp, sp, #4
	str	ip, [sp, #0]
	mov	r4, r0
	mov	lr, r1
	mov	ip, r2
	mov	r0, r3
.L98:
	ldr	r1, [sp, #0]
	ldr	r2, [sp, #0]
	add	r1, r1, ip
	ldrb	r3, [r2, lr]	@ zero_extendqisi2
	and	r3, r3, #255
	strb	r3, [r1, r4]
	ldr	r2, [sp, #0]
	ldrb	r3, [lr, r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L102
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	add	r2, ip, r2
	cmp	r2, r0
	bne	.L98
	ldr	r3, [sp, #0]
	mov	r2, #0
	add	r3, ip, r3
	strb	r2, [r4, r3]
.L102:
	add	sp, sp, #4
	ldmfd	sp!, {r4, pc}
	.size	pkstrcpy_aftern_append, .-pkstrcpy_aftern_append
	.ident	"GCC: (GNU) 4.0.2"
