.global _start
_start:
	@ Simplified Built-in conditional functions 
	MOV R0, #2
	MOV R1, #4
	CMP R0, R1
	ADDLT R2, #1    @ function only triggers if previous comparison is "less than"-> flags CPSR as negative
	
	MOVGE R5, #6 @ triggers if Comparitor is greater than or equal (R0 >= R1) 