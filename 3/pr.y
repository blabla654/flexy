%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *msg);
int yylex(void);
%}

%token Isub Iverb Iobj Iconj Ipunc

%%
S : CS { printf("Compound Sentence\n"); }
  | SS { printf("Simple Sentence\n"); }
  ;

CS : SS Iconj SS '.' { printf("Parsed a compound sentence\n"); }
   ;

SS : Isub Iverb Iobj { printf("Parsed a simple sentence\n"); }
   ;

%%

int main(){
    yyparse();
    return 0;
}

void yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
}
