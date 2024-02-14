#ifndef OUTPUT_HANDLING_H
#define OUTPUT_HANDLING_H

// Function prototypes for displaying results and messages
void display_result(double result); // Displays the numerical result of calculation (in current base)
void display_result_string(const char *result); // Displays a string result (e.g., error messages)
void display_error_message(const char *message); // Displays an error message

// Configuration options for output formatting
void set_numbers_of_decimal_places(int decimal_places); // sets the number of the decimal places to display
void set_scientific_notation(bool enable); // Enables or disables scientific notation for large or small numbers

#endif
