IDENTIFICATION DIVISION.
PROGRAM-ID. test-program.
ENVIRONMENT DIVISION.
DATA DIVISION.
WORKING-STORAGE SECTION.
01	various-numbers.
01	other-numbers.

PROCEDURE DIVISION.
	DISPLAY " ,123.45  ,123.00  123.45  ,   .12 $ ,  2,398.47".
	DISPLAY "------------------------------------------------".
	DISPLAY various-numbers.
	DISPLAY " ".
	DISPLAY "2,345.00 2,345.00 2345.00  , 12.30 $ ,239,847.00".
	DISPLAY "------------------------------------------------".
	DISPLAY other-numbers.
    
	