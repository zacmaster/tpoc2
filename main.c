#include <stdio.h>
#include <stdlib.h>

extern void calculeSquareRoot(float a, float b, float c);

int main (){
	
	float a = 5;
    float b = 2;
    float c = 3;
    calculeSquareRoot(a,b,c);
	
	return 0;
}