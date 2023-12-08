section .text
global _start

_start:
    ; Code hexadécimal de asm01.asm
    db 0x48, 0xC7, 0xC0, 0x3C, 0x00, 0x00, 0x00, 0x48, 0x31, 0xFF, 0x0F, 0x05

    ; Terminer le programme
    mov eax, 60          ; syscall pour exit
    xor edi, edi         ; code de sortie 0
    syscall
