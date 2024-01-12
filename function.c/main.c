/*headers */

#include <stdio.h>
#include "header.h"
#include <stdbool.h>

/* main function */
int main(voi)
{
	int operation;
	char flag; /* this is a flag for continuation */

	flag = true;
		while (flag)
		{
			/* prompt to confirm what user wants to do */
			/*Then assign it to a variable 'operation!' */

			printf("MENU:\n");
			printf("1. for addition (+)\n");
			printf("2. for sutraction(-)\n");
			printf("3. to check if a number is even or odd\n");
			printf("4. To exit\n");
			if (scanf("%d",  &operation) != 1)
			{

			while
				(getchar() != '\n');

			printf("Invalid operation, pls select from nomber 1 - 4\n");
			continue;

		}

		bool stay_in_operation = true;

		/* check for value of input */
		/*if not valid the display "please enter a valid operation!" */
		/*and reprint option for input */
		switch (operation)
		{
			case 1:
			while (stay_in_operation)
			{
				addition();
				printf("Do u want to stay in this operation.(y/n)\n");
				scanf(" %c", &flag);
				if (flag != 'Y' && flag != 'y')
				{
					stay_in_operation = false;
				}
			}
			break;
		case 2:
			while (stay_in_operation)
			{
				subtraction();
				printf("Do u want to stay in this operation.(y/n)\n");
				scanf(" %c", &flag);
				if (flag != 'Y' && flag != 'y')
				{
					stay_in_operation = false;
				}
			}
			break;
		case 3:
			while (stay_in_operation)
			{
						oddchecker();
						printf("Do u want to stay in this operation.(y/n)\n");
						scanf(" %c", &flag);
						if (flag != 'Y' || flag != 'y')
						{
							stay_in_operation = false;
						}
					}
					break;
			case 4:
					printf("Goodbye!!\n");
					flag = false;
					break;
			default:
					printf("Please enter a valid operation!\n");
					continue;

		}

	}

	(return 0;)
}
