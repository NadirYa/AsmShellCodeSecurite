     # Chaîne de caractères représentant 1337
.section .text
.global _start


_start:
    # Affichage de 1337
    mov $4, %eax        # Mettre le numéro de l'appel système pour 'write' dans EAX
    mov $1, %ebx        # Mettre le descripteur de fichier pour 'stdout' dans EBX
    mov $message, %ecx  # Mettre l'adresse de la chaîne de caractères dans ECX
    mov $4, %edx        # Mettre la longueur de la chaîne de caractères dans EDX
    int $0x80           # Appeler le système pour écrire la chaîne de caractères

    # On garde le retour 0
    mov $0, %ebx        # Mettre 0 dans EBX, qui est le statut de sortie
    mov $1, %eax        # Mettre le numéro de l'appel système pour 'exit' dans EAX
    int $0x80           # Appeler le système pour terminer le programme

.section .data
message:
    .ascii "1337"       # Chaîne de caractères représentant 1337
