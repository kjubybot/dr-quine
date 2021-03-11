%macro m 0
_main:push rbp
mov rbp,rsp
lea rdi,[rel f]
lea rsi,[rel w]
call _fopen
cmp rax,0
je exit
mov rdi,rax
lea rsi,[rel s]
mov rdx,10
mov rcx,34
lea r8,[rel s]
mov rax,0
call _fprintf
%endmacro
section .text
extern _fopen
extern _fprintf
global _main
m
exit:pop rbp
ret
section .data
s: db "%%macro m 0%1$c_main:push rbp%1$cmov rbp,rsp%1$clea rdi,[rel f]%1$clea rsi,[rel w]%1$ccall _fopen%1$ccmp rax,0%1$cje exit%1$cmov rdi,rax%1$clea rsi,[rel s]%1$cmov rdx,10%1$cmov rcx,34%1$clea r8,[rel s]%1$cmov rax,0%1$ccall _fprintf%1$c%%endmacro%1$csection .text%1$cextern _fopen%1$cextern _fprintf%1$cglobal _main%1$cm%1$cexit:pop rbp%1$cret%1$csection .data%1$cs: db %2$c%3$s%2$c,0%1$cf: db %2$cGrace_kid.s%2$c,0%1$cw: db %2$cw%2$c,0%1$c",0
f: db "Grace_kid.s",0
w: db "w",0
