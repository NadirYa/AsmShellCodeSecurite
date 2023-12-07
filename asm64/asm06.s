section .text
global _start

_start:
    ; Exécuter /bin/sh
    mov eax, 11         ; syscall pour exécuter un programme
    mov ebx, '/bin/sh'
    xor ecx, ecx        ; pas d'arguments
    xor edx, edx        ; pas d'environnement
    int 0x80
