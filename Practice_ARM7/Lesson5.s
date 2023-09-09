.global _start
_start:
	asdf
	@LSL  Left shift, everything moves 1 bit to left. -> Equivalent of multiplying decimal value by two
	MOV R0, #10
	LSL R0, #3  @ Multiples 10 by 2, 3 times. 
	
	@LSR Right shift, same as dividing by two. Right most bit is lost. 
	
	@ Rotations not common anymore, Left rotation DNE 
	@ROR Right Rotation, Same as Right shift, but the right most bit loops over to left most bit. 
	@