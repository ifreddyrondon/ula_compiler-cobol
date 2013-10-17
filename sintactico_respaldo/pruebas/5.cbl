IDENTIFICATION DIVISION.
PROGRAM-ID. test-program.
ENVIRONMENT DIVISION.

CONFIGURATION SECTION.
SOURCE-COMPUTER. Motorola.
OBJECT-COMPUTER. Intel.

INPUT-OUTPUT SECTION.
FILE-CONTROL.
	SELECT CARD-IN 	ASSIGN TO CARD-READER.
	SELECT PRINT-OUT	ASSIGN TO PRINTER.


DATA DIVISION.
FILE SECTION.
FD card-in LABEL RECORD IS OMITTED.

01	card-in-record.
05	card-social-security-number.

FD print-out LABEL RECORD IS OMITTED.

01	print-out-record.
05	print-social-security-number.

PROCEDURE DIVISION.
START-X.
	OPEN INPUT card-in OUTPUT print-out.
LOOP-X.
	READ card-in RECORD AT END CLOSE card-in
		print-out STOP RUN.
    MOVE digits-one-to-three TO print-one.
    MOVE "-" TO print-two.
    MOVE digits-four-and-five TO print-three.
    MOVE "-" TO print-four.
    MOVE digits-six-to-nine TO print-five.
    MOVE spaces TO space-x.
    MOVE card-name TO print-name.
    WRITE print-out-record.
    DISPLAY print-out-record.
    GO TO loop-x.
	