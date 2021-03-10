section .text
global f
global main
extern printf
;a
f:lea rdi,[rel s]
mov rsi,10
mov rdx,34
lea rcx,[rel s]
mov rax,0
call printf
ret
main:call f;b
section .data
s: db "section .text%1$cglobal f%1$cglobal main%1$cextern printf%1$c;a%1$cf:lea rdi,[rel s]%1$cmov rsi,10%1$cmov rdx,34%1$clea rcx,[rel s]%1$cmov rax,0%1$ccall printf%1$cret%1$cmain:call f;b%1$csection .data%1$cs: db %2$c%3$s%2$c,0%1$c",0
