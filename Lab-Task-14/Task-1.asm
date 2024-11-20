.386
.model flat, stdcall
.stack 4096

include Irvine32.inc

.data
    original db "My name is Uzair Baig.$", 0
    msg1 db "Original String: ", 0
    msg2 db "Reversed String: ", 0
    reversed db 100 dup(0)

.bss
    length resd 1

.code
main proc
    mov edx, OFFSET msg1
    call WriteString

    mov edx, OFFSET original
    call WriteString

    call Crlf

    lea esi, original
    xor ecx, ecx

count_loop:
    mov al, byte ptr [esi]
    cmp al, '$'
    je done_counting
    inc esi
    inc ecx
    jmp count_loop

done_counting:
    mov length, ecx

    lea esi, original
    add esi, ecx
    dec esi
    lea edi, reversed

    mov ecx, length

reverse_loop:
    movzx eax, byte ptr [esi]
    shl eax, 0
    mov byte ptr [edi], al
    inc edi
    dec esi
    loopnz reverse_loop

    mov byte ptr [edi], '$'

    mov edx, OFFSET msg2
    call WriteString

    mov edx, OFFSET reversed
    call WriteString

    call Crlf

    call ExitProcess

main endp
end main
