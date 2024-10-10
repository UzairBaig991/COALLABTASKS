;arrays in the assembly language
.model small
.stack 100h
.data

var1 db 5
arr db 4,1,3,5,6,7     ;array of numbers
arr2 db 'a','b','c','d'      ;array of characters

.code
     main proc
      mov ax,@data      ;get reference of data
      mov ds,ax  
        
      lea Si,arr       ;offset is also used instead of lea   
      mov dx, [Si]     ;get value at address Si , for user input we write code mov [Si],dx       
      add dl,48  
      mov ah,2
      int 21h 
      
      inc Si       ;add Si,i increment i++....for decrement Dec
     
      mov dx, [Si]     ;get value at address Si        
      add dl,48  
      mov ah,2
      int 21h   
      
      inc Si       ;add Si,i increment i++....for decrement Dec
     
      mov dx, [Si]     ;get value at address Si        
      add dl,48  
      mov ah,2
      int 21h 
      
      inc Si       ;add Si,i increment i++....for decrement Dec
     
      mov dx, [Si]     ;get value at address Si        
      add dl,48  
      mov ah,2
      int 21h 
      
      inc Si       ;add Si,i increment i++....for decrement Dec
     
      mov dx, [Si]     ;get value at address Si        
      add dl,48  
      mov ah,2
      int 21h 
      
      inc Si       ;add Si,i increment i++....for decrement Dec
     
      mov dx, [Si]     ;get value at address Si        
      add dl,48  
      mov ah,2
      int 21h 
        
;Di   ;destination index        
;Si   ;Source index        
        
        
     main endp   
end main




