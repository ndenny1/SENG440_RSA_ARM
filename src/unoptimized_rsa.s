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
	.file	"unoptimized_rsa.c"
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
	mov	r4, #255
.L4:
	and	r1, r4, #255
	mov	r0, r6
	bl	get_bit
	orr	r0, r5, r0
	ands	r0, r0, #255
	add	r3, r5, #1
	and	r5, r3, #255
	moveq	r5, r0
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	mov	fp, r0
	mov	r0, #0
	mov	r9, r3
	mov	sl, r1
	mov	r8, r2
	bl	cast_to_uint256
	mov	r7, r0
	mov	r0, #0
	bl	cast_to_uint256
	cmp	r9, #0
	beq	.L9
	mov	r6, #0
.L10:
	mov	r1, r6
	mov	r0, fp
	bl	get_bit
	bl	cast_to_uint256
	mov	r5, r0
	mov	r0, #1
	bl	cast_to_uint256
	mov	r1, r0
	mov	r0, r7
	bl	and_uint256
	mov	r4, r0
	mov	r0, #1
	bl	cast_to_uint256
	mov	r1, r0
	mov	r0, sl
	bl	and_uint256
	mov	r1, r0
	mov	r0, r5
	bl	and_uint256
	mov	r1, r0
	mov	r0, r4
	bl	xor_uint256
	mov	r1, sl
	mov	r4, r0
	mov	r0, r5
	bl	mul_uint256
	mov	r1, r8
	mov	r5, r0
	mov	r0, r4
	bl	mul_uint256
	mov	r1, r0
	mov	r0, r5
	bl	add_uint256
	mov	r1, r0
	mov	r0, r7
	bl	add_uint256
	mov	r1, #1
	bl	rshift_uint256
	add	r3, r6, #1
	and	r6, r3, #255
	cmp	r9, r6
	mov	r7, r0
	bhi	.L10
.L9:
	mov	r0, r7
	mov	r1, r8
	bl	gte_uint256
	cmp	r0, #0
	mov	r4, r7
	beq	.L11
	mov	r0, r7
	mov	r1, r8
	bl	sub_uint256
	mov	r4, r0
.L11:
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	mmm, .-mmm
	.align	2
	.global	me
	.type	me, %function
me:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r9, r0
	mov	r0, r2
	mov	r6, r2
	mov	sl, r1
	bl	uint256_equal_to_zero
	cmp	r0, #0
	beq	.L15
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L15:
	mov	r5, r0
	mov	r4, #255
.L19:
	and	r1, r4, #255
	mov	r0, r6
	bl	get_bit
	orr	r0, r5, r0
	ands	r0, r0, #255
	add	r3, r5, #1
	and	r5, r3, #255
	moveq	r5, r0
	subs	r4, r4, #1
	bcs	.L19
	mov	r0, #1
	bl	cast_to_uint256
	movs	r8, r5, asl #1
	mov	r7, r0
	beq	.L20
	add	r4, r4, #1
.L21:
	mov	r0, #2
	bl	cast_to_uint256
	mov	r1, r0
	mov	r0, r7
	bl	mul_uint256
	mov	r1, r6
	bl	mod_uint256
	add	r3, r4, #1
	mov	r3, r3, asl #16
	mov	r4, r3, lsr #16
	cmp	r4, r8
	mov	r7, r0
	blt	.L21
.L20:
	mov	r0, #1
	bl	cast_to_uint256
	mov	r1, r7
	mov	r2, r6
	mov	r3, r5
	bl	mmm
	mov	r1, r7
	mov	r8, r0
	mov	r2, r6
	mov	r0, r9
	mov	r3, r5
	bl	mmm
	cmp	r5, #0
	mov	r7, r0
	beq	.L22
	mov	r4, #0
	b	.L24
.L23:
	mov	r0, r7
	mov	r1, r7
	mov	r3, r5
	mov	r2, r6
	bl	mmm
	add	r3, r4, #1
	mov	r3, r3, asl #16
	mov	r4, r3, lsr #16
	cmp	r5, r4
	mov	r7, r0
	bls	.L22
.L24:
	and	r1, r4, #255
	mov	r0, sl
	bl	get_bit
	cmp	r0, #1
	bne	.L23
	mov	r0, r8
	mov	r1, r7
	mov	r2, r6
	mov	r3, r5
	bl	mmm
	mov	r8, r0
	b	.L23
.L22:
	mov	r0, #1
	bl	cast_to_uint256
	mov	r1, r8
	mov	r2, r6
	mov	r3, r5
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	b	mmm
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
	ldr	lr, .L31
	mov	r4, lr
	mov	r5, r0
	ldmia	r4!, {r0, r1, r2, r3}
	add	ip, sp, #32
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4, {r0, r1, r2, r3}
	add	lr, lr, #32
	stmia	ip, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	mov	ip, sp
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	add	r0, sp, #32
	bl	uint256_init
	ldr	r4, .L31+4
	str	r0, [r4, #0]
	mov	r0, sp
	bl	uint256_init
	ldr	r3, .L31+8
	mov	ip, r0
	mov	r1, ip
	mov	r0, r5
	ldr	r2, [r4, #0]
	str	ip, [r3, #0]
	bl	me
	add	sp, sp, #68
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	.LANCHOR0
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
	ldr	r4, .L35
	add	lr, r4, #64
	mov	r5, r0
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #32
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	add	r4, r4, #96
	stmia	ip, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	mov	ip, sp
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	add	r0, sp, #32
	bl	uint256_init
	ldr	r4, .L35+4
	str	r0, [r4, #0]
	mov	r0, sp
	bl	uint256_init
	ldr	r3, .L35+8
	mov	ip, r0
	mov	r1, ip
	mov	r0, r5
	ldr	r2, [r4, #0]
	str	ip, [r3, #0]
	bl	me
	add	sp, sp, #68
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	.LANCHOR0
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
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #68
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r0, .L39
	bl	cast_to_uint256
	ldr	r6, .L39+4
	mov	sl, r0
	mov	r1, r0
	ldr	r0, .L39+8
	bl	print_uint256
	add	ip, r6, #64
	ldmia	ip!, {r0, r1, r2, r3}
	mov	r4, sp
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2, r3}
	add	r5, r6, #96
	stmia	r4, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	add	ip, sp, #32
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r5, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r0, sp
	bl	uint256_init
	ldr	r8, .L39+12
	add	r5, sp, #32
	str	r0, [r8, #0]
	mov	r0, r5
	bl	uint256_init
	ldr	r3, .L39+16
	mov	ip, r0
	ldr	r2, [r8, #0]
	str	ip, [r3, #0]
	mov	r1, r0
	mov	r0, sl
	bl	me
	mov	sl, r0
	mov	r1, r0
	ldr	r0, .L39+20
	bl	print_uint256
	mov	ip, r6
	ldmia	ip!, {r0, r1, r2, r3}
	mov	r4, r5
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	ip, {r0, r1, r2, r3}
	add	r6, r6, #32
	stmia	r4, {r0, r1, r2, r3}
	ldmia	r6!, {r0, r1, r2, r3}
	mov	ip, sp
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r6, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r0, r5
	bl	uint256_init
	str	r0, [r8, #0]
	mov	r0, sp
	bl	uint256_init
	ldr	r3, .L39+24
	mov	ip, r0
	mov	r1, r0
	ldr	r2, [r8, #0]
	str	ip, [r3, #0]
	mov	r0, sl
	bl	me
	mov	r1, r0
	ldr	r0, .L39+28
	bl	print_uint256
	mov	r7, sp
	mov	r0, #0
	add	sp, sp, #68
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	123456789
	.word	.LANCHOR0
	.word	.LC0
	.word	M
	.word	E
	.word	.LC1
	.word	D
	.word	.LC2
	.size	main, .-main
	.comm	M,4,4
	.comm	D,4,4
	.comm	E,4,4
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	C.25.2386, %object
	.size	C.25.2386, 32
C.25.2386:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-732654249
	.word	522724653
	.word	4077834
	.word	259856259
	.type	C.26.2387, %object
	.size	C.26.2387, 32
C.26.2387:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1966156332
	.word	668611721
	.word	-1668812189
	.word	-646964575
	.type	C.19.2373, %object
	.size	C.19.2373, 32
C.19.2373:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-732654249
	.word	522724653
	.word	4077834
	.word	259856259
	.type	C.20.2374, %object
	.size	C.20.2374, 32
C.20.2374:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	65537
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
