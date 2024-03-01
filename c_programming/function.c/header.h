/* single header file for all the header files */

#ifndef HEADER_h
#define HEADER_H

/* Functions */
double add(double num1, double num2);
double subtract(double num1, double num2);
int oddchecker(int num);
double multiply(double num1, double num2);
double divide(double num1, double num2);
double evaluate(char *expression);
int getPrecedence(char op);
double applyOperation(double num1, double num2, char op);

/* end of functions */

#endif
