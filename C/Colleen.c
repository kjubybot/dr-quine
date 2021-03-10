#include<stdio.h>
/**/char*f(){return"#include<stdio.h>%1$c/**/char*f(){return%2$c%3$s%2$c;}int main(){/* */printf(f(),10,34,f());}%1$c";}int main(){/* */printf(f(),10,34,f());}
