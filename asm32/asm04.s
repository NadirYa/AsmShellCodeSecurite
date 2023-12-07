section .data
    input db 0

section .bss
    num resb 1

section .text
global _start

_start:
    ; Lire l'entrée
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 1
    int 0x80

    ; Convertir l'entrée en nombre
    movzx eax, byte [input]
    sub eax, '0'
    mov [num], eax

    ; Vérifier si le nombre est pair
    test byte [num], 1
    jnz odd

    ; Nombre pair, retourner 0
    mov eax, 0
    jmp end

odd:
    ; Nombre impair, retourner 1
    mov eax, 1

end:
    ; Terminer le programme
    mov eax, 1
    int 0x80