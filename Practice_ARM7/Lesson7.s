.global _start
.equ endlist , 0xaaaaaaaa @ define constants 
_start:
	LDR R0, =list
	LDR R3, =endlist
	LDR R1, [R0]
	ADD R2, R2,R1

@ Loop which sums values of list into Register R2
loop:
	LDR R1, [R0,#4]! @increments by 4 bytes and loads to R1 
	CMP R1, R3
	BEQ exit
	ADD R2, R2, R1
	BAL loop

exit:

.data
list:
	.word 1,2,3,4,5,6,7,8,9,10