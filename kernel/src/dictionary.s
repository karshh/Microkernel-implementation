	.file	"dictionary.c"
	.section	.rodata.str1.4,"aMS",%progbits,1
	.subsection	-1
	.align	2
.LC0:
	.ascii	"\000"
	.text
	.align	2
	.global	initHashEntry
	.type	initHashEntry, %function
initHashEntry:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	sl, [sp, #-4]!
	ldr	sl, .L4
	ldr	r1, .L4+4
.L3:
	add	sl, pc, sl
	mvn	r3, #0
	str	r3, [r0], #4
	add	r1, sl, r1
	@ lr needed for prologue
	ldmfd	sp!, {sl}
	b	pkstrcpy_volatile(PLT)
.L5:
	.align	2
.L4:
	.word	_GLOBAL_OFFSET_TABLE_-(.L3+8)
	.word	.LC0(GOTOFF)
	.size	initHashEntry, .-initHashEntry
	.align	2
	.global	initHashMap
	.type	initHashMap, %function
initHashMap:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r3, #0
	sub	sp, sp, #4
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	ldr	r3, .L13
	mov	r4, r0
	cmp	r2, r3
	ble	.L12
.L9:
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, pc}
.L12:
	mov	r5, r3
.L8:
	ldr	r0, [sp, #0]
	add	r0, r0, r0, asl #2
	add	r0, r4, r0, asl #2
	bl	initHashEntry(PLT)
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	cmp	r2, r5
	ble	.L8
	b	.L9
.L14:
	.align	2
.L13:
	.word	346
	.size	initHashMap, .-initHashMap
	.align	2
	.global	initTIDLookup
	.type	initTIDLookup, %function
initTIDLookup:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	sl, [sp, #-4]!
	ldr	sl, .L18
	ldr	r1, .L18+4
.L17:
	add	sl, pc, sl
	mov	r2, #0
	add	r1, sl, r1
	@ lr needed for prologue
	str	r2, [r0, #16]
	ldmfd	sp!, {sl}
	b	pkstrcpy_volatile(PLT)
.L19:
	.align	2
.L18:
	.word	_GLOBAL_OFFSET_TABLE_-(.L17+8)
	.word	.LC0(GOTOFF)
	.size	initTIDLookup, .-initTIDLookup
	.align	2
	.global	initDictionary
	.type	initDictionary, %function
initDictionary:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	sub	sp, sp, #4
	mov	r4, r0
	bl	initHashMap(PLT)
	mov	r3, #0
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	cmp	r2, #127
	ble	.L25
.L23:
	add	sp, sp, #4
	ldmfd	sp!, {r4, pc}
.L25:
	add	r4, r4, #6912
	add	r4, r4, #28
.L22:
	ldr	r0, [sp, #0]
	add	r0, r0, r0, asl #2
	add	r0, r4, r0, asl #2
	bl	initTIDLookup(PLT)
	ldr	r3, [sp, #0]
	add	r3, r3, #1
	str	r3, [sp, #0]
	ldr	r2, [sp, #0]
	cmp	r2, #127
	ble	.L22
	b	.L23
	.size	initDictionary, .-initDictionary
	.align	2
	.global	hashCode
	.type	hashCode, %function
hashCode:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #12
	mov	r3, #0
	mov	r2, #73
	str	r3, [sp, #8]
	str	r2, [sp, #4]
	ldr	r1, [sp, #8]
	@ lr needed for prologue
	ldrb	r3, [r0, r1]	@ zero_extendqisi2
	b	.L32
.L33:
	ldr	r3, [sp, #8]
	add	r3, r3, #1
	str	r3, [sp, #8]
	ldr	r2, [sp, #8]
	ldrb	r3, [r0, r2]	@ zero_extendqisi2
.L32:
	and	r3, r3, #255
	str	r3, [sp, #0]
	ldr	r1, [sp, #4]
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #0]
	add	r3, r3, r1, asl #5
	add	r3, r3, r2
	str	r3, [sp, #4]
	ldr	r2, [sp, #8]
	ldrb	r3, [r0, r2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L33
	ldr	r2, [sp, #4]
	ldr	r3, .L34
	umull	r1, r0, r3, r2
	mov	r0, r0, lsr #7
	rsb	r3, r0, r0, asl #3
	add	r3, r0, r3, asl #2
	rsb	r3, r3, r3, asl #2
	rsb	r0, r0, r3, asl #2
	rsb	r0, r0, r2
	add	sp, sp, #12
	bx	lr
.L35:
	.align	2
.L34:
	.word	1584310703
	.size	hashCode, .-hashCode
	.align	2
	.global	searchHashMap
	.type	searchHashMap, %function
searchHashMap:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r5, r0
	sub	sp, sp, #8
	mov	r0, r1
	mov	r4, r1
	bl	hashCode(PLT)
	str	r0, [sp, #4]
	ldr	r3, [sp, #4]
	str	r3, [sp, #0]
.L37:
	ldr	r0, [sp, #4]
	mov	r1, r4
	add	r0, r0, r0, asl #2
	mov	r0, r0, asl #2
	add	r0, r0, #4
	add	r0, r5, r0
	bl	pkstrcmp_volatile(PLT)
	cmp	r0, #0
	beq	.L45
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r0, [sp, #4]
	ldr	r3, .L46
	smull	r2, r1, r3, r0
	mov	r2, r0, asr #31
	rsb	r2, r2, r1, asr #7
	rsb	r3, r2, r2, asl #3
	add	r3, r2, r3, asl #2
	rsb	r3, r3, r3, asl #2
	rsb	r3, r2, r3, asl #2
	rsb	r2, r3, r0
	str	r2, [sp, #4]
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bne	.L37
	mvn	r0, #0
.L40:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, pc}
.L45:
	ldr	r3, [sp, #4]
	add	r3, r3, r3, asl #2
	ldr	r0, [r5, r3, asl #2]
	b	.L40
.L47:
	.align	2
.L46:
	.word	1584310703
	.size	searchHashMap, .-searchHashMap
	.align	2
	.global	insertHashMap
	.type	insertHashMap, %function
insertHashMap:
	@ args = 0, pretend = 0, frame = 12
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	ldr	sl, .L63
	sub	sp, sp, #12
.L60:
	add	sl, pc, sl
	mov	r5, r2
	mov	r4, r0
	mov	r6, r1
	bl	searchHashMap(PLT)
	str	r0, [sp, #8]
	ldr	r3, [sp, #8]
	cmp	r3, r5
	moveq	r0, #0
	bne	.L61
.L51:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, pc}
.L61:
	ldr	r3, [sp, #8]
	cmp	r3, #0
	mvnge	r0, #1
	bge	.L51
	mov	r0, r6
	bl	hashCode(PLT)
	str	r0, [sp, #4]
	ldr	r3, [sp, #4]
	ldr	r8, .L63+4
	str	r3, [sp, #0]
.L54:
	ldr	r0, [sp, #4]
	add	r1, sl, r8
	add	r0, r0, r0, asl #2
	mov	r0, r0, asl #2
	add	r0, r0, #4
	add	r0, r4, r0
	bl	pkstrcmp_volatile(PLT)
	subs	r7, r0, #0
	beq	.L62
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r0, [sp, #4]
	ldr	r3, .L63+8
	smull	r2, r1, r3, r0
	mov	r2, r0, asr #31
	rsb	r2, r2, r1, asr #7
	rsb	r3, r2, r2, asl #3
	add	r3, r2, r3, asl #2
	rsb	r3, r3, r3, asl #2
	rsb	r3, r2, r3, asl #2
	rsb	r2, r3, r0
	str	r2, [sp, #4]
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bne	.L54
	mvn	r0, #0
	b	.L51
.L62:
	ldr	r3, [sp, #4]
	mov	r1, r6
	add	r3, r3, r3, asl #2
	str	r5, [r4, r3, asl #2]
	ldr	r0, [sp, #4]
	add	r0, r0, r0, asl #2
	mov	r0, r0, asl #2
	add	r0, r0, #4
	add	r0, r4, r0
	bl	pkstrcpy_volatile(PLT)
	mov	r0, r7
	b	.L51
.L64:
	.align	2
.L63:
	.word	_GLOBAL_OFFSET_TABLE_-(.L60+8)
	.word	.LC0(GOTOFF)
	.word	1584310703
	.size	insertHashMap, .-insertHashMap
	.align	2
	.global	deleteHashMap
	.type	deleteHashMap, %function
deleteHashMap:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r6, r0
	sub	sp, sp, #8
	mov	r0, r1
	mov	r5, r1
	bl	hashCode(PLT)
	str	r0, [sp, #4]
	ldr	r3, [sp, #4]
	str	r3, [sp, #0]
.L66:
	ldr	r0, [sp, #4]
	mov	r1, r5
	add	r0, r0, r0, asl #2
	mov	r0, r0, asl #2
	add	r0, r0, #4
	add	r0, r6, r0
	bl	pkstrcmp_volatile(PLT)
	subs	r4, r0, #0
	beq	.L74
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r0, [sp, #4]
	ldr	r3, .L75
	smull	r2, r1, r3, r0
	mov	r2, r0, asr #31
	rsb	r2, r2, r1, asr #7
	rsb	r3, r2, r2, asl #3
	add	r3, r2, r3, asl #2
	rsb	r3, r3, r3, asl #2
	rsb	r3, r2, r3, asl #2
	rsb	r2, r3, r0
	str	r2, [sp, #4]
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #4]
	cmp	r2, r3
	bne	.L66
	mvn	r0, #0
.L69:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, pc}
.L74:
	ldr	r0, [sp, #4]
	add	r0, r0, r0, asl #2
	add	r0, r6, r0, asl #2
	bl	initHashEntry(PLT)
	mov	r0, r4
	b	.L69
.L76:
	.align	2
.L75:
	.word	1584310703
	.size	deleteHashMap, .-deleteHashMap
	.align	2
	.global	searchDictionary
	.type	searchDictionary, %function
searchDictionary:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	sub	sp, sp, #4
	mov	r4, r2
	bl	searchHashMap(PLT)
	str	r0, [sp, #0]
	ldr	r3, [sp, #0]
	mov	r0, #0
	cmp	r3, r0
	ldrge	r3, [sp, #0]
	movge	r0, #1
	strge	r3, [r4, #0]
	add	sp, sp, #4
	ldmfd	sp!, {r4, pc}
	.size	searchDictionary, .-searchDictionary
	.align	2
	.global	addDictionary
	.type	addDictionary, %function
addDictionary:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	sub	sp, sp, #8
	mov	r6, r2
	add	r2, sp, #4
	mov	r4, r0
	mov	r5, r1
	bl	searchDictionary(PLT)
	cmp	r0, #0
	mov	r1, r5
	mov	r0, r4
	blne	deleteHashMap(PLT)
.L83:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r6
	bl	insertHashMap(PLT)
	str	r0, [sp, #0]
	ldr	r0, [sp, #0]
	rsbs	r0, r0, #1
	movcc	r0, #0
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, pc}
	.size	addDictionary, .-addDictionary
	.align	2
	.global	deleteDictionary
	.type	deleteDictionary, %function
deleteDictionary:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	add	r1, r1, r1, asl #2
	mov	r5, r1, asl #2
	ldr	r3, .L90
	add	ip, r5, r0
	ldr	r2, [ip, r3]
	add	r1, r5, #6912
	add	r1, r1, #28
	cmp	r2, #0
	mov	r4, r0
	add	r1, r0, r1
	ldmeqfd	sp!, {r4, r5, pc}
	bl	deleteHashMap(PLT)
	add	r0, r4, #6912
	add	r0, r0, #28
	add	r0, r0, r5
	ldmfd	sp!, {r4, r5, lr}
	b	initTIDLookup(PLT)
.L91:
	.align	2
.L90:
	.word	6956
	.size	deleteDictionary, .-deleteDictionary
	.ident	"GCC: (GNU) 4.0.2"
