#include <stdio.h>
#include "header.h"

/* Oddchecker function */
int oddchecker(int  num)
{
	/* Check if the number is even or odd */
	if (num % 2 == 0)
	{
		printf("%d Even\n", num);
	} else
	{
		printf("%d odd\n",  num);
	}

}
