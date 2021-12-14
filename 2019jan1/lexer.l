%option noyywrap
%option noinput
%option nounput

%{

#include <iostream>
#include <cstdlib>
#include <string>
using namespace std;
#include "parser.tab.hpp"

%}

%%

lo+l 	{
		yylval.ime = new string(yytext);
		if (yyleng > 50) {
			cout << "GRESKA! PREDUGACAK TOKEN!" << endl;
			exit(EXIT_FAILURE);
		}
		return ID;
		}

iz {return DODELA;}

[\n] {return NR;}

"orly?" {return PROVERA;}

"iz uber" {return GR;}

"iz liek" {return EQ;}

"iz nope uber" {return NGR;}

"iz nope liek" {return NEQ;}

"rofl" {return PRINT;}

"++" {return INC;}

"--" {return DEC;}

[*+/()-] {return yytext[0];}

[1-9][0-9]* {
			if(atoi(yytext) > 255 || atoi(yytext) < 0){
				cout << "broj nije u [0-255]" << endl;
				exit(EXIT_FAILURE);
			}
			yylval.broj = atoi(yytext);
			return BROJ;
			}

"ktnxbye" {return EXIT_T;}

[ \t] {;}

. 	{
	cerr << "lex err" << endl;
	exit(EXIT_FAILURE);
	}

%%

