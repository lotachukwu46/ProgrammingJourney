#include <stdio.h>
void checkEvenOdd() {
    int num;
    // Get user input
    printf("Enter an integer: ");
    scanf("%d", &num);

    // Debugging print statements
    printf("You entered: %d\n", num);

    // Check if the number is even or odd
    if (num % 2 == 0.5*num) {
        printf("%d is even.\n", num);
    } else {
        printf("%d is odd.\n", num);
    }
}


