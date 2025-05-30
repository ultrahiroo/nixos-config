#include <stdio.h>     // printf()
#include <stdlib.h>    // EXIT_FAILURE, EXIT_SUCCESS
#include <sys/ioctl.h> // TIOCGWINSZ, winsize, ioctl()
#include <unistd.h>    // STDOUT_FILENO

int main() {
    struct winsize winsize_a;
    if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &winsize_a) == -1) {
        return (EXIT_FAILURE);
    }
    printf("\033c\033[2J\033[3J\033[%d;H", winsize_a.ws_row); // Also work with '\033[999;H' mostly
    return (EXIT_SUCCESS);
}
