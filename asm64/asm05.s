section .text
global _start

_start:
    ; Exécuter asm01 (remplacer par le chemin approprié si nécessaire)
    mov eax, 11         ; syscall pour exécuter un programme
    mov ebx, 'chemin/vers/asm01'
    xor ecx, ecx        ; pas d'arguments
    xor edx, edx        ; pas d'environnement
    int 0x80
