%{
#include <stdio.h>
%}

%%
[a-zA-Z]+ {
    // Match English words
    if (strcmp(yytext,"abc") == 0) {

        printf("ABC");
        
    } else {
        printf("%s", yytext);
    }
}

.|\n {

    // Match and print other characters, including newlines
    printf("%s", yytext);
}
%%

int main(int argc, char** argv){
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

    fclose(yyin);
    return 0;
   
}
