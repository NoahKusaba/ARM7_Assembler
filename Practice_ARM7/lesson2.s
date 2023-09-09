.global _start
_start:
	@ MOV R1, R0 @ register direct addressing: move data from reg to reg 
	LDR R0, =list   @ loads list data address in to R0, 
	@NOTE that when data is loaded into Stack memory, it can start in an arbitrary location
	@ Need to find the index of the first datapoint, then sequentially access stack to get full list
		@dynamically load first element basically 
		
		@memory addresses incremented in terms of 4 bytes, as 32 bits-> 4 bytes
	LDR R1, [R0]  @ loads value AT address in R0 into R1 
	LDR R2, [R0,#4]
.data @ declare data stored in stack memory
list: 
	.word 4,5,-9,1,0,2,-3 @ every single value that follows is a "word" size 