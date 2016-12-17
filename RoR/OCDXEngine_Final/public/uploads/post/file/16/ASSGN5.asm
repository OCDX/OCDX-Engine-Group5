**************************************
*
* Name: Jonathon Lantsberger
* ID: 14205953
* Date: 10/30/16
* Lab5
*
* Program description: This program will take values stored in
* TABLE1 and TABLE2 and sends them to the subroutine by the A and B registers. 
* The subroutine first pushes all the registers onto the stack then multiplies
* the two signed 8-bit numbers and before the return it restores all registers.
* The result is returned over the stack and stores it in RESULT. This process continues
* until the sentinal value $FF is found in the tables. 
*
* Pseudocode of Main Program:
* int TABLE1[] = {-50, 0, 64 , -64, 64, -64, $FF};
* int TABLE2[] = {0, -50, 124, 124, -124, -124, $FF};
* int RESULT[6];
*
* #define SENTI $FF
* int regA = 0;
* int regB = 0;
*
* int *table1Ptr = &TABLE1[0];
* int *table2Ptr = &TABLE2[0];
* int *resultPtr = &RESULT[0];
* 
* while(table1Ptr->data != SENTI){
*   regA = table1Ptr->data;
*   regB = table2Ptr->data;
*   resultPtr->data = multiply(regA, regB);
*   table1Ptr++;
*   table2Ptr++;
*   resultPtr++;
*
* }
*
* Pseudocode of Subroutine:
* 
*  int multiply(int regA, int regB){
*  int FLAG;
*  signed int mulresult;
*
*  result=0;
*  count=0;
*  FLAG=0;
*
*  if(NUM1 < 0) {
*   NUM1 = 0 - NUM1;
*   FLAG++;
*  }
*
*  if(NUM2 < 0) {
*   NUM2 = 0 - NUM2;
*   FLAG--;
*  }
*
*  while(NUM2 != 0) {
*   mulresult = result + NUM1;
*   NUM2--;
*  }
*
*  if(FLAG != 0) {
*   mulresult = 0 - result;
*  }
*
*  return mulresult;
* }
*
**************************************

* start of data section

	ORG $B000
TABLE1	FCB	2, -10, 64, -64, 64, 20, $FF
TABLE2	FCB	2, 1, 124, 124, -124, 2, $FF

	ORG $B010
RESULT	RMB	12

* define any variables that your main program might need here
* REMEMBER: Your subroutine must not access any of the main
* program variables including TABLE1, TABLE2, and RESULT.
SENTI	EQU	$FF
TABLE1PTR	RMB	2	temp variable for holding the TABLE1 address
TABLE2PTR	RMB	2	temp variable for holding the TABLE2 address
RESULTPTR	RMB	2	temp variable for holding the RESULT address


	ORG	$C000
* start of your main program
	LDS	#$01FF	initializing the stack pointer
	LDX	#RESULT
	STX	RESULTPTR	storing the address of RESULT to the temp variable
	LDX	#TABLE1	setting the x register to the first item in TABLE1
	STX	TABLE1PTR	storing the address of TABLE1 to free up x register
	LDY	#TABLE2
	STY	TABLE2PTR	storing the address of TABLE2 to allow x to be used for other operations
WHILE	LDAA	0,X	loading value of element in TABLE2 to compare against SENTI and to pass to sub routine
	CMPA	#SENTI	checking if the table is at the end
	BEQ	ENDWHILE	branch if the table is at $FF
	LDAB	0,Y	loading b with the value from TABLE2
	JSR	MULTIPLY	
	LDX	RESULTPTR	loading x register with the temp 
	PULA		the next two lines get the result from the subroutine
	PULB
	STD	0,X	storing the result from the subroutine into RESULT using the address stored in the temp result variable
	INX		the next two lines bump the temp result address to move to the next data location
	INX
	STX	RESULTPTR	storing the new temp address for result
	LDX	TABLE1PTR	loading the temp TABLE1 pointer to increment it
	INX		incrementing to the next item in TABLE1
	STX	TABLE1PTR	storing the new temp TABLE1 pointer
	LDY	TABLE2PTR	same as above but using the TABLE2 variables
	INY
	STY	TABLE2PTR

	BRA	WHILE
ENDWHILE

DONE	BRA	DONE	ending program with an infinite loop
	END

	ORG $D000
* start of your subroutine
MULTIPLY	DES		opening a hole for low byte of return value
	DES		hole for high byte of return value
	PSHX		saving x register
	PSHY		saving y register
	PSHA		saving a register
	PSHB		saving b register
	TPA		loading a with CC register
	PSHA		saving CC register
	DES		dynamic variable hole for flag
	DES		dynamic variable hole for multiplication result ie NUM2
	DES		dynamic variable hole for mul
	TSX		
*begin multiplication logic
	LDAA	#0	loading a with zero so I can initialize the FLAG variable
	STAA	2,X	initializing FLAG variable dynamically on stack
	LDAA	5,X	loading the a register that was passed from main
	STAA	0,X	storing a register at hole for NUM1
	LDAB	4,X	loading the b register that was passed from main
	STAB	1,X	storing b register at hole for NUM2
IF	TST	0,X	checking to see if NUM1 is negative
	BPL	ENDIF
THEN	INC	2,X	increment the FLAG variable
	NEG	0,X	taking the absolute value of NUM1
ENDIF
IF1	TST	1,X	checking to see if NUM2 is negative
	BPL	ENDIF1
THEN1	DEC	2,X	increment the FLAG variable
	NEG	1,X	taking the absolute value of NUM2
ENDIF1	LDD	#0	clearing out D register
WHILE1	TST	1,X	checking to see if NUM2 is > 0
	BEQ	ENDWHILE1
	ADDB	0,X	adding num1 to the current sum
	ADCA	#0	double byte precision
	DEC	1,X	NUM2--
	BRA	WHILE1
ENDWHILE1
IF2	TST	2,X	testing to see if FLAG is 0 or 1
	BEQ	ENDIF2
THEN2	COMA		one's comp of sum high byte
	COMB		one's comp of sum low byte
	ADDD	#1	turning the one's comp sum into a 2's comp
ENDIF2
*end multiplication logic
	LDY	12,X	putting return address into Y register
	STY	10,X	moving up return address by 2
	STD	12,X	putting the result of multiplication on the stack
	INS		the next three lines close the 3 variable holes at top of stack
	INS
	INS
	PULA
	TAP		restore CC flags
	PULB		restore b register
	PULA		restore a register
	PULY		restore y register
	PULX		restore x register
	RTS