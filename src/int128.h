#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

// FFFFFFFF FFFFFFFF FFFFFFFF FFFFFFFF
//   high     mid2     mid1     low
typedef struct uint128 {
	uint32_t low;
	uint32_t mid1;
	uint32_t mid2;
	uint32_t high;
} uint128_t;

uint128_t * uint128_init(uint32_t low, uint32_t mid1, uint32_t mid2, uint32_t high);
uint128_t * cast_to_uint128(uint32_t x);
uint128_t * add_uint128(uint128_t * x, uint128_t * y);
uint128_t * sub_uint128(uint128_t * x, uint128_t * y);
uint128_t * mul_uint128(uint128_t * x, uint128_t * y);
uint128_t * rshift_uint128(uint128_t * x, uint8_t y);
uint128_t * lshift_uint128(uint128_t * x, uint8_t y);
uint128_t * and_uint128(uint128_t * x, uint128_t * y);
uint128_t * or_uint128(uint128_t * x, uint128_t * y);
uint128_t * xor_uint128(uint128_t * x, uint128_t * y);
uint128_t * mod_uint128(uint128_t * x, uint128_t * y);
uint8_t uint128_equal_to_zero(uint128_t * x);
uint8_t gt_uint128(uint128_t * x, uint128_t * y);
uint8_t gte_uint128(uint128_t * x, uint128_t * y);
uint8_t equal_uint128(uint128_t * x, uint128_t * y);
uint8_t get_bit(uint128_t * x, uint8_t offset);
void print_uint128(char * str, uint128_t * x);