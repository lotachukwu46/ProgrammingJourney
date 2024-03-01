#include <stdio.h>
#define VTAB '\013'
#define BELL '\007'
int main(void)
{
	putchar('\a');
	long num,pdt,num2;

	printf("%ld\n",num);

	printf("Enter a number: \n");
	scanf("%ld", &num);

	for (num2 = 0; num2 <= 100; num2++)
	{
		pdt = num * num2;
		printf("%3ld\t x %6ld\t = %9ld\n", num, num2, pdt);
	}
	putchar('\a');

		return 0;
}
