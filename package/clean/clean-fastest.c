#include <stdlib.h> // EXIT_FAILURE, EXIT_SUCCESS
#include <unistd.h> // STDOUT_FILENO, write()

int main() {
    const char a[] = "\033c\033[2J\033[3J\033[999;H";
    if (write(STDOUT_FILENO, &a, sizeof(a)) == -1) {
        return (EXIT_FAILURE);
    }
    return (EXIT_SUCCESS);
}
