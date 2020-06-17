//Author MortTull
#include <bits/stdc++.h>

using namespace std;

void find_extended(int x, int y) {
    int Sprev = 1, Scur = 0, Tprev = 0, Tcur = 1, r, q, a=x, b=y;
    do {
        if (a%b == 0) break;
        r = a % b;
        q = a / b;
        a = b;
        b = r;
        int Snext = Sprev - q * Scur;
        int Tnext = Tprev - q * Tcur;
        Sprev = Scur;
        Scur = Snext;
        Tprev = Tcur;
        Tcur = Tnext;
    } while (true);
    cout<<r<<" "<<Scur<<" "<<Tcur<<" ";
}

int main() {
    int n, x, y;
    cin>>n;
    while (n--) {
        cin>>x>>y;
        find_extended(x,y);
    }
    return 0;
}