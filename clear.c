#include <stdio.h>

//this is a single comment
/* this is a c multi-line comment */
int main() {
	//practice
	int x = 5;
	int y = 6;
	float  sum = x / y;
	printf("%.2f\n",  sum);
	//studentdata
	int studentID = 15;
	int studentAge = 14;
	float studentfee = 73.4;
	char studentGrade = 'A';
	// print variables
	printf("Name of student: Lotachukwu\n");
	printf("student id: %d\n", studentID);
	printf("student age: %i\n", studentAge);
	printf("student fee: %.1f\n", studentfee);
	printf("student Grade: %c\n", studentGrade);
	// calculate the area of a triangle
	int length = 6;
	int width = 6;
	int area;
	//calculations
	area = 0.5 * width * length;
	//print the variable
	printf("Length is: %i\n", length);
	printf("breath is:%d\n", width);
	printf("area of the triangle is: %d\n", area);
	// creating variables of different data types
	int item = 10;
	float cpi = 9.54;
	float totalcost = item * cpi;
	char currency = '$';
	// print variables
	printf("number of items: %i\n", item);
	printf("cost per item: %c %.2f\n", currency, cpi);
	printf("Total cost = %c %.2f\n", currency, totalcost);


	return 0;

}
