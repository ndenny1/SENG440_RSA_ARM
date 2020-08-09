#include "unoptimized_rsa.h"

//modulus
uint256_t * M;
//private
uint256_t * D;
//public
uint256_t * E;


//used to count bitlength for Montgomery Modular Multiplication
inline uint16_t count_num_bits(uint256_t* value){
    uint16_t count = 0;
    uint16_t block = 0;
    int i = 255;
    for (; i >= 0; i--) {
        uint8_t bit = get_bit(value, i);
        if (bit == 0 && count == 0) {
            continue;
        }
        count++;
    }
    // printf("Num bits: %d\n", count);
    return count;
}

//Montgomery Modular Multiplication
uint256_t* mmm(uint256_t* X, uint256_t* Y, uint256_t* M, uint32_t bitLength){
    register uint256_t * T = cast_to_uint256(0);
    register uint256_t * n = cast_to_uint256(0);
    //unroll all instructions to save register space
    for(uint16_t a=0; a < bitLength; a++){
        register uint256_t * Xi = cast_to_uint256(get_bit(X, a));
        register uint256_t* tAnd = and_uint256(T, cast_to_uint256(1));
        register uint256_t* yAnd = and_uint256(Y, cast_to_uint256(1));
        register uint256_t* xyAnd = and_uint256(Xi, yAnd);
        n = xor_uint256(tAnd, xyAnd);
        register uint256_t* xyMul = mul_uint256(Xi, Y);
        register uint256_t* nmMul = mul_uint256(n, M);
        register uint256_t* mulAdd = add_uint256(xyMul, nmMul);
        register uint256_t* tmulAdd = add_uint256(T, mulAdd);
        T = rshift_uint256(tmulAdd, 1);
    }
    if(gte_uint256(T, M)){T = sub_uint256(T, M);}
    return T;
}

//Modular Exponentiation
uint256_t* me(uint256_t* message, uint256_t* key, uint256_t* modulus){
	if (uint256_equal_to_zero(modulus)){
		return 0;
	}
    uint16_t key_bits = count_num_bits(key);
    uint16_t mod_bits = count_num_bits(modulus);
    uint256_t* r_squared = cast_to_uint256(1);
    // uint256_t* r_squared = mod_uint256(cast_to_uint256((1 << (2*mod_bits))), modulus);
    for(uint16_t a = 0; a < mod_bits*2; a++){
        r_squared = mod_uint256(mul_uint256(r_squared,cast_to_uint256(2)), modulus);
    }
	uint256_t* C = mmm(cast_to_uint256(1), r_squared, modulus, mod_bits);
    uint256_t* S = mmm(message, r_squared, modulus, mod_bits);
    for (uint16_t i = 0; i < mod_bits; i++) {
        uint8_t key_i = get_bit(key, i);
        if (key_i == 1) {
            C = mmm(C, S, modulus, mod_bits);
        }
        S = mmm(S, S, modulus, mod_bits);
    }
    C = mmm(cast_to_uint256(1), C, modulus, mod_bits);
	return C;
}

//Functions for easy encryption/decryption of a message
uint256_t* encrypt(uint256_t* message){
    uint32_t mArr[8] = {0x00000000,0x00000000,0x00000000,0x00000000,0xd4549557, 0x1f28252d, 0x003e390a, 0x0f7d1783};
    uint32_t eArr[8] = {0x00000000,0x00000000,0x00000000,0x00000000,0x00000000, 0x00000000, 0x00000000, 0x00010001};
    M = uint256_init(mArr);
    E = uint256_init(eArr);
    //algorithm is  C = T^E mod M (C is cypertext, T is plaintext, E is public key, M is modulus)
    return  me(message, E, M);
}
//Modulus:
//d4549557 1f28252d 003e390a 0f7d1783

//Private:
//75312a2c 27da3489 9c87f263 d9701aa1

//Public
//00000000 00000000 00000000 00010001
uint256_t* decrypt(uint256_t* encoded_message){
    uint32_t mArr[8] = {0x00000000,0x00000000,0x00000000,0x00000000,0xd4549557, 0x1f28252d, 0x003e390a, 0x0f7d1783};
    uint32_t dArr[8] = {0x00000000,0x00000000,0x00000000,0x00000000,0x75312a2c,0x27da3489,0x9c87f263, 0xd9701aa1};
    M = uint256_init(mArr);
    D = uint256_init(dArr);
    //algorithm is  T = C^D mod M (C is cypertext, T is plaintext, D is private key, M is modulus)
    return me(encoded_message, D, M);
}


int main() {
    uint32_t mes = 123456789;
    uint256_t* message = cast_to_uint256(mes);
    print_uint256("Initial Message: ", message);
    uint256_t* encoded = encrypt(message);
    print_uint256("Encoded Message: ", encoded);
    uint256_t* decoded = decrypt(encoded);
    print_uint256("Decoded Message: ", decoded);
    return 0;
}   
