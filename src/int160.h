#include <stdarg.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

// FFFFFFFF FFFFFFFF FFFFFFFF FFFFFFFF
//   high     mid2     mid1     low
typedef struct uint160 {
	uint32_t blocks[5];
} uint160_t;

uint160_t * uint160_init(uint32_t blocks[5]);
uint160_t * cast_to_uint160(uint32_t x);
uint160_t * add_uint160(uint160_t * x, uint160_t * y);
uint160_t * sub_uint160(uint160_t * x, uint160_t * y);
void add_modifying(uint160_t * x, uint160_t * y);
void sub_modifying(uint160_t * x, uint160_t * y);
uint160_t * mul_uint160(uint160_t * x, uint160_t * y);
void mul_modifying(uint160_t * x, uint160_t * y);
uint160_t * rshift_uint160(uint160_t * x, uint8_t y);
uint160_t * lshift_uint160(uint160_t * x, uint8_t y);
void rshift_modifying(uint160_t * x, uint8_t y);
void lshift_modifying(uint160_t * x, uint8_t y);
uint160_t * and_uint160(uint160_t * x, uint160_t * y);
uint160_t * or_uint160(uint160_t * x, uint160_t * y);
uint160_t * xor_uint160(uint160_t * x, uint160_t * y);
uint160_t * mod_uint160(uint160_t * x, uint160_t * y);
void mod_modifying(uint160_t * x, uint160_t * y);
uint8_t uint160_equal_to_zero(uint160_t * x);
uint8_t gt_uint160(uint160_t * x, uint160_t * y);
uint8_t gte_uint160(uint160_t * x, uint160_t * y);
uint8_t equal_uint160(uint160_t * x, uint160_t * y);
uint8_t get_bit(uint160_t * x, uint8_t offset);
void print_uint160(char * str, uint160_t * x);