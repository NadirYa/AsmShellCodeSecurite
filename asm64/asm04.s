section .bss
    num resb 1

section .text
global _start

_start:
    ; Lire l'entrée
    mov eax, 0          ; 'sys_read' syscall number
    mov edi, 0          ; 'stdin' file descriptor
    mov edx, 1          ; Taille de la lecture (1 octet)
    lea rsi, [num]      ; Adresse du tampon d'entrée
    syscall             ; Appel système

    ; Convertir la chaîne en nombre
    movzx rax, byte [num]   ; Charger le caractère dans rax (zéro étendu)

    ; Vérifier si le nombre est impair
    test al, 1
    jnz odd

    ; Nombre pair, retourner 0
    mov eax, 0
    jmp end

odd:
    ; Nombre impair, retourner 1
    mov eax, 1

end:
    ; Terminer le programme
    mov edi, eax          ; Code de sortie dans edi
    mov eax, 60           ; 'sys_exit' syscall number
    xor ebx, ebx          ; Pas de code de sortie
    syscall              ; Appel système
