%include 'in_out.asm'

SECTION .data
filename db 'name.txt', 0
msg1 db 'Как Вас зовут? ', 0
msg2 db 'Меня зовут ', 0

SECTION .bss
name resb 255

SECTION .text
global _start
_start:

; --- Вопрос "Как Вас зовут?"
mov eax, msg1
call sprint

; --- Ввод имени
mov ecx, name
mov edx, 255
call sread

; --- Создание файла
mov ecx, 0644o
mov ebx, filename
mov eax, 8
int 0x80
mov esi, eax

; --- Запись "Меня зовут "
mov eax, msg2
call slen
mov edx, eax
mov ecx, msg2
mov ebx, esi
mov eax, 4
int 0x80

; --- Запись имени
mov eax, name
call slen
mov edx, eax
mov ecx, name
mov ebx, esi
mov eax, 4
int 0x80

; --- Закрытие файла
mov ebx, esi
mov eax, 6
int 0x80

call quit
