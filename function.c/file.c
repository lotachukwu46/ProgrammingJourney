#include <stdio.h>
void addition() {

        float num;
        float num2;

        printf("Please enter the number you want to add: \n");
        scanf("%f %f" , &num , &num2);
        float sum = num + num2;
        printf("The sum of %.2f and %.2f = %.2f \n" , num , num2 , sum);


}

