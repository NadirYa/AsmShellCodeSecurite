section .data
    msg db '1337', 0xA

section .text
global _start

_start:
    mov eax, 4      ; syscall number for sys_write
    mov ebx, 1      ; file descriptor 1 is stdout
    mov ecx, msg    ; message to write
    mov edx, 5      ; message length
    int 0x80        ; call kernel

    mov eax, 1      ; syscall number for sys_exit
    xor ebx, ebx    ; return 0
    int 0x80        ; call kernel