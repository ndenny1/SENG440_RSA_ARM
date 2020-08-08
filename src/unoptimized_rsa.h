/* file: unoptimized_rsa.h */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>
#include "int256.h"

#ifndef bool
	#include <stdbool.h>
	#define bool	_Bool
#endif

uint16_t count_num_bits(uint256_t* value);

uint256_t* mmm(uint256_t* X, uint256_t* Y, uint256_t* M, uint32_t bitLength);

uint256_t* me(uint256_t* message, uint256_t* key, uint256_t* modulus);

uint256_t* encrypt(uint256_t* message);

uint256_t* decrypt(uint256_t* encoded_message);
