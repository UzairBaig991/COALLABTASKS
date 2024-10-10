.model small
.stack 100h
.data
original db "My name is Uzair Baig.$", 0    ; String to be reversed
msg1 db "Original String: $", 0Dh, 0Ah, 0   ; Message with newline after original string
msg2 db "Reversed String: $", 0Dh, 0Ah, 0   ; Message with newline before reversed string
newline db 0Dh, 0Ah, '$'
reversed db 100 dup('$')                     ; Variable to store the reversed string
                 
.code
  main proc
    ; Initialize DS
    mov ax, @data
    mov ds, ax

    ; Display Original String
    mov ah, 09h              
    lea dx, [msg1]           
    int 21h

    lea dx, [original]        
    int 21h                  

    ; Display newline after the original string
    lea dx, [newline]
    int 21h

    ; Reverse String using stack
    lea si, [original]        
    mov cx, 0                 

  count_loop:
    mov al, [si]             
    cmp al, "$"              
    je done_counting         
    push ax                  
    inc si                   
    inc cx                   
    jmp count_loop           

  done_counting:
    ; Pop characters from the stack and store in 'reversed'
    lea di, [reversed]       

  reverse_stack:
    pop ax                  
    mov [di], al             
    inc di                  
    loop reverse_stack       

    ; Terminate reversed string with '$'
    mov byte ptr [di], '$'   

    ; Display Reversed String
    mov ah, 09h             
    lea dx, [msg2]          
    int 21h

    lea dx, [reversed]       
    int 21h                 

    ; Display newline after reversed string
    lea dx, [newline]
    int 21h

    ; End Program
    mov ah, 4Ch             
    int 21h

  main endp
end main
