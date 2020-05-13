//Author gleb_kosyrev
#include <stdio.h>
#include <malloc.h>

int main()
  {int *res,n,i,j,divisor,fibPrev,fibNew,buf;
  scanf("%d",&n);
  res=(int*)malloc(sizeof(int)*n);
  for(i=0;i<n;i++)
    {scanf("%d",&divisor);
    fibPrev=0;
    fibNew=1;
    for(j=2;j<2000000;j++)
      {buf=fibNew;
      fibNew=(fibNew+fibPrev)%divisor;
      fibPrev=buf;
      if(fibNew==0)
        {res[i]=j;
        break;}}
    }
  for(i=0;i<n;i++)
    printf("%d ",res[i]);
  free(res);
  return 0;}
