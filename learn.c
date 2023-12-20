#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>


void A() {

	float num;
	float num2;
	
	printf("the numbers you want to add: ");
	scanf("%f %f" , &num, &num2);
	float sum = num + num2;
	printf("The sum of %.2f and %.2f is equal to : %.2f\n" , num , num2 , sum);
}

void B() {
	float num;
	float num2;
	
	printf("the numbers you want to subtract: ");
	scanf("%f %f" , &num, &num2);
	float difference = num - num2;
	printf("The Difference between %.2f and %.2f is equal to : %.2f\n" , num , num2 , difference);
}



void C() {
	int num;
	printf("enter a number");
	scanf("%d" , &num);
	(num % 2 == 0)? printf("%d is an even number.\n", num) :
		printf("%d is an odd number.\n" , num);
	}

int main() {

	int operation;

	printf("enter an operation to perform:1 for (+) 2 for (-) 3 to check if a number is odd or even.: ");
	scanf("%d" , &operation);
	switch (operation) {
		case 1 :
			A();
			break ;
		case 2 :
			B();
			break ;
		case 3 :
			C();
			break ;
		default :
			printf("Please enter a valid operation!");

	}
	return 0 ;
}
