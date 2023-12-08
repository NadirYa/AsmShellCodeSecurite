.section .text
.global _start

_start:
    # Réserve de l'espace sur la pile pour le tampon d'entrée
    sub $4, %rsp          # Réserve 4 octets pour le tampon d'entrée

    # Lire l'entrée de l'utilisateur dans le tampon (sur la pile)
    mov $0, %edi          # 'stdin' file descriptor
    lea (%rsp), %rsi      # Adresse du tampon sur la pile
    mov $4, %edx          # Taille de la lecture (4 octets)
    mov $0, %eax          # 'read' syscall number
    syscall              # Appel système

    # Comparer l'entrée avec '42'
    mov (%rsp), %eax      # Charger les 4 octets du tampon dans EAX
    cmp $42, %eax         # Comparer EAX avec 42 (la valeur numérique)
    jne not_42            # Si différent de 42, sauter à 'not_42'

    # Préparer '1337\n' dans les registres et la pile
    mov $0x0A373333, %eax # '1337\n' en hexadécimal, en little endian
    mov %eax, (%rsp)      # Déplace '1337\n' au sommet de la pile

    # Affichage de '1337\n' si l'entrée est '42'
    mov $1, %edi          # 'stdout' file descriptor
    lea (%rsp), %rsi      # Adresse du message sur la pile
    mov $5, %edx          # Longueur du message (4 caractères + newline)
    mov $1, %eax          # 'write' syscall number
    syscall              # Appel système

    # Terminer avec le code de sortie 0
    jmp exit

not_42:
    # Code de sortie 1
    mov $1, %edi          # Code de sortie 1

exit:
    mov $60, %eax         # 'exit' syscall number for 64 bits
    xor %edi, %edi        # Code de sortie
    syscall              # Appel système
