//headers 
#include <stdio.h>
#include "header.h"
#include <stdbool.h>

// main function 
int main () {
	int operation;
	char flag; // this is a flag for continuation
	flag = true;
	
	while (flag == true ) {
		//prompt to confirm what user wants to do then assign it to a variable 'operation!'
		printf("Enter an operation to be performed:\n");
		printf("1 for addition (+)\n");
		printf("2 for sutraction(-)\n");
		printf("3 to check if a number is even or odd: ");
		scanf("%d",  &operation);
		
		//check for value of input if not valid the display "please enter a valid operation!" and reprint option for input
		switch (operation) {
			case 1 :
				addition();
				break;
			case 2 :
					subtraction();
					break;
			case 3 :
					oddchecker();
					break;
			default :
					printf("Please enter a valid operation!\n");
					continue;

			}
	// ASk permision for continuation
	printf("Do you want to continue?(Enter 'q'or 'Q' to exit, any othe key to continue): \n");
	scanf(" %c", &flag);
	if (flag == 'q' || flag == 'Q') { 
		flag = false;
	} else { flag = true ;
	}

	}

	return 0;
}
