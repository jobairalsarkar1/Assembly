.MODEL SMALL
.STACK 100H

.DATA
    ;m DB "Valid Input Length is between 1 - 9.$"
    m1 DB "Length(1-9): $"
    m2 DB 13, 10, "Fibonacci Sequence: $"
    m3 DB 13, 10, "Invalid Input.$"
    fibLength DB ?
    fibSequence DB 10 DUP(0)
    

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; get the length of the sequence
    LEA DX, m1
    MOV AH, 09H
    INT 21H
    
    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV fibLength, AL
    
    ; check if length is 0
    CMP fibLength, 0
    JE EXIT

    ; check if length is greater than 9
    CMP fibLength, 9
    JG invalidInput

    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; initialize the sequence
    MOV AL, 0
    MOV [fibSequence], AL
    INC AL
    MOV [fibSequence + 1], AL

    ; calculate the rest of the sequence
    CMP fibLength, 2
    JBE SKIP_CALCULATION
    MOV CH, 0
    MOV CL, fibLength
    SUB CX, 2
    LEA SI, [fibSequence + 2]
    LEA DI, [fibSequence]
    REPEAT:
        MOV AL, [DI]
        ADD AL, [DI + 1]
        MOV [SI], AL
        INC DI
        INC SI
        LOOP REPEAT
    SKIP_CALCULATION:

    ; print the sequence 
    LEA DX, m2
    MOV AH, 09H
    INT 21H
    
    MOV CH, 0
    MOV CL, fibLength
    LEA DI, [fibSequence]
    REPEAT1:
        MOV AH, 0
        MOV AL, [DI]
        MOV BL, 10
        
        DIV BL
        MOV BH, AH
        
        MOV DL, AL
        ADD DL, '0'
        MOV AH, 02H
        INT 21H
        
        
        MOV DL, BH
        ADD DL, '0'
        MOV AH, 02H
        INT 21H
        
        ;MOV AH, 02H
        ;MOV DL, [DI]
        ;ADD DL, '0'
        ;INT 21H
        
        INC DI
        
        MOV DX, ' '
        MOV AH, 2
        INT 21H
        
        ;INC DI
        
        LOOP REPEAT1

    ; exit
    JMP EXIT

    invalidInput:
        ; print invalid input message
        LEA DX, m3
        MOV AH, 09H
        INT 21H

    EXIT:
        MOV AX, 4C00H
        INT 21H
    
MAIN ENDP
END MAIN

