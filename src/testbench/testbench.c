/* file testbench.c */
#include "minunit.h"
#include "../unoptimized_rsa.h"

int tests_run = 0;

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

static char * test_encrypt_decrypt() {
	int message_to_encrypt = 0xAF0F302B;
	int encrypted_message = encrypt(message_to_encrypt);
	int decrypted_message = decrypt(encrypted_message);
	mu_assert("error, decrypted message does not equal original message", message_to_encrypt == decrypted_message);
	return 0;
}

static char * all_tests() {
	mu_run_test(test_mmm);
	mu_run_test(test_me);
	mu_run_test(test_encrypt_decrypt);
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
