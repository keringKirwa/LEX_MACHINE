%{
#include <stdio.h>
%}

%%
is|am|are|were|was|be|being|been|do|does|did|will|would|should|can|could|has|have|had|go {
    printf("Recognized Verb: %s\n", yytext);
}


[a-zA-Z]+ {
    ; //ignore anything that is not a verb.
}

[\t\n]+ {
    // Ignore spaces, tabs, newlines, and other whitespace characters
}

.|\n {
    // Ignore newline characters znd a full stop.
}
%%

int main(int argc, char** argv) {
    fprintf(stdout, "Reading from <<<< %s Usage: <input_file>: %s\n", argv[1], argv[0]);

    if (argc != 2) {
        fprintf(stderr, "ERROR: Please provide the source file. Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
        fprintf(stderr, "Error: Could not open the input file %s.\n", argv[1]);
        return 1;
    }

    yylex();

    fclose(yyin);
    return 0;
}
