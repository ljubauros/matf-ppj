%option noyywrap
%option noinput
%option nounput

%{

#include <iostream>
#include <string>
#include <vector>
#include <cstdlib>

using namespace std;

#include "parser.tab.hpp"

%}

%%

$[a-zA-Z]+		{ yylval.s = new string(yytext);
					 return ID; }
"print"			{ return PRINT; }
[-=*+\.x(),\[\];]	{ return yytext[0]; }
\"[0-9a-zA-Z]+	{ yylval.s = new string(yytext+1); return STRING; }
[1-9][0-9]*			{ yylval.broj = atoi(yytext); return BROJ; }
[ \n\t"]				{ }
.					{ cerr << "lex err" << yytext << endl;
						exit(EXIT_FAILURE);
					}

%%
