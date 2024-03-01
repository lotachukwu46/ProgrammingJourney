#include <stdio.h>
#include <string.h>
#include "header.h"
#include <stdlib.h>
#include <stddef.h>
#include <ctype.h>

double evaluate(char *expression) {
    double operandStack[100];  // Stack to store operands
    char operatorStack[100];   // Stack to store operators
    int operandTop = -1;       // Top of the operand stack
    int operatorTop = -1;      // Top of the operator stack

    char *token = strtok(expression, "+-*/");

    while (token != NULL) {
        if (strcmp(token, "#") == 0) {
            // Odd checker sign detected, skip and continue
            token = strtok(NULL, "+-*/");
            continue;
        }

        // If the token is a number:
        if (isdigit(*token) || ((*token == '-' || *token == '+') && isdigit(*(token + 1)))) {
            double num = atof(token); 
            operandStack[++operandTop] = num;       
        } else {  // If the token is an operator:
            // While operator stack is not empty AND 
            // the precedence of the current operator is less than OR
            // equal to the precedence of the operator at the top of the stack:
            while (operatorTop != -1 && 
                (getPrecedence(*token) <= getPrecedence(operatorStack[operatorTop]))) {
                double num2 = operandStack[operandTop--];
                double num1 = operandStack[operandTop--];
                char op = operatorStack[operatorTop--];

                // Perform the operation and push the result onto the operand stack
                operandStack[++operandTop] = applyOperation(num1, num2, op); 
            }

            // Push the current operator onto the operator stack 
            operatorStack[++operatorTop] = *token; 
        }

        token = strtok(NULL, "+-*/");
    }

    // Process any remaining operators on the stack
    while (operatorTop != -1) {
        double num2 = operandStack[operandTop--];
        double num1 = operandStack[operandTop--];
        char op = operatorStack[operatorTop--];
        operandStack[++operandTop] = applyOperation(num1, num2, op);
    }

    if (operandTop != 0)
    {
	    printf("ERR: Invalid operation\n");
	    return 0;
    }

    // The final result should be at the top of the operand stack
    return operandStack[operandTop];
}

// Helper function to get the precedence of an operator
int getPrecedence(char op) {
    if (op == '*' || op == '/') {
        return 2;
    } else if (op == '+' || op == '-') {
        return 1;
    } else {
        return 0; // Assuming lowest precedence for any unrecognized operators
    }
}

// Helper function to perform the actual calculation 
double applyOperation(double num1, double num2, char op) {
    switch (op) {
        case '+': return add(num1, num2);
        case '-': return subtract(num1, num2);
        case '*': return multiply(num1, num2);
        case '/': return divide(num1, num2);
        default:
            printf("ERR: Invalid operation\n");
            return 0;
    }
}

