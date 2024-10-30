.model small
.stack 100h
.data
    msg_options db "You can perform the following operations:", 0Dh, 0Ah, '$'
    menu_option1 db "1. Addition", 0Dh, 0Ah, '$'
    menu_option2 db "2. Subtraction", 0Dh, 0Ah, '$'
    menu_option3 db "3. Division", 0Dh, 0Ah, '$'
    msg_menu db "Please select an operation by number.", 0Dh, 0Ah, '$'
    prompt1 db 0Dh, 0Ah, "Enter number 1: $"
    prompt2 db 0Dh, 0Ah, "Enter number 2: $"
    add_msg db 0Dh, 0Ah, "The sum of the numbers is: $"
    sub_msg db 0Dh, 0Ah, "The subtraction of the two numbers is: $"
    div_msg db 0Dh, 0Ah, "The division of the two numbers is: $"
    num1 db ?
    num2 db ?
    result db ?

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Call display_menu procedure
    call display_menu

    ; Read user's menu choice
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bl, al

    ; Prompt for the first number
    mov ah, 09h
    lea dx, prompt1
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov num1, al

    ; Prompt for the second number
    mov ah, 09h
    lea dx, prompt2
    int 21h

    mov ah, 01h
    int 21h
    sub al, '0'
    mov num2, al

    ; Load the numbers into registers for operations
    mov al, num1
    mov cl, num2

    ; Choose operation based on user's choice
    cmp bl, 1
    je addition
    cmp bl, 2
    je subtraction
    cmp bl, 3
    je division
    jmp exit

addition:
    add al, cl
    mov result, al
    lea dx, add_msg
    jmp display_result

subtraction:
    sub al, cl
    mov result, al
    lea dx, sub_msg
    jmp display_result

division:
    xor ah, ah
    div cl
    mov result, al
    lea dx, div_msg
    jmp display_result

display_result:
    mov ah, 09h
    int 21h

    mov al, result
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

exit:
    mov ah, 4Ch
    int 21h
main endp

; New procedure to display the menu
display_menu proc
    mov ah, 09h
    lea dx, msg_options
    int 21h
    lea dx, menu_option1
    int 21h
    lea dx, menu_option2
    int 21h
    lea dx, menu_option3
    int 21h
    lea dx, msg_menu
    int 21h
    ret
display_menu endp
end main
