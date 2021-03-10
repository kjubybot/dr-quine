section .bss
s: resb 1024
section .data
f: db "Sully_%d.s",0
w: db "w",0
z: db "nasm -f elf64 Sully_%1$d.s&&gcc -no-pie -o Sully_%1$d Sully_%1$d.o&&./Sully_%1$d",0
v: db "section .bss%1$cs: resb 1024%1$csection .data%1$cf: db %2$cSully_%%d.s%2$c,0%1$cw: db %2$cw%2$c,0%1$cz: db %2$cnasm -f elf64 Sully_%%1$d.s&&gcc -no-pie -o Sully_%%1$d Sully_%%1$d.o&&./Sully_%%1$d%2$c,0%1$cv: db %2$c%4$s%2$c,0%1$csection .text%1$cextern fopen%1$cextern fclose%1$cextern sprintf%1$cextern fprintf%1$cextern system%1$cglobal main%1$cmain:mov r8,%3$d%1$ccmp r8,0%1$cje exit%1$cdec r8%1$cpush r8%1$clea rdi,[rel s]%1$clea rsi,[rel f]%1$cmov rdx,r8%1$cmov rax,0%1$ccall sprintf%1$clea rdi,[rel s]%1$clea rsi,[rel w]%1$ccall fopen%1$cpop r8%1$cpush r8%1$cpush rax%1$cmov rdi,rax%1$clea rsi,[rel v]%1$cmov rdx,10%1$cmov rcx,34%1$clea r9,[rel v]%1$cmov rax,0%1$ccall fprintf%1$cpop rdi%1$ccall fclose%1$cpop rdx%1$clea rdi,[rel s]%1$clea rsi,[rel z]%1$ccall sprintf%1$clea rdi,[rel s]%1$ccall system%1$cexit:ret%1$c",0
section .text
extern fopen
extern fclose
extern sprintf
extern fprintf
extern system
global main
main:mov r8,5
cmp r8,0
je exit
dec r8
push r8
lea rdi,[rel s]
lea rsi,[rel f]
mov rdx,r8
mov rax,0
call sprintf
lea rdi,[rel s]
lea rsi,[rel w]
call fopen
pop r8
push r8
push rax
mov rdi,rax
lea rsi,[rel v]
mov rdx,10
mov rcx,34
lea r9,[rel v]
mov rax,0
call fprintf
pop rdi
call fclose
pop rdx
lea rdi,[rel s]
lea rsi,[rel z]
call sprintf
lea rdi,[rel s]
call system
exit:ret
