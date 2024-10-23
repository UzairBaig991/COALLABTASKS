.model small
.stack 100h
.data
original db "My name is Uzair Baig.$"
msg1 db "Original String: $", 0Dh, 0Ah, 0
msg2 db "Reversed String: $", 0Dh, 0Ah, 0
newline db 0Dh, 0Ah, '$'

.code
; Macro to display a message
DisplayMessage macro message
    mov ah, 09h
    lea dx, message
    int 21h
endm

; Macro to display a string
DisplayString macro
    mov ah, 09h
    int 21h
endm

; Macro to print a character
PrintChar macro char
    mov dl, char
    mov ah, 02h
    int 21h
endm

main proc
    mov ax, @data
    mov ds, ax

    DisplayMessage msg1

    lea dx, original
    DisplayString

    lea dx, newline
    int 21h

    call reverseString

    lea dx, newline
    int 21h

    mov ah, 4Ch
    int 21h
main endp

reverseString proc
    DisplayMessage msg2
    
    lea si, original
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
    PrintChar al
    loop reverse_stack
    ret
reverseString endp

end main
