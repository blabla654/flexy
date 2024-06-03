%{
    #include<stdio.h>
    int cc=0, wc=0, lc=0, sc=0, tc=0;
%}

%%

[^ \t\n] {cc++;}
[\n] {cc++; wc++; lc++;}
[\t] {cc++; wc++; tc++;}
[ ] {cc++; wc++; sc++;}

%%

int main() {
    yyin = fopen("in.txt", "r");
    yyout = fopen("out.txt", "w");
    yylex();
    fclose(yyin);
    fclose(yyout);
}

int yywrap() {
    fprintf(yyout, "Output:\n");
    fprintf(yyout, "Char Count: %d\n", cc);
    fprintf(yyout, "Word Count: %d\n", wc);
    fprintf(yyout, "Line Count: %d\n", lc);
    fprintf(yyout, "Space Count: %d\n", sc);
    fprintf(yyout, "Tab Count: %d\n", tc);
    return 1;
}