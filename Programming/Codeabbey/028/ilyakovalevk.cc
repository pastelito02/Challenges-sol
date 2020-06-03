//Author ilyakovalevk
#include <stdio.h>
#include <math.h>

struct Data {
    float height;
    float weight;
} Data;

int main ()
{
    int i, n, b;
    scanf("%d", &n);
    struct Data man[n];
        for(i=0;i<n;i++)
                scanf("%f%f", &(man[i].weight), &(man[i].height));
        for(i=0;i<n;i++)
        {
            b= ((man[i].weight) / pow((man[i].height),2));
            if(b < 18.5)
                printf ("under ");
            if(b >= 18.5 && b < 25)
                printf ("normal "); 
            if(b >= 25 && b < 30)
                printf("over ");
            if(b >= 30)
                printf("obese ");
        }
        printf("\n");
        return 0;
}
