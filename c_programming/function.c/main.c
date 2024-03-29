#include <stdio.h>
#include <string.h>
#include "header.h"
#include <stdlib.h>
#include <stddef.h>
#include <math.h>

#define MAX_EXPRESSION_LENGTH 100

int main(void)
{
    char expression[MAX_EXPRESSION_LENGTH];
    double result;

    printf("Enter an expression: ");
    fgets(expression, MAX_EXPRESSION_LENGTH, stdin);

    // Replace the '\n' character with a null terminator
    size_t len = strlen(expression);
    if (expression[len - 1] == '\n')
    {
        expression[len - 1] = '\0';
    }

    // Evaluate the expression
    result = evaluate(expression);

    if (!isnan(result))
    {
	    printf("Result: %.2f\n", result);
    }
    else
    {
	    printf("Error: Invalid expression\n");
    }

    return 0;
}

