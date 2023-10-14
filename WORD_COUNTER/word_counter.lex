%{
#include <stdio.h>
int word_count = 0;
int total_size = 0;
%}

%%
[a-zA-Z]+ {
    word_count++;
    total_size += yyleng;
}
[\t\n]+ {
    // Ignore spaces, tabs, newlines, and other whitespace characters
}
. {
    // Note that the "." is a wildcard that matches all characters except the new line character.
}

%%

int main(int argc, char** argv) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    
    if (yyin == NULL) {
        fprintf(stderr, "Error: Could not open input file.\n");
        return 1;
    }

    yylex();

    printf("Number of words: %d\n", word_count);
    printf("Total Size : %d bytes\n", total_size);

    fclose(yyin);
    return 0;
   
}
