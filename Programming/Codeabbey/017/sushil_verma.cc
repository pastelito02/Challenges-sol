//Author sushil_verma
#include<string>
#include<stdbool.h>
#include<math.h>
#include<algorithm>
#include<stdio.h>
#include<iostream>
#define ll long long int
#define sc(x) scanf("%lld",&x);
ll MOD= 10000007 ;
ll MAX= 1000002;
using namespace std;

int main()
{   

   ll t;  sc(t);  ll x; ll sum=0;
   while(t--)
   { // string s; cin>>s;  ll l=s.length();  
     
     sc(x);  sum+= x; sum= ( (sum%MOD) * 113) %MOD ;
      
   }  
   //for(ll i=1; i<300; i++)
     
        printf("%lld",sum%MOD); 
    return 0;
}
