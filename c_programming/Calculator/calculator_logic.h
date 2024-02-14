#ifndef CALCULATOR_LOGIC_H
#define CALCULATOR_LOGIC_H

#include <math.h> // Include math library for trigonometry and other functions

// Functions prototypes for basic arithmetic operations

char *add(double num1, double num2);
char *subtract(double num1, double num2);
char *multiply(double num1, double num2);
char *divide(double num1, double num2);

// Functions prototypes for complex operations
double power(double base, double exponent);handles exponentialtion
double factorial(double num);
double cosine(double angle);
double tangent(double angle);
double  sine(double angle);
double logarithm(double base, double value); // Handles logarithms with different bases

// Addition function for handling expressions with multiple operations
double evaluate_expression(const char *expression); // Main function to evaluate the entire expression
double evaluate_subexpression(const char *subexpression); // Helper function to evaluate parts within parentheses

// Functions for converting numbers between bases
char *convert_decimal_to_base(int decimal, int base); // Converts decimal to a specifired base
int convert_base_to_decimal(const char *number, int base); //Converts a number in a specified base to decimal

// Functions for roots
double square_root(double num);
double square(double num);
double nth_root(double base, double root);
// Functions for inverse trigonometry functions
double inverse_sin(double value);
double inverse_cos(double value);
double inverse_tan(double value);

//memory functions
void store_memory(double value); // Stores a value in memory
double recall_memory(void); // Retrieves the stored value
void clear_memory(void); // Clears the memory

// Other functions
int get_current_angle_mode(void); // Returns the current angle mode (degrees, radians, gradians)
void set_angle_mode(int mode); // sets angle mode

double complex add_complex(double complex num1, double complex num2);
double complex subtract_complex(double complex num1, double complex num2);
double complex multiply_complex(double complex num1, double complex num2);
double complex divide_complex(double complex num1, double complex num2);

bool is_scientific_notation_enabled(void);  // Checks if scientific notation is enabled
void enable_scientific_notation(bool enable);  // Enables or disables scientific notation

#endif
