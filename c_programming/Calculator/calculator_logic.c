#include "calculator_logic.h"
#include <complex.h>
#include "error_handling.h"
#include <stdio.h> /* Include for input/output functions */
#include <stdlib.h>
#include <ctype.h>
#include <limits.h>
#include <string.h>
#include <stdbool.h>
#include <math.h> /* Include for mathematical functions */
// Angle mode constants
#define DEGREES 0
#define RADIANS 1
#define GRADIANS 2

// Global variable to store the current angle mode
int current_angle_mode = DEGREES;
static bool scientific_notation_enabled = false;
int current_base = 10; /* Initialize to decimal */

/* Function prototypes for internal helper functions */
char *convert_decimal_to_base(int decimal, int base);
/* Converts decimal numbers to other bases */
int convert_base_to_decimal(const char *number, int base);
/* Convert numbers in other base to decimal */
char *add(double num1, double num2);
/* To add all numbers in all base */
char *subtract(double num1, double num2);
/* To subtract all numbers in all base */
char *multiply(double num1, double num2);
/* To multiply all numbers in all base */
char *divide(double num1, double num2);
/* To divide all numbers in all base */
// Functions prototypes for complex operations
double power(double base, double exponent);     // Handles exponentiation
double factorial(double num);
double cosine(double angle);
double tangent(double angle);
double sine(double angle);
double logarithm(double base, double value);   // Handles logarithms with different bases



/* Function implementation for basic arithemetic  in all base*/
char *add(double num1, double num2)
{
	if (current_base == 10)	/* Perform addition in decimal */
	{
		double sum = num1 + num2;
		char *result;
		asprintf(&result, "%f", sum);
		return result;
	}

	else /* Perform addition in current base */
	{
		/* Convert num1 to decimal */
                double decimal_num1 = convert_base_to_decimal(num1, current_base);
                /* Convert num2 to decimal */
                double decimal_num2 = convert_base_to_decimal(num2, current_base);

                /* Get the sum by adding their decimal values */
                double sum = decimal_num1 + decimal_num2;

                /* Convert back to orginal base */
                char *result_string = convert_decimal_to_base(sum, current_base);

		return result_string;

	}
}

char *subtract(double num1, double num2)
{
	if (current_base == 10) /* Perform subtraction in decimal */
	{
		double difference = num1 - num2;
                char *result;
                asprintf(&result, "%f", difference);
                return result;
	}
	else
	{
		/* Convert num1 to decimal */
                double decimal_num1 = convert_base_to_decimal(num1, current_base);
                /* Convert num2 to decimal */
                double decimal_num2 = convert_base_to_decimal(num2, current_base);

                /* Get the difference by dividing their decimal values */
                double difference = decimal_num1 - decimal_num2;

                /* Convert back to orginal base */
                char *result_string = convert_decimal_to_base(difference, current_base);

		return result_string;
	}
}

/* Function for multiplication */
char *multiply(double num1, double num2)
{
	if (current_base == 10) /* Preform decimal multiplication */
	{
		double product = num1 * num2;
                char *result;
                asprintf(&result, "%f", product);
                return result;
	}
	else /* Convert num1 and num2 to decimal and multiply */
	{ 
		/* Convert num1 to decimal */
		double decimal_num1 = convert_base_to_decimal(num1, current_base);
		/* Convert num2 to decimal */
		double decimal_num2 = convert_base_to_decimal(num2, current_base);

		/* Get the product by multiplying their decimal values */
		double product = decimal_num1 * decimal_num2;

		/* Convert back to orginal base */
		char *result_string = convert_decimal_to_base(product, current_base);

		return result_string
	}
}

double divide(double num1, double num2)
{
	if (num2 == 0) {
		// Handle division by zero
		fprintf(stderr, "Division by zero\n");
		return NAN;
	} else if (current base == 10)
	{
		double quotient = num1 / num2;
		char *result;
		asprintf(&result, "%.2f", quotient);
		return result;
	}
	else
	{
		/* Convert num1 to decimal */
                double decimal_num1 = convert_base_to_decimal(num1, current_base);
                /* Convert num2 to decimal */
                double decimal_num2 = convert_base_to_decimal(num2, current_base);

                /* Get the divident by dividing their decimal values */
                double quotient = decimal_num1 + decimal_num2;

                /* Convert back to orginal base */
                char *result_string = convert_decimal_to_base(quotient, current_base);

                return result_string;
	}
}

/* Functions for converting to different bases */
char *convert_decimal_to_base(int decimal, int base)
{
	/* Determine the maximum length of the result string based on the number of digits in decimal */
	int num_digits = snprintf(NULL, 0, "%d", decimal);
	/* Add 2  for any unexpected chracters */
	int max_length = num_digits + 2;
	/* Allocate memory for the result string */
	char *result_string = malloc(sizeof(char) * max_length);
	if (result_string == NULL)
	{
		fprintf(stderr, "Error: Memory allocation failed\n");
		exit(EXIT_FAILURE);

	/* Handle negative numbers */
	if (decimal < 0)
	{
		*result_string++ = '-' // add minuus sign to the beginning
			decimal = -decimal // Convert to positive for conversion
	}

	int i = 0;

	/* loop through Decimal to get the value in the respective base */
	while (decimal > 0)
	{
		int remainder = decimal % base;
		/* Covert the remainder to the corresponding character representation */
		result_string[i++] = (remainder < 10) ? remainder + '0' : remainder - 10 + 'A';
		decimal /= base;
	}
	result_string[i] = '\0';

	/* Reverse the string to get the correct order */
	char *reversed_string = malloc(sizeof(char) * (i + 1));
	if (reversed_string == NULL)
	{
		/* mMemory allocaton failed */
		fprintf(stderr, "Error: Memory allocation failed\n");
		free(result_string);  // Free previously allocated memory
		exit(EXIT_FAILURE); // Exit the program due to critical failure
	}

	int j = 0;
	for (int k = i -1; k >= 0; k--)
	{
		reversed_string[j++] = result_string[k]
	}
	reversed_string[j] = '\0';

	/* Free memory allocaton for result string */
	free(result_string);

	/* Return reversed string representing numbers in specified base */
	return reversed_string;
}

int convert_base_to_decimal(const char *number, int base)
{
	int decimal = 0; /* Initialize the decimal result to zero */
	power = 1; /* Inotialize the power of the base */
	int index = strlen(number) -1; /* Start from the right most digit */

	/* Iterate through the string from right to left */
		while (index >= 0)
		{
			int digit_value; 

			/* Convert character digit to numerical value */
			if (isdigit(number[index]))
			{
				digit_value = number[index] - '0'; /* Convert from caracter to numerical value */
			} else if (isalpha(number[index]))
			{
				digit_value = toupper(number[index]) - 'A' + 10 /* Convert from chracter to numerical value */
			} else {
				/* Handle invailed chrecters in input string */
				fprintf(stderr, "Error: Invaild character in input string\n");
				return -1; /* Return an error code */
			}

			/* Check if digit is valid for specific base */
			if (digit_value >= base)
			{
				/* Handle value excedding base */
				fprintf(stderr, "Error: Digit value exceeds base\n");
				return -1; /* return an error code */
			}

			/* Add digit value to decimal with appropriate power of the base */
			decimal += digit_value * power;

			/* Update power for the next iteration
			power *= base;

			/ Move to the next digit in the input string */
				index --;
		}
		return decimal; /* Return decimal result */
}

/* Function for power (exponentiation) */
double power(double base, double exponent)
{
	return pow(base, exponent);
}

/* Function for factorial */
double factorial(double num)
{
	if (num < 0)
	{
		fprintf(stderr, "Negative factorials are not defined.\n");
		return NAN; /* Not a Number */
	}

	double result = 1.0;
	for (int i = 2; i <= num; ++i)
	{
		result *= i;
	}
	return result;
}

double cosine(double angle)
{
	return cos(angle);
}

double tangent(double angle)
{
	return tan(angle);
}

double sine(double angle)
{
	return sin(angle);
}

double logarithm(double base, double value)
{
	if (base <= 0 || value <= 0)
	{
		fprintf(stderr, "Logarithm base cannot be zero.\n");
		return NAN;
	}
	if (base == 0)
		return log(value) / log(current_base);
	return log(value) / log(base);
}

double square_root(double num)
{
	if (num < 0)
	{
		fprintf(stderr, "Square root of negative number is not defined.\n");
		return NAN;
	}

	return sqrt(num);
}

double nth_root(double base, double root)
{
	if (root == 0)
	{
		fprintf(stderr, "Root must be non-zero.\n");
		return NAN;
	}

	if (base < 0 && fmod(root, 2) == 0)
	{
		fprintf(stderr, "Even root of a negative number is not defined.\n");
		return NAN;
	}
	return pow(base, 1.0/root);
}

double square(double num)
{
	return num * num;
}

double inverse_sin(double value)
{
	return asin(value);
}

double inverse_cos(double value)
{
	return acos(value);
}

double inverse_tan(double value)
{
	return atan(value);
}

double complex add_complex(double complex num1, double complex num2) {
    return num1 + num2;
}

double complex subtract_complex(double complex num1, double complex num2) {
    return num1 - num2;
}

double complex multiply_complex(double complex num1, double complex num2) {
    return num1 * num2;
}

double complex divide_complex(double complex num1, double complex num2) {
    return num1 / num2;
}

void set_angle_mode(int mode)
{
	if (mode == DEGREES || mode == RADIANS || mode == GRADIANS)
	{
		current_angle_mode = mode;

		printf("Angle mode set to ");
		switch (current_angle_mode)
		{
			case DEGREES:
				printf("degrees.\n");
				break;
			case RADIANS:
				printf("radiants.\n");
				break;
			case GRADIANS:
				printf("gradians.\n");
				break;
		}
	} else {
		fprintf(stderr, "Invalid angle mode.\n");
	}
}

/* Function to get the current angle mode */
int get_current_angle_mode(void) {
    return current_angle_mode;
}

bool is_scientific_notation_enabled(void) {
    return scientific_notation_enabled;
}

void enable_scientific_notation(bool enable) {
    scientific_notation_enabled = enable;
}

