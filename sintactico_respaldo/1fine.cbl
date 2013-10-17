IDENTIFICATION DIVISION.
PROGRAM-ID. test-program freddy rondon.
ENVIRONMENT DIVISION.

CONFIGURATION SECTION.
SOURCE-COMPUTER. Motorola.
OBJECT-COMPUTER. Intel.


DATA DIVISION.
WORKING-STORAGE SECTION.
01	varx.
	05	vary	PICTURE IS 9999.
	*	This is a test of expanded pictures
	05	varz	PICTURE IS 9(5) VALUE IS 60.
	05	address.
		07	house	PICTURE IS 9(6) VALUE IS 504.
		
PROCEDURE DIVISION.
    DISPLAY "ThIS IS a cobol program".
    DISPLAY varx.
    MOVE 768 TO vary, varz.
    ADD vary TO varz.
    SUBTRACT 5 FROM vary.
    MULTIPLY vary BY 2.
    DIVIDE varz BY 3.
    DISPLAY varx.