.model small
.stack 100h
.data
    var db 'Hello$', 0Dh, 0Ah
    var2 db 'World$', 0Dh, 0Ah
.code

display macro msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm

nextline proc
    mov ah, 2
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h
    ret
endp

main proc
    mov ax, @data
    mov ds, ax

    display var
    call nextline
    display var2
    
    mov ah, 4Ch
    int 21h
main endp

end main
