#include <stdio.h>
#include <stdlib.h>

extern void calculeSquareRoot(float a, float b, float c);

int main (){
	
	float a;
    float b;
    float c;

    printf("----------FORMULA RESOLVENTE------------\n");
    printf("Por favor, ingrese a: \n");
    scanf("%f", &a);

    printf("Por favor, ingrese b: \n");
    scanf("%f", &b);

    printf("Por favor, ingrese c: \n");
    scanf("%f", &c);


    calculeSquareRoot(a,b,c);
	
	return 0;
}