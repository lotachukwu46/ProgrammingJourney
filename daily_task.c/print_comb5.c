#include <stdio.h>

int main(void) {
    int digit1, digit2;

    for (digit1 = 0; digit1 <= 9; digit1++) {
        for (digit2 = 0; digit2 <= 9; digit2++) {
            // Ensure that digit2 is greater than digit1 to avoid duplicates
            if (digit2 > digit1) {
                putchar(digit1 + '0');
                putchar(digit2 + '0');

                // Add comma and space if it's not the last combination
                if (!(digit1 == 9 && digit2 == 9)) {
                    putchar(',');
                    putchar(' ');
                }
            }
        }
    }

    putchar('\n');

    return 0;
}

