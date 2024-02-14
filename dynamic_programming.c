#include <stdio.h>

long fib(long n)
{ 
	if (n <= 2)
		return 1;
	return fib(n - 1) + fib(n - 2);
};

int main(void)
{
	long num;
	printf("enter a number: ");
	scanf("%ld", &num);
	printf("%ld\n", fib(num));

	return 0;
}
