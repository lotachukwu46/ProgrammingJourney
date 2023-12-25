#include <stdio.h>
#include "header.h"

// Oddchecker function
void oddchecker() {
	int num;

	// Prompt collecting input
	printf("enter a number: \n");
	if (scanf(" %d" , &num) != 1 ) {
		printf("Syntax ERROR please enter a valid input.\n");
		while (getchar() != '\n');

		return;
	}

	// Check if the number is even or odd
	if (num % 2 == 0) {
	       	printf("the number %d is an even number\n" , num);
	}else {	
		printf("the number %d is an odd number\n" ,  num);
	}

}
