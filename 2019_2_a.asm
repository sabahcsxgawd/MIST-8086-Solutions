.model small
.stack 100h

.data  

arr db 10h, 44h, 22h, '$'

len dw 0

oddMP dw ?

evenMP1 dw ?

evenMP2 dw ?

median db ?

noMedianString db 'Array Length Less Than 1 so No Median', '$'

.code

main proc

mov ax, @data
mov ds, ax
mov ss, ax 

xor ax, ax

lea si, arr

    
countLen:
    cmp [si], '$'
    je lenTest
    inc si
    inc len
    jmp countLen

    
lenTest:
    test len, 1
    jz even
    inc len
    shr len, 1
    mov cx, len
    mov oddMP, cx
    xor cx, cx
    shl len, 1
    dec len
    jmp sortInit
    
    
even:
    shr len, 1
    mov cx, len
    mov evenMP1, cx
    inc cx
    mov evenMP2, cx
    xor cx, cx
    shl len, 1
    
    
sortInit:
    mov bx, 0
    lea si, arr
    mov cx, len
    dec cx
         
         
sortL1:
    cmp bx, cx
    jnl setMedian
    mov bp, bx
    inc bp
    jmp sortL2
    
    
sortL2:
    cmp bp, len
    jnl incBX  
    mov dh, [si + bp]
    cmp [si + bx], dh
    jg swap
    inc bp
    jmp sortL2
    
    
swap:
    mov dl, [si + bx]
    mov [si + bx], dh
    mov [si + bp], dl
    inc bp
    xor dx, dx
    jmp sortL2
    
    
incBX:
    inc bx
    jmp sortL1
      
    
setMedian:
    cmp len, 0
    je noMedian
    test len, 1
    jz evenMed
    mov bx, oddMP
    dec bx
    mov dl, [si + bx]
    mov median, dl
    jmp last
    
    
noMedian:
    lea dx, noMedianString
    mov ah, 09h
    int 21h
    jmp last

    
evenMed:
    mov bx, evenMP1
    mov bp, evenMP2
    dec bx
    dec bp
    mov dl, [si + bx]
    add dl, [si + bp]
    shr dl, 1
    mov median, dl    
    
    
last:
    mov ah, 4ch
    int 21h
    ; median variable contains the median value                

main endp


end main