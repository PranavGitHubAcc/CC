%{
#include <stdio.h>
#include <string.h>

int comment_count = 0;
int keyword_count = 0;
int identifier_count = 0;
int word_count = 0;f
int line_count = 0;
int space_count = 0;

char *keywords[] = {
    "int", "float", "if", "else", "while", "for", "do", "return",
    "break", "continue", "char", "double", "void", "long", "short", "signed", "unsigned"
};

int num_keywords = sizeof(keywords)/sizeof(keywords[0]);

int is_keyword(char *word) {
    for(int i = 0; i < num_keywords; i++) {
        if(strcmp(keywords[i], word) == 0)
            return 1;
    }
    return 0;
}
%}

%%
"//".*                              { comment_count++; }
"/*"([^*]|\*+[^*/])*\*+"/"         { comment_count++; }
[ \t]+                              { space_count += yyleng; }
\n                                  { line_count++; }
[a-zA-Z_][a-zA-Z0-9_]*              {
                                        if(is_keyword(yytext))
                                            keyword_count++;
                                        else
                                            identifier_count++;
                                        word_count++;
                                    }
.                                   { /* Ignore other symbols */ }
%%

int yywrap()
{
	return 1;
}


int main() {
    yylex();
    printf("\n--- Count Summary ---\n");
    printf("Comments     : %d\n", comment_count);
    printf("Keywords     : %d\n", keyword_count);
    printf("Identifiers  : %d\n", identifier_count);
    printf("Words        : %d\n", word_count);
    printf("Lines        : %d\n", line_count);
    printf("Spaces       : %d\n", space_count);
    return 0;
}
