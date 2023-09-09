.global _start
_start:
	@ how to return back after add2 finishes, without writing complex branches 
	MOV R0, #1
	MOV R1, #3 
	BL add2 @basically BAL, but stores the address that follows BL in register lr 
			@ you can reference the the memory location to return back to flow of start
				@ to trigger following MOV command 
	MOV R5, #20 
add2: 
	Add R2, R0, R1
	bx lr @ branches back to lr 