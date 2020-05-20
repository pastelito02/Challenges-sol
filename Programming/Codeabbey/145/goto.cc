//Author goto
#include <stdio.h>
#define ull unsigned long long int

ull pow(ull a, ull b, ull limit)
{
    ull result = 1;
    while(b){
        if(b & 1){
            result = ((a % limit)*(result % limit))%limit;
        }
        b >>= 1;
        a = ((a % limit)*(a % limit))%limit;
    }
    return result;
}

int main(){
    int n;
    ull a,b,c;
    scanf("%d", &n);
    for(;n>0; n--){
        scanf("%llu %llu %llu", &a, &b, &c);
        printf("%llu ",pow(a,b,c));
    }
    return 0;
}