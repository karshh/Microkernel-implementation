	.file	"pkstring.c"
	.text
	.align	2
	.global	pkmemcpy2
	.type	pkmemcpy2, %function
pkmemcpy2:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, r2
	sub	sp, sp, #4
	mov	r4, r0
	mov	lr, r1
	pkmemcpybefcpy:
	mov	r2, #0
	str	r2, [sp, #0]
	str	r2, [sp, #0]
	ldr	r3, [sp, #0]
	cmp	ip, r3
	bls	.L2
.L5:
	ldr	r0, [sp, #0]
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #0]
	ldrb	r1, [lr, r2]	@ zero_extendqisi2
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	strb	r1, [r4, r0]
	cmp	ip, r2
	bhi	.L5
.L2:
	pkmemcpyaftercpy:
	add	sp, sp, #4
	ldmfd	sp!, {r4, pc}
	.size	pkmemcpy2, .-pkmemcpy2
	.align	2
	.global	pkmemcpy
	.type	pkmemcpy, %function
pkmemcpy:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	@ lr needed for prologue
	.pkmemmodcheck:
	AND	r3, r0, #3
	cmp	r3, #0
	BGT	.pkmem1
	AND	r3, r1, #3
	cmp	r3, #0
	BGT	.pkmem1
.pkmem32:
	cmp	r2, #32
	BLT	.pkmem4
	stmfd	sp!, {r4-r10}
.pkmemWord32:
	LDMIA	r1!,{r3-r10}
	STMIA	r0!,{r3-r10}
	SUB r2, r2, #32
	cmp	r2, #32
	BGE 	.pkmemWord32
	ldmfd	sp!, {r4-r10}
.pkmem4:	
	cmp	r2, #4
	BLT	.pkmem1
.pkmemWord4:
	LDR r3,	[r1],#4
	STR r3,	[r0],#4
	SUB r2, r2, #4
	cmp	r2, #4
	BGE 	.pkmemWord4
.pkmem1:	
	cmp	r2, #1
	BLT	.pkmem0
.pkmemWord1:
	LDRB 	r3,[r1],#1
	STRB	r3,[r0],#1
	SUB	r2, r2, #1
	cmp	r2, #1
	BGE 	.pkmemWord1
.pkmem0:	

	bx	lr
	.size	pkmemcpy, .-pkmemcpy
	.align	2
	.global	pkstrlen
	.type	pkstrlen, %function
pkstrlen:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #4
	mov	r2, #0
	str	r2, [sp, #0]
	str	r2, [sp, #0]
	ldr	r3, [sp, #0]
	mov	r1, r0
	ldrb	r0, [r0, r3]	@ zero_extendqisi2
	@ lr needed for prologue
	cmp	r0, r2
	beq	.L13
	mov	r0, r2
.L14:
	ldr	r3, [sp, #0]
	add	r0, r0, #1
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	ldrb	r3, [r1, r2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L14
.L13:
	add	sp, sp, #4
	bx	lr
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
	beq	.L18
.L21:
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
	bne	.L21
.L18:
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
	bne	.L38
.L24:
	ldr	r3, [sp, #0]
	ldrb	r2, [r0, r3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L27
	ldr	r3, [sp, #0]
	ldrb	r2, [ip, r3]	@ zero_extendqisi2
	cmp	r2, #0
	moveq	r0, #1
	bne	.L27
.L32:
	add	sp, sp, #4
	bx	lr
.L38:
	ldr	r3, [sp, #0]
	ldrb	r2, [r1, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L24
	ldr	r3, [sp, #0]
	ldrb	r1, [r0, r3]	@ zero_extendqisi2
	ldr	r2, [sp, #0]
	ldrb	r3, [ip, r2]	@ zero_extendqisi2
	cmp	r1, r3
	beq	.L36
.L27:
	mov	r0, #0
	b	.L32
.L36:
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	ldrb	r3, [r0, r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L24
	ldr	r3, [sp, #0]
	ldrb	r2, [ip, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L24
	ldr	r3, [sp, #0]
	ldrb	r1, [r0, r3]	@ zero_extendqisi2
	ldr	r2, [sp, #0]
	ldrb	r3, [ip, r2]	@ zero_extendqisi2
	cmp	r1, r3
	beq	.L36
	mov	r0, #0
	b	.L32
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
	beq	.L40
.L43:
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
	bne	.L43
.L40:
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
	beq	.L56
.L47:
	ldr	r3, [sp, #0]
	ldrb	r1, [lr, r3]	@ zero_extendqisi2
	ldr	r2, [sp, #0]
	ldrb	r3, [r4, r2]	@ zero_extendqisi2
	cmp	r1, r3
	mvncc	r0, #0
	movcs	r0, #1
.L50:
	add	sp, sp, #4
	ldmfd	sp!, {r4, pc}
.L56:
	ldr	r3, [sp, #0]
	ldrb	r2, [lr, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L52
.L58:
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	ldrb	r1, [lr, r2]	@ zero_extendqisi2
	ldr	r3, [sp, #0]
	ldrb	r2, [r4, r3]	@ zero_extendqisi2
	cmp	r1, r2
	bne	.L47
	ldr	r3, [sp, #0]
	ldrb	r2, [lr, r3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L58
.L52:
	mov	r0, #0
	b	.L50
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
	beq	.L70
.L61:
	ldr	r2, [sp, #0]
	ldr	r1, [sp, #0]
	ldrb	r0, [r4, r2]	@ zero_extendqisi2
	ldrb	r3, [r5, r1]	@ zero_extendqisi2
	cmp	r0, r3
	mvncc	r0, #0
	movcs	r0, #1
.L64:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, pc}
.L70:
	ldr	r3, [sp, #0]
	ldrb	r2, [r4, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L66
.L72:
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	ldr	r1, [sp, #0]
	ldrb	r0, [r4, r2]	@ zero_extendqisi2
	ldrb	r3, [r5, r1]	@ zero_extendqisi2
	cmp	r0, r3
	bne	.L61
	ldr	r3, [sp, #0]
	ldrb	r2, [r4, r3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L72
.L66:
	mov	r0, #0
	b	.L64
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
	ble	.L79
.L80:
	ldr	r3, [sp, #0]
	ldrb	r2, [ip, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L79
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
	bgt	.L80
.L79:
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
	ble	.L86
.L87:
	ldr	r3, [sp, #4]
	ldrb	r2, [ip, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L99
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r2, [sp, #4]
	cmp	r2, lr
	blt	.L87
.L86:
	ldr	r3, [sp, #0]
	cmp	r3, #0
	movne	r3, #0
	strneb	r3, [r0, #0]
	beq	.L90
.L94:
	add	sp, sp, #8
	ldmfd	sp!, {pc}
.L96:
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
.L90:
	ldr	r1, [sp, #4]
	ldr	r2, [sp, #4]
	rsb	r1, lr, r1
	ldrb	r3, [ip, r2]	@ zero_extendqisi2
	and	r3, r3, #255
	strb	r3, [r0, r1]
	ldr	r2, [sp, #4]
	ldrb	r3, [ip, r2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L96
	b	.L94
.L99:
	mov	r3, #1
	str	r3, [sp, #0]
	b	.L86
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
.L101:
	ldr	r1, [sp, #0]
	ldr	r2, [sp, #0]
	add	r1, r1, ip
	ldrb	r3, [r2, lr]	@ zero_extendqisi2
	and	r3, r3, #255
	strb	r3, [r1, r4]
	ldr	r2, [sp, #0]
	ldrb	r3, [lr, r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L105
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	add	r2, ip, r2
	cmp	r2, r0
	bne	.L101
	ldr	r3, [sp, #0]
	mov	r2, #0
	add	r3, ip, r3
	strb	r2, [r4, r3]
.L105:
	add	sp, sp, #4
	ldmfd	sp!, {r4, pc}
	.size	pkstrcpy_aftern_append, .-pkstrcpy_aftern_append
	.ident	"GCC: (GNU) 4.0.2"
