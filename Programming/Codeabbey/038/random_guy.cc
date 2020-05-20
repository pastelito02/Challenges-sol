//Author random_guy
#include<stdio.h>
#include<math.h>
int main()
{
  int a[20],b[20],c[20],i,n,d1,d2,d,var,x1,x2,t1,t2;
 scanf("%d",&n);
 for(i=0; i<n; i++)
 {
   scanf("%d",&a[i]);
    scanf("%d",&b[i]);
    scanf("%d",&c[i]); 
  }
for(i=0; i<n-1; i++)
{
    d1=b[i]*b[i];
    d2=4*a[i]*c[i];
    d=d1-d2;
    var=2*a[i];
    if(d>0)
    {
        
        x1=-b[i]+sqrt(d);
        x1=x1/var;
        x2=-b[i]-sqrt(d);
        x2=x2/var;
        printf("%d %d; ",x1,x2);
        }
     else if(d==0)
     {
        x1=-b[i]/var; 
         x2=x1;
        printf("%d %d; ",x1,x2); 
         }
    else
       {
          x1=-b[i]/var; 
          t1=sqrt(-d)/var;
          x2=-b[i]/var;
          t2=-sqrt(-d)/var;
          printf("%d+%di %d%di; ",x1,t1,x2,t2); 
           }
           
}

  d1=b[n-1]*b[n-1];
    d2=4*a[n-1]*c[n-1];
    d=d1-d2;
    var=2*a[n-1];
    if(d>0)
    {
        
        x1=-b[n-1]+sqrt(d);
        x1=x1/var;
        x2=-b[n-1]-sqrt(d);
        x2=x2/var;
        printf("%d %d",x1,x2);
        }
     else if(d==0)
     {
        x1=-b[n-1]/var; 
         x2=x1;
        printf("%d %d",x1,x2); 
         }
    else
       {
          x1=-b[i]/var; 
          t1=sqrt(-d)/var;
          x2=-b[i]/var;
          t2=-sqrt(-d)/var;
          printf("%d+%di %d%di",x1,t1,x2,t2);
           }    

return 0;
}

