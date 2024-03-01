#include <stdio.h>

/* Function to convert Fahrenheit to Celsius */
double toCelsius(double fahrenheit)
{
	return (5.0 / 9.0) * (fahrenheit - 32.0);
}

int main(void)
{
	double num;

	scanf("%lf", &num);
	
	/* Set a fahrenheit value */
	double f_value = num;

  /* Call the function with the fahrenheit value */
	double result = toCelsius(f_value);

  /* Print the fahrenheit value */
	printf("Fahrenheit: %.2lf\n", f_value);

  /* Print the result */
	printf("Convert Fahrenheit to Celsius: %.2lf\n", result);

	return 0;
}

