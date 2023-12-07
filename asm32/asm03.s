section .data
    input db 0          ; Variable pour stocker l'entrée
    message db '1337',0xA ; Message à afficher

section .bss
    num resb 1

section .text
global _start

_start:
    ; Lire l'entrée
    mov eax, 3          ; syscall pour lire
    mov ebx, 0          ; stdin
    mov ecx, input      ; adresse de la variable d'entrée
    mov edx, 1          ; lire 1 caractère
    int 0x80

    ; Convertir l'entrée en nombre
    movzx eax, byte [input]
    sub eax, '0'
    mov [num], eax

    ; Comparer avec 42
    cmp byte [num], 42
    jne not_42

    ; Afficher 1337 si égal
    mov eax, 4
    mov ebx, 1          ; stdout
    mov ecx, message
    mov edx, 5          ; longueur du message
    int 0x80
    jmp end

not_42:
    ; Mettre 1 dans eax pour le code de sortie
    mov eax, 1

end:
    ; Terminer le programme
    mov eax, 1          ; syscall pour terminer
    int 0x80