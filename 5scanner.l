%{
#include <stdio.h>
%}
%%
"if"|"else"|"while"|"return"|"int"|"float"|"char"|"void"  { printf("KEYWORD: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*   { printf("IDENTIFIER: %s\n", yytext); }
[0-9]+(\.[0-9]+)?        { printf("NUMBER: %s\n", yytext); }
[+\-*/=<>!]=?|&&|\|\|    { printf("OPERATOR: %s\n", yytext); }
[(){};,]                 { printf("SYMBOL: %s\n", yytext); }
\"[^\"]*\"               { printf("STRING: %s\n", yytext); }
\/\/.*                   { printf("COMMENT: %s\n", yytext); }
[ \t\n]                  { /* Ignore whitespace */ }
.                        { printf("ERROR: %s\n", yytext); }
%%
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}


/// flex 5scanner.l
//// gcc -o scanner lex.yy.c -lfl 
/// ./scanner