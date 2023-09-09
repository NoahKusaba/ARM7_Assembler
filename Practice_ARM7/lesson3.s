.global _start
_start:
	
	MOV R0, #5 
	MOV R1, #7
	ADD R2, R0, R1 @ R2 = R0 + R1 
	SUB R3, R0, R1 @ R0 - R1
	
	MUL R4, R0, R1 
	SUBS R5, R0, R1 @ make flag in CPSR to denote negative, need to flag, as it can be more compute intensive
						@ Use if you don't know if value will be negative, or if IT WILL BE 
	
	MOV R7, #0xFFFFFFFF
	ADDS R6, R7, R0 @ Flags for 32 bit overflow
	
	ADC R6, R7, R0 @ Adds carry value, R2 = R0 + R1 + Carry (from CSPR