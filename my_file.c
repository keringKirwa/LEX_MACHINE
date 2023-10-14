// checks whether the program was provided with exactly one command-line argument.

#include <stdio.h>

int main()
{
    FILE *file;
    char ch;

    file = fopen("first.txt", "r");

    if (file == NULL)
    {
        printf("Failed to open the file.\n");
        return 1;
    }
    while ((ch = fgetc(file)) != EOF)
    {
        putchar(ch);
    }

    fclose(file);

    return 0;
}
