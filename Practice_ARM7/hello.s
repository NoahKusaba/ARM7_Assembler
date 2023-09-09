ARM assembly
- Register has 8 zeros 
- each zero represents a hexadecimal value (4 bits)
- each register holds 32 bits
- 32 bit processor
    - how much can be stored in single register
- a "word" of data is 32 bits 

- Generally:
    - R0 -> R6 
        - general purpose
    - R7 -> system call 
        - talk to operating system for resource,
            termiante program etc. 
        - maps to table for specific action

    - sp
        - Stack pointer
            - Stack memory
            - address of next available memory in stack memory (ram)

    - lr
        - Stores location that a function returns back to 
        - high level languages
    - pc 
        - stores next function to execute 
    - cpsr 
        - stores information about program
            - can flag memory to note that result of operation was negative
            - maps to flags for special cases (data overflow, etc. )