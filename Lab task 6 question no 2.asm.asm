;use of for loop in assembly language
.model small
.stack 100h
.data 
newline db 0x0D,0x0A,'$'

msg db "The number from 1 to 9 are = $" 
msg1 db "The alphabets from A-Z are = $"
.code
     main proc 
        
     mov ax,@data
     mov ds,ax
     
     lea dx,msg
     mov ah,9
     int 21h 
     
       
     mov dl,'0'
     mov cx,10       ;no of iteration of loop
     LABEL:
          mov ah,2
          int 21h
     
          inc dl
     loop LABEL
    
     
     
     
     lea dx,newline
     mov ah,9
     int 21h
     
    
     lea dx,msg1
     mov ah,9
     int 21h
     
     
     mov dl,'A'
     mov cx,26     ;no of iteration of loop
     ALPHABETS:    
          mov ah,2
          int 21h
     
          inc dl
     loop ALPHABETS
      
     mov ah,4ch
     int 21h
    
     main endp
end main

