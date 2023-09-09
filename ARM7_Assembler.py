"""
- Proof of concept Assembler for ARM7 Assembly Language 
    - 16 bit instruction sets. 
- Registers 1 byte long
- Ouputs binary, according to stated address schema. 
"""

# Registers: ['Address', 'Value']
# The "value" key is to create a virtual register store associated with the address to get outputs. 
registers = {
    "R0": {"address" :"0001", "value" :"0000"}, # All R's are general registers. 
    "R1": {"address" :"0002", "value" :"0000"},
    "R2": {"address" :"0003", "value" : "0000"},
    "R3": {"address" :"0004", "value" :"0000"},
    "CPSR": {"address" :"0005", "value" :"0000"}, # Same flag for negative and zero in this case 
}
empty = "0000" # Needed ADD and SUB commands, otherwise empty
opcodes = {
    "MOV": "0001",
    "ADD": "0010",
    "SUB": "0011",
    "BAL": "0100",
    "CMP": "0101",
    "BEQ": "0111"
}

# Change this to test output
sample_assemblyInput=  '''
.global _start
_start:
	MOV R0, #1
	MOV R1, #2
    MOV R3, #5
	ADD R2, R0, R1
loop:
	CMP R1, R3
	BEQ exit
	ADD R1, R1, R2
	BAL loop

'''

def assembler(assembly_input):
    lines = assembly_input.split('\n')
    # Seperate instructions by labels, for calling as functions (In case of loops) 
    labels = {} 
    current_label =""
    for line in lines: 
        line = line.strip()
        if ".global" in line or line == "": pass
        elif ":" in line: 
            labels[line] = []
            current_label = line
        else: 
            labels[current_label].append(line)
    #Generate Instruction sets, in order of labels. Note that labels can be called recursively
    final_instructions = []
    for label in labels.keys(): 
        label_instructions = get_instructionsLabel(label, labels)
        final_instructions.append(label_instructions)
    final_instructions = sum(final_instructions, [])
    return final_instructions

def get_instructionsLabel(label, labels):
    label_line = labels[label]
    Instructions = []
    for line in label_line: 
        words = line.split(' ')
        if words[0] == 'MOV':
            first_word = words[1].replace(',',"") # Remove Commas
            first_address  = registers[first_word]['address']
            second_value = '{0:04b}'.format(int(words[2].replace('#',''))) if '#' in words[2] else registers[words[2]]["value"]  #Generate decimal value, or Register value
            instruction = opcodes[words[0]] + first_address + second_value + empty 
            #Update Registers 
            registers[first_word]["value"] = second_value 

        elif words[0] in ['ADD', 'SUB']:
            first_word = words[1].replace(',', "") # Remove Commas
            first_address  = registers[first_word]['address'] # Will need custom filtering for commas and hashes, but not writing it. 
            second_value = '{0:04b}'.format(int(words[2].replace(',',''))) if '#' in words[2] else registers[words[2].replace(',','')]["value"] 
            third_value = '{0:04b}'.format(int(words[3].replace(',',''))) if '#' in words[3] else registers[words[3]]["value"] 
            instruction = opcodes[words[0]] + first_address + second_value + third_value
            #Update Registers
            registers[first_word]["value"] =  '{0:04b}'.format(int(second_value, 2) + int(third_value, 2))
        
        elif words[0] == "CMP":
            first_value = registers[words[1].replace(",","")]["value"]
            second_value = registers[words[2].replace(",","")]["value"]
            comparison = int(first_value,2) - int(second_value,2)
            if comparison > 0: 
                instruction = opcodes[words[0]] + "0000" + empty * 2 
            elif comparison <= 0: 
                instruction = opcodes[words[0]] + "0001" + empty * 2 
                registers['CPSR']['value'] = "00001"  # Set CPSR flag if negative or zero
            
        elif words[0] == "BEQ" :
            check_CPSR = registers['CPSR']['value']
            if "1" in check_CPSR and words[1] == "exit": # Not treating exit as label, for ease of programming 
                instruction = opcodes[words[0]] + empty * 3 
                break
        elif words[0] == "BAL": # Recursively calls new label function
            Instructions += get_instructionsLabel(words[1]+':', labels)
            break
        Instructions.append(instruction)
    return Instructions

if __name__ == "__main__":
    machine_code = assembler(sample_assemblyInput)
    print(machine_code)