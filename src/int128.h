#include <stdint.h>

typedef struct uint128 {
	uint32_t low;
	uint32_t mid1;
	uint32_t mid2;
	uint32_t high;
} uint128_t;

uint128_t uint128_init(uint32_t low, uint32_t mid1, uint32_t mid2, uint32_t high);
uint128_t cast_to_uint128(uint32_t x);
uint128_t add_uint128(uint128_t x, uint128_t y);
uint128_t sub_uint128(uint128_t x, uint128_t y);
uint128_t mul_uint128(uint128_t x, uint128_t y);
uint128_t rshift_uint128(uint128_t x, uint8_t y);
uint128_t lshift_uint128(uint128_t x, uint8_t y);
uint128_t and_uint128(uint128_t x, uint128_t y);
uint128_t or_uint128(uint128_t x, uint128_t y);
uint128_t xor_uint128(uint128_t x, uint128_t y);