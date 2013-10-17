package sintactico;
import java_cup.runtime.*;
import java.io.FileWriter;
import java.io.PrintWriter;

import utilidades.TablaSimbolos;

%%

%int
%unicode
%cup
%line
%column
%public

%{	

	public static TablaSimbolos tablaSimbolosLexico = new TablaSimbolos();
	public static TablaSimbolos tablaSimbolos = new TablaSimbolos();
	FileWriter fw = null;
	PrintWriter pw = null;
	FileWriter fw2 = null;
	PrintWriter pw2 = null;
	FileWriter fw3 = null;
	PrintWriter pw3 = null;
	
	final int yyline() {
		return yyline + 1;
    }
    
    public void toString(String Token) {
		try {
				fw = new FileWriter("src/salidas/out.txt", true);
				pw = new PrintWriter(fw);
				pw.println(Token+ " | " +yytext());
				
				fw2 = new FileWriter("src/salidas/tabla_simbolos.txt",true);
				
				if(Token == "TOK_IDENTIFIER"){
					pw2 = new PrintWriter(fw2);
					pw2.println(Token+ " | " +yytext());
				}
		} catch (Exception e){
				e.printStackTrace();
		} finally {
			try {
				if (null != fw) {
					fw.close();
					fw2.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
    
    public void manejoErrores(String Error){
		try {
				fw3 = new FileWriter("src/salidas/errores_lex.txt", true);
				pw3 = new PrintWriter(fw3);
				pw3.println(Error);
				
		} catch (Exception e){
				e.printStackTrace();
		} finally {
			try {
				if (null != fw) {
					fw3.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public void pictureString(){
		System.out.println("TOK_PIC_TEXT");
	}
	
%}

%state PICTURE_STATE, COMMENT_STATE

%%


<YYINITIAL>{

^[\t ]*"*" { yybegin(COMMENT_STATE); }
	
[\+\-]?[0-9]+ 							{System.out.println("TOK_INTEGER");toString("TOK_INTEGER");return new Symbol(sym.TOK_INTEGER,yyline+1, yycolumn+1,yytext());}

[\+\-]?[0-9]+\.[0-9]+ 					{System.out.println("TOK_FLOAT");toString("TOK_FLOAT");return new Symbol(sym.TOK_FLOAT,yyline+1, yycolumn+1,yytext());}

\"[a-zA-Z0-9\t \-\{\}\[\]\+\-_\*|\\\/().,\:\';=><\!\$\@\#\%]*\"	{System.out.println("TOK_STRING");toString("TOK_STRING");return new Symbol(sym.TOK_STRING,yyline+1, yycolumn+1,yytext());}

\'[a-zA-Z0-9\t \-\{\}\[\]\+\-_\*|\\\/().,\:\";=><\!\$\@\#\%]*\'	{System.out.println("TOK_STRING");toString("TOK_STRING");return new Symbol(sym.TOK_STRING,yyline+1, yycolumn+1,yytext());}

ACCEPT									{ System.out.println("TOK_ACCEPT");toString("TOK_ACCEPT");return new Symbol(sym.TOK_ACCEPT,yyline+1, yycolumn+1,yytext());}
ACCESS									{ System.out.println("TOK_ACCESS");toString("TOK_ACCESS");return new Symbol(sym.TOK_ACCESS,yyline+1, yycolumn+1,yytext());}
ADD			    						{ System.out.println("TOK_ADD");toString("TOK_ADD");return new Symbol(sym.TOK_ADD,yyline+1, yycolumn+1,yytext());}
ADVANCING							{ System.out.println("TOK_ADVANCING");toString("TOK_ADVANCING");return new Symbol(sym.TOK_ADVANCING,yyline+1, yycolumn+1,yytext());}
AFTER									{ System.out.println("TOK_AFTER");toString("TOK_AFTER");return new Symbol(sym.TOK_AFTER,yyline+1, yycolumn+1,yytext());}
ALL			    							{ System.out.println("TOK_ALL");toString("TOK_ALL");return new Symbol(sym.TOK_ALL,yyline+1, yycolumn+1,yytext());}
ALPHABET								{ System.out.println("TOK_ALPHABET");toString("TOK_ALPHABET");return new Symbol(sym.TOK_ALPHABET,yyline+1, yycolumn+1,yytext());}
ALPHABETIC							{ System.out.println("TOK_ALPHABETIC");toString("TOK_ALPHABETIC");return new Symbol(sym.TOK_ALPHABETIC,yyline+1, yycolumn+1,yytext());}
ALPHABETIC-LOWER			{ System.out.println("TOK_ALPHABETIC_LOWER");toString("TOK_ALPHABETIC_LOWER");return new Symbol(sym.TOK_ALPHABETIC_LOWER,yyline+1, yycolumn+1,yytext());}
ALPHABETIC-UPPER			{ System.out.println("TOK_ALPHABETIC_UPPER");toString("TOK_ALPHABETIC_UPPER");return new Symbol(sym.TOK_ALPHABETIC_UPPER,yyline+1, yycolumn+1,yytext());}
ALPHANUMERIC					{ System.out.println("TOK_ALPHANUMERIC");toString("TOK_ALPHANUMERIC");return new Symbol(sym.TOK_ALPHANUMERIC,yyline+1, yycolumn+1,yytext());}
ALPHANUMERIC-EDITED	{ System.out.println("TOK_ALPHANUMERIC_EDITED");toString("TOK_ALPHANUMERIC_EDITED");return new Symbol(sym.TOK_ALPHANUMERIC_EDITED,yyline+1, yycolumn+1,yytext());}
ALSO										{ System.out.println("TOK_ALSO");toString("TOK_ALSO");return new Symbol(sym.TOK_ALSO,yyline+1, yycolumn+1,yytext());}
ALTER									{ System.out.println("TOK_ALTER");toString("TOK_ALTER");return new Symbol(sym.TOK_ALTER,yyline+1, yycolumn+1,yytext());}
ALTERNATE							{ System.out.println("TOK_ALTERNATE");toString("TOK_ALTERNATE");return new Symbol(sym.TOK_ALTERNATE,yyline+1, yycolumn+1,yytext());}
AND										{ System.out.println("TOK_AND");toString("TOK_AND");return new Symbol(sym.TOK_AND,yyline+1, yycolumn+1,yytext());}
ANY											{ System.out.println("TOK_ANY");toString("TOK_ANY");return new Symbol(sym.TOK_ANY,yyline+1, yycolumn+1,yytext());}
ARE											{ System.out.println("TOK_ARE");toString("TOK_ARE");return new Symbol(sym.TOK_ARE,yyline+1, yycolumn+1,yytext());}
AREA										{ System.out.println("TOK_AREA");toString("TOK_AREA");return new Symbol(sym.TOK_AREA,yyline+1, yycolumn+1,yytext());}
AREAS									{ System.out.println("TOK_AREAS");toString("TOK_AREAS");return new Symbol(sym.TOK_AREAS,yyline+1, yycolumn+1,yytext());}
ASCENDING							{ System.out.println("TOK_ASCENDING");toString("TOK_ASCENDING");return new Symbol(sym.TOK_ASCENDING,yyline+1, yycolumn+1,yytext());}
ASSIGN									{ System.out.println("TOK_ASSIGN");toString("TOK_ASSIGN");return new Symbol(sym.TOK_ASSIGN,yyline+1, yycolumn+1,yytext());}
AT											{ System.out.println("TOK_AT");toString("TOK_AT");return new Symbol(sym.TOK_AT,yyline+1, yycolumn+1,yytext());}
AUTHOR								{ System.out.println("TOK_AUTHOR");toString("TOK_AUTHOR");return new Symbol(sym.TOK_AUTHOR,yyline+1, yycolumn+1,yytext());}
BACKGROUND-COLOR		{ System.out.println("TOK_BACKGROUND_COLOR");toString("TOK_BACKGROUND_COLOR");return new Symbol(sym.TOK_BACKGROUND_COLOR,yyline+1, yycolumn+1,yytext());}
BEFORE									{ System.out.println("TOK_BEFORE");toString("TOK_BEFORE");return new Symbol(sym.TOK_BEFORE,yyline+1, yycolumn+1,yytext());}
BINARY									{ System.out.println("TOK_BINARY");toString("TOK_BINARY");return new Symbol(sym.TOK_BINARY,yyline+1, yycolumn+1,yytext());}
BLANK									{ System.out.println("TOK_BLANK");toString("TOK_BLANK");return new Symbol(sym.TOK_BLANK,yyline+1, yycolumn+1,yytext());}
BLINK										{ System.out.println("TOK_BLINK");toString("TOK_BLINK");return new Symbol(sym.TOK_BLINK,yyline+1, yycolumn+1,yytext());}
BLOCK									{ System.out.println("TOK_BLOCK");toString("TOK_BLOCK");return new Symbol(sym.TOK_BLOCK,yyline+1, yycolumn+1,yytext());}
BOTTOM								{ System.out.println("TOK_BOTTOM");toString("TOK_BOTTOM");return new Symbol(sym.TOK_BOTTOM,yyline+1, yycolumn+1,yytext());}
BY											{ System.out.println("TOK_BY");toString("TOK_BY");return new Symbol(sym.TOK_BY,yyline+1, yycolumn+1,yytext());}
CALL										{ System.out.println("TOK_CALL");toString("TOK_CALL");return new Symbol(sym.TOK_CALL,yyline+1, yycolumn+1,yytext());}
CANCEL									{ System.out.println("TOK_CANCEL");toString("TOK_CANCEL");return new Symbol(sym.TOK_CANCEL,yyline+1, yycolumn+1,yytext());}
CD											{ System.out.println("TOK_CD");toString("TOK_CD");return new Symbol(sym.TOK_CD,yyline+1, yycolumn+1,yytext());}
CF											{ System.out.println("TOK_CF");toString("TOK_CF");return new Symbol(sym.TOK_CF,yyline+1, yycolumn+1,yytext());}
CH											{ System.out.println("TOK_CH");toString("TOK_CH");return new Symbol(sym.TOK_CH,yyline+1, yycolumn+1,yytext());}
CHARACTER							{ System.out.println("TOK_CHARACTER");toString("TOK_CHARACTER");return new Symbol(sym.TOK_CHARACTER,yyline+1, yycolumn+1,yytext());}
CHARACTERS						{ System.out.println("TOK_CHARACTERS");toString("TOK_CHARACTERS");return new Symbol(sym.TOK_CHARACTERS,yyline+1, yycolumn+1,yytext());}
CLASS									{ System.out.println("TOK_CLASS");toString("TOK_CLASS");return new Symbol(sym.TOK_CLASS,yyline+1, yycolumn+1,yytext());}
CLOCK-UNITS						{ System.out.println("TOK_CLOCK_UNITS");toString("TOK_CLOCK_UNITS");return new Symbol(sym.TOK_CLOCK_UNITS,yyline+1, yycolumn+1,yytext());}
CLOSE									{ System.out.println("TOK_CLOSE");toString("TOK_CLOSE");return new Symbol(sym.TOK_CLOSE,yyline+1, yycolumn+1,yytext());}
COBOL									{ System.out.println("TOK_COBOL");toString("TOK_COBOL");return new Symbol(sym.TOK_COBOL,yyline+1, yycolumn+1,yytext());}
CODE										{ System.out.println("TOK_CODE");toString("TOK_CODE");return new Symbol(sym.TOK_CODE,yyline+1, yycolumn+1,yytext());}
CODE-SET								{ System.out.println("TOK_CODE_SET");toString("TOK_CODE_SET");return new Symbol(sym.TOK_CODE_SET,yyline+1, yycolumn+1,yytext());}
COLLATING							{ System.out.println("TOK_COLLATING");toString("TOK_COLLATING");return new Symbol(sym.TOK_COLLATING,yyline+1, yycolumn+1,yytext());}
COLUMN								{ System.out.println("TOK_COLUMN");toString("TOK_COLUMN");return new Symbol(sym.TOK_COLUMN,yyline+1, yycolumn+1,yytext());}
COMMA									{ System.out.println("TOK_COMMA");toString("TOK_COMMA");return new Symbol(sym.TOK_COMMA,yyline+1, yycolumn+1,yytext());}
COMMON								{ System.out.println("TOK_COMMON");toString("TOK_COMMON");return new Symbol(sym.TOK_COMMON,yyline+1, yycolumn+1,yytext());}
COMMUNICATION				{ System.out.println("TOK_COMMUNICATION");toString("TOK_COMMUNICATION");return new Symbol(sym.TOK_COMMUNICATION,yyline+1, yycolumn+1,yytext());}
COMP										{ System.out.println("TOK_COMP");toString("TOK_COMP");return new Symbol(sym.TOK_COMP,yyline+1, yycolumn+1,yytext());}
COMPUTATIONAL				{ System.out.println("TOK_COMPUTATIONAL");toString("TOK_COMPUTATIONAL");return new Symbol(sym.TOK_COMPUTATIONAL,yyline+1, yycolumn+1,yytext());}
COMPUTE								{ System.out.println("TOK_COMPUTE");toString("TOK_COMPUTE");return new Symbol(sym.TOK_COMPUTE,yyline+1, yycolumn+1,yytext());}
CONFIGURATION					{ System.out.println("TOK_CONFIGURATION");toString("TOK_CONFIGURATION");return new Symbol(sym.TOK_CONFIGURATION,yyline+1, yycolumn+1,yytext());}
CONSOLE								{ System.out.println("TOK_CONSOLE");toString("TOK_CONSOLE");return new Symbol(sym.TOK_CONSOLE,yyline+1, yycolumn+1,yytext());}
CONTAINS								{ System.out.println("TOK_CONTAINS");toString("TOK_CONTAINS");return new Symbol(sym.TOK_CONTAINS,yyline+1, yycolumn+1,yytext());}
CONTENT      		           		{ System.out.println("TOK_CONTENT");toString("TOK_CONTENT");return new Symbol(sym.TOK_CONTENT,yyline+1, yycolumn+1,yytext());}
CONTINUE								{ System.out.println("TOK_CONTINUE");toString("TOK_CONTINUE");return new Symbol(sym.TOK_CONTINUE,yyline+1, yycolumn+1,yytext());}
CONTROL								{ System.out.println("TOK_CONTROL");toString("TOK_CONTROL");return new Symbol(sym.TOK_CONTROL,yyline+1, yycolumn+1,yytext());}
CONTROLS							{ System.out.println("TOK_CONTROLS");toString("TOK_CONTROLS");return new Symbol(sym.TOK_CONTROLS,yyline+1, yycolumn+1,yytext());}
CORR										{ System.out.println("TOK_CORR");toString("TOK_CORR");return new Symbol(sym.TOK_CORR,yyline+1, yycolumn+1,yytext());}
CORRESPONDING				{ System.out.println("TOK_CORRESPONDING");toString("TOK_CORRESPONDING");return new Symbol(sym.TOK_CORRESPONDING,yyline+1, yycolumn+1,yytext());}
COUNT									{ System.out.println("TOK_COUNT");toString("TOK_COUNT");return new Symbol(sym.TOK_COUNT,yyline+1, yycolumn+1,yytext());}
CURRENCY							{ System.out.println("TOK_CURRENCY");toString("TOK_CURRENCY");return new Symbol(sym.TOK_CURRENCY,yyline+1, yycolumn+1,yytext());}
DATA										{ System.out.println("TOK_DATA");toString("TOK_DATA");return new Symbol(sym.TOK_DATA,yyline+1, yycolumn+1,yytext());}
DATE										{ System.out.println("TOK_DATE");toString("TOK_DATE");return new Symbol(sym.TOK_DATE,yyline+1, yycolumn+1,yytext());}
DATE-COMPILED					{ System.out.println("TOK_DATE_COMPILED");toString("TOK_DATE_COMPILED");return new Symbol(sym.TOK_DATE_COMPILED,yyline+1, yycolumn+1,yytext());}
DATE-WRITTEN					{ System.out.println("TOK_DATE_WRITTEN");toString("TOK_DATE_WRITTEN");return new Symbol(sym.TOK_DATE_WRITTEN,yyline+1, yycolumn+1,yytext());}
DAY											{ System.out.println("TOK_DAY");toString("TOK_DAY");return new Symbol(sym.TOK_DAY,yyline+1, yycolumn+1,yytext());}
DAY-OF-WEEK						{ System.out.println("TOK_DAY_OF_WEEK");toString("TOK_DAY_OF_WEEK");return new Symbol(sym.TOK_DAY_OF_WEEK,yyline+1, yycolumn+1,yytext());}
DE											{ System.out.println("TOK_DE");toString("TOK_DE");return new Symbol(sym.TOK_DE,yyline+1, yycolumn+1,yytext());}
DEBUG-CONTENTS				{ System.out.println("TOK_DEBUG_CONTENTS");toString("TOK_DEBUG_CONTENTS");return new Symbol(sym.TOK_DEBUG_CONTENTS,yyline+1, yycolumn+1,yytext());}
DEBUG-ITEM							{ System.out.println("TOK_DEBUG_ITEM");toString("TOK_DEBUG_ITEM");return new Symbol(sym.TOK_DEBUG_ITEM,yyline+1, yycolumn+1,yytext());}
DEBUG-LINE							{ System.out.println("TOK_DEBUG_LINE");toString("TOK_DEBUG_LINE");return new Symbol(sym.TOK_DEBUG_LINE,yyline+1, yycolumn+1,yytext());}
DEBUG-NAME						{ System.out.println("TOK_DEBUG_NAME");toString("TOK_DEBUG_NAME");return new Symbol(sym.TOK_DEBUG_NAME,yyline+1, yycolumn+1,yytext());}
DEBUG-SUB-1						{ System.out.println("TOK_DEBUG_SUB_1");toString("TOK_DEBUG_SUB_1");return new Symbol(sym.TOK_DEBUG_SUB_1,yyline+1, yycolumn+1,yytext());}
DEBUG-SUB-2						{ System.out.println("TOK_DEBUG_SUB_2");toString("TOK_DEBUG_SUB_2");return new Symbol(sym.TOK_DEBUG_SUB_2,yyline+1, yycolumn+1,yytext());}
DEBUG-SUB-3						{ System.out.println("TOK_DEBUG_SUB_3");toString("TOK_DEBUG_SUB_3");return new Symbol(sym.TOK_DEBUG_SUB_3,yyline+1, yycolumn+1,yytext());}
DEBUGGING							{ System.out.println("TOK_DEBUGGING");toString("TOK_DEBUGGING");return new Symbol(sym.TOK_DEBUGGING,yyline+1, yycolumn+1,yytext());}
DECIMAL-POINT					{ System.out.println("TOK_DECIMAL_POINT");toString("TOK_DECIMAL_POINT");return new Symbol(sym.TOK_DECIMAL_POINT,yyline+1, yycolumn+1,yytext());}
DECLARATIVES					{ System.out.println("TOK_DECLARATIVES");toString("TOK_DECLARATIVES");return new Symbol(sym.TOK_DECLARATIVES,yyline+1, yycolumn+1,yytext());}
DELETE									{ System.out.println("TOK_DELETE");toString("TOK_DELETE");return new Symbol(sym.TOK_DELETE,yyline+1, yycolumn+1,yytext());}
DELIMITED								{ System.out.println("TOK_DELIMITED");toString("TOK_DELIMITED");return new Symbol(sym.TOK_DELIMITED,yyline+1, yycolumn+1,yytext());}
DELIMITER								{ System.out.println("TOK_DELIMITER");toString("TOK_DELIMITER");return new Symbol(sym.TOK_DELIMITER,yyline+1, yycolumn+1,yytext());}
DEPENDING							{ System.out.println("TOK_DEPENDING");toString("TOK_DEPENDING");return new Symbol(sym.TOK_DEPENDING,yyline+1, yycolumn+1,yytext());}
DEPTH									{ System.out.println("TOK_DEPTH");toString("TOK_DEPTH");return new Symbol(sym.TOK_DEPTH,yyline+1, yycolumn+1,yytext());}
DESCENDING						{ System.out.println("TOK_DESCENDING");toString("TOK_DESCENDING");return new Symbol(sym.TOK_DESCENDING,yyline+1, yycolumn+1,yytext());}
DESTINATION						{ System.out.println("TOK_DESTINATION");toString("TOK_DESTINATION");return new Symbol(sym.TOK_DESTINATION,yyline+1, yycolumn+1,yytext());}
DETAIL									{ System.out.println("TOK_DETAIL");toString("TOK_DETAIL");return new Symbol(sym.TOK_DETAIL,yyline+1, yycolumn+1,yytext());}
DISABLE									{ System.out.println("TOK_DISABLE");toString("TOK_DISABLE");return new Symbol(sym.TOK_DISABLE,yyline+1, yycolumn+1,yytext());}
DISPLAY									{ System.out.println("TOK_DISPLAY");toString("TOK_DISPLAY");return new Symbol(sym.TOK_DISPLAY,yyline+1, yycolumn+1,yytext());}
DIVIDE									{ System.out.println("TOK_DIVIDE");toString("TOK_DIVIDE");return new Symbol(sym.TOK_DIVIDE,yyline+1, yycolumn+1,yytext());}
DIVISION								{ System.out.println("TOK_DIVISION");toString("TOK_DIVISION");return new Symbol(sym.TOK_DIVISION,yyline+1, yycolumn+1,yytext());}
DOWN									{ System.out.println("TOK_DOWN");toString("TOK_DOWN");return new Symbol(sym.TOK_DOWN,yyline+1, yycolumn+1,yytext());}
DUPLICATES							{ System.out.println("TOK_DUPLICATES");toString("TOK_DUPLICATES");return new Symbol(sym.TOK_DUPLICATES,yyline+1, yycolumn+1,yytext());}
DYNAMIC								{ System.out.println("TOK_DYNAMIC");toString("TOK_DYNAMIC");return new Symbol(sym.TOK_DYNAMIC,yyline+1, yycolumn+1,yytext());}
EGI											{ System.out.println("TOK_EGI");toString("TOK_EGI");return new Symbol(sym.TOK_EGI,yyline+1, yycolumn+1,yytext());}
ELSIF										{ System.out.println("TOK_ELSIF");toString("TOK_ELSIF");return new Symbol(sym.TOK_ELSIF,yyline+1, yycolumn+1,yytext());}
ELSE										{ System.out.println("TOK_ELSE");toString("TOK_ELSE");return new Symbol(sym.TOK_ELSE,yyline+1, yycolumn+1,yytext());}
EMI											{ System.out.println("TOK_EMI");toString("TOK_EMI");return new Symbol(sym.TOK_EMI,yyline+1, yycolumn+1,yytext());}
ENABLE									{ System.out.println("TOK_ENABLE");toString("TOK_ENABLE");return new Symbol(sym.TOK_ENABLE,yyline+1, yycolumn+1,yytext());}
END										{ System.out.println("TOK_END");toString("TOK_END");return new Symbol(sym.TOK_END,yyline+1, yycolumn+1,yytext());}
END-ADD								{ System.out.println("TOK_END_ADD");toString("TOK_END_ADD");return new Symbol(sym.TOK_END_ADD,yyline+1, yycolumn+1,yytext());}
END-CALL								{ System.out.println("TOK_END_CALL");toString("TOK_END_CALL");return new Symbol(sym.TOK_END_CALL,yyline+1, yycolumn+1,yytext());}
END-COMPUTE					{ System.out.println("TOK_END_COMPUTE");toString("TOK_END_COMPUTE");return new Symbol(sym.TOK_END_COMPUTE,yyline+1, yycolumn+1,yytext());}
END-DELETE							{ System.out.println("TOK_END_DELETE");toString("TOK_END_DELETE");return new Symbol(sym.TOK_END_DELETE,yyline+1, yycolumn+1,yytext());}
END-DIVIDE							{ System.out.println("TOK_END_DIVIDE");toString("TOK_END_DIVIDE");return new Symbol(sym.TOK_END_DIVIDE,yyline+1, yycolumn+1,yytext());}
END-EVALUATE					{ System.out.println("TOK_END_EVALUATE");toString("TOK_END_EVALUATE");return new Symbol(sym.TOK_END_EVALUATE,yyline+1, yycolumn+1,yytext());}
END-IF									{ System.out.println("TOK_END_IF");toString("TOK_END_IF");return new Symbol(sym.TOK_END_IF,yyline+1, yycolumn+1,yytext());}
END-MULTIPLY						{ System.out.println("TOK_END_MULTIPLY");toString("TOK_END_MULTIPLY");return new Symbol(sym.TOK_END_MULTIPLY,yyline+1, yycolumn+1,yytext());}
END-OF-PAGE						{ System.out.println("TOK_END_OF_PAGE");toString("TOK_END_OF_PAGE");return new Symbol(sym.TOK_END_OF_PAGE,yyline+1, yycolumn+1,yytext());}
END-PERFORM					{ System.out.println("TOK_END_PERFORM");toString("TOK_END_PERFORM");return new Symbol(sym.TOK_END_PERFORM,yyline+1, yycolumn+1,yytext());}
END-READ								{ System.out.println("TOK_END_READ");toString("TOK_END_READ");return new Symbol(sym.TOK_END_READ,yyline+1, yycolumn+1,yytext());}
END-RECEIVE						{ System.out.println("TOK_END_RECEIVE");toString("TOK_END_RECEIVE");return new Symbol(sym.TOK_END_RECEIVE,yyline+1, yycolumn+1,yytext());}
END-RETURN						{ System.out.println("TOK_END_RETURN");toString("TOK_END_RETURN");return new Symbol(sym.TOK_END_RETURN,yyline+1, yycolumn+1,yytext());}
END-REWRITE						{ System.out.println("TOK_END_REWRITE");toString("TOK_END_REWRITE");return new Symbol(sym.TOK_END_REWRITE,yyline+1, yycolumn+1,yytext());}
END-SEARCH						{ System.out.println("TOK_END_SEARCH");toString("TOK_END_SEARCH");return new Symbol(sym.TOK_END_SEARCH,yyline+1, yycolumn+1,yytext());}
END-START							{ System.out.println("TOK_END_START");toString("TOK_END_START");return new Symbol(sym.TOK_END_START,yyline+1, yycolumn+1,yytext());}
END-STRING							{ System.out.println("TOK_END_STRING");toString("TOK_END_STRING");return new Symbol(sym.TOK_END_STRING,yyline+1, yycolumn+1,yytext());}
END-SUBTRACT					{ System.out.println("TOK_END_SUBTRACT");toString("TOK_END_SUBTRACT");return new Symbol(sym.TOK_END_SUBTRACT,yyline+1, yycolumn+1,yytext());}
END-UNSTRING					{ System.out.println("TOK_END_UNSTRING");toString("TOK_END_UNSTRING");return new Symbol(sym.TOK_END_UNSTRING,yyline+1, yycolumn+1,yytext());}
END-WRITE							{ System.out.println("TOK_END_WRITE");toString("TOK_END_WRITE");return new Symbol(sym.TOK_END_WRITE,yyline+1, yycolumn+1,yytext());}
ENTER									{ System.out.println("TOK_ENTER");toString("TOK_ENTER");return new Symbol(sym.TOK_ENTER,yyline+1, yycolumn+1,yytext());}
ENVIRONMENT						{ System.out.println("TOK_ENVIRONMENT");toString("TOK_ENVIRONMENT");return new Symbol(sym.TOK_ENVIRONMENT,yyline+1, yycolumn+1,yytext());}
EOP										{ System.out.println("TOK_EOP");toString("TOK_EOP");return new Symbol(sym.TOK_EOP,yyline+1, yycolumn+1,yytext());}
EQUAL									{ System.out.println("TOK_EQUAL");toString("TOK_EQUAL");return new Symbol(sym.TOK_EQUAL,yyline+1, yycolumn+1,yytext());}
ERROR									{ System.out.println("TOK_ERROR");toString("TOK_ERROR");return new Symbol(sym.TOK_ERROR,yyline+1, yycolumn+1,yytext());}
ESI											{ System.out.println("TOK_ESI");toString("TOK_ESI");return new Symbol(sym.TOK_ESI,yyline+1, yycolumn+1,yytext());}
EVALUATE								{ System.out.println("TOK_EVALUATE");toString("TOK_EVALUATE");return new Symbol(sym.TOK_EVALUATE,yyline+1, yycolumn+1,yytext());}
EVERY									{ System.out.println("TOK_EVERY");toString("TOK_EVERY");return new Symbol(sym.TOK_EVERY,yyline+1, yycolumn+1,yytext());}
EXCEPTION							{ System.out.println("TOK_EXCEPTION");toString("TOK_EXCEPTION");return new Symbol(sym.TOK_EXCEPTION,yyline+1, yycolumn+1,yytext());}
EXIT										{ System.out.println("TOK_EXIT");toString("TOK_EXIT");return new Symbol(sym.TOK_EXIT,yyline+1, yycolumn+1,yytext());}
EXTEND									{ System.out.println("TOK_EXTEND");toString("TOK_EXTEND");return new Symbol(sym.TOK_EXTEND,yyline+1, yycolumn+1,yytext());}
EXTERNAL								{ System.out.println("TOK_EXTERNAL");toString("TOK_EXTERNAL");return new Symbol(sym.TOK_EXTERNAL,yyline+1, yycolumn+1,yytext());}
FALSE										{ System.out.println("TOK_FALSE");toString("TOK_FALSE");return new Symbol(sym.TOK_FALSE,yyline+1, yycolumn+1,yytext());}
FD											{ System.out.println("TOK_FD");toString("TOK_FD");return new Symbol(sym.TOK_FD,yyline+1, yycolumn+1,yytext());}
FILE											{ System.out.println("TOK_FILE");toString("TOK_FILE");return new Symbol(sym.TOK_FILE,yyline+1, yycolumn+1,yytext());}
FILE-CONTROL						{ System.out.println("TOK_FILE_CONTROL");toString("TOK_FILE_CONTROL");return new Symbol(sym.TOK_FILE_CONTROL,yyline+1, yycolumn+1,yytext());}
FILE-ID									{ System.out.println("TOK_FILE_ID");toString("TOK_FILE_ID");return new Symbol(sym.TOK_FILE_ID,yyline+1, yycolumn+1,yytext());}
FILLER									{ System.out.println("TOK_FILLER");toString("TOK_FILLER");return new Symbol(sym.TOK_FILLER,yyline+1, yycolumn+1,yytext());}
FINAL										{ System.out.println("TOK_FINAL");toString("TOK_FINAL");return new Symbol(sym.TOK_FINAL,yyline+1, yycolumn+1,yytext());}
FIRST										{ System.out.println("TOK_FIRST");toString("TOK_FIRST");return new Symbol(sym.TOK_FIRST,yyline+1, yycolumn+1,yytext());}
FOOTING								{ System.out.println("TOK_FOOTING");toString("TOK_FOOTING");return new Symbol(sym.TOK_FOOTING,yyline+1, yycolumn+1,yytext());}
FOR										{ System.out.println("TOK_FOR");toString("TOK_FOR");return new Symbol(sym.TOK_FOR,yyline+1, yycolumn+1,yytext());}
FOREGROUND-COLOR		{ System.out.println("TOK_FOREGROUND_COLOR");toString("TOK_FOREGROUND_COLOR");return new Symbol(sym.TOK_FOREGROUND_COLOR,yyline+1, yycolumn+1,yytext());}
FROM										{ System.out.println("TOK_FROM");toString("TOK_FROM");return new Symbol(sym.TOK_FROM,yyline+1, yycolumn+1,yytext());}
GENERATE							{ System.out.println("TOK_GENERATE");toString("TOK_GENERATE");return new Symbol(sym.TOK_GENERATE,yyline+1, yycolumn+1,yytext());}
GIVING									{ System.out.println("TOK_GIVING");toString("TOK_GIVING");return new Symbol(sym.TOK_GIVING,yyline+1, yycolumn+1,yytext());}
GLOBAL									{ System.out.println("TOK_GLOBAL");toString("TOK_GLOBAL");return new Symbol(sym.TOK_GLOBAL,yyline+1, yycolumn+1,yytext());}
GO											{ System.out.println("TOK_GO");toString("TOK_GO");return new Symbol(sym.TOK_GO,yyline+1, yycolumn+1,yytext());}
GREATER								{ System.out.println("TOK_GREATER");toString("TOK_GREATER");return new Symbol(sym.TOK_GREATER,yyline+1, yycolumn+1,yytext());}
GROUP									{ System.out.println("TOK_GROUP");toString("TOK_GROUP");return new Symbol(sym.TOK_GROUP,yyline+1, yycolumn+1,yytext());}
HEADING								{ System.out.println("TOK_HEADING");toString("TOK_HEADING");return new Symbol(sym.TOK_HEADING,yyline+1, yycolumn+1,yytext());}
HIGH-VALUE	|
HIGH-VALUES						{ System.out.println("TOK_HIGH_VALUE");toString("TOK_HIGH_VALUE");return new Symbol(sym.TOK_HIGH_VALUE,yyline+1, yycolumn+1,yytext());}
HIGHLIGHT							{ System.out.println("TOK_HIGHLIGHT");toString("TOK_HIGHLIGHT");return new Symbol(sym.TOK_HIGHLIGHT,yyline+1, yycolumn+1,yytext());}
I-O											{ System.out.println("TOK_I_O");toString("TOK_I_O");return new Symbol(sym.TOK_I_O,yyline+1, yycolumn+1,yytext());}
I-O-CONTROL						{ System.out.println("TOK_I_O_CONTROL");toString("TOK_I_O_CONTROL");return new Symbol(sym.TOK_I_O_CONTROL,yyline+1, yycolumn+1,yytext());}
IDENTIFICATION					{ System.out.println("TOK_IDENTIFICATION");toString("TOK_IDENTIFICATION");return new Symbol(sym.TOK_IDENTIFICATION,yyline+1, yycolumn+1,yytext());}
IF												{ System.out.println("TOK_IF");toString("TOK_IF");return new Symbol(sym.TOK_IF,yyline+1, yycolumn+1,yytext());}
IN												{ System.out.println("TOK_IN");toString("TOK_IN");return new Symbol(sym.TOK_IN,yyline+1, yycolumn+1,yytext());}
INDEX										{ System.out.println("TOK_INDEX");toString("TOK_INDEX");return new Symbol(sym.TOK_INDEX,yyline+1, yycolumn+1,yytext());}
INDEXED								{ System.out.println("TOK_INDEXED");toString("TOK_INDEXED");return new Symbol(sym.TOK_INDEXED,yyline+1, yycolumn+1,yytext());}
INDICATE								{ System.out.println("TOK_INDICATE");toString("TOK_INDICATE");return new Symbol(sym.TOK_INDICATE,yyline+1, yycolumn+1,yytext());}
INITIAL									{ System.out.println("TOK_INITIAL");toString("TOK_INITIAL");return new Symbol(sym.TOK_INITIAL,yyline+1, yycolumn+1,yytext());}
INITIALIZE								{ System.out.println("TOK_INITIALIZE");toString("TOK_INITIALIZE");return new Symbol(sym.TOK_INITIALIZE,yyline+1, yycolumn+1,yytext());}
INITIATE									{ System.out.println("TOK_INITIATE");toString("TOK_INITIATE");return new Symbol(sym.TOK_INITIATE,yyline+1, yycolumn+1,yytext());}
INPUT										{ System.out.println("TOK_INPUT");toString("TOK_INPUT");return new Symbol(sym.TOK_INPUT,yyline+1, yycolumn+1,yytext());}
INPUT-OUTPUT					{ System.out.println("TOK_INPUT_OUTPUT");toString("TOK_INPUT_OUTPUT");return new Symbol(sym.TOK_INPUT_OUTPUT,yyline+1, yycolumn+1,yytext());}
INSPECT								{ System.out.println("TOK_INSPECT");toString("TOK_INSPECT");return new Symbol(sym.TOK_INSPECT,yyline+1, yycolumn+1,yytext());}
INSTALLATION						{ System.out.println("TOK_INSTALLATION");toString("TOK_INSTALLATION");return new Symbol(sym.TOK_INSTALLATION,yyline+1, yycolumn+1,yytext());}
INTO										{ System.out.println("TOK_INTO");toString("TOK_INTO");return new Symbol(sym.TOK_INTO,yyline+1, yycolumn+1,yytext());}
INVALID									{ System.out.println("TOK_INVALID");toString("TOK_INVALID");return new Symbol(sym.TOK_INVALID,yyline+1, yycolumn+1,yytext());}
IS												{ System.out.println("TOK_IS");toString("TOK_IS");return new Symbol(sym.TOK_IS,yyline+1, yycolumn+1,yytext());}
JUST										{ System.out.println("TOK_JUST");toString("TOK_JUST");return new Symbol(sym.TOK_JUST,yyline+1, yycolumn+1,yytext());}
JUSTIFIED								{ System.out.println("TOK_JUSTIFIED");toString("TOK_JUSTIFIED");return new Symbol(sym.TOK_JUSTIFIED,yyline+1, yycolumn+1,yytext());}
KEY											{ System.out.println("TOK_KEY");toString("TOK_KEY");return new Symbol(sym.TOK_KEY,yyline+1, yycolumn+1,yytext());}
LABEL										{ System.out.println("TOK_LABEL");toString("TOK_LABEL");return new Symbol(sym.TOK_LABEL,yyline+1, yycolumn+1,yytext());}
LAST										{ System.out.println("TOK_LAST");toString("TOK_LAST");return new Symbol(sym.TOK_LAST,yyline+1, yycolumn+1,yytext());}
LEADING								{ System.out.println("TOK_LEADING");toString("TOK_LEADING");return new Symbol(sym.TOK_LEADING,yyline+1, yycolumn+1,yytext());}
LEFT										{ System.out.println("TOK_LEFT");toString("TOK_LEFT");return new Symbol(sym.TOK_LEFT,yyline+1, yycolumn+1,yytext());}
LENGTH									{ System.out.println("TOK_LENGTH");toString("TOK_LENGTH");return new Symbol(sym.TOK_LENGTH,yyline+1, yycolumn+1,yytext());}
LESS										{ System.out.println("TOK_LESS");toString("TOK_LESS");return new Symbol(sym.TOK_LESS,yyline+1, yycolumn+1,yytext());}
LIMIT										{ System.out.println("TOK_LIMIT");toString("TOK_LIMIT");return new Symbol(sym.TOK_LIMIT,yyline+1, yycolumn+1,yytext());}
LIMITS										{ System.out.println("TOK_LIMITS");toString("TOK_LIMITS");return new Symbol(sym.TOK_LIMITS,yyline+1, yycolumn+1,yytext());}
LINAGE									{ System.out.println("TOK_LINAGE");toString("TOK_LINAGE");return new Symbol(sym.TOK_LINAGE,yyline+1, yycolumn+1,yytext());}
LINAGE-COUNTER				{ System.out.println("TOK_LINAGE_COUNTER");toString("TOK_LINAGE_COUNTER");return new Symbol(sym.TOK_LINAGE_COUNTER,yyline+1, yycolumn+1,yytext());}
LINE										{ System.out.println("TOK_LINE");toString("TOK_LINE");return new Symbol(sym.TOK_LINE,yyline+1, yycolumn+1,yytext());}
LINE-COUNTER					{ System.out.println("TOK_LINE_COUNTER");toString("TOK_LINE_COUNTER");return new Symbol(sym.TOK_LINE_COUNTER,yyline+1, yycolumn+1,yytext());}
LINES										{ System.out.println("TOK_LINES");toString("TOK_LINES");return new Symbol(sym.TOK_LINES,yyline+1, yycolumn+1,yytext());}
LINKAGE								{ System.out.println("TOK_LINKAGE");toString("TOK_LINKAGE");return new Symbol(sym.TOK_LINKAGE,yyline+1, yycolumn+1,yytext());}
LOCK										{ System.out.println("TOK_LOCK");toString("TOK_LOCK");return new Symbol(sym.TOK_LOCK,yyline+1, yycolumn+1,yytext());}
LOW-VALUE	|
LOW-VALUES						{ System.out.println("TOK_LOW_VALUE");toString("TOK_LOW_VALUE");return new Symbol(sym.TOK_LOW_VALUE,yyline+1, yycolumn+1,yytext());}
MEMORY								{ System.out.println("TOK_MEMORY");toString("TOK_MEMORY");return new Symbol(sym.TOK_MEMORY,yyline+1, yycolumn+1,yytext());}
MERGE									{ System.out.println("TOK_MERGE");toString("TOK_MERGE");return new Symbol(sym.TOK_MERGE,yyline+1, yycolumn+1,yytext());}
MESSAGE								{ System.out.println("TOK_MESSAGE");toString("TOK_MESSAGE");return new Symbol(sym.TOK_MESSAGE,yyline+1, yycolumn+1,yytext());}
MODE										{ System.out.println("TOK_MODE");toString("TOK_MODE");return new Symbol(sym.TOK_MODE,yyline+1, yycolumn+1,yytext());}
MODULES								{ System.out.println("TOK_MODULES");toString("TOK_MODULES");return new Symbol(sym.TOK_MODULES,yyline+1, yycolumn+1,yytext());}
MOVE										{ System.out.println("TOK_MOVE");toString("TOK_MOVE");return new Symbol(sym.TOK_MOVE,yyline+1, yycolumn+1,yytext());}
MULTIPLE								{ System.out.println("TOK_MULTIPLE");toString("TOK_MULTIPLE");return new Symbol(sym.TOK_MULTIPLE,yyline+1, yycolumn+1,yytext());}
MULTIPLY								{ System.out.println("TOK_MULTIPLY");toString("TOK_MULTIPLY");return new Symbol(sym.TOK_MULTIPLY,yyline+1, yycolumn+1,yytext());}
NATIVE									{ System.out.println("TOK_NATIVE");toString("TOK_NATIVE");return new Symbol(sym.TOK_NATIVE,yyline+1, yycolumn+1,yytext());}
NEGATIVE								{ System.out.println("TOK_NEGATIVE");toString("TOK_NEGATIVE");return new Symbol(sym.TOK_NEGATIVE,yyline+1, yycolumn+1,yytext());}
NEXT										{ System.out.println("TOK_NEXT");toString("TOK_NEXT");return new Symbol(sym.TOK_NEXT,yyline+1, yycolumn+1,yytext());}
NO											{ System.out.println("TOK_NO");toString("TOK_NO");return new Symbol(sym.TOK_NO,yyline+1, yycolumn+1,yytext());}
NOT										{ System.out.println("TOK_NOT");toString("TOK_NOT");return new Symbol(sym.TOK_NOT,yyline+1, yycolumn+1,yytext());}
NUMBER								{ System.out.println("TOK_NUMBER");toString("TOK_NUMBER");return new Symbol(sym.TOK_NUMBER,yyline+1, yycolumn+1,yytext());}
NUMERIC								{ System.out.println("TOK_NUMERIC");toString("TOK_NUMERIC");return new Symbol(sym.TOK_NUMERIC,yyline+1, yycolumn+1,yytext());}
NUMERIC-EDITED				{ System.out.println("TOK_NUMERIC_EDITED");toString("TOK_NUMERIC_EDITED");return new Symbol(sym.TOK_NUMERIC_EDITED,yyline+1, yycolumn+1,yytext());}
OBJECT-COMPUTER			{ System.out.println("TOK_OBJECT_COMPUTER");toString("TOK_OBJECT_COMPUTER");return new Symbol(sym.TOK_OBJECT_COMPUTER,yyline+1, yycolumn+1,yytext());}
OCCURS								{ System.out.println("TOK_OCCURS");toString("TOK_OCCURS");return new Symbol(sym.TOK_OCCURS,yyline+1, yycolumn+1,yytext());}
OF											{ System.out.println("TOK_OF");toString("TOK_OF");return new Symbol(sym.TOK_OF,yyline+1, yycolumn+1,yytext());}
OFF											{ System.out.println("TOK_OFF");toString("TOK_OFF");return new Symbol(sym.TOK_OFF,yyline+1, yycolumn+1,yytext());}
OMITTED								{ System.out.println("TOK_OMITTED");toString("TOK_OMITTED");return new Symbol(sym.TOK_OMITTED,yyline+1, yycolumn+1,yytext());}
ON											{ System.out.println("TOK_ON");toString("TOK_ON");return new Symbol(sym.TOK_ON,yyline+1, yycolumn+1,yytext());}
OPEN										{ System.out.println("TOK_OPEN");toString("TOK_OPEN");return new Symbol(sym.TOK_OPEN,yyline+1, yycolumn+1,yytext());}
OPTIONAL								{ System.out.println("TOK_OPTIONAL");toString("TOK_OPTIONAL");return new Symbol(sym.TOK_OPTIONAL,yyline+1, yycolumn+1,yytext());}
OR											{ System.out.println("TOK_OR");toString("TOK_OR");return new Symbol(sym.TOK_OR,yyline+1, yycolumn+1,yytext());}
ORDER									{ System.out.println("TOK_ORDER");toString("TOK_ORDER");return new Symbol(sym.TOK_ORDER,yyline+1, yycolumn+1,yytext());}
ORGANIZATION					{ System.out.println("TOK_ORGANIZATION");toString("TOK_ORGANIZATION");return new Symbol(sym.TOK_ORGANIZATION,yyline+1, yycolumn+1,yytext());}
OTHER									{ System.out.println("TOK_OTHER");toString("TOK_OTHER");return new Symbol(sym.TOK_OTHER,yyline+1, yycolumn+1,yytext());}
OUTPUT									{ System.out.println("TOK_OUTPUT");toString("TOK_OUTPUT");return new Symbol(sym.TOK_OUTPUT,yyline+1, yycolumn+1,yytext());}
OVERFLOW							{ System.out.println("TOK_OVERFLOW");toString("TOK_OVERFLOW");return new Symbol(sym.TOK_OVERFLOW,yyline+1, yycolumn+1,yytext());}
PACKED-DECIMAL				{ System.out.println("TOK_PACKED_DECIMAL");toString("TOK_PACKED_DECIMAL");return new Symbol(sym.TOK_PACKED_DECIMAL,yyline+1, yycolumn+1,yytext());}
PADDING								{ System.out.println("TOK_PADDING");toString("TOK_PADDING");return new Symbol(sym.TOK_PADDING,yyline+1, yycolumn+1,yytext());}
PAGE										{ System.out.println("TOK_PAGE");toString("TOK_PAGE");return new Symbol(sym.TOK_PAGE,yyline+1, yycolumn+1,yytext());}
PAGE-COUNTER					{ System.out.println("TOK_PAGE_COUNTER");toString("TOK_PAGE_COUNTER");return new Symbol(sym.TOK_PAGE_COUNTER,yyline+1, yycolumn+1,yytext());}
PERFORM								{ System.out.println("TOK_PERFORM");toString("TOK_PERFORM");return new Symbol(sym.TOK_PERFORM,yyline+1, yycolumn+1,yytext());}
PF											{ System.out.println("TOK_PF");toString("TOK_PF");return new Symbol(sym.TOK_PF,yyline+1, yycolumn+1,yytext());}
PH											{ System.out.println("TOK_PH");toString("TOK_PH");return new Symbol(sym.TOK_PH,yyline+1, yycolumn+1,yytext());}
PIC |
PICTURE								{yybegin(PICTURE_STATE); System.out.println("TOK_PICTURE");toString("TOK_PICTURE");return new Symbol(sym.TOK_PICTURE,yyline+1, yycolumn+1,yytext());}
PLUS										{ System.out.println("TOK_PLUS");toString("TOK_PLUS");return new Symbol(sym.TOK_PLUS,yyline+1, yycolumn+1,yytext());}
POINTER								{ System.out.println("TOK_POINTER");toString("TOK_POINTER");return new Symbol(sym.TOK_POINTER,yyline+1, yycolumn+1,yytext());}
POSITION								{ System.out.println("TOK_POSITION");toString("TOK_POSITION");return new Symbol(sym.TOK_POSITION,yyline+1, yycolumn+1,yytext());}
POSITIVE								{ System.out.println("TOK_POSITIVE");toString("TOK_POSITIVE");return new Symbol(sym.TOK_POSITIVE,yyline+1, yycolumn+1,yytext());}
PRINTING								{ System.out.println("TOK_PRINTING");toString("TOK_PRINTING");return new Symbol(sym.TOK_PRINTING,yyline+1, yycolumn+1,yytext());}
PROCEDURE						{ System.out.println("TOK_PROCEDURE");toString("TOK_PROCEDURE");return new Symbol(sym.TOK_PROCEDURE,yyline+1, yycolumn+1,yytext());}
PROCEDURES						{ System.out.println("TOK_PROCEDURES");toString("TOK_PROCEDURES");return new Symbol(sym.TOK_PROCEDURES,yyline+1, yycolumn+1,yytext());}
PROCEED								{ System.out.println("TOK_PROCEED");toString("TOK_PROCEED");return new Symbol(sym.TOK_PROCEED,yyline+1, yycolumn+1,yytext());}
PROGRAM								{ System.out.println("TOK_PROGRAM");toString("TOK_PROGRAM");return new Symbol(sym.TOK_PROGRAM,yyline+1, yycolumn+1,yytext());}
PROGRAM-ID						{ System.out.println("TOK_PROGRAM_ID");toString("TOK_PROGRAM_ID");return new Symbol(sym.TOK_PROGRAM_ID,yyline+1, yycolumn+1,yytext());}
PURGE									{ System.out.println("TOK_PURGE");toString("TOK_PURGE");return new Symbol(sym.TOK_PURGE,yyline+1, yycolumn+1,yytext());}
QUEUE									{ System.out.println("TOK_QUEUE");toString("TOK_QUEUE");return new Symbol(sym.TOK_QUEUE,yyline+1, yycolumn+1,yytext());}
QUOTE	|
QUOTES								{ System.out.println("TOK_QUOTE");toString("TOK_QUOTE");return new Symbol(sym.TOK_QUOTE,yyline+1, yycolumn+1,yytext());}
RANDOM								{ System.out.println("TOK_RANDOM");toString("TOK_RANDOM");return new Symbol(sym.TOK_RANDOM,yyline+1, yycolumn+1,yytext());}
RD											{ System.out.println("TOK_RD");toString("TOK_RD");return new Symbol(sym.TOK_RD,yyline+1, yycolumn+1,yytext());}
READ										{ System.out.println("TOK_READ");toString("TOK_READ");return new Symbol(sym.TOK_READ,yyline+1, yycolumn+1,yytext());}
RECEIVE								{ System.out.println("TOK_RECEIVE");toString("TOK_RECEIVE");return new Symbol(sym.TOK_RECEIVE,yyline+1, yycolumn+1,yytext());}
RECORDS	|
RECORD								{ System.out.println("TOK_RECORD");toString("TOK_RECORD");return new Symbol(sym.TOK_RECORD,yyline+1, yycolumn+1,yytext());}
REDEFINES							{ System.out.println("TOK_REDEFINES");toString("TOK_REDEFINES");return new Symbol(sym.TOK_REDEFINES,yyline+1, yycolumn+1,yytext());}
REEL										{ System.out.println("TOK_REEL");toString("TOK_REEL");return new Symbol(sym.TOK_REEL,yyline+1, yycolumn+1,yytext());}
REFERENCE		    		        { System.out.println("TOK_REFERENCE");toString("TOK_REFERENCE");return new Symbol(sym.TOK_REFERENCE,yyline+1, yycolumn+1,yytext());}
REFERENCES						{ System.out.println("TOK_REFERENCES");toString("TOK_REFERENCES");return new Symbol(sym.TOK_REFERENCES,yyline+1, yycolumn+1,yytext());}
RELATIVE								{ System.out.println("TOK_RELATIVE");toString("TOK_RELATIVE");return new Symbol(sym.TOK_RELATIVE,yyline+1, yycolumn+1,yytext());}
RELEASE								{ System.out.println("TOK_RELEASE");toString("TOK_RELEASE");return new Symbol(sym.TOK_RELEASE,yyline+1, yycolumn+1,yytext());}
REMAINDER							{ System.out.println("TOK_REMAINDER");toString("TOK_REMAINDER");return new Symbol(sym.TOK_REMAINDER,yyline+1, yycolumn+1,yytext());}
REMOVAL								{ System.out.println("TOK_REMOVAL");toString("TOK_REMOVAL");return new Symbol(sym.TOK_REMOVAL,yyline+1, yycolumn+1,yytext());}
RENAMES								{ System.out.println("TOK_RENAMES");toString("TOK_RENAMES");return new Symbol(sym.TOK_RENAMES,yyline+1, yycolumn+1,yytext());}
REPLACE								{ System.out.println("TOK_REPLACE");toString("TOK_REPLACE");return new Symbol(sym.TOK_REPLACE,yyline+1, yycolumn+1,yytext());}
REPLACING							{ System.out.println("TOK_REPLACING");toString("TOK_REPLACING");return new Symbol(sym.TOK_REPLACING,yyline+1, yycolumn+1,yytext());}
REPORT									{ System.out.println("TOK_REPORT");toString("TOK_REPORT");return new Symbol(sym.TOK_REPORT,yyline+1, yycolumn+1,yytext());}
REPORTING							{ System.out.println("TOK_REPORTING");toString("TOK_REPORTING");return new Symbol(sym.TOK_REPORTING,yyline+1, yycolumn+1,yytext());}
REPORTS								{ System.out.println("TOK_REPORTS");toString("TOK_REPORTS");return new Symbol(sym.TOK_REPORTS,yyline+1, yycolumn+1,yytext());}
RERUN									{ System.out.println("TOK_RERUN");toString("TOK_RERUN");return new Symbol(sym.TOK_RERUN,yyline+1, yycolumn+1,yytext());}
RESERVE								{ System.out.println("TOK_RESERVE");toString("TOK_RESERVE");return new Symbol(sym.TOK_RESERVE,yyline+1, yycolumn+1,yytext());}
RESET									{ System.out.println("TOK_RESET");toString("TOK_RESET");return new Symbol(sym.TOK_RESET,yyline+1, yycolumn+1,yytext());}
RETURN									{ System.out.println("TOK_RETURN");toString("TOK_RETURN");return new Symbol(sym.TOK_RETURN,yyline+1, yycolumn+1,yytext());}
REVERSE-VIDEO					{ System.out.println("TOK_REVERSE_VIDEO");toString("TOK_REVERSE_VIDEO");return new Symbol(sym.TOK_REVERSE_VIDEO,yyline+1, yycolumn+1,yytext());}
REVERSED							{ System.out.println("TOK_REVERSED");toString("TOK_REVERSED");return new Symbol(sym.TOK_REVERSED,yyline+1, yycolumn+1,yytext());}
REWIND									{ System.out.println("TOK_REWIND");toString("TOK_REWIND");return new Symbol(sym.TOK_REWIND,yyline+1, yycolumn+1,yytext());}
REWRITE								{ System.out.println("TOK_REWRITE");toString("TOK_REWRITE");return new Symbol(sym.TOK_REWRITE,yyline+1, yycolumn+1,yytext());}
RF											{ System.out.println("TOK_RF");toString("TOK_RF");return new Symbol(sym.TOK_RF,yyline+1, yycolumn+1,yytext());}
RH											{ System.out.println("TOK_RH");toString("TOK_RH");return new Symbol(sym.TOK_RH,yyline+1, yycolumn+1,yytext());}
RIGHT										{ System.out.println("TOK_RIGHT");toString("TOK_RIGHT");return new Symbol(sym.TOK_RIGHT,yyline+1, yycolumn+1,yytext());}
ROUNDED								{ System.out.println("TOK_ROUNDED");toString("TOK_ROUNDED");return new Symbol(sym.TOK_ROUNDED,yyline+1, yycolumn+1,yytext());}
RUN										{ System.out.println("TOK_RUN");toString("TOK_RUN");return new Symbol(sym.TOK_RUN,yyline+1, yycolumn+1,yytext());}
SAME										{ System.out.println("TOK_SAME");toString("TOK_SAME");return new Symbol(sym.TOK_SAME,yyline+1, yycolumn+1,yytext());}
SCREEN									{ System.out.println("TOK_SCREEN");toString("TOK_SCREEN");return new Symbol(sym.TOK_SCREEN,yyline+1, yycolumn+1,yytext());}
SD											{ System.out.println("TOK_SD");toString("TOK_SD");return new Symbol(sym.TOK_SD,yyline+1, yycolumn+1,yytext());}
SEARCH									{ System.out.println("TOK_SEARCH");toString("TOK_SEARCH");return new Symbol(sym.TOK_SEARCH,yyline+1, yycolumn+1,yytext());}
SECTION								{ System.out.println("TOK_SECTION");toString("TOK_SECTION");return new Symbol(sym.TOK_SECTION,yyline+1, yycolumn+1,yytext());}
SECURITY								{ System.out.println("TOK_SECURITY");toString("TOK_SECURITY");return new Symbol(sym.TOK_SECURITY,yyline+1, yycolumn+1,yytext());}
SEGMENT								{ System.out.println("TOK_SEGMENT");toString("TOK_SEGMENT");return new Symbol(sym.TOK_SEGMENT,yyline+1, yycolumn+1,yytext());}
SEGMENT-LIMIT					{ System.out.println("TOK_SEGMENT_LIMIT");toString("TOK_SEGMENT_LIMIT");return new Symbol(sym.TOK_SEGMENT_LIMIT,yyline+1, yycolumn+1,yytext());}
SELECT									{ System.out.println("TOK_SELECT");toString("TOK_SELECT");return new Symbol(sym.TOK_SELECT,yyline+1, yycolumn+1,yytext());}
SEND										{ System.out.println("TOK_SEND");toString("TOK_SEND");return new Symbol(sym.TOK_SEND,yyline+1, yycolumn+1,yytext());}
SENTENCE							{ System.out.println("TOK_SENTENCE");toString("TOK_SENTENCE");return new Symbol(sym.TOK_SENTENCE,yyline+1, yycolumn+1,yytext());}
SEPARATE							{ System.out.println("TOK_SEPARATE");toString("TOK_SEPARATE");return new Symbol(sym.TOK_SEPARATE,yyline+1, yycolumn+1,yytext());}
SEQUENCE							{ System.out.println("TOK_SEQUENCE");toString("TOK_SEQUENCE");return new Symbol(sym.TOK_SEQUENCE,yyline+1, yycolumn+1,yytext());}
SEQUENTIAL							{ System.out.println("TOK_SEQUENTIAL");toString("TOK_SEQUENTIAL");return new Symbol(sym.TOK_SEQUENTIAL,yyline+1, yycolumn+1,yytext());}
SET											{ System.out.println("TOK_SET");toString("TOK_SET");return new Symbol(sym.TOK_SET,yyline+1, yycolumn+1,yytext());}
SIGN										{ System.out.println("TOK_SIGN");toString("TOK_SIGN");return new Symbol(sym.TOK_SIGN,yyline+1, yycolumn+1,yytext());}
SIZE										{ System.out.println("TOK_SIZE");toString("TOK_SIZE");return new Symbol(sym.TOK_SIZE,yyline+1, yycolumn+1,yytext());}
SORT										{ System.out.println("TOK_SORT");toString("TOK_SORT");return new Symbol(sym.TOK_SORT,yyline+1, yycolumn+1,yytext());}
SORT-MERGE						{ System.out.println("TOK_SORT_MERGE");toString("TOK_SORT_MERGE");return new Symbol(sym.TOK_SORT_MERGE,yyline+1, yycolumn+1,yytext());}
SOURCE								{ System.out.println("TOK_SOURCE");toString("TOK_SOURCE");return new Symbol(sym.TOK_SOURCE,yyline+1, yycolumn+1,yytext());}
SOURCE-COMPUTER			{ System.out.println("TOK_SOURCE_COMPUTER");toString("TOK_SOURCE_COMPUTER");return new Symbol(sym.TOK_SOURCE_COMPUTER,yyline+1, yycolumn+1,yytext());}
SPACE									{ System.out.println("TOK_SPACE");toString("TOK_SPACE");return new Symbol(sym.TOK_SPACE,yyline+1, yycolumn+1,yytext());}
SPACES									{ System.out.println("TOK_SPACES");toString("TOK_SPACES");return new Symbol(sym.TOK_SPACES,yyline+1, yycolumn+1,yytext());}
SPECIAL-NAMES					{ System.out.println("TOK_SPECIAL_NAMES");toString("TOK_SPECIAL_NAMES");return new Symbol(sym.TOK_SPECIAL_NAMES,yyline+1, yycolumn+1,yytext());}
STANDARD							{ System.out.println("TOK_STANDARD");toString("TOK_STANDARD");return new Symbol(sym.TOK_STANDARD,yyline+1, yycolumn+1,yytext());}
STANDARD-1						{ System.out.println("TOK_STANDARD_1");toString("TOK_STANDARD_1");return new Symbol(sym.TOK_STANDARD_1,yyline+1, yycolumn+1,yytext());}
STANDARD-2						{ System.out.println("TOK_STANDARD_2");toString("TOK_STANDARD_2");return new Symbol(sym.TOK_STANDARD_2,yyline+1, yycolumn+1,yytext());}
START									{ System.out.println("TOK_START");toString("TOK_START");return new Symbol(sym.TOK_START,yyline+1, yycolumn+1,yytext());}
STATUS									{ System.out.println("TOK_STATUS");toString("TOK_STATUS");return new Symbol(sym.TOK_STATUS,yyline+1, yycolumn+1,yytext());}
STOP										{ System.out.println("TOK_STOP");toString("TOK_STOP");return new Symbol(sym.TOK_STOP,yyline+1, yycolumn+1,yytext());}
STRING									{ System.out.println("TOK_STRING");toString("TOK_STRING");return new Symbol(sym.TOK_STRING,yyline+1, yycolumn+1,yytext());}
SUB-QUEUE-1						{ System.out.println("TOK_SUB_QUEUE_1");toString("TOK_SUB_QUEUE_1");return new Symbol(sym.TOK_SUB_QUEUE_1,yyline+1, yycolumn+1,yytext());}
SUB-QUEUE-2						{ System.out.println("TOK_SUB_QUEUE_2");toString("TOK_SUB_QUEUE_2");return new Symbol(sym.TOK_SUB_QUEUE_2,yyline+1, yycolumn+1,yytext());}
SUB-QUEUE-3						{ System.out.println("TOK_SUB_QUEUE_3");toString("TOK_SUB_QUEUE_3");return new Symbol(sym.TOK_SUB_QUEUE_3,yyline+1, yycolumn+1,yytext());}
SUBTRACT							{ System.out.println("TOK_SUBTRACT");toString("TOK_SUBTRACT");return new Symbol(sym.TOK_SUBTRACT,yyline+1, yycolumn+1,yytext());}
SUM										{ System.out.println("TOK_SUM");toString("TOK_SUM");return new Symbol(sym.TOK_SUM,yyline+1, yycolumn+1,yytext());}
SUPRESS								{ System.out.println("TOK_SUPRESS");toString("TOK_SUPRESS");return new Symbol(sym.TOK_SUPRESS,yyline+1, yycolumn+1,yytext());}
SYMBOLIC								{ System.out.println("TOK_SYMBOLIC");toString("TOK_SYMBOLIC");return new Symbol(sym.TOK_SYMBOLIC,yyline+1, yycolumn+1,yytext());}
SYNC	|
SYNCHRONIZED					{ System.out.println("TOK_SYNC");toString("TOK_SYNC");return new Symbol(sym.TOK_SYNC,yyline+1, yycolumn+1,yytext());}
TABLE										{ System.out.println("TOK_TABLE");toString("TOK_TABLE");return new Symbol(sym.TOK_TABLE,yyline+1, yycolumn+1,yytext());}
TALLYING								{ System.out.println("TOK_TALLYING");toString("TOK_TALLYING");return new Symbol(sym.TOK_TALLYING,yyline+1, yycolumn+1,yytext());}
TAPE										{ System.out.println("TOK_TAPE");toString("TOK_TAPE");return new Symbol(sym.TOK_TAPE,yyline+1, yycolumn+1,yytext());}
TERMINAL								{ System.out.println("TOK_TERMINAL");toString("TOK_TERMINAL");return new Symbol(sym.TOK_TERMINAL,yyline+1, yycolumn+1,yytext());}
TERMINATE							{ System.out.println("TOK_TERMINATE");toString("TOK_TERMINATE");return new Symbol(sym.TOK_TERMINATE,yyline+1, yycolumn+1,yytext());}
TEST										{ System.out.println("TOK_TEST");toString("TOK_TEST");return new Symbol(sym.TOK_TEST,yyline+1, yycolumn+1,yytext());}
TEXT										{ System.out.println("TOK_TEXT");toString("TOK_TEXT");return new Symbol(sym.TOK_TEXT,yyline+1, yycolumn+1,yytext());}
THAN										{ System.out.println("TOK_THAN");toString("TOK_THAN");return new Symbol(sym.TOK_THAN,yyline+1, yycolumn+1,yytext());}
THEN										{ System.out.println("TOK_THEN");toString("TOK_THEN");return new Symbol(sym.TOK_THEN,yyline+1, yycolumn+1,yytext());}
THROUGH								{ System.out.println("TOK_THROUGH");toString("TOK_THROUGH");return new Symbol(sym.TOK_THROUGH,yyline+1, yycolumn+1,yytext());}
THRU										{ System.out.println("TOK_THRU");toString("TOK_THRU");return new Symbol(sym.TOK_THRU,yyline+1, yycolumn+1,yytext());}
TIME										{ System.out.println("TOK_TIME");toString("TOK_TIME");return new Symbol(sym.TOK_TIME,yyline+1, yycolumn+1,yytext());}
TIMES										{ System.out.println("TOK_TIMES");toString("TOK_TIMES");return new Symbol(sym.TOK_TIMES,yyline+1, yycolumn+1,yytext());}
TO											{ System.out.println("TOK_TO");toString("TOK_TO");return new Symbol(sym.TOK_TO,yyline+1, yycolumn+1,yytext());}
TOP											{ System.out.println("TOK_TOP");toString("TOK_TOP");return new Symbol(sym.TOK_TOP,yyline+1, yycolumn+1,yytext());}
TRAILING								{ System.out.println("TOK_TRAILING");toString("TOK_TRAILING");return new Symbol(sym.TOK_TRAILING,yyline+1, yycolumn+1,yytext());}
TRUE										{ System.out.println("TOK_TRUE");toString("TOK_TRUE");return new Symbol(sym.TOK_TRUE,yyline+1, yycolumn+1,yytext());}
TYPE										{ System.out.println("TOK_TYPE");toString("TOK_TYPE");return new Symbol(sym.TOK_TYPE,yyline+1, yycolumn+1,yytext());}
UNDERLINE							{ System.out.println("TOK_UNDERLINE");toString("TOK_UNDERLINE");return new Symbol(sym.TOK_UNDERLINE,yyline+1, yycolumn+1,yytext());}
UNIT										{ System.out.println("TOK_UNIT");toString("TOK_UNIT");return new Symbol(sym.TOK_UNIT,yyline+1, yycolumn+1,yytext());}
UNSTRING								{ System.out.println("TOK_UNSTRING");toString("TOK_UNSTRING");return new Symbol(sym.TOK_UNSTRING,yyline+1, yycolumn+1,yytext());}
UNTIL										{ System.out.println("TOK_UNTIL");toString("TOK_UNTIL");return new Symbol(sym.TOK_UNTIL,yyline+1, yycolumn+1,yytext());}
UP											{ System.out.println("TOK_UP");toString("TOK_UP");return new Symbol(sym.TOK_UP,yyline+1, yycolumn+1,yytext());}
UPON										{ System.out.println("TOK_UPON");toString("TOK_UPON");return new Symbol(sym.TOK_UPON,yyline+1, yycolumn+1,yytext());}
USAGE									{ System.out.println("TOK_USAGE");toString("TOK_USAGE");return new Symbol(sym.TOK_USAGE,yyline+1, yycolumn+1,yytext());}
USE											{ System.out.println("TOK_USE");toString("TOK_USE");return new Symbol(sym.TOK_USE,yyline+1, yycolumn+1,yytext());}
USING									{ System.out.println("TOK_USING");toString("TOK_USING");return new Symbol(sym.TOK_USING,yyline+1, yycolumn+1,yytext());}
VALUE	|
VALUES									{ System.out.println("TOK_VALUE");toString("TOK_VALUE");return new Symbol(sym.TOK_VALUE,yyline+1, yycolumn+1,yytext());}
VARYING								{ System.out.println("TOK_VARYING");toString("TOK_VARYING");return new Symbol(sym.TOK_VARYING,yyline+1, yycolumn+1,yytext());}
WHEN										{ System.out.println("TOK_WHEN");toString("TOK_WHEN");return new Symbol(sym.TOK_WHEN,yyline+1, yycolumn+1,yytext());}
WHILE										{ System.out.println("TOK_WHILE");toString("TOK_WHILE");return new Symbol(sym.TOK_WHILE,yyline+1, yycolumn+1,yytext());}
WITH										{ System.out.println("TOK_WITH");toString("TOK_WITH");return new Symbol(sym.TOK_WITH,yyline+1, yycolumn+1,yytext());}
WORDS									{ System.out.println("TOK_WORDS");toString("TOK_WORDS");return new Symbol(sym.TOK_WORDS,yyline+1, yycolumn+1,yytext());}
WORKING-STORAGE			{ System.out.println("TOK_WORKING_STORAGE");toString("TOK_WORKING_STORAGE");return new Symbol(sym.TOK_WORKING_STORAGE,yyline+1, yycolumn+1,yytext());}
WRITE									{ System.out.println("TOK_WRITE");toString("TOK_WRITE");return new Symbol(sym.TOK_WRITE,yyline+1, yycolumn+1,yytext());}
ZERO	|
ZEROES	|
ZEROS 									{System.out.println("TOK_ZERO");toString("TOK_ZERO");return new Symbol(sym.TOK_ZERO,yyline+1, yycolumn+1,yytext());}

[A-Za-z]+ ([\-]+ [A-Za-z0-9]+)* {System.out.println("TOK_IDENTIFIER"); toString("TOK_IDENTIFIER");tablaSimbolosLexico.add(yytext(), "TOK_IDENTIFIER"); return new Symbol(sym.TOK_IDENTIFIER,yyline+1, yycolumn+1,yytext()); }

"+"											{ System.out.println("TOK_PLUS");toString("TOK_PLUS");return new Symbol(sym.TOK_PLUS,yyline+1, yycolumn+1,yytext());}
"-"												{ System.out.println("TOK_MINUS");toString("TOK_MINUS");return new Symbol(sym.TOK_MINUS,yyline+1, yycolumn+1,yytext());}
"*"											{ System.out.println("TOK_ASTERISK");toString("TOK_ASTERISK");return new Symbol(sym.TOK_ASTERISK,yyline+1, yycolumn+1,yytext());}
"/"												{ System.out.println("TOK_SLASH");toString("TOK_SLASH");return new Symbol(sym.TOK_SLASH,yyline+1, yycolumn+1,yytext());}
"="											{ System.out.println("TOK_EQUAL");toString("TOK_EQUAL");return new Symbol(sym.TOK_EQUAL,yyline+1, yycolumn+1,yytext());}
"$"											{ System.out.println("TOK_DOLLAR");toString("TOK_DOLLAR");return new Symbol(sym.TOK_DOLLAR,yyline+1, yycolumn+1,yytext());}
","												{ System.out.println("TOK_COMMA");toString("TOK_COMMA");return new Symbol(sym.TOK_COMMA,yyline+1, yycolumn+1,yytext());}
";"												{ System.out.println("TOK_SEMICOLON");toString("TOK_SEMICOLON");return new Symbol(sym.TOK_SEMICOLON,yyline+1, yycolumn+1,yytext());}
"."												{ System.out.println("TOK_PERIOD");toString("TOK_PERIOD");return new Symbol(sym.TOK_PERIOD,yyline+1, yycolumn+1,yytext());}
"("												{ System.out.println("TOK_LPAREN");toString("TOK_LPAREN");return new Symbol(sym.TOK_LPAREN,yyline+1, yycolumn+1,yytext());}
")"												{ System.out.println("TOK_RPAREN");toString("TOK_RPAREN");return new Symbol(sym.TOK_RPAREN,yyline+1, yycolumn+1,yytext());}
">="  		  						    	{ System.out.println("TOK_GREATER_EQ");toString("TOK_GREATER_EQ");return new Symbol(sym.TOK_GREATER_EQ,yyline+1, yycolumn+1,yytext());}
"<="    								    	{ System.out.println("TOK_LESS_EQ");toString("TOK_LESS_EQ");return new Symbol(sym.TOK_LESS_EQ,yyline+1, yycolumn+1,yytext());}
">"											{ System.out.println("TOK_GREATER");toString("TOK_GREATER");return new Symbol(sym.TOK_GREATER,yyline+1, yycolumn+1,yytext());}
"<"											{ System.out.println("TOK_LESS");toString("TOK_LESS");return new Symbol(sym.TOK_LESS,yyline+1, yycolumn+1,yytext());}
			
\r|\n|\r\n          							{ /* no hacer nada */ }
\r|\n|\r\n | [ \t\f]	 						{ /* no hacer nada */ }

.	{
		System.out.println("Error Lexico "+ (yyline+1) + " " + (yycolumn+1) + " " + yytext());
		try {
			manejoErrores("Linea: " + yyline()+ " Caracter No Permitido: \"" + yytext()+ "\"");
			throw new Exception("Linea: " + yyline()+ " Caracter No Permitido: \"" + yytext()+ "\"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}


<PICTURE_STATE>{

	IS		{ System.out.println("TOK_IS");toString("TOK_IS");return new Symbol(sym.TOK_IS,yyline+1, yycolumn+1,yytext());}
	
	([\.]*[ax9vbpz09s,\*\+\-\$]+(\([0-9]+\))?)+ { 
		System.out.println("TOK_PIC_TEXT");
    	toString("TOK_PIC_TEXT");
    	yybegin(YYINITIAL);
    	return new Symbol(sym.TOK_PIC_TEXT,yyline+1, yycolumn+1,yytext());
	}
	
	\r|\n|\r\n          							{ /* no hacer nada */ }
	\r|\n|\r\n | [ \t\f]	 						{ /* no hacer nada */ }
	
	.	{
		System.out.println("Error Lexico "+ (yyline+1) + " " + (yycolumn+1) + " " + yytext());
		/*try {
			manejoErrores("Linea: " + yyline()+ " Caracter No Permitido: \"" + yytext()+ "\"");
			throw new Exception("Linea: " + yyline()+ " Caracter No Permitido: \"" + yytext()+ "\"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	
}


<COMMENT_STATE>{
    .*\n {yybegin(YYINITIAL);}
}

