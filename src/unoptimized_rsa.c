#include "unoptimized_rsa.h"
//we will need to store these somewhere in memory then point32_t to them here
//modulus
int32_t M = 3233;
//secret key
int32_t D = 2753;
//public key
int32_t E = 17;

//used to count bitlength for Montgomery Modular Multiplication
int32_t count_num_bits(int32_t value) {
    int32_t count = 0;

    while(value > 0) {
        count ++;
        value >>= 1;
    }
    return count;
}

//Montgomery Modular Multiplication
int32_t mmm(int32_t X, int32_t Y, int32_t M, int32_t bitLength){
    int32_t T = 0;
    int32_t n = 0;
    for(int32_t a=0; a < bitLength; a++){
        int32_t Xi = (X >> a) & 1;
        n = (T & 1) ^ (Xi & (Y & 1));
        T = (T + (Xi*Y) + (n*M)) >> 1;
    }
    if(T >= M ){T = T - M;}
    return T;

}

//Modular Exponentiation
int32_t me(int32_t message, int32_t key, int32_t modulus){
	if (modulus == 0) {
		return 0;
	}
    int32_t key_bits = count_num_bits(key);
    int32_t mod_bits = count_num_bits(modulus);
    int32_t r_squared = 1;
    for(int32_t a = 0; a < mod_bits*2; a++){
        r_squared = r_squared * 2 % modulus;
    }
	int32_t C = mmm(1, r_squared, modulus, mod_bits);
    int32_t S = mmm(message, r_squared, modulus, mod_bits);
    for (int32_t i = 0; i < key_bits; i++) {
        int32_t key_i = (key >> i) & 1;
        if (key_i == 1) {
            C = mmm(C, S, modulus, mod_bits);
        }
        S = mmm(S, S, modulus, mod_bits);
    }
    C = mmm(C,1, modulus, mod_bits);
	return C;
}

//Functions for easy encryption/decryption of a message
int32_t encrypt(int32_t message){
    //we can probably get rid of this declaration, I was just using it to better understand the algorithm
    int32_t T = message;
    //algorithm is  C = T^E mod M (C is cypertext, T is plaint32_text, E is public key, M is modulus)
    return  me(T, E, M);
}

int32_t decrypt(int32_t encoded_message){
    //we can probably get rid of this declaration, I was just using it to better understand the algorithm
    int32_t C = encoded_message;
    //algorithm is  T = C^D mod M (C is cypertext, T is plaint32_text, D is private key, M is modulus)
    return me(C, D, M);
}

int32_t main() {
    // hello world
    int32_t message = 3231;
    print32_tf("Initial Message: %d\n", message);
    int32_t encoded = encrypt(message);
    print32_tf("Encoded Message: %d\n", encoded);
    int32_t decoded = decrypt(encoded);
    print32_tf("Decoded Message (should be same as initial): %d\n", decoded);
    return 0;
}   
