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
	.file	"int256.c"
	.text
	.align	2
	.global	mul_uint32
	.type	mul_uint32, %function
mul_uint32:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9}
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r5, #65536
	sub	r5, r5, #1
	mov	r6, r1, lsr #16
	and	r7, r0, r5
	mul	ip, r7, r6
	mov	r0, r0, lsr #16
	and	r1, r1, r5
	mul	r8, r0, r6
	mul	r4, r0, r1
	mul	r6, r7, r1
	mov	r0, ip, lsr #16
	and	ip, ip, r5
	add	r0, r0, r4, lsr #16
	add	ip, ip, r6, lsr #16
	and	r1, r8, r5
	and	r4, r4, r5
	add	ip, ip, r4
	add	r0, r0, r1
	add	r0, r0, ip, lsr #16
	mov	r1, r0, lsr #16
	add	r1, r1, r8, lsr #16
	and	r6, r6, r5
	orr	r0, r0, r1, asl #16
	orr	r6, r6, ip, asl #16
	str	r0, [r2, #0]
	str	r6, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9}
	bx	lr
	.size	mul_uint32, .-mul_uint32
	.align	2
	.global	uint256_equal_to_zero
	.type	uint256_equal_to_zero, %function
uint256_equal_to_zero:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bne	.L4
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bne	.L4
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bne	.L4
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L4
	ldr	r3, [r0, #12]
	cmp	r3, #0
	bne	.L4
	ldr	r3, [r0, #8]
	cmp	r3, #0
	bne	.L4
	ldr	r3, [r0, #4]
	cmp	r3, #0
	bne	.L4
	ldr	r3, [r0, #0]
	rsbs	r0, r3, #1
	movcc	r0, #0
	bx	lr
.L4:
	mov	r0, #0
	bx	lr
	.size	uint256_equal_to_zero, .-uint256_equal_to_zero
	.align	2
	.global	gte_uint256
	.type	gte_uint256, %function
gte_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r2, [r0, #0]
	mov	ip, r0
	ldr	r0, [r1, #0]
	cmp	r2, r0
	bne	.L9
	ldr	r0, [ip, #4]
	ldr	r4, [r1, #4]
	cmp	r0, r4
	bne	.L10
	ldr	r2, [ip, #8]
	ldr	r3, [r1, #8]
	cmp	r2, r3
	bne	.L10
	ldr	r2, [ip, #12]
	ldr	r3, [r1, #12]
	cmp	r2, r3
	bne	.L10
	ldr	r2, [ip, #16]
	ldr	r3, [r1, #16]
	cmp	r2, r3
	bne	.L10
	ldr	r2, [ip, #20]
	ldr	r3, [r1, #20]
	cmp	r2, r3
	bne	.L10
	ldr	r2, [ip, #24]
	ldr	r3, [r1, #24]
	cmp	r2, r3
	bne	.L10
	ldr	r2, [ip, #28]
	ldr	r3, [r1, #28]
	cmp	r2, r3
	moveq	r0, #1
	bne	.L10
.L13:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L9:
	cmp	r2, r0
	movls	r0, #0
	movhi	r0, #1
	b	.L13
.L10:
	mov	r2, r0
	cmp	r2, r4
	mov	r0, r4
	bne	.L9
	ldr	r2, [ip, #8]
	ldr	r0, [r1, #8]
	cmp	r2, r0
	bne	.L9
	ldr	r2, [ip, #12]
	ldr	r0, [r1, #12]
	cmp	r2, r0
	bne	.L9
	ldr	r2, [ip, #16]
	ldr	r0, [r1, #16]
	cmp	r2, r0
	bne	.L9
	ldr	r2, [ip, #20]
	ldr	r0, [r1, #20]
	cmp	r2, r0
	bne	.L9
	ldr	r2, [ip, #24]
	ldr	r0, [r1, #24]
	cmp	r2, r0
	bne	.L9
	ldr	r2, [ip, #28]
	ldr	r3, [r1, #28]
	cmp	r2, r3
	movls	r0, #0
	movhi	r0, #1
	b	.L13
	.size	gte_uint256, .-gte_uint256
	.align	2
	.global	gt_uint256
	.type	gt_uint256, %function
gt_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r2, [r0, #0]
	mov	r3, r0
	ldr	r0, [r1, #0]
	cmp	r2, r0
	bne	.L17
	ldr	r2, [r3, #4]
	ldr	r0, [r1, #4]
	cmp	r2, r0
	bne	.L17
	ldr	r2, [r3, #8]
	ldr	r0, [r1, #8]
	cmp	r2, r0
	bne	.L17
	ldr	r2, [r3, #12]
	ldr	r0, [r1, #12]
	cmp	r2, r0
	bne	.L17
	ldr	r2, [r3, #16]
	ldr	r0, [r1, #16]
	cmp	r2, r0
	bne	.L17
	ldr	r2, [r3, #20]
	ldr	r0, [r1, #20]
	cmp	r2, r0
	bne	.L17
	ldr	r2, [r3, #24]
	ldr	r0, [r1, #24]
	cmp	r2, r0
	bne	.L17
	ldr	r2, [r3, #28]
	ldr	r3, [r1, #28]
	cmp	r2, r3
	movls	r0, #0
	movhi	r0, #1
	bx	lr
.L17:
	cmp	r2, r0
	movls	r0, #0
	movhi	r0, #1
	bx	lr
	.size	gt_uint256, .-gt_uint256
	.align	2
	.global	equal_uint256
	.type	equal_uint256, %function
equal_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r2, [r0, #0]
	ldr	r3, [r1, #0]
	cmp	r2, r3
	bne	.L22
	ldr	r2, [r0, #4]
	ldr	r3, [r1, #4]
	cmp	r2, r3
	bne	.L22
	ldr	r2, [r0, #8]
	ldr	r3, [r1, #8]
	cmp	r2, r3
	bne	.L22
	ldr	r2, [r0, #12]
	ldr	r3, [r1, #12]
	cmp	r2, r3
	bne	.L22
	ldr	r2, [r0, #16]
	ldr	r3, [r1, #16]
	cmp	r2, r3
	bne	.L22
	ldr	r2, [r0, #20]
	ldr	r3, [r1, #20]
	cmp	r2, r3
	bne	.L22
	ldr	r2, [r0, #24]
	ldr	r3, [r1, #24]
	cmp	r2, r3
	bne	.L22
	ldr	r2, [r0, #28]
	ldr	r3, [r1, #28]
	cmp	r2, r3
	movne	r0, #0
	moveq	r0, #1
	bx	lr
.L22:
	mov	r0, #0
	bx	lr
	.size	equal_uint256, .-equal_uint256
	.align	2
	.global	get_bit
	.type	get_bit, %function
get_bit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{lr}
	bl	__gnu_mcount_nc
	cmp	r1, #223
	ldrhi	r3, [r0, #0]
	subhi	r2, r1, #224
	movhi	r3, r3, lsr r2
	andhi	r0, r3, #1
	bxhi	lr
	add	r3, r1, #64
	and	r3, r3, #255
	cmp	r3, #31
	ldrls	r3, [r0, #4]
	subls	r2, r1, #192
	movls	r3, r3, lsr r2
	andls	r0, r3, #1
	bxls	lr
	add	r3, r1, #96
	and	r3, r3, #255
	cmp	r3, #31
	ldrls	r3, [r0, #8]
	subls	r2, r1, #160
	movls	r3, r3, lsr r2
	andls	r0, r3, #1
	bxls	lr
	sub	r2, r1, #128
	and	r3, r2, #255
	cmp	r3, #31
	ldrls	r3, [r0, #12]
	movls	r3, r3, lsr r2
	andls	r0, r3, #1
	bxls	lr
	sub	r2, r1, #96
	and	r3, r2, #255
	cmp	r3, #31
	ldrls	r3, [r0, #16]
	movls	r3, r3, lsr r2
	andls	r0, r3, #1
	bxls	lr
	sub	r2, r1, #64
	and	r3, r2, #255
	cmp	r3, #31
	ldrls	r3, [r0, #20]
	movls	r3, r3, lsr r2
	andls	r0, r3, #1
	bxls	lr
	sub	r2, r1, #32
	and	r3, r2, #255
	cmp	r3, #31
	ldrls	r3, [r0, #24]
	ldrhi	r3, [r0, #28]
	movls	r3, r3, lsr r2
	movhi	r3, r3, lsr r1
	andls	r0, r3, #1
	andhi	r0, r3, #1
	bx	lr
	.size	get_bit, .-get_bit
	.align	2
	.global	print_uint256
	.type	print_uint256, %function
print_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r4, .L37
	mov	r5, r1
	mov	r1, r0
	ldr	r0, .L37+4
	bl	printf
	ldr	r1, [r5, #0]
	mov	r0, r4
	bl	printf
	ldr	r1, [r5, #4]
	mov	r0, r4
	bl	printf
	ldr	r1, [r5, #8]
	mov	r0, r4
	bl	printf
	ldr	r1, [r5, #12]
	mov	r0, r4
	bl	printf
	ldr	r1, [r5, #16]
	mov	r0, r4
	bl	printf
	ldr	r1, [r5, #20]
	mov	r0, r4
	bl	printf
	ldr	r1, [r5, #24]
	mov	r0, r4
	bl	printf
	mov	r0, r4
	ldr	r1, [r5, #28]
	bl	printf
	mov	r0, #10
	bl	putchar
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LC1
	.word	.LC0
	.size	print_uint256, .-print_uint256
	.align	2
	.global	uint256_init
	.type	uint256_init, %function
uint256_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r4, r0
	mov	r0, #32
	bl	malloc
	ldr	r2, [r4, #28]
	ldmia	r4, {r1, ip}	@ phole ldm
	add	r5, r4, #8
	ldmia	r5, {r5, r6, r7, r8}	@ phole ldm
	ldr	sl, [r4, #24]
	str	r2, [r0, #28]
	stmia	r0, {r1, ip}	@ phole stm
	str	r5, [r0, #8]
	str	r6, [r0, #12]
	str	r7, [r0, #16]
	str	r8, [r0, #20]
	str	sl, [r0, #24]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
	.size	uint256_init, .-uint256_init
	.align	2
	.global	lt_uint256
	.type	lt_uint256, %function
lt_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r2, [r0, #0]
	mov	ip, r0
	ldr	r0, [r1, #0]
	cmp	r2, r0
	bne	.L42
	ldr	r0, [ip, #4]
	ldr	r4, [r1, #4]
	cmp	r0, r4
	bne	.L43
	ldr	r2, [ip, #8]
	ldr	r3, [r1, #8]
	cmp	r2, r3
	bne	.L43
	ldr	r2, [ip, #12]
	ldr	r3, [r1, #12]
	cmp	r2, r3
	bne	.L43
	ldr	r2, [ip, #16]
	ldr	r3, [r1, #16]
	cmp	r2, r3
	bne	.L43
	ldr	r2, [ip, #20]
	ldr	r3, [r1, #20]
	cmp	r2, r3
	bne	.L43
	ldr	r2, [ip, #24]
	ldr	r3, [r1, #24]
	cmp	r2, r3
	bne	.L43
	ldr	r2, [ip, #28]
	ldr	r3, [r1, #28]
	cmp	r2, r3
	moveq	r0, #0
	bne	.L43
.L46:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L42:
	cmp	r2, r0
	movhi	r0, #0
	movls	r0, #1
	b	.L46
.L43:
	mov	r2, r0
	cmp	r2, r4
	mov	r0, r4
	bne	.L42
	ldr	r2, [ip, #8]
	ldr	r0, [r1, #8]
	cmp	r2, r0
	bne	.L42
	ldr	r2, [ip, #12]
	ldr	r0, [r1, #12]
	cmp	r2, r0
	bne	.L42
	ldr	r2, [ip, #16]
	ldr	r0, [r1, #16]
	cmp	r2, r0
	bne	.L42
	ldr	r2, [ip, #20]
	ldr	r0, [r1, #20]
	cmp	r2, r0
	bne	.L42
	ldr	r2, [ip, #24]
	ldr	r0, [r1, #24]
	cmp	r2, r0
	bne	.L42
	ldr	r2, [ip, #28]
	ldr	r3, [r1, #28]
	cmp	r2, r3
	movhi	r0, #0
	movls	r0, #1
	b	.L46
	.size	lt_uint256, .-lt_uint256
	.align	2
	.global	xor_uint256
	.type	xor_uint256, %function
xor_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #52
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, [r0, #0]
	str	r3, [sp, #4]
	ldr	r3, [r0, #28]
	str	r3, [sp, #12]
	ldr	r3, [r0, #24]
	add	r9, r0, #16
	ldmia	r9, {r9, fp}	@ phole ldm
	add	r8, r0, #8
	ldmia	r8, {r8, sl}	@ phole ldm
	ldr	r7, [r1, #0]
	add	r4, r1, #20
	ldmia	r4, {r4, r5, r6}	@ phole ldm
	add	r2, r1, #8
	ldmia	r2, {r2, ip, lr}	@ phole ldm
	str	r3, [sp, #8]
	ldr	r3, [r1, #4]
	ldr	r1, [r0, #4]
	ldr	r0, [sp, #12]
	eor	r3, r3, r1
	eor	r6, r6, r0
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #8]
	eor	r2, r2, r8
	eor	r5, r5, r0
	eor	lr, lr, r9
	eor	ip, ip, sl
	eor	r7, r7, r1
	eor	r4, r4, fp
	mov	r0, #32
	str	r2, [sp, #24]
	str	r3, [sp, #20]
	str	r6, [sp, #44]
	str	r5, [sp, #40]
	str	r4, [sp, #36]
	str	lr, [sp, #32]
	str	ip, [sp, #28]
	str	r7, [sp, #16]
	bl	malloc
	ldr	r3, [sp, #44]
	str	r3, [r0, #28]
	ldr	r2, [sp, #16]
	str	r2, [r0, #0]
	ldr	r3, [sp, #20]
	str	r3, [r0, #4]
	ldr	r2, [sp, #24]
	str	r2, [r0, #8]
	ldr	r3, [sp, #28]
	str	r3, [r0, #12]
	ldr	r2, [sp, #32]
	str	r2, [r0, #16]
	ldr	r3, [sp, #36]
	str	r3, [r0, #20]
	ldr	r2, [sp, #40]
	str	r2, [r0, #24]
	add	sp, sp, #52
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	xor_uint256, .-xor_uint256
	.align	2
	.global	or_uint256
	.type	or_uint256, %function
or_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	sub	sp, sp, #32
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r6, [r0, #0]
	add	r1, r0, #20
	ldmia	r1, {r1, r2, r3}	@ phole ldm
	ldr	ip, [r0, #16]
	add	r4, r0, #8
	ldmia	r4, {r4, lr}	@ phole ldm
	ldr	r5, [r0, #4]
	mov	r0, #32
	str	r3, [sp, #28]
	str	r2, [sp, #24]
	str	r1, [sp, #20]
	str	ip, [sp, #16]
	str	lr, [sp, #12]
	str	r4, [sp, #8]
	str	r5, [sp, #4]
	str	r6, [sp, #0]
	bl	malloc
	ldr	r3, [sp, #28]
	str	r3, [r0, #28]
	ldr	r2, [sp, #0]
	str	r2, [r0, #0]
	ldr	r3, [sp, #4]
	str	r3, [r0, #4]
	ldr	r2, [sp, #8]
	str	r2, [r0, #8]
	ldr	r3, [sp, #12]
	str	r3, [r0, #12]
	ldr	r2, [sp, #16]
	str	r2, [r0, #16]
	ldr	r3, [sp, #20]
	str	r3, [r0, #20]
	ldr	r2, [sp, #24]
	str	r2, [r0, #24]
	add	sp, sp, #32
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
	.size	or_uint256, .-or_uint256
	.align	2
	.global	and_uint256
	.type	and_uint256, %function
and_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #52
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, [r0, #0]
	str	r3, [sp, #4]
	ldr	r3, [r0, #28]
	str	r3, [sp, #12]
	ldr	r3, [r0, #24]
	add	r9, r0, #16
	ldmia	r9, {r9, fp}	@ phole ldm
	add	r8, r0, #8
	ldmia	r8, {r8, sl}	@ phole ldm
	ldr	r7, [r1, #0]
	add	r4, r1, #20
	ldmia	r4, {r4, r5, r6}	@ phole ldm
	add	r2, r1, #8
	ldmia	r2, {r2, ip, lr}	@ phole ldm
	str	r3, [sp, #8]
	ldr	r3, [r1, #4]
	ldr	r1, [r0, #4]
	ldr	r0, [sp, #12]
	and	r3, r3, r1
	and	r6, r6, r0
	ldr	r1, [sp, #4]
	ldr	r0, [sp, #8]
	and	r2, r2, r8
	and	r5, r5, r0
	and	lr, lr, r9
	and	ip, ip, sl
	and	r7, r7, r1
	and	r4, r4, fp
	mov	r0, #32
	str	r2, [sp, #24]
	str	r3, [sp, #20]
	str	r6, [sp, #44]
	str	r5, [sp, #40]
	str	r4, [sp, #36]
	str	lr, [sp, #32]
	str	ip, [sp, #28]
	str	r7, [sp, #16]
	bl	malloc
	ldr	r3, [sp, #44]
	str	r3, [r0, #28]
	ldr	r2, [sp, #16]
	str	r2, [r0, #0]
	ldr	r3, [sp, #20]
	str	r3, [r0, #4]
	ldr	r2, [sp, #24]
	str	r2, [r0, #8]
	ldr	r3, [sp, #28]
	str	r3, [r0, #12]
	ldr	r2, [sp, #32]
	str	r2, [r0, #16]
	ldr	r3, [sp, #36]
	str	r3, [r0, #20]
	ldr	r2, [sp, #40]
	str	r2, [r0, #24]
	add	sp, sp, #52
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	and_uint256, .-and_uint256
	.align	2
	.global	cast_to_uint256
	.type	cast_to_uint256, %function
cast_to_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #36
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r3, #0
	str	r0, [sp, #28]
	mov	r0, #32
	str	r3, [sp, #24]
	str	r3, [sp, #0]
	str	r3, [sp, #4]
	str	r3, [sp, #8]
	str	r3, [sp, #12]
	str	r3, [sp, #16]
	str	r3, [sp, #20]
	bl	malloc
	ldr	r3, [sp, #28]
	str	r3, [r0, #28]
	ldr	r2, [sp, #0]
	str	r2, [r0, #0]
	ldr	r3, [sp, #4]
	str	r3, [r0, #4]
	ldr	r2, [sp, #8]
	str	r2, [r0, #8]
	ldr	r3, [sp, #12]
	str	r3, [r0, #12]
	ldr	r2, [sp, #16]
	str	r2, [r0, #16]
	ldr	r3, [sp, #20]
	str	r3, [r0, #20]
	ldr	r2, [sp, #24]
	str	r2, [r0, #24]
	add	sp, sp, #36
	ldr	lr, [sp], #4
	bx	lr
	.size	cast_to_uint256, .-cast_to_uint256
	.align	2
	.global	sub_uint256
	.type	sub_uint256, %function
sub_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	push	{lr}
	bl	__gnu_mcount_nc
	add	r2, r0, #24
	ldmia	r2, {r2, r3}	@ phole ldm
	add	r6, r1, #24
	ldmia	r6, {r6, r7}	@ phole ldm
	ldr	r8, [r0, #20]
	ldr	r5, [r1, #20]
	ldr	r9, [r0, #16]
	rsb	r7, r7, r3
	ldr	r4, [r1, #16]
	rsb	r6, r6, r2
	ldr	fp, [r0, #12]
	cmp	r3, r7
	subcc	r6, r6, #1
	ldr	lr, [r1, #12]
	rsb	r5, r5, r8
	ldr	sl, [r0, #8]
	cmp	r6, r2
	subhi	r5, r5, #1
	ldr	ip, [r1, #8]
	rsb	r4, r4, r9
	cmp	r5, r8
	subhi	r4, r4, #1
	ldr	r2, [r1, #4]
	ldr	r8, [r0, #4]
	rsb	lr, lr, fp
	ldr	r3, [r0, #0]
	cmp	r4, r9
	subhi	lr, lr, #1
	ldr	r0, [r1, #0]
	rsb	ip, ip, sl
	cmp	lr, fp
	subhi	ip, ip, #1
	rsb	r2, r2, r8
	cmp	ip, sl
	subhi	r2, r2, #1
	rsb	r3, r0, r3
	cmp	r2, r8
	subhi	r3, r3, #1
	mov	r0, #32
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	str	r7, [sp, #28]
	str	r6, [sp, #24]
	str	r5, [sp, #20]
	str	r4, [sp, #16]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	bl	malloc
	ldr	r3, [sp, #28]
	str	r3, [r0, #28]
	ldr	r2, [sp, #0]
	str	r2, [r0, #0]
	ldr	r3, [sp, #4]
	str	r3, [r0, #4]
	ldr	r2, [sp, #8]
	str	r2, [r0, #8]
	ldr	r3, [sp, #12]
	str	r3, [r0, #12]
	ldr	r2, [sp, #16]
	str	r2, [r0, #16]
	ldr	r3, [sp, #20]
	str	r3, [r0, #20]
	ldr	r2, [sp, #24]
	str	r2, [r0, #24]
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	sub_uint256, .-sub_uint256
	.align	2
	.global	add_uint256
	.type	add_uint256, %function
add_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #36
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, [r0, #28]
	ldr	lr, [r1, #28]
	ldr	r2, [r0, #24]
	ldr	r4, [r1, #24]
	add	fp, lr, r3
	cmp	lr, fp
	cmpls	r3, fp
	movls	r3, #0
	movhi	r3, #1
	add	r9, r4, r2
	ldr	ip, [r0, #20]
	ldr	lr, [r1, #20]
	add	r9, r9, r3
	cmp	r9, r4
	cmpcs	r9, r2
	movcs	r2, #0
	movcc	r2, #1
	add	r7, lr, ip
	ldr	r3, [r0, #16]
	ldr	r4, [r1, #16]
	add	r7, r7, r2
	cmp	r7, lr
	cmpcs	r7, ip
	movcs	ip, #0
	movcc	ip, #1
	add	r6, r4, r3
	ldr	r2, [r0, #12]
	ldr	r8, [r1, #12]
	add	r6, r6, ip
	cmp	r6, r4
	cmpcs	r6, r3
	movcs	r3, #0
	movcc	r3, #1
	add	r5, r8, r2
	ldr	lr, [r0, #8]
	ldr	sl, [r1, #8]
	add	r5, r5, r3
	cmp	r5, r8
	cmpcs	r5, r2
	movcs	r2, #0
	movcc	r2, #1
	add	r4, sl, lr
	ldr	ip, [r0, #4]
	ldr	r8, [r1, #4]
	add	r4, r4, r2
	cmp	r4, sl
	cmpcs	r4, lr
	movcs	lr, #0
	movcc	lr, #1
	add	r2, r8, ip
	ldr	r3, [r1, #0]
	add	r2, r2, lr
	ldr	r1, [r0, #0]
	cmp	r2, r8
	cmpcs	r2, ip
	movcs	ip, #0
	movcc	ip, #1
	add	r3, r3, r1
	add	r3, r3, ip
	mov	r0, #32
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	str	fp, [sp, #28]
	str	r9, [sp, #24]
	str	r7, [sp, #20]
	str	r6, [sp, #16]
	str	r5, [sp, #12]
	str	r4, [sp, #8]
	bl	malloc
	ldr	r3, [sp, #28]
	str	r3, [r0, #28]
	ldr	r2, [sp, #0]
	str	r2, [r0, #0]
	ldr	r3, [sp, #4]
	str	r3, [r0, #4]
	ldr	r2, [sp, #8]
	str	r2, [r0, #8]
	ldr	r3, [sp, #12]
	str	r3, [r0, #12]
	ldr	r2, [sp, #16]
	str	r2, [r0, #16]
	ldr	r3, [sp, #20]
	str	r3, [r0, #20]
	ldr	r2, [sp, #24]
	str	r2, [r0, #24]
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	add_uint256, .-add_uint256
	.align	2
	.global	mul_uint256
	.type	mul_uint256, %function
mul_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 456
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #460
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r5, .L70
	mov	lr, r5
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #424
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r0, #32
	bl	malloc
	add	r4, r5, #32
	mov	fp, r0
	ldmia	r4!, {r0, r1, r2, r3}
	add	ip, sp, #392
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #424]
	str	r3, [fp, #0]
	ldr	r2, [sp, #428]
	str	r2, [fp, #4]
	ldr	r3, [sp, #432]
	str	r3, [fp, #8]
	ldr	r2, [sp, #436]
	str	r2, [fp, #12]
	ldr	r3, [sp, #440]
	str	r3, [fp, #16]
	ldr	r2, [sp, #444]
	str	r2, [fp, #20]
	ldr	r3, [sp, #448]
	str	r3, [fp, #24]
	ldr	r2, [sp, #452]
	mov	r0, #32
	str	r2, [fp, #28]
	bl	malloc
	add	r4, r5, #64
	str	r0, [sp, #12]
	ldmia	r4!, {r0, r1, r2, r3}
	add	ip, sp, #360
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #392]
	ldr	r2, [sp, #12]
	str	r3, [r2, #0]
	ldr	r2, [sp, #396]
	ldr	r3, [sp, #12]
	str	r2, [r3, #4]
	ldr	r3, [sp, #400]
	ldr	r2, [sp, #12]
	str	r3, [r2, #8]
	ldr	r2, [sp, #404]
	ldr	r3, [sp, #12]
	str	r2, [r3, #12]
	ldr	r3, [sp, #408]
	ldr	r2, [sp, #12]
	str	r3, [r2, #16]
	ldr	r2, [sp, #412]
	ldr	r3, [sp, #12]
	str	r2, [r3, #20]
	ldr	r3, [sp, #416]
	ldr	r2, [sp, #12]
	str	r3, [r2, #24]
	ldr	r2, [sp, #420]
	ldr	r3, [sp, #12]
	mov	r0, #32
	str	r2, [r3, #28]
	bl	malloc
	add	r4, r5, #96
	mov	r7, r0
	ldmia	r4!, {r0, r1, r2, r3}
	add	ip, sp, #328
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #360]
	str	r3, [r7, #0]
	ldr	r2, [sp, #364]
	str	r2, [r7, #4]
	ldr	r3, [sp, #368]
	str	r3, [r7, #8]
	ldr	r2, [sp, #372]
	str	r2, [r7, #12]
	ldr	r3, [sp, #376]
	str	r3, [r7, #16]
	ldr	r2, [sp, #380]
	str	r2, [r7, #20]
	ldr	r3, [sp, #384]
	str	r3, [r7, #24]
	ldr	r2, [sp, #388]
	mov	r0, #32
	str	r2, [r7, #28]
	bl	malloc
	add	r4, r5, #128
	mov	r8, r0
	ldmia	r4!, {r0, r1, r2, r3}
	add	ip, sp, #296
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #328]
	str	r3, [r8, #0]
	ldr	r2, [sp, #332]
	str	r2, [r8, #4]
	ldr	r3, [sp, #336]
	str	r3, [r8, #8]
	ldr	r2, [sp, #340]
	str	r2, [r8, #12]
	ldr	r3, [sp, #344]
	str	r3, [r8, #16]
	ldr	r2, [sp, #348]
	str	r2, [r8, #20]
	ldr	r3, [sp, #352]
	str	r3, [r8, #24]
	ldr	r2, [sp, #356]
	mov	r0, #32
	str	r2, [r8, #28]
	bl	malloc
	add	r4, r5, #160
	mov	sl, r0
	ldmia	r4!, {r0, r1, r2, r3}
	add	ip, sp, #264
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #296]
	str	r3, [sl, #0]
	ldr	r2, [sp, #300]
	str	r2, [sl, #4]
	ldr	r3, [sp, #304]
	str	r3, [sl, #8]
	ldr	r2, [sp, #308]
	str	r2, [sl, #12]
	ldr	r3, [sp, #312]
	str	r3, [sl, #16]
	ldr	r2, [sp, #316]
	str	r2, [sl, #20]
	ldr	r3, [sp, #320]
	str	r3, [sl, #24]
	ldr	r2, [sp, #324]
	mov	r0, #32
	str	r2, [sl, #28]
	bl	malloc
	add	r4, r5, #192
	mov	r6, r0
	ldmia	r4!, {r0, r1, r2, r3}
	add	ip, sp, #232
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #264]
	str	r3, [r6, #0]
	ldr	r2, [sp, #268]
	str	r2, [r6, #4]
	ldr	r3, [sp, #272]
	str	r3, [r6, #8]
	ldr	r2, [sp, #276]
	str	r2, [r6, #12]
	ldr	r3, [sp, #280]
	str	r3, [r6, #16]
	ldr	r2, [sp, #284]
	str	r2, [r6, #20]
	ldr	r3, [sp, #288]
	str	r3, [r6, #24]
	ldr	r2, [sp, #292]
	mov	r0, #32
	str	r2, [r6, #28]
	bl	malloc
	add	r5, r5, #224
	mov	r4, r0
	ldmia	r5!, {r0, r1, r2, r3}
	add	ip, sp, #200
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r5, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #232]
	str	r3, [r4, #0]
	ldr	r2, [sp, #236]
	str	r2, [r4, #4]
	ldr	r3, [sp, #240]
	str	r3, [r4, #8]
	ldr	r2, [sp, #244]
	str	r2, [r4, #12]
	ldr	r3, [sp, #248]
	str	r3, [r4, #16]
	ldr	r2, [sp, #252]
	str	r2, [r4, #20]
	ldr	r3, [sp, #256]
	str	r3, [r4, #24]
	ldr	r2, [sp, #260]
	mov	r0, #32
	str	r2, [r4, #28]
	bl	malloc
	ldr	r3, [sp, #200]
	str	r3, [r0, #0]
	ldr	r2, [sp, #204]
	str	r2, [r0, #4]
	ldr	r3, [sp, #208]
	str	r3, [r0, #8]
	ldr	r2, [sp, #212]
	str	r2, [r0, #12]
	ldr	r3, [sp, #216]
	str	r3, [r0, #16]
	ldr	r2, [sp, #220]
	str	r2, [r0, #20]
	ldr	r3, [sp, #224]
	str	r3, [r0, #24]
	ldr	r2, [sp, #228]
	ldr	r3, [sp, #20]
	str	r2, [r0, #28]
	ldr	r2, [sp, #12]
	str	r0, [sp, #196]
	mov	r0, #8
	str	fp, [sp, #168]
	str	r2, [sp, #172]
	str	r7, [sp, #176]
	str	r8, [sp, #180]
	str	sl, [sp, #184]
	str	r6, [sp, #188]
	str	r4, [sp, #192]
	str	r3, [sp, #36]
	str	r0, [sp, #32]
	mov	r9, #0
.L62:
	ldr	r3, [sp, #32]
	cmp	r3, #0
	rsb	r3, r3, #8
	ble	.L65
	mov	r3, r3, asl #2
	add	r0, sp, #168
	ldr	r2, [sp, #16]
	add	r0, r0, r3
	str	r0, [sp, #28]
	str	r2, [sp, #24]
	mov	fp, #0
.L63:
	ldr	r2, [sp, #36]
	ldr	r0, [sp, #24]
	ldr	r1, [r2, #28]
	ldr	r3, [r0, #28]
	mov	r0, r1, asl #16
	mov	ip, r3, lsr #16
	mov	r0, r0, lsr #16
	mov	r3, r3, asl #16
	mul	r2, r0, ip
	mov	r1, r1, lsr #16
	mov	r3, r3, lsr #16
	mul	r4, r1, ip
	mul	lr, r1, r3
	mul	ip, r0, r3
	mov	r1, r2, asl #16
	mov	r3, lr, asl #16
	mov	r0, r4, asl #16
	mov	r1, r1, lsr #16
	mov	r2, r2, lsr #16
	add	r2, r2, lr, lsr #16
	add	r1, r1, ip, lsr #16
	mov	r3, r3, lsr #16
	mov	r0, r0, lsr #16
	add	r1, r1, r3
	add	r2, r2, r0
	add	r2, r2, r1, lsr #16
	mov	r3, r2, lsr #16
	add	r3, r3, r4, lsr #16
	orr	r2, r2, r3, asl #16
	mov	ip, ip, asl #16
	str	r2, [sp, #160]
	mov	ip, ip, lsr #16
	ldr	r2, [sp, #28]
	orr	ip, ip, r1, asl #16
	mov	r0, #32
	ldr	r4, [r2, #0]
	str	ip, [sp, #164]
	str	r9, [sp, #136]
	str	r9, [sp, #140]
	str	r9, [sp, #144]
	str	r9, [sp, #148]
	str	r9, [sp, #152]
	str	r9, [sp, #156]
	bl	malloc
	ldr	lr, [sp, #140]
	ldr	ip, [sp, #164]
	ldr	r7, [sp, #136]
	ldr	sl, [sp, #148]
	ldr	r8, [sp, #152]
	ldr	r6, [sp, #156]
	ldr	r5, [sp, #160]
	str	r7, [r0, #0]
	str	ip, [r0, #28]
	str	lr, [r0, #4]
	ldr	r3, [sp, #144]
	str	sl, [r0, #12]
	str	r3, [r0, #8]
	str	r8, [r0, #16]
	str	r6, [r0, #20]
	str	r5, [r0, #24]
	ldr	r1, [r4, #28]
	add	r2, ip, r1
	str	r2, [sp, #68]
	ldr	r0, [r4, #24]
	cmp	ip, r2
	cmpls	r1, r2
	movls	r1, #0
	movhi	r1, #1
	add	r3, r5, r0
	add	r3, r3, r1
	str	r3, [sp, #64]
	ldr	r1, [r4, #20]
	cmp	r5, r3
	cmpls	r0, r3
	movls	r0, #0
	movhi	r0, #1
	add	r2, r6, r1
	add	r2, r2, r0
	str	r2, [sp, #60]
	ldr	r0, [r4, #16]
	cmp	r6, r2
	cmpls	r1, r2
	movls	r1, #0
	movhi	r1, #1
	add	r3, r8, r0
	add	r3, r3, r1
	str	r3, [sp, #56]
	ldr	r1, [r4, #12]
	cmp	r8, r3
	cmpls	r0, r3
	movls	r0, #0
	movhi	r0, #1
	add	r2, sl, r1
	add	r2, r2, r0
	str	r2, [sp, #52]
	cmp	sl, r2
	cmpls	r1, r2
	ldr	r0, [r4, #8]
	ldr	r2, [sp, #144]
	movls	r1, #0
	movhi	r1, #1
	add	r3, r2, r0
	add	r3, r3, r1
	str	r3, [sp, #48]
	ldr	r1, [r4, #4]
	cmp	r2, r3
	cmpls	r0, r3
	movls	r0, #0
	movhi	r0, #1
	add	r2, lr, r1
	add	r2, r2, r0
	str	r2, [sp, #44]
	ldr	r3, [r4, #0]
	cmp	lr, r2
	cmpls	r1, r2
	movls	r1, #0
	movhi	r1, #1
	add	r7, r7, r3
	add	r7, r7, r1
	mov	r0, #32
	str	r7, [sp, #40]
	bl	malloc
	ldr	r3, [sp, #32]
	add	fp, fp, #1
	cmp	fp, r3
	ldr	r3, [sp, #40]
	str	r3, [r0, #0]
	ldr	r2, [sp, #44]
	str	r2, [r0, #4]
	ldr	r3, [sp, #48]
	str	r3, [r0, #8]
	ldr	r2, [sp, #52]
	str	r2, [r0, #12]
	ldr	r3, [sp, #56]
	str	r3, [r0, #16]
	ldr	r2, [sp, #60]
	str	r2, [r0, #20]
	ldr	r3, [sp, #64]
	str	r3, [r0, #24]
	ldr	r2, [sp, #68]
	str	r2, [r0, #28]
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #24]
	str	r0, [r2], #4
	sub	r3, r3, #4
	str	r2, [sp, #28]
	str	r3, [sp, #24]
	blt	.L63
.L65:
	add	r0, sp, #32
	ldmia	r0, {r0, r2}	@ phole ldm
	subs	r0, r0, #1
	sub	r2, r2, #4
	str	r0, [sp, #32]
	str	r2, [sp, #36]
	bne	.L62
	add	r3, sp, #196
	str	r3, [sp, #4]
	add	fp, sp, #168
.L66:
	ldr	r3, [fp, #0]
	ldr	r2, [r3, #4]
	ldr	r4, [r3, #24]
	add	r1, r3, #8
	ldmia	r1, {r1, ip}	@ phole ldm
	add	r5, r3, #16
	ldmia	r5, {r5, lr}	@ phole ldm
	mov	r0, #32
	str	r2, [sp, #108]
	mov	r2, #0
	str	r1, [sp, #112]
	str	ip, [sp, #116]
	str	r5, [sp, #124]
	str	lr, [sp, #128]
	str	r4, [sp, #132]
	str	r2, [sp, #104]
	ldr	r4, [fp, #4]
	str	r5, [sp, #120]
	bl	malloc
	ldr	ip, [sp, #132]
	ldr	r7, [sp, #104]
	ldr	lr, [sp, #112]
	ldr	sl, [sp, #116]
	ldr	r8, [sp, #120]
	ldr	r6, [sp, #124]
	ldr	r5, [sp, #128]
	str	ip, [r0, #28]
	str	r7, [r0, #0]
	ldr	r3, [sp, #108]
	stmib	r0, {r3, lr}	@ phole stm
	str	sl, [r0, #12]
	str	r8, [r0, #16]
	str	r6, [r0, #20]
	str	r5, [r0, #24]
	ldr	r1, [r4, #28]
	add	r2, ip, r1
	str	r2, [sp, #68]
	ldr	r0, [r4, #24]
	cmp	ip, r2
	cmpls	r1, r2
	movls	r1, #0
	movhi	r1, #1
	add	r3, r5, r0
	add	r3, r3, r1
	str	r3, [sp, #64]
	ldr	r1, [r4, #20]
	cmp	r5, r3
	cmpls	r0, r3
	movls	r0, #0
	movhi	r0, #1
	add	r2, r6, r1
	add	r2, r2, r0
	str	r2, [sp, #60]
	ldr	r0, [r4, #16]
	cmp	r6, r2
	cmpls	r1, r2
	movls	r1, #0
	movhi	r1, #1
	add	r3, r8, r0
	add	r3, r3, r1
	str	r3, [sp, #56]
	ldr	r1, [r4, #12]
	cmp	r8, r3
	cmpls	r0, r3
	movls	r0, #0
	movhi	r0, #1
	add	r2, sl, r1
	add	r2, r2, r0
	str	r2, [sp, #52]
	ldr	r0, [r4, #8]
	cmp	sl, r2
	cmpls	r1, r2
	movls	r1, #0
	movhi	r1, #1
	add	r3, lr, r0
	add	r3, r3, r1
	str	r3, [sp, #48]
	cmp	lr, r3
	cmpls	r0, r3
	ldr	r1, [r4, #4]
	ldr	r3, [sp, #108]
	movls	r0, #0
	movhi	r0, #1
	add	r2, r3, r1
	add	r2, r2, r0
	str	r2, [sp, #44]
	ldr	r0, [sp, #108]
	ldr	r3, [r4, #0]
	cmp	r0, r2
	cmpls	r1, r2
	movls	r1, #0
	movhi	r1, #1
	add	r7, r7, r3
	add	r7, r7, r1
	mov	r0, #32
	str	r7, [sp, #40]
	bl	malloc
	ldr	r3, [sp, #40]
	ldr	r2, [sp, #4]
	str	r0, [fp, #4]!
	str	r3, [r0, #0]
	cmp	fp, r2
	ldr	r2, [sp, #44]
	str	r2, [r0, #4]
	ldr	r3, [sp, #48]
	str	r3, [r0, #8]
	ldr	r2, [sp, #52]
	str	r2, [r0, #12]
	ldr	r3, [sp, #56]
	str	r3, [r0, #16]
	ldr	r2, [sp, #60]
	str	r2, [r0, #20]
	ldr	r3, [sp, #64]
	str	r3, [r0, #24]
	ldr	r2, [sp, #68]
	str	r2, [r0, #28]
	bne	.L66
	ldr	r3, [sp, #168]
	ldr	r2, [sp, #172]
	ldr	r4, [r3, #28]
	ldr	lr, [r2, #28]
	ldr	r3, [sp, #176]
	ldr	r2, [sp, #180]
	ldr	r5, [r3, #28]
	ldr	r6, [r2, #28]
	ldr	r3, [sp, #184]
	ldr	r2, [sp, #188]
	ldr	r7, [r3, #28]
	ldr	ip, [r2, #28]
	ldr	r3, [sp, #192]
	ldr	r2, [sp, #196]
	ldr	r1, [r3, #28]
	ldr	r3, [r2, #28]
	mov	r0, #32
	str	r3, [sp, #72]
	str	r1, [sp, #76]
	str	ip, [sp, #80]
	str	r7, [sp, #84]
	str	r6, [sp, #88]
	str	r5, [sp, #92]
	str	lr, [sp, #96]
	str	r4, [sp, #100]
	bl	malloc
	ldr	r3, [sp, #100]
	str	r3, [r0, #28]
	ldr	r2, [sp, #72]
	str	r2, [r0, #0]
	ldr	r3, [sp, #76]
	str	r3, [r0, #4]
	ldr	r2, [sp, #80]
	str	r2, [r0, #8]
	ldr	r3, [sp, #84]
	str	r3, [r0, #12]
	ldr	r2, [sp, #88]
	str	r2, [r0, #16]
	ldr	r3, [sp, #92]
	str	r3, [r0, #20]
	ldr	r2, [sp, #96]
	str	r2, [r0, #24]
	add	sp, sp, #460
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	.LANCHOR0
	.size	mul_uint256, .-mul_uint256
	.align	2
	.global	lshift_uint256
	.type	lshift_uint256, %function
lshift_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 256
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #260
	push	{lr}
	bl	__gnu_mcount_nc
	cmp	r1, #223
	mov	r4, r1
	bhi	.L89
	add	r3, r1, #64
	and	r5, r3, #255
	cmp	r5, #31
	bls	.L90
	add	r3, r1, #96
	and	r5, r3, #255
	cmp	r5, #31
	bls	.L91
	sub	r3, r1, #128
	and	r5, r3, #255
	cmp	r5, #31
	bls	.L92
	sub	r3, r1, #96
	and	r5, r3, #255
	cmp	r5, #31
	bls	.L93
	sub	r3, r1, #64
	and	r6, r3, #255
	cmp	r6, #31
	bls	.L94
	sub	r3, r1, #32
	and	r7, r3, #255
	cmp	r7, #31
	rsbhi	lr, r1, #32
	movhi	ip, #7
	bls	.L95
.L85:
	cmp	ip, #7
	beq	.L82
.L88:
	ldr	r1, [r0, ip, asl #2]
	mov	r1, r1, asl r4
	add	r3, ip, #1
	ldr	r2, [r0, r3, asl #2]
	orr	r1, r1, r2, lsr lr
	add	r2, sp, #256
	add	r3, r2, ip, asl #2
	subs	ip, ip, #1
	str	r1, [r3, #-256]
	bpl	.L85
	mov	r0, #32
	bl	malloc
	ldr	r3, [sp, #0]
	str	r3, [r0, #0]
	ldr	r2, [sp, #4]
	str	r2, [r0, #4]
	ldr	r3, [sp, #8]
	str	r3, [r0, #8]
	ldr	r2, [sp, #12]
	str	r2, [r0, #12]
	ldr	r3, [sp, #16]
	str	r3, [r0, #16]
	ldr	r2, [sp, #20]
	str	r2, [r0, #20]
	ldr	r3, [sp, #24]
	str	r3, [r0, #24]
	ldr	r2, [sp, #28]
	str	r2, [r0, #28]
	b	.L74
.L89:
	ldr	r2, [r0, #0]
	mov	r3, #0
	mov	r0, #32
	str	r3, [sp, #248]
	str	r2, [sp, #252]
	str	r3, [sp, #224]
	str	r3, [sp, #228]
	str	r3, [sp, #232]
	str	r3, [sp, #236]
	str	r3, [sp, #240]
	str	r3, [sp, #244]
	bl	malloc
	ldr	r3, [sp, #252]
	str	r3, [r0, #28]
	ldr	r2, [sp, #224]
	str	r2, [r0, #0]
	ldr	r3, [sp, #228]
	str	r3, [r0, #4]
	ldr	r2, [sp, #232]
	str	r2, [r0, #8]
	ldr	r3, [sp, #236]
	str	r3, [r0, #12]
	ldr	r2, [sp, #240]
	str	r2, [r0, #16]
	ldr	r3, [sp, #244]
	str	r3, [r0, #20]
	ldr	r2, [sp, #248]
	add	r1, r4, #32
	and	r1, r1, #255
	str	r2, [r0, #24]
	bl	lshift_uint256
.L74:
	add	sp, sp, #260
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L90:
	ldmia	r0, {r1, r2}	@ phole ldm
	mov	r3, #0
	mov	r0, #32
	str	r3, [sp, #212]
	str	r2, [sp, #216]
	str	r1, [sp, #220]
	str	r3, [sp, #192]
	str	r3, [sp, #196]
	str	r3, [sp, #200]
	str	r3, [sp, #204]
	str	r3, [sp, #208]
	bl	malloc
	ldr	r3, [sp, #220]
	str	r3, [r0, #28]
	ldr	r2, [sp, #192]
	str	r2, [r0, #0]
	ldr	r3, [sp, #196]
	str	r3, [r0, #4]
	ldr	r2, [sp, #200]
	str	r2, [r0, #8]
	ldr	r3, [sp, #204]
	str	r3, [r0, #12]
	ldr	r2, [sp, #208]
	str	r2, [r0, #16]
	ldr	r3, [sp, #212]
	str	r3, [r0, #20]
	ldr	r2, [sp, #216]
	mov	r1, r5
	str	r2, [r0, #24]
	bl	lshift_uint256
	b	.L74
.L91:
	ldr	ip, [r0, #0]
	ldmib	r0, {r1, r2}	@ phole ldm
	mov	r3, #0
	mov	r0, #32
	str	r3, [sp, #176]
	str	r2, [sp, #180]
	str	r1, [sp, #184]
	str	r3, [sp, #160]
	str	r3, [sp, #164]
	str	r3, [sp, #168]
	str	r3, [sp, #172]
	str	ip, [sp, #188]
	bl	malloc
	ldr	r3, [sp, #188]
	str	r3, [r0, #28]
	ldr	r2, [sp, #160]
	str	r2, [r0, #0]
	ldr	r3, [sp, #164]
	str	r3, [r0, #4]
	ldr	r2, [sp, #168]
	str	r2, [r0, #8]
	ldr	r3, [sp, #172]
	str	r3, [r0, #12]
	ldr	r2, [sp, #176]
	str	r2, [r0, #16]
	ldr	r3, [sp, #180]
	str	r3, [r0, #20]
	ldr	r2, [sp, #184]
	mov	r1, r5
	str	r2, [r0, #24]
	bl	lshift_uint256
	b	.L74
.L93:
	ldr	r4, [r0, #0]
	add	r1, r0, #12
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	ip, [r0, #8]
	ldr	lr, [r0, #4]
	mov	r3, #0
	add	r0, sp, #96
	str	r1, [sp, #112]
	str	r3, [sp, #104]
	str	r2, [sp, #108]
	str	ip, [sp, #116]
	str	lr, [sp, #120]
	str	r4, [sp, #124]
	str	r3, [sp, #96]
	str	r3, [sp, #100]
	bl	uint256_init
	mov	r1, r5
	bl	lshift_uint256
	b	.L74
.L82:
	ldr	r3, [r0, #28]
	mov	r3, r3, asl r4
	mov	ip, #6
	str	r3, [sp, #28]
	b	.L88
.L92:
	ldr	lr, [r0, #0]
	add	r1, r0, #8
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	ip, [r0, #4]
	mov	r3, #0
	mov	r0, #32
	str	r3, [sp, #140]
	str	r2, [sp, #144]
	str	r1, [sp, #148]
	str	r3, [sp, #128]
	str	r3, [sp, #132]
	str	r3, [sp, #136]
	str	ip, [sp, #152]
	str	lr, [sp, #156]
	bl	malloc
	ldr	r3, [sp, #156]
	str	r3, [r0, #28]
	ldr	r2, [sp, #128]
	str	r2, [r0, #0]
	ldr	r3, [sp, #132]
	str	r3, [r0, #4]
	ldr	r2, [sp, #136]
	str	r2, [r0, #8]
	ldr	r3, [sp, #140]
	str	r3, [r0, #12]
	ldr	r2, [sp, #144]
	str	r2, [r0, #16]
	ldr	r3, [sp, #148]
	str	r3, [r0, #20]
	ldr	r2, [sp, #152]
	mov	r1, r5
	str	r2, [r0, #24]
	bl	lshift_uint256
	b	.L74
.L94:
	ldr	r5, [r0, #0]
	add	r1, r0, #16
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	ip, [r0, #12]
	ldmib	r0, {r4, lr}	@ phole ldm
	mov	r3, #0
	add	r0, sp, #64
	str	r1, [sp, #76]
	str	r3, [sp, #68]
	str	r2, [sp, #72]
	str	ip, [sp, #80]
	str	lr, [sp, #84]
	str	r4, [sp, #88]
	str	r5, [sp, #92]
	str	r3, [sp, #64]
	bl	uint256_init
	mov	r1, r6
	bl	lshift_uint256
	b	.L74
.L95:
	ldr	r6, [r0, #0]
	add	r1, r0, #20
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	ip, [r0, #16]
	add	r4, r0, #8
	ldmia	r4, {r4, lr}	@ phole ldm
	ldr	r5, [r0, #4]
	mov	r3, #0
	add	r0, sp, #32
	str	r1, [sp, #40]
	str	r3, [sp, #32]
	str	r2, [sp, #36]
	str	ip, [sp, #44]
	str	lr, [sp, #48]
	str	r4, [sp, #52]
	str	r5, [sp, #56]
	str	r6, [sp, #60]
	bl	uint256_init
	mov	r1, r7
	bl	lshift_uint256
	b	.L74
	.size	lshift_uint256, .-lshift_uint256
	.align	2
	.global	rshift_uint256
	.type	rshift_uint256, %function
rshift_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 272
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #276
	push	{lr}
	bl	__gnu_mcount_nc
	cmp	r1, #223
	mov	fp, r1
	mov	r9, r0
	bhi	.L106
	add	r3, r1, #64
	and	r4, r3, #255
	cmp	r4, #31
	bls	.L107
	add	r3, r1, #96
	and	r4, r3, #255
	cmp	r4, #31
	bls	.L108
	sub	r3, r1, #128
	and	r7, r3, #255
	cmp	r7, #31
	bls	.L109
	sub	r3, r1, #96
	and	r7, r3, #255
	cmp	r7, #31
	bls	.L110
	sub	r3, r1, #64
	and	r7, r3, #255
	cmp	r7, #31
	bls	.L111
	sub	r3, r1, #32
	and	r7, r3, #255
	cmp	r7, #31
	bls	.L104
	ldr	r3, [r9, #12]
	str	r3, [sp, #12]
	ldr	r3, [r9, #8]
	ldr	r2, [r9, #28]
	str	r3, [sp, #8]
	ldr	r3, [r9, #4]
	ldr	sl, [r9, #16]
	str	r3, [sp, #4]
	mov	r2, r2, lsr r1
	ldr	r3, [sp, #12]
	mov	lr, sl, lsr r1
	mov	r4, r3, lsr r1
	ldr	r3, [sp, #8]
	ldr	r0, [r0, #24]
	ldr	r8, [r9, #20]
	mov	r5, r3, lsr r1
	ldr	r3, [sp, #4]
	mov	r7, r0, lsr r1
	mov	r6, r3, lsr r1
	mov	ip, r8, lsr r1
	rsb	r3, fp, #32
	orr	r2, r2, r0, asl r3
	ldr	r0, [sp, #12]
	orr	lr, lr, r0, asl r3
	ldr	r0, [sp, #8]
	ldr	r1, [r9, #0]
	orr	r4, r4, r0, asl r3
	ldr	r0, [sp, #4]
	orr	r6, r6, r1, asl r3
	orr	r5, r5, r0, asl r3
	orr	r7, r7, r8, asl r3
	orr	ip, ip, sl, asl r3
	mov	r1, r1, lsr fp
	mov	r0, #32
	str	r2, [sp, #44]
	str	r7, [sp, #40]
	str	ip, [sp, #36]
	str	lr, [sp, #32]
	str	r4, [sp, #28]
	str	r5, [sp, #24]
	str	r6, [sp, #20]
	str	r1, [sp, #16]
	bl	malloc
	ldr	r3, [sp, #16]
	str	r3, [r0, #0]
	ldr	r2, [sp, #20]
	str	r2, [r0, #4]
	ldr	r3, [sp, #24]
	str	r3, [r0, #8]
	ldr	r2, [sp, #28]
	str	r2, [r0, #12]
	ldr	r3, [sp, #32]
	str	r3, [r0, #16]
	ldr	r2, [sp, #36]
	str	r2, [r0, #20]
	ldr	r3, [sp, #40]
	str	r3, [r0, #24]
	ldr	r2, [sp, #44]
	str	r2, [r0, #28]
	b	.L98
.L106:
	ldr	r2, [r0, #0]
	mov	r3, #0
	mov	r0, #32
	str	r3, [sp, #264]
	str	r2, [sp, #268]
	str	r3, [sp, #240]
	str	r3, [sp, #244]
	str	r3, [sp, #248]
	str	r3, [sp, #252]
	str	r3, [sp, #256]
	str	r3, [sp, #260]
	bl	malloc
	ldr	r3, [sp, #268]
	str	r3, [r0, #28]
	ldr	r2, [sp, #240]
	str	r2, [r0, #0]
	ldr	r3, [sp, #244]
	str	r3, [r0, #4]
	ldr	r2, [sp, #248]
	str	r2, [r0, #8]
	ldr	r3, [sp, #252]
	str	r3, [r0, #12]
	ldr	r2, [sp, #256]
	str	r2, [r0, #16]
	ldr	r3, [sp, #260]
	str	r3, [r0, #20]
	ldr	r2, [sp, #264]
	add	r1, fp, #32
	and	r1, r1, #255
	str	r2, [r0, #24]
	bl	rshift_uint256
.L98:
	add	sp, sp, #276
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L107:
	ldmia	r0, {r1, r2}	@ phole ldm
	mov	r3, #0
	mov	r0, #32
	str	r3, [sp, #228]
	str	r2, [sp, #232]
	str	r1, [sp, #236]
	str	r3, [sp, #208]
	str	r3, [sp, #212]
	str	r3, [sp, #216]
	str	r3, [sp, #220]
	str	r3, [sp, #224]
	bl	malloc
	ldr	r3, [sp, #236]
	str	r3, [r0, #28]
	ldr	r2, [sp, #208]
	str	r2, [r0, #0]
	ldr	r3, [sp, #212]
	str	r3, [r0, #4]
	ldr	r2, [sp, #216]
	str	r2, [r0, #8]
	ldr	r3, [sp, #220]
	str	r3, [r0, #12]
	ldr	r2, [sp, #224]
	str	r2, [r0, #16]
	ldr	r3, [sp, #228]
	str	r3, [r0, #20]
	ldr	r2, [sp, #232]
	mov	r1, r4
	str	r2, [r0, #24]
	bl	rshift_uint256
	b	.L98
.L108:
	ldr	ip, [r0, #0]
	ldmib	r0, {r1, r2}	@ phole ldm
	mov	r3, #0
	mov	r0, #32
	str	r3, [sp, #192]
	str	r2, [sp, #196]
	str	r1, [sp, #200]
	str	r3, [sp, #176]
	str	r3, [sp, #180]
	str	r3, [sp, #184]
	str	r3, [sp, #188]
	str	ip, [sp, #204]
	bl	malloc
	ldr	r3, [sp, #204]
	str	r3, [r0, #28]
	ldr	r2, [sp, #176]
	str	r2, [r0, #0]
	ldr	r3, [sp, #180]
	str	r3, [r0, #4]
	ldr	r2, [sp, #184]
	str	r2, [r0, #8]
	ldr	r3, [sp, #188]
	str	r3, [r0, #12]
	ldr	r2, [sp, #192]
	str	r2, [r0, #16]
	ldr	r3, [sp, #196]
	str	r3, [r0, #20]
	ldr	r2, [sp, #200]
	mov	r1, r4
	str	r2, [r0, #24]
	bl	rshift_uint256
	b	.L98
.L110:
	ldr	r4, [r0, #0]
	add	r1, r0, #12
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	ip, [r0, #8]
	ldr	lr, [r0, #4]
	mov	r3, #0
	add	r0, sp, #112
	str	r1, [sp, #128]
	str	r3, [sp, #120]
	str	r2, [sp, #124]
	str	ip, [sp, #132]
	str	lr, [sp, #136]
	str	r4, [sp, #140]
	str	r3, [sp, #112]
	str	r3, [sp, #116]
	bl	uint256_init
	mov	r1, r7
	bl	rshift_uint256
	b	.L98
.L109:
	ldr	lr, [r0, #0]
	add	r1, r0, #8
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	ip, [r0, #4]
	mov	r3, #0
	mov	r0, #32
	str	r3, [sp, #156]
	str	r2, [sp, #160]
	str	r1, [sp, #164]
	str	r3, [sp, #144]
	str	r3, [sp, #148]
	str	r3, [sp, #152]
	str	ip, [sp, #168]
	str	lr, [sp, #172]
	bl	malloc
	ldr	r3, [sp, #172]
	str	r3, [r0, #28]
	ldr	r2, [sp, #144]
	str	r2, [r0, #0]
	ldr	r3, [sp, #148]
	str	r3, [r0, #4]
	ldr	r2, [sp, #152]
	str	r2, [r0, #8]
	ldr	r3, [sp, #156]
	str	r3, [r0, #12]
	ldr	r2, [sp, #160]
	str	r2, [r0, #16]
	ldr	r3, [sp, #164]
	str	r3, [r0, #20]
	ldr	r2, [sp, #168]
	mov	r1, r7
	str	r2, [r0, #24]
	bl	rshift_uint256
	b	.L98
.L111:
	ldr	r5, [r0, #0]
	add	r1, r0, #16
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	ip, [r0, #12]
	ldmib	r0, {r4, lr}	@ phole ldm
	mov	r3, #0
	add	r0, sp, #80
	str	r1, [sp, #92]
	str	r3, [sp, #84]
	str	r2, [sp, #88]
	str	ip, [sp, #96]
	str	lr, [sp, #100]
	str	r4, [sp, #104]
	str	r5, [sp, #108]
	str	r3, [sp, #80]
	bl	uint256_init
	mov	r1, r7
	bl	rshift_uint256
	b	.L98
.L104:
	ldr	r6, [r0, #0]
	add	r1, r0, #20
	ldmia	r1, {r1, r2}	@ phole ldm
	ldr	ip, [r0, #16]
	add	r4, r0, #8
	ldmia	r4, {r4, lr}	@ phole ldm
	ldr	r5, [r0, #4]
	mov	r3, #0
	add	r0, sp, #48
	str	r1, [sp, #56]
	str	r3, [sp, #48]
	str	r2, [sp, #52]
	str	ip, [sp, #60]
	str	lr, [sp, #64]
	str	r4, [sp, #68]
	str	r5, [sp, #72]
	str	r6, [sp, #76]
	bl	uint256_init
	mov	r1, r7
	bl	rshift_uint256
	b	.L98
	.size	rshift_uint256, .-rshift_uint256
	.align	2
	.global	mod_uint256
	.type	mod_uint256, %function
mod_uint256:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	sub	sp, sp, #128
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, [r1, #0]
	ldr	r2, [r0, #0]
	cmp	r3, r2
	mov	r4, r0
	mov	r7, r1
	bne	.L113
	ldr	r3, [r1, #4]
	ldr	r2, [r0, #4]
	cmp	r3, r2
	bne	.L113
	ldr	r3, [r1, #8]
	ldr	r2, [r0, #8]
	cmp	r3, r2
	bne	.L113
	ldr	r3, [r1, #12]
	ldr	r2, [r0, #12]
	cmp	r3, r2
	bne	.L113
	ldr	r3, [r1, #16]
	ldr	r2, [r0, #16]
	cmp	r3, r2
	bne	.L113
	ldr	r3, [r1, #20]
	ldr	r2, [r0, #20]
	cmp	r3, r2
	bne	.L113
	ldr	r3, [r1, #24]
	ldr	r2, [r0, #24]
	cmp	r3, r2
	bne	.L113
	ldr	r2, [r1, #28]
	ldr	r3, [r0, #28]
	cmp	r2, r3
	movls	r5, #0
	movhi	r5, #1
.L115:
	cmp	r5, #0
	beq	.L154
.L116:
	mov	r0, r4
	add	sp, sp, #128
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L154:
	mov	r3, #1
	mov	r0, #32
	str	r3, [sp, #92]
	str	r5, [sp, #64]
	str	r5, [sp, #68]
	str	r5, [sp, #72]
	str	r5, [sp, #76]
	str	r5, [sp, #80]
	str	r5, [sp, #84]
	str	r5, [sp, #88]
	bl	malloc
	ldr	r3, [sp, #64]
	ldr	r2, [r7, #0]
	add	r1, sp, #68
	ldmia	r1, {r1, ip, lr}	@ phole ldm
	add	r6, sp, #80
	ldmia	r6, {r6, sl}	@ phole ldm
	ldr	r9, [sp, #88]
	ldr	r8, [sp, #92]
	cmp	r2, r3
	str	r8, [r0, #28]
	str	r3, [r0, #0]
	stmib	r0, {r1, ip, lr}	@ phole stm
	str	r6, [r0, #16]
	str	sl, [r0, #20]
	str	r9, [r0, #24]
	bne	.L117
	ldr	r3, [r7, #4]
	cmp	r3, r1
	bne	.L117
	ldr	r3, [r7, #8]
	cmp	r3, ip
	bne	.L117
	ldr	r3, [r7, #12]
	cmp	r3, lr
	bne	.L117
	ldr	r3, [r7, #16]
	cmp	r3, r6
	bne	.L117
	ldr	r3, [r7, #20]
	cmp	r3, sl
	bne	.L117
	ldr	r3, [r7, #24]
	cmp	r3, r9
	bne	.L117
	ldr	r3, [r7, #28]
	cmp	r3, r8
	bne	.L117
	mov	r0, #32
	str	r5, [sp, #60]
	str	r5, [sp, #32]
	str	r5, [sp, #36]
	str	r5, [sp, #40]
	str	r5, [sp, #44]
	str	r5, [sp, #48]
	str	r5, [sp, #52]
	str	r5, [sp, #56]
	bl	malloc
	ldr	r3, [sp, #32]
	str	r3, [r0, #0]
	ldr	r2, [sp, #36]
	str	r2, [r0, #4]
	ldr	r3, [sp, #40]
	str	r3, [r0, #8]
	ldr	r2, [sp, #44]
	str	r2, [r0, #12]
	ldr	r3, [sp, #48]
	str	r3, [r0, #16]
	ldr	r2, [sp, #52]
	str	r2, [r0, #20]
	ldr	r3, [sp, #56]
	str	r3, [r0, #24]
	ldr	r2, [sp, #60]
	mov	r4, r0
	str	r2, [r0, #28]
	b	.L116
.L117:
	mov	r0, #32
	bl	malloc
	ldr	r3, [r4, #0]
	str	r3, [r0, #0]
	ldr	r2, [r4, #4]
	str	r2, [r0, #4]
	ldr	r3, [r4, #8]
	str	r3, [r0, #8]
	ldr	r2, [r4, #12]
	str	r2, [r0, #12]
	ldr	r3, [r4, #16]
	str	r3, [r0, #16]
	ldr	r2, [r4, #20]
	str	r2, [r0, #20]
	ldr	r3, [r4, #24]
	str	r3, [r0, #24]
	ldr	r2, [r4, #28]
	mov	r5, r0
	str	r2, [r0, #28]
	mov	r0, #32
	bl	malloc
	ldr	r3, [r7, #0]
	str	r3, [r0, #0]
	ldr	r2, [r7, #4]
	str	r2, [r0, #4]
	ldr	r3, [r7, #8]
	str	r3, [r0, #8]
	ldr	r2, [r7, #12]
	str	r2, [r0, #12]
	ldr	r3, [r7, #16]
	str	r3, [r0, #16]
	ldr	r2, [r7, #20]
	str	r2, [r0, #20]
	ldr	r3, [r7, #24]
	str	r3, [r0, #24]
	ldr	r2, [r7, #28]
	mov	r1, #1
	str	r2, [r0, #28]
	mov	r6, r0
	mov	r0, r5
	bl	rshift_uint256
	ldr	r4, .L159
	mov	r8, r0
	ldmia	r4!, {r0, r1, r2, r3}
	add	ip, sp, #96
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r4, {r0, r1, r2, r3}
	stmia	ip, {r0, r1, r2, r3}
	mov	r0, #32
	bl	malloc
	ldr	r3, [sp, #96]
	str	r3, [r0, #0]
	ldr	r2, [sp, #100]
	str	r2, [r0, #4]
	ldr	r3, [sp, #104]
	str	r3, [r0, #8]
	ldr	r2, [sp, #108]
	str	r2, [r0, #12]
	ldr	r3, [sp, #112]
	str	r3, [r0, #16]
	ldr	r2, [sp, #116]
	str	r2, [r0, #20]
	ldr	r3, [sp, #120]
	str	r3, [r0, #24]
	ldr	r2, [sp, #124]
	str	r2, [r0, #28]
	mov	r4, r0
.L118:
	ldr	r1, [r6, #0]
	ldr	r2, [r8, #0]
	cmp	r1, r2
	bne	.L119
	ldr	r0, [r6, #4]
	ldr	ip, [r8, #4]
	cmp	r0, ip
	bne	.L120
	ldr	r2, [r6, #8]
	ldr	r3, [r8, #8]
	cmp	r2, r3
	bne	.L120
	ldr	r2, [r6, #12]
	ldr	r3, [r8, #12]
	cmp	r2, r3
	bne	.L120
	ldr	r2, [r6, #16]
	ldr	r3, [r8, #16]
	cmp	r2, r3
	bne	.L120
	ldr	r2, [r6, #20]
	ldr	r3, [r8, #20]
	cmp	r2, r3
	bne	.L120
	ldr	r2, [r6, #24]
	ldr	r3, [r8, #24]
	cmp	r2, r3
	bne	.L120
	ldr	r2, [r6, #28]
	ldr	r3, [r8, #28]
	cmp	r2, r3
	bne	.L120
.L124:
	mov	r0, r6
	mov	r1, #1
	bl	rshift_uint256
	mov	r4, r0
	ldr	r1, [r4, #0]
	ldr	r6, [r7, #0]
	cmp	r1, r6
	mov	r3, r1
	mov	r2, r6
	bne	.L139
.L156:
	ldr	r3, [r4, #4]
	ldr	r2, [r7, #4]
	cmp	r3, r2
	bne	.L139
	ldr	r3, [r4, #8]
	ldr	r2, [r7, #8]
	cmp	r3, r2
	bne	.L139
	ldr	r3, [r4, #12]
	ldr	r2, [r7, #12]
	cmp	r3, r2
	bne	.L139
	ldr	r3, [r4, #16]
	ldr	r2, [r7, #16]
	cmp	r3, r2
	bne	.L139
	ldr	r3, [r4, #20]
	ldr	r2, [r7, #20]
	cmp	r3, r2
	bne	.L139
	ldr	r3, [r4, #24]
	ldr	r2, [r7, #24]
	cmp	r3, r2
	bne	.L139
	ldr	r2, [r4, #28]
	ldr	r3, [r7, #28]
	cmp	r2, r3
	movls	r2, #0
	movhi	r2, #1
.L141:
	cmp	r2, #0
	bne	.L150
	b	.L153
.L155:
	ldr	r1, [r5, #28]
	ldr	r2, [r4, #28]
	rsb	r2, r2, r1
	str	r2, [sp, #28]
	ldr	r0, [r5, #24]
	ldr	r3, [r4, #24]
	rsb	r3, r3, r0
	cmp	r1, r2
	subcc	r3, r3, #1
	str	r3, [sp, #24]
	ldr	r1, [r5, #20]
	ldr	r2, [r4, #20]
	rsb	r2, r2, r1
	cmp	r0, r3
	subcc	r2, r2, #1
	str	r2, [sp, #20]
	ldr	r0, [r5, #16]
	ldr	r3, [r4, #16]
	rsb	r3, r3, r0
	cmp	r1, r2
	subcc	r3, r3, #1
	str	r3, [sp, #16]
	ldr	r1, [r5, #12]
	ldr	r2, [r4, #12]
	rsb	r2, r2, r1
	cmp	r0, r3
	subcc	r2, r2, #1
	str	r2, [sp, #12]
	ldr	r0, [r5, #8]
	ldr	r3, [r4, #8]
	rsb	r3, r3, r0
	cmp	r1, r2
	subcc	r3, r3, #1
	str	r3, [sp, #8]
	ldr	r1, [r5, #4]
	ldr	r2, [r4, #4]
	rsb	r2, r2, r1
	cmp	r0, r3
	subcc	r2, r2, #1
	str	r2, [sp, #4]
	ldr	r3, [r4, #0]
	rsb	r3, r3, ip
	cmp	r1, r2
	subcc	r3, r3, #1
	mov	r0, #32
	str	r3, [sp, #0]
	bl	malloc
	ldr	r3, [sp, #0]
	str	r3, [r0, #0]
	ldr	r2, [sp, #4]
	str	r2, [r0, #4]
	ldr	r3, [sp, #8]
	str	r3, [r0, #8]
	ldr	r2, [sp, #12]
	str	r2, [r0, #12]
	ldr	r3, [sp, #16]
	str	r3, [r0, #16]
	ldr	r2, [sp, #20]
	str	r2, [r0, #20]
	ldr	r3, [sp, #24]
	str	r3, [r0, #24]
	ldr	r2, [sp, #28]
	str	r2, [r0, #28]
	ldr	r1, [r4, #0]
	mov	r5, r0
.L150:
	ldr	ip, [r5, #0]
	cmp	ip, r1
	mov	r2, r1
	movne	r3, ip
	bne	.L134
	ldr	r3, [r5, #4]
	ldr	r2, [r4, #4]
	cmp	r3, r2
	bne	.L134
	ldr	r3, [r5, #8]
	ldr	r2, [r4, #8]
	cmp	r3, r2
	bne	.L134
	ldr	r3, [r5, #12]
	ldr	r2, [r4, #12]
	cmp	r3, r2
	bne	.L134
	ldr	r3, [r5, #16]
	ldr	r2, [r4, #16]
	cmp	r3, r2
	bne	.L134
	ldr	r3, [r5, #20]
	ldr	r2, [r4, #20]
	cmp	r3, r2
	bne	.L134
	ldr	r3, [r5, #24]
	ldr	r2, [r4, #24]
	cmp	r3, r2
	bne	.L134
	ldr	r2, [r5, #28]
	ldr	r3, [r4, #28]
	cmp	r2, r3
	movls	r2, #0
	movhi	r2, #1
.L136:
	cmp	r2, #0
	bne	.L155
	mov	r0, r4
	mov	r1, #1
	bl	rshift_uint256
	mov	r4, r0
	ldr	r1, [r4, #0]
	ldr	r6, [r7, #0]
	cmp	r1, r6
	mov	r3, r1
	mov	r2, r6
	beq	.L156
.L139:
	cmp	r3, r2
	movls	r2, #0
	movhi	r2, #1
	b	.L141
.L157:
	ldr	r1, [r5, #28]
	ldr	r2, [r7, #28]
	rsb	r2, r2, r1
	str	r2, [sp, #28]
	ldr	r0, [r5, #24]
	ldr	r3, [r7, #24]
	rsb	r3, r3, r0
	cmp	r1, r2
	subcc	r3, r3, #1
	str	r3, [sp, #24]
	ldr	r1, [r5, #20]
	ldr	r2, [r7, #20]
	rsb	r2, r2, r1
	cmp	r0, r3
	subcc	r2, r2, #1
	str	r2, [sp, #20]
	ldr	r0, [r5, #16]
	ldr	r3, [r7, #16]
	rsb	r3, r3, r0
	cmp	r1, r2
	subcc	r3, r3, #1
	str	r3, [sp, #16]
	ldr	ip, [r5, #12]
	ldr	r2, [r7, #12]
	rsb	r2, r2, ip
	cmp	r0, r3
	subcc	r2, r2, #1
	str	r2, [sp, #12]
	ldr	lr, [r5, #8]
	ldr	r1, [r7, #8]
	rsb	r1, r1, lr
	cmp	ip, r2
	subcc	r1, r1, #1
	str	r1, [sp, #8]
	ldr	r0, [r5, #4]
	ldr	r2, [r7, #4]
	rsb	r2, r2, r0
	cmp	lr, r1
	subcc	r2, r2, #1
	rsb	r3, r6, r4
	cmp	r0, r2
	subcc	r3, r3, #1
	mov	r0, #32
	str	r3, [sp, #0]
	str	r2, [sp, #4]
	bl	malloc
	ldr	r3, [sp, #0]
	str	r3, [r0, #0]
	ldr	r2, [sp, #4]
	str	r2, [r0, #4]
	ldr	r3, [sp, #8]
	str	r3, [r0, #8]
	ldr	r2, [sp, #12]
	str	r2, [r0, #12]
	ldr	r3, [sp, #16]
	str	r3, [r0, #16]
	ldr	r2, [sp, #20]
	str	r2, [r0, #20]
	ldr	r3, [sp, #24]
	str	r3, [r0, #24]
	ldr	r2, [sp, #28]
	str	r2, [r0, #28]
	ldr	r6, [r7, #0]
	mov	r5, r0
.L153:
	ldr	r4, [r5, #0]
	cmp	r4, r6
	movne	r2, r4
	movne	r0, r6
	bne	.L143
	ldr	r2, [r5, #4]
	ldr	r0, [r7, #4]
	cmp	r2, r0
	bne	.L143
	ldr	r2, [r5, #8]
	ldr	r0, [r7, #8]
	cmp	r2, r0
	bne	.L143
	ldr	r2, [r5, #12]
	ldr	r0, [r7, #12]
	cmp	r2, r0
	bne	.L143
	ldr	r2, [r5, #16]
	ldr	r0, [r7, #16]
	cmp	r2, r0
	bne	.L143
	ldr	r2, [r5, #20]
	ldr	r0, [r7, #20]
	cmp	r2, r0
	bne	.L143
	ldr	r2, [r5, #24]
	ldr	r0, [r7, #24]
	cmp	r2, r0
	bne	.L143
	ldr	r2, [r5, #28]
	ldr	r3, [r7, #28]
	cmp	r2, r3
	movls	r0, #0
	movhi	r0, #1
.L145:
	cmp	r0, #0
	bne	.L157
	cmp	r4, r6
	bne	.L148
	ldr	r2, [r5, #4]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bne	.L148
	ldr	r2, [r5, #8]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bne	.L148
	ldr	r2, [r5, #12]
	ldr	r3, [r7, #12]
	cmp	r2, r3
	bne	.L148
	ldr	r2, [r5, #16]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	bne	.L148
	ldr	r2, [r5, #20]
	ldr	r3, [r7, #20]
	cmp	r2, r3
	bne	.L148
	ldr	r2, [r5, #24]
	ldr	r3, [r7, #24]
	cmp	r2, r3
	bne	.L148
	ldr	r2, [r7, #28]
	ldr	r3, [r5, #28]
	cmp	r3, r2
	beq	.L158
.L148:
	mov	r4, r5
	b	.L116
.L134:
	cmp	r3, r2
	movls	r2, #0
	movhi	r2, #1
	b	.L136
.L143:
	cmp	r2, r0
	movls	r0, #0
	movhi	r0, #1
	b	.L145
.L113:
	cmp	r3, r2
	movls	r5, #0
	movhi	r5, #1
	b	.L115
.L158:
	bl	cast_to_uint256
	mov	r4, r0
	b	.L116
.L119:
	mov	r3, r1
.L122:
	cmp	r3, r2
	movls	r2, #0
	movhi	r2, #1
.L125:
	cmp	r2, #0
	bne	.L124
	ldr	r2, [r4, #0]
	cmp	r2, r1
	bne	.L126
	ldr	r0, [r6, #4]
	ldr	ip, [r4, #4]
	cmp	r0, ip
	bne	.L127
	ldr	r2, [r6, #8]
	ldr	r3, [r4, #8]
	cmp	r2, r3
	bne	.L127
	ldr	r2, [r6, #12]
	ldr	r3, [r4, #12]
	cmp	r2, r3
	bne	.L127
	ldr	r2, [r6, #16]
	ldr	r3, [r4, #16]
	cmp	r2, r3
	bne	.L127
	ldr	r2, [r6, #20]
	ldr	r3, [r4, #20]
	cmp	r2, r3
	bne	.L127
	ldr	r2, [r6, #24]
	ldr	r3, [r4, #24]
	cmp	r2, r3
	bne	.L127
	ldr	r2, [r6, #28]
	ldr	r3, [r4, #28]
	cmp	r2, r3
	beq	.L124
.L127:
	cmp	r0, ip
	mov	r1, r0
	mov	r2, ip
	bne	.L126
	ldr	r1, [r6, #8]
	ldr	r2, [r4, #8]
	cmp	r1, r2
	bne	.L126
	ldr	r1, [r6, #12]
	ldr	r2, [r4, #12]
	cmp	r1, r2
	bne	.L126
	ldr	r1, [r6, #16]
	ldr	r2, [r4, #16]
	cmp	r1, r2
	bne	.L126
	ldr	r1, [r6, #20]
	ldr	r2, [r4, #20]
	cmp	r1, r2
	bne	.L126
	ldr	r1, [r6, #24]
	ldr	r2, [r4, #24]
	cmp	r1, r2
	bne	.L126
	ldr	r2, [r6, #28]
	ldr	r3, [r4, #28]
	cmp	r2, r3
	movls	r2, #0
	movhi	r2, #1
.L130:
	cmp	r2, #0
	bne	.L124
	mov	r0, r6
	mov	r1, #1
	bl	lshift_uint256
	mov	r6, r0
	b	.L118
.L126:
	cmp	r1, r2
	movls	r2, #0
	movhi	r2, #1
	b	.L130
.L120:
	cmp	r0, ip
	mov	r3, r0
	mov	r2, ip
	bne	.L122
	ldr	r3, [r6, #8]
	ldr	r2, [r8, #8]
	cmp	r3, r2
	bne	.L122
	ldr	r3, [r6, #12]
	ldr	r2, [r8, #12]
	cmp	r3, r2
	bne	.L122
	ldr	r3, [r6, #16]
	ldr	r2, [r8, #16]
	cmp	r3, r2
	bne	.L122
	ldr	r3, [r6, #20]
	ldr	r2, [r8, #20]
	cmp	r3, r2
	bne	.L122
	ldr	r3, [r6, #24]
	ldr	r2, [r8, #24]
	cmp	r3, r2
	bne	.L122
	ldr	r2, [r6, #28]
	ldr	r3, [r8, #28]
	cmp	r2, r3
	movls	r2, #0
	movhi	r2, #1
	b	.L125
.L160:
	.align	2
.L159:
	.word	.LANCHOR0+256
	.size	mod_uint256, .-mod_uint256
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	C.5.1842, %object
	.size	C.5.1842, 32
C.5.1842:
	.space	32
	.type	C.7.1844, %object
	.size	C.7.1844, 32
C.7.1844:
	.space	32
	.type	C.9.1846, %object
	.size	C.9.1846, 32
C.9.1846:
	.space	32
	.type	C.11.1848, %object
	.size	C.11.1848, 32
C.11.1848:
	.space	32
	.type	C.13.1850, %object
	.size	C.13.1850, 32
C.13.1850:
	.space	32
	.type	C.15.1852, %object
	.size	C.15.1852, 32
C.15.1852:
	.space	32
	.type	C.17.1854, %object
	.size	C.17.1854, 32
C.17.1854:
	.space	32
	.type	C.19.1856, %object
	.size	C.19.1856, 32
C.19.1856:
	.space	32
	.type	C.32.2074, %object
	.size	C.32.2074, 32
C.32.2074:
	.word	2147483647
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%s\000"
	.space	1
.LC1:
	.ascii	"%08x \000"
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
