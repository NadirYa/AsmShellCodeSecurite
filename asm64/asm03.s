.section .text
.global _start

_start:
    # Réserve de l'espace sur la pile pour le tampon d'entrée
    sub $4, %esp          # Réserve 4 octets pour le tampon d'entrée

    # Lire l'entrée de l'utilisateur dans le tampon (sur la pile)
    mov $3, %eax          # 'read' syscall
    mov $0, %ebx          # 'stdin' file descriptor
    lea (%esp), %ecx      # Adresse du tampon sur la pile
    mov $4, %edx          # Taille de la lecture (4 octets)
    int $0x80             # Appel système

    # Comparer l'entrée avec '42'
    mov (%esp), %eax      # Charger les 4 octets du tampon dans EAX
    cmp $0x3432, %eax     # Comparer EAX avec '42' (en ASCII)
    jne not_42            # Si différent de '42', sauter à 'not_42'

    # Préparer '1337\n' dans les registres et la pile
    mov $0x0A373333, %eax # '1337\n' en hexadécimal, en little endian
    mov %eax, (%esp)      # Déplace '1337\n' au sommet de la pile

    # Affichage de '1337\n' si l'entrée est '42'
    mov $4, %eax          # 'write' syscall
    mov $1, %ebx          # 'stdout' file descriptor
    lea (%esp), %ecx      # Adresse du message sur la pile
    mov $5, %edx          # Longueur du message (4 caractères + newline)
    int $0x80             # Appel système

    # Terminer avec le code de sortie 0
    jmp exit

not_42:
    # Code de sortie 1
    mov $1, %ebx          # Code de sortie 1

exit:
    mov $1, %eax          # 'exit' syscall
    int $0x80             # Appel système

