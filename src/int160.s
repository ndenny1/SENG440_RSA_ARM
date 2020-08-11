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
	.file	"int160.c"
	.text
	.align	2
	.global	add_modifying
	.type	add_modifying, %function
add_modifying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7}
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r4, [r1, #16]
	ldr	ip, [r0, #16]
	add	r2, r4, ip
	str	r2, [r0, #16]
	ldr	r6, [r0, #12]
	ldr	r5, [r1, #12]
	cmp	r4, r2
	cmpls	ip, r2
	movls	ip, #0
	movhi	ip, #1
	add	r3, r5, r6
	add	r3, r3, ip
	str	r3, [r0, #12]
	ldr	r7, [r0, #8]
	ldr	ip, [r1, #8]
	cmp	r3, r5
	cmpcs	r3, r6
	movcs	r3, #0
	movcc	r3, #1
	add	r2, ip, r7
	add	r2, r2, r3
	str	r2, [r0, #8]
	ldr	r5, [r0, #4]
	ldr	r4, [r1, #4]
	cmp	r2, ip
	cmpcs	r2, r7
	movcs	r2, #0
	movcc	r2, #1
	add	r3, r4, r5
	add	r3, r3, r2
	str	r3, [r0, #4]
	ldr	r2, [r1, #0]
	ldr	r1, [r0, #0]
	cmp	r3, r4
	cmpcs	r3, r5
	movcs	r3, #0
	movcc	r3, #1
	add	r2, r2, r1
	add	r2, r2, r3
	str	r2, [r0, #0]
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
	.size	add_modifying, .-add_modifying
	.align	2
	.global	sub_modifying
	.type	sub_modifying, %function
sub_modifying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r2, [r1, #16]
	ldr	ip, [r0, #16]
	rsb	r2, r2, ip
	str	r2, [r0, #16]
	ldr	r4, [r0, #12]
	ldr	r3, [r1, #12]
	rsb	r3, r3, r4
	cmp	ip, r2
	subcc	r3, r3, #1
	str	r3, [r0, #12]
	ldr	r5, [r0, #8]
	ldr	r2, [r1, #8]
	rsb	r2, r2, r5
	cmp	r3, r4
	subhi	r2, r2, #1
	str	r2, [r0, #8]
	ldr	r4, [r0, #4]
	ldr	ip, [r1, #4]
	rsb	ip, ip, r4
	cmp	r2, r5
	subhi	ip, ip, #1
	str	ip, [r0, #4]
	ldr	r3, [r0, #0]
	ldr	r2, [r1, #0]
	rsb	r3, r2, r3
	cmp	ip, r4
	subhi	r3, r3, #1
	str	r3, [r0, #0]
	ldmfd	sp!, {r4, r5}
	bx	lr
	.size	sub_modifying, .-sub_modifying
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
	.global	rshift_modifying
	.type	rshift_modifying, %function
rshift_modifying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	push	{lr}
	bl	__gnu_mcount_nc
	cmp	r1, #159
	mov	r4, r1
	mov	r8, r0
	bhi	.L8
	mov	ip, #0
	ldr	sl, [r0, #0]
	mov	r5, ip
	b	.L9
.L19:
	str	ip, [r8, #12]
	str	ip, [r8, #8]
	stmia	r8, {r5, ip}	@ phole stm
	str	sl, [r8, #16]
	mov	sl, ip
.L13:
	cmp	r0, #159
	bhi	.L8
.L10:
	mov	r4, r0
.L9:
	sub	r3, r4, #128
	and	r0, r3, #255
	cmp	r0, #31
	sub	r2, r4, #96
	bls	.L19
	and	r0, r2, #255
	cmp	r0, #31
	sub	r3, r4, #64
	bhi	.L14
	ldr	r3, [r8, #4]
	cmp	r0, #159
	str	sl, [r8, #12]
	str	r3, [r8, #16]
	str	ip, [r8, #8]
	stmia	r8, {r5, ip}	@ phole stm
	mov	sl, ip
	bls	.L10
.L8:
	mov	r3, #0
	str	r3, [r8, #16]
	str	r3, [r8, #0]
	str	r3, [r8, #4]
	str	r3, [r8, #8]
	str	r3, [r8, #12]
.L17:
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L14:
	and	r0, r3, #255
	cmp	r0, #31
	sub	r2, r4, #32
	bhi	.L15
	ldmib	r8, {r2, r3}	@ phole ldm
	str	sl, [r8, #8]
	str	r3, [r8, #16]
	str	r2, [r8, #12]
	stmia	r8, {r5, ip}	@ phole stm
	mov	sl, ip
	b	.L13
.L15:
	and	r0, r2, #255
	cmp	r0, #31
	bhi	.L16
	ldmib	r8, {r1, r2, r3}	@ phole ldm
	str	r3, [r8, #16]
	str	sl, [r8, #4]
	str	r2, [r8, #12]
	str	r1, [r8, #8]
	str	ip, [r8, #0]
	mov	sl, #0
	b	.L13
.L16:
	ldr	r5, [r8, #12]
	ldr	r6, [r8, #8]
	ldr	r7, [r8, #4]
	ldr	r2, [r8, #16]
	mov	ip, r5, lsr r4
	mov	r2, r2, lsr r4
	mov	r1, r6, lsr r4
	mov	r0, r7, lsr r4
	rsb	r3, r4, #32
	orr	r0, r0, sl, asl r3
	mov	r4, sl, lsr r4
	orr	r2, r2, r5, asl r3
	orr	ip, ip, r6, asl r3
	orr	r1, r1, r7, asl r3
	str	r4, [r8, #0]
	str	r2, [r8, #16]
	stmib	r8, {r0, r1, ip}	@ phole stm
	b	.L17
	.size	rshift_modifying, .-rshift_modifying
	.align	2
	.global	lshift_modifying
	.type	lshift_modifying, %function
lshift_modifying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7}
	push	{lr}
	bl	__gnu_mcount_nc
	cmp	r1, #159
	mov	r6, r1
	mov	r5, r0
	bhi	.L21
	mov	ip, #0
	ldr	r4, [r0, #16]
	mov	r7, ip
	b	.L22
.L31:
	str	ip, [r5, #4]
	str	ip, [r5, #8]
	str	ip, [r5, #12]
	str	r7, [r5, #16]
	str	r4, [r5, #0]
	mov	r4, ip
.L26:
	cmp	r0, #159
	bhi	.L21
.L23:
	mov	r6, r0
.L22:
	sub	r3, r6, #128
	and	r0, r3, #255
	cmp	r0, #31
	sub	r2, r6, #96
	bls	.L31
	and	r0, r2, #255
	cmp	r0, #31
	sub	r3, r6, #64
	bhi	.L27
	ldr	r3, [r5, #12]
	cmp	r0, #159
	stmia	r5, {r3, r4, ip}	@ phole stm
	str	ip, [r5, #12]
	str	r7, [r5, #16]
	mov	r4, ip
	bls	.L23
.L21:
	mov	r3, #0
	str	r3, [r5, #16]
	str	r3, [r5, #0]
	str	r3, [r5, #4]
	str	r3, [r5, #8]
	str	r3, [r5, #12]
.L30:
	ldmfd	sp!, {r4, r5, r6, r7}
	bx	lr
.L27:
	and	r0, r3, #255
	cmp	r0, #31
	sub	r2, r6, #32
	bhi	.L28
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	str	r4, [r5, #8]
	str	r3, [r5, #0]
	str	r2, [r5, #4]
	str	ip, [r5, #12]
	str	r7, [r5, #16]
	mov	r4, ip
	b	.L26
.L28:
	and	r0, r2, #255
	cmp	r0, #31
	bhi	.L29
	ldr	r3, [r5, #4]
	ldr	r2, [r5, #8]
	ldr	r1, [r5, #12]
	str	r3, [r5, #0]
	str	r4, [r5, #12]
	str	r2, [r5, #4]
	str	r1, [r5, #8]
	str	ip, [r5, #16]
	mov	r4, #0
	b	.L26
.L29:
	ldr	ip, [r5, #12]
	mov	r4, r4, asl r6
	mov	ip, ip, asl r6
	ldr	r0, [r5, #8]
	rsb	r1, r6, #32
	orr	ip, ip, r4, lsr r1
	mov	r0, r0, asl r6
	ldr	r2, [r5, #4]
	orr	r0, r0, ip, lsr r1
	mov	r2, r2, asl r6
	ldr	r3, [r5, #0]
	orr	r2, r2, r0, lsr r1
	mov	r3, r3, asl r6
	orr	r3, r3, r2, lsr r1
	str	r4, [r5, #16]
	str	r3, [r5, #0]
	str	ip, [r5, #12]
	str	r0, [r5, #8]
	str	r2, [r5, #4]
	b	.L30
	.size	lshift_modifying, .-lshift_modifying
	.align	2
	.global	uint160_equal_to_zero
	.type	uint160_equal_to_zero, %function
uint160_equal_to_zero:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L33
	ldr	r3, [r0, #12]
	cmp	r3, #0
	bne	.L33
	ldr	r3, [r0, #8]
	cmp	r3, #0
	bne	.L33
	ldr	r3, [r0, #4]
	cmp	r3, #0
	bne	.L33
	ldr	r3, [r0, #0]
	rsbs	r0, r3, #1
	movcc	r0, #0
	bx	lr
.L33:
	mov	r0, #0
	bx	lr
	.size	uint160_equal_to_zero, .-uint160_equal_to_zero
	.align	2
	.global	gte_uint160
	.type	gte_uint160, %function
gte_uint160:
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
	bne	.L37
	ldr	r0, [ip, #4]
	ldr	r4, [r1, #4]
	cmp	r0, r4
	bne	.L38
	ldr	r2, [ip, #8]
	ldr	r3, [r1, #8]
	cmp	r2, r3
	bne	.L38
	ldr	r2, [ip, #12]
	ldr	r3, [r1, #12]
	cmp	r2, r3
	bne	.L38
	ldr	r2, [ip, #16]
	ldr	r3, [r1, #16]
	cmp	r2, r3
	moveq	r0, #1
	bne	.L38
.L41:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L37:
	cmp	r2, r0
	movls	r0, #0
	movhi	r0, #1
	b	.L41
.L38:
	mov	r2, r0
	cmp	r2, r4
	mov	r0, r4
	bne	.L37
	ldr	r2, [ip, #8]
	ldr	r0, [r1, #8]
	cmp	r2, r0
	bne	.L37
	ldr	r2, [ip, #12]
	ldr	r0, [r1, #12]
	cmp	r2, r0
	bne	.L37
	ldr	r2, [ip, #16]
	ldr	r3, [r1, #16]
	cmp	r2, r3
	movls	r0, #0
	movhi	r0, #1
	b	.L41
	.size	gte_uint160, .-gte_uint160
	.align	2
	.global	gt_uint160
	.type	gt_uint160, %function
gt_uint160:
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
	bne	.L45
	ldr	r2, [r3, #4]
	ldr	r0, [r1, #4]
	cmp	r2, r0
	bne	.L45
	ldr	r2, [r3, #8]
	ldr	r0, [r1, #8]
	cmp	r2, r0
	bne	.L45
	ldr	r2, [r3, #12]
	ldr	r0, [r1, #12]
	cmp	r2, r0
	bne	.L45
	ldr	r2, [r3, #16]
	ldr	r3, [r1, #16]
	cmp	r2, r3
	movls	r0, #0
	movhi	r0, #1
	bx	lr
.L45:
	cmp	r2, r0
	movls	r0, #0
	movhi	r0, #1
	bx	lr
	.size	gt_uint160, .-gt_uint160
	.align	2
	.global	equal_uint160
	.type	equal_uint160, %function
equal_uint160:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r2, [r0, #0]
	ldr	r3, [r1, #0]
	cmp	r2, r3
	bne	.L50
	ldr	r2, [r0, #4]
	ldr	r3, [r1, #4]
	cmp	r2, r3
	bne	.L50
	ldr	r2, [r0, #8]
	ldr	r3, [r1, #8]
	cmp	r2, r3
	bne	.L50
	ldr	r2, [r0, #12]
	ldr	r3, [r1, #12]
	cmp	r2, r3
	bne	.L50
	ldr	r2, [r0, #16]
	ldr	r3, [r1, #16]
	cmp	r2, r3
	movne	r0, #0
	moveq	r0, #1
	bx	lr
.L50:
	mov	r0, #0
	bx	lr
	.size	equal_uint160, .-equal_uint160
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
	sub	r2, r1, #128
	and	r3, r2, #255
	cmp	r3, #31
	ldrls	r3, [r0, #0]
	movls	r3, r3, lsr r2
	mov	ip, r0
	andls	r0, r3, #1
	bxls	lr
	sub	r0, r1, #96
	and	r3, r0, #255
	cmp	r3, #31
	ldrls	r3, [ip, #4]
	movls	r3, r3, lsr r0
	andls	r0, r3, #1
	bxls	lr
	sub	r0, r1, #64
	and	r3, r0, #255
	cmp	r3, #31
	ldrls	r3, [ip, #8]
	movls	r3, r3, lsr r0
	andls	r0, r3, #1
	bxls	lr
	sub	r0, r1, #32
	and	r3, r0, #255
	cmp	r3, #31
	ldrls	r3, [ip, #12]
	ldrhi	r3, [ip, #16]
	movls	r3, r3, lsr r0
	movhi	r3, r3, lsr r1
	andls	r0, r3, #1
	andhi	r0, r3, #1
	bx	lr
	.size	get_bit, .-get_bit
	.align	2
	.global	print_uint160
	.type	print_uint160, %function
print_uint160:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r4, .L62
	mov	r5, r1
	mov	r1, r0
	ldr	r0, .L62+4
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
	mov	r0, r4
	ldr	r1, [r5, #16]
	bl	printf
	mov	r0, #10
	bl	putchar
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	.LC1
	.word	.LC0
	.size	print_uint160, .-print_uint160
	.align	2
	.global	uint160_init
	.type	uint160_init, %function
uint160_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r4, r0
	mov	r0, #20
	bl	malloc
	ldr	r2, [r4, #16]
	ldmia	r4, {r1, ip}	@ phole ldm
	add	r5, r4, #8
	ldmia	r5, {r5, r6}	@ phole ldm
	str	r2, [r0, #16]
	stmia	r0, {r1, ip}	@ phole stm
	str	r5, [r0, #8]
	str	r6, [r0, #12]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
	.size	uint160_init, .-uint160_init
	.align	2
	.global	lt_uint160
	.type	lt_uint160, %function
lt_uint160:
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
	bne	.L67
	ldr	r0, [ip, #4]
	ldr	r4, [r1, #4]
	cmp	r0, r4
	bne	.L68
	ldr	r2, [ip, #8]
	ldr	r3, [r1, #8]
	cmp	r2, r3
	bne	.L68
	ldr	r2, [ip, #12]
	ldr	r3, [r1, #12]
	cmp	r2, r3
	bne	.L68
	ldr	r2, [ip, #16]
	ldr	r3, [r1, #16]
	cmp	r2, r3
	moveq	r0, #0
	bne	.L68
.L71:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L67:
	cmp	r2, r0
	movhi	r0, #0
	movls	r0, #1
	b	.L71
.L68:
	mov	r2, r0
	cmp	r2, r4
	mov	r0, r4
	bne	.L67
	ldr	r2, [ip, #8]
	ldr	r0, [r1, #8]
	cmp	r2, r0
	bne	.L67
	ldr	r2, [ip, #12]
	ldr	r0, [r1, #12]
	cmp	r2, r0
	bne	.L67
	ldr	r2, [ip, #16]
	ldr	r3, [r1, #16]
	cmp	r2, r3
	movhi	r0, #0
	movls	r0, #1
	b	.L71
	.size	lt_uint160, .-lt_uint160
	.align	2
	.global	xor_uint160
	.type	xor_uint160, %function
xor_uint160:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #28
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	sl, [r0, #0]
	ldmib	r0, {r7, r8}	@ phole ldm
	ldr	r6, [r0, #12]
	ldr	r3, [r0, #16]
	ldmia	r1, {r5, lr}	@ phole ldm
	ldr	ip, [r1, #8]
	add	r2, r1, #12
	ldmia	r2, {r2, r4}	@ phole ldm
	eor	r2, r2, r6
	eor	r4, r4, r3
	eor	lr, lr, r7
	eor	ip, ip, r8
	eor	r5, r5, sl
	mov	r0, #20
	str	r2, [sp, #16]
	stmib	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #12]
	str	r4, [sp, #20]
	bl	malloc
	str	r4, [r0, #16]
	ldr	r3, [sp, #4]
	str	r3, [r0, #0]
	ldr	r2, [sp, #8]
	str	r2, [r0, #4]
	ldr	r3, [sp, #12]
	str	r3, [r0, #8]
	ldr	r2, [sp, #16]
	str	r2, [r0, #12]
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
	.size	xor_uint160, .-xor_uint160
	.align	2
	.global	or_uint160
	.type	or_uint160, %function
or_uint160:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #28
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	sl, [r0, #0]
	ldmib	r0, {r7, r8}	@ phole ldm
	ldr	r6, [r0, #12]
	ldr	r3, [r0, #16]
	ldmia	r1, {r5, lr}	@ phole ldm
	ldr	ip, [r1, #8]
	add	r2, r1, #12
	ldmia	r2, {r2, r4}	@ phole ldm
	orr	r2, r2, r6
	orr	r4, r4, r3
	orr	lr, lr, r7
	orr	ip, ip, r8
	orr	r5, r5, sl
	mov	r0, #20
	str	r2, [sp, #16]
	stmib	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #12]
	str	r4, [sp, #20]
	bl	malloc
	str	r4, [r0, #16]
	ldr	r3, [sp, #4]
	str	r3, [r0, #0]
	ldr	r2, [sp, #8]
	str	r2, [r0, #4]
	ldr	r3, [sp, #12]
	str	r3, [r0, #8]
	ldr	r2, [sp, #16]
	str	r2, [r0, #12]
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
	.size	or_uint160, .-or_uint160
	.align	2
	.global	and_uint160
	.type	and_uint160, %function
and_uint160:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #28
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	sl, [r0, #0]
	ldmib	r0, {r7, r8}	@ phole ldm
	ldr	r6, [r0, #12]
	ldr	r3, [r0, #16]
	ldmia	r1, {r5, lr}	@ phole ldm
	ldr	ip, [r1, #8]
	add	r2, r1, #12
	ldmia	r2, {r2, r4}	@ phole ldm
	and	r2, r2, r6
	and	r4, r4, r3
	and	lr, lr, r7
	and	ip, ip, r8
	and	r5, r5, sl
	mov	r0, #20
	str	r2, [sp, #16]
	stmib	sp, {r5, lr}	@ phole stm
	str	ip, [sp, #12]
	str	r4, [sp, #20]
	bl	malloc
	str	r4, [r0, #16]
	ldr	r3, [sp, #4]
	str	r3, [r0, #0]
	ldr	r2, [sp, #8]
	str	r2, [r0, #4]
	ldr	r3, [sp, #12]
	str	r3, [r0, #8]
	ldr	r2, [sp, #16]
	str	r2, [r0, #12]
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
	.size	and_uint160, .-and_uint160
	.align	2
	.global	sub_uint160
	.type	sub_uint160, %function
sub_uint160:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	sub	sp, sp, #28
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r4, [r0, #16]
	ldr	r7, [r0, #12]
	add	ip, r1, #12
	ldmia	ip, {ip, lr}	@ phole ldm
	ldr	r6, [r0, #8]
	ldr	r2, [r1, #8]
	ldr	r5, [r0, #4]
	rsb	lr, lr, r4
	ldr	r3, [r1, #4]
	rsb	ip, ip, r7
	cmp	r4, lr
	subcc	ip, ip, #1
	rsb	r2, r2, r6
	ldr	r4, [r0, #0]
	ldr	r0, [r1, #0]
	cmp	ip, r7
	subhi	r2, r2, #1
	rsb	r3, r3, r5
	cmp	r2, r6
	subhi	r3, r3, #1
	rsb	r4, r0, r4
	cmp	r3, r5
	subhi	r4, r4, #1
	mov	r0, #20
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	str	lr, [sp, #20]
	str	ip, [sp, #16]
	str	r4, [sp, #4]
	bl	malloc
	ldr	r3, [sp, #20]
	str	r4, [r0, #0]
	str	r3, [r0, #16]
	ldr	r3, [sp, #8]
	str	r3, [r0, #4]
	ldr	r2, [sp, #12]
	str	r2, [r0, #8]
	ldr	r3, [sp, #16]
	str	r3, [r0, #12]
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
	.size	sub_uint160, .-sub_uint160
	.align	2
	.global	add_uint160
	.type	add_uint160, %function
add_uint160:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #28
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, [r0, #16]
	ldr	r2, [r1, #16]
	ldr	lr, [r0, #12]
	ldr	r4, [r1, #12]
	add	r7, r2, r3
	cmp	r2, r7
	cmpls	r3, r7
	movls	r3, #0
	movhi	r3, #1
	add	r6, r4, lr
	ldr	r5, [r0, #8]
	ldr	r8, [r1, #8]
	add	r6, r6, r3
	cmp	r6, r4
	cmpcs	r6, lr
	movcs	lr, #0
	movcc	lr, #1
	add	r2, r8, r5
	ldr	ip, [r0, #4]
	ldr	sl, [r1, #4]
	add	r2, r2, lr
	cmp	r2, r8
	cmpcs	r2, r5
	movcs	r5, #0
	movcc	r5, #1
	add	r3, sl, ip
	ldr	r4, [r1, #0]
	add	r3, r3, r5
	ldr	r1, [r0, #0]
	cmp	r3, sl
	cmpcs	r3, ip
	movcs	ip, #0
	movcc	ip, #1
	add	r4, r4, r1
	add	r4, r4, ip
	mov	r0, #20
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	str	r7, [sp, #20]
	str	r6, [sp, #16]
	str	r4, [sp, #4]
	bl	malloc
	ldr	r3, [sp, #20]
	str	r4, [r0, #0]
	str	r3, [r0, #16]
	ldr	r3, [sp, #8]
	str	r3, [r0, #4]
	ldr	r2, [sp, #12]
	str	r2, [r0, #8]
	ldr	r3, [sp, #16]
	str	r3, [r0, #12]
	add	sp, sp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
	.size	add_uint160, .-add_uint160
	.align	2
	.global	cast_to_uint160
	.type	cast_to_uint160, %function
cast_to_uint160:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	sub	sp, sp, #24
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r3, #0
	mov	r4, r0
	mov	r0, #20
	str	r3, [sp, #16]
	str	r3, [sp, #4]
	str	r3, [sp, #8]
	str	r3, [sp, #12]
	str	r4, [sp, #20]
	bl	malloc
	str	r4, [r0, #16]
	ldr	r3, [sp, #4]
	str	r3, [r0, #0]
	ldr	r2, [sp, #8]
	str	r2, [r0, #4]
	ldr	r3, [sp, #12]
	str	r3, [r0, #8]
	ldr	r2, [sp, #16]
	str	r2, [r0, #12]
	add	sp, sp, #24
	ldmfd	sp!, {r4, lr}
	bx	lr
	.size	cast_to_uint160, .-cast_to_uint160
	.align	2
	.global	mul_uint160
	.type	mul_uint160, %function
mul_uint160:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 448
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #452
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	lr, .L88
	mov	r4, lr
	str	r0, [sp, #96]
	str	r1, [sp, #92]
	ldmia	r4!, {r0, r1, r2, r3}
	add	ip, sp, #428
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [r4, #0]
	mov	r0, #20
	str	r3, [ip, #0]
	bl	malloc
	ldr	r2, [sp, #92]
	str	r0, [sp, #88]
	ldr	r0, [sp, #96]
	mov	r4, #65536
	ldr	r1, [r0, #16]
	ldr	r0, [r2, #16]
	sub	r4, r4, #1
	mov	ip, r0, lsr #16
	and	r5, r1, r4
	mul	r2, r5, ip
	and	r0, r0, r4
	mov	r1, r1, lsr #16
	mul	r7, r1, ip
	mul	r3, r1, r0
	mul	r6, r5, r0
	mov	r1, r2, lsr #16
	and	r2, r2, r4
	and	r0, r7, r4
	add	r1, r1, r3, lsr #16
	add	r2, r2, r6, lsr #16
	and	r3, r3, r4
	add	r2, r2, r3
	add	r1, r1, r0
	add	r1, r1, r2, lsr #16
	mov	r3, r1, lsr #16
	add	r3, r3, r7, lsr #16
	ldr	r5, [sp, #88]
	orr	r1, r1, r3, asl #16
	ldr	r3, [sp, #428]
	and	r6, r6, r4
	str	r3, [r5, #0]
	orr	r6, r6, r2, asl #16
	ldr	r2, [sp, #432]
	str	r2, [r5, #4]
	ldr	r3, [sp, #436]
	str	r3, [r5, #8]
	ldr	r2, [sp, #440]
	str	r2, [r5, #12]
	ldr	r3, [sp, #444]
	mov	r7, #0
	str	r3, [r5, #16]
	mov	r0, #20
	str	r1, [sp, #420]
	str	r7, [sp, #408]
	str	r7, [sp, #412]
	str	r7, [sp, #416]
	str	r6, [sp, #424]
	bl	malloc
	ldr	sl, [sp, #96]
	ldr	ip, [sp, #92]
	ldr	r3, [sl, #12]
	ldr	r1, [ip, #16]
	and	r5, r3, r4
	mov	ip, r1, lsr #16
	mov	r3, r3, lsr #16
	and	r1, r1, r4
	mul	r2, r5, ip
	str	r0, [sp, #84]
	mul	r7, r3, ip
	mul	r0, r3, r1
	mul	r9, r5, r1
	mov	ip, r2, lsr #16
	and	r2, r2, r4
	and	r3, r7, r4
	add	ip, ip, r0, lsr #16
	add	r2, r2, r9, lsr #16
	and	r0, r0, r4
	add	r2, r2, r0
	add	ip, ip, r3
	add	ip, ip, r2, lsr #16
	mov	r3, ip, lsr #16
	add	r3, r3, r7, lsr #16
	ldr	lr, [sp, #84]
	orr	ip, ip, r3, asl #16
	ldr	r3, [sp, #408]
	and	r9, r9, r4
	str	r3, [lr, #0]
	orr	r9, r9, r2, asl #16
	ldr	r2, [sp, #412]
	str	r2, [lr, #4]
	ldr	r3, [sp, #416]
	str	r3, [lr, #8]
	ldr	r2, [sp, #420]
	mov	r1, #0
	str	r2, [lr, #12]
	str	r6, [lr, #16]
	mov	r0, #20
	str	ip, [sp, #400]
	str	r1, [sp, #388]
	str	r1, [sp, #392]
	str	r1, [sp, #396]
	str	r9, [sp, #404]
	bl	malloc
	ldr	r5, [sp, #92]
	ldr	r3, [sl, #16]
	ldr	r2, [r5, #12]
	and	ip, r3, r4
	str	r0, [sp, #80]
	mov	r3, r3, lsr #16
	mov	r0, r2, lsr #16
	and	r2, r2, r4
	mul	r8, r3, r0
	mul	lr, ip, r2
	mul	r6, r3, r2
	ldr	r3, [sl, #8]
	ldr	r2, [r5, #16]
	and	r7, r3, r4
	mul	r1, ip, r0
	mov	r3, r3, lsr #16
	mov	r0, r2, lsr #16
	mul	r5, r7, r0
	mul	r0, r3, r0
	and	r2, r2, r4
	str	r0, [sp, #108]
	mul	sl, r7, r2
	mul	r0, r3, r2
	mov	ip, r1, lsr #16
	and	r1, r1, r4
	and	r3, r8, r4
	add	ip, ip, r6, lsr #16
	add	r1, r1, lr, lsr #16
	and	r6, r6, r4
	add	r1, r1, r6
	add	ip, ip, r3
	add	ip, ip, r1, lsr #16
	and	r2, lr, r4
	orr	r2, r2, r1, asl #16
	mov	r3, ip, lsr #16
	ldr	r1, [sp, #400]
	add	fp, r9, r2
	add	r3, r3, r8, lsr #16
	orr	ip, ip, r3, asl #16
	cmp	r2, fp
	cmpls	r9, fp
	add	r3, ip, r1
	movls	r9, #0
	movhi	r9, #1
	add	lr, r3, r9
	ldr	r3, [sp, #88]
	ldr	r7, [sp, #88]
	ldr	r3, [r3, #4]
	ldr	r8, [sp, #396]
	ldr	r6, [r7, #8]
	str	r3, [sp, #64]
	ldr	r3, [sp, #108]
	str	r2, [sp, #12]
	cmp	ip, lr
	cmpls	r1, lr
	mov	r2, r5, lsr #16
	and	r5, r5, r4
	movls	r1, #0
	movhi	r1, #1
	add	r9, r6, r8
	and	r3, r3, r4
	add	r2, r2, r0, lsr #16
	add	r5, r5, sl, lsr #16
	and	r0, r0, r4
	ldr	r7, [sp, #392]
	add	r9, r9, r1
	add	r5, r5, r0
	add	r2, r2, r3
	ldr	r0, [sp, #64]
	ldr	r3, [sp, #88]
	cmp	r6, r9
	cmpls	r8, r9
	ldr	r1, [r3, #0]
	movls	r8, #0
	movhi	r8, #1
	ldr	r3, [sp, #64]
	add	r6, r0, r7
	add	r6, r6, r8
	cmp	r3, r6
	cmpls	r7, r6
	ldr	r3, [sp, #388]
	add	r2, r2, r5, lsr #16
	add	r1, r1, r3
	ldr	r3, [sp, #108]
	movls	r7, #0
	movhi	r7, #1
	mov	r0, r2, lsr #16
	and	sl, sl, r4
	add	r0, r0, r3, lsr #16
	add	r1, r1, r7
	orr	sl, sl, r5, asl #16
	ldr	r7, [sp, #88]
	ldr	r5, [sp, #80]
	orr	r2, r2, r0, asl #16
	str	r1, [r5, #0]
	str	r2, [sp, #380]
	str	ip, [r7, #12]
	ldr	ip, [sp, #12]
	mov	r0, #20
	str	ip, [r7, #16]
	str	lr, [r5, #12]
	mov	lr, #0
	str	fp, [r5, #16]
	stmib	r5, {r6, r9}	@ phole stm
	str	lr, [sp, #368]
	str	lr, [sp, #372]
	str	lr, [sp, #376]
	str	sl, [sp, #384]
	bl	malloc
	ldr	r1, [sp, #92]
	str	r0, [sp, #76]
	ldr	r0, [sp, #96]
	ldr	r2, [r1, #12]
	ldr	r3, [r0, #12]
	mov	r5, r2, lsr #16
	and	r8, r3, r4
	mov	r3, r3, lsr #16
	mul	ip, r8, r5
	mul	r5, r3, r5
	ldr	r6, [sp, #92]
	ldr	r1, [r0, #16]
	ldr	r0, [r6, #8]
	and	r2, r2, r4
	mul	r6, r8, r2
	mov	r7, r0, lsr #16
	and	r8, r1, r4
	mov	r1, r1, lsr #16
	str	r5, [sp, #112]
	mul	r5, r8, r7
	mul	r7, r1, r7
	and	r0, r0, r4
	mul	lr, r1, r0
	str	r7, [sp, #116]
	mul	fp, r8, r0
	add	r0, sp, #92
	ldmia	r0, {r0, r7}	@ phole ldm
	mul	r9, r3, r2
	ldr	r3, [r7, #4]
	ldr	r2, [r0, #16]
	and	r0, r3, r4
	mov	r1, r2, lsr #16
	mov	r3, r3, lsr #16
	mul	r7, r0, r1
	and	r2, r2, r4
	mul	r1, r3, r1
	mul	r3, r2, r3
	mul	r2, r0, r2
	ldr	r0, [sp, #112]
	str	r1, [sp, #132]
	mov	r1, ip, lsr #16
	and	ip, ip, r4
	str	r3, [sp, #128]
	add	r1, r1, r9, lsr #16
	and	r3, r0, r4
	and	r9, r9, r4
	add	ip, ip, r6, lsr #16
	str	r7, [sp, #124]
	add	ip, ip, r9
	add	r1, r1, r3
	mov	r7, r5, lsr #16
	and	r5, r5, r4
	and	r3, lr, r4
	add	r1, r1, ip, lsr #16
	add	r5, r5, fp, lsr #16
	add	r5, r5, r3
	add	r7, r7, lr, lsr #16
	mov	r3, r1, lsr #16
	ldr	lr, [sp, #116]
	add	r3, r3, r0, lsr #16
	orr	r1, r1, r3, asl #16
	str	r2, [sp, #120]
	ldr	r3, [sp, #88]
	and	r2, lr, r4
	and	r6, r6, r4
	orr	r6, r6, ip, asl #16
	add	r7, r7, r2
	adds	sl, sl, r6
	ldr	ip, [sp, #380]
	add	r7, r7, r5, lsr #16
	and	r8, fp, r4
	ldr	r3, [r3, #8]
	orr	r8, r8, r5, asl #16
	movcc	r0, #0
	movcs	r0, #1
	mov	r2, r7, lsr #16
	cmp	r6, sl
	orrhi	r0, r0, #1
	str	r3, [sp, #56]
	add	r6, r8, sl
	add	r2, r2, lr, lsr #16
	add	r3, r1, ip
	add	r3, r3, r0
	orr	r7, r7, r2, asl #16
	cmp	r8, r6
	cmpls	sl, r6
	add	r2, r7, r3
	ldr	lr, [sp, #88]
	movls	sl, #0
	movhi	sl, #1
	add	sl, r2, sl
	cmp	r1, r3
	cmpls	ip, r3
	ldr	r5, [sp, #376]
	ldr	r0, [sp, #56]
	movls	ip, #0
	movhi	ip, #1
	ldr	lr, [lr, #4]
	cmp	r7, sl
	cmpls	r3, sl
	ldr	r2, [sp, #124]
	movls	r3, #0
	movhi	r3, #1
	ldr	r9, [sp, #372]
	str	r8, [sp, #16]
	str	r6, [sp, #52]
	str	lr, [sp, #60]
	add	r1, r0, r5
	str	r3, [sp, #4]
	ldr	r3, [sp, #56]
	ldr	lr, [sp, #120]
	add	r1, r1, ip
	and	r0, r2, r4
	cmp	r3, r1
	cmpls	r5, r1
	ldr	r6, [sp, #128]
	add	fp, r0, lr, lsr #16
	ldr	r3, [sp, #60]
	ldr	r0, [sp, #88]
	mov	ip, r2, lsr #16
	ldr	lr, [sp, #56]
	add	r2, r3, r9
	add	ip, ip, r6, lsr #16
	ldr	r3, [sp, #132]
	ldr	r6, [r0, #0]
	ldr	r0, [sp, #128]
	movls	r5, #0
	movhi	r5, #1
	add	r2, r2, r5
	add	r8, lr, r1
	ldr	r5, [sp, #4]
	and	lr, r0, r4
	and	r0, r3, r4
	add	ip, ip, r0
	ldr	r0, [sp, #56]
	add	r8, r8, r5
	ldr	r3, [sp, #60]
	cmp	r0, r8
	cmpls	r1, r8
	movls	r1, #0
	movhi	r1, #1
	cmp	r3, r2
	cmpls	r9, r2
	ldr	r3, [sp, #368]
	ldr	r0, [sp, #60]
	movls	r9, #0
	movhi	r9, #1
	add	r3, r6, r3
	add	lr, fp, lr
	add	r3, r3, r9
	add	ip, ip, lr, lsr #16
	add	r5, r0, r2
	add	r6, r6, r3
	ldr	r3, [sp, #132]
	add	r5, r5, r1
	mov	r1, ip, lsr #16
	add	r1, r1, r3, lsr #16
	ldr	r3, [sp, #120]
	cmp	r0, r5
	cmpls	r2, r5
	movls	r2, #0
	movhi	r2, #1
	and	r0, r3, r4
	orr	fp, r0, lr, asl #16
	orr	ip, ip, r1, asl #16
	ldr	lr, [sp, #76]
	ldr	r1, [sp, #88]
	ldr	r3, [sp, #52]
	add	r6, r6, r2
	ldr	r2, [sp, #16]
	str	r6, [lr, #0]
	mov	r0, #20
	str	ip, [sp, #360]
	str	r7, [r1, #12]
	str	r2, [r1, #16]
	str	r3, [lr, #16]
	stmib	lr, {r5, r8, sl}	@ phole stm
	mov	r5, #0
	str	r5, [sp, #348]
	str	r5, [sp, #352]
	str	r5, [sp, #356]
	str	fp, [sp, #364]
	bl	malloc
	ldr	r6, [sp, #96]
	ldr	r7, [sp, #92]
	ldr	r3, [r6, #8]
	ldr	r2, [r7, #12]
	str	r0, [sp, #72]
	mov	r1, r2, lsr #16
	and	r0, r3, r4
	and	r2, r2, r4
	mov	r3, r3, lsr #16
	mul	sl, r3, r1
	mul	r8, r3, r2
	mul	r5, r0, r2
	ldr	r3, [r6, #12]
	ldr	r2, [r7, #8]
	and	r7, r3, r4
	mov	r6, r2, lsr #16
	mov	r3, r3, lsr #16
	and	r2, r2, r4
	mul	r9, r7, r6
	mul	r6, r3, r6
	mul	r3, r2, r3
	mul	r2, r7, r2
	ldr	lr, [sp, #96]
	mul	ip, r0, r1
	ldr	r1, [lr, #16]
	ldr	lr, [sp, #92]
	ldr	r0, [lr, #4]
	str	r3, [sp, #140]
	str	r6, [sp, #144]
	and	r3, r1, r4
	mov	r6, r0, lsr #16
	mov	r1, r1, lsr #16
	and	r0, r0, r4
	str	r2, [sp, #136]
	mul	r2, r3, r6
	mul	r6, r1, r6
	mul	r1, r0, r1
	mul	r0, r3, r0
	ldr	r3, [sp, #96]
	str	r2, [sp, #152]
	str	r0, [sp, #148]
	ldr	r2, [r3, #0]
	ldr	r0, [lr, #16]
	and	r7, r2, r4
	str	r6, [sp, #160]
	mov	r6, r0, lsr #16
	mul	lr, r7, r6
	and	r0, r0, r4
	mov	r2, r2, lsr #16
	mul	r6, r2, r6
	mul	r2, r0, r2
	mul	r0, r7, r0
	str	r1, [sp, #156]
	mov	r1, ip, lsr #16
	and	ip, ip, r4
	and	r3, sl, r4
	add	r1, r1, r8, lsr #16
	add	ip, ip, r5, lsr #16
	and	r8, r8, r4
	add	ip, ip, r8
	add	r1, r1, r3
	add	r1, r1, ip, lsr #16
	and	r5, r5, r4
	orr	r5, r5, ip, asl #16
	mov	r3, r1, lsr #16
	ldr	ip, [sp, #360]
	str	lr, [sp, #168]
	add	r3, r3, sl, lsr #16
	adds	lr, fp, r5
	orr	r1, r1, r3, asl #16
	str	r2, [sp, #172]
	str	r0, [sp, #164]
	movcc	r2, #0
	movcs	r2, #1
	ldr	r0, [sp, #88]
	cmp	r5, lr
	orrhi	r2, r2, #1
	str	r6, [sp, #176]
	ldr	r3, [sp, #88]
	add	r6, r1, ip
	add	r6, r6, r2
	ldr	r0, [r0, #8]
	cmp	r1, r6
	cmpls	ip, r6
	ldr	r2, [sp, #136]
	ldr	r1, [sp, #140]
	ldr	r3, [r3, #4]
	str	r0, [sp, #44]
	mov	r0, r9, lsr #16
	and	r9, r9, r4
	ldr	r5, [sp, #356]
	add	r0, r0, r1, lsr #16
	str	r3, [sp, #48]
	add	r9, r9, r2, lsr #16
	ldr	r7, [sp, #44]
	and	r2, r1, r4
	ldr	r1, [sp, #144]
	add	r9, r9, r2
	ldr	r2, [sp, #152]
	and	r3, r1, r4
	movls	ip, #0
	movhi	ip, #1
	ldr	r1, [sp, #156]
	add	sl, r7, r5
	add	sl, sl, ip
	add	r0, r0, r3
	ldr	ip, [sp, #44]
	and	r3, r2, r4
	mov	r7, r2, lsr #16
	ldr	r2, [sp, #136]
	add	r7, r7, r1, lsr #16
	ldr	r1, [sp, #148]
	ldr	fp, [sp, #352]
	cmp	ip, sl
	cmpls	r5, sl
	and	ip, r2, r4
	ldr	r2, [sp, #48]
	add	r3, r3, r1, lsr #16
	str	r3, [sp, #4]
	movls	r5, #0
	movhi	r5, #1
	ldr	r3, [sp, #156]
	add	r8, r2, fp
	add	r8, r8, r5
	ldr	r5, [sp, #4]
	and	r1, r3, r4
	ldr	r3, [sp, #160]
	add	r1, r5, r1
	add	r0, r0, r9, lsr #16
	ldr	r5, [sp, #144]
	and	r2, r3, r4
	mov	r3, r0, lsr #16
	add	r3, r3, r5, lsr #16
	orr	r0, r0, r3, asl #16
	add	r7, r7, r2
	ldr	r3, [sp, #148]
	ldr	r2, [sp, #48]
	orr	ip, ip, r9, asl #16
	cmp	r2, r8
	cmpls	fp, r8
	and	r5, r3, r4
	movls	fp, #0
	movhi	fp, #1
	orr	r5, r5, r1, asl #16
	adds	lr, ip, lr
	str	r5, [sp, #20]
	movcc	r2, #0
	movcs	r2, #1
	cmp	ip, lr
	orrhi	r2, r2, #1
	ldr	r5, [sp, #160]
	add	r7, r7, r1, lsr #16
	ldr	ip, [sp, #20]
	add	r1, r0, r6
	add	r1, r1, r2
	mov	r3, r7, lsr #16
	ldr	r2, [sp, #20]
	add	ip, ip, lr
	add	r3, r3, r5, lsr #16
	orr	r7, r7, r3, asl #16
	cmp	r2, ip
	cmpls	lr, ip
	movls	r3, #0
	movhi	r3, #1
	add	r2, r7, r1
	cmp	r0, r1
	cmpls	r6, r1
	add	r3, r2, r3
	str	ip, [sp, #36]
	ldr	r2, [sp, #168]
	ldr	ip, [sp, #88]
	movls	r6, #0
	movhi	r6, #1
	str	r3, [sp, #40]
	cmp	r7, r3
	cmpls	r1, r3
	ldr	r3, [sp, #172]
	ldr	r5, [ip, #0]
	mov	ip, r2, lsr #16
	ldr	lr, [sp, #44]
	add	ip, ip, r3, lsr #16
	ldr	r3, [sp, #348]
	add	r0, lr, sl
	add	r3, r5, r3
	add	r0, r0, r6
	str	r3, [sp, #4]
	ldr	r6, [sp, #164]
	ldr	r3, [sp, #44]
	and	r2, r2, r4
	movls	r1, #0
	movhi	r1, #1
	cmp	lr, r0
	cmpls	sl, r0
	ldr	lr, [sp, #48]
	str	fp, [sp, #100]
	add	r9, r3, r0
	add	fp, r2, r6, lsr #16
	ldr	r3, [sp, #176]
	ldr	r6, [sp, #172]
	movls	sl, #0
	movhi	sl, #1
	add	r2, lr, r8
	add	r2, r2, sl
	add	r9, r9, r1
	ldr	sl, [sp, #4]
	ldr	r1, [sp, #100]
	and	lr, r6, r4
	and	r6, r3, r4
	add	ip, ip, r6
	ldr	r6, [sp, #44]
	add	r3, sl, r1
	ldr	sl, [sp, #48]
	cmp	r6, r9
	cmpls	r0, r9
	movls	r0, #0
	movhi	r0, #1
	add	r6, sl, r2
	cmp	sl, r2
	cmpls	r8, r2
	add	r6, r6, r0
	movls	r8, #0
	movhi	r8, #1
	add	r3, r5, r3
	cmp	sl, r6
	cmpls	r2, r6
	ldr	sl, [sp, #164]
	add	lr, fp, lr
	add	r3, r3, r8
	ldr	r0, [sp, #176]
	add	ip, ip, lr, lsr #16
	add	r5, r5, r3
	and	r3, sl, r4
	orr	fp, r3, lr, asl #16
	movls	r2, #0
	movhi	r2, #1
	ldr	lr, [sp, #72]
	mov	r1, ip, lsr #16
	add	r1, r1, r0, lsr #16
	add	r5, r5, r2
	str	r5, [lr, #0]
	orr	ip, ip, r1, asl #16
	ldr	r2, [sp, #20]
	ldr	r1, [sp, #88]
	add	r3, sp, #36
	ldmia	r3, {r3, r5}	@ phole ldm
	str	ip, [sp, #340]
	mov	r0, #20
	str	r7, [r1, #12]
	str	r2, [r1, #16]
	str	r3, [lr, #16]
	str	r5, [lr, #12]
	stmib	lr, {r6, r9}	@ phole stm
	mov	r6, #0
	str	r6, [sp, #328]
	str	r6, [sp, #332]
	str	r6, [sp, #336]
	str	fp, [sp, #344]
	bl	malloc
	ldr	sl, [sp, #92]
	ldr	r7, [sp, #96]
	ldr	r2, [sl, #12]
	ldr	r3, [r7, #4]
	str	r0, [sp, #68]
	and	r5, r3, r4
	mov	r0, r2, lsr #16
	mov	r3, r3, lsr #16
	mul	r1, r5, r0
	mul	r0, r3, r0
	and	r2, r2, r4
	mul	r9, r3, r2
	mul	ip, r5, r2
	ldr	r3, [r7, #8]
	ldr	r2, [sl, #8]
	and	r5, r3, r4
	str	r0, [sp, #180]
	mov	r3, r3, lsr #16
	mov	r0, r2, lsr #16
	and	r2, r2, r4
	mul	r7, r5, r0
	mul	r0, r3, r0
	mul	r3, r2, r3
	ldr	lr, [sp, #96]
	str	r3, [sp, #184]
	mul	r8, r5, r2
	ldr	r3, [lr, #12]
	ldr	r2, [sl, #4]
	str	r0, [sp, #188]
	ldr	r0, [sp, #92]
	ldr	r5, [lr, #16]
	mov	sl, r2, lsr #16
	and	lr, r3, r4
	ldr	r6, [r0, #0]
	and	r2, r2, r4
	mul	r0, lr, sl
	mov	r3, r3, lsr #16
	mul	sl, r3, sl
	mul	r3, r2, r3
	mul	r2, lr, r2
	str	r0, [sp, #196]
	mov	r0, r1, lsr #16
	and	r1, r1, r4
	str	sl, [sp, #204]
	str	r2, [sp, #192]
	mov	sl, r6, lsr #16
	and	r2, r5, r4
	and	r6, r6, r4
	add	r0, r0, r9, lsr #16
	add	r1, r1, ip, lsr #16
	and	r9, r9, r4
	mov	r5, r5, lsr #16
	add	r1, r1, r9
	mul	r9, r2, sl
	mul	sl, r5, sl
	mul	r5, r6, r5
	mul	r6, r2, r6
	ldr	lr, [sp, #180]
	str	r3, [sp, #200]
	and	r3, lr, r4
	add	r0, r0, r3
	and	ip, ip, r4
	orr	ip, ip, r1, asl #16
	add	r0, r0, r1, lsr #16
	ldr	r1, [sp, #88]
	mov	r3, r0, lsr #16
	ldr	r1, [r1, #8]
	str	r6, [sp, #212]
	add	r3, r3, lr, lsr #16
	ldr	r6, [sp, #340]
	adds	lr, fp, ip
	str	r1, [sp, #28]
	orr	r0, r0, r3, asl #16
	movcc	r2, #0
	movcs	r2, #1
	cmp	ip, lr
	orrhi	r2, r2, #1
	str	sl, [sp, #220]
	ldr	ip, [sp, #336]
	ldr	sl, [sp, #28]
	str	r5, [sp, #216]
	ldr	r3, [sp, #88]
	add	r5, r0, r6
	add	r5, r5, r2
	ldr	r2, [sp, #184]
	cmp	r0, r5
	cmpls	r6, r5
	ldr	r3, [r3, #4]
	add	r0, sl, ip
	mov	r1, r7, lsr #16
	ldr	sl, [sp, #188]
	and	r7, r7, r4
	add	r1, r1, r2, lsr #16
	add	r7, r7, r8, lsr #16
	and	r2, r2, r4
	str	r3, [sp, #32]
	add	r7, r7, r2
	and	r3, sl, r4
	ldr	r2, [sp, #28]
	movls	r6, #0
	movhi	r6, #1
	ldr	fp, [sp, #332]
	add	r0, r0, r6
	add	r1, r1, r3
	ldr	r3, [sp, #32]
	cmp	r2, r0
	cmpls	ip, r0
	movls	ip, #0
	movhi	ip, #1
	add	sl, r3, fp
	add	sl, sl, ip
	cmp	r3, sl
	cmpls	fp, sl
	movls	fp, #0
	movhi	fp, #1
	str	fp, [sp, #104]
	add	r1, r1, r7, lsr #16
	ldr	r6, [sp, #188]
	and	r8, r8, r4
	orr	r8, r8, r7, asl #16
	mov	r2, r1, lsr #16
	adds	fp, r8, lr
	add	r2, r2, r6, lsr #16
	orr	r1, r1, r2, asl #16
	movcc	r3, #0
	movcs	r3, #1
	cmp	r8, fp
	orrhi	r3, r3, #1
	add	r7, r1, r5
	add	r7, r7, r3
	ldr	lr, [sp, #196]
	cmp	r1, r7
	cmpls	r5, r7
	ldr	r2, [sp, #192]
	ldr	r1, [sp, #200]
	ldr	r6, [sp, #200]
	and	r3, lr, r4
	mov	ip, lr, lsr #16
	add	ip, ip, r1, lsr #16
	ldr	lr, [sp, #204]
	add	r1, r3, r2, lsr #16
	ldr	r3, [sp, #28]
	and	r2, r6, r4
	add	r2, r1, r2
	str	r2, [sp, #208]
	add	r8, r3, r0
	and	r3, lr, r4
	add	ip, ip, r3
	ldr	r3, [sp, #208]
	ldr	r2, [sp, #216]
	ldr	lr, [sp, #212]
	add	ip, ip, r3, lsr #16
	ldr	r3, [sp, #216]
	movls	r5, #0
	movhi	r5, #1
	mov	r6, r9, lsr #16
	and	r9, r9, r4
	add	r8, r8, r5
	ldr	r1, [sp, #28]
	ldr	r5, [sp, #192]
	add	r6, r6, r2, lsr #16
	add	r9, r9, lr, lsr #16
	ldr	r2, [sp, #32]
	and	lr, r3, r4
	ldr	r3, [sp, #220]
	cmp	r1, r8
	cmpls	r0, r8
	and	r1, r5, r4
	add	r5, r2, sl
	and	r2, r3, r4
	movls	r0, #0
	movhi	r0, #1
	add	r6, r6, r2
	ldr	r2, [sp, #32]
	add	r5, r5, r0
	cmp	r2, r5
	cmpls	sl, r5
	add	r0, sp, #208
	ldmia	r0, {r0, r2}	@ phole ldm
	orr	r1, r1, r0, asl #16
	add	r9, r9, lr
	and	r0, r2, r4
	orr	r0, r0, r9, asl #16
	str	r0, [sp, #24]
	add	r6, r6, r9, lsr #16
	ldr	r0, [sp, #220]
	ldr	lr, [sp, #204]
	mov	r2, r6, lsr #16
	add	r2, r2, r0, lsr #16
	mov	r3, ip, lsr #16
	orr	r6, r6, r2, asl #16
	movls	sl, #0
	movhi	sl, #1
	ldr	r2, [sp, #24]
	add	r3, r3, lr, lsr #16
	adds	lr, r1, fp
	orr	ip, ip, r3, asl #16
	movcc	r3, #0
	movcs	r3, #1
	cmp	r1, lr
	orrhi	r3, r3, #1
	add	fp, r2, lr
	ldr	r1, [sp, #88]
	add	r0, ip, r7
	add	r0, r0, r3
	cmp	r2, fp
	cmpls	lr, fp
	ldr	r4, [r1, #0]
	movls	r1, #0
	movhi	r1, #1
	cmp	ip, r0
	cmpls	r7, r0
	ldr	ip, [sp, #28]
	ldr	r3, [sp, #328]
	ldr	lr, [sp, #104]
	movls	r7, #0
	movhi	r7, #1
	add	r2, ip, r8
	add	r9, r6, r0
	add	r2, r2, r7
	add	r9, r9, r1
	ldr	r7, [sp, #32]
	add	r3, r4, r3
	cmp	r6, r9
	cmpls	r0, r9
	add	r3, r3, lr
	movls	r0, #0
	movhi	r0, #1
	add	r1, r7, r5
	cmp	ip, r2
	cmpls	r8, r2
	add	r7, ip, r2
	add	r3, r4, r3
	add	r7, r7, r0
	movls	r8, #0
	movhi	r8, #1
	add	r3, r3, sl
	ldr	sl, [sp, #32]
	add	r1, r1, r8
	cmp	ip, r7
	cmpls	r2, r7
	movls	r2, #0
	movhi	r2, #1
	add	ip, sl, r1
	cmp	sl, r1
	cmpls	r5, r1
	add	ip, ip, r2
	movls	r5, #0
	movhi	r5, #1
	add	r3, r4, r3
	cmp	sl, ip
	cmpls	r1, ip
	add	r3, r3, r5
	movls	r1, #0
	movhi	r1, #1
	add	r4, r4, r3
	ldr	lr, [sp, #84]
	ldr	sl, [sp, #88]
	add	r4, r4, r1
	ldr	r1, [sp, #24]
	ldr	r5, [lr, #12]
	ldr	r3, [lr, #0]
	ldmib	lr, {r2, r8}	@ phole ldm
	str	r1, [sl, #16]
	ldr	lr, [sp, #68]
	mov	r1, #0
	str	r4, [lr, #0]
	mov	r0, #20
	str	r3, [sp, #312]
	str	r2, [sp, #316]
	str	r8, [sp, #320]
	str	r6, [sl, #12]
	str	fp, [lr, #16]
	str	r9, [lr, #12]
	str	r7, [lr, #8]
	str	ip, [lr, #4]
	str	r1, [sp, #308]
	str	r5, [sp, #324]
	bl	malloc
	ldr	r2, [sp, #80]
	ldr	r3, [r2, #16]
	ldr	r1, [sp, #320]
	ldr	r2, [r2, #12]
	add	r7, r5, r3
	cmp	r5, r7
	cmpls	r3, r7
	ldr	r5, [sp, #80]
	movls	r3, #0
	movhi	r3, #1
	add	r4, r1, r2
	ldr	ip, [r5, #8]
	add	r4, r4, r3
	ldr	r5, [sp, #316]
	cmp	r1, r4
	cmpls	r2, r4
	ldr	r6, [sp, #80]
	movls	r2, #0
	movhi	r2, #1
	add	r1, r5, ip
	mov	r9, r0
	add	r1, r1, r2
	ldr	r0, [r6, #4]
	ldr	r6, [sp, #312]
	ldr	sl, [sp, #80]
	cmp	r5, r1
	cmpls	ip, r1
	movls	ip, #0
	movhi	ip, #1
	add	r2, r6, r0
	ldr	r8, [sp, #308]
	ldr	r3, [sl, #0]
	add	r2, r2, ip
	cmp	r6, r2
	cmpls	r0, r2
	movls	r0, #0
	movhi	r0, #1
	add	r3, r8, r3
	add	r3, r3, r0
	str	r3, [sp, #292]
	str	r2, [sp, #296]
	str	r1, [sp, #300]
	mov	ip, #0
	str	r8, [r9, #0]
	mov	r0, #20
	str	r7, [sl, #16]
	str	r4, [sl, #12]
	str	r1, [sl, #8]
	str	r2, [sl, #4]
	str	r3, [sl, #0]
	str	r3, [r9, #4]
	str	r2, [r9, #8]
	str	r1, [r9, #12]
	str	r4, [r9, #16]
	str	ip, [sp, #288]
	str	r4, [sp, #304]
	bl	malloc
	ldr	lr, [sp, #76]
	mov	r7, r0
	ldr	r3, [lr, #16]
	ldr	r0, [sp, #76]
	ldr	lr, [sp, #300]
	ldr	r2, [r0, #12]
	add	sl, r3, r4
	cmp	r4, sl
	cmpls	r3, sl
	add	r5, lr, r2
	movls	r3, #0
	movhi	r3, #1
	ldr	r0, [r0, #8]
	ldr	r8, [sp, #296]
	add	r5, r5, r3
	cmp	lr, r5
	cmpls	r2, r5
	ldr	r3, [sp, #76]
	movls	r2, #0
	movhi	r2, #1
	add	ip, r8, r0
	ldr	r1, [r3, #4]
	b	.L89
.L90:
	.align	2
.L88:
	.word	.LANCHOR0
.L89:
	ldr	r6, [sp, #292]
	add	ip, ip, r2
	cmp	r8, ip
	cmpls	r0, ip
	movls	r0, #0
	movhi	r0, #1
	add	r2, r6, r1
	ldr	r3, [r3, #0]
	ldr	fp, [sp, #288]
	add	r2, r2, r0
	cmp	r6, r2
	cmpls	r1, r2
	movls	r1, #0
	movhi	r1, #1
	add	r3, fp, r3
	add	r3, r3, r1
	str	r4, [r7, #16]
	str	r3, [sp, #272]
	str	r2, [sp, #276]
	str	ip, [sp, #280]
	str	r6, [r7, #4]
	ldr	r6, [sp, #76]
	str	fp, [r7, #0]
	str	r8, [r7, #8]
	str	lr, [r7, #12]
	mov	r0, #20
	str	sl, [r6, #16]
	str	r5, [r6, #12]
	stmib	r6, {r2, ip}	@ phole stm
	str	r3, [r6, #0]
	mov	r7, #0
	str	r3, [r9, #4]
	str	r2, [r9, #8]
	str	ip, [r9, #12]
	str	r5, [r9, #16]
	str	r7, [sp, #268]
	str	r5, [sp, #284]
	bl	malloc
	ldr	sl, [sp, #72]
	ldr	ip, [sp, #72]
	ldr	r1, [sl, #16]
	ldr	r2, [ip, #12]
	ldr	sl, [sp, #280]
	add	lr, r5, r1
	cmp	lr, r5
	movcs	r3, #0
	movcc	r3, #1
	cmp	r1, lr
	orrhi	r3, r3, #1
	add	r4, r2, sl
	ldr	r8, [sp, #276]
	add	r4, r4, r3
	mov	r7, r0
	ldr	r0, [ip, #8]
	cmp	sl, r4
	cmpls	r2, r4
	ldr	r1, [ip, #4]
	movls	r2, #0
	movhi	r2, #1
	add	ip, r0, r8
	ldr	r6, [sp, #272]
	add	ip, ip, r2
	ldr	r2, [sp, #72]
	cmp	r8, ip
	cmpls	r0, ip
	ldr	r3, [r2, #0]
	movls	r0, #0
	movhi	r0, #1
	add	r2, r1, r6
	ldr	fp, [sp, #268]
	add	r2, r2, r0
	cmp	r6, r2
	cmpls	r1, r2
	movls	r1, #0
	movhi	r1, #1
	add	r3, fp, r3
	str	r5, [r7, #16]
	add	r3, r3, r1
	mov	r5, #0
	str	r5, [sp, #248]
	str	r3, [sp, #252]
	str	r2, [sp, #256]
	str	ip, [sp, #260]
	str	r6, [r7, #4]
	ldr	r6, [sp, #72]
	str	fp, [r7, #0]
	str	r8, [r7, #8]
	str	sl, [r7, #12]
	mov	r0, #20
	str	lr, [r6, #16]
	str	r4, [r6, #12]
	stmib	r6, {r2, ip}	@ phole stm
	str	r3, [r6, #0]
	str	r3, [r9, #4]
	str	r2, [r9, #8]
	str	ip, [r9, #12]
	str	r4, [r9, #16]
	str	r4, [sp, #264]
	bl	malloc
	ldr	sl, [sp, #68]
	ldr	r3, [sl, #16]
	ldr	lr, [sp, #260]
	ldr	r1, [sl, #12]
	add	fp, r4, r3
	cmp	r4, fp
	cmpls	r3, fp
	add	r5, lr, r1
	movls	r3, #0
	movhi	r3, #1
	ldr	r8, [sp, #256]
	mov	r7, r0
	add	r5, r5, r3
	ldr	r0, [sl, #8]
	cmp	lr, r5
	cmpls	r1, r5
	movls	r1, #0
	movhi	r1, #1
	add	ip, r8, r0
	ldr	r6, [sp, #252]
	ldr	r2, [sl, #4]
	add	ip, ip, r1
	ldr	r1, [sp, #68]
	cmp	r8, ip
	cmpls	r0, ip
	ldr	r3, [r1, #0]
	movls	r0, #0
	movhi	r0, #1
	add	r1, r2, r6
	ldr	sl, [sp, #248]
	add	r1, r1, r0
	cmp	r6, r1
	cmpls	r2, r1
	movls	r2, #0
	movhi	r2, #1
	add	r3, sl, r3
	add	r3, r3, r2
	ldr	r2, [sp, #68]
	str	r4, [r7, #16]
	str	r3, [r2, #0]
	str	lr, [r7, #12]
	str	sl, [r7, #0]
	stmib	r7, {r6, r8}	@ phole stm
	ldr	r3, [sp, #84]
	str	fp, [r2, #16]
	stmib	r2, {r1, ip}	@ phole stm
	str	r5, [r2, #12]
	add	r6, sp, #72
	ldmia	r6, {r6, r7, sl}	@ phole ldm
	mov	r0, r9
	ldr	r4, [r3, #16]
	ldr	r5, [r6, #16]
	ldr	r6, [r7, #16]
	ldr	r7, [sl, #16]
	bl	free
	ldr	r0, [sp, #84]
	bl	free
	ldr	r0, [sp, #80]
	bl	free
	ldr	r0, [sp, #76]
	bl	free
	ldr	r0, [sp, #72]
	bl	free
	ldr	r0, [sp, #68]
	bl	free
	mov	r0, #20
	str	fp, [sp, #228]
	str	r5, [sp, #232]
	str	r6, [sp, #236]
	str	r7, [sp, #240]
	str	r4, [sp, #244]
	bl	malloc
	str	r4, [r0, #16]
	ldr	r3, [sp, #228]
	str	r3, [r0, #0]
	ldr	r2, [sp, #232]
	str	r2, [r0, #4]
	ldr	r3, [sp, #236]
	str	r3, [r0, #8]
	ldr	r2, [sp, #240]
	str	r2, [r0, #12]
	add	sp, sp, #452
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
	.size	mul_uint160, .-mul_uint160
	.align	2
	.global	lshift_uint160
	.type	lshift_uint160, %function
lshift_uint160:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	sub	sp, sp, #124
	push	{lr}
	bl	__gnu_mcount_nc
	mov	sl, #0
	mov	r4, r0
	mov	r7, r1
.L100:
	sub	r3, r7, #128
	sub	r2, r7, #96
	cmp	r7, #159
	and	r5, r3, #255
	and	r6, r2, #255
	bhi	.L101
	sub	r3, r7, #64
	cmp	r5, #31
	and	r8, r3, #255
	bls	.L102
	sub	r3, r7, #32
	cmp	r6, #31
	and	r5, r3, #255
	bls	.L103
	cmp	r8, #31
	bls	.L104
	cmp	r5, #31
	mov	r0, #20
	bls	.L105
	ldmib	r4, {r0, r5, r6}	@ phole ldm
	ldr	r2, [r4, #0]
	mov	r1, r0, asl r7
	mov	lr, r6, asl r7
	mov	r2, r2, asl r7
	mov	ip, r5, asl r7
	ldr	r4, [r4, #16]
	rsb	r3, r7, #32
	orr	r2, r2, r0, lsr r3
	orr	lr, lr, r4, lsr r3
	orr	r1, r1, r5, lsr r3
	orr	ip, ip, r6, lsr r3
	mov	r4, r4, asl r7
	mov	r0, #20
	str	r2, [sp, #20]
	str	r1, [sp, #24]
	str	ip, [sp, #28]
	str	lr, [sp, #32]
	str	r4, [sp, #36]
	bl	malloc
	ldr	r3, [sp, #20]
	str	r3, [r0, #0]
	ldr	r2, [sp, #24]
	str	r2, [r0, #4]
	ldr	r3, [sp, #28]
	str	r3, [r0, #8]
	ldr	r2, [sp, #32]
	str	r4, [r0, #16]
	str	r2, [r0, #12]
	b	.L93
.L101:
	mov	r4, #0
	mov	r0, #20
	str	r4, [sp, #0]
	str	r4, [sp, #4]
	str	r4, [sp, #8]
	str	r4, [sp, #12]
	str	r4, [sp, #16]
	bl	malloc
	ldr	r3, [sp, #0]
	str	r3, [r0, #0]
	ldr	r2, [sp, #4]
	str	r2, [r0, #4]
	ldr	r3, [sp, #8]
	str	r3, [r0, #8]
	ldr	r2, [sp, #12]
	str	r4, [r0, #16]
	str	r2, [r0, #12]
.L93:
	add	sp, sp, #124
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L105:
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #8]
	add	r1, r4, #12
	ldmia	r1, {r1, ip}	@ phole ldm
	str	r3, [sp, #40]
	str	r2, [sp, #44]
	str	r1, [sp, #48]
	str	ip, [sp, #52]
	str	sl, [sp, #56]
	bl	malloc
	ldr	r3, [sp, #40]
	str	r3, [r0, #0]
	ldr	r2, [sp, #44]
	str	r2, [r0, #4]
	ldr	r3, [sp, #48]
	str	r3, [r0, #8]
	ldr	r2, [sp, #52]
	mov	r4, r0
	str	r2, [r0, #12]
	str	sl, [r0, #16]
	mov	r7, r5
	b	.L100
.L102:
	ldr	r3, [r4, #16]
	mov	r0, #20
	str	r3, [sp, #100]
	str	sl, [sp, #104]
	str	sl, [sp, #108]
	str	sl, [sp, #112]
	str	sl, [sp, #116]
	bl	malloc
	ldr	r3, [sp, #100]
	str	r3, [r0, #0]
	ldr	r2, [sp, #104]
	str	r2, [r0, #4]
	ldr	r3, [sp, #108]
	str	r3, [r0, #8]
	ldr	r2, [sp, #112]
	mov	r4, r0
	str	r2, [r0, #12]
	str	sl, [r0, #16]
	mov	r7, r5
	b	.L100
.L103:
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #16]
	mov	r0, #20
	str	r3, [sp, #80]
	str	r2, [sp, #84]
	str	sl, [sp, #88]
	str	sl, [sp, #92]
	str	sl, [sp, #96]
	bl	malloc
	ldr	r3, [sp, #80]
	str	r3, [r0, #0]
	ldr	r2, [sp, #84]
	str	r2, [r0, #4]
	ldr	r3, [sp, #88]
	str	r3, [r0, #8]
	ldr	r2, [sp, #92]
	mov	r4, r0
	str	r2, [r0, #12]
	str	sl, [r0, #16]
	mov	r7, r6
	b	.L100
.L104:
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #16]
	mov	r0, #20
	str	r3, [sp, #60]
	str	r2, [sp, #64]
	str	r1, [sp, #68]
	str	sl, [sp, #72]
	str	sl, [sp, #76]
	bl	malloc
	ldr	r3, [sp, #60]
	str	r3, [r0, #0]
	ldr	r2, [sp, #64]
	str	r2, [r0, #4]
	ldr	r3, [sp, #68]
	str	r3, [r0, #8]
	ldr	r2, [sp, #72]
	mov	r4, r0
	str	r2, [r0, #12]
	str	sl, [r0, #16]
	mov	r7, r8
	b	.L100
	.size	lshift_uint160, .-lshift_uint160
	.align	2
	.global	rshift_uint160
	.type	rshift_uint160, %function
rshift_uint160:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	sub	sp, sp, #128
	push	{lr}
	bl	__gnu_mcount_nc
	mov	r6, #0
	mov	r8, r0
	mov	r7, r1
.L115:
	cmp	r7, #159
	bhi	.L116
	sub	r3, r7, #128
	and	r5, r3, #255
	cmp	r5, #31
	bls	.L117
	sub	r3, r7, #96
	and	r5, r3, #255
	cmp	r5, #31
	bls	.L118
	sub	r3, r7, #64
	and	r5, r3, #255
	cmp	r5, #31
	bls	.L119
	sub	r3, r7, #32
	and	r4, r3, #255
	cmp	r4, #31
	bls	.L120
	add	r0, r8, #8
	ldmia	r0, {r0, r6}	@ phole ldm
	ldr	r5, [r8, #4]
	ldr	r4, [r8, #16]
	mov	ip, r0, lsr r7
	mov	lr, r6, lsr r7
	mov	r4, r4, lsr r7
	mov	r1, r5, lsr r7
	ldr	r2, [r8, #0]
	rsb	r3, r7, #32
	orr	lr, lr, r0, asl r3
	orr	r1, r1, r2, asl r3
	orr	r4, r4, r6, asl r3
	orr	ip, ip, r5, asl r3
	mov	r2, r2, lsr r7
	mov	r0, #20
	str	r2, [sp, #48]
	str	r1, [sp, #52]
	str	ip, [sp, #56]
	str	lr, [sp, #60]
	str	r4, [sp, #64]
	bl	malloc
	ldr	r3, [sp, #48]
	str	r3, [r0, #0]
	ldr	r2, [sp, #52]
	str	r2, [r0, #4]
	ldr	r3, [sp, #56]
	str	r3, [r0, #8]
	ldr	r2, [sp, #60]
	str	r4, [r0, #16]
	str	r2, [r0, #12]
	b	.L108
.L116:
	mov	r4, #0
	mov	r0, #20
	str	r4, [sp, #28]
	str	r4, [sp, #32]
	str	r4, [sp, #36]
	str	r4, [sp, #40]
	str	r4, [sp, #44]
	bl	malloc
	ldr	r3, [sp, #28]
	str	r3, [r0, #0]
	ldr	r2, [sp, #32]
	str	r2, [r0, #4]
	ldr	r3, [sp, #36]
	str	r3, [r0, #8]
	ldr	r2, [sp, #40]
	str	r4, [r0, #16]
	str	r2, [r0, #12]
.L108:
	add	sp, sp, #128
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L120:
	ldr	r3, [r8, #0]
	ldr	r2, [r8, #4]
	add	r1, r8, #8
	ldmia	r1, {r1, ip, lr}	@ phole ldm
	mov	r0, #20
	str	r3, [sp, #8]
	str	r2, [sp, #12]
	str	r1, [sp, #16]
	str	ip, [sp, #20]
	str	lr, [sp, #24]
	str	r6, [sp, #4]
	bl	malloc
	ldr	r3, [sp, #4]
	str	r3, [r0, #0]
	ldr	r2, [sp, #8]
	str	r2, [r0, #4]
	ldr	r3, [sp, #12]
	str	r3, [r0, #8]
	ldr	r2, [sp, #16]
	str	r2, [r0, #12]
	ldr	r3, [sp, #20]
	mov	r8, r0
	str	r3, [r0, #16]
	mov	r7, r4
	b	.L115
.L117:
	ldr	r4, [r8, #0]
	mov	r0, #20
	str	r6, [sp, #108]
	str	r6, [sp, #112]
	str	r6, [sp, #116]
	str	r6, [sp, #120]
	str	r4, [sp, #124]
	bl	malloc
	ldr	r3, [sp, #108]
	str	r3, [r0, #0]
	ldr	r2, [sp, #112]
	str	r2, [r0, #4]
	ldr	r3, [sp, #116]
	str	r3, [r0, #8]
	ldr	r2, [sp, #120]
	mov	r8, r0
	str	r4, [r0, #16]
	str	r2, [r0, #12]
	mov	r7, r5
	b	.L115
.L118:
	ldmia	r8, {r3, r4}	@ phole ldm
	mov	r0, #20
	str	r3, [sp, #100]
	str	r6, [sp, #88]
	str	r6, [sp, #92]
	str	r6, [sp, #96]
	str	r4, [sp, #104]
	bl	malloc
	ldr	r3, [sp, #88]
	str	r3, [r0, #0]
	ldr	r2, [sp, #92]
	str	r2, [r0, #4]
	ldr	r3, [sp, #96]
	str	r3, [r0, #8]
	ldr	r2, [sp, #100]
	mov	r8, r0
	str	r4, [r0, #16]
	str	r2, [r0, #12]
	mov	r7, r5
	b	.L115
.L119:
	ldr	r4, [r8, #8]
	ldr	r3, [r8, #0]
	ldr	r2, [r8, #4]
	mov	r0, #20
	str	r3, [sp, #76]
	str	r2, [sp, #80]
	str	r6, [sp, #68]
	str	r6, [sp, #72]
	str	r4, [sp, #84]
	bl	malloc
	ldr	r3, [sp, #68]
	str	r3, [r0, #0]
	ldr	r2, [sp, #72]
	str	r2, [r0, #4]
	ldr	r3, [sp, #76]
	str	r3, [r0, #8]
	ldr	r2, [sp, #80]
	mov	r8, r0
	str	r4, [r0, #16]
	str	r2, [r0, #12]
	mov	r7, r5
	b	.L115
	.size	rshift_uint160, .-rshift_uint160
	.align	2
	.global	mul_modifying
	.type	mul_modifying, %function
mul_modifying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 440
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #444
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, [r0, #16]
	cmp	r3, #0
	mov	fp, r0
	str	r1, [sp, #104]
	bne	.L122
	ldr	r3, [r0, #12]
	cmp	r3, #0
	bne	.L122
	ldr	r3, [r0, #8]
	cmp	r3, #0
	bne	.L122
	ldr	r3, [r0, #4]
	cmp	r3, #0
	bne	.L122
	ldr	r3, [r0, #0]
	cmp	r3, #0
	bne	.L122
.L125:
	add	sp, sp, #444
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L122:
	ldr	r0, [sp, #104]
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L124
	ldr	r3, [r0, #12]
	cmp	r3, #0
	bne	.L124
	ldr	r3, [r0, #8]
	cmp	r3, #0
	bne	.L124
	ldr	r3, [r0, #4]
	cmp	r3, #0
	bne	.L124
	ldr	r3, [r0, #0]
	cmp	r3, #0
	bne	.L124
	str	r3, [fp, #16]
	str	r3, [fp, #0]
	str	r3, [fp, #4]
	str	r3, [fp, #8]
	str	r3, [fp, #12]
	b	.L125
.L124:
	ldr	ip, .L126
	ldmia	ip!, {r0, r1, r2, r3}
	add	r4, sp, #420
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [ip, #0]
	mov	r0, #20
	str	r3, [r4, #0]
	bl	malloc
	ldr	r1, [sp, #104]
	ldr	r2, [fp, #16]
	ldr	r3, [r1, #16]
	mov	r1, r2, asl #16
	str	r0, [sp, #100]
	mov	r1, r1, lsr #16
	mov	r0, r3, lsr #16
	mov	r3, r3, asl #16
	mul	ip, r1, r0
	mov	r2, r2, lsr #16
	mov	r3, r3, lsr #16
	mul	r6, r2, r0
	mul	r4, r2, r3
	mul	r5, r1, r3
	mov	r2, ip, asl #16
	mov	r3, r4, asl #16
	mov	r1, r6, asl #16
	mov	r2, r2, lsr #16
	mov	ip, ip, lsr #16
	mov	r1, r1, lsr #16
	add	ip, ip, r4, lsr #16
	add	r2, r2, r5, lsr #16
	mov	r3, r3, lsr #16
	add	r2, r2, r3
	add	ip, ip, r1
	add	ip, ip, r2, lsr #16
	mov	r3, ip, lsr #16
	mov	r5, r5, asl #16
	add	r3, r3, r6, lsr #16
	mov	r5, r5, lsr #16
	orr	r5, r5, r2, asl #16
	orr	ip, ip, r3, asl #16
	ldr	r2, [sp, #100]
	ldr	r3, [sp, #420]
	str	r3, [r2, #0]
	ldr	r2, [sp, #424]
	ldr	r3, [sp, #100]
	str	r2, [r3, #4]
	ldr	r3, [sp, #428]
	ldr	r4, [sp, #100]
	str	r3, [r4, #8]
	ldr	r2, [sp, #432]
	str	r2, [r4, #12]
	ldr	r3, [sp, #436]
	mov	r6, #0
	str	r3, [r4, #16]
	mov	r0, #20
	str	ip, [sp, #412]
	str	r6, [sp, #400]
	str	r6, [sp, #404]
	str	r6, [sp, #408]
	str	r5, [sp, #416]
	bl	malloc
	ldr	r8, [sp, #104]
	ldr	r2, [fp, #12]
	ldr	r3, [r8, #16]
	mov	r1, r2, asl #16
	str	r0, [sp, #96]
	mov	r1, r1, lsr #16
	mov	r0, r3, lsr #16
	mov	r3, r3, asl #16
	mul	ip, r1, r0
	mov	r2, r2, lsr #16
	mov	r3, r3, lsr #16
	mul	r7, r2, r0
	mul	r4, r2, r3
	mul	r6, r1, r3
	mov	r2, ip, asl #16
	mov	r3, r4, asl #16
	mov	r1, r7, asl #16
	mov	r2, r2, lsr #16
	mov	ip, ip, lsr #16
	mov	r1, r1, lsr #16
	add	ip, ip, r4, lsr #16
	add	r2, r2, r6, lsr #16
	mov	r3, r3, lsr #16
	add	r2, r2, r3
	add	ip, ip, r1
	add	ip, ip, r2, lsr #16
	mov	r3, ip, lsr #16
	add	r3, r3, r7, lsr #16
	ldr	r9, [sp, #96]
	orr	ip, ip, r3, asl #16
	ldr	r3, [sp, #400]
	mov	r6, r6, asl #16
	str	r3, [r9, #0]
	mov	r6, r6, lsr #16
	orr	r6, r6, r2, asl #16
	ldr	r2, [sp, #404]
	str	r2, [r9, #4]
	ldr	r3, [sp, #408]
	str	r3, [r9, #8]
	ldr	r2, [sp, #412]
	mov	sl, #0
	str	r2, [r9, #12]
	str	r5, [r9, #16]
	mov	r0, #20
	str	ip, [sp, #392]
	str	sl, [sp, #380]
	str	sl, [sp, #384]
	str	sl, [sp, #388]
	str	r6, [sp, #396]
	bl	malloc
	ldr	r3, [r8, #12]
	ldr	r2, [fp, #16]
	str	r0, [sp, #92]
	mov	r0, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	lr, [sp, #104]
	mov	r1, r2, asl #16
	mov	r2, r2, lsr #16
	mul	r7, r2, r0
	mul	ip, r2, r3
	mov	r1, r1, lsr #16
	ldr	r2, [fp, #8]
	mul	r8, r1, r3
	ldr	r3, [lr, #16]
	mul	r4, r1, r0
	mov	r1, r2, asl #16
	mov	r1, r1, lsr #16
	mov	r0, r3, lsr #16
	mov	r2, r2, lsr #16
	mul	r5, r1, r0
	mul	r0, r2, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r0, [sp, #116]
	mul	r0, r2, r3
	mov	r2, r4, asl #16
	mul	sl, r1, r3
	mov	r2, r2, lsr #16
	mov	r3, ip, asl #16
	mov	r1, r7, asl #16
	mov	r4, r4, lsr #16
	add	r4, r4, ip, lsr #16
	add	r2, r2, r8, lsr #16
	mov	r3, r3, lsr #16
	mov	r1, r1, lsr #16
	add	r2, r2, r3
	add	r4, r4, r1
	mov	r8, r8, asl #16
	add	r4, r4, r2, lsr #16
	mov	r8, r8, lsr #16
	orr	r8, r8, r2, asl #16
	mov	r3, r4, lsr #16
	ldr	ip, [sp, #392]
	add	r1, r6, r8
	add	r3, r3, r7, lsr #16
	orr	r4, r4, r3, asl #16
	cmp	r8, r1
	cmpls	r6, r1
	ldr	r2, [sp, #100]
	add	r3, r4, ip
	movls	r6, #0
	movhi	r6, #1
	ldr	r2, [r2, #8]
	add	lr, r3, r6
	ldr	r6, [sp, #116]
	str	r2, [sp, #72]
	mov	r2, r6, asl #16
	ldr	r6, [sp, #100]
	ldr	r6, [r6, #4]
	ldr	r9, [sp, #388]
	str	r6, [sp, #76]
	ldr	r6, [sp, #72]
	cmp	r4, lr
	cmpls	ip, lr
	str	r1, [sp, #68]
	movls	ip, #0
	movhi	ip, #1
	add	r7, r6, r9
	mov	r1, r5, asl #16
	mov	r5, r5, lsr #16
	add	r7, r7, ip
	mov	r3, r0, asl #16
	ldr	ip, [sp, #76]
	add	r5, r5, r0, lsr #16
	mov	r1, r1, lsr #16
	ldr	r0, [sp, #384]
	cmp	r6, r7
	cmpls	r9, r7
	add	r1, r1, sl, lsr #16
	mov	r3, r3, lsr #16
	mov	r2, r2, lsr #16
	add	r1, r1, r3
	movls	r9, #0
	movhi	r9, #1
	add	r6, ip, r0
	ldr	r3, [sp, #76]
	add	r5, r5, r2
	ldr	r2, [sp, #100]
	add	r6, r6, r9
	add	r5, r5, r1, lsr #16
	ldr	r9, [sp, #116]
	ldr	ip, [r2, #0]
	cmp	r3, r6
	cmpls	r0, r6
	mov	r2, r5, lsr #16
	ldr	r3, [sp, #380]
	mov	sl, sl, asl #16
	add	r2, r2, r9, lsr #16
	mov	sl, sl, lsr #16
	movls	r0, #0
	movhi	r0, #1
	orr	sl, sl, r1, asl #16
	orr	r5, r5, r2, asl #16
	ldr	r1, [sp, #92]
	ldr	r2, [sp, #100]
	add	ip, ip, r3
	ldr	r3, [sp, #68]
	add	ip, ip, r0
	str	ip, [r1, #0]
	mov	r0, #20
	str	r5, [sp, #372]
	str	r4, [r2, #12]
	str	r8, [r2, #16]
	mov	r4, #0
	str	r3, [r1, #16]
	stmib	r1, {r6, r7, lr}	@ phole stm
	str	r4, [sp, #360]
	str	r4, [sp, #364]
	str	r4, [sp, #368]
	str	sl, [sp, #376]
	bl	malloc
	ldr	r5, [sp, #104]
	ldr	r1, [fp, #12]
	ldr	r2, [r5, #12]
	ldr	r6, [sp, #104]
	ldr	r5, [fp, #16]
	mov	r7, r1, asl #16
	ldr	r3, [r6, #8]
	mov	r7, r7, lsr #16
	mov	ip, r2, lsr #16
	mov	r1, r1, lsr #16
	mov	r2, r2, asl #16
	mul	r4, r7, ip
	mov	r2, r2, lsr #16
	mul	ip, r1, ip
	str	r0, [sp, #88]
	mov	r0, r5, asl #16
	mul	r8, r1, r2
	mov	r0, r0, lsr #16
	mov	r1, r3, lsr #16
	mov	r5, r5, lsr #16
	mul	r6, r0, r1
	mul	r1, r5, r1
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mul	lr, r0, r3
	ldr	r0, [sp, #104]
	mul	r9, r5, r3
	str	ip, [sp, #120]
	ldr	r3, [r0, #16]
	mul	ip, r7, r2
	ldr	r2, [fp, #4]
	str	r1, [sp, #124]
	mov	r0, r3, lsr #16
	mov	r1, r2, asl #16
	mov	r3, r3, asl #16
	mov	r1, r1, lsr #16
	mov	r2, r2, lsr #16
	mov	r3, r3, lsr #16
	mul	r7, r1, r0
	mul	r0, r2, r0
	mul	r2, r3, r2
	mul	r3, r1, r3
	str	r2, [sp, #132]
	ldr	r5, [sp, #120]
	mov	r2, r4, asl #16
	str	r3, [sp, #128]
	mov	r2, r2, lsr #16
	mov	r3, r8, asl #16
	mov	r4, r4, lsr #16
	str	r0, [sp, #136]
	mov	r1, r5, asl #16
	add	r4, r4, r8, lsr #16
	add	r2, r2, ip, lsr #16
	ldr	r8, [sp, #124]
	mov	r3, r3, lsr #16
	mov	r0, r6, asl #16
	mov	ip, ip, asl #16
	add	r2, r2, r3
	mov	r1, r1, lsr #16
	mov	r3, r9, asl #16
	mov	r0, r0, lsr #16
	mov	ip, ip, lsr #16
	orr	ip, ip, r2, asl #16
	add	r4, r4, r1
	add	r0, r0, lr, lsr #16
	mov	r1, r8, asl #16
	mov	r3, r3, lsr #16
	mov	r6, r6, lsr #16
	mov	lr, lr, asl #16
	adds	sl, sl, ip
	add	r0, r0, r3
	add	r4, r4, r2, lsr #16
	add	r6, r6, r9, lsr #16
	mov	r1, r1, lsr #16
	ldr	r9, [sp, #100]
	mov	lr, lr, lsr #16
	orr	lr, lr, r0, asl #16
	add	r6, r6, r1
	mov	r3, r4, lsr #16
	movcc	r2, #0
	movcs	r2, #1
	cmp	ip, sl
	orrhi	r2, r2, #1
	add	r3, r3, r5, lsr #16
	add	ip, lr, sl
	ldr	r5, [sp, #372]
	add	r6, r6, r0, lsr #16
	ldr	r9, [r9, #8]
	orr	r4, r4, r3, asl #16
	cmp	lr, ip
	cmpls	sl, ip
	mov	r3, r6, lsr #16
	str	lr, [sp, #20]
	ldr	lr, [sp, #100]
	str	r9, [sp, #60]
	add	r3, r3, r8, lsr #16
	add	r1, r4, r5
	add	r1, r1, r2
	ldr	r9, [sp, #368]
	orr	r6, r6, r3, asl #16
	ldr	r2, [sp, #60]
	ldr	lr, [lr, #4]
	add	r3, r6, r1
	movls	sl, #0
	movhi	sl, #1
	cmp	r4, r1
	cmpls	r5, r1
	str	lr, [sp, #64]
	movls	r5, #0
	movhi	r5, #1
	add	lr, r3, sl
	add	r0, r2, r9
	ldr	r8, [sp, #132]
	ldr	sl, [sp, #128]
	str	ip, [sp, #56]
	mov	ip, r7, asl #16
	add	r0, r0, r5
	cmp	r6, lr
	cmpls	r1, lr
	mov	ip, ip, lsr #16
	mov	r7, r7, lsr #16
	add	r4, sp, #132
	ldmia	r4, {r4, r5}	@ phole ldm
	movls	r1, #0
	movhi	r1, #1
	add	r7, r7, r8, lsr #16
	cmp	r2, r0
	cmpls	r9, r0
	ldr	r8, [sp, #64]
	ldr	r2, [sp, #100]
	add	ip, ip, sl, lsr #16
	ldr	sl, [sp, #364]
	mov	r3, r4, asl #16
	mov	r4, r5, asl #16
	ldr	r5, [r2, #0]
	add	r2, r8, sl
	ldr	sl, [sp, #60]
	mov	r3, r3, lsr #16
	add	r8, sl, r0
	mov	r4, r4, lsr #16
	add	r8, r8, r1
	add	ip, ip, r3
	movls	r9, #0
	movhi	r9, #1
	ldr	r3, [sp, #364]
	add	r7, r7, r4
	ldr	r4, [sp, #64]
	add	r2, r2, r9
	cmp	sl, r8
	cmpls	r0, r8
	movls	r0, #0
	movhi	r0, #1
	cmp	r4, r2
	cmpls	r3, r2
	ldr	r3, [sp, #360]
	movls	r1, #0
	movhi	r1, #1
	ldr	r9, [sp, #128]
	add	r3, r5, r3
	add	r3, r3, r1
	add	r4, r4, r2
	add	r4, r4, r0
	add	r7, r7, ip, lsr #16
	ldr	sl, [sp, #64]
	mov	r0, r9, asl #16
	add	r5, r5, r3
	ldr	r3, [sp, #136]
	mov	r1, r7, lsr #16
	mov	r0, r0, lsr #16
	cmp	sl, r4
	cmpls	r2, r4
	add	r1, r1, r3, lsr #16
	orr	r0, r0, ip, asl #16
	str	r0, [sp, #224]
	movls	r2, #0
	movhi	r2, #1
	ldr	r9, [sp, #88]
	ldr	sl, [sp, #100]
	orr	r7, r7, r1, asl #16
	ldr	ip, [sp, #20]
	ldr	r1, [sp, #56]
	add	r5, r5, r2
	ldr	r3, [sp, #224]
	str	r5, [r9, #0]
	mov	r2, #0
	str	r7, [sp, #352]
	mov	r0, #20
	str	r6, [sl, #12]
	str	ip, [sl, #16]
	str	r1, [r9, #16]
	stmib	r9, {r4, r8, lr}	@ phole stm
	str	r2, [sp, #340]
	str	r2, [sp, #344]
	str	r2, [sp, #348]
	str	r3, [sp, #356]
	bl	malloc
	ldr	r4, [sp, #104]
	ldr	r2, [fp, #8]
	ldr	r3, [r4, #12]
	str	r0, [sp, #84]
	mov	r1, r2, asl #16
	mov	r0, r3, lsr #16
	mov	r3, r3, asl #16
	mov	r1, r1, lsr #16
	mov	r2, r2, lsr #16
	mov	r3, r3, lsr #16
	mul	lr, r2, r0
	mul	sl, r2, r3
	mul	ip, r1, r0
	ldr	r2, [r4, #8]
	ldr	r0, [fp, #12]
	mov	r7, r2, lsr #16
	mov	r5, r0, asl #16
	mov	r2, r2, asl #16
	mov	r5, r5, lsr #16
	mov	r0, r0, lsr #16
	mov	r2, r2, lsr #16
	mul	r9, r5, r7
	mul	r7, r0, r7
	mul	r0, r2, r0
	ldr	r8, [sp, #104]
	ldr	r4, [fp, #16]
	mul	r6, r1, r3
	ldr	r3, [r8, #4]
	mov	r1, r4, asl #16
	str	r0, [sp, #144]
	mov	r1, r1, lsr #16
	mov	r0, r3, lsr #16
	mov	r4, r4, lsr #16
	mul	r8, r1, r0
	mov	r3, r3, asl #16
	mul	r0, r4, r0
	mov	r3, r3, lsr #16
	mul	r4, r3, r4
	mul	r3, r1, r3
	mul	r2, r5, r2
	str	r0, [sp, #160]
	ldr	r0, [sp, #104]
	str	r4, [sp, #156]
	str	r3, [sp, #152]
	ldr	r4, [fp, #0]
	ldr	r3, [r0, #16]
	str	r7, [sp, #148]
	mov	r5, r4, asl #16
	mov	r7, r3, lsr #16
	mov	r3, r3, asl #16
	str	r2, [sp, #140]
	mov	r5, r5, lsr #16
	mov	r2, ip, asl #16
	mov	r4, r4, lsr #16
	mov	r3, r3, lsr #16
	mov	ip, ip, lsr #16
	mov	r1, sl, asl #16
	add	ip, ip, sl, lsr #16
	mul	sl, r5, r7
	mul	r7, r4, r7
	mul	r4, r3, r4
	mul	r3, r5, r3
	mov	r0, lr, asl #16
	mov	r2, r2, lsr #16
	add	r2, r2, r6, lsr #16
	mov	r1, r1, lsr #16
	mov	r0, r0, lsr #16
	add	r2, r2, r1
	add	ip, ip, r0
	mov	r6, r6, asl #16
	add	ip, ip, r2, lsr #16
	ldr	r0, [sp, #224]
	mov	r6, r6, lsr #16
	orr	r6, r6, r2, asl #16
	str	r3, [sp, #164]
	mov	r3, ip, lsr #16
	add	r3, r3, lr, lsr #16
	str	r4, [sp, #172]
	adds	lr, r0, r6
	ldr	r4, [sp, #352]
	orr	ip, ip, r3, asl #16
	movcc	r2, #0
	movcs	r2, #1
	cmp	r6, lr
	orrhi	r2, r2, #1
	ldr	r1, [sp, #100]
	add	r6, ip, r4
	add	r6, r6, r2
	cmp	ip, r6
	cmpls	r4, r6
	ldr	r1, [r1, #8]
	ldr	ip, [sp, #100]
	str	sl, [sp, #168]
	str	r1, [sp, #48]
	ldr	sl, [sp, #144]
	ldr	r1, [sp, #148]
	ldr	ip, [ip, #4]
	mov	r3, r9, asl #16
	mov	r9, r9, lsr #16
	ldr	r5, [sp, #348]
	str	r7, [sp, #176]
	mov	r2, sl, asl #16
	mov	r0, r1, asl #16
	add	r9, r9, sl, lsr #16
	ldr	sl, [sp, #140]
	str	ip, [sp, #52]
	ldr	r1, [sp, #48]
	mov	r3, r3, lsr #16
	movls	r4, #0
	movhi	r4, #1
	add	r3, r3, sl, lsr #16
	mov	r2, r2, lsr #16
	add	sl, r1, r5
	add	sl, sl, r4
	add	r3, r3, r2
	ldr	r4, [sp, #156]
	ldr	r2, [sp, #140]
	mov	ip, r2, asl #16
	mov	r2, r4, asl #16
	ldr	r4, [sp, #160]
	mov	r0, r0, lsr #16
	add	r9, r9, r0
	mov	r0, r4, asl #16
	ldr	r4, [sp, #48]
	cmp	r4, sl
	cmpls	r5, sl
	ldr	r4, [sp, #156]
	mov	r1, r8, asl #16
	mov	r8, r8, lsr #16
	add	r8, r8, r4, lsr #16
	ldr	r4, [sp, #152]
	mov	r1, r1, lsr #16
	add	r1, r1, r4, lsr #16
	str	r1, [sp, #8]
	ldr	r4, [sp, #344]
	ldr	r1, [sp, #52]
	mov	r0, r0, lsr #16
	movls	r5, #0
	movhi	r5, #1
	add	r7, r1, r4
	mov	ip, ip, lsr #16
	add	r8, r8, r0
	ldr	r0, [sp, #52]
	add	r7, r7, r5
	orr	r5, ip, r3, asl #16
	ldr	ip, [sp, #8]
	cmp	r0, r7
	cmpls	r4, r7
	mov	r2, r2, lsr #16
	ldr	r4, [sp, #152]
	add	r1, ip, r2
	add	r9, r9, r3, lsr #16
	ldr	r2, [sp, #148]
	movls	r0, #0
	movhi	r0, #1
	mov	r3, r9, lsr #16
	adds	lr, r5, lr
	mov	ip, r4, asl #16
	add	r3, r3, r2, lsr #16
	mov	ip, ip, lsr #16
	movcc	r2, #0
	movcs	r2, #1
	cmp	r5, lr
	orrhi	r2, r2, #1
	add	r8, r8, r1, lsr #16
	orr	ip, ip, r1, asl #16
	ldr	r5, [sp, #160]
	orr	r9, r9, r3, asl #16
	str	ip, [sp, #24]
	mov	r3, r8, lsr #16
	str	r0, [sp, #108]
	add	r3, r3, r5, lsr #16
	ldr	r0, [sp, #24]
	orr	r8, r8, r3, asl #16
	add	ip, ip, lr
	add	r1, r9, r6
	ldr	r3, [sp, #100]
	add	r1, r1, r2
	cmp	r0, ip
	cmpls	lr, ip
	ldr	r5, [r3, #0]
	movls	r2, #0
	movhi	r2, #1
	add	r3, r8, r1
	cmp	r9, r1
	cmpls	r6, r1
	ldr	r4, [sp, #48]
	ldr	r9, [sp, #168]
	add	r2, r3, r2
	str	r2, [sp, #44]
	ldr	lr, [sp, #172]
	ldr	r2, [sp, #176]
	movls	r6, #0
	movhi	r6, #1
	add	r0, r4, sl
	mov	r3, r9, lsr #16
	str	ip, [sp, #40]
	mov	ip, r9, asl #16
	ldr	r9, [sp, #44]
	add	r0, r0, r6
	mov	r4, lr, asl #16
	mov	r6, r2, asl #16
	ldr	lr, [sp, #48]
	ldr	r2, [sp, #172]
	cmp	r8, r9
	cmpls	r1, r9
	movls	r1, #0
	movhi	r1, #1
	cmp	lr, r0
	cmpls	sl, r0
	add	lr, r3, r2, lsr #16
	ldr	r3, [sp, #340]
	add	r3, r5, r3
	str	r3, [sp, #12]
	ldr	r3, [sp, #164]
	ldr	r9, [sp, #52]
	mov	ip, ip, lsr #16
	add	ip, ip, r3, lsr #16
	ldr	r3, [sp, #48]
	movls	sl, #0
	movhi	sl, #1
	add	r2, r9, r7
	mov	r4, r4, lsr #16
	add	r2, r2, sl
	add	ip, ip, r4
	add	r9, r3, r0
	ldr	r4, [sp, #12]
	ldr	sl, [sp, #108]
	mov	r6, r6, lsr #16
	add	r9, r9, r1
	add	r1, lr, r6
	ldr	lr, [sp, #48]
	add	r3, r4, sl
	ldr	r4, [sp, #52]
	cmp	lr, r9
	cmpls	r0, r9
	movls	r0, #0
	movhi	r0, #1
	cmp	r4, r2
	cmpls	r7, r2
	movls	r7, #0
	movhi	r7, #1
	ldr	sl, [sp, #164]
	add	r3, r5, r3
	add	r3, r3, r7
	add	r4, r4, r2
	add	r6, r1, ip, lsr #16
	add	r4, r4, r0
	mov	lr, sl, asl #16
	ldr	r0, [sp, #52]
	add	r5, r5, r3
	ldr	r3, [sp, #176]
	mov	r1, r6, lsr #16
	mov	lr, lr, lsr #16
	cmp	r0, r4
	cmpls	r2, r4
	orr	lr, lr, ip, asl #16
	add	r1, r1, r3, lsr #16
	str	lr, [sp, #232]
	movls	r2, #0
	movhi	r2, #1
	orr	r1, r6, r1, asl #16
	ldr	r6, [sp, #84]
	add	r5, r5, r2
	str	r5, [r6, #0]
	ldr	sl, [sp, #100]
	str	r1, [sp, #332]
	ldr	ip, [sp, #24]
	ldr	lr, [sp, #40]
	ldr	r1, [sp, #44]
	ldr	r3, [sp, #232]
	str	r8, [sl, #12]
	str	ip, [sl, #16]
	mov	r2, #0
	str	lr, [r6, #16]
	str	r1, [r6, #12]
	stmib	r6, {r4, r9}	@ phole stm
	mov	r0, #20
	str	r2, [sp, #320]
	str	r2, [sp, #324]
	str	r2, [sp, #328]
	str	r3, [sp, #336]
	bl	malloc
	ldr	r4, [sp, #104]
	ldr	r2, [fp, #4]
	ldr	r3, [r4, #12]
	mov	r1, r2, asl #16
	mov	r1, r1, lsr #16
	mov	r2, r2, lsr #16
	str	r0, [sp, #80]
	mov	r0, r3, lsr #16
	mul	r4, r1, r0
	mul	r0, r2, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r6, [sp, #104]
	mul	sl, r2, r3
	ldr	r2, [fp, #8]
	mul	r5, r1, r3
	ldr	r3, [r6, #8]
	mov	r1, r2, asl #16
	str	r0, [sp, #180]
	mov	r1, r1, lsr #16
	mov	r0, r3, lsr #16
	mov	r2, r2, lsr #16
	mul	r6, r1, r0
	mov	r3, r3, asl #16
	mul	r0, r2, r0
	mov	r3, r3, lsr #16
	mul	r2, r3, r2
	ldr	r9, [sp, #104]
	str	r0, [sp, #188]
	ldr	r0, [fp, #12]
	mul	r8, r1, r3
	ldr	r3, [r9, #4]
	str	r2, [sp, #184]
	mov	lr, r0, asl #16
	ldr	r2, [sp, #104]
	mov	lr, lr, lsr #16
	mov	ip, r3, lsr #16
	mov	r0, r0, lsr #16
	ldr	r1, [r2, #0]
	mul	r2, lr, ip
	mul	ip, r0, ip
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mul	r0, r3, r0
	ldr	r9, [fp, #16]
	str	ip, [sp, #204]
	mov	ip, r1, lsr #16
	str	ip, [sp, #208]
	mul	r3, lr, r3
	mov	r7, r9, asl #16
	ldr	lr, [sp, #208]
	mov	r1, r1, asl #16
	mov	r7, r7, lsr #16
	mov	r9, r9, lsr #16
	mov	r1, r1, lsr #16
	mul	lr, r9, lr
	mul	r9, r1, r9
	mul	r1, r7, r1
	str	r2, [sp, #196]
	mov	r2, r4, asl #16
	mov	r4, r4, lsr #16
	str	r4, [sp, #4]
	ldr	r4, [sp, #180]
	mov	ip, r4, asl #16
	ldr	r4, [sp, #4]
	str	r0, [sp, #200]
	mov	r2, r2, lsr #16
	mov	r0, sl, asl #16
	add	sl, r4, sl, lsr #16
	str	sl, [sp, #4]
	add	r2, r2, r5, lsr #16
	mov	r0, r0, lsr #16
	add	r2, r2, r0
	ldr	r0, [sp, #4]
	mov	ip, ip, lsr #16
	add	r4, r0, ip
	mov	r5, r5, asl #16
	add	r4, r4, r2, lsr #16
	str	r1, [sp, #212]
	mov	r5, r5, lsr #16
	ldr	r1, [sp, #180]
	orr	r5, r5, r2, asl #16
	str	r3, [sp, #192]
	ldr	r2, [sp, #232]
	mov	r3, r4, lsr #16
	add	r3, r3, r1, lsr #16
	ldr	r0, [sp, #332]
	orr	r4, r4, r3, asl #16
	str	lr, [sp, #220]
	ldr	r3, [sp, #100]
	adds	lr, r2, r5
	movcc	r2, #0
	movcs	r2, #1
	cmp	r5, lr
	orrhi	r2, r2, #1
	add	ip, r4, r0
	ldr	r3, [r3, #8]
	add	ip, ip, r2
	cmp	r4, ip
	cmpls	r0, ip
	ldr	sl, [sp, #208]
	str	r9, [sp, #216]
	str	r3, [sp, #32]
	ldr	r9, [sp, #188]
	ldr	r4, [sp, #100]
	ldr	r5, [sp, #184]
	mul	sl, r7, sl
	ldr	r4, [r4, #4]
	ldr	r7, [sp, #328]
	mov	r2, r9, asl #16
	ldr	r9, [sp, #32]
	mov	r1, r6, asl #16
	mov	r6, r6, lsr #16
	str	r4, [sp, #36]
	movls	r0, #0
	movhi	r0, #1
	mov	r3, r5, asl #16
	add	r6, r6, r5, lsr #16
	add	r5, r9, r7
	add	r5, r5, r0
	ldr	r4, [sp, #324]
	ldr	r0, [sp, #36]
	mov	r1, r1, lsr #16
	cmp	r9, r5
	cmpls	r7, r5
	add	r1, r1, r8, lsr #16
	mov	r3, r3, lsr #16
	mov	r2, r2, lsr #16
	mov	r8, r8, asl #16
	add	r1, r1, r3
	movls	r7, #0
	movhi	r7, #1
	add	r9, r0, r4
	add	r6, r6, r2
	mov	r8, r8, lsr #16
	add	r9, r9, r7
	orr	r8, r8, r1, asl #16
	add	r6, r6, r1, lsr #16
	ldr	r1, [sp, #188]
	cmp	r0, r9
	cmpls	r4, r9
	mov	r3, r6, lsr #16
	movls	r4, #0
	movhi	r4, #1
	add	r3, r3, r1, lsr #16
	adds	lr, r8, lr
	orr	r6, r6, r3, asl #16
	str	r4, [sp, #112]
	movcc	r2, #0
	movcs	r2, #1
	ldr	r4, [sp, #196]
	cmp	r8, lr
	orrhi	r2, r2, #1
	str	lr, [sp, #236]
	add	r7, r6, ip
	ldr	lr, [sp, #204]
	add	r7, r7, r2
	ldr	r8, [sp, #200]
	mov	r1, r4, lsr #16
	mov	r3, r4, asl #16
	ldr	r4, [sp, #32]
	cmp	r6, r7
	cmpls	ip, r7
	mov	r0, lr, asl #16
	movls	ip, #0
	movhi	ip, #1
	add	lr, r1, r8, lsr #16
	add	r6, r4, r5
	ldr	r1, [sp, #192]
	mov	r2, r8, asl #16
	mov	r0, r0, lsr #16
	ldr	r8, [sp, #192]
	add	r6, r6, ip
	ldr	r4, [sp, #220]
	add	ip, lr, r0
	mov	r3, r3, lsr #16
	ldr	r0, [sp, #216]
	add	r3, r3, r1, lsr #16
	mov	r2, r2, lsr #16
	mov	lr, r8, asl #16
	ldr	r8, [sp, #32]
	add	r3, r3, r2
	mov	r2, r0, asl #16
	mov	r0, r4, asl #16
	ldr	r4, [sp, #216]
	cmp	r8, r6
	cmpls	r5, r6
	mov	r1, sl, asl #16
	add	r8, ip, r3, lsr #16
	mov	sl, sl, lsr #16
	ldr	ip, [sp, #212]
	add	sl, sl, r4, lsr #16
	mov	r0, r0, lsr #16
	mov	r1, r1, lsr #16
	add	r1, r1, ip, lsr #16
	add	sl, sl, r0
	ldr	ip, [sp, #36]
	ldr	r0, [sp, #204]
	mov	lr, lr, lsr #16
	orr	lr, lr, r3, asl #16
	mov	r3, r8, lsr #16
	movls	r5, #0
	movhi	r5, #1
	add	r4, ip, r9
	add	r3, r3, r0, lsr #16
	ldr	r0, [sp, #212]
	add	r4, r4, r5
	mov	r2, r2, lsr #16
	add	r1, r1, r2
	cmp	ip, r4
	cmpls	r9, r4
	ldr	r2, [sp, #236]
	mov	ip, r0, asl #16
	mov	ip, ip, lsr #16
	movls	r9, #0
	movhi	r9, #1
	add	sl, sl, r1, lsr #16
	adds	r5, lr, r2
	orr	ip, ip, r1, asl #16
	ldr	r1, [sp, #220]
	orr	r8, r8, r3, asl #16
	str	ip, [sp, #28]
	movcc	r2, #0
	movcs	r2, #1
	mov	r3, sl, lsr #16
	cmp	lr, r5
	orrhi	r2, r2, #1
	add	r3, r3, r1, lsr #16
	ldr	lr, [sp, #100]
	ldr	r1, [sp, #28]
	ldr	ip, [lr, #0]
	add	r0, r8, r7
	add	lr, r1, r5
	cmp	r1, lr
	cmpls	r5, lr
	add	r0, r0, r2
	orr	sl, sl, r3, asl #16
	ldr	r5, [sp, #32]
	movls	r1, #0
	movhi	r1, #1
	cmp	r8, r0
	cmpls	r7, r0
	add	r8, sl, r0
	add	r8, r8, r1
	movls	r7, #0
	movhi	r7, #1
	add	r2, r5, r6
	add	r2, r2, r7
	cmp	sl, r8
	cmpls	r0, r8
	ldr	r3, [sp, #320]
	ldr	r1, [sp, #112]
	movls	r0, #0
	movhi	r0, #1
	cmp	r5, r2
	cmpls	r6, r2
	ldr	r5, [sp, #36]
	add	r3, ip, r3
	add	r3, r3, r1
	add	r1, r5, r4
	ldr	r5, [sp, #32]
	movls	r6, #0
	movhi	r6, #1
	add	r7, r5, r2
	add	r1, r1, r6
	add	r7, r7, r0
	ldr	r6, [sp, #36]
	cmp	r5, r7
	cmpls	r2, r7
	add	r3, ip, r3
	movls	r2, #0
	movhi	r2, #1
	add	r5, r6, r1
	cmp	r6, r1
	cmpls	r4, r1
	add	r3, r3, r9
	add	r5, r5, r2
	movls	r4, #0
	movhi	r4, #1
	add	r3, ip, r3
	ldr	r9, [sp, #96]
	cmp	r6, r5
	cmpls	r1, r5
	add	r3, r3, r4
	movls	r1, #0
	movhi	r1, #1
	add	ip, ip, r3
	ldr	r4, [r9, #12]
	ldr	r3, [r9, #0]
	ldmib	r9, {r2, r6}	@ phole ldm
	add	ip, ip, r1
	ldr	r9, [sp, #100]
	ldr	r1, [sp, #28]
	str	r1, [r9, #16]
	ldr	r1, [sp, #80]
	mov	r0, #20
	str	ip, [r1, #0]
	str	r3, [sp, #304]
	str	r2, [sp, #308]
	b	.L127
.L128:
	.align	2
.L126:
	.word	.LANCHOR0+20
.L127:
	str	r6, [sp, #312]
	mov	r2, #0
	str	sl, [r9, #12]
	stmib	r1, {r5, r7, r8, lr}	@ phole stm
	str	r2, [sp, #300]
	str	r4, [sp, #316]
	bl	malloc
	ldr	r5, [sp, #92]
	add	r2, r5, #12
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r1, [sp, #312]
	add	r7, r4, r3
	cmp	r4, r7
	cmpls	r3, r7
	movls	r3, #0
	movhi	r3, #1
	add	r4, r1, r2
	ldr	ip, [r5, #8]
	add	r4, r4, r3
	ldr	r5, [sp, #308]
	cmp	r1, r4
	cmpls	r2, r4
	ldr	r6, [sp, #92]
	movls	r2, #0
	movhi	r2, #1
	add	r1, r5, ip
	mov	r9, r0
	add	r1, r1, r2
	ldr	r0, [r6, #4]
	ldr	r6, [sp, #304]
	ldr	sl, [sp, #92]
	cmp	r5, r1
	cmpls	ip, r1
	movls	ip, #0
	movhi	ip, #1
	add	r2, r6, r0
	ldr	r3, [sl, #0]
	ldr	r8, [sp, #300]
	add	r2, r2, ip
	cmp	r6, r2
	cmpls	r0, r2
	movls	r0, #0
	movhi	r0, #1
	add	r3, r8, r3
	add	r3, r3, r0
	str	r3, [sp, #284]
	str	r2, [sp, #288]
	str	r1, [sp, #292]
	mov	ip, #0
	str	r8, [r9, #0]
	mov	r0, #20
	str	r7, [sl, #16]
	str	r4, [sl, #12]
	str	r1, [sl, #8]
	str	r2, [sl, #4]
	str	r3, [sl, #0]
	str	r3, [r9, #4]
	str	r2, [r9, #8]
	str	r1, [r9, #12]
	str	r4, [r9, #16]
	str	ip, [sp, #280]
	str	r4, [sp, #296]
	bl	malloc
	ldr	lr, [sp, #88]
	mov	r7, r0
	ldr	r1, [lr, #16]
	ldr	r0, [sp, #88]
	ldr	sl, [sp, #292]
	ldr	r2, [r0, #12]
	add	lr, r4, r1
	cmp	lr, r4
	movcs	r3, #0
	movcc	r3, #1
	cmp	r1, lr
	orrhi	r3, r3, #1
	add	r5, sl, r2
	ldr	r0, [r0, #8]
	ldr	r8, [sp, #288]
	add	r5, r5, r3
	cmp	sl, r5
	cmpls	r2, r5
	ldr	r3, [sp, #88]
	movls	r2, #0
	movhi	r2, #1
	add	ip, r8, r0
	ldr	r1, [r3, #4]
	ldr	r6, [sp, #284]
	add	ip, ip, r2
	cmp	r8, ip
	cmpls	r0, ip
	movls	r0, #0
	movhi	r0, #1
	add	r2, r6, r1
	ldr	r3, [r3, #0]
	add	r2, r2, r0
	ldr	r0, [sp, #280]
	cmp	r6, r2
	cmpls	r1, r2
	str	r4, [r7, #16]
	movls	r1, #0
	movhi	r1, #1
	add	r3, r0, r3
	ldr	r4, [sp, #88]
	add	r3, r3, r1
	ldr	r1, [sp, #280]
	str	r3, [sp, #264]
	str	r2, [sp, #268]
	str	ip, [sp, #272]
	mov	r0, #20
	stmia	r7, {r1, r6, r8, sl}	@ phole stm
	mov	r6, #0
	str	lr, [r4, #16]
	str	r5, [r4, #12]
	stmib	r4, {r2, ip}	@ phole stm
	str	r3, [r4, #0]
	str	r3, [r9, #4]
	str	r2, [r9, #8]
	str	ip, [r9, #12]
	str	r5, [r9, #16]
	str	r6, [sp, #260]
	str	r5, [sp, #276]
	bl	malloc
	ldr	r8, [sp, #84]
	ldr	r1, [r8, #16]
	ldr	r2, [r8, #12]
	ldr	sl, [sp, #272]
	add	lr, r1, r5
	cmp	lr, r5
	movcs	r3, #0
	movcc	r3, #1
	ldr	ip, [sp, #84]
	cmp	r1, lr
	orrhi	r3, r3, #1
	add	r4, r2, sl
	ldr	r8, [sp, #268]
	add	r4, r4, r3
	mov	r7, r0
	ldr	r0, [ip, #8]
	cmp	sl, r4
	cmpls	r2, r4
	ldr	r1, [ip, #4]
	movls	r2, #0
	movhi	r2, #1
	add	ip, r0, r8
	ldr	r6, [sp, #264]
	add	ip, ip, r2
	ldr	r2, [sp, #84]
	cmp	r8, ip
	cmpls	r0, ip
	ldr	r3, [r2, #0]
	movls	r0, #0
	movhi	r0, #1
	add	r2, r1, r6
	add	r2, r2, r0
	ldr	r0, [sp, #260]
	cmp	r6, r2
	cmpls	r1, r2
	movls	r1, #0
	movhi	r1, #1
	add	r3, r0, r3
	str	r5, [r7, #16]
	add	r3, r3, r1
	mov	r1, #0
	str	r1, [sp, #240]
	str	r3, [sp, #244]
	str	r2, [sp, #248]
	str	ip, [sp, #252]
	ldr	r5, [sp, #260]
	str	r6, [r7, #4]
	ldr	r6, [sp, #84]
	str	r5, [r7, #0]
	str	r8, [r7, #8]
	str	sl, [r7, #12]
	mov	r0, #20
	str	lr, [r6, #16]
	str	r4, [r6, #12]
	stmib	r6, {r2, ip}	@ phole stm
	str	r3, [r6, #0]
	str	r3, [r9, #4]
	str	r2, [r9, #8]
	str	ip, [r9, #12]
	str	r4, [r9, #16]
	str	r4, [sp, #256]
	bl	malloc
	ldr	r8, [sp, #80]
	ldr	r3, [r8, #16]
	ldr	lr, [sp, #252]
	ldr	r1, [r8, #12]
	add	sl, r4, r3
	cmp	r4, sl
	cmpls	r3, sl
	ldr	ip, [sp, #80]
	add	r5, lr, r1
	movls	r3, #0
	movhi	r3, #1
	ldr	r8, [sp, #248]
	mov	r7, r0
	add	r5, r5, r3
	ldr	r0, [ip, #8]
	cmp	lr, r5
	cmpls	r1, r5
	ldr	r2, [ip, #4]
	movls	r1, #0
	movhi	r1, #1
	add	ip, r8, r0
	ldr	r6, [sp, #244]
	add	ip, ip, r1
	ldr	r1, [sp, #80]
	cmp	r8, ip
	cmpls	r0, ip
	ldr	r3, [r1, #0]
	movls	r0, #0
	movhi	r0, #1
	add	r1, r2, r6
	add	r1, r1, r0
	str	sl, [sp, #228]
	ldr	sl, [sp, #240]
	cmp	r6, r1
	cmpls	r2, r1
	movls	r2, #0
	movhi	r2, #1
	add	r3, sl, r3
	add	r3, r3, r2
	ldr	r2, [sp, #80]
	str	r4, [r7, #16]
	str	r3, [r2, #0]
	ldr	r3, [sp, #228]
	str	lr, [r7, #12]
	str	sl, [r7, #0]
	stmib	r7, {r6, r8}	@ phole stm
	mov	r0, r9
	str	ip, [r2, #8]
	str	r3, [r2, #16]
	str	r5, [r2, #12]
	str	r1, [r2, #4]
	add	r4, sp, #84
	ldmia	r4, {r4, r8, r9, sl}	@ phole ldm
	ldr	r5, [r4, #16]
	ldr	r6, [r8, #16]
	ldr	r7, [r9, #16]
	ldr	r4, [sl, #16]
	bl	free
	ldr	r0, [sp, #96]
	bl	free
	ldr	r0, [sp, #92]
	bl	free
	ldr	r0, [sp, #88]
	bl	free
	ldr	r0, [sp, #84]
	bl	free
	ldr	r0, [sp, #80]
	bl	free
	ldr	ip, [sp, #228]
	str	r4, [fp, #16]
	str	ip, [fp, #0]
	stmib	fp, {r5, r6, r7}	@ phole stm
	b	.L125
	.size	mul_modifying, .-mul_modifying
	.align	2
	.global	mod_uint160
	.type	mod_uint160, %function
mod_uint160:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #76
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, [r1, #0]
	ldr	r2, [r0, #0]
	cmp	r3, r2
	mov	r5, r0
	str	r1, [sp, #0]
	bne	.L130
	ldr	r3, [r1, #4]
	ldr	r2, [r0, #4]
	cmp	r3, r2
	bne	.L130
	ldr	r3, [r1, #8]
	ldr	r2, [r0, #8]
	cmp	r3, r2
	bne	.L130
	ldr	r3, [r1, #12]
	ldr	r2, [r0, #12]
	cmp	r3, r2
	bne	.L130
	ldr	r0, [sp, #0]
	ldr	r3, [r5, #16]
	ldr	r2, [r0, #16]
	cmp	r2, r3
	movls	r6, #0
	movhi	r6, #1
.L132:
	cmp	r6, #0
	beq	.L173
.L133:
	mov	r0, r5
	add	sp, sp, #76
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L173:
	mov	r4, #1
	mov	r0, #20
	str	r6, [sp, #32]
	str	r6, [sp, #36]
	str	r6, [sp, #40]
	str	r6, [sp, #44]
	str	r4, [sp, #48]
	bl	malloc
	ldr	r1, [sp, #0]
	ldr	r2, [sp, #32]
	ldr	r3, [r1, #0]
	add	r1, sp, #36
	ldmia	r1, {r1, ip, lr}	@ phole ldm
	cmp	r3, r2
	str	r4, [r0, #16]
	str	r2, [r0, #0]
	stmib	r0, {r1, ip, lr}	@ phole stm
	bne	.L134
	ldr	r2, [sp, #0]
	ldr	r3, [r2, #4]
	cmp	r3, r1
	bne	.L134
	ldr	r3, [r2, #8]
	cmp	r3, ip
	bne	.L134
	ldr	r3, [r2, #12]
	cmp	r3, lr
	bne	.L134
	ldr	r3, [r2, #16]
	cmp	r3, r4
	bne	.L134
	mov	r0, #20
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r6, [sp, #20]
	str	r6, [sp, #24]
	str	r6, [sp, #28]
	bl	malloc
	ldr	r3, [sp, #12]
	str	r3, [r0, #0]
	ldr	r2, [sp, #16]
	str	r2, [r0, #4]
	ldr	r3, [sp, #20]
	str	r3, [r0, #8]
	ldr	r2, [sp, #24]
	mov	r5, r0
	str	r6, [r0, #16]
	str	r2, [r0, #12]
	b	.L133
.L134:
	mov	r0, #20
	bl	malloc
	ldr	r3, [r5, #0]
	str	r3, [r0, #0]
	ldr	r2, [r5, #4]
	str	r2, [r0, #4]
	ldr	r3, [r5, #8]
	str	r3, [r0, #8]
	ldr	r2, [r5, #12]
	str	r2, [r0, #12]
	ldr	r3, [r5, #16]
	mov	fp, r0
	mov	r0, #20
	str	r3, [fp, #16]
	bl	malloc
	ldr	r8, [sp, #0]
	ldr	r3, [r8, #0]
	ldmib	r8, {r2, ip}	@ phole ldm
	add	r4, r8, #12
	ldmia	r4, {r4, r5}	@ phole ldm
	mov	r6, r0
	mov	r1, #1
	str	r3, [r6, #0]
	stmib	r6, {r2, ip}	@ phole stm
	str	r4, [r6, #12]
	str	r5, [r6, #16]
	mov	r0, fp
	bl	rshift_uint160
	ldr	ip, .L179
	mov	r5, r0
	ldmia	ip!, {r0, r1, r2, r3}
	add	r4, sp, #52
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [ip, #0]
	mov	r0, #20
	str	r3, [r4, #0]
	bl	malloc
	ldr	r3, [sp, #52]
	ldr	r7, [sp, #68]
	str	r3, [r0, #0]
	ldr	r2, [sp, #56]
	str	r2, [r0, #4]
	ldr	r3, [sp, #60]
	str	r3, [r0, #8]
	ldr	r2, [sp, #64]
	str	r7, [r0, #16]
	str	r2, [r0, #12]
	mov	r4, r0
	mov	r1, #0
.L167:
	cmp	r1, #3
	bhi	.L174
.L140:
	ldr	r3, [r5, r1, asl #2]
	ldr	r2, [r6, r1, asl #2]
	cmp	r2, r3
	addeq	r3, r1, #1
	andeq	r1, r3, #255
	beq	.L167
.L142:
	ldr	sl, [r6, #0]
	ldr	r2, [r5, #0]
	cmp	sl, r2
	mov	r0, sl
	bne	.L137
	ldr	r3, [r6, #4]
	ldr	r2, [r5, #4]
	cmp	r3, r2
	bne	.L138
	ldr	r3, [r6, #8]
	ldr	r2, [r5, #8]
	cmp	r3, r2
	bne	.L138
	ldr	r3, [r6, #12]
	ldr	r2, [r5, #12]
	cmp	r3, r2
	bne	.L138
	ldr	r2, [r6, #16]
	ldr	r3, [r5, #16]
	cmp	r2, r3
	movls	r2, #0
	movhi	r2, #1
.L143:
	cmp	r2, #0
	bne	.L141
	ldr	r3, [r4, #0]
	cmp	r3, sl
	bne	.L144
	ldr	r9, [r6, #4]
	ldr	r1, [r4, #4]
	cmp	r9, r1
	bne	.L145
	ldr	r2, [r6, #8]
	ldr	r3, [r4, #8]
	cmp	r2, r3
	bne	.L145
	ldr	r2, [r6, #12]
	ldr	r3, [r4, #12]
	cmp	r2, r3
	bne	.L145
	ldr	r3, [r6, #16]
	cmp	r7, r3
	bne	.L145
.L141:
	mov	r0, r4
	bl	free
	mov	r0, r5
	bl	free
	add	r7, r6, #8
	ldmia	r7, {r7, r8}	@ phole ldm
	ldr	r9, [r6, #4]
	ldr	r3, [r6, #16]
	ldr	sl, [r6, #0]
	mov	r1, r7, lsr #1
	mov	r3, r3, lsr #1
	mov	r2, r8, lsr #1
	mov	r0, r9, lsr #1
	orr	r3, r3, r8, asl #31
	orr	r8, r2, r7, asl #31
	orr	r7, r1, r9, asl #31
	orr	r9, r0, sl, asl #31
	mov	sl, sl, lsr #1
	str	r3, [r6, #16]
	str	r8, [r6, #12]
	str	r7, [r6, #8]
	str	r9, [r6, #4]
	str	sl, [r6, #0]
	mov	r1, #0
.L170:
	cmp	r1, #3
	bls	.L158
	ldr	r1, [sp, #0]
	ldr	r2, [r6, #16]
	ldr	r3, [r1, #16]
	cmp	r2, r3
	movls	r4, #0
	movhi	r4, #1
	cmp	r4, #0
	beq	.L159
.L176:
	ldr	r2, [r6, #16]
	str	r2, [sp, #4]
	mov	r1, #0
.L171:
	cmp	r1, #3
	bls	.L153
	ldr	r3, [fp, #16]
	ldr	r0, [sp, #4]
	cmp	r3, r0
	movls	ip, #0
	movhi	ip, #1
	cmp	ip, #0
	beq	.L154
.L175:
	ldr	r2, [fp, #16]
	ldr	ip, [fp, #12]
	ldr	r1, [sp, #4]
	ldr	lr, [fp, #8]
	rsb	r5, r1, r2
	ldr	r4, [fp, #4]
	rsb	r0, r8, ip
	cmp	r5, r2
	subhi	r0, r0, #1
	ldr	r3, [fp, #0]
	rsb	r1, r7, lr
	cmp	ip, r0
	subcc	r1, r1, #1
	rsb	r2, r9, r4
	cmp	lr, r1
	subcc	r2, r2, #1
	rsb	r3, sl, r3
	cmp	r4, r2
	subcc	r3, r3, #1
	str	r3, [fp, #0]
	str	r5, [fp, #16]
	str	r0, [fp, #12]
	str	r2, [fp, #4]
	str	r1, [fp, #8]
	mov	r1, #0
.L153:
	ldr	r2, [fp, r1, asl #2]
	ldr	r3, [r6, r1, asl #2]
	cmp	r2, r3
	beq	.L151
	movls	ip, #0
	movhi	ip, #1
	cmp	ip, #0
	bne	.L175
.L154:
	ldr	r2, [sp, #4]
	mov	r1, r7, lsr #1
	mov	r3, r2, lsr #1
	mov	r0, r9, lsr #1
	mov	r2, r8, lsr #1
	orr	r3, r3, r8, asl #31
	orr	r8, r2, r7, asl #31
	orr	r7, r1, r9, asl #31
	orr	r9, r0, sl, asl #31
	mov	sl, sl, lsr #1
	str	r3, [r6, #16]
	str	r8, [r6, #12]
	str	r7, [r6, #8]
	str	r9, [r6, #4]
	str	sl, [r6, #0]
	mov	r1, ip
.L158:
	ldr	r0, [sp, #0]
	ldr	r2, [r6, r1, asl #2]
	ldr	r3, [r0, r1, asl #2]
	cmp	r2, r3
	beq	.L156
	movls	r4, #0
	movhi	r4, #1
	cmp	r4, #0
	bne	.L176
.L159:
	mov	r0, r6
	bl	free
	ldr	r3, [sp, #0]
	ldr	lr, [fp, #0]
	ldr	r7, [r3, #0]
	mov	r1, r4
.L172:
	cmp	r1, #3
	bls	.L163
	ldr	r0, [sp, #0]
	ldr	r2, [fp, #16]
	ldr	r3, [r0, #16]
	cmp	r2, r3
	movls	r0, #0
	movhi	r0, #1
	cmp	r0, #0
	beq	.L164
.L177:
	ldr	r1, [sp, #0]
	ldr	r3, [fp, #16]
	add	r0, r1, #12
	ldmia	r0, {r0, ip}	@ phole ldm
	ldr	r6, [fp, #12]
	ldr	r8, [sp, #0]
	ldr	r1, [r1, #8]
	ldr	r5, [fp, #8]
	ldr	r2, [r8, #4]
	rsb	ip, ip, r3
	ldr	r4, [fp, #4]
	rsb	r0, r0, r6
	cmp	r3, ip
	subcc	r0, r0, #1
	rsb	r1, r1, r5
	cmp	r6, r0
	subcc	r1, r1, #1
	rsb	r2, r2, r4
	cmp	r5, r1
	subcc	r2, r2, #1
	rsb	r3, r7, lr
	cmp	r4, r2
	movcs	lr, r3
	subcc	lr, r3, #1
	str	ip, [fp, #16]
	str	r0, [fp, #12]
	str	r2, [fp, #4]
	str	lr, [fp, #0]
	str	r1, [fp, #8]
	mov	r1, #0
.L163:
	ldr	r8, [sp, #0]
	ldr	r2, [fp, r1, asl #2]
	ldr	r3, [r8, r1, asl #2]
	cmp	r2, r3
	beq	.L161
	movls	r0, #0
	movhi	r0, #1
	cmp	r0, #0
	bne	.L177
.L164:
	cmp	lr, r7
	bne	.L165
	ldr	r1, [sp, #0]
	ldr	r2, [fp, #4]
	ldr	r3, [r1, #4]
	cmp	r2, r3
	bne	.L165
	ldr	r2, [fp, #8]
	ldr	r3, [r1, #8]
	cmp	r2, r3
	bne	.L165
	ldr	r2, [fp, #12]
	ldr	r3, [r1, #12]
	cmp	r2, r3
	bne	.L165
	ldr	r2, [r1, #16]
	ldr	r3, [fp, #16]
	cmp	r3, r2
	beq	.L178
.L165:
	mov	r5, fp
	b	.L133
.L151:
	add	r3, r1, #1
	and	r1, r3, #255
	b	.L171
.L174:
	ldr	r2, [r6, #16]
	ldr	r3, [r5, #16]
	cmp	r2, r3
	beq	.L141
	b	.L142
.L156:
	add	r3, r1, #1
	and	r1, r3, #255
	b	.L170
.L178:
	add	sp, sp, #76
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	cast_to_uint160
.L161:
	add	r3, r1, #1
	and	r1, r3, #255
	b	.L172
.L144:
	cmp	r0, r3
	movls	lr, #0
	movhi	lr, #1
.L148:
	cmp	lr, #0
	bne	.L141
	add	r0, r6, #8
	ldmia	r0, {r0, r1, ip}	@ phole ldm
	mov	ip, ip, asl #1
	ldr	r2, [r6, #4]
	mov	r1, r1, asl #1
	orr	r1, r1, ip, lsr #31
	mov	r0, r0, asl #1
	orr	r0, r0, r1, lsr #31
	mov	r2, r2, asl #1
	orr	r2, r2, r0, lsr #31
	mov	r3, sl, asl #1
	orr	r3, r3, r2, lsr #31
	str	r1, [r6, #12]
	str	r3, [r6, #0]
	str	ip, [r6, #16]
	str	r0, [r6, #8]
	str	r2, [r6, #4]
	mov	r1, lr
	b	.L140
.L137:
	mov	r3, sl
.L138:
	cmp	r3, r2
	movls	r2, #0
	movhi	r2, #1
	b	.L143
.L130:
	cmp	r3, r2
	movls	r6, #0
	movhi	r6, #1
	b	.L132
.L145:
	cmp	r9, r1
	mov	r0, r9
	mov	r3, r1
	bne	.L144
	ldr	r0, [r6, #8]
	ldr	r3, [r4, #8]
	cmp	r0, r3
	bne	.L144
	ldr	r0, [r6, #12]
	ldr	r3, [r4, #12]
	cmp	r0, r3
	bne	.L144
	ldr	r3, [r6, #16]
	cmp	r3, r7
	movls	lr, #0
	movhi	lr, #1
	b	.L148
.L180:
	.align	2
.L179:
	.word	.LANCHOR0+40
	.size	mod_uint160, .-mod_uint160
	.align	2
	.global	mod_modifying
	.type	mod_modifying, %function
mod_modifying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #52
	push	{lr}
	bl	__gnu_mcount_nc
	ldr	r3, [r1, #0]
	ldr	r2, [r0, #0]
	cmp	r3, r2
	mov	r5, r0
	str	r1, [sp, #0]
	bne	.L182
	ldr	r3, [r1, #4]
	ldr	r2, [r0, #4]
	cmp	r3, r2
	bne	.L182
	ldr	r3, [r1, #8]
	ldr	r2, [r0, #8]
	cmp	r3, r2
	bne	.L182
	ldr	r3, [r1, #12]
	ldr	r2, [r0, #12]
	cmp	r3, r2
	bne	.L182
	ldr	r0, [sp, #0]
	ldr	r3, [r5, #16]
	ldr	r2, [r0, #16]
	cmp	r2, r3
	movls	r6, #0
	movhi	r6, #1
.L184:
	cmp	r6, #0
	beq	.L224
.L217:
	add	sp, sp, #52
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L224:
	mov	r4, #1
	mov	r0, #20
	str	r6, [sp, #8]
	str	r6, [sp, #12]
	str	r6, [sp, #16]
	str	r6, [sp, #20]
	str	r4, [sp, #24]
	bl	malloc
	ldr	r1, [sp, #0]
	ldr	r2, [sp, #8]
	ldr	r3, [r1, #0]
	add	r1, sp, #12
	ldmia	r1, {r1, ip, lr}	@ phole ldm
	cmp	r3, r2
	str	r4, [r0, #16]
	str	r2, [r0, #0]
	stmib	r0, {r1, ip, lr}	@ phole stm
	bne	.L186
	ldr	r2, [sp, #0]
	ldr	r3, [r2, #4]
	cmp	r3, r1
	bne	.L186
	ldr	r3, [r2, #8]
	cmp	r3, ip
	bne	.L186
	ldr	r3, [r2, #12]
	cmp	r3, lr
	bne	.L186
	ldr	r3, [r2, #16]
	cmp	r3, r4
	bne	.L186
	str	r6, [r5, #16]
	str	r6, [r5, #0]
	str	r6, [r5, #4]
	str	r6, [r5, #8]
	str	r6, [r5, #12]
	b	.L217
.L182:
	cmp	r3, r2
	movls	r6, #0
	movhi	r6, #1
	b	.L184
.L186:
	mov	r0, #20
	bl	malloc
	ldr	ip, [sp, #0]
	mov	r6, r0
	ldr	r0, [sp, #0]
	ldr	r3, [ip, #0]
	ldr	r2, [ip, #4]
	add	r4, r0, #12
	ldmia	r4, {r4, lr}	@ phole ldm
	ldr	ip, [ip, #8]
	mov	r1, #1
	str	r3, [r6, #0]
	stmib	r6, {r2, ip}	@ phole stm
	str	r4, [r6, #12]
	str	lr, [r6, #16]
	mov	r0, r5
	bl	rshift_uint160
	ldr	ip, .L229
	mov	r7, r0
	ldmia	ip!, {r0, r1, r2, r3}
	add	r4, sp, #28
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [ip, #0]
	mov	r0, #20
	str	r3, [r4, #0]
	bl	malloc
	ldr	r3, [sp, #28]
	ldr	r8, [sp, #44]
	str	r3, [r0, #0]
	ldr	r2, [sp, #32]
	str	r2, [r0, #4]
	ldr	r3, [sp, #36]
	str	r3, [r0, #8]
	ldr	r2, [sp, #40]
	str	r8, [r0, #16]
	str	r2, [r0, #12]
	mov	r4, r0
	mov	r1, #0
.L218:
	cmp	r1, #3
	bhi	.L225
.L192:
	ldr	r3, [r7, r1, asl #2]
	ldr	r2, [r6, r1, asl #2]
	cmp	r2, r3
	addeq	r3, r1, #1
	andeq	r1, r3, #255
	beq	.L218
.L194:
	ldr	sl, [r6, #0]
	ldr	r2, [r7, #0]
	cmp	sl, r2
	mov	r0, sl
	bne	.L189
	ldr	r3, [r6, #4]
	ldr	r2, [r7, #4]
	cmp	r3, r2
	bne	.L190
	ldr	r3, [r6, #8]
	ldr	r2, [r7, #8]
	cmp	r3, r2
	bne	.L190
	ldr	r3, [r6, #12]
	ldr	r2, [r7, #12]
	cmp	r3, r2
	bne	.L190
	ldr	r2, [r6, #16]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	movls	r2, #0
	movhi	r2, #1
.L195:
	cmp	r2, #0
	bne	.L193
	ldr	r3, [r4, #0]
	cmp	sl, r3
	bne	.L196
	ldr	r9, [r6, #4]
	ldr	r1, [r4, #4]
	cmp	r9, r1
	bne	.L197
	ldr	r2, [r6, #8]
	ldr	r3, [r4, #8]
	cmp	r2, r3
	bne	.L197
	ldr	r2, [r6, #12]
	ldr	r3, [r4, #12]
	cmp	r2, r3
	bne	.L197
	ldr	r3, [r6, #16]
	cmp	r8, r3
	bne	.L197
.L193:
	mov	r0, r4
	bl	free
	mov	r0, r7
	bl	free
	add	r7, r6, #8
	ldmia	r7, {r7, r8}	@ phole ldm
	ldr	r9, [r6, #4]
	ldr	r3, [r6, #16]
	ldr	sl, [r6, #0]
	mov	r1, r7, lsr #1
	mov	r3, r3, lsr #1
	mov	r2, r8, lsr #1
	mov	r0, r9, lsr #1
	orr	r3, r3, r8, asl #31
	orr	r8, r2, r7, asl #31
	orr	r7, r1, r9, asl #31
	orr	r9, r0, sl, asl #31
	mov	sl, sl, lsr #1
	str	r3, [r6, #16]
	str	r8, [r6, #12]
	str	r7, [r6, #8]
	str	r9, [r6, #4]
	str	sl, [r6, #0]
	mov	r1, #0
.L221:
	cmp	r1, #3
	bls	.L210
	ldr	r0, [sp, #0]
	ldr	r2, [r6, #16]
	ldr	r3, [r0, #16]
	cmp	r2, r3
	movls	r4, #0
	movhi	r4, #1
	cmp	r4, #0
	beq	.L211
.L227:
	ldr	fp, [r6, #16]
	mov	r1, #0
.L222:
	cmp	r1, #3
	bls	.L205
	ldr	r3, [r5, #16]
	cmp	r3, fp
	movls	ip, #0
	movhi	ip, #1
	cmp	ip, #0
	beq	.L206
.L226:
	ldr	r2, [r5, #16]
	ldr	ip, [r5, #12]
	ldr	lr, [r5, #8]
	rsb	r1, fp, r2
	ldr	r4, [r5, #4]
	rsb	r0, r8, ip
	cmp	r1, r2
	subhi	r0, r0, #1
	str	r1, [sp, #4]
	ldr	r3, [r5, #0]
	rsb	r1, r7, lr
	cmp	ip, r0
	subcc	r1, r1, #1
	rsb	r2, r9, r4
	cmp	lr, r1
	subcc	r2, r2, #1
	rsb	r3, sl, r3
	cmp	r4, r2
	subcc	r3, r3, #1
	str	r3, [r5, #0]
	ldr	r3, [sp, #4]
	str	r0, [r5, #12]
	str	r3, [r5, #16]
	str	r2, [r5, #4]
	str	r1, [r5, #8]
	mov	r1, #0
.L205:
	ldr	r2, [r5, r1, asl #2]
	ldr	r3, [r6, r1, asl #2]
	cmp	r2, r3
	beq	.L203
	movls	ip, #0
	movhi	ip, #1
	cmp	ip, #0
	bne	.L226
.L206:
	mov	r1, r7, lsr #1
	mov	r3, fp, lsr #1
	mov	r2, r8, lsr #1
	mov	r0, r9, lsr #1
	orr	r3, r3, r8, asl #31
	orr	r8, r2, r7, asl #31
	orr	r7, r1, r9, asl #31
	orr	r9, r0, sl, asl #31
	mov	sl, sl, lsr #1
	str	r3, [r6, #16]
	str	r8, [r6, #12]
	str	r7, [r6, #8]
	str	r9, [r6, #4]
	str	sl, [r6, #0]
	mov	r1, ip
.L210:
	ldr	ip, [sp, #0]
	ldr	r2, [r6, r1, asl #2]
	ldr	r3, [ip, r1, asl #2]
	cmp	r2, r3
	beq	.L208
	movls	r4, #0
	movhi	r4, #1
	cmp	r4, #0
	bne	.L227
.L211:
	mov	r0, r6
	bl	free
	ldr	lr, [r5, #0]
	mov	r1, r4
.L223:
	cmp	r1, #3
	bls	.L215
	ldr	r0, [sp, #0]
	ldr	r2, [r5, #16]
	ldr	r3, [r0, #16]
	cmp	r2, r3
	movls	r0, #0
	movhi	r0, #1
	cmp	r0, #0
	beq	.L216
.L228:
	ldr	r1, [sp, #0]
	ldr	r2, [r1, #16]
	ldr	r1, [r5, #16]
	rsb	r2, r2, r1
	str	r2, [r5, #16]
	ldr	ip, [sp, #0]
	ldr	r0, [r5, #12]
	ldr	r3, [ip, #12]
	rsb	r3, r3, r0
	cmp	r2, r1
	subhi	r3, r3, #1
	str	r3, [r5, #12]
	ldr	r2, [sp, #0]
	ldr	ip, [r5, #8]
	ldr	r1, [r2, #8]
	rsb	r1, r1, ip
	cmp	r0, r3
	subcc	r1, r1, #1
	str	r1, [r5, #8]
	ldr	r0, [r5, #4]
	mov	r3, r2
	ldr	r2, [r2, #4]
	rsb	r2, r2, r0
	cmp	ip, r1
	subcc	r2, r2, #1
	str	r2, [r5, #4]
	ldr	r3, [r3, #0]
	rsb	r3, r3, lr
	cmp	r0, r2
	movcs	lr, r3
	subcc	lr, r3, #1
	str	lr, [r5, #0]
	mov	r1, #0
.L215:
	ldr	ip, [sp, #0]
	ldr	r2, [r5, r1, asl #2]
	ldr	r3, [ip, r1, asl #2]
	cmp	r2, r3
	beq	.L213
	movls	r0, #0
	movhi	r0, #1
	cmp	r0, #0
	bne	.L228
.L216:
	ldr	r1, [sp, #0]
	ldr	r3, [r1, #0]
	cmp	lr, r3
	bne	.L217
	ldr	r2, [r5, #4]
	ldr	r3, [r1, #4]
	cmp	r2, r3
	bne	.L217
	ldr	r2, [r5, #8]
	ldr	r3, [r1, #8]
	cmp	r2, r3
	bne	.L217
	ldr	r2, [r5, #12]
	ldr	r3, [r1, #12]
	cmp	r2, r3
	bne	.L217
	ldr	r2, [r1, #16]
	ldr	r3, [r5, #16]
	cmp	r3, r2
	streq	r0, [r5, #16]
	streq	r0, [r5, #0]
	streq	r0, [r5, #4]
	streq	r0, [r5, #8]
	streq	r0, [r5, #12]
	b	.L217
.L203:
	add	r3, r1, #1
	and	r1, r3, #255
	b	.L222
.L225:
	ldr	r2, [r6, #16]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	beq	.L193
	b	.L194
.L208:
	add	r3, r1, #1
	and	r1, r3, #255
	b	.L221
.L213:
	add	r3, r1, #1
	and	r1, r3, #255
	b	.L223
.L189:
	mov	r3, sl
.L190:
	cmp	r3, r2
	movls	r2, #0
	movhi	r2, #1
	b	.L195
.L196:
	cmp	r0, r3
	movls	lr, #0
	movhi	lr, #1
.L200:
	cmp	lr, #0
	bne	.L193
	add	r0, r6, #8
	ldmia	r0, {r0, r1, ip}	@ phole ldm
	mov	ip, ip, asl #1
	ldr	r2, [r6, #4]
	mov	r1, r1, asl #1
	orr	r1, r1, ip, lsr #31
	mov	r0, r0, asl #1
	orr	r0, r0, r1, lsr #31
	mov	r2, r2, asl #1
	orr	r2, r2, r0, lsr #31
	mov	r3, sl, asl #1
	orr	r3, r3, r2, lsr #31
	str	r1, [r6, #12]
	str	r3, [r6, #0]
	str	ip, [r6, #16]
	str	r0, [r6, #8]
	str	r2, [r6, #4]
	mov	r1, lr
	b	.L192
.L197:
	cmp	r9, r1
	mov	r0, r9
	mov	r3, r1
	bne	.L196
	ldr	r0, [r6, #8]
	ldr	r3, [r4, #8]
	cmp	r0, r3
	bne	.L196
	ldr	r0, [r6, #12]
	ldr	r3, [r4, #12]
	cmp	r0, r3
	bne	.L196
	ldr	r3, [r6, #16]
	cmp	r3, r8
	movls	lr, #0
	movhi	lr, #1
	b	.L200
.L230:
	.align	2
.L229:
	.word	.LANCHOR0+60
	.size	mod_modifying, .-mod_modifying
	.section	.rodata
	.align	2
.LANCHOR0 = . + 0
	.type	C.7.1874, %object
	.size	C.7.1874, 20
C.7.1874:
	.space	20
	.type	C.17.1945, %object
	.size	C.17.1945, 20
C.17.1945:
	.space	20
	.type	C.30.2225, %object
	.size	C.30.2225, 20
C.30.2225:
	.word	2147483647
	.word	-1
	.word	-1
	.word	-1
	.word	-1
	.type	C.34.2260, %object
	.size	C.34.2260, 20
C.34.2260:
	.word	2147483647
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
