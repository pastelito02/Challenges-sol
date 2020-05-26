//Author khaledzaki37
#include <iostream>
#include <cmath>
using namespace std;

int main()
{

    string v,h,k,q; int vd,hd,n;
    v = "12345678",h = "abcdefgh";
    cin >> n;
    while(n--){
    cin >> k >> q;
    hd = h.find(k[0],0)-h.find(q[0],0);
    hd=abs(hd);
    vd = v.find(k[1],0)-v.find(q[1],0);
    vd= abs(vd);
    if(k[0]==q[0]||k[1]==q[1]||hd==vd)
        {cout << "Y \n";
    }else {cout << "N \n";}
    }
    return 0;
}
