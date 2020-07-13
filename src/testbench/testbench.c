/* file testbench.c */

#include <stdio.h>
#include "minunit.h"
#include "../unoptimized_rsa.h"

int tests_run = 0;

int foo = 7;
int bar = 5;

static char * test_isPrime_p() {
	int prime = 3650513879;
	mu_assert("error, isPrime returned false", isPrime(prime));
	return 0;
}

static char * test_isPrime_n() {
	int composite = 3650513878;
	mu_assert("error, isPrime returned true", !isPrime(composite));
	return 0;
}

static char * test_greatestCommonDenom() {
	int a = 644839;
	int b = 9763;
	int expected_gcd = 13;
	int gcd = greatestCommonDenom(a, b);
	mu_assert("error, gcd != 13", gcd == expected_gcd);
	return 0;
}

static char * test_isRelativelyPrime_p() {
	int a = 655839;
	int b = 9764;
	mu_assert("error, isRelativelyPrime returned false", isRelativelyPrime(a, b));
	return 0;
}

static char * test_isRelativelyPrime_n() {
	int a = 655839;
	int b = 9763;
	mu_assert("error, isRelativelyPrime returned true", !isRelativelyPrime(a, b));
	return 0;
}

static char * test_mmm() {
	int a = 4;
	int b = 7;
	int m = 15;
	int bit_length = 8;
	int expected_result = 13;
	mu_assert("error, mmm did not return 13", mmm(a, b, m, bit_length) == expected_result);
	return 0;
}

static char * all_tests() {
	mu_run_test(test_isPrime_p);
	mu_run_test(test_isPrime_n);
	mu_run_test(test_greatestCommonDenom);
	mu_run_test(test_isRelativelyPrime_p);
	mu_run_test(test_isRelativelyPrime_n);
	mu_run_test(test_mmm);
	return 0;
}

int main(int argc, char **argv) {
	char *result = all_tests();
	if (result != 0) {
		printf("%s\n", result);
	} else {
		printf("ALL TESTS PASSED\n");
	}
	printf("Tests run: %d\n", tests_run);
	
	return result != 0;
}
