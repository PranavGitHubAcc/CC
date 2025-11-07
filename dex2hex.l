%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+      {
                int num = atoi(yytext);   // convert text to integer
                printf("0x%X ", num);     // print in hexadecimal
            }

[ \t\n]+    ;   // ignore spaces, tabs, and newlines

.           { ECHO; } // for any other character, just print as is
%%

int main() {
    printf("Converted Hexadecimal Values:\n");
    yylex();
    return 0;
}

int yywrap() { return 1; }
