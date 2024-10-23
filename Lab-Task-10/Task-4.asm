.model small
.stack 100h
.data
    array DB 5, 1, 7, 2, 9  
    largest DB 0             
    output DB 'Largest number is: $' 
    newline DB 0Dh, 0Ah, '$'   

.code
; Macro to find the largest number in the array
FindLargest macro
    lea si, array     
    mov cx, 5         
    mov largest, 0

    find_largest:
        mov al, [si]      
        cmp al, largest    
        jle skip_update   
        mov largest, al    
    skip_update:
        inc si             
        loop find_largest  
endm

; Macro to display the result
DisplayResult macro
    mov ah, 09h
    lea dx, output
    int 21h
    
    mov al, largest
    mov ah, 0           

    cmp al, 10
    jl  print_single_digit

    mov bl, 10          
    div bl              
    add al, '0'         
    mov dl, al
    mov ah, 02h
    int 21h             
    
    mov al, ah          
    add al, '0'         
    mov dl, al
    mov ah, 02h
    int 21h
    jmp print_newline

  print_single_digit:
    add al, '0'         
    mov dl, al
    mov ah, 02h
    int 21h

  print_newline:
    mov ah, 09h
    lea dx, newline
    int 21h
endm

main proc
    mov ax, @data
    mov ds, ax

    FindLargest
    DisplayResult

    mov ah, 4Ch
    int 21h
main endp
end main
