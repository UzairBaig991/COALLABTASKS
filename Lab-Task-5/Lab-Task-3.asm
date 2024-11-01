;program to swap the two values in variables
.model small        
.stack 100h    ;used for partition of reserve memory        
.data
    variable1 DB 23        
    variable2 DB 65      

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov al,variable1
    mov bl,variable2
    mov variable1,bl
    mov variable2,al       

    mov ah, 4Ch        
    int 21h            
main endp

end main
