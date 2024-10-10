;program to push and pop 5 integers and delete them

.model small
.stack 100h
.data
.code
    main proc  
        
    mov ax, '1'
    mov bx, '2'
    mov cx, '3'
    mov dx, '4' 
    mov ax, '5'
    
    push ax
    push bx
    push cx
    push dx 
    push ax
      
    mov BP, SP
    
    pop ax
    pop bx
    pop cx
    pop dx 
    pop ax
    
    mov [BP],dx
    mov [BP+2], 0 
      
    xor BP, BP
        
        
    main endp
end main