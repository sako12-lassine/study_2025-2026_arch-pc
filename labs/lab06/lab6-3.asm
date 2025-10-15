; ---
; Программа вычисления выражения
; ---

%include 'in_out.asm'

SECTION .data
div: DB 'Результат: ',0
rem: DB 'Остаток от деления: ',0

SECTION .text
GLOBAL _start
_start:

; --- Вычисление выражения
mov eax,4      ; EAX=4  (вместо 5)
mov ebx,6      ; EBX=6  (вместо 2)
mul ebx        ; EAX=4×6 = 24
add eax,2      ; EAX=24+2 = 26  (вместо +3)
xor edx,edx    ; обнуляем EDX
mov ebx,5      ; EBX=5  (вместо 3)
div ebx        ; EAX=26/5 = 5, EDX=остаток 1

mov edi,eax    ; запись результата вычисления в 'edi'

; --- Вывод результата на экран

mov eax,div    ; вызов подпрограммы печати
call sprint    ; сообщения 'Результат: '
mov eax,edi    ; вызов подпрограммы печати значения
call iprintLF  ; из 'edi' в виде символов

mov eax,rem    ; вызов подпрограммы печати
call sprint    ; сообщения 'Остаток от деления: '
mov eax,edx    ; вызов подпрограммы печати значения
call iprintLF  ; из 'edx' (остаток) в виде символов

call quit      ; вызов подпрограммы завершения
