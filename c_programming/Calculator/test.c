#include <stdio.h>
#include <complex.h>

int main() {
    double real1 = 1.0, imag1 = 2.0;
    double real2 = 3.0, imag2 = 4.0;

    // Real number arithmetic
    double sum_real = real1 + real2;
    double difference_real = real1 - real2;
    double product_real = real1 * real2;
    double quotient_real = real1 / real2;

    printf("Real Number Arithmetic:\n");
    printf("Sum: %.2f\n", sum_real);
    printf("Difference: %.2f\n", difference_real);
    printf("Product: %.2f\n", product_real);
    printf("Quotient: %.2f\n\n", quotient_real);

    // Complex number arithmetic
    double complex num1 = real1 + imag1 * I;
    double complex num2 = real2 + imag2 * I;

    double complex sum_complex = num1 + num2;
    double complex difference_complex = num1 - num2;
    double complex product_complex = num1 * num2;
    double complex quotient_complex = num1 / num2;

    printf("Complex Number Arithmetic:\n");
    printf("Sum: %.2f + %.2fi\n", creal(sum_complex), cimag(sum_complex));
    printf("Difference: %.2f + %.2fi\n", creal(difference_complex), cimag(difference_complex));
    printf("Product: %.2f + %.2fi\n", creal(product_complex), cimag(product_complex));
    printf("Quotient: %.2f + %.2fi\n", creal(quotient_complex), cimag(quotient_complex));

    return 0;
}

