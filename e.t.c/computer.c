#include <stdio.h>
#include <unistd.h>

int main() {
    // Clear the screen
    printf("\033[2J\033[1;1H");

    // Set background color to light gray for contrast
    //printf("\033[47m");

    // Draw the computer with red characters and spaces for transparency
    printf("\033[31m   ⬛⬛⬛⬛    \n");
    printf("  ⬛     ⬛   \n");
    printf(" ⬛ ⬛⬛ ⬛ ⬛ \n");
    printf("⬛ ⬛ ⬛ ⬛ ⬛⬛\n");
    printf("⬛ ⬛ ⬛⬛⬛ ⬛⬛\n");
    printf(" ⬛ ⬛   ⬛ ⬛ \n");
    printf("  ⬛     ⬛   \n");
    printf("   ⬛⬛⬛⬛    \n");

    // Add screen (darker red for depth)
    printf("\033[31;1m     ⬛⬛⬛⬛    \n");
    printf("    ⬛    ⬛    \n");
    printf("    ⬛    ⬛    \n");
    printf("    ⬛    ⬛    \n");

    // Keyboard (black on gray for keys, spaces for transparency)
    //printf("\033[30;47m       ⬛⬛⬛       \n");
    printf("      ⬛    ⬛      \n");
    printf("      ⬛    ⬛      \n");
    printf("  ⬛⬛⬛⬛    ⬛⬛⬛⬛\n");
    printf(" ⬛      ⬛⬛      ⬛\n");
    printf(" ⬛      ⬛⬛      ⬛\n");
    printf("  ⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛⬛  \n");

    // Reset colors
    printf("\033[0m");


    // Red color ANSI escape code
    printf("\033[1;31m");

    // ASCII art
    printf(" ██████╗██╗  ██╗██╗███████╗ ██████╗██╗  ██╗\n");
    printf("██╔════╝██║  ██║██║██╔════╝██╔════╝██║ ██╔╝\n");
    printf("██║     ███████║██║███████╗██║     █████╔╝\n");
    printf("██║     ██╔══██║██║╚════██║██║     ██╔═██╗\n");
    printf("╚██████╗██║  ██║██║███████║╚██████╗██║  ██╗\n");
    printf(" ╚═════╝╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝\n");

    // Reset color to default
    printf("\033[0m");


//void clearScreen() {
    //printf("\033[H\033[J");
//}
    // Adjust the number of frames and delay to control the animation
    //int frames = 50;
    //int delay = 100000;

    //for (int i = 0; i < frames; i++) {
        //clearScreen();

        // Print the moving arrow
        //for (int j = 0; j < i; j++) {
            //printf(" ");
        //}
        //printf("->\n");

        // Adjust the delay to control the animation speed
        //usleep(delay);

//void clearScreen() {
  //  printf("\033[H\033[J");  // ANSI escape code to clear the terminal screen
//}

int main() {
    int position = 0;
    int roadLength = 20;  // Adjust the road length as needed
    int delay = 100000;  // Delay in microseconds

    while (1) {
        //clearScreen();

        for (int i = 0; i < roadLength; i++) {
            if (i == position) {
                printf("🚗");  // You can replace this with a more elaborate car ASCII art
            } else {
                printf("-");
            }
        }

        fflush(stdout);
        usleep(delay);

        // Move the car to the next position
        position = (position + 1) % roadLength;
    }


    }

    return 0;
}

