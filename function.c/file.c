/* Headers */
#include <stdio.h>
#include "header.h"

/* Addition function */
void addition(void)
{
	/* variables for the numbers to be added */
	float num,  num2;

	/* Prompt for input of numbers to me stored in the variables */
	printf("Please enter the number you want to add: \n");
	if (scanf("%f %f", &num, &num2) != 2)
	{
		printf("Syntax Error please enter a valid number.\n");

		while
			(getchar() != '\n');
		return;

	}

	/* adding the values and displaying results */
	float sum = num + num2;
		printf("The sum of %.2f and %.2f = %.2f \n", num, num2, sum);

	/* NOTE: i choosed to use floats so as to */
	/* be able to add both integers and floats */

}

