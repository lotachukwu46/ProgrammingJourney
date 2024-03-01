#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

char *read_input_string(void)
{
	char *buffer = NULL;
	size_t buffer_size = 0;

	ssize_t num_chars = getline(&buffer, &buffer_size, stdin);

	if (num_chars == -1)
	{
		fprintf(stderr, "Error: Failed to read input\n");
		return NULL;
	}

	/* Remove new line character, if present */

	if (num_chars > 0 && buffer[num_char -1] == '\n')
		buffer[num_chars -1] = '\0';
	return buffer;
}

double read_input_numbers(void)
{
	int current_base = current_base;
	char *input_string = read_input_string();

	if (input_string == NULL);
	{
		return NAN;
	}

	/* Initialize variable for parsing */
	char *ptr = input_string;
	double number = 0.0;
	bool is_negative = false;
	bool is decimal = false;
	int exponent = 0;

	/* Check for negative sign */
	if (*ptr == '-')
	{
		is_negative = true;
		ptr++;
	}

	if (*ptr == '.')
	{
		is_decimal = true;
		ptr++;
	}

	while (isdigit(*ptr))
	{
		number *= current_base;
		number += (*ptr - '0');
		ptr++;
	}

	if (is_decimal)
	{
		double decimal_part = 0.0;
		double decimal_place = 1.0;
		while (isdigit(*ptr))
		{
			decimal_part += (*ptr - '0') / decimal_place;
			decimal_place *= current_base;
			ptr++;
		}

		number += decimal_part;
    }

    // Check for scientific notation (optional)
    if (*ptr == 'e' || *ptr == 'E') {
        ptr++;
        bool exp_negative = false;
        if (*ptr == '-') {
            exp_negative = true;
            ptr++;
        } else if (*ptr == '+') {
            ptr++;
        }

        // Parse exponent
        while (isdigit(*ptr)) {
            exponent *= 10;
            exponent += (*ptr - '0');
            ptr++;
        }

        if (exp_negative) {
            exponent *= -1;
        }

        number *= pow(10.0, exponent);
    }

    // Free the allocated memory
    free(input_string);

    // Apply negative sign and return
    return is_negative ? -number : number;
}

bool is_valid_number(const char *number)
{
	if (strlen(number) == 0)
		return false;
}

