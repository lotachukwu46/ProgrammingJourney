#ifndef INPUT_HANDLING_H
#define INPUT_HANDLING_H

#include <stdbool.h> /* Include for boolean values */

/* Functions prototypes for reading user input */
char *read_input_string(void);
/* Read a string of characters, including operators and numbers */
double read_input_numbers(void);
/* Reads a single number (in current base) */

/* Function prototypes for validating input */
bool is_valid_number(const char *number);
/* Check if a string represents a valid number in the in the current base */
bool is_valid_operator(char operator);
/* Check if a character is a valid operator */

bool is_valid_root_expression(const char *expression);
bool is_valid_inverse_trigonometic_expression(const char *expression);
bool is_valid_complex_number(const char *expression);
/* For memory/angle mode/unit conversion */
bool is_valid_scientific_notation(const char *expression);
bool is_valid_memory_function(char command);
/* For memory functions */
bool is_valid_angle_mode_setting(int mode);
/* For angle mode functions */

#endif
