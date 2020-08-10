#include "int160.h"

uint160_t * uint160_init(uint32_t blocks[5]) {
	uint160_t * r = (uint160_t *)malloc(sizeof(uint160_t));
	r->blocks[0] = blocks[0];
	r->blocks[1] = blocks[1];
	r->blocks[2] = blocks[2];
	r->blocks[3] = blocks[3];
	r->blocks[4] = blocks[4];
	
	return r;
}
uint160_t * cast_to_uint160(uint32_t x) {
	return uint160_init((uint32_t[]){0, 0, 0, 0, x});
}
uint160_t * add_uint160(uint160_t * x, uint160_t * y) {
	uint32_t b1, b2, b3, b4, b5;
	uint32_t x1 = x->blocks[0], x2 = x->blocks[1], x3 = x->blocks[2], x4 = x->blocks[3], x5 = x->blocks[4];
	uint32_t y1 = y->blocks[0], y2 = y->blocks[1], y3 = y->blocks[2], y4 = y->blocks[3], y5 = y->blocks[4];
	
	// Needs to compile with -O3 flag
	__asm__ __volatile__ (
		"adds %4, %9, %14;\n"
		"\tadcs %3, %8, %13;\n"
		"\tadcs %2, %7, %12;\n"
		"\tadcs %1, %6, %11;\n"
		"\tadc %0, %5, %10;\n"
		: "=r" (b1), "=r" (b2), "=r" (b3), "=r" (b4), "=r" (b5)
		: "r" (x1), "r" (x2), "r" (x3), "r" (x4), "r" (x5), "r" (y1), "r" (y2), "r" (y3), "r" (y4), "r" (y5)
	);

	return uint160_init((uint32_t []){b1, b2, b3, b4, b5});
}
uint160_t * sub_uint160(uint160_t * x, uint160_t * y) {
	uint32_t b1, b2, b3, b4, b5;
	uint32_t x1 = x->blocks[0], x2 = x->blocks[1], x3 = x->blocks[2], x4 = x->blocks[3], x5 = x->blocks[4];
	uint32_t y1 = y->blocks[0], y2 = y->blocks[1], y3 = y->blocks[2], y4 = y->blocks[3], y5 = y->blocks[4];
	
	// Needs to compile with -O3 flag
	__asm__ __volatile__ (
		"subs %4, %9, %14;\n"
		"\tsbcs %3, %8, %13;\n"
		"\tsbcs %2, %7, %12;\n"
		"\tsbcs %1, %6, %11;\n"
		"\tsbc %0, %5, %10;\n"
		: "=r" (b1), "=r" (b2), "=r" (b3), "=r" (b4), "=r" (b5)
		: "r" (x1), "r" (x2), "r" (x3), "r" (x4), "r" (x5), "r" (y1), "r" (y2), "r" (y3), "r" (y4), "r" (y5)
	);

	return uint160_init((uint32_t []){b1, b2, b3, b4, b5});
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

uint160_t * mul_uint160(uint160_t * x, uint160_t * y) {
	uint8_t i = 0;
	uint8_t j = 0;
	
	uint160_t * col1 = uint160_init((uint32_t[]){0, 0, 0, 0, 0});
	uint160_t * col2 = uint160_init((uint32_t[]){0, 0, 0, 0, 0});
	uint160_t * col3 = uint160_init((uint32_t[]){0, 0, 0, 0, 0});
	uint160_t * col4 = uint160_init((uint32_t[]){0, 0, 0, 0, 0});
	uint160_t * col5 = uint160_init((uint32_t[]){0, 0, 0, 0, 0});
	
	uint160_t * columns[5] = {col1, col2, col3, col4, col5};

	uint32_t multiplier, multiplicand, carry, overflow;
	for (; i < 5; i++) {
		for (j = 0; j < 5 - i; j++) {
			multiplier = x->blocks[4-i];
			multiplicand = y->blocks[4-j];
			mul_uint32(multiplier, multiplicand, &carry, &overflow);
			columns[i + j] = add_uint160(columns[i + j], uint160_init((uint32_t[]){0, 0, 0, carry, overflow}));
		}
	}

	for (i = 1; i < 5; i++) {
		uint160_t * prev_col = columns[i - 1];
		columns[i] = add_uint160(columns[i], uint160_init((uint32_t []) {0, prev_col->blocks[0], prev_col->blocks[1], prev_col->blocks[2], prev_col->blocks[3]}));
	}

	// uint160_t * prev_col = columns[0];
	// columns[1] = add_uint160(columns[1], uint160_init((uint32_t[]){0, prev_col->blocks[0], prev_col->blocks[1], prev_col->blocks[2], prev_col->blocks[3]}));
	// prev_col = columns[1];
	// columns[2] = add_uint160(columns[2], uint160_init((uint32_t[]){0, prev_col->blocks[0], prev_col->blocks[1], prev_col->blocks[2], prev_col->blocks[3]}));
	// prev_col = columns[2];
	// columns[3] = add_uint160(columns[3], uint160_init((uint32_t[]){0, prev_col->blocks[0], prev_col->blocks[1], prev_col->blocks[2], prev_col->blocks[3]}));
	// prev_col = columns[3];
	// columns[4] = add_uint160(columns[4], uint160_init((uint32_t[]){0, prev_col->blocks[0], prev_col->blocks[1], prev_col->blocks[2], prev_col->blocks[3]}));
	

	uint32_t c1 = columns[0]->blocks[4];
	uint32_t c2 = columns[1]->blocks[4];
	uint32_t c3 = columns[2]->blocks[4];
	uint32_t c4 = columns[3]->blocks[4];
	uint32_t c5 = columns[4]->blocks[4];

	return uint160_init((uint32_t[]){c5, c4, c3, c2, c1});
}
uint160_t * rshift_uint160(uint160_t * x, uint8_t y) {
	if (y >= 160) {
		return cast_to_uint160(0);
	}
	if (y < 160 && y >= 128) {
		return rshift_uint160(uint160_init((uint32_t[]){0, 0, 0, 0, x->blocks[0]}), y - 128);
	}
	if (y < 128 && y >= 96) {
		return rshift_uint160(uint160_init((uint32_t[]){0, 0, 0, x->blocks[0], x->blocks[1]}), y - 96);
	}
	if (y < 96 && y >= 64) {
		return rshift_uint160(uint160_init((uint32_t[]){0, 0, x->blocks[0], x->blocks[1], x->blocks[2]}), y - 64);
	}
	if (y < 64 && y >= 32) {
		return rshift_uint160(uint160_init((uint32_t[]){0, x->blocks[0], x->blocks[1], x->blocks[2], x->blocks[3], x->blocks[4]}), y - 32);
	}
	uint32_t b4 = (x->blocks[4] >> y) | (x->blocks[3] << (32 - y));
	uint32_t b3 = (x->blocks[3] >> y) | (x->blocks[2] << (32 - y));
	uint32_t b2 = (x->blocks[2] >> y) | (x->blocks[1] << (32 - y));
	uint32_t b1 = (x->blocks[1] >> y) | (x->blocks[0] << (32 - y));
	uint32_t b0 = (x->blocks[0] >> y);

	return uint160_init((uint32_t []){b0, b1, b2, b3, b4});
}
uint160_t * lshift_uint160(uint160_t * x, uint8_t y) {
	if (y >= 160) {
		return cast_to_uint160(0);
	}
	if (y < 160 && y >= 128) {
		return lshift_uint160(uint160_init((uint32_t[]){x->blocks[4], 0, 0, 0, 0}), y - 128);
	}
	if (y < 128 && y >= 96) {
		return lshift_uint160(uint160_init((uint32_t[]){x->blocks[3], x->blocks[4], 0, 0, 0}), y - 96);
	}
	if (y < 96 && y >= 64) {
		return lshift_uint160(uint160_init((uint32_t[]){x->blocks[2], x->blocks[3], x->blocks[4], 0, 0}), y - 64);
	}
	if (y < 64 && y >= 32) {
		return lshift_uint160(uint160_init((uint32_t[]){x->blocks[1], x->blocks[2], x->blocks[3], x->blocks[4], 0}), y - 32);
	}
	uint32_t b4 = x->blocks[4] << y;
	uint32_t b3 = (x->blocks[3] << y) | (x->blocks[4] >> (32 - y));
	uint32_t b2 = (x->blocks[2] << y) | (x->blocks[3] >> (32 - y));
	uint32_t b1 = (x->blocks[1] << y) | (x->blocks[2] >> (32 - y));
	uint32_t b0 = (x->blocks[0] << y) | (x->blocks[1] >> (32 - y));
	return uint160_init((uint32_t []){b0, b1, b2, b3, b4});
}
uint160_t * and_uint160(uint160_t * x, uint160_t * y) {
	return uint160_init((uint32_t []){
		x->blocks[0] & y->blocks[0],
		x->blocks[1] & y->blocks[1],
		x->blocks[2] & y->blocks[2],
		x->blocks[3] & y->blocks[3],
		x->blocks[4] & y->blocks[4]
	});
}
uint160_t * or_uint160(uint160_t * x, uint160_t * y) {
	return uint160_init((uint32_t []){
		x->blocks[0] | y->blocks[0],
		x->blocks[1] | y->blocks[1],
		x->blocks[2] | y->blocks[2],
		x->blocks[3] | y->blocks[3],
		x->blocks[4] | y->blocks[4]
	});
}
uint160_t * xor_uint160(uint160_t * x, uint160_t * y) {
	return uint160_init((uint32_t []){
		x->blocks[0] ^ y->blocks[0],
		x->blocks[1] ^ y->blocks[1],
		x->blocks[2] ^ y->blocks[2],
		x->blocks[3] ^ y->blocks[3],
		x->blocks[4] ^ y->blocks[4]
	});
}

uint160_t * mod_uint160(uint160_t * x, uint160_t * y) {
	if (gt_uint160(y, x)) {
		return x;
	}
	if (equal_uint160(y, cast_to_uint160(1))) {
		return cast_to_uint160(0);
	}
	uint160_t * _x = uint160_init(x->blocks);
	uint160_t * _y = uint160_init(y->blocks);
	uint160_t * half_x = rshift_uint160(_x, 1);
	uint160_t * largest_y = uint160_init((uint32_t[]){0x7FFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0XFFFFFFFF});
	while (!gte_uint160(_y, half_x) && !gte_uint160(_y, largest_y)) {
		_y = lshift_uint160(_y, 1);
	}

	_y = rshift_uint160(_y, 1);
	
	while (gt_uint160(_y, y)) {
		while(gt_uint160(_x, _y)) {
			_x = sub_uint160(_x, _y);
		}
		_y = rshift_uint160(_y, 1);
	}
	while (gt_uint160(_x, y)) {
		_x = sub_uint160(_x, y);
	}
	if (equal_uint160(_x, y)) {
		return cast_to_uint160(0);
	}
	return _x;
}

uint8_t lt_uint160(uint160_t * x, uint160_t * y) {
	return !(gte_uint160(x, y));
}

uint8_t uint160_equal_to_zero(uint160_t * x) {
	int i = 4;
	for (; i >= 0; i--) {
		if (x->blocks[i] != 0) {
			return 0;
		}
	}
	return 1;
}

uint8_t gte_uint160(uint160_t * x, uint160_t * y) {
	if (equal_uint160(x, y)) {
		return 1;
	}
	return gt_uint160(x, y);
}

uint8_t gt_uint160(uint160_t * x, uint160_t * y) {
	uint8_t i = 0;
	for (; i < 4; i++) {
		uint32_t xi = x->blocks[i];
		uint32_t yi = y->blocks[i];
		if (xi != yi) {
			return xi > yi;
		}
	}
	return x->blocks[4] > y->blocks[4];
}

uint8_t equal_uint160(uint160_t * x, uint160_t * y) {
	uint8_t i = 0;
	for (; i < 4; i++) {
		uint32_t xi = x->blocks[i];
		uint32_t yi = y->blocks[i];
		if (xi != yi) {
			return 0;
		}
	}
	return x->blocks[4] == y->blocks[4];
}

uint8_t get_bit(uint160_t * x, uint8_t offset) {
	if (offset < 160 && offset >= 128) {
		return (x->blocks[0] >> (offset - 128)) & 1;
	}
	if (offset < 128 && offset >= 96) {
		return (x->blocks[1] >> (offset - 96)) & 1;
	}
	if (offset < 96 && offset >= 64) {
		return (x->blocks[2] >> (offset - 64)) & 1;
	}
	if (offset < 64 && offset >= 32) {
		return (x->blocks[3] >> (offset - 32)) & 1;
	}
	return (x->blocks[4] >> offset) & 1;
}

void print_uint160(char * str, uint160_t * x) {
	printf("%s", str);
	uint8_t i = 0;
	for (; i < 5; i++) {
		printf("%08x ", x->blocks[i]);
	}
	printf("\n");
}
