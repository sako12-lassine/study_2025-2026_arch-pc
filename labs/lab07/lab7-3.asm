%include 'in_out.asm'

section .data
msg1 db 'Введите B: ',0h
msg2 db "Наименьшее число: ",0h
A dd '20'
C dd '50'

section .bss
min resb 10
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
    
    ; --- Записываем 'А' в переменную 'min'
    mov ecx,[A]
    mov [min],ecx
    
    ; --- Сравниваем 'А' и 'С' (ищем minimum)
    cmp ecx,[C]
    jl check_B      ; Если A < C, aller à check_B
    mov ecx,[C]     ; Sinon, mettre C dans min
    mov [min],ecx
    
    ; --- Преобразование 'min(A,C)' из символа в число
check_B:
    mov eax,min
    call atoi
    mov [min],eax
    
    ; --- Сравниваем 'min(A,C)' и 'В' (ищем minimum)
    mov ecx,[min]
    cmp ecx,[B]
    jl fin          ; Si min(A,C) < B, aller à fin
    mov ecx,[B]     ; Sinon, mettre B dans min
    mov [min],ecx
    
    ; --- Вывод результата
fin:
    mov eax, msg2
    call sprint
    mov eax,[min]
    call iprintLF
    call quit
