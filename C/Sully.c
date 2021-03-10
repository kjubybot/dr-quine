#include<stdio.h>
#include<stdlib.h>
int main(){int i=5;if(i==0)return 0;char s[100];i--;sprintf(s,"Sully_%d.c",i);FILE*f=fopen(s,"w");char*v="#include<stdio.h>%1$c#include<stdlib.h>%1$cint main(){int i=%3$d;if(i==0)return 0;char s[100];i--;sprintf(s,%2$cSully_%%d.c%2$c,i);FILE*f=fopen(s,%2$cw%2$c);char*v=%2$c%4$s%2$c;fprintf(f,v,10,34,i,v);fclose(f);char z[1024];sprintf(z,%2$cgcc Sully_%%1$d.c -o Sully_%%1$d&&./Sully_%%1$d%2$c,i);system(z);}%1$c";fprintf(f,v,10,34,i,v);fclose(f);char z[1024];sprintf(z,"gcc Sully_%1$d.c -o Sully_%1$d&&./Sully_%1$d",i);system(z);}
