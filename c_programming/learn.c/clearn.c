#include <stdio.h>
#include <string.h>
struct mystructure {
	int num;
	char letter;
	char mystring[30];
};
struct Car {
	char brand[50];
	char model[50];
	int year;
};

enum level {
	low,
	medium,
	high
};






int main() {
	
	struct mystructure s1;
	struct mystructure s2;

	s1.num = 13;
	s1.letter = 'b';
	strcpy(s1.mystring, "some tsxt");

	s2.num = 12;
	s2.letter = 'l';

	printf("my num: %d\n" , s1.num);
	printf("my letter : %c\n" , s1.letter);
	printf("string: %s\n" , s1.mystring);

	printf("my num: %d\n" , s2.num);
        printf("my letter : %c\n" , s2.letter);

  struct Car car1 = {"BMW", "X5", 1999};
  struct Car car2 = {"Ford", "Mustang", 1969};
  struct Car car3 = {"Toyota", "Corolla", 2011};

  printf("%s %s %d\n", car1.brand, car1.model, car1.year);
  printf("%s %s %d\n", car2.brand, car2.model, car2.year);
  printf("%s %s %d\n", car3.brand, car3.model, car3.year);

  const int minutesPerHour = 60;
  const float PI = 3.14;
  int mintesperHour = 12;

  printf("%d\n", minutesPerHour);
  printf("%f\n", PI); 

  enum level myvar = medium;
  printf("%d\n" , myvar);





	return 0;
}
