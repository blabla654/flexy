%{
#include<stdio.h>
%}
%token ID Inum Ifloat Istring Ibool;
%%
S : S D
  | D 
  ;
D : ID '=' Inum {printf("Integer Declaration Identified\n");}
  | ID '=' Istring {printf("String Declaration Identified\n");}
  | ID '=' Ibool {printf("Boolean Declaration Identified\n");}
  | ID '=' Ifloat {printf("Floating Declaration Identified\n");}
  | ID '=' '[' L ']' {printf("List Declaration Identified\n");}
  | ID '=' '(' T ')' {printf("Tuple Declaration Identified\n");}
  | ID '=' '{' DI '}' {printf("Dictionary Declaration Identified\n");}
  ;
L : LI ',' L
  | LI
  ;
T : LI ',' T
  | LI
  ;
/*DI - Dictionary*/
DI : DII ',' DI
   | DII
   ;
/*DII - Dictionary Item*/
DII : LI ':' LI
    ;
LI : Istring
   | Inum
   | Ibool
   | Ifloat
   ;

%%
int main(){
    yyparse();
}