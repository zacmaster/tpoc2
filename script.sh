sudo nasm -f elf32 sqrt.asm -o sqrt.o
sudo gcc -m32 main.c sqrt.o -o main
./main
