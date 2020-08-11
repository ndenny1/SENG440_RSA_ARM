	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"optimized_rsa.c"
	.text
	.align	2
	.global	count_num_bits
	.type	count_num_bits, %function
count_num_bits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r5, #0
	mov	r6, r0
	mov	r4, #159
.L4:
	and	r1, r4, #255
	mov	r0, r6
	bl	get_bit
	add	r3, r5, #1
	cmp	r0, #0
	cmpeq	r5, #0
	mov	r3, r3, asl #16
	mov	r5, r3, lsr #16
	moveq	r5, #0
	subs	r4, r4, #1
	bcs	.L4
	mov	r0, r5
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
	.size	count_num_bits, .-count_num_bits
	.align	2
	.global	mmm
	.type	mmm, %function
mmm:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #28
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [sp, #12]
	mov	r0, #0
	str	r3, [sp, #0]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	bl	cast_to_uint160
	mov	r7, r0
	mov	r0, #0
	bl	cast_to_uint160
	mov	r0, #1
	bl	cast_to_uint160
	ldr	r3, [sp, #0]
	cmp	r3, #0
	mov	r8, r0
	beq	.L9
	mov	r6, #0
.L10:
	mov	r1, r6
	ldr	r0, [sp, #12]
	bl	get_bit
	bl	cast_to_uint160
	mov	r1, r8
	mov	r5, r0
	mov	r0, r7
	bl	and_uint160
	mov	r1, r8
	str	r0, [sp, #16]
	ldr	r0, [sp, #8]
	bl	and_uint160
	mov	fp, r0
	mov	r1, fp
	mov	r0, r5
	bl	and_uint160
	mov	r9, r0
	mov	r1, r9
	ldr	r0, [sp, #16]
	bl	xor_uint160
	ldr	r1, [sp, #8]
	mov	r4, r0
	mov	r0, r5
	bl	mul_uint160
	ldr	r1, [sp, #4]
	mov	r5, r0
	mov	r0, r4
	bl	mul_uint160
	mov	sl, r0
	mov	r1, sl
	mov	r0, r5
	bl	add_uint160
	mov	r4, r0
	mov	r1, r4
	mov	r0, r7
	bl	add_uint160
	mov	r1, #1
	str	r0, [sp, #20]
	bl	rshift_uint160
	add	r3, r6, #1
	and	r6, r3, #255
	ldr	r3, [sp, #0]
	cmp	r6, r3
	mov	r7, r0
	bcc	.L10
.L9:
	mov	r0, r8
	bl	free
	ldr	r0, [sp, #16]
	bl	free
	mov	r0, fp
	bl	free
	mov	r0, r9
	bl	free
	mov	r0, r5
	bl	free
	mov	r0, r4
	bl	free
	ldr	r0, [sp, #20]
	bl	free
	mov	r0, sl
	bl	free
	mov	r0, r7
	ldr	r1, [sp, #4]
	bl	gte_uint160
	cmp	r0, #0
	ldrne	r1, [sp, #4]
	movne	r0, r7
	blne	sub_modifying
.L11:
	mov	r0, r7
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	mmm, .-mmm
	.align	2
	.global	me
	.type	me, %function
me:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #12
	push	{lr}
	bl	__gnu_mcount_nc
	str	r0, [sp, #0]
	mov	r0, r2
	mov	r7, r2
	mov	r9, r1
	bl	uint160_equal_to_zero
	cmp	r0, #0
	movne	r4, #0
	beq	.L33
.L16:
	mov	r0, r4
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L33:
	mov	r6, r0
	mov	r4, #159
.L19:
	and	r1, r4, #255
	mov	r0, r9
	bl	get_bit
	add	r3, r6, #1
	cmp	r0, #0
	cmpeq	r6, #0
	mov	r3, r3, asl #16
	mov	r6, r3, lsr #16
	moveq	r6, #0
	subs	r4, r4, #1
	bcs	.L19
	add	r4, r4, #160
	mov	r5, #0
.L22:
	and	r1, r4, #255
	mov	r0, r7
	bl	get_bit
	add	r3, r5, #1
	cmp	r0, #0
	cmpeq	r5, #0
	mov	r3, r3, asl #16
	mov	r5, r3, lsr #16
	moveq	r5, #0
	subs	r4, r4, #1
	bcs	.L22
	mov	r0, #1
	bl	cast_to_uint160
	mov	sl, r0
	mov	r0, #1
	bl	cast_to_uint160
	str	r0, [sp, #4]
	mov	r0, #2
	bl	cast_to_uint160
	movs	r8, r5, asl #1
	mov	fp, r0
	beq	.L23
	add	r4, r4, #1
.L24:
	mov	r0, sl
	mov	r1, fp
	bl	mul_modifying
	mov	r0, sl
	mov	r1, r7
	bl	mod_modifying
	add	r3, r4, #1
	mov	r3, r3, asl #16
	mov	r4, r3, lsr #16
	cmp	r4, r8
	blt	.L24
.L23:
	mov	r0, fp
	bl	free
	mov	r1, sl
	mov	r2, r7
	mov	r3, r5
	ldr	r0, [sp, #4]
	bl	mmm
	mov	r1, sl
	mov	r2, r7
	mov	r3, r5
	mov	fp, r0
	ldr	r0, [sp, #0]
	bl	mmm
	mov	r8, r0
	mov	r0, sl
	bl	free
	cmp	r6, #0
	beq	.L25
	mov	r4, #0
	b	.L27
.L26:
	mov	r0, r8
	mov	r1, r8
	mov	r3, r5
	mov	r2, r7
	bl	mmm
	add	r3, r4, #1
	mov	r3, r3, asl #16
	mov	r4, r3, lsr #16
	cmp	r4, r6
	mov	r8, r0
	bcs	.L25
.L27:
	and	r1, r4, #255
	mov	r0, r9
	bl	get_bit
	cmp	r0, #1
	bne	.L26
	mov	r0, fp
	mov	r1, r8
	mov	r2, r7
	mov	r3, r5
	bl	mmm
	mov	fp, r0
	b	.L26
.L25:
	mov	r0, r8
	bl	free
	ldr	r0, [sp, #4]
	mov	r1, fp
	mov	r2, r7
	mov	r3, r5
	bl	mmm
	mov	r4, r0
	ldr	r0, [sp, #4]
	bl	free
	b	.L16
	.size	me, .-me
	.align	2
	.global	decrypt
	.type	decrypt, %function
decrypt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #68
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, .L36
	str	r3, [sp, #36]
	mov	r3, #4063232
	ldr	r2, .L36+4
	add	r3, r3, #14592
	add	r3, r3, #10
	str	r2, [sp, #40]
	str	r3, [sp, #44]
	ldr	r2, .L36+8
	ldr	r3, .L36+12
	mvn	ip, #3472
	str	r2, [sp, #48]
	str	r3, [sp, #4]
	ldr	r2, .L36+16
	ldr	r3, .L36+20
	sub	ip, ip, #1610612748
	mov	r1, #0
	sub	ip, ip, #58195968
	mov	r5, r0
	add	r0, sp, #32
	str	r1, [sp, #28]
	str	r2, [sp, #8]
	str	ip, [sp, #12]
	str	r3, [sp, #16]
	str	r1, [sp, #32]
	str	r1, [sp, #52]
	str	r1, [sp, #56]
	str	r1, [sp, #60]
	str	r1, [sp, #0]
	str	r1, [sp, #20]
	str	r1, [sp, #24]
	bl	uint160_init
	ldr	r4, .L36+24
	str	r0, [r4, #0]
	mov	r0, sp
	bl	uint160_init
	ldr	r3, .L36+28
	mov	ip, r0
	mov	r1, ip
	mov	r0, r5
	ldr	r2, [r4, #0]
	str	ip, [r3, #0]
	bl	me
	add	sp, sp, #68
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	-732654249
	.word	522724653
	.word	259856259
	.word	1966156332
	.word	668611721
	.word	-646964575
	.word	M
	.word	D
	.size	decrypt, .-decrypt
	.align	2
	.global	encrypt
	.type	encrypt, %function
encrypt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	sub	sp, sp, #68
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, .L40
	str	r3, [sp, #36]
	mov	r3, #4063232
	ldr	r2, .L40+4
	add	r3, r3, #14592
	add	r3, r3, #10
	str	r2, [sp, #40]
	str	r3, [sp, #44]
	ldr	r2, .L40+8
	mov	r3, #65536
	mov	r1, #0
	add	r3, r3, #1
	mov	r5, r0
	add	r0, sp, #32
	str	r2, [sp, #48]
	str	r1, [sp, #28]
	str	r3, [sp, #16]
	str	r1, [sp, #32]
	str	r1, [sp, #52]
	str	r1, [sp, #56]
	str	r1, [sp, #60]
	str	r1, [sp, #0]
	str	r1, [sp, #4]
	str	r1, [sp, #8]
	str	r1, [sp, #12]
	str	r1, [sp, #20]
	str	r1, [sp, #24]
	bl	uint160_init
	ldr	r4, .L40+12
	str	r0, [r4, #0]
	mov	r0, sp
	bl	uint160_init
	ldr	r3, .L40+16
	mov	ip, r0
	mov	r1, ip
	mov	r0, r5
	ldr	r2, [r4, #0]
	str	ip, [r3, #0]
	bl	me
	add	sp, sp, #68
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	-732654249
	.word	522724653
	.word	259856259
	.word	M
	.word	E
	.size	encrypt, .-encrypt
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #68
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r0, .L44
	bl	cast_to_uint160
	mov	r5, #4063232
	mov	r1, r0
	mov	r8, r0
	ldr	r0, .L44+4
	bl	print_uint160
	ldr	sl, .L44+8
	ldr	r9, .L44+12
	ldr	fp, .L44+16
	add	r5, r5, #14592
	mov	r3, #65536
	mov	r4, #0
	add	r3, r3, #1
	add	r5, r5, #10
	mov	r0, sp
	str	r3, [sp, #48]
	str	r4, [sp, #0]
	str	r4, [sp, #20]
	str	r4, [sp, #24]
	str	r4, [sp, #28]
	str	sl, [sp, #4]
	str	r9, [sp, #8]
	str	r5, [sp, #12]
	str	fp, [sp, #16]
	str	r4, [sp, #32]
	str	r4, [sp, #36]
	str	r4, [sp, #40]
	str	r4, [sp, #44]
	str	r4, [sp, #52]
	str	r4, [sp, #56]
	str	r4, [sp, #60]
	bl	uint160_init
	ldr	r6, .L44+20
	add	r7, sp, #32
	str	r0, [r6, #0]
	mov	r0, r7
	bl	uint160_init
	ldr	r3, .L44+24
	mov	ip, r0
	str	ip, [r3, #0]
	ldr	r2, [r6, #0]
	mov	r1, r0
	mov	r0, r8
	bl	me
	mov	r8, r0
	mov	r1, r0
	ldr	r0, .L44+28
	bl	print_uint160
	ldr	r3, .L44+32
	mvn	r1, #3472
	ldr	r2, .L44+36
	str	r3, [sp, #4]
	sub	r1, r1, #1610612748
	ldr	r3, .L44+40
	sub	r1, r1, #58195968
	mov	r0, r7
	str	r2, [sp, #8]
	str	r1, [sp, #12]
	str	r3, [sp, #16]
	str	sl, [sp, #36]
	str	r9, [sp, #40]
	str	r5, [sp, #44]
	str	fp, [sp, #48]
	str	r4, [sp, #32]
	str	r4, [sp, #52]
	str	r4, [sp, #56]
	str	r4, [sp, #60]
	str	r4, [sp, #0]
	str	r4, [sp, #20]
	str	r4, [sp, #24]
	str	r4, [sp, #28]
	bl	uint160_init
	str	r0, [r6, #0]
	mov	r0, sp
	bl	uint160_init
	ldr	r3, .L44+44
	mov	ip, r0
	mov	r1, r0
	ldr	r2, [r6, #0]
	str	ip, [r3, #0]
	mov	r0, r8
	bl	me
	mov	r1, r0
	ldr	r0, .L44+48
	bl	print_uint160
	mov	r0, r4
	add	sp, sp, #68
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	123456789
	.word	.LC0
	.word	-732654249
	.word	522724653
	.word	259856259
	.word	M
	.word	E
	.word	.LC1
	.word	1966156332
	.word	668611721
	.word	-646964575
	.word	D
	.word	.LC2
	.size	main, .-main
	.comm	M,4,4
	.comm	D,4,4
	.comm	E,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Initial Message: \000"
	.space	2
.LC1:
	.ascii	"Encoded Message: \000"
	.space	2
.LC2:
	.ascii	"Decoded Message: \000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
