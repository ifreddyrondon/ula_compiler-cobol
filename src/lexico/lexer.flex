package lexico;
import java_cup.runtime.*;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Map;
import java.util.TreeMap;
%%

%int
%unicode
%line
%column

%{	

	public static Map<String, String> tablaSimbolos = new TreeMap<String, String>();
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
    
    public static void main(String[] args){
		 
		Yylex analizadorLexico =new Yylex(new InputStreamReader(System.in));
		try{
			analizadorLexico.yylex(); 
		}catch(IOException e){
			System.err.println(e);
		} 
	}
%}

%%
<YYINITIAL>{
	

	
[\+\-]?[0-9]+ {System.out.println("TOK_INTEGER"); toString("TOK_INTEGER");}

[\+\-]?[0-9]+\.[0-9]+ {System.out.println("TOK_FLOAT"); toString("TOK_FLOAT");}

\"[a-zA-Z0-9\t \-\{\}\[\]\+\-_\*|\\\/().,\:\';=><\!\$\@\#\%]*\"	{System.out.println("TOK_STRING"); toString("TOK_STRING");}

\'[a-zA-Z0-9\t \-\{\}\[\]\+\-_\*|\\\/().,\:\";=><\!\$\@\#\%]*\'	{System.out.println("TOK_STRING"); toString("TOK_STRING");}

ACCEPT									{ System.out.println("TOK_ACCEPT"); toString("TOK_ACCEPT");	}
ACCESS									{ System.out.println("TOK_ACCESS"); toString("TOK_ACCESS");	}
ADD			    						{ System.out.println("TOK_ADD"); toString("TOK_ADD");	}
ADVANCING							{ System.out.println("TOK_ADVANCING"); toString("TOK_ADVANCING");	}
AFTER									{ System.out.println("TOK_AFTER"); toString("TOK_AFTER");	}
ALL			    						{ System.out.println("TOK_ALL"); toString("TOK_ALL");	}
ALPHABET								{ System.out.println("TOK_ALPHABET"); toString("TOK_ALPHABET");	}
ALPHABETIC							{ System.out.println("TOK_ALPHABETIC"); toString("TOK_ALPHABETIC");	}
ALPHABETIC-LOWER				{ System.out.println("TOK_ALPHABETIC_LOWER"); toString("TOK_ALPHABETIC_LOWER"); }
ALPHABETIC-UPPER				{ System.out.println("TOK_ALPHABETIC_UPPER"); toString("TOK_ALPHABETIC_UPPER"); }
ALPHANUMERIC						{ System.out.println("TOK_ALPHANUMERIC"); toString("TOK_ALPHANUMERIC");	}
ALPHANUMERIC-EDITED		{ System.out.println("TOK_ALPHANUMERIC_EDITED"); toString("TOK_ALPHANUMERIC_EDITED");	}
ALSO										{ System.out.println("TOK_ALSO"); toString("TOK_ALSO");	}
ALTER									{ System.out.println("TOK_ALTER"); toString("TOK_ALTER");	}
ALTERNATE							{ System.out.println("TOK_ALTERNATE"); toString("TOK_ALTERNATE");	}
AND										{ System.out.println("TOK_AND"); toString("TOK_AND");	}
ANY										{ System.out.println("TOK_ANY"); toString("TOK_ANY");	}
ARE										{ System.out.println("TOK_ARE"); toString("TOK_ARE");	}
AREA										{ System.out.println("TOK_AREA"); toString("TOK_AREA");	}
AREAS									{ System.out.println("TOK_AREAS"); toString("TOK_AREAS");	}
ASCENDING							{ System.out.println("TOK_ASCENDING"); toString("TOK_ASCENDING");	}
ASSIGN									{ System.out.println("TOK_ASSIGN"); toString("TOK_ASSIGN");	}
AT											{ System.out.println("TOK_AT"); toString("TOK_AT");	}
AUTHOR									{ System.out.println("TOK_AUTHOR"); toString("TOK_AUTHOR");	}
BACKGROUND-COLOR				{ System.out.println("TOK_BACKGROUND_COLOR"); toString("TOK_BACKGROUND_COLOR");}
BEFORE									{ System.out.println("TOK_BEFORE"); toString("TOK_BEFORE");	}
BINARY									{ System.out.println("TOK_BINARY"); toString("TOK_BINARY");  }
BLANK									{ System.out.println("TOK_BLANK"); toString("TOK_BLANK");	}
BLINK									{ System.out.println("TOK_BLINK"); toString("TOK_BLINK");	}
BLOCK									{ System.out.println("TOK_BLOCK"); toString("TOK_BLOCK");	}
BOTTOM									{ System.out.println("TOK_BOTTOM"); toString("TOK_BOTTOM");	}
BY											{ System.out.println("TOK_BY"); toString("TOK_BY");	}
CALL										{ System.out.println("TOK_CALL"); toString("TOK_CALL");	}
CANCEL									{ System.out.println("TOK_CANCEL"); toString("TOK_CANCEL");	}
CD			{ System.out.println("TOK_CD"); toString("TOK_CD");	}
CF			{ System.out.println("TOK_CF"); toString("TOK_CF");	}
CH			{ System.out.println("TOK_CH"); toString("TOK_CH");	}
CHARACTER		{ System.out.println("TOK_CHARACTER"); toString("TOK_CHARACTER");	}
CHARACTERS		{ System.out.println("TOK_CHARACTERS"); toString("TOK_CHARACTERS");	}
CLASS			{ System.out.println("TOK_CLASS"); toString("TOK_CLASS");		}
CLOCK-UNITS		{ System.out.println("TOK_CLOCK_UNITS"); toString("TOK_CLOCK_UNITS");	}
CLOSE			{ System.out.println("TOK_CLOSE"); toString("TOK_CLOSE");	}
COBOL			{ System.out.println("TOK_COBOL"); toString("TOK_COBOL");	}
CODE			{ System.out.println("TOK_CODE"); toString("TOK_CODE");	}
CODE-SET		{ System.out.println("TOK_CODE_SET"); toString("TOK_CODE_SET");	}
COLLATING		{ System.out.println("TOK_COLLATING"); toString("TOK_COLLATING");	}
COLUMN			{ System.out.println("TOK_COLUMN"); toString("TOK_COLUMN");	}
COMMA			{ System.out.println("TOK_COMMA"); toString("TOK_COMMA");	}
COMMON		{ System.out.println("TOK_COMMON"); toString("TOK_COMMON");	}
COMMUNICATION		{ System.out.println("TOK_COMMUNICATION"); toString("TOK_COMMUNICATION");	}
COMP			{ System.out.println("TOK_COMP"); toString("TOK_COMP");	}
COMPUTATIONAL		{ System.out.println("TOK_COMPUTATIONAL"); toString("TOK_COMPUTATIONAL");	}
COMPUTE			{ System.out.println("TOK_COMPUTE"); toString("TOK_COMPUTE");	}
CONFIGURATION		{ System.out.println("TOK_CONFIGURATION"); toString("TOK_CONFIGURATION");	}
CONSOLE			{ System.out.println("TOK_CONSOLE"); toString("TOK_CONSOLE");	}
CONTAINS		{ System.out.println("TOK_CONTAINS"); toString("TOK_CONTAINS");	}
CONTENT                 { System.out.println("TOK_CONTENT"); toString("TOK_CONTENT");         }
CONTINUE		{ System.out.println("TOK_CONTINUE"); toString("TOK_CONTINUE");	}
CONTROL			{ System.out.println("TOK_CONTROL"); toString("TOK_CONTROL");	}
CONTROLS		{ System.out.println("TOK_CONTROLS"); toString("TOK_CONTROLS");	}
CORR			{ System.out.println("TOK_CORR"); toString("TOK_CORR");	}
CORRESPONDING		{ System.out.println("TOK_CORRESPONDING"); toString("TOK_CORRESPONDING");	}
COUNT			{ System.out.println("TOK_COUNT"); toString("TOK_COUNT");	}
CURRENCY		{ System.out.println("TOK_CURRENCY"); toString("TOK_CURRENCY");	}
DATA			{ System.out.println("TOK_DATA"); toString("TOK_DATA");	}
DATE			{ System.out.println("TOK_DATE"); toString("TOK_DATE");	}
DATE-COMPILED		{ System.out.println("TOK_DATE_COMPILED"); toString("TOK_DATE_COMPILED");	}
DATE-WRITTEN		{ System.out.println("TOK_DATE_WRITTEN"); toString("TOK_DATE_WRITTEN");	}
DAY			{ System.out.println("TOK_DAY"); toString("TOK_DAY");	}
DAY-OF-WEEK		{ System.out.println("TOK_DAY_OF_WEEK"); toString("TOK_DAY_OF_WEEK");	}
DE			{ System.out.println("TOK_DE"); toString("TOK_DE");	}
DEBUG-CONTENTS		{ System.out.println("TOK_DEBUG_CONTENTS"); toString("TOK_DEBUG_CONTENTS");	}
DEBUG-ITEM		{ System.out.println("TOK_DEBUG_ITEM"); toString("TOK_DEBUG_ITEM");	}
DEBUG-LINE		{ System.out.println("TOK_DEBUG_LINE"); toString("TOK_DEBUG_LINE");	}
DEBUG-NAME		{ System.out.println("TOK_DEBUG_NAME"); toString("TOK_DEBUG_NAME");	}
DEBUG-SUB-1		{ System.out.println("TOK_DEBUG_SUB_1"); toString("TOK_DEBUG_SUB_1");	}
DEBUG-SUB-2		{ System.out.println("TOK_DEBUG_SUB_2"); toString("TOK_DEBUG_SUB_2");	}
DEBUG-SUB-3		{ System.out.println("TOK_DEBUG_SUB_3"); toString("TOK_DEBUG_SUB_3");	}
DEBUGGING		{ System.out.println("TOK_DEBUGGING"); toString("TOK_DEBUGGING");	}
DECIMAL-POINT		{ System.out.println("TOK_DECIMAL_POINT"); toString("TOK_DECIMAL_POINT");	}
DECLARATIVES		{ System.out.println("TOK_DECLARATIVES"); toString("TOK_DECLARATIVES");	}
DELETE			{ System.out.println("TOK_DELETE"); toString("TOK_DELETE");	}
DELIMITED		{ System.out.println("TOK_DELIMITED"); toString("TOK_DELIMITED");	}
DELIMITER		{ System.out.println("TOK_DELIMITER"); toString("TOK_DELIMITER");	}
DEPENDING		{ System.out.println("TOK_DEPENDING"); toString("TOK_DEPENDING");	}
DEPTH			{ System.out.println("TOK_DEPTH"); toString("TOK_DEPTH");	}
DESCENDING		{ System.out.println("TOK_DESCENDING"); toString("TOK_DESCENDING");	}
DESTINATION		{ System.out.println("TOK_DESTINATION"); toString("TOK_DESTINATION");	}
DETAIL			{ System.out.println("TOK_DETAIL"); toString("TOK_DETAIL");	}
DISABLE			{ System.out.println("TOK_DISABLE"); toString("TOK_DISABLE");	}
DISPLAY			{ System.out.println("TOK_DISPLAY"); toString("TOK_DISPLAY");	}
DIVIDE			{ System.out.println("TOK_DIVIDE"); toString("TOK_DIVIDE");	}
DIVISION		{ System.out.println("TOK_DIVISION"); toString("TOK_DIVISION");	}
DOWN			{ System.out.println("TOK_DOWN"); toString("TOK_DOWN");	}
DUPLICATES		{ System.out.println("TOK_DUPLICATES"); toString("TOK_DUPLICATES");	}
DYNAMIC			{ System.out.println("TOK_DYNAMIC"); toString("TOK_DYNAMIC");	}
EGI			{ System.out.println("TOK_EGI"); toString("TOK_EGI");	}
ELSIF			{ System.out.println("TOK_ELSIF"); toString("TOK_ELSIF");	}
ELSE			{ System.out.println("TOK_ELSE"); toString("TOK_ELSE");	}
EMI			{ System.out.println("TOK_EMI"); toString("TOK_EMI");	}
ENABLE			{ System.out.println("TOK_ENABLE"); toString("TOK_ENABLE");	}
END			{ System.out.println("TOK_END"); toString("TOK_END");	}
END-ADD			{ System.out.println("TOK_END_ADD"); toString("TOK_END_ADD");	}
END-CALL		{ System.out.println("TOK_END_CALL"); toString("TOK_END_CALL"); 	}
END-COMPUTE		{ System.out.println("TOK_END_COMPUTE"); toString("TOK_END_COMPUTE");	}
END-DELETE		{ System.out.println("TOK_END_DELETE"); toString("TOK_END_DELETE");	}
END-DIVIDE		{ System.out.println("TOK_END_DIVIDE"); toString("TOK_END_DIVIDE");	}
END-EVALUATE		{ System.out.println("TOK_END_EVALUATE"); toString("TOK_END_EVALUATE");	}
END-IF			{ System.out.println("TOK_END_IF"); toString("TOK_END_IF");		}
END-MULTIPLY		{ System.out.println("TOK_END_MULTIPLY"); toString("TOK_END_MULTIPLY");	}
END-OF-PAGE		{ System.out.println("TOK_END_OF_PAGE"); toString("TOK_END_OF_PAGE");	}
END-PERFORM		{ System.out.println("TOK_END_PERFORM"); toString("TOK_END_PERFORM");	}
END-READ		{ System.out.println("TOK_END_READ"); toString("TOK_END_READ");	}
END-RECEIVE		{ System.out.println("TOK_END_RECEIVE"); toString("TOK_END_RECEIVE");	}
END-RETURN		{ System.out.println("TOK_END_RETURN"); toString("TOK_END_RETURN");	}
END-REWRITE		{ System.out.println("TOK_END_REWRITE"); toString("TOK_END_REWRITE");	}
END-SEARCH		{ System.out.println("TOK_END_SEARCH"); toString("TOK_END_SEARCH");	}
END-START		{ System.out.println("TOK_END_START"); toString("TOK_END_START");	}
END-STRING		{ System.out.println("TOK_END_STRING"); toString("TOK_END_STRING");	}
END-SUBTRACT		{ System.out.println("TOK_END_SUBTRACT"); toString("TOK_END_SUBTRACT");	}
END-UNSTRING		{ System.out.println("TOK_END_UNSTRING"); toString("TOK_END_UNSTRING");	}
END-WRITE		{ System.out.println("TOK_END_WRITE"); toString("TOK_END_WRITE");	}
ENTER			{ System.out.println("TOK_ENTER"); toString("TOK_ENTER");	}
ENVIRONMENT		{ System.out.println("TOK_ENVIRONMENT"); toString("TOK_ENVIRONMENT");	}
EOP			{ System.out.println("TOK_EOP"); toString("TOK_EOP");	}
EQUAL			{ System.out.println("TOK_EQUAL"); toString("TOK_EQUAL");	}
ERROR			{ System.out.println("TOK_ERROR"); toString("TOK_ERROR");	}
ESI			{ System.out.println("TOK_ESI"); toString("TOK_ESI");	}
EVALUATE		{ System.out.println("TOK_EVALUATE"); toString("TOK_EVALUATE");	}
EVERY			{ System.out.println("TOK_EVERY"); toString("TOK_EVERY");	}
EXCEPTION		{ System.out.println("TOK_EXCEPTION"); toString("TOK_EXCEPTION");	}
EXIT			{ System.out.println("TOK_EXIT"); toString("TOK_EXIT");	}
EXTEND			{ System.out.println("TOK_EXTEND"); toString("TOK_EXTEND");	}
EXTERNAL		{ System.out.println("TOK_EXTERNAL"); toString("TOK_EXTERNAL");	}
FALSE			{ System.out.println("TOK_FALSE"); toString("TOK_FALSE");	}
FD			{ System.out.println("TOK_FD"); toString("TOK_FD");	}
FILE			{ System.out.println("TOK_FILE"); toString("TOK_FILE");	}
FILE-CONTROL		{ System.out.println("TOK_FILE_CONTROL"); toString("TOK_FILE_CONTROL");	}
FILE-ID			{ System.out.println("TOK_FILE_ID"); toString("TOK_FILE_ID");	}
FILLER			{ System.out.println("TOK_FILLER"); toString("TOK_FILLER");	}
FINAL			{ System.out.println("TOK_FINAL"); toString("TOK_FINAL");	}
FIRST			{ System.out.println("TOK_FIRST"); toString("TOK_FIRST");	}
FOOTING			{ System.out.println("TOK_FOOTING"); toString("TOK_FOOTING");	}
FOR			{ System.out.println("TOK_FOR"); toString("TOK_FOR");	}
FOREGROUND-COLOR	{ System.out.println("TOK_FOREGROUND_COLOR"); toString("TOK_FOREGROUND_COLOR");}
FROM			{ System.out.println("TOK_FROM"); toString("TOK_FROM");	}
GENERATE		{ System.out.println("TOK_GENERATE"); toString("TOK_GENERATE");	}
GIVING			{ System.out.println("TOK_GIVING"); toString("TOK_GIVING");	}
GLOBAL			{ System.out.println("TOK_GLOBAL"); toString("TOK_GLOBAL");	}
GO			{ System.out.println("TOK_GO"); toString("TOK_GO");	}
GREATER			{ System.out.println("TOK_GREATER"); toString("TOK_GREATER");	}
GROUP			{ System.out.println("TOK_GROUP"); toString("TOK_GROUP");	}
HEADING			{ System.out.println("TOK_HEADING"); toString("TOK_HEADING");	}
HIGH-VALUE	|
HIGH-VALUES		{ System.out.println("TOK_HIGH_VALUE"); toString("TOK_HIGH_VALUE");	}
HIGHLIGHT		{ System.out.println("TOK_HIGHLIGHT"); toString("TOK_HIGHLIGHT");	}
I-O			{ System.out.println("TOK_I_O"); toString("TOK_I_O");	}
I-O-CONTROL		{ System.out.println("TOK_I_O_CONTROL"); toString("TOK_I_O_CONTROL");	}
IDENTIFICATION		{ System.out.println("TOK_IDENTIFICATION"); toString("TOK_IDENTIFICATION");	}
IF			{ System.out.println("TOK_IF"); toString("TOK_IF");	}
IN			{ System.out.println("TOK_IN"); toString("TOK_IN");	}
INDEX			{ System.out.println("TOK_INDEX"); toString("TOK_INDEX");	}
INDEXED			{ System.out.println("TOK_INDEXED"); toString("TOK_INDEXED");	}
INDICATE		{ System.out.println("TOK_INDICATE"); toString("TOK_INDICATE");	}
INITIAL			{ System.out.println("TOK_INITIAL"); toString("TOK_INITIAL");	}
INITIALIZE		{ System.out.println("TOK_INITIALIZE"); toString("TOK_INITIALIZE");	}
INITIATE		{ System.out.println("TOK_INITIATE"); toString("TOK_INITIATE");	}
INPUT			{ System.out.println("TOK_INPUT"); toString("TOK_INPUT");	}
INPUT-OUTPUT		{ System.out.println("TOK_INPUT_OUTPUT"); toString("TOK_INPUT_OUTPUT");	}
INSPECT			{ System.out.println("TOK_INSPECT"); toString("TOK_INSPECT");	}
INSTALLATION		{ System.out.println("TOK_INSTALLATION"); toString("TOK_INSTALLATION");	}
INTO			{ System.out.println("TOK_INTO"); toString("TOK_INTO");	}
INVALID			{ System.out.println("TOK_INVALID"); toString("TOK_INVALID");	}
IS			{ System.out.println("TOK_IS"); toString("TOK_IS");	}
JUST			{ System.out.println("TOK_JUST"); toString("TOK_JUST");	}
JUSTIFIED		{ System.out.println("TOK_JUSTIFIED"); toString("TOK_JUSTIFIED");	}
KEY			{ System.out.println("TOK_KEY"); toString("TOK_KEY");	}
LABEL			{ System.out.println("TOK_LABEL"); toString("TOK_LABEL");	}
LAST			{ System.out.println("TOK_LAST"); toString("TOK_LAST");	}
LEADING			{ System.out.println("TOK_LEADING"); toString("TOK_LEADING");	}
LEFT			{ System.out.println("TOK_LEFT"); toString("TOK_LEFT");	}
LENGTH			{ System.out.println("TOK_LENGTH"); toString("TOK_LENGTH");	}
LESS			{ System.out.println("TOK_LESS"); toString("TOK_LESS");	}
LIMIT			{ System.out.println("TOK_LIMIT"); toString("TOK_LIMIT");	}
LIMITS			{ System.out.println("TOK_LIMITS"); toString("TOK_LIMITS");	}
LINAGE			{ System.out.println("TOK_LINAGE"); toString("TOK_LINAGE");	}
LINAGE-COUNTER		{ System.out.println("TOK_LINAGE_COUNTER"); toString("TOK_LINAGE_COUNTER");	}
LINE			{ System.out.println("TOK_LINE"); toString("TOK_LINE");	}
LINE-COUNTER		{ System.out.println("TOK_LINE_COUNTER"); toString("TOK_LINE_COUNTER");	}
LINES			{ System.out.println("TOK_LINES"); toString("TOK_LINES");	}
LINKAGE			{ System.out.println("TOK_LINKAGE"); toString("TOK_LINKAGE");	}
LOCK			{ System.out.println("TOK_LOCK"); toString("TOK_LOCK");	}
LOW-VALUE	|
LOW-VALUES		{ System.out.println("TOK_LOW_VALUE"); toString("TOK_LOW_VALUE");	}
MEMORY			{ System.out.println("TOK_MEMORY"); toString("TOK_MEMORY");	}
MERGE			{ System.out.println("TOK_MERGE"); toString("TOK_MERGE");	}
MESSAGE			{ System.out.println("TOK_MESSAGE"); toString("TOK_MESSAGE");	}
MODE			{ System.out.println("TOK_MODE"); toString("TOK_MODE");	}
MODULES			{ System.out.println("TOK_MODULES"); toString("TOK_MODULES");	}
MOVE			{ System.out.println("TOK_MOVE"); toString("TOK_MOVE");	}
MULTIPLE		{ System.out.println("TOK_MULTIPLE"); toString("TOK_MULTIPLE");	}
MULTIPLY		{ System.out.println("TOK_MULTIPLY"); toString("TOK_MULTIPLY");	}
NATIVE			{ System.out.println("TOK_NATIVE"); toString("TOK_NATIVE");	}
NEGATIVE		{ System.out.println("TOK_NEGATIVE"); toString("TOK_NEGATIVE");	}
NEXT			{ System.out.println("TOK_NEXT"); toString("TOK_NEXT");	}
NO			{ System.out.println("TOK_NO"); toString("TOK_NO");	}
NOT			{ System.out.println("TOK_NOT"); toString("TOK_NOT");	}
NUMBER			{ System.out.println("TOK_NUMBER"); toString("TOK_NUMBER");	}
NUMERIC			{ System.out.println("TOK_NUMERIC"); toString("TOK_NUMERIC");	}
NUMERIC-EDITED		{ System.out.println("TOK_NUMERIC_EDITED"); toString("TOK_NUMERIC_EDITED");	}
OBJECT-COMPUTER		{ System.out.println("TOK_OBJECT_COMPUTER"); toString("TOK_OBJECT_COMPUTER");	}
OCCURS			{ System.out.println("TOK_OCCURS"); toString("TOK_OCCURS");	}
OF			{ System.out.println("TOK_OF"); toString("TOK_OF");	}
OFF			{ System.out.println("TOK_OFF"); toString("TOK_OFF");	}
OMITTED			{ System.out.println("TOK_OMITTED"); toString("TOK_OMITTED");	}
ON			{ System.out.println("TOK_ON"); toString("TOK_ON");	}
OPEN			{ System.out.println("TOK_OPEN"); toString("TOK_OPEN");	}
OPTIONAL		{ System.out.println("TOK_OPTIONAL"); toString("TOK_OPTIONAL");	}
OR		{ System.out.println("TOK_OR"); toString("TOK_OR");	}
ORDER			{ System.out.println("TOK_ORDER"); toString("TOK_ORDER");	}
ORGANIZATION		{ System.out.println("TOK_ORGANIZATION"); toString("TOK_ORGANIZATION");	}
OTHER			{ System.out.println("TOK_OTHER"); toString("TOK_OTHER");	}
OUTPUT			{ System.out.println("TOK_OUTPUT"); toString("TOK_OUTPUT");	}
OVERFLOW		{ System.out.println("TOK_OVERFLOW"); toString("TOK_OVERFLOW");	}
PACKED-DECIMAL          { System.out.println("TOK_PACKED_DECIMAL"); toString("TOK_PACKED_DECIMAL");	}
PADDING			{ System.out.println("TOK_PADDING"); toString("TOK_PADDING");	}
PAGE			{ System.out.println("TOK_PAGE"); toString("TOK_PAGE");	}
PAGE-COUNTER		{ System.out.println("TOK_PAGE_COUNTER"); toString("TOK_PAGE_COUNTER");	}
PERFORM			{ System.out.println("TOK_PERFORM"); toString("TOK_PERFORM");	}
PF			{ System.out.println("TOK_PF"); toString("TOK_PF");	}
PH			{ System.out.println("TOK_PH"); toString("TOK_PH");	}
PIC			{ System.out.println("TOK_PIC"); toString("TOK_PIC");	}
PLUS			{ System.out.println("TOK_PLUS"); toString("TOK_PLUS");	}
POINTER			{ System.out.println("TOK_POINTER"); toString("TOK_POINTER");	}
POSITION		{ System.out.println("TOK_POSITION"); toString("TOK_POSITION");	}
POSITIVE		{ System.out.println("TOK_POSITIVE"); toString("TOK_POSITIVE");	}
PRINTING		{ System.out.println("TOK_PRINTING"); toString("TOK_PRINTING");	}
PROCEDURE		{ System.out.println("TOK_PROCEDURE"); toString("TOK_PROCEDURE");	}
PROCEDURES		{ System.out.println("TOK_PROCEDURES"); toString("TOK_PROCEDURES");	}
PROCEED			{ System.out.println("TOK_PROCEED"); toString("TOK_PROCEED");	}
PROGRAM			{ System.out.println("TOK_PROGRAM"); toString("TOK_PROGRAM");	}
PROGRAM-ID		{ System.out.println("TOK_PROGRAM_ID"); toString("TOK_PROGRAM_ID");	}
PURGE			{ System.out.println("TOK_PURGE"); toString("TOK_PURGE");	}
QUEUE			{ System.out.println("TOK_QUEUE"); toString("TOK_QUEUE");	}
QUOTE	|
QUOTES			{ System.out.println("TOK_QUOTE"); toString("TOK_QUOTE");	}
RANDOM			{ System.out.println("TOK_RANDOM"); toString("TOK_RANDOM");	}
RD			{ System.out.println("TOK_RD"); toString("TOK_RD");	}
READ			{ System.out.println("TOK_READ"); toString("TOK_READ");	}
RECEIVE			{ System.out.println("TOK_RECEIVE"); toString("TOK_RECEIVE");	}
RECORDS	|
RECORD		{ System.out.println("TOK_RECORD"); toString("TOK_RECORD");	}
REDEFINES		{ System.out.println("TOK_REDEFINES"); toString("TOK_REDEFINES");	}
REEL			{ System.out.println("TOK_REEL"); toString("TOK_REEL");	}
REFERENCE               { System.out.println("TOK_REFERENCE"); toString("TOK_REFERENCE"); }
REFERENCES		{ System.out.println("TOK_REFERENCES"); toString("TOK_REFERENCES");	}
RELATIVE		{ System.out.println("TOK_RELATIVE"); toString("TOK_RELATIVE");	}
RELEASE			{ System.out.println("TOK_RELEASE"); toString("TOK_RELEASE");	}
REMAINDER		{ System.out.println("TOK_REMAINDER"); toString("TOK_REMAINDER");	}
REMOVAL			{ System.out.println("TOK_REMOVAL"); toString("TOK_REMOVAL");	}
RENAMES			{ System.out.println("TOK_RENAMES"); toString("TOK_RENAMES");	}
REPLACE			{ System.out.println("TOK_REPLACE"); toString("TOK_REPLACE"); }
REPLACING		{ System.out.println("TOK_REPLACING"); toString("TOK_REPLACING");	}
REPORT			{ System.out.println("TOK_REPORT"); toString("TOK_REPORT");	}
REPORTING		{ System.out.println("TOK_REPORTING"); toString("TOK_REPORTING");	}
REPORTS			{ System.out.println("TOK_REPORTS"); toString("TOK_REPORTS");	}
RERUN			{ System.out.println("TOK_RERUN"); toString("TOK_RERUN");	}
RESERVE			{ System.out.println("TOK_RESERVE"); toString("TOK_RESERVE");	}
RESET			{ System.out.println("TOK_RESET"); toString("TOK_RESET");	}
RETURN			{ System.out.println("TOK_RETURN"); toString("TOK_RETURN");	}
REVERSE-VIDEO		{ System.out.println("TOK_REVERSE_VIDEO"); toString("TOK_REVERSE_VIDEO");	}
REVERSED		{ System.out.println("TOK_REVERSED"); toString("TOK_REVERSED");	}
REWIND			{ System.out.println("TOK_REWIND"); toString("TOK_REWIND");	}
REWRITE			{ System.out.println("TOK_REWRITE"); toString("TOK_REWRITE");	}
RF			{ System.out.println("TOK_RF"); toString("TOK_RF");	}
RH			{ System.out.println("TOK_RH"); toString("TOK_RH");	}
RIGHT			{ System.out.println("TOK_RIGHT"); toString("TOK_RIGHT");	}
ROUNDED			{ System.out.println("TOK_ROUNDED"); toString("TOK_ROUNDED");	}
RUN			{ System.out.println("TOK_RUN"); toString("TOK_RUN");	}
SAME			{ System.out.println("TOK_SAME"); toString("TOK_SAME");	}
SCREEN			{ System.out.println("TOK_SCREEN"); toString("TOK_SCREEN");	}
SD			{ System.out.println("TOK_SD"); toString("TOK_SD");	}
SEARCH			{ System.out.println("TOK_SEARCH"); toString("TOK_SEARCH");	}
SECTION			{ System.out.println("TOK_SECTION"); toString("TOK_SECTION");	}
SECURITY		{ System.out.println("TOK_SECURITY"); toString("TOK_SECURITY");	}
SEGMENT			{ System.out.println("TOK_SEGMENT"); toString("TOK_SEGMENT");	}
SEGMENT-LIMIT		{ System.out.println("TOK_SEGMENT_LIMIT"); toString("TOK_SEGMENT_LIMIT");	}
SELECT			{ System.out.println("TOK_SELECT"); toString("TOK_SELECT");	}
SEND			{ System.out.println("TOK_SEND"); toString("TOK_SEND");	}
SENTENCE		{ System.out.println("TOK_SENTENCE"); toString("TOK_SENTENCE");	}
SEPARATE		{ System.out.println("TOK_SEPARATE"); toString("TOK_SEPARATE");	}
SEQUENCE		{ System.out.println("TOK_SEQUENCE"); toString("TOK_SEQUENCE");	}
SEQUENTIAL		{ System.out.println("TOK_SEQUENTIAL"); toString("TOK_SEQUENTIAL");	}
SET			{ System.out.println("TOK_SET"); toString("TOK_SET");	}
SIGN			{ System.out.println("TOK_SIGN"); toString("TOK_SIGN");	}
SIZE			{ System.out.println("TOK_SIZE"); toString("TOK_SIZE");	}
SORT			{ System.out.println("TOK_SORT"); toString("TOK_SORT");	}
SORT-MERGE		{ System.out.println("TOK_SORT_MERGE"); toString("TOK_SORT_MERGE");	}
SOURCE			{ System.out.println("TOK_SOURCE"); toString("TOK_SOURCE");	}
SOURCE-COMPUTER		{ System.out.println("TOK_SOURCE_COMPUTER"); toString("TOK_SOURCE_COMPUTER");	}
SPACE			{System.out.println("TOK_SPACE");toString("TOK_SPACE");}
SPACES			{System.out.println("TOK_SPACES");toString("TOK_SPACES");}
SPECIAL-NAMES		{ System.out.println("TOK_SPECIAL_NAMES"); toString("TOK_TOK_SPECIAL_NAMES");	}
STANDARD		{ System.out.println("TOK_STANDARD"); toString("TOK_STANDARD");	}
STANDARD-1		{ System.out.println("TOK_STANDARD_1"); toString("TOK_STANDARD_1");	}
STANDARD-2		{ System.out.println("TOK_STANDARD_2"); toString("TOK_STANDARD_2");	}
START			{ System.out.println("TOK_START"); toString("TOK_START");	}
STATUS			{ System.out.println("TOK_STATUS"); toString("TOK_STATUS");	}
STOP			{ System.out.println("TOK_STOP"); toString("TOK_STOP");	}
STRING			{ System.out.println("TOK_STRING"); toString("TOK_STRING");	}
SUB-QUEUE-1		{ System.out.println("TOK_SUB_QUEUE_1"); toString("TOK_SUB_QUEUE_1");	}
SUB-QUEUE-2		{ System.out.println("TOK_SUB_QUEUE_2"); toString("TOK_SUB_QUEUE_2");	}
SUB-QUEUE-3		{ System.out.println("TOK_SUB_QUEUE_3"); toString("TOK_SUB_QUEUE_3");	}
SUBTRACT		{ System.out.println("TOK_SUBTRACT"); toString("TOK_SUBTRACT");	}
SUM			{ System.out.println("TOK_SUM"); toString("TOK_SUM");	}
SUPRESS			{ System.out.println("TOK_SUPRESS"); toString("TOK_SUPRESS");	}
SYMBOLIC		{ System.out.println("TOK_SYMBOLIC"); toString("TOK_SYMBOLIC");	}
SYNC	|
SYNCHRONIZED		{ System.out.println("TOK_SYNC"); toString("TOK_SYNC");	}
TABLE			{ System.out.println("TOK_TABLE"); toString("TOK_TABLE");	}
TALLYING		{ System.out.println("TOK_TALLYING"); toString("TOK_TALLYING");	}
TAPE			{ System.out.println("TOK_TAPE"); toString("TOK_TAPE");	}
TERMINAL		{ System.out.println("TOK_TERMINAL"); toString("TOK_TERMINAL");	}
TERMINATE		{ System.out.println("TOK_TERMINATE"); toString("TOK_TERMINATE");	}
TEST			{ System.out.println("TOK_TEST"); toString("TOK_TEST");	}
TEXT			{ System.out.println("TOK_TEXT"); toString("TOK_TEXT");	}
THAN			{ System.out.println("TOK_THAN"); toString("TOK_THAN");	}
THEN			{ System.out.println("TOK_THEN"); toString("TOK_THEN");	}
THROUGH			{ System.out.println("TOK_THROUGH"); toString("TOK_THROUGH");	}
THRU			{ System.out.println("TOK_THRU"); toString("TOK_THRU");	}
TIME			{ System.out.println("TOK_TIME"); toString("TOK_TIME");	}
TIMES			{ System.out.println("TOK_TIMES"); toString("TOK_TIMES");	}
TO			{ System.out.println("TOK_TO"); toString("TOK_TO");	}
TOP			{ System.out.println("TOK_TOP"); toString("TOK_TOP");	}
TRAILING		{ System.out.println("TOK_TRAILING"); toString("TOK_TRAILING");	}
TRUE			{ System.out.println("TOK_TRUE"); toString("TOK_TRUE");	}
TYPE			{ System.out.println("TOK_TYPE"); toString("TOK_TYPE");	}
UNDERLINE		{ System.out.println("TOK_UNDERLINE"); toString("TOK_UNDERLINE");	}
UNIT			{ System.out.println("TOK_UNIT"); toString("TOK_UNIT");	}
UNSTRING		{ System.out.println("TOK_UNSTRING"); toString("TOK_UNSTRING");	}
UNTIL			{ System.out.println("TOK_UNTIL"); toString("TOK_UNTIL");	}
UP			{ System.out.println("TOK_UP"); toString("TOK_UP");	}
UPON			{ System.out.println("TOK_UPON"); toString("TOK_UPON");	}
USAGE			{ System.out.println("TOK_USAGE"); toString("TOK_USAGE");	}
USE			{ System.out.println("TOK_USE"); toString("TOK_USE");	}
USING			{ System.out.println("TOK_USING"); toString("TOK_USING");	}
VALUE	|
VALUES			{ System.out.println("TOK_VALUE"); toString("TOK_VALUE");	}
VARYING			{ System.out.println("TOK_VARYING"); toString("TOK_VARYING");	}
WHEN			{ System.out.println("TOK_WHEN"); toString("TOK_WHEN");	}
WHILE			{ System.out.println("TOK_WHILE"); toString("TOK_WHILE");	}
WITH			{ System.out.println("TOK_WITH"); toString("TOK_WITH");	}
WORDS			{ System.out.println("TOK_WORDS"); toString("TOK_WORDS");	}
WORKING-STORAGE		{ System.out.println("TOK_WORKING_STORAGE"); toString("TOK_WORKING_STORAGE");	}
WRITE			{ System.out.println("TOK_WRITE"); toString("TOK_WRITE");	}
ZERO	|
ZEROES	|
ZEROS 			{System.out.println("TOK_ZERO");toString("TOK_ZERO");}

[A-Za-z]+ ([\-]+ [A-Za-z0-9]+)*	{
		System.out.println("TOK_IDENTIFIER"); 
		toString("TOK_IDENTIFIER");
		tablaSimbolos.put(yytext(),"TOK_IDENTIFIER"); 
		}

"+"			{ System.out.println("TOK_PLUS"); toString("TOK_PLUS"); }
"-"				{ System.out.println("TOK_MINUS"); toString("TOK_MINUS"); }
"*"			{ System.out.println("TOK_ASTERISK"); toString("TOK_ASTERISK"); }
"/"				{ System.out.println("TOK_SLASH"); toString("TOK_SLASH"); }
"="			{ System.out.println("TOK_EQUAL"); toString("TOK_EQUAL"); }
"$"			{ System.out.println("TOK_DOLLAR"); toString("TOK_DOLLAR"); }
","				{ System.out.println("TOK_COMMA"); toString("TOK_COMMA"); }
";"				{ System.out.println("TOK_SEMICOLON"); toString("TOK_SEMICOLON"); }
"."				{ System.out.println("TOK_PERIOD"); toString("TOK_PERIOD"); }
"("				{ System.out.println("TOK_LPAREN"); toString("TOK_LPAREN"); }
")"				{ System.out.println("TOK_RPAREN"); toString("TOK_RPAREN"); }
">="        	{ System.out.println("TOK_GREATER_EQ"); toString("TOK_GREATER_EQ"); }
"<="        	{ System.out.println("TOK_LESS_EQ"); toString("TOK_LESS_EQ"); }
">"			{ System.out.println("TOK_GREATER"); toString("TOK_GREATER"); }
"<"			{ System.out.println("TOK_LESS"); toString("TOK_LESS"); }

\r|\n|\r\n          		{ /* no hacer nada */ }
\r|\n|\r\n | [ \t\f]	 	{ /* no hacer nada */ }

.	{
		try {
			manejoErrores("Linea: " + yyline()+ " Caracter No Permitido: \"" + yytext()+ "\"");
			throw new Exception("Linea: " + yyline()+ " Caracter No Permitido: \"" + yytext()+ "\"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}




}
