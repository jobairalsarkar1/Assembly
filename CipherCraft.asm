.MODEL SMALL
.STACK 100H
.data
    FA DB "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$"
    FB DB 13, 10, "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$"
    FC DB 13, 10, "+++++++++%-------------%+++++++++++++++++++++++++++%---------------%+++++++++++$"
    FD DB 13, 10, "+++++++++|             |+++%--%+++++++++++++%--%+++|                 \+++++++++$"
    FE DB 13, 10, "+++++++++|             |++++\  \+++++++++++/  /++++|                  )++++++++$"
    FF DB 13, 10, "+++++++++|   %---------%+++++\  \+++++++++/  /+++++|   %---------%    |++++++++$"
    FG DB 13, 10, "+++++++++|   |++++++++++++++++\  \+++++++/  /++++++|   |++++++++++|   |++++++++$"
    FH DB 13, 10, "+++++++++|   |+++++++++++++++++\  \+++++/  /+++++++|   |++++++++++|   |++++++++$"
    FI DB 13, 10, "+++++++++|   |++++++++++++++++++\  \+++/  /++++++++|   |++++++++++|   |++++++++$"
    FJ DB 13, 10, "+++++++++|   %---------%+++++++++\  \+/  /+++++++++|   |++++++++++|   |++++++++$"
    FK DB 13, 10, "+++++++++|             |++++++++++\  |  /++++++++++|   |++++++++++|   |++++++++$"
    FL DB 13, 10, "+++++++++|             |+++++++++++|   |+++++++++++|   |++++++++++|   |++++++++$"
    FM DB 13, 10, "+++++++++|   %---------%++++++++++/  |  \++++++++++|   |++++++++++|   |++++++++$"
    FN DB 13, 10, "+++++++++|   |+++++++++++++++++++/  /+\  \+++++++++|   |++++++++++|   |++++++++$"
    FO DB 13, 10, "+++++++++|   |++++++++++++++++++/  /+++\  \++++++++|   |++++++++++|   |++++++++$"
    FP DB 13, 10, "+++++++++|   |+++++++++++++++++/  /+++++\  \+++++++|   |++++++++++|   |++++++++$"
    FQ DB 13, 10, "+++++++++|   %---------|++++++/  /+++++++\  \++++++|   %---------%    |++++++++$"
    FR DB 13, 10, "+++++++++|             |+++++/  /+++++++++\  \+++++|                  )++++++++$"
    FX DB 13, 10, "+++++++++|             |++++/  /+++++++++++\  \++++|                 /+++++++++$"
    FT DB 13, 10, "+++++++++%-------------%+++%--%+++++++++++++%--%+++%----------------%++++++++++$"
    FU DB 13, 10, "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$"
    FV DB 13, 10, "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++$"
    
    msg1 DB 13, 10, "Welcome to CiPhErCrAfT Encryptor & Decryptor.$"
    msg2 DB 13, 10, "Please Enter Your Password Length(1-9): $" 
    msg3 DB 13, 10, "Enter Password: $"
    msg4 DB 13, 10, "Select Algorithm: $"
    msg5 DB 13, 10, "Available Algorithms :$"
    msg6 DB 13, 10, "Programme Ends.$" 
    msg7 DB 13, 10, "Encrypted Password: $"
    msg8 DB 13, 10, "Decrypted Password: $"
    msg9 DB 13, 10, "Invalid Input.$"
    option1 DB 13, 10, "    1. XOR Cipher$"
    option2 DB 13, 10, "    2. Ceaser Cipher$"
    option3 DB 13, 10, "    3. Hashing Cipher$"
    option4 DB 13, 10, "    4. Rotation Cipher$"
    option5 DB 13, 10, "    5. Press 5 to Run All 4 Algorithms.$" 
    
    
    passwordVault DB 10 DUP(0)
    helperVault DB 10 DUP(0)
    blackBox DB 10 DUP(0)
    length DB '?'
    selection DB '?'


.code
    MAIN PROC
        MOV AX, @data
        MOV DS, AX
        
        ; Displayes a Fancy Looking Display.
        LEA DX, FA
        MOV AH, 9
        INT 21H
        
        LEA DX, FB
        MOV AH, 9
        INT 21H
        
        LEA DX, FC
        MOV AH, 9
        INT 21H
        
        LEA DX, FD
        MOV AH, 9
        INT 21H
        
        LEA DX, FE
        MOV AH, 9
        INT 21H
        
        LEA DX, FF
        MOV AH, 9
        INT 21H
        
        LEA DX, FG
        MOV AH, 9
        INT 21H
        
        LEA DX, FH
        MOV AH, 9
        INT 21H
        
        LEA DX, FI
        MOV AH, 9
        INT 21H
        
        LEA DX, FJ
        MOV AH, 9
        INT 21H
        
        LEA DX, FK
        MOV AH, 9
        INT 21H
        
        LEA DX, FL
        MOV AH, 9
        INT 21H
        
        LEA DX, FM
        MOV AH, 9
        INT 21H
        
        LEA DX, FN
        MOV AH, 9
        INT 21H
        
        LEA DX, FO
        MOV AH, 9
        INT 21H
        
        LEA DX, FP
        MOV AH, 9
        INT 21H
        
        LEA DX, FQ
        MOV AH, 9
        INT 21H
        
        LEA DX, FR
        MOV AH, 9
        INT 21H
        
        LEA DX, FX
        MOV AH, 9
        INT 21H
        
        LEA DX, FT
        MOV AH, 9
        INT 21H
        
        LEA DX, FU
        MOV AH, 9
        INT 21H
        
        LEA DX, FV
        MOV AH, 9
        INT 21H
        
        ; Main Encryption & Decryption Part.
        LEA DX, msg1
        MOV AH, 9
        INT 21H
        
        LEA DX, msg2
        MOV AH, 9
        INT 21H
        
        ; Takes the Length of Password as Input.
        MOV AH, 1
        INT 21H
        SUB AL, 30H
        MOV length, AL
        
        ; Check's if the given Input is between 1-9 or Not.
        CMP AL, 1
        JL invalid
        
        CMP AL, 9
        JG invalid
        
        LEA DX, msg3
        MOV AH, 9
        INT 21H
        
        ; This Section of the Code take password as Input and stores in PasswordVault array.
        MOV CH, 0
        MOV CL, length
        MOV SI, 0
        storePassword:
            MOV AH, 1
            INT 21H
            MOV passwordVault[SI], AL
            
            ;MOV DL, passwordVault[SI]
            ;MOV AH, 2
            ;INT 21H
            
            INC SI
        LOOP storePassword
        
        ; This Section Does Prints Available Algorithms.
        LEA DX, msg5
        MOV AH, 9
        INT 21H
        
        LEA DX, option1
        MOV AH, 9
        INT 21H
        
        LEA DX, option2
        MOV AH, 9
        INT 21H
        
        LEA DX, option3
        MOV AH, 9
        INT 21H
        
        LEA DX, option4
        MOV AH, 9
        INT 21H
        
        LEA DX, option5
        MOV AH, 9
        INT 21H
       
        LEA DX, msg4
        MOV AH, 9
        INT 21H
        
        MOV AH, 1
        INT 21H
        MOV selection, AL
        
        CMP selection, '1'
        JE Algorithm01
        
        CMP selection, '2'
        JE Algorithm02
        
        CMP selection, '3'
        JE Algorithm03
        
        CMP selection, '4'
        JE Algorithm04
        
        CMP selection, '5'
        JE Algorithm01
        
        JMP invalid
        
        ; XOR Cipher.
        Algorithm01:
            LEA DX, option1
            MOV AH, 9
            INT 21H
            
            ; Encryption is Done in this section of Code.
            MOV CH, 0
            MOV CL, length
            MOV SI, 0
            encryptXor:
                MOV AL, passwordVault[SI]
                XOR AL, length
                MOV blackBox[SI], AL
                INC SI
            LOOP encryptXor
            
            LEA DX, msg7
            MOV AH, 9
            INT 21H
            
            ; This section Print's the Encrypted Password.
            MOV CH, 0
            MOV CL, length
            MOV SI, 0
            printXor:
                MOV DL, BlackBox[SI]
                MOV AH, 2
                INT 21H
                INC SI
            LOOP printXor
            
            
            LEA DX, msg8
            MOV AH, 9
            INT 21H
            
            ; Decryption is Done in this section of Code.
            MOV CH, 0
            MOV CL, length
            MOV SI, 0
            decryptXor:
                MOV DL, blackBox[SI]
                XOR DL, length
                MOV AH, 2
                INT 21H
                INC SI
            LOOP decryptXor
            
            CMP selection, '5'
            JE Algorithm02              
            
            JMP end 
            
        ; Ceaser Cipher.
        Algorithm02:
            LEA DX, option2
            MOV AH, 9
            INT 21H
            
            ; This Loop reverses the given password.
            MOV CH, 0
            MOV CL, length
            MOV SI, 0
            reverse:
                MOV AH, 0
                MOV AL, passwordVault[SI]
                PUSH AX
                INC SI
            LOOP reverse
            
            ; Ceaser Encryption is performed in this section of code by dividing the character.
            MOV CH, 0
            MOV CL, length
            MOV SI, 0
            encryptCeaser:
                POP BX
                MOV AX, BX
                MOV BL, 5
                DIV BL
                SUB AL, 45H
                MOV helperVault[SI], AH
                MOV blackBox[SI], AL
                INC SI
            LOOP encryptCeaser
            
            LEA DX, msg7
            MOV AH, 9
            INT 21H
            
            ; This section of code Prints the Encrypted Password.
            MOV CH, 0
            MOV CL, length
            MOV SI, 0
            printCeaser:
                MOV DL, blackBox[SI]
                MOV AH, 2
                INT 21H
                INC SI
            LOOP printCeaser 
            
            
            LEA DX, msg8
            MOV AH, 9
            INT 21H
            
            ; This section of code Decrypt's the Encrypted Password.
            MOV CH, 0
            MOV CL, length
            MOV SI, 0
            decryptCeaser:
                MOV BL, 5
                MOV AH, 0
                MOV AL, blackBox[SI]
                ADD AL, 45H
                MUL BL
                ADD AL, helperVault[SI]
                PUSH AX
                INC SI
            LOOP decryptCeaser
            
            ; This section of code Prints the Decrypted Password.
            MOV CH, 0
            MOV CL, length
            printDecryptedCeaser:
                POP BX
                MOV DX, BX
                MOV AH, 2
                INT 21H
            LOOP printDecryptedCeaser
            
            CMP selection, '5'
            JE Algorithm03
            
            JMP end
        
        Algorithm03:
            LEA DX, option3
            MOV AH, 9
            INT 21H
            
            CMP selection, '5'
            JE Algorithm04
            
            JMP end
        
        Algorithm04:
            LEA DX, option4
            MOV AH, 9
            INT 21H
            JMP end
        
        
        end:
            LEA DX, msg6
            MOV AH, 9
            INT 21H
            JMP nothing
            
        invalid:
            LEA DX, msg9
            MOV AH, 9
            INT 21H
            
        nothing:
            MOV DL, ' '
            MOV AH, 2
            INT 21H
        
        
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN