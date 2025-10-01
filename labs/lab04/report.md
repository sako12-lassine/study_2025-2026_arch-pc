---
title: "Лабораторная работа №4"
author: "Сако Лассине"
date: "2025 г."
---

# Цель работы
Освоение процедуры компиляции и сборки программ, написанных на ассемблере NASM.

# Ход работы

## 1. Создание программы Hello World
```asm
; hello.asm
SECTION .data
    hello: DB 'Hello world!',10
    helloLen: EQU $-hello

SECTION .text
    GLOBAL _start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,hello
    mov edx,helloLen
    int 80h
    
    mov eax,1
    mov ebx,0
    int 80h
