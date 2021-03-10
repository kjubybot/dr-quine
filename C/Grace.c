#include<stdio.h>
#define S char*s="#include<stdio.h>%1$c#define S char*s=%2$c%3$s%2$c%1$c#define F int main(){S;FILE*f=fopen(%2$cGrace_kid.c%2$c,%2$cw%2$c);if(!f)return 1;fprintf(f,s,10,34,s);fclose(f);}%1$cF%1$c"
#define F int main(){S;FILE*f=fopen("Grace_kid.c","w");if(!f)return 1;fprintf(f,s,10,34,s);fclose(f);}
F
