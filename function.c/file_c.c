#include <stdio.h>
#include "header.h"

// Oddchecker function
void oddchecker() {
	int num;

	// Prompt collecting input
	printf("enter a nuber: \n");
	scanf(" %d" , &num);

	// Check if the number is even or odd
	if (num % 2 == 0) {
	       	printf("the number %d is an even number\n" , num);
	}else {	
		printf("the number %d is an odd number\n" ,  num);
	}

}
