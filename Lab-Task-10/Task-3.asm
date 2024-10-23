.model small
.stack 100h
.data
var1 db 5
arr db  4, 1, 3, 5, 6, 7    ; array of numbers

.code
; Macro to display a number from the array
DisplayNumber macro index
    lea si, arr
    mov dx, [si + index] ; Get value at arr[index]
    add dl, 48            ; Convert to ASCII
    mov ah, 02h
    int 21h
endm

main proc
    mov ax, @data
    mov ds, ax

    ; Display each element of the array using the macro
    DisplayNumber 0
    DisplayNumber 1
    DisplayNumber 2
    DisplayNumber 3
    DisplayNumber 4
    DisplayNumber 5

    ; Exit program
    mov ax, 4C00h
    int 21h
main endp
end main
