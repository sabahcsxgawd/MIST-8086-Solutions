.model small
.stack 100h

.data

myName dw 100 dup(?); here i am guessing the name length is not more than 100 characters

.code

main proc

mov ax, @data
mov ds, ax

lea si, myName


input:
    mov ah, 01h
    int 21h
    cmp al, 41h
    JL display
    cmp al, 5ah
    JG display
    cmp al, 5ah
    jne increase  
    
insert: 
    add al, 20h
    mov [si], al
    inc si
    jmp input
       
increase:
    inc al
    jmp insert
    
display:
    mov [si], '$'
    mov dl, 0dh
    mov ah, 02h
    int 21h
    mov dl, 0ah
    mov ah, 02h
    int 21h 
    lea dx, myName
    mov ah, 09h
    int 21h
    mov ah, 4ch
    int 21h


main endp


end main