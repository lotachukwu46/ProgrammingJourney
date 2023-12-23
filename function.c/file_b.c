//headers
#include <stdio.h>
#include "header.h"

// Subtraction function
void subtraction() {

	// Variables to store the numbers to be subtracted
	float num, num2;

	// Prompt to get user's input on numbers to be subtracted
	printf("Enter the number u want to substract: \n");
	scanf("%f %f" , &num , &num2);

	// Subtacting the values and printing the values of the result
	float difference = num - num2;
	printf("the difference between %.2f and %.2f = %.2f \n", num , num2 , difference);

}

//I also choose to use float in case of input being a float
