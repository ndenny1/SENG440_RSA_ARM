#include "unoptimized_rsa.h"
#include "int128.h"

//modulus
uint128_t * M;
//private
uint128_t * D;
//public
uint128_t * E;

//used to count bitlength for Montgomery Modular Multiplication
uint32_t count_num_bits(uint32_t value) {
    uint32_t count = 0;

    while(value > 0) {
        count ++;
        value >>= 1;
    }
    return count;
}

//Montgomery Modular Multiplication
uint32_t mmm(uint32_t X, uint32_t Y, uint32_t M, uint32_t bitLength){
    uint32_t T = 0;
    uint32_t n = 0;
    for(uint32_t a=0; a < bitLength; a++){
        uint32_t Xi = (X >> a) & 1;
        n = (T & 1) ^ (Xi & (Y & 1));
        T = (T + (Xi*Y) + (n*M)) >> 1;
    }
    if(T >= M ){T = T - M;}
    return T;

}

//Modular Exponentiation
uint32_t me(uint32_t message, uint32_t key, uint32_t modulus){
	if (modulus == 0) {
		return 0;
	}
    uint32_t key_bits = count_num_bits(key);
    uint32_t mod_bits = count_num_bits(modulus);
    uint32_t r_squared = 1;
    for(uint32_t a = 0; a < mod_bits*2; a++){
        r_squared = r_squared * 2 % modulus;
    }
	uint32_t C = mmm(1, r_squared, modulus, mod_bits);
    uint32_t S = mmm(message, r_squared, modulus, mod_bits);
    for (uint32_t i = 0; i < key_bits; i++) {
        uint32_t key_i = (key >> i) & 1;
        if (key_i == 1) {
            C = mmm(C, S, modulus, mod_bits);
        }
        S = mmm(S, S, modulus, mod_bits);
    }
    C = mmm(C,1, modulus, mod_bits);
	return C;
}

//Functions for easy encryption/decryption of a message
uint32_t encrypt(uint32_t message){
    M = uint128_init(0x00b3577dc, 0x6297458a, 0x783fa7f2, 0x5a488bf79);
    E = uint128_init(0x00000000, 0x00000000, 0x00000000, 0x00010001);
    //we can probably get rid of this declaration, I was just using it to better understand the algorithm
    uint32_t T = message;
    //algorithm is  C = T^E mod M (C is cypertext, T is plaintext, E is public key, M is modulus)
    return  me(T, E, M);
}

uint32_t decrypt(uint32_t encoded_message){
    M = uint128_init(0x00b3577dc, 0x6297458a, 0x783fa7f2, 0x5a488bf79);
    D = uint128_init(0x600c5c7c,0xf398af1d6,0xa8f85857, 0x0945c31);
    //we can probably get rid of this declaration, I was just using it to better understand the algorithm
    uint32_t C = encoded_message;
    //algorithm is  T = C^D mod M (C is cypertext, T is plaintext, D is private key, M is modulus)
    return me(C, D, M);
}


int main() {
    // hello world
    uint32_t message = "Hello World";
    printf("Initial Message: %d\n", message);
    uint32_t encoded = encrypt(message);
    printf("Encoded Message: %d\n", encoded);
    uint32_t decoded = decrypt(encoded);
    printf("Decoded Message (should be same as initial): %d\n", decoded);
    return 0;
}   
