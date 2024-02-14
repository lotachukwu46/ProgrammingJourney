#include <stdio.h>

int main() {
    for (int i = 0; i <= 99; i++) {
        if (i < 10) {
            putchar('0'); // Add leading zero for single-digit numbers
        }

        printf("%d", i);

        if (i < 99) {
            putchar(','); // Add comma and space for numbers less than 100
            putchar(' ');
        }
    }
    putchar('\n');

    return 0;
}

