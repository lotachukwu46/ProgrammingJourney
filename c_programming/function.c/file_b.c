/* Headers */
#include <stdio.h>
#include "header.h"

/* Function to perform subtraction for two numbers */
void subtraction(void)
{

	/* Variables to store the numbers to be subtracted */
	float num, num2;

	/* Prompt to get user's input on numbers to be subtracted */
	printf("Enter the number u want to substract: \n");
	if (scanf("%f %f", &num, &num2) != 2)
	{
		printf("Syntax ERROR!! please enter a valid input.\n");

		while
			(getchar() != '\n');
		return;
	}

	/* Subtacting the values and printing the values of the result */
	float difference = num - num2;

	printf("%.2f - %.2f = %.2f \n", num, num2, difference);
}

/*I also choose to use float in case of input being a float */
