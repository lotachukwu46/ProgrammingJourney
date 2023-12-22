#include <stdio.h>
#include "file.h"
#include "file_b.h"
#include "file_c.h"
int main () {

	int operation;

	printf("Enter an operation to be performed: 1 for addition (+) , 2 for sutraction(-) and 3 to check if a number is even or odd: ");
	scanf("%d",  &operation);

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
			printf("Please enter a valid operation!");

	}







	return 0;
}
