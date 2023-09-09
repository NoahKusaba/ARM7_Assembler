.global _start
_start:
	MOV R0, #12
	MOV R1, #22
	AND R2, R0, R1 @ Logic operators, R3 for result, R0 and R1 
					@ Wherever 1's match up -> 1 
					@ everything else is -> 0
					
					
	ANDS R3 R0, R1 @ Sets flags for AND
	
	ORR R4, R0, R1 @ inverse of AND 
	EOR R5, R0, R1 @ exclusive or, gives 1 if one of the two comparitors is 1 
	
	MVN R7, R0  @ Moves negation from source to destination -> Flips values of entire register 