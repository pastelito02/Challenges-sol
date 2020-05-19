//Author TheChosenOne
#include <stdio.h>
#include<string.h>
int main(void) {
    int t,k,i,len,m,s;
    char a[100],c[100];
    scanf("%d%d",&t,&k);
    while(t--)
    {
        scanf(" %[^\n]",a);
        len=0;
        for(i=0;a[i];i++)
            len++;
        len=len-1;
        for(i=0;i<len;i++)
        {
            s=(int)a[i];
            if(s>=65)
            {
                m=s-k;
                if(m>=65)
                    c[i]=(char)m;
                else
                    c[i]=(char)(m+26);
            }
            else
                c[i]=a[i];
            printf("%c",c[i]);
        }
        printf(". ");
    }
    return 0;
}