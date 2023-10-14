%{
    int word_count = 0;
    //this code block allows you to  add the c code to the  lex code .
%}


%%
[a-zA-Z]+  { word_count++; }
.|\n       ;  // Ignore all other characters

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

    fclose(yyin);
    return 0;
   
}
