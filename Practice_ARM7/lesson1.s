 .global _start  ; label that flags functions 

_start:
    mov R0, #30
    MOV R7, #1 @ indicates to exit program

    SWI 0 @ software interrupt to let OS takeover