%{ 
#include "y.tab.h" 
%} 
noun "JSPM"|"RSCOE"|"College"|"Cat"|"Pune"|"sport"
adjective "smart"|"hot"|"main"|"nice"
verb "read"|"study"|"are"|"is"|"am"
adverb "eager"|"fast"|"quick"
conjunctions "and"|"or"|"but" 
pronoun "Mani"|"boy"|"she"|"it"|"he"|"boy" 
preposition "of"|"in"|"between"|"at"
%% 
{noun} { printf("noun: %s\n", yytext);return NOUN; } 
{pronoun} { printf("pronoun: %s\n", yytext); return PRONOUN; } 
{adjective} { printf("adjective: %s\n", yytext); return ADJECTIVE; } 
{verb} { printf("verb: %s\n", yytext); return VERB; } 
{adverb} { printf("adverb: %s\n", yytext); return ADVERB; } 
{conjunctions} { printf("conjunctions: %s\n", yytext); return CONJUNCTION; } 
{preposition} { printf("preposition: %s\n", yytext); return PREPOSITION; } 
"." { return yytext[0]; } 
%% 
int yywrap()
{ 
 return 1; 
}
