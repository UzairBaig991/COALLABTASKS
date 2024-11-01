;program to solve the problem 3+5-2-1+3
.model small
.stack 100h
.data

msg DB "The result of 3+5-2-1+3 = $" 
.code
   main proc 
    
        mov ax,@data
        mov ds,ax
        ;the above two lines are used to intialize the data segment register(DS)
        
        lea dx,msg   ;it is for display the string 
        mov ah,9
        int 21h
            
        ;3+5-2-1+3=8
        
        mov bl,3
        add bl,5
        sub bl,2
        sub bl,1
        add bl,3
        
        mov dl,bl
        add bl,48
        mov dl,bl
        
            
        mov ah,2    
        int 21h
        
   main endp
end main   