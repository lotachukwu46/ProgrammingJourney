#include <stdio.h>


int str(char s[])
        {
                int i;

                i = 0;

                while (s[i] != '\0')
                        ++i;
                return i;
        }

int main()
{
	char n[] = "speed, ques";

	int q = sizeof(n);

	printf("%d\n", q);

	printf("%s\n", n);
	printf("%s\n", n);

	int w = str(n);

	printf("%d\n", w);

//`	for (int i = 0; i < q; ++i)
//	{
//		printf("%d\n", n);
//	}

	return 0;
}
