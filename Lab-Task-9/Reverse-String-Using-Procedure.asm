.model small
.stack 100h
.data
original db "My name is Uzair Baig.$", 0    ; String to be reversed
msg1 db "Original String: $", 0Dh, 0Ah, 0   ; Message with newline after original string
msg2 db "Reversed String: $", 0Dh, 0Ah, 0   ; Message with newline before reversed string
newline db 0Dh, 0Ah, '$'

.code
main proc
    ; Initialize DS
    mov ax, @data
    mov ds, ax

    ; Display Original String
    call displayMessage

    ; Display Original String
    mov dx, offset original
    call displayString

    ; Display newline after the original string
    lea dx, [newline]
    int 21h

    ; Reverse String
    call reverseString

    ; Display newline after reversed string
    lea dx, [newline]
    int 21h

    ; End Program
    mov ah, 4Ch              
    int 21h
main endp

; Procedure to display a message
displayMessage proc
    mov ah, 09h
    lea dx, [msg1]
    int 21h
    ret
displayMessage endp

; Procedure to display a string
displayString proc
    ; DX should contain the address of the string to be displayed
    mov ah, 09h
    int 21h
    ret
displayString endp

; Procedure to reverse the string and print it
reverseString proc
    ; Display Reversed String message
    mov ah, 09h
    lea dx, [msg2]
    int 21h
    
    ; Prepare to reverse the string
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
    ; Now print the reversed string
reverse_stack:
    pop ax
    mov dl, al
    mov ah, 02h
    int 21h
    loop reverse_stack
    ret
reverseString endp

end main
