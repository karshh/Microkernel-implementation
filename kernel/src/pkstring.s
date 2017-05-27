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
	.ident	"GCC: (GNU) 4.0.2"
