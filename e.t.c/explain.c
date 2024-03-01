#include <stdio.h>

int main() {

	double num;
	char henry;

	printf("enter a number:\n");
	scanf("%lf", &num);

	for (int i = 0;  i <= 500; i++)
	{
		double pdt = num * i;

		printf("%d \t  %lf \t = %lf\n", i, num, pdt);
	}

	return 0;
}
