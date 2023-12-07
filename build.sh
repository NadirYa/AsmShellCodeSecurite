#!/bin/bash

# Compile for 32-bit
for file in asm32/*.s; do
    nasm -f elf32 "$file" -o "${file%.s}.o"
    ld -m elf_i386 "${file%.s}.o" -o "${file%.s}"
done

# Compile for 64-bit
for file in asm64/*.s; do
    nasm -f elf64 "$file" -o "${file%.s}.o"
    ld "${file%.s}.o" -o "${file%.s}"
done
