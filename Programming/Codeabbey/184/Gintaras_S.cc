//Author Gintaras_S
#include <iostream>
#include <string>

using namespace std;

int main()
{
    int numTestCases;
    cin >> numTestCases;

    int M, K;
    char type;

    for (int tc=0; tc!=numTestCases; ++tc) {
        cin >> M >> K >> type;

        if (type == 'n') {
            cout << M % (K+1) << " ";
        } else {
            cout << (M-1) % (K+1) << " ";
        }
    }

    return 0;
}