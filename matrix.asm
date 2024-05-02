.MODEL SMALL
.STACK 100H      
       
.DATA
    m DB "Matrix1:$"
    m1 DB 13, 10, "Row1:  $"
    m2 DB 13, 10, "Row2:  $"
    mx DB 13, 10, "Matrix2: $"
    m3 DB 13, 10, "Row1:  $"
    m4 DB 13, 10, "Row2:  $"
    result DB 13, 10, "Result Matrix: $"
    m1row1 DB 2 DUP(?)
    m1row2 DB 2 DUP(?)
    
    m2row1 DB 2 DUP(?)
    m2row2 DB 2 DUP(?)
    
    resultRow1 DB 2 DUP(?)
    resultRow2 DB 2 DUP(?)
    r DB ?
    q DB ?

.CODE
    MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    ;Code Here
    
    LEA DX, m
    MOV AH, 9
    INT 21H
    
    LEA DX, m1
    MOV AH, 9
    INT 21H
    
    MOV CX, 2
    MOV SI, 0
    r1: 
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        MOV m1row1[SI], AL
        
        MOV DX, ' '
        MOV AH, 2
        INT 21H
        
        INC SI
    LOOP r1
         
         
    LEA DX, m2
    MOV AH, 9
    INT 21H
    
    MOV CX, 2
    MOV SI, 0
    r2: 
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        MOV m1row2[SI], AL
         
        MOV DX, ' '
        MOV AH, 2
        INT 21H
        
        INC SI
    LOOP r2
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX, mx
    MOV AH, 9
    INT 21H
    
           
    LEA DX, m3
    MOV AH, 9
    INT 21H 
    
    MOV CX, 2
    MOV SI, 0
    r3: 
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        MOV m2row1[SI], AL
         
        MOV DX, ' '
        MOV AH, 2
        INT 21H
        
        INC SI
    LOOP r3
    
            
    LEA DX, m4
    MOV AH, 9
    INT 21H 
    
    MOV CX, 2
    MOV SI, 0
    r4: 
        MOV AH, 1
        INT 21H 
        SUB AL, 30H
        MOV m2row2[SI], AL 
        
        MOV DX, ' '
        MOV AH, 2
        INT 21H
        
        INC SI
    LOOP r4
    
    
    ;ADDITION PART
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
    
    LEA DX, result
    MOV AH, 9
    INT 21H
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
   
    
    MOV CX, 2
    MOV SI, 0
    addR1:
        MOV AL, m1row1[SI]
        MOV BL, m2row1[SI]
        ADD AL, BL
        
        MOV AH, 0
        MOV BL, 10
        DIV BL
        
        MOV BH, AH
        
             
        MOV DL, AL
        ADD DL, 30H
        MOV AH, 2
        INT 21H
        
        MOV DL, BH
        ADD DL, 30H
        MOV AH, 2
        INT 21H
        
        MOV DL, ' '
        MOV AH, 2
        INT 21H

        
        INC SI
    LOOP addR1

    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
   
    
    MOV CX, 2
    MOV SI, 0
    addR2:
        MOV AL, m1row2[SI]
        MOV BL, m2row2[SI]
        ADD AL, BL
        
        MOV AH, 0
        MOV BL, 10
        DIV BL
        
        MOV BH, AH
        
             
        MOV DL, AL
        ADD DL, 30H
        MOV AH, 2
        INT 21H
        
        MOV DL, BH
        ADD DL, 30H
        MOV AH, 2
        INT 21H
        
        MOV DL, ' '
        MOV AH, 2
        INT 21H

        
        INC SI
    LOOP addR2
    
    
       
    MOV AX, 4C00H
    INT 21H
    
    MAIN ENDP
    END MAIN