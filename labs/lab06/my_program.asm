; ---
; Программа для вычисления f(x) = 10(x + 1) - 10
; Вариант 11
; ---

%include 'in_out.asm'

SECTION .data
msg1: DB 'Вычисление f(x) = 10(x + 1) - 10',0
msg2: DB 'Введите значение x: ',0
msg3: DB 'Результат: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:

; --- Вывод выражения
mov eax, msg1
call sprintLF

; --- Запрос значения x
mov eax, msg2
call sprint

; --- Чтение x
mov ecx, x
mov edx, 80
call sread

; --- Преобразование x в число
mov eax, x
call atoi

; --- Вычисление f(x) = 10(x + 1) - 10

; Шаг 1: x + 1
mov ebx, eax    ; сохранение x в ebx
add eax, 1      ; eax = x + 1

; Шаг 2: 10 × (x + 1)
mov ecx, 10     ; ecx = 10
mul ecx         ; eax = 10 × (x + 1)

; Шаг 3: 10(x + 1) - 10
sub eax, 10     ; eax = 10(x + 1) - 10

; --- Сохранение результата
mov edi, eax    ; сохранение в edi

; --- Вывод результата
mov eax, msg3
call sprint
mov eax, edi
call iprintLF

call quit
