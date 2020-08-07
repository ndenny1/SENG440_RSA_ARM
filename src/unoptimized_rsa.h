/* file: unoptimized_rsa.h */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>
#include "int128.h"

#ifndef bool
	#include <stdbool.h>
	#define bool	_Bool
#endif

uint8_t count_num_bits(uint128_t* value);

uint128_t* mmm(uint128_t* X, uint128_t* Y, uint128_t* M, uint32_t bitLength);

uint128_t* me(uint128_t* message, uint128_t* key, uint128_t* modulus);

uint128_t* encrypt(uint128_t* message);

uint128_t* decrypt(uint128_t* encoded_message);
