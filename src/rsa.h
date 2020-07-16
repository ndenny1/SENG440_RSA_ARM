/* file: unoptimized_rsa.h */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#ifndef bool
	#include <stdbool.h>
	#define bool	_Bool
#endif

bool isPrime(int a);

void generatePrimes();

int greatestCommonDenom(int a, int b);

bool isRelativelyPrime(int a, int b);

void generateE();

void generateD();

int mmm(int X, int Y, int M, int bitlength);

// int me();

// int encrypt(int message);

// int decrypt(int encoded_message);