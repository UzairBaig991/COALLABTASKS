;program to display the character on the screen
.model small
.stack 100h
.data
.code
     main proc
        mov bl,1
        mov dl,bl
        add dl,48;dl=51
        
        ;service routine for output
        mov ah,2   ;for output
        int 21h 
        
        mov bl,'@'
        mov dl,bl
        
        mov ah,2
        int 21h 
        
        mov bl,'a'
        mov dl,bl
        
        mov ah,2
        int 21h
        
     main endp
end main     