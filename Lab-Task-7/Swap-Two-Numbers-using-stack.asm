.model small
.stack 100h

.data
    Var1 DB 8      
    Var2 DB 7        

.code
  main proc
    mov ax, @data
    mov ds, ax

    mov al, Var1
    push ax           

    mov al, Var2
    push ax          
    pop ax           
    mov Var1, al    

    pop ax         
    mov Var2, al      
    mov ah, 4Ch
    int 21h

  main endp
end main