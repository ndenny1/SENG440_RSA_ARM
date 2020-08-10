#include "optimized_rsa.h"

//modulus
uint160_t * M;
//private
uint160_t * D;
//public
uint160_t * E;


//used to count bitlength for Montgomery Modular Multiplication
uint16_t count_num_bits(uint160_t* value){
    uint16_t count = 0;
    uint16_t block = 0;
    int i = 159;
    for (; i >= 0; i--) {
        uint8_t bit = get_bit(value, i);
        if (bit == 0 && count == 0) {
            continue;
        }
		count++;
    }
	printf("Num bits: %d\n", count);
    return count;
}

//Montgomery Modular Multiplication
uint160_t * mmm(uint160_t * X, uint160_t * Y, uint160_t * M, uint32_t bitLength){
    register uint160_t * T = cast_to_uint160(0);
    register uint160_t * n = cast_to_uint160(0);
    int a=0;
    register uint160_t * Xi;
    uint160_t* oneCast = cast_to_uint160(1);
    uint160_t* tAnd;
    uint160_t* yAnd;
    uint160_t* xyAnd;
    uint160_t* xyMul;
    uint160_t* mulAdd;
    uint160_t* tmulAdd;
    uint160_t* nmMul;
    printf("Starting MMM\n");
    //optimized loop, decrement and compare with zero instead of increment and compare with int
    // #pragma omp parallel
    for(; a < bitLength;a++){
        Xi = cast_to_uint160(get_bit(X, a));
        tAnd = and_uint160(T, oneCast);
        yAnd = and_uint160(Y, oneCast);
        xyAnd = and_uint160(Xi, yAnd);
        n = xor_uint160(tAnd, xyAnd);
        xyMul = mul_uint160(Xi, Y);
        nmMul = mul_uint160(n, M);
        mulAdd = add_uint160(xyMul, nmMul);
        tmulAdd = add_uint160(T, mulAdd);
        T = rshift_uint160(tmulAdd, 1);
        printf("%d\n", a);
    }
    free(oneCast);
    free(tAnd);
    free(yAnd);
    free(xyAnd);
    free(xyMul);
    free(mulAdd);
    free(tmulAdd);
    free(nmMul);
    if(gte_uint160(T, M)){sub_inline(T, M);}
    return T;
}


//Modular Exponentiation
uint160_t* me(uint160_t* message, uint160_t* key, uint160_t* modulus){
	if (uint160_equal_to_zero(modulus)){
		return 0;
	}
    uint16_t key_bits = count_num_bits(key);
    uint16_t mod_bits = count_num_bits(modulus);

    uint160_t * r_squared = cast_to_uint160(1);
    uint160_t * one = cast_to_uint160(1);
    uint160_t * two = cast_to_uint160(2);
    // uint160_t* r_squared = mod_uint160(cast_to_uint160((1 << (2*mod_bits))), modulus);
    uint16_t a = 0;
	printf("Calculating rsquared\n");
    for(; a < mod_bits*2; a++){
        mul_modifying(r_squared, two);
        mod_modifying(r_squared, modulus);
    }

    free(two);
	uint160_t* C = mmm(one, r_squared, modulus, mod_bits);
    uint160_t* S = mmm(message, r_squared, modulus, mod_bits);
    free(r_squared);

    uint16_t i = 0;
    for (; i < key_bits; i++) {
        uint8_t key_i = get_bit(key, i);
        if (key_i == 1) {
            C = mmm(C, S, modulus, mod_bits);
        }
        S = mmm(S, S, modulus, mod_bits);
    }

    free(S);
    C = mmm(one, C, modulus, mod_bits);
    free(one);

	return C;
}

//Functions for easy encryption/decryption of a message
uint160_t* encrypt(uint160_t* message){
    uint32_t mArr[8] = {0x00000000,0xd4549557, 0x1f28252d, 0x003e390a, 0x0f7d1783};
    uint32_t eArr[8] = {0x00000000,0x00000000, 0x00000000, 0x00000000, 0x00010001};
    M = uint160_init(mArr);
    E = uint160_init(eArr);
    //algorithm is  C = T^E mod M (C is cypertext, T is plaintext, E is public key, M is modulus)
    return  me(message, E, M);
}
//Modulus:
//d4549557 1f28252d 003e390a 0f7d1783

//Private:
//75312a2c 27da3489 9c87f263 d9701aa1

//Public
//00000000 00000000 00000000 00010001
uint160_t* decrypt(uint160_t* encoded_message){
    uint32_t mArr[8] = {0x00000000,0xd4549557, 0x1f28252d, 0x003e390a, 0x0f7d1783};
    uint32_t dArr[8] = {0x00000000,0x75312a2c,0x27da3489,0x9c87f263, 0xd9701aa1};
    M = uint160_init(mArr);
    D = uint160_init(dArr);
    //algorithm is  T = C^D mod M (C is cypertext, T is plaintext, D is private key, M is modulus)
    return me(encoded_message, D, M);
}


int main() {

    // print_uint160("x: ", x);
    // print_uint160("y: ", y);
    // print_uint160("x + y = ", add_uint160(x, y));
    // print_uint160("x - y = ", sub_uint160(x, y));
    // print_uint160("x * y = ", mul_uint160(x, y));
    // print_uint160("x % y = ", mod_uint160(x, y));
    // print_uint160("x << 54 = ", lshift_uint160(x, 54));
    // print_uint160("x >> 54 = ", rshift_uint160(x, 54));
    // uint16_t x_bits = count_num_bits(x);
    // printf("x bits:\n");
    // uint8_t i = 1;
    // for (; i <= x_bits; i++){
    //     if (i % 4 == 0) {
    //         printf(" ");
    //     }
    //     uint8_t bit = get_bit(x, (x_bits - i));
    //     printf("%u", bit);
    // }
    // printf("\n");
    // uint160_t * x = uint160_init((uint32_t []){0, 0, 0, 0xFEDCBA98, 0x76543210});
    // uint160_t * y = uint160_init((uint32_t []){0, 0, 0, 0x01234567, 0x89ABCDEF});
    // uint160_t * mod = uint160_init((uint32_t []){0, 0, 0, 0xDEADBEEF, 0xDEADBEEF});
    // printf("mod bits: %d\n", count_num_bits(mod));
    // uint160_t * r = me(x, y, mod);
    // print_uint160("me(x, y, mod) = ", r);
    uint32_t mes = 123456789;
    uint160_t* message = cast_to_uint160(mes);
    print_uint160("Initial Message: ", message);
    uint160_t* encoded = encrypt(message);
    print_uint160("Encoded Message: ", encoded);
    uint160_t* decoded = decrypt(encoded);
    print_uint160("Decoded Message: ", decoded);
    return 0;
}   
