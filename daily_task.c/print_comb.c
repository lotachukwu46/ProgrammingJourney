#include <stdio.h>

int main()
{
	int digit;

	for (digit = 0; digit < 10; digit++)
	{
		putchar(digit + '0');

		if (digit < 9 )
		{
			putchar(',');
			putchar(' ');
		}
	}
	putchar('\n');

	return 0;

}
