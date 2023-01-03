.model small
.stack 100h

.data

.code

main proc

check:
    ;mov ax, 0 use this to test ax values
    cmp ax, 0h
    JL condition1
    cmp ax, 0h
    JG condition2
    mov bx, 10d
    jmp last
    
condition1:
    mov cx, 10d
    jmp last
    
condition2:
    mov dx, 10d    
    
last:
    mov ah, 4ch
    int 21h   

main endp


end main