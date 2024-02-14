#include <stdio.h>

int main(void)
{
	char hexDigit;

	for (hexDigit = '0'; hexDigit <= '9'; hexDigit++)
	{
		putchar(hexDigit);
		putchar('\n');
	}

	for (hexDigit = 'a'; hexDigit <= 'f'; hexDigit++)
	{
		putchar(hexDigit);
		putchar('\n');
	}

	putchar('\n');

	return (0);
}
