#include "int128.h"

uint128_t * uint128_init(uint32_t low, uint32_t mid1, uint32_t mid2, uint32_t high) {
	uint128_t * r = (uint128_t *)malloc(sizeof(uint128_t));
	r->low = low;
	r->mid1 = mid1;
	r->mid2 = mid2;
	r->high = high;
	return r;
}
uint128_t * cast_to_uint128(uint32_t x) {
	return uint128_init(x, 0, 0, 0);
}
uint128_t * add_uint128(uint128_t * x, uint128_t * y) {
	uint32_t x_low = x->low;
	uint32_t x_mid1 = x->mid1;
	uint32_t x_mid2 = x->mid2;
	uint32_t x_high = x->high;

	uint32_t y_low = y->low;
	uint32_t y_mid1 = y->mid1;
	uint32_t y_mid2 = y->mid2;
	uint32_t y_high = y->high;

	uint32_t r1 = x_low + y_low;
	uint8_t carry = (r1 < x_low || r1 < y_low);

	uint32_t r2 = x_mid1 + y_mid1 + carry;
	carry = (r2 < x_mid1 || r2 < y_mid1);

	uint32_t r3 = x_mid2 + y_mid2 + carry;
	carry = (r3 < x_mid2 || r3 < y_mid2);

	uint32_t r4 = x_high + y_high + carry;
	return uint128_init(r1, r2, r3, r4);
}
uint128_t * sub_uint128(uint128_t * x, uint128_t * y) {
	uint32_t x_low = x->low;
	uint32_t x_mid1 = x->mid1;
	uint32_t x_mid2 = x->mid2;
	uint32_t x_high = x->high;

	uint32_t y_low = y->low;
	uint32_t y_mid1 = y->mid1;
	uint32_t y_mid2 = y->mid2;
	uint32_t y_high = y->high;

	uint32_t r1 = x_low - y_low;
	uint8_t carry = (r1 > x_low);

	uint32_t r2 = x_mid1 - y_mid1 - carry;
	carry = (r2 > x_mid1);

	uint32_t r3 = x_mid2 - y_mid2 - carry;
	carry = (r3 > x_mid2);

	uint32_t r4 = x_high - y_high - carry;
	return uint128_init(r1, r2, r3, r4);
}

void mul_uint32(uint32_t x, uint32_t y, uint32_t * carry, uint32_t * overflow) {
	uint32_t x_low = x & 0x0000FFFF;
	uint32_t x_high = x >> 16;

	uint32_t y_low = y & 0x0000FFFF;
	uint32_t y_high = y >> 16;

	uint32_t low_low = x_low * y_low;
	uint32_t low_high = x_low * y_high;
	uint32_t high_low = x_high * y_low;
	uint32_t high_high = x_high * y_high;
	uint32_t col_1 = (low_low & 0x0000FFFF);
	uint32_t col_2 = ((low_low & 0xFFFF0000) >> 16) + (low_high & 0x0000FFFF) + (high_low & 0x0000FFFF);
	uint32_t col_3 = ((low_high & 0xFFFF0000) >> 16) + ((high_low & 0xFFFF0000) >> 16) + (high_high & 0x0000FFFF);
	uint32_t col_4 = (high_high & 0xFFFF0000) >> 16;

	col_3 = col_3 + (col_2 >> 16);
	col_4 = col_4 + (col_3 >> 16);

	*carry = (col_4 << 16) | col_3;
	*overflow = (col_2 << 16) | col_1;
}

uint128_t * mul_uint128(uint128_t * x, uint128_t * y) {
	uint32_t x_low = x->low;
	uint32_t x_mid1 = x->mid1;
	uint32_t x_mid2 = x->mid2;
	uint32_t x_high = x->high;

	uint32_t y_low = y->low;
	uint32_t y_mid1 = y->mid1;
	uint32_t y_mid2 = y->mid2;
	uint32_t y_high = y->high;

	uint32_t multipliers[4] = {x_low, x_mid1, x_mid2, x_high};
	uint32_t multiplicands[4] = {y_low, y_mid1, y_mid2, y_high};

	uint8_t i = 0;
	uint8_t j = 0;
	
	uint128_t * col1 = uint128_init(0, 0, 0, 0);
	uint128_t * col2 = uint128_init(0, 0, 0, 0);
	uint128_t * col3 = uint128_init(0, 0, 0, 0);
	uint128_t * col4 = uint128_init(0, 0, 0, 0);
	
	uint128_t * columns[4] = {col1, col2, col3, col4};

	for (; i < 4; i++) {
		for (j = 0; j < 4 - i; j++) {
			uint32_t carry, overflow;
			uint32_t multiplier = multipliers[i];
			uint32_t multiplicand = multiplicands[j];
			mul_uint32(multiplier, multiplicand, &carry, &overflow);
			columns[i + j] = add_uint128(columns[i + j], uint128_init(overflow, carry, 0, 0));
		}
	}

	for (i = 1; i < 4; i++) {
		uint128_t * prev_col = columns[i - 1];
		columns[i] = add_uint128(columns[i], uint128_init(prev_col->mid1, prev_col->mid2, prev_col->high, 0));
	}


	return uint128_init(columns[0]->low, columns[1]->low, columns[2]->low, columns[3]->low);
}
uint128_t * rshift_uint128(uint128_t * x, uint8_t y) {
	if (y >= 128) {
		return uint128_init(0, 0, 0, 0);
	}
	uint32_t high = x->high;
	if (y < 128 && y >= 96) {
		return rshift_uint128(uint128_init(high, 0, 0, 0), y - 96);
	}
	uint32_t mid2 = x->mid2;
	if (y < 96 && y >= 64) {
		return rshift_uint128(uint128_init(mid2, high, 0, 0), y - 64);
	}
	uint32_t mid1 = x->mid1;
	if (y < 64 && y >= 32) {
		return rshift_uint128(uint128_init(mid1, mid2, high, 0), y - 32);
	}
	uint32_t low = x->low;
	uint32_t last_mid1 = (mid1 << (32 - y));
	uint32_t last_mid2 = (mid2 << (32 - y));
	uint32_t last_high = (high << (32 - y));
	return uint128_init((low >> y) | last_mid1, (mid1 >> y) | last_mid2, (mid2 >> y) | last_high, high >> y);
}
uint128_t * lshift_uint128(uint128_t * x, uint8_t y) {
	if (y >= 128) {
		return uint128_init(0, 0, 0, 0);
	}
	if (y < 128 && y >= 96) {
		return rshift_uint128(uint128_init(0, x->low, x->mid1, x->mid2), y - 96);
	}
	if (y < 96 && y >= 64) {
		return rshift_uint128(uint128_init(0, 0, x->low, x->mid1), y - 64);
	}
	if (y < 64 && y >= 32) {
		return rshift_uint128(uint128_init(0, 0, 0, x->mid1), y - 32);
	}
	return uint128_init(x->low << y, x->mid1 << y, x->mid2 << y, x->high << y);
}
uint128_t * and_uint128(uint128_t * x, uint128_t * y) {
	return uint128_init(x->low & y->low, x->mid1 & y->mid1, x->mid2 & y->mid2, x->high & y->high);
}
uint128_t * or_uint128(uint128_t * x, uint128_t * y) {
	return uint128_init(x->low | y->low, x->mid1 | y->mid1, x->mid2 | y->mid2, x->high | y->high);
}
uint128_t * xor_uint128(uint128_t * x, uint128_t * y) {
	return uint128_init(x->low ^ y->low, x->mid1 ^ y->mid1, x->mid2 ^ y->mid2, x->high ^ y->high);
}
void print_uint128(uint128_t * x) {
	printf("%08x %08x %08x %08x\n", x->high, x->mid2, x->mid1, x->low);
}