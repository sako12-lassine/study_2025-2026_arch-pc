%include 'in_out.asm'

SECTION .data
filename db 'readme.txt', 0
msg db 'Введите строку для записи в файл: ', 0
success db 'Файл успешно создан и записан!', 0

SECTION .bss
contents resb 255

SECTION .text
global _start
_start:

; --- Печать сообщения
mov eax, msg
call sprint

; --- Ввод строки
mov ecx, contents
mov edx, 255
call sread

; --- Создание файла (sys_creat вместо sys_open)
mov ecx, 0644o      ; права доступа rw-r--r--
mov ebx, filename
mov eax, 8          ; sys_creat
int 0x80

; --- Сохранение дескриптора
mov esi, eax

; --- Расчет длины введенной строки
mov eax, contents
call slen

; --- Запись в файл
mov edx, eax        ; длина строки
mov ecx, contents   ; строка для записи
mov ebx, esi        ; дескриптор файла
mov eax, 4          ; sys_write
int 0x80

; --- Закрытие файла
mov ebx, esi
mov eax, 6          ; sys_close
int 0x80

; --- Сообщение об успехе
mov eax, success
call sprintLF

call quit
