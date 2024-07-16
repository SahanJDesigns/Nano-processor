# 4-bit Nanoprocessor Design

## Introduction
In this project, our team, Scorpions, made a simple 4-bit computer that can perform basic tasks. We learned how to build different parts of the computer, such as the ALU, memory, and Instruction Decoder. This assigned lab task involves designing a 4-bit nanoprocessor capable of executing basic instructions.

This includes creating components such as:
- An arithmetic unit for addition and subtraction
- A program counter for instruction sequencing
- A register bank for data storage
- An instruction decoder for interpreting commands
- A program ROM to store the assembly program
- Multiplexers for data routing

Some components from previously completed labs like the slow clock, full adder, half adder, etc. were used in the nanoprocessor. The primary task of the lab was to calculate the sum of integers from 1 to 3 and display the result on a 7-segment display using the designed nanoprocessor. Each component's functionality was tested using simulation files, and finally, the nanoprocessor was tested on a Basys-3 board.


## Assembly Program and Machine Code Representation

| Machine Code   | Instruction                                                   |
|----------------|---------------------------------------------------------------|
| 100000000000   | Omit the first command because in rare cases it might not run |
| 100010000001   | MOV R1,01                                                     |
| 100100000010   | MOV R2,02                                                     |
| 100110000011   | MOV R3,03                                                     |
| 000010100000   | ADD R1,R2                                                     |
| 000010110000   | ADD R1,R3                                                     |
| 001110010000   | ADD R7,R1 (Display R1)                                        |
| 110000000111   | END                                                           |


## Implementation
To begin using the Nano Processor, follow these steps:
1. Extract the provided files.
2. Run the "Nano-processor.xpr" project using Xilinx Vivado.
3. Program the Basys-3 board using the hardware manager.

### Expected Behaviour
The Nano Processor comes preprogrammed to calculate the sum of numbers from 1 to 3. The result is displayed on the seven-segment display and LEDs.

### Output Ports
Display result by LEDs:
- 0th bit – LD0
- 1st bit – LD1
- 2nd bit – LD2
- Sign bit – LD3
- Reset Button: U18
- Zero flag: LD13
- Overflow flag: LD14

### User Modifications
Users can implement their own programs by modifying the machine code in the Program ROM. Refer to the Programming Instructions section for details. The Nano Processor supports instructions such as ADD, SUB, NEG, MOVE, DISPLAY, JZR, and END.

## Features
- 4-bit CPU architecture
- Two output ports: Seven-segment display and LEDs
- Single-cycle processor
- ALU capable of addition, subtraction, and negation
- Ability to run programs continuously (unless END operation is used)
- Adjustable CPU clock speed (default speed: 5 Hz)
- Program ROM to store 8 12-bit instructions


## Programming Instructions

| Format            | Instruction       | Description                                    |
|-------------------|-------------------|------------------------------------------------|
| 00RaRaRa RbRbRb0000 | ADD Ra, Rb      | Ra ⟵ Ra + Rb                                   |
| 00111RRR 0000     | DISPLAY R         |                                                |
| 01RRR0000000      | NEG R             | R ⟵ -R                                         |
| 01RaRaRa RbRbRb0000 | SUB Rb, Ra      | Ra ⟵ Rb - Ra                                   |
| 10RRR000dddd      | MOV R, d          | R ⟵ d                                          |
| 101110000000      | CLEAN DISPLAY     |                                                |
| 11RRR0000ddd      | JZR R, d          | If R == 0 then PC ⟵ d; else PC ⟵ PC + 1        |
| 110000000ddd      | END               | (d = current address)                          |


## Problems Faced and How We Solved Them

### 1: Not able to display the result continuously and unable to use NEG (negation) in the same Add/Sub Unit.
**Solution:** Replacing Register 0 of the register bank with a ground terminal
- This allowed us to use NEG (negation) and SUB (subtraction) operations using the same Add/Sub Unit. For negation, Rb was subtracted from Register 0.
- We were able to use an END operation to pause the nano processor at a certain stage (We were able to display the result continuously at the end of the program). Here a JZR statement was used where it will continuously jump to the same address (as given below).
## Assembly Program and Machine Code Representation
| Machine Code    | Instruction                | Description                                                             |
|-----------------|----------------------------|-------------------------------------------------------------------------|
| 100000000000    | -                          | Used to omit the first command because, in rare cases, it might not run |
| 100010000001    | MOV R1,01                  |                                                                         |
| 100100000010    | MOV R2,02                  |                                                                         |
| 010010000000    | NEG R1                     |                                                                         |
| 001110010000    | ADD R7,R1                  | (Display R1)                                                            |
| 010010100000    | SUB R2,R1                  |                                                                         |
| 001110000000    | ADD R7,R1                  | (Display R1)                                                            |
| 110000000111    | END                        |                                                                         |

### 2: When two numbers are added or subtracted, the result is stored again in one of the registers. But this result is added/subtracted again with the number stored in the other register and this may result in an overflow although the original result should not have an overflow.
**Solution:** An Enable pin was introduced for the Add/Sub Unit.
- This Enable is triggered when there is an addition/subtraction and when the clock is high.
- The Overflow flag depends on this Enable, and therefore it will not be triggered in unnecessary situations.


## Tested Improvements

### Improvements in 8-bit Nano Processor
- Increased the size of a register in the register bank up to 8 bits. This allows the nano processor to store and process data up to 8 bits.
- Increased the size of the program counter up to 4 bits. This allows the nano processor to use up to 16 instructions.
- Increased the size of the Add/Sub Unit up to 8 bits. This allows the nano processor to perform operations with larger numbers.
### Programmed the Program ROM to calculate Fibonacci numbers
- The improved 8-bit nano processor can calculate Fibonacci numbers up to the 11th Fibonacci number (89 or 0x59).
    #### Algorithm:
    01 MOV R1,01
    02 MOV R2,01
    03 ADD R7,R1
    04 ADD R7,R2
    05 MOV R1,0
    06 ADD R1,R7
    07 ADD R7,R2
    08 MOV R2,0
    09 ADD R2,R1
    10 JZR R0,5
### Added a 4-bit multiplier to ALU and programmed the Program ROM to calculate the powers of two.
- The improved 8-bit nano processor can calculate powers of 2 up to 24 (16 or 0x10).


## Problems Faced in the Improved Version and How We Managed to Overcome Them
### Problem: We cannot display numbers after 127
**Solution:** An overflow flag is triggered after 127 to notify that.
- In this program (Fibonacci sequence), the overflow flag will be triggered after 89 (before 144).

## Additional Development Suggestions
1. Zero and Overflow can be saved in flag registers
   - The current design only shows Zero and Overflow using LEDs. 
   - The nano processor will be able to use the JNZ instruction using the Zero Flag.
2. Comparison operation can be added
   - A comparator can be added to the Arithmetic Unit.

## Conclusion
In conclusion, this lab has been a fascinating exploration of the field of computer design. We constructed a working 4-bit processor that can carry out simple commands. We have improved our practical knowledge of digital electronics by creating and integrating a variety of components, including memory, instruction decoder, and arithmetic unit.

Furthermore, this project improved our teamwork skills. Overall, this experience has been both educational and useful, laying a good foundation for our future journey in computer architecture and digital design.

