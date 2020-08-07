#include "unoptimized_rsa.h"
//we will need to store these somewhere in memory then point to them here
//modulus
int M = 3233;
//secret key
int D = 2753;
//public key
int E = 17;
//used to count bitlength for Montgomery Modular Multiplication
int count_num_bits(int value) {
	if (!value) return 0;
	unsigned int local_value = (unsigned int)(value >> 1);
	int count = 1;
	while (local_value) {
		local_value >>= 1;
		count++;
	}
	return count;
}

//Montgomery Modular Multiplication
int mmm(int X, int Y, int M, int bitLength){
    int T = 0;
    int n = 0;
    for(int a=0; a < bitLength; a++){
        int Xi = (X >> a) & 1;
        n = (T & 1) ^ (Xi & (Y & 1));
        T = (T + (Xi*Y) + (n*M)) >> 1;
    }
    if(T >= M ){
		T = T - M;
	}
    return T;

}

int me(int message, int key, int modulus) {
	if (!modulus) {
		return 0;
	}
	int r_squared = 1;
	// may need to be changed to u_int16_t if 1024 bit keys are used
	uint8_t key_bits = 0, mod_bits = 0;

	// Loop fusion of count_num_bits;
	unsigned int u_key = 0, u_modulus = 0;
	if (key) {
		u_key = (unsigned int) (key >> 1);
		key_bits++;
	}
	if (modulus) {
		u_modulus = (unsigned int) (modulus >> 1);
		mod_bits++;
	}
	while (u_key | u_modulus) {
		if (u_key) {
			u_key >>= 1;
			key_bits++;
		}
		if (u_modulus) {
			u_modulus >>= 1;
			mod_bits++;
			r_squared = (r_squared << 1) % modulus;
		}
	}
	uint8_t a = 0;
	for(; a < mod_bits + 1; a++) {
		r_squared = (r_squared << 1) % modulus;
	}
	int C = mmm(1, r_squared, modulus, mod_bits);
	int S = mmm(message, r_squared, modulus, mod_bits);
	uint8_t i = 0;
	for (; i < key_bits; i++){ 
		uint8_t key_i = (key >> i) & 1;
		if (key_i) {
			C = mmm(C, S, modulus, mod_bits);
		}
		S = mmm(S, S, modulus, mod_bits);
	}
	C = mmm(C, 1, modulus, mod_bits);
	return C;
}

//Functions for easy encryption/decryption of a message
int encrypt(int message){
    //we can probably get rid of this declaration, I was just using it to better understand the algorithm
    int T = message;
    //algorithm is  C = T^E mod M (C is cypertext, T is plaintext, E is public key, M is modulus)
    return  me(T, E, M);
}

int decrypt(int encoded_message){
    //we can probably get rid of this declaration, I was just using it to better understand the algorithm
    int C = encoded_message;
    //algorithm is  T = C^D mod M (C is cypertext, T is plaintext, D is private key, M is modulus)
    return me(C, D, M);
}

int main() {
    // hello world
    int message = 3231;
    printf("Initial Message: %d\n", message);
    int encoded = encrypt(message);
    printf("Encoded Message: %d\n", encoded);
    int decoded = decrypt(encoded);
    printf("Decoded Message (should be same as initial): %d\n", decoded);
    return 0;
}
