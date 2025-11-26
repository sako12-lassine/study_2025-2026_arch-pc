SECTION .data
    newline: db 0xA

SECTION .text
    global _start

_start:
    ; Получаем количество аргументов
    pop eax         ; argc

    ; Пропускаем имя программы
    pop ebx         ; argv[0]

print_args:
    ; Печатаем аргумент
    pop ebx         ; следующий аргумент
    test ebx, ebx
    jz exit

    ; Вычисляем длину строки
    mov ecx, ebx
    call strlen

    ; Вывод аргумента
    mov edx, eax    ; длина
    mov eax, 4      ; sys_write
    mov ebx, 1      ; stdout
    int 0x80

    ; Вывод новой строки
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    jmp print_args

exit:
    mov eax, 1      ; sys_exit
    mov ebx, 0      ; код выхода
    int 0x80

; Функция вычисления длины строки
; Вход: ecx = адрес строки
; Выход: eax = длина
strlen:
    push ecx
    mov eax, 0
.count_loop:
    cmp byte [ecx], 0
    je .done
    inc ecx
    inc eax
    jmp .count_loop
.done:
    pop ecx
    ret
