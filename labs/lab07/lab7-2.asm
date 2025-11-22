%include 'in_out.asm'

section .data
msg1 db 'Введите B: ',0h
msg2 db "Наибольшее число: ",0h
A dd '20'
C dd '50'

section .bss
max resb 10
B resb 10

section .text
global _start
_start:
    ; --- Вывод сообщения 'Введите В: '
    mov eax,msg1
    call sprint
    
    ; --- Ввод 'В'
    mov ecx,B
    mov edx,10
    call sread
    
    ; --- Преобразование 'В' из символа в число
    mov eax,B
    call atoi
    mov [B],eax
    
    ; --- Записываем 'А' в переменную 'max'
    mov ecx,[A]
    mov [max],ecx
    
    ; --- Сравниваем 'А' и 'С'
    cmp ecx,[C]
    jg check_B
    mov ecx,[C]
    mov [max],ecx
    
    ; --- Преобразование 'max(A,C)' из символа в число
check_B:
    mov eax,max
    call atoi
    mov [max],eax
    
    ; --- Сравниваем 'max(A,C)' и 'В'
    mov ecx,[max]
    cmp ecx,[B]
    jg fin
    mov ecx,[B]
    mov [max],ecx
    
    ; --- Вывод результата
fin:
    mov eax, msg2
    call sprint
    mov eax,[max]
    call iprintLF
    call quit
