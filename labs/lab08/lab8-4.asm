%include 'in_out.asm'

SECTION .data
msg_func db "Функция: f(x)=7(x+1)",0
msg_res db "Результат: ",0

SECTION .text
global _start

_start:
    pop ecx
    pop edx
    sub ecx, 1
    mov esi, 0

next:
    cmp ecx, 0
    jz _end
    pop eax
    call atoi
    
    add eax, 1
    mov ebx, 7
    imul eax, ebx
    
    add esi, eax
    loop next

_end:
    mov eax, msg_func
    call sprintLF
    mov eax, msg_res
    call sprint
    mov eax, esi
    call iprintLF
    call quit
