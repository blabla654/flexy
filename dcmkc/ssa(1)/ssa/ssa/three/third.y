%{
#include <stdio.h>
int yylex();
int yyerror();
%}

%token NOUN PRONOUN ADJECTIVE VERB ADVERB CONJUNCTION PREPOSITION

%%
sentence: compound {printf("COMPOND SENTENCE\n");}
    |
    simple {printf("SIMPLE SENTENCE\n");}
    ;
simple: subject VERB object;
compound: subject VERB object CONJUNCTION subject VERB object;
subject: NOUN|PRONOUN;
object: NOUN|ADJECTIVE NOUN|VERB NOUN|ADVERB NOUN|PREPOSITION NOUN;
%%
 
int yyerror()
{
return 1;
}

int main()
{
yyparse();
return 0;
}
