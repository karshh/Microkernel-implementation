	.file	"dictionary.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\000"
	.text
	.align	2
	.global	initHashEntry
	.type	initHashEntry, %function
initHashEntry:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L4
.L3:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r2, [fp, #-20]
	mvn	r3, #0
	str	r3, [r2, #0]
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	mov	r0, r3
	ldr	r3, .L4+4
	add	r3, sl, r3
	mov	r1, r3
	bl	pkstrcpy_volatile(PLT)
	ldmfd	sp, {r3, sl, fp, sp, pc}
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L7
.L8:
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	mov	r0, r3
	bl	initHashEntry(PLT)
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L7:
	ldr	r2, [fp, #-16]
	ldr	r3, .L11
	cmp	r2, r3
	ble	.L8
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L12:
	.align	2
.L11:
	.word	346
	.size	initHashMap, .-initHashMap
	.align	2
	.global	initTIDLookup
	.type	initTIDLookup, %function
initTIDLookup:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #4
	ldr	sl, .L16
.L15:
	add	sl, pc, sl
	str	r0, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r3, #0
	str	r3, [r2, #16]
	ldr	r3, [fp, #-20]
	mov	r0, r3
	ldr	r3, .L16+4
	add	r3, sl, r3
	mov	r1, r3
	bl	pkstrcpy_volatile(PLT)
	ldmfd	sp, {r3, sl, fp, sp, pc}
.L17:
	.align	2
.L16:
	.word	_GLOBAL_OFFSET_TABLE_-(.L15+8)
	.word	.LC0(GOTOFF)
	.size	initTIDLookup, .-initTIDLookup
	.align	2
	.global	initDictionary
	.type	initDictionary, %function
initDictionary:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	mov	r0, r3
	bl	initHashMap(PLT)
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L19
.L20:
	ldr	r3, [fp, #-20]
	add	r1, r3, #6912
	add	r1, r1, #28
	ldr	r3, [fp, #-16]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	mov	r0, r3
	bl	initTIDLookup(PLT)
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L19:
	ldr	r3, [fp, #-16]
	cmp	r3, #127
	ble	.L20
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	initDictionary, .-initDictionary
	.align	2
	.global	hashCode
	.type	hashCode, %function
hashCode:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #73
	str	r3, [fp, #-20]
.L24:
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #5
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	and	r3, r3, #255
	cmp	r3, #0
	beq	.L25
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L24
.L25:
	ldr	r1, [fp, #-20]
	ldr	r3, .L28
	umull	r2, r3, r1, r3
	mov	r3, r3, lsr #7
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-32]
	mov	r2, r2, asl #3
	ldr	r3, [fp, #-32]
	rsb	r2, r3, r2
	mov	r2, r2, asl #2
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	rsb	r3, r2, r3
	rsb	r1, r3, r1
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L29:
	.align	2
.L28:
	.word	1584310703
	.size	hashCode, .-hashCode
	.align	2
	.global	searchHashMap
	.type	searchHashMap, %function
searchHashMap:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r0, [fp, #-28]
	bl	hashCode(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
.L31:
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r2, r3, #4
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	pkstrcmp_volatile(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L32
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	ldr	r3, [r3, #0]
	str	r3, [fp, #-36]
	b	.L34
.L32:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-16]
	ldr	r3, .L38
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #7
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-32]
	ldr	r2, [fp, #-32]
	mov	r2, r2, asl #3
	ldr	r3, [fp, #-32]
	rsb	r2, r3, r2
	mov	r2, r2, asl #2
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	rsb	r3, r2, r3
	rsb	r1, r3, r1
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L31
	mvn	r2, #0
	str	r2, [fp, #-36]
.L34:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L39:
	.align	2
.L38:
	.word	1584310703
	.size	searchHashMap, .-searchHashMap
	.align	2
	.global	insertHashMap
	.type	insertHashMap, %function
insertHashMap:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {sl, fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #32
	ldr	sl, .L52
.L51:
	add	sl, pc, sl
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	ldr	r0, [fp, #-32]
	ldr	r1, [fp, #-36]
	bl	searchHashMap(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bne	.L41
	mov	r2, #0
	str	r2, [fp, #-48]
	b	.L43
.L41:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	blt	.L44
	mvn	r3, #1
	str	r3, [fp, #-48]
	b	.L43
.L44:
	ldr	r0, [fp, #-36]
	bl	hashCode(PLT)
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-28]
	b	.L46
.L47:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-24]
	ldr	r3, .L52+4
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #7
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-44]
	ldr	r2, [fp, #-44]
	mov	r2, r2, asl #3
	ldr	r3, [fp, #-44]
	rsb	r2, r3, r2
	mov	r2, r2, asl #2
	ldr	r3, [fp, #-44]
	add	r2, r2, r3
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-44]
	rsb	r3, r2, r3
	rsb	r1, r3, r1
	str	r1, [fp, #-44]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L46
	mvn	r2, #0
	str	r2, [fp, #-48]
	b	.L43
.L46:
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r2, r3, #4
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	mov	r0, r3
	ldr	r3, .L52+8
	add	r3, sl, r3
	mov	r1, r3
	bl	pkstrcmp_volatile(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L47
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-32]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r2, r3, r1
	ldr	r3, [fp, #-40]
	str	r3, [r2, #0]
	ldr	r2, [fp, #-24]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r2, r3, #4
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-36]
	bl	pkstrcpy_volatile(PLT)
	mov	r3, #0
	str	r3, [fp, #-48]
.L43:
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #16
	ldmfd	sp, {sl, fp, sp, pc}
.L53:
	.align	2
.L52:
	.word	_GLOBAL_OFFSET_TABLE_-(.L51+8)
	.word	1584310703
	.word	.LC0(GOTOFF)
	.size	insertHashMap, .-insertHashMap
	.align	2
	.global	deleteHashMap
	.type	deleteHashMap, %function
deleteHashMap:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r0, [fp, #-28]
	bl	hashCode(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
.L55:
	ldr	r2, [fp, #-16]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r2, r3, #4
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	pkstrcmp_volatile(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L56
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	mov	r0, r3
	bl	initHashEntry(PLT)
	mov	r2, #0
	str	r2, [fp, #-36]
	b	.L58
.L56:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r1, [fp, #-16]
	ldr	r3, .L62
	smull	r2, r3, r1, r3
	mov	r2, r3, asr #7
	mov	r3, r1, asr #31
	rsb	r2, r3, r2
	str	r2, [fp, #-32]
	ldr	r2, [fp, #-32]
	mov	r2, r2, asl #3
	ldr	r3, [fp, #-32]
	rsb	r2, r3, r2
	mov	r2, r2, asl #2
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	mov	r3, r2, asl #2
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-32]
	rsb	r3, r2, r3
	rsb	r1, r3, r1
	str	r1, [fp, #-32]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L55
	mvn	r2, #0
	str	r2, [fp, #-36]
.L58:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L63:
	.align	2
.L62:
	.word	1584310703
	.size	deleteHashMap, .-deleteHashMap
	.align	2
	.global	searchDictionary
	.type	searchDictionary, %function
searchDictionary:
	@ args = 0, pretend = 0, frame = 20
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #20
	str	r0, [fp, #-20]
	str	r1, [fp, #-24]
	str	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	mov	r0, r3
	ldr	r1, [fp, #-24]
	bl	searchHashMap(PLT)
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L65
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L67
.L65:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #0]
	mov	r3, #1
	str	r3, [fp, #-32]
.L67:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	searchDictionary, .-searchDictionary
	.align	2
	.global	addDictionary
	.type	addDictionary, %function
addDictionary:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	sub	r3, fp, #16
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-28]
	mov	r2, r3
	bl	searchDictionary(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L70
	ldr	r3, [fp, #-24]
	mov	r0, r3
	ldr	r1, [fp, #-28]
	bl	deleteHashMap(PLT)
.L70:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	ldr	r1, [fp, #-28]
	ldr	r2, [fp, #-32]
	bl	insertHashMap(PLT)
	mov	r3, r0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L72
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L74
.L72:
	mov	r3, #0
	str	r3, [fp, #-36]
.L74:
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
	.size	addDictionary, .-addDictionary
	.align	2
	.global	deleteDictionary
	.type	deleteDictionary, %function
deleteDictionary:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r1, [fp, #-16]
	ldr	r0, .L80
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r1
	add	r3, r3, r0
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L79
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, #6912
	add	r3, r3, #28
	ldr	r2, [fp, #-16]
	add	r3, r3, r2
	mov	r0, r1
	mov	r1, r3
	bl	deleteHashMap(PLT)
	ldr	r3, [fp, #-16]
	add	r1, r3, #6912
	add	r1, r1, #28
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #2
	add	r3, r1, r3
	mov	r0, r3
	bl	initTIDLookup(PLT)
.L79:
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L81:
	.align	2
.L80:
	.word	6956
	.size	deleteDictionary, .-deleteDictionary
	.ident	"GCC: (GNU) 4.0.2"
