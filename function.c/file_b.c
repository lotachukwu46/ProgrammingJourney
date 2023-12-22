#include <stdio.h>

void subtraction() {

	float num;
	float num2;

	printf("Enter the number u want to substract: \n");
	scanf("%f %f" , &num , &num2);

	float difference = num - num2;

	printf("the difference between %.2f and %.2f = %.2f \n", num , num2 , difference);

}
