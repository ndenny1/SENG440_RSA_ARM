#include "unoptimized_rsa.h"
//we will need to store these somewhere in memory then point to them here
//modulus
int M;
//secret key
int D;
//public key
int E;

//used to count bitlength for Montgomery Modular Multiplication
int count_num_bits(int value) {
    int count = 0;

    while(value > 0) {
        count ++;
        value >>= 1;
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
    if(T >= M ){T = T - M;}
    return T;

}

//Modular Exponentiation
int me(int message, int key, int modulus){
	if (modulus == 0) {
		return 0;
	}
    int key_bits = count_num_bits(key);
    int mod_bits = count_num_bits(modulus);
    int r_squared = 1;
    for(int a = 0; a < mod_bits*2; a++){
        r_squared = r_squared * 2 % modulus;
    }
	int C = mmm(1, r_squared, modulus, mod_bits);
    int S = mmm(message, r_squared, modulus, mod_bits);
    for (int i = 0; i < mod_bits; i++) {
        int key_i = (key >> i) & 1;
        if (key_i == 1) {
            C = mmm(C, S, modulus, mod_bits);
        }
        S = mmm(S, S, modulus, mod_bits);
    }
    C = mmm(1,C, modulus, mod_bits);
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

// int main() {
//     // hello world
//     int message = (int)"Hello world";
//     printf("Initial Message: %d\n", message);
//     int encoded = encrypt(message);
//     printf("Encoded Message: %d\n", encoded);
//     int decoded = decrypt(encoded);
//     printf("Decoded Message (should be same as initial): %d\n", decoded);
//     return 0;
// }   
