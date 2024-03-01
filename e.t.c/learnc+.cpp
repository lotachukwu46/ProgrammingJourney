#include <iostream>
using namespace std;

int main()
{
	string name;
	double age;
	cout << "What is your name\n";
	cin >> name;
	cout << "How old are you\n";
	cin >> age;
	cout << "Your name is " << name << "\n" << " And you are " << age << " years old. \n";
	cout << "The length of your name is: " << name.length() << " and the size of " << name << "is" << name.size() << "\n";
	return 0;
}
