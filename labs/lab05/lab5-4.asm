%include 'in_out.asm'

SECTION .data
    msg: DB 'Введите строку: ',0h
    res: DB 'Вы ввели: ',0h

SECTION .bss
    buf1: RESB 80

SECTION .text
    GLOBAL _start

_start:
    ; Вывод приглашения
    mov eax, msg
    call sprintLF
    
    ; Ввод строки
    mov ecx, buf1
    mov edx, 80
    call sread
    
    ; Вывод результата
    mov eax, res
    call sprint
    
    ; Вывод введенной строки
    mov eax, buf1
    call sprintLF
    
    ; Завершение
    call quit
