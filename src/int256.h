#include <stdarg.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

// FFFFFFFF FFFFFFFF FFFFFFFF FFFFFFFF
//   high     mid2     mid1     low
typedef struct uint256 {
	uint32_t blocks[8];
} uint256_t;

uint256_t * uint256_init(uint32_t blocks[8]);
uint256_t * cast_to_uint256(uint32_t x);
uint256_t * add_uint256(uint256_t * x, uint256_t * y);
uint256_t * sub_uint256(uint256_t * x, uint256_t * y);
uint256_t * mul_uint256(uint256_t * x, uint256_t * y);
uint256_t * rshift_uint256(uint256_t * x, uint8_t y);
uint256_t * lshift_uint256(uint256_t * x, uint8_t y);
uint256_t * and_uint256(uint256_t * x, uint256_t * y);
uint256_t * or_uint256(uint256_t * x, uint256_t * y);
uint256_t * xor_uint256(uint256_t * x, uint256_t * y);
uint256_t * mod_uint256(uint256_t * x, uint256_t * y);
uint8_t uint256_equal_to_zero(uint256_t * x);
uint8_t gt_uint256(uint256_t * x, uint256_t * y);
uint8_t gte_uint256(uint256_t * x, uint256_t * y);
uint8_t equal_uint256(uint256_t * x, uint256_t * y);
uint8_t get_bit(uint256_t * x, uint8_t offset);
void print_uint256(char * str, uint256_t * x);