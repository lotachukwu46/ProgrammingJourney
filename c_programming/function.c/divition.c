/* Headers */
#include <stdio.h>
#include "header.h"
#include <math.h>

double divide(double num1, double num2)
{
	if (num2 == 0)
	{
		fprintf(stderr, "Math ERR");
		return NAN;
	}

	double result = num1 / num2;

	return result;
}
