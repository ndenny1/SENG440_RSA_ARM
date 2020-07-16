#include "rsa.h"

//First two prime numbers (We are using bitwidth 128 bits)
int P;
int Q;

//Public and private exponents (We are using bitwidth 128 bits)
int D;
int E;

bool isPrime(int a){
    for(int i = 2; i < a/2; i++){
		if( a%i == 0 && a != 0) return 0;
	}
	return 1;
}

//Generates P and Q for RSA
void generatePrimes(){
        //generate a random number until a prime is found for P and Q
    	do{
            P = rand() % 32767;	
        }while(!isPrime(P));
	    do{	
            Q = rand() % 32767;	
        }while(!isPrime(Q) && (P != Q));
	return;
}

//used for checking relative primes
int greatestCommonDenom(int a, int b){
    int i;
    int greatest;
	for(i = 1; i <= a && i <= b; ++i) {
		if(a % i == 0 && b % i == 0) {greatest = i;}
	}
	return greatest;
}

//Used for checking that E and (P-1)(Q-1) are not relatively prime
bool isRelativelyPrime(int a, int b){
    if (greatestCommonDenom(a,b) == 1) return 1;
	return 0;
}

//Generate E
void generateE(){
    //find a random prime number
    do{
        E = rand() % 32767;	
    }while(!isPrime(E));
    while(1){
        //makes sure E is relatively prime
        if(isRelativelyPrime(E, (P - 1)*(Q - 1))){ return;}
        //use a different prime number is E is not relatively prime
        else{
            do{
                E = rand() % 32767;	
            }while(!isPrime(E));
        }
    }
}

//Generate D
void generateD(){
    int X = 0;
    do{
        X = rand() % 32767;	
    }while(!isPrime(E));
    float temp = 0;
    while(1){
        temp = (X * (P - 1)(Q - 1) + 1)/E;
        //make sure this equation produces a whole number
        if(temp == (int)temp){
            D = X;
            return;
        //if a whole number is not generated, try again
        } else {
            do{
                X = rand() % 32767;	
            }while(!isPrime(E));
        }
    }
}

//Montgomery Modular Multiplication
int mmm(int X, int Y, int M, int bitLength){
    int T = 0;
    int n = 0;
    for(int a=0; a <= bitLength-1; a++){
        int Xi = (X >> a);
        n = T ^ (Xi & Y);
        T = (T + (Xi*Y) + (n*M)) >> 1;
    }
    if(T >= M ){T = T - M;}
    return T;
}

//Modular Exponentiation
// int me(){
    
// }

//Functions for easy encryption/decryption of a message
// int encrypt(int message){
//     return  1;
// }

// int decrypt(int encoded_message){
//     return 1;
// }

int main(){

    return 0;
}