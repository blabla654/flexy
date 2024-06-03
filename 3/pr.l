%{
#include <stdio.h>
#include "y.tab.h"
%}

subj "cat"|"dog"|"bird"|"computer"|"teacher"|"student"|"book"|"car"|"tree"|"house"|"sun"|"moon"|"flower"|"river"|"ocean"|"mountain"|"apple"|"banana"|"chair"|"table"|"pen"|"pencil"|"phone"|"door"|"window"|"key"|"lock"|"clock"|"hat"|"shoe"
verb "run"|"walk"|"eat"|"sleep"|"jump"|"talk"|"listen"|"read"|"write"|"sing"|"dance"|"play"|"study"|"teach"|"learn"|"drive"|"swim"|"fly"|"cook"|"clean"|"work"|"laugh"|"cry"|"think"|"remember"|"forget"|"believe"|"see"|"hear"|"smell"
obj "ball"|"apple"|"book"|"chair"|"table"|"pen"|"pencil"|"phone"|"computer"|"car"|"tree"|"flower"|"river"|"ocean"|"mountain"|"sun"|"moon"|"dog"|"cat"|"bird"|"house"|"key"|"lock"|"clock"|"hat"|"shoe"|"song"|"story"|"movie"|"painting"
conj "and"|"or"

%%
{subj} { return Isub; }
{verb} { return Iverb; }
{obj}  { return Iobj; }
{conj} { return Iconj; }
[.]    { return '.'; }
[,!?:;] { return Ipunc; }
[ \t\n]+  { /* ignore whitespace */ }
. { printf("Unrecognized character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}
