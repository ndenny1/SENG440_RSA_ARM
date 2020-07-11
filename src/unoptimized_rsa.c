#include <stdio.h>
#include <math.h>
#include "rsa.h"

//Montgomery Modular Multiplication
int mmm(int X, int Y, int M, int bitLength){
    int T = 0;
    int n = 0;
    for(int a=0; a <= bitLength-1; a++){
        int Xi = (X >> a);
        n = T ^ (Xi & Y);
        T = (T + (Xi*Y) + (n*M)) >> 1;
    }
    if(T >= M ){
        T = T - M;
    }
    return T;
}

//Modular Exponentiation
int me(){

}


int main(){

    return 0;
}