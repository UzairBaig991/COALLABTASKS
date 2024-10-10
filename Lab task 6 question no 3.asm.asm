;program to display the sum of the array
.model small
.stack 100h
.data
    numbers dw 4,1,15,20
    msg db 'The Sum of the Array is = $'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    lea dx, msg
    int 21h

    mov ax, 0
    lea si, numbers
    mov cx, 4

sum_loop:
    add ax, [si]
    add si, 2
    loop sum_loop

    call PrintNumber

    mov ah, 4Ch
    int 21h
main endp

PrintNumber proc
    mov bx, 10

    xor cx, cx

convert_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz convert_loop

print_digits:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_digits
    ret
PrintNumber endp

end main
