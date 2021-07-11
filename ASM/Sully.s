section .bss
s: resb 1024
section .data
f: db "Sully_%d.s",0
n: db __FILE__,0
m: db "Sully.s",0
w: db "w",0
z: db "nasm -f macho64 Sully_%1$d.s&&gcc -o Sully_%1$d Sully_%1$d.o&&rm Sully_%1$d.o&&./Sully_%1$d",0
v: db "section .bss%1$cs: resb 1024%1$csection .data%1$cf: db %2$cSully_%%d.s%2$c,0%1$cn: db __FILE__,0%1$cm: db %2$cSully.s%2$c,0%1$cw: db %2$cw%2$c,0%1$cz: db %2$cnasm -f macho64 Sully_%%1$d.s&&gcc -o Sully_%%1$d Sully_%%1$d.o&&rm Sully_%%1$d.o&&./Sully_%%1$d%2$c,0%1$cv: db %2$c%4$s%2$c,0%1$csection .text%1$cextern _fopen%1$cextern _fclose%1$cextern _sprintf%1$cextern _fprintf%1$cextern _system%1$cextern _strcmp%1$cextern _basename%1$cglobal _main%1$c_main:push rbp%1$csub rsp,16%1$cmov r8,%3$d%1$ccmp r8,0%1$cje exit%1$cmov qword[rsp+8],r8%1$clea rdi,[rel n]%1$ccall _basename%1$cmov rdi,rax%1$clea rsi,[rel m]%1$ccall _strcmp%1$cje skip%1$cdec qword[rsp+8]%1$cskip:mov r8,qword[rsp+8]%1$clea rdi,[rel s]%1$clea rsi,[rel f]%1$cmov rdx,r8%1$cmov rax,0%1$ccall _sprintf%1$clea rdi,[rel s]%1$clea rsi,[rel w]%1$ccall _fopen%1$cmov r8,qword[rsp+8]%1$cmov qword[rsp],rax%1$cmov rdi,rax%1$clea rsi,[rel v]%1$cmov rdx,10%1$cmov rcx,34%1$clea r9,[rel v]%1$cmov rax,0%1$ccall _fprintf%1$cmov rdi,qword[rsp]%1$ccall _fclose%1$cmov rdx,qword[rsp+8]%1$clea rdi,[rel s]%1$clea rsi,[rel z]%1$ccall _sprintf%1$clea rdi,[rel s]%1$ccall _system%1$cexit:add rsp,16%1$cpop rbp%1$cret%1$c",0
section .text
extern _fopen
extern _fclose
extern _sprintf
extern _fprintf
extern _system
extern _strcmp
extern _basename
global _main
_main:push rbp
sub rsp,16
mov r8,5
cmp r8,0
je exit
mov qword[rsp+8],r8
lea rdi,[rel n]
call _basename
mov rdi,rax
lea rsi,[rel m]
call _strcmp
je skip
dec qword[rsp+8]
skip:mov r8,qword[rsp+8]
lea rdi,[rel s]
lea rsi,[rel f]
mov rdx,r8
mov rax,0
call _sprintf
lea rdi,[rel s]
lea rsi,[rel w]
call _fopen
mov r8,qword[rsp+8]
mov qword[rsp],rax
mov rdi,rax
lea rsi,[rel v]
mov rdx,10
mov rcx,34
lea r9,[rel v]
mov rax,0
call _fprintf
mov rdi,qword[rsp]
call _fclose
mov rdx,qword[rsp+8]
lea rdi,[rel s]
lea rsi,[rel z]
call _sprintf
lea rdi,[rel s]
call _system
exit:add rsp,16
pop rbp
ret
