.section .data
buffer: .space 4              # Réserve 4 octets pour le tampon d'entrée
message: .ascii "1337\n"      # Message à afficher
length: .long 5               # Longueur du message (4 caractères + newline)

.section .text
.global _start

_start:
    # Lire l'entrée de l'utilisateur dans 'buffer'
    mov $3, %eax        # 'read' syscall
    mov $0, %ebx        # 'stdin' file descriptor
    mov $buffer, %ecx   # Adresse du tampon
    mov $4, %edx        # Taille de la lecture (4 octets)
    int $0x80           # Appel système

    # Comparer l'entrée avec '42'
    mov $buffer, %eax   # Charger l'adresse du tampon dans EAX
    movl (%eax), %eax   # Charger les 4 octets du tampon dans EAX
    cmp $0x3432, %eax   # Comparer EAX avec '42' (en ASCII)
    jne not_42          # Si différent de '42', sauter à 'not_42'

    # Affichage de '1337' si l'entrée est '42'
    mov $4, %eax        # 'write' syscall
    mov $1, %ebx        # 'stdout' file descriptor
    mov $message, %ecx  # Adresse du message
    mov length, %edx    # Longueur du message
    int $0x80           # Appel système

    # Terminer avec le code de sortie 0
    mov $1, %eax        # 'exit' syscall
    xor %ebx, %ebx      # Code de sortie 0
    int $0x80           # Appel système

not_42:
    # Terminer avec le code de sortie 1
    mov $1, %eax        # 'exit' syscall
    mov $1, %ebx        # Code de sortie 1
    int $0x80           # Appel système
