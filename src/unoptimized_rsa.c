#include "unoptimized_rsa.h"

//modulus
uint128_t * M;
//private
uint128_t * D;
//public
uint128_t * E;

//used to count bitlength for Montgomery Modular Multiplication
uint32_t count_num_bits(uint128_t* value){

    uint32_t count = 0;
    uint32_t h = value->high;
    uint32_t m1 = value->mid1;
    uint32_t m2 = value->mid2;
    uint32_t l = value->low;

    while(h > 0) {
        count ++;
        h >>= 1;
    }
    while(m1 > 0) {
        count ++;
        m1 >>= 1;
    }
    while(m2 > 0) {
        count ++;
        m2 >>= 1;
    }
    while(l > 0) {
        count ++;
        l >>= 1;
    }
    printf("Num bits: %d\n", count);
    return count;
}

//Montgomery Modular Multiplication
uint128_t* mmm(uint128_t* X, uint128_t* Y, uint128_t* M, uint32_t bitLength){
    uint128_t * T = cast_to_uint128(0);
    uint128_t * n = cast_to_uint128(0);
    for(uint32_t a=0; a < bitLength; a++){
        uint128_t * Xi = and_uint128(rshift_uint128(X, a), cast_to_uint128(1));
        n = xor_uint128(and_uint128(T, cast_to_uint128(1)), and_uint128(Xi, and_uint128(Y, cast_to_uint128(1))));
        T = add_uint128(T, add_uint128(mul_uint128(Xi, Y), mul_uint128(n, M)));
    }
    if(T >= M ){T = sub_uint128(T, M);}
    return T;

}

//Modular Exponentiation
uint128_t* me(uint128_t* message, uint128_t* key, uint128_t* modulus){
	if (modulus == 0) {
		return 0;
	}
    uint32_t key_bits = count_num_bits(key);
    uint32_t mod_bits = count_num_bits(modulus);
    uint128_t* r_squared = cast_to_uint128(1);
    for(uint32_t a = 0; a < mod_bits*2; a++){
        r_squared = mmm(r_squared, cast_to_uint128(2), modulus, mod_bits);
    }
	uint128_t* C = mmm(cast_to_uint128(1), r_squared, modulus, mod_bits);
    uint128_t* S = mmm(message, r_squared, modulus, mod_bits);
    for (uint32_t i = 0; i < key_bits; i++) {
        uint128_t* key_i = and_uint128(rshift_uint128(key, i),cast_to_uint128(1));
        if (key_i == cast_to_uint128(1)) {
            C = mmm(C, S, modulus, mod_bits);
        }
        S = mmm(S, S, modulus, mod_bits);
    }
    C = mmm(C,cast_to_uint128(1), modulus, mod_bits);
	return C;
}

//Functions for easy encryption/decryption of a message
uint128_t* encrypt(uint128_t* message){
    M = uint128_init(0xd4549557, 0x1f28252d, 0x003e390a, 0x0f7d1783);
    E = uint128_init(0x00000000, 0x00000000, 0x00000000, 0x00010001);
    //we can probably get rid of this declaration, I was just using it to better understand the algorithm
    uint128_t* T = message;
    //algorithm is  C = T^E mod M (C is cypertext, T is plaintext, E is public key, M is modulus)
    return  me(T, E, M);
}
//Modulus:
//d4549557 1f28252d 003e390a 0f7d1783

//Private:
//75312a2c 27da3489 9c87f263 d9701aa1
uint128_t* decrypt(uint128_t* encoded_message){
    M = uint128_init(0xd4549557, 0x1f28252d, 0x003e390a, 0x0f7d1783);
    D = uint128_init(0x75312a2c,0x27da3489,0x9c87f263, 0xd9701aa1);
    //we can probably get rid of this declaration, I was just using it to better understand the algorithm
    uint128_t* C = encoded_message;
    //algorithm is  T = C^D mod M (C is cypertext, T is plaintext, D is private key, M is modulus)
    return me(C, D, M);
}


int main() {
    // hello world
    uint128_t* message = cast_to_uint128(1289372189);
    printf("Initial Message: ");
    print_uint128(message);
    uint128_t* encoded = encrypt(message);
    printf("Encoded Message: ");
    print_uint128(encoded);
    uint128_t* decoded = decrypt(encoded);
    printf("Decoded Message (should be same as initial): ");
    print_uint128(decoded);
    return 0;
}   
