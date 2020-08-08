#include "int128.h"

uint256_t * uint256_init(uint32_t blocks[8]) {
	uint256_t * r = (uint256_t *)malloc(sizeof(uint256_t));
	uint8_t i = 0;
	for (; i < 8; i++) {
		r->blocks[i] = blocks[i];
	}
	return r;
}
uint256_t * cast_to_uint256(uint32_t x) {
	return uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, 0, x});
}
uint256_t * add_uint256(uint256_t * x, uint256_t * y) {
	uint32_t r_blocks[8];

	int i = 7;
	uint8_t carry = 0;
	for (; i >= 0; i--) {
		uint32_t xi = x->blocks[i];
		uint32_t yi = y->blocks[i];
		uint32_t ri = xi + yi + carry;
		carry = (ri < xi || ri < yi);
		r_blocks[i] = ri;
	}
	return uint256_init(r_blocks);
}
uint256_t * sub_uint256(uint256_t * x, uint256_t * y) {
	uint32_t r_blocks[8];

	int i = 7;
	uint8_t carry = 0;
	for (; i >= 0; i--) {
		uint32_t xi = x->blocks[i];
		uint32_t yi = y->blocks[i];
		uint32_t ri = xi - yi - carry;
		carry = (ri > xi);
		r_blocks[i] = ri;
	}
	return uint256_init(r_blocks);
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

uint256_t * mul_uint256(uint256_t * x, uint256_t * y) {
	int i = 0;
	int j = 0;
	
	uint256_t * col1 = uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, 0, 0});
	uint256_t * col2 = uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, 0, 0});
	uint256_t * col3 = uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, 0, 0});
	uint256_t * col4 = uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, 0, 0});
	uint256_t * col5 = uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, 0, 0});
	uint256_t * col6 = uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, 0, 0});
	uint256_t * col7 = uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, 0, 0});
	uint256_t * col8 = uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, 0, 0});
	
	uint256_t * columns[8] = {col1, col2, col3, col4, col5, col6, col7, col8};

	for (; i < 8; i++) {
		for (j = 0; j < 8 - i; j++) {
			uint32_t carry, overflow;
			uint32_t multiplier = x->blocks[7-i];
			uint32_t multiplicand = y->blocks[7-j];
			mul_uint32(multiplier, multiplicand, &carry, &overflow);
			columns[i + j] = add_uint256(columns[i + j], uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, carry, overflow}));
		}
	}

	for (i = 1; i < 8; i++) {
		uint256_t * prev_col = columns[i - 1];
		columns[i] = add_uint256(columns[i], uint256_init((uint32_t[]){0, prev_col->blocks[1], prev_col->blocks[2], prev_col->blocks[3], prev_col->blocks[4], prev_col->blocks[4], prev_col->blocks[5], prev_col->blocks[6]}));
	}

	uint32_t c1 = columns[0]->blocks[7];
	uint32_t c2 = columns[1]->blocks[7];
	uint32_t c3 = columns[2]->blocks[7];
	uint32_t c4 = columns[3]->blocks[7];
	uint32_t c5 = columns[4]->blocks[7];
	uint32_t c6 = columns[5]->blocks[7];
	uint32_t c7 = columns[6]->blocks[7];
	uint32_t c8 = columns[7]->blocks[7];
	
	return uint256_init((uint32_t[]){c8, c7, c6, c5, c4, c3, c2, c1});
}
uint256_t * rshift_uint256(uint256_t * x, uint8_t y) {
	if (y >= 256) {
		return cast_to_uint256(0);
	}
	if (y < 256 && y >= 224) {
		return rshift_uint256(uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, 0, x->blocks[0]}), y - 224);
	}
	if (y < 224 && y >= 192) {
		return rshift_uint256(uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, x->blocks[1], x->blocks[0]}), y - 192);
	}
	if (y < 192 && y >= 160) {
		return rshift_uint256(uint256_init((uint32_t[]){0, 0, 0, 0, 0, x->blocks[2], x->blocks[1], x->blocks[0]}), y - 160);
	}
	if (y < 160 && y >= 128) {
		return rshift_uint256(uint256_init((uint32_t[]){0, 0, 0, 0, x->blocks[3], x->blocks[2], x->blocks[1], x->blocks[0]}), y - 128);
	}
	if (y < 128 && y >= 96) {
		return rshift_uint256(uint256_init((uint32_t[]){0, 0, 0, x->blocks[4], x->blocks[3], x->blocks[2], x->blocks[1], x->blocks[0]}), y - 96);
	}
	if (y < 96 && y >= 64) {
		return rshift_uint256(uint256_init((uint32_t[]){0, 0, x->blocks[5], x->blocks[4], x->blocks[3], x->blocks[2], x->blocks[1], x->blocks[0]}), y - 64);
	}
	if (y < 64 && y >= 32) {
		return rshift_uint256(uint256_init((uint32_t[]){0, x->blocks[6], x->blocks[5], x->blocks[4], x->blocks[3], x->blocks[2], x->blocks[1], x->blocks[0]}), y - 32);
	}
	int i = 7;
	uint32_t new_blocks[8];
	for (; i >= 0; i--) {
		if (i != 0) {
			uint32_t prev = (x->blocks[i - 1] << (32 - y));
			new_blocks[i] = (x->blocks[i] >> y) | prev;
		} else {
			new_blocks[i] = x->blocks[i] >> y;
		}
	}

	return uint256_init(new_blocks);
}
uint256_t * lshift_uint256(uint256_t * x, uint8_t y) {
	if (y >= 256) {
		return cast_to_uint256(0);
	}
	if (y < 256 && y >= 224) {
		return lshift_uint256(uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, 0, x->blocks[0]}), y - 224);
	}
	if (y < 224 && y >= 192) {
		return lshift_uint256(uint256_init((uint32_t[]){0, 0, 0, 0, 0, 0, x->blocks[1], x->blocks[0]}), y - 192);
	}
	if (y < 192 && y >= 160) {
		return lshift_uint256(uint256_init((uint32_t[]){0, 0, 0, 0, 0, x->blocks[2], x->blocks[1], x->blocks[0]}), y - 160);
	}
	if (y < 160 && y >= 128) {
		return lshift_uint256(uint256_init((uint32_t[]){0, 0, 0, 0, x->blocks[3], x->blocks[2], x->blocks[1], x->blocks[0]}), y - 128);
	}
	if (y < 128 && y >= 96) {
		return lshift_uint256(uint256_init((uint32_t[]){0, 0, 0, x->blocks[4], x->blocks[3], x->blocks[2], x->blocks[1], x->blocks[0]}), y - 96);
	}
	if (y < 96 && y >= 64) {
		return lshift_uint256(uint256_init((uint32_t[]){0, 0, x->blocks[5], x->blocks[4], x->blocks[3], x->blocks[2], x->blocks[1], x->blocks[0]}), y - 64);
	}
	if (y < 64 && y >= 32) {
		return lshift_uint256(uint256_init((uint32_t[]){0, x->blocks[6], x->blocks[5], x->blocks[4], x->blocks[3], x->blocks[2], x->blocks[1], x->blocks[0]}), y - 32);
	}
	int i = 7;
	uint32_t new_blocks[8];
	for (; i >= 0; i--) {
		if (i != 7) {
			uint32_t prev = (x->blocks[i + 1] >> (32 - y));
			new_blocks[i] = (x->blocks[i] << y) | prev;
		} else {
			new_blocks[i] = x->blocks[i] << y;
		}
	}

	return uint256_init(new_blocks);
}
uint256_t * and_uint256(uint256_t * x, uint256_t * y) {
	int i = 7;
	uint32_t blocks[8];
	for (; i >= 0; i--) {
		blocks[i] = x->blocks[i] & y->blocks[i];
	}
	return uint256_init(blocks);
}
uint256_t * or_uint256(uint256_t * x, uint256_t * y) {
	int i = 7;
	uint32_t blocks[8];
	for (; i >= 0; i--) {
		blocks[i] = x->blocks[i] | x->blocks[i];
	}
	return uint256_init(blocks);
}
uint256_t * xor_uint256(uint256_t * x, uint256_t * y) {
	int i = 7;
	uint32_t blocks[8];
	for (; i >= 0; i--) {
		blocks[i] = x->blocks[i] ^ y->blocks[i];
	}
	return uint256_init(blocks);
}

uint256_t * mod_uint256(uint256_t * x, uint256_t * y) {
	if (gt_uint256(y, x)) {
		return x;
	}
	if (equal_uint256(y, cast_to_uint256(1))) {
		return cast_to_uint256(0);
	}
	uint256_t * _x = uint256_init(x->blocks);
	uint256_t * _y = uint256_init(y->blocks);
	uint256_t * half_x = rshift_uint256(_x, 1);
	uint256_t * largest_y = uint256_init((uint32_t[]){0x7FFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0XFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0XFFFFFFFF});
	while (!gte_uint256(_y, half_x) && !gte_uint256(_y, largest_y)) {
		_y = lshift_uint256(_y, 1);
	}

	_y = rshift_uint256(_y, 1);
	
	while (gt_uint256(_y, y)) {
		while(gt_uint256(_x, _y)) {
			_x = sub_uint256(_x, _y);
		}
		_y = rshift_uint256(_y, 1);
	}
	while (gt_uint256(_x, y)) {
		_x = sub_uint256(_x, y);
	}
	if (equal_uint256(_x, y)) {
		return cast_to_uint256(0);
	}
	return _x;
}

uint8_t lt_uint256(uint256_t * x, uint256_t * y) {
	return !(gte_uint256(x, y));
}

uint8_t uint256_equal_to_zero(uint256_t * x) {
	int i = 7;
	for (; i >= 0; i--) {
		if (x->blocks[i] != 0) {
			return 0;
		}
	}
	return 1;
}

uint8_t gte_uint256(uint256_t * x, uint256_t * y) {
	if (equal_uint256(x, y)) {
		return 1;
	}
	return gt_uint256(x, y);
}

uint8_t gt_uint256(uint256_t * x, uint256_t * y) {
	uint8_t i = 0;
	for (; i < 7; i++) {
		uint32_t xi = x->blocks[i];
		uint32_t yi = y->blocks[i];
		if (xi != yi) {
			return xi > yi;
		}
	}
	return x->blocks[7] > y->blocks[7];
}

uint8_t equal_uint256(uint256_t * x, uint256_t * y) {
	uint8_t i = 0;
	for (; i < 7; i++) {
		uint32_t xi = x->blocks[i];
		uint32_t yi = y->blocks[i];
		if (xi != yi) {
			return 0;
		}
	}
	return x->blocks[7] == y->blocks[7];
}

uint8_t get_bit(uint256_t * x, uint8_t offset) {
	if (offset < 256 && offset >= 224) {
		return (x->blocks[0] >> (offset - 224)) & 1;
	}
	if (offset < 224 && offset >= 192) {
		return (x->blocks[1] >> (offset - 192)) & 1;
	}
	if (offset < 192 && offset >= 160) {
		return (x->blocks[2] >> (offset - 160)) & 1;
	}
	if (offset < 160 && offset >= 128) {
		return (x->blocks[3] >> (offset - 128)) & 1;
	}
	if (offset < 128 && offset >= 96) {
		return (x->blocks[4] >> (offset - 96)) & 1;
	}
	if (offset < 96 && offset >= 64) {
		return (x->blocks[5] >> (offset - 64)) & 1;
	}
	if (offset < 64 && offset >= 32) {
		return (x->blocks[6] >> (offset - 32)) & 1;
	}
	return (x->blocks[7] >> offset) & 1;
}

void print_uint256(char * str, uint256_t * x) {
	printf("%s", str);
	uint8_t i = 0;
	for (; i < 8; i++) {
		printf("%08x ", x->blocks[i]);
	}
	printf("\n");
}
