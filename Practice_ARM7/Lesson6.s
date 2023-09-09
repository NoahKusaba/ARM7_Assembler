.global _start
_start:
	
	MOV R0, #1
	MOV R1, #2
	CMP R0, R1 @ Comparison, R0-R1 : returns positive if R0 > R1, negative R0 < R1, 0 if R0=R1
			   @ Sets flag in CPSR register depending on output
	
	BGT greater @ Branches flow to label "greater", if CPSR has not flagged  
	MOV R3,#50
	BLT @ less than 
	BLE @ less than or equal to, etc. 
	BAL someLabel @ This branch will always execute
	

greater: @ Label
	Mov R2, #20
	
	
someLabel:
	MOV R6, #100