.global _start
_start:
	
	@emulating overwriting register for local functions while maintaining original values. 
	
	MOV R0, #1
	MOV R1, #3
	PUSH {R0, R1} @ Push to memory Stac
	BL get_value
	POP {R0, R1} @ Pull from memory sack
	B End 
	
get_value: 
	MOV R0, #5
	MOV R1, #7
	ADD R2, R0, R1
	BX lr 
	
end: 