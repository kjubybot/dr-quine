section .text
global f
global _main
extern _printf
;a
f:lea rdi,[rel s]
mov rsi,10
mov rdx,34
lea rcx,[rel s]
mov rax,0
call _printf
ret
_main:call f;b
ret
section .data
s: db "section .text%1$cglobal f%1$cglobal _main%1$cextern _printf%1$c;a%1$cf:lea rdi,[rel s]%1$cmov rsi,10%1$cmov rdx,34%1$clea rcx,[rel s]%1$cmov rax,0%1$ccall _printf%1$cret%1$c_main:call f;b%1$cret%1$csection .data%1$cs: db %2$c%3$s%2$c,0%1$c",0
