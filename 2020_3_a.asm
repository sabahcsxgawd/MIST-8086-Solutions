.model small
.stack 100h

.data

.code

main proc

mov dx, 55d; we will move our exam roll number to dx
test dx, 1
JNZ odd
jmp initiate

odd:
    inc dx

initiate:
    mov cx, 4d
    cmp cx, dx
    JG less
    mov bx, 4d
    jmp sum
    
less:
    mov bx, 0
    jmp finish    
    
sum:          
   add cx, 2d
   cmp cx, dx
   jg finish
   add bx, cx
   jmp sum

finish:    
    ; result of sum is in bx
    mov ah, 4ch
    int 21h
    
    
main endp


end main