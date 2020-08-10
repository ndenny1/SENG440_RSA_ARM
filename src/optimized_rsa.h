/* file: unoptimized_rsa.h */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>
#include "int160.h"

#ifndef bool
	#include <stdbool.h>
	#define bool	_Bool
#endif

uint16_t count_num_bits(uint160_t* value);

uint160_t* mmm(uint160_t* X, uint160_t* Y, uint160_t* M, uint32_t bitLength);

uint160_t* me(uint160_t* message, uint160_t* key, uint160_t* modulus);

uint160_t* encrypt(uint160_t* message);

uint160_t* decrypt(uint160_t* encoded_message);
