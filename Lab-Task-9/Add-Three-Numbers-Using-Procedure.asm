.model small
.stack 100h
.data
A DB 2          ; first number
B DB 6          ; second number
C DB 1          ; third number
msg1 DB "The sum of the three digits is: $"
msg2 DB '2', '+', '6', '+', '1', ' '   
msg3 DB 0Dh,0Ah,"Answer: $"                   

.code
   main proc
    mov ax, @data        ; Initialize data segment
    mov ds, ax
    
    call displaySum      ; Call procedure to display the sum
    
    call displayAnswer   ; Call procedure to display the answer
    
    mov ah, 4Ch          ; Exit program
    int 21h
   main endp

; Procedure to display the sum of the three digits
displaySum proc
    lea dx, msg1         ; Load and print "The sum of the three digits is: "
    mov ah, 9
    int 21h
    
    lea dx, msg2         
    mov ah, 9
    int 21h
    
    mov al, A            ; Load first number into AL
    add al, B            ; Add second number to AL
    add al, C            ; Add third number to AL
    
    add al, 30h          ; Convert result to ASCII by adding 30h
    mov dl, al           ; Store result in DL
    
    mov ah, 2            ; Display result (sum)
    int 21h              ; Print the sum
    ret
displaySum endp

; Procedure to display the answer
displayAnswer proc
    lea dx, msg3         ; Print "Answer: "
    mov ah, 9
    int 21h
    
    mov dl, al           ; Prepare to print the same result
    mov ah, 2
    int 21h              ; Print the sum again next to "Answer: "
    ret
displayAnswer endp

end main
