/* file testbench.c */
#include "minunit.h"
#include "../unoptimized_rsa.h"

int tests_run = 0;

static char * test_isPrime_p() {
	int prime = 1543763561;
	mu_assert("error, isPrime returned false", isPrime(prime));
	return 0;
}

static char * test_isPrime_n() {
	int composite = 1543763562;
	mu_assert("error, isPrime returned true", isPrime(composite) == false);
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
	int a = 655838;
	int b = 9764;
	mu_assert("error, isRelativelyPrime returned true", isRelativelyPrime(a, b) == false);
	return 0;
}

static char * test_mmm() {
	int a = 4;
	int b = 7;
	int m = 15;
	int bit_length = 4;
	int expected_result = 13;
	mu_assert("error, mmm did not return 13", mmm(a, b, m, bit_length) == expected_result);
	return 0;
}

static char * test_me() {
	int b = 4;
	int e = 13;
	int m = 497;
	int expected_result = 445;
	mu_assert("error, me did not return 445", me(b, e, m) == expected_result);
	return 0;
}

static char * all_tests() {
	mu_run_test(test_isPrime_p);
	mu_run_test(test_isPrime_n);
	mu_run_test(test_greatestCommonDenom);
	mu_run_test(test_isRelativelyPrime_p);
	mu_run_test(test_isRelativelyPrime_n);
	mu_run_test(test_mmm);
	mu_run_test(test_me);
	return 0;
}

int main() {
	char *result = all_tests();
	if (result != 0) {
		printf("%s\n", result);
	} else {
		printf("ALL TESTS PASSED\n");
	}
	printf("Tests run: %d\n", tests_run);
	
	return result != 0;
}
