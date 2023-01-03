.model small
.stack 100h

.data

lastString db 'Best of Luck! This is your lucky number.', '$'

.code

main proc

mov ax, @data
mov ds, ax

lea dx, lastString

;mov cx, 1011001110000110b test cx by giving initial values
xor cx, 0fe00h

mov ah, 09h
int 21h

mov ah, 4ch
int 21h   

main endp


end main