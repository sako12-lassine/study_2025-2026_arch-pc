%include 'in_out.asm'

section .data
msg_x db 'Введите x: ',0h
msg_a db 'Введите a: ',0h
msg_result db 'Результат f(x): ',0h

section .bss
x resb 10
a resb 10
result resb 10

section .text
global _start
_start:
    ; --- Ввод x
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    mov eax, x
    call atoi
    mov [x], eax

    ; --- Ввод a
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 10
    call sread
    mov eax, a
    call atoi
    mov [a], eax

    ; --- Вычисление f(x)
    mov ebx, [x]
    mov ecx, [a]
    
    ; Сравниваем x и a
    cmp ebx, ecx
    jge else_branch    ; если x >= a, переходим к ветке else

    ; --- Ветка if: f(x) = 2a - x
    mov eax, ecx       ; eax = a
    mov edx, 2         ; edx = 2
    imul eax, edx      ; eax = 2a
    sub eax, ebx       ; eax = 2a - x
    jmp output

else_branch:
    ; --- Ветка else: f(x) = 8
    mov eax, 8

output:
    mov [result], eax
    
    ; --- Вывод результата
    mov eax, msg_result
    call sprint
    mov eax, [result]
    call iprintLF
    
    call quit

