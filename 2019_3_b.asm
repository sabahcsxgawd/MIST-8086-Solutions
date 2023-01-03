.model small
.stack 100h

.data

.code

main proc

;mov bx, 2h
test bx, 1
jz even
mov ax, 1
jmp last

even:
    mov ax, 0
    
last:
    mov ah, 4ch
    int 21h    

main endp


end main