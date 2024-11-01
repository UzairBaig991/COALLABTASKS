;program to display and add the numbers
.model small
.stack 100h
.data
A DB 2
B DB 6
C DB 1
msg DB " The result after adding three numbers are =$"

.code
   main proc
    
    mov ax,@data
    mov ds,ax
    
    lea ax,msg
    mov ah,9
    int 21h
    
    mov al,A
    add al,B
    add al,C
    
    mov dl,al
    add al,48
    mov dl,al
    
    
    mov ah,2
    int 21h 
    
    mov ah,4ch
    int 21h
       
   main endp
end main   