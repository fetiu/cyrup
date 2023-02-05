digit   [0-9]
letter  [a-zA-z_]
delim   [ \t]
line    [;\n]
ws      {delim}+
%{
#include "y.tab.h"
%}
%%
{ws}        {}
{line}      {yyset_lineno(yyget_lineno()+1);}
"\:"        {return COLON;} /* declare or slicing */
"\."        {return POINT;} /* access or decimal */
"\="        {return ASSIGN;}
"=>"        {return RETURN;}
"\?"        {return IF;}
"||"        {return ELSE;}
"\~"        {return RANGE;}
"\|"        {return BAR;}
"\+"        {return PLUS;}
"\-"        {return MINUS;}
"\*"        {return TIMES;}
"\{"        {return LBRACE;}
"\}"        {return RBRACE;}
"\("        {return LTUPLE;}
"\)"        {return RTUPLE;}
"\["        {return LSLICE;}
"\]"        {return RSLICE;}
({letter}|{digit})+ {
    return checkIdentifier(yyget_text());
}