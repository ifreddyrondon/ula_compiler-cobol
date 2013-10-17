:- [tokenizador].
:- [listas].

%Lee de un archivo y lo almacena en una lista, cada elem de la lista es una linea
is_eof(FlHndl, CharCode, CurrentLine, FileAkku, FileContent) :-
        CharCode == -1,
        append(FileAkku, [CurrentLine], FileContent),
        close(FlHndl), !.

is_newline(FlHndl, CharCode, CurrentLine, FileAkku, FileContent) :-
        CharCode == 10,
        append(FileAkku, [CurrentLine], NextFileAkku),
        read_loop(FlHndl, '', NextFileAkku, FileContent).
        
append_char(FlHndl, CharCode, CurrentLine, FileAkku, FileContent) :-
        char_code(Char, CharCode),
        atom_concat(CurrentLine, Char, NextCurrentLine),
         read_loop(FlHndl, NextCurrentLine, FileAkku, FileContent).

read_file(FileName, FileContent) :-
        open(FileName, read, FlHndl),
        read_loop(FlHndl, '', [], FileContent), !.

read_loop(FlHndl, CurrentLine, FileAkku, FileContent) :-
        get_code(FlHndl, CharCode),
        ( is_eof(FlHndl, CharCode, CurrentLine, FileAkku, FileContent)
        ; is_newline(FlHndl, CharCode, CurrentLine, FileAkku, FileContent)
        ; append_char(FlHndl, CharCode, CurrentLine, FileAkku, FileContent)).	

% Comprueba si la primera palabra es Mayuscula, para comprobar si es palabra reservada
first_char_upper(Palabra):-
	name(Palabra, CharList), nth0(0, CharList, FirstChar),char_code(Char,FirstChar),char_type(Char, upper).

eliminar_comilla_string([],[]):-!.
eliminar_comilla_string([X|Y],[X2|Y2]):-
	name(X, List),
	extract_atomics(List,ListX),
	elimina_x(ListX,'"',Elim),
	list_string_vacio(Elim,X2),
	eliminar_comilla_string(Y,Y2).

palabras_reservadas(Palabra,Salida):-
	((first_char_upper(Palabra),Palabra == 'AND',Salida = 'OP_LOGICO');
	(first_char_upper(Palabra),Palabra == 'OR',Salida = 'OP_LOGICO');
	(first_char_upper(Palabra),Palabra == 'NOT',Salida = 'OP_LOGICO');
	(first_char_upper(Palabra),Salida = 'PALABRA_RESERVADA');
	(Salida = Palabra)).

operador_aritmetico(Palabra,Salida):-
	((Palabra == '"+"', Salida = 'OP_ARITMETICO');
	(Palabra == '"-"', Salida = 'OP_ARITMETICO');
	(Palabra == '"*"', Salida = 'OP_ARITMETICO');
	(Palabra == '"/"', Salida = 'OP_ARITMETICO');
	(Salida = Palabra)).
	
operador_relacion(Palabra,Salida):-
	((Palabra == '"<="', Salida = 'OP_RELACION');
	(Palabra == '"<"', Salida = 'OP_RELACION');
	(Palabra == '"="', Salida = 'OP_RELACION');
	(Palabra == '">="', Salida = 'OP_RELACION');
	(Palabra == '">"', Salida = 'OP_RELACION');
	(Salida = Palabra)).
	
operador_pseudo(Palabra,Salida):-
	((Palabra == 'quoted-pseudo-text', Salida = 'OP_PSEUDO');
	(Salida = Palabra)).
	
parentesis(Palabra,Salida):-
	((Palabra == '"("', Salida = 'PAR_IZQ');
	(Palabra == '")"', Salida = 'PAR_DER');
	(Salida = Palabra)).
	
delimitador(Palabra,Salida):-
	((Palabra == '"."', Salida = 'DELIMITADOR');
	(Palabra == '","', Salida = 'PUNTUACION');
	(Palabra == '":"', Salida = 'PUNTUACION');
	(Salida = Palabra)).
	
numeros(Palabra,Salida):-
	((Palabra == 'priority-number', Salida = 'PRIORIDAD');
	(Palabra == 'level-number', Salida = 'PRIORIDAD');
	(Palabra == 'zero', Salida = 'CERO');
	(Palabra == 'integer', Salida = 'ENTERO');
	(Palabra == 'numeric', Salida = 'NUMERO');
	(Palabra == 'nonnumeric', Salida = 'NO_NUMERICO');
	(Salida = Palabra)).
	
identificador(Palabra,Salida):-
	((Palabra == 'alphabetic-user-defined-word', Salida = 'IDENTIFICADOR');
	(Palabra == 'cobol-word', Salida = 'IDENTIFICADOR');
	(Palabra == 'system-name', Salida = 'IDENTIFICADOR');
	(Palabra == 'user-defined-word', Salida = 'IDENTIFICADOR');
	(Salida = Palabra)).
	
reemplazar_generica_gramatica([],[]):-!.	
reemplazar_generica_gramatica([X|Y],[X2|Y2]):-
	% palabras reservadas y operadores logicos
	palabras_reservadas(X,Z),
	% operadores aritmetico
	operador_aritmetico(Z,Z2),
	% operador relacion
	operador_relacion(Z2,Z3),
	% operador pseudo
	operador_pseudo(Z3,Z4),
	% parentesis
	parentesis(Z4,Z5),
	% delimitador y puntuacion
	delimitador(Z5,Z6),
	% level-number, priority-number, zero, integer , numeric y nonnumeric
	numeros(Z6,Z7),
	% alphabetic-user-defined-word, cobol-word, system-name y user-defined-word
	identificador(Z7,X2),
	reemplazar_generica_gramatica(Y,Y2).

% arregla la gramatica en funcion de los terminales y las guarda en un archivo ya arregladas
cobol_gramatica(StringCobol) :-
	atomic_list_concat(ListCobol,' ',StringCobol),
	eliminar_comilla_string(ListCobol,ListCobol2),
	anidada_simple(ListCobol2,ListCobol3),
	reemplazar_generica_gramatica(ListCobol3,ListCobol4),
	list_string_espacios(ListCobol4,StringCobolListo),
	consult('gramatica_lista.txt'),
   	append('gramatica_lista.txt'),
	write(StringCobolListo),nl,
	told,
	nl,write(StringCobolListo).

pasar_funcion([]):-!.	
pasar_funcion([X|Y]):-
	cobol_gramatica(X),
	pasar_funcion(Y).
	
% Principal, lee la gramatica del archivo no arreglado
funciona :-
	read_file('gramatica.txt',ListGramaticaCompleta),
	pasar_funcion(ListGramaticaCompleta).
