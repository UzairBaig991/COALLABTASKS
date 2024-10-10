;program to create first 6 digits of fibonacci series using stack

.model small
.stack 100h
.data
    msg db 'Fibonacci Series: $'
.code
    main proc
        mov ax, @data
        mov ds, ax

        lea dx, msg
        mov ah, 9
        int 21h
        
        mov ax, 0  
        mov bx, 1  

        push ax     
        push bx          
        
        mov cx, 4  

    fib_loop: 

        pop dx      ; Pop F(n-1) 
        pop ax      ; Pop F(n-2) 
        
        add ax, dx  ; F(n) = F(n-1) + F(n-2) 
        push dx     ; Push F(n-1) back
        push ax     ; Push F(n)
        loop fib_loop

   
        mov ah, 4Ch
        int 21h

    main endp
end main


