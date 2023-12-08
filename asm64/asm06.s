section .text
global _start

_start:
    ; Exécuter /bin/sh
    mov eax, 59         ; syscall pour execve
    mov rdi, bin_sh     ; adresse de la chaîne '/bin/sh'
    xor rsi, rsi        ; pas d'arguments
    xor rdx, rdx        ; pas d'environnement
    syscall

bin_sh db '/bin/sh', 0
