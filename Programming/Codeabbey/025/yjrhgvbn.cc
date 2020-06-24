//Author yjrhgvbn
#include<iostream>
#include<vector>
#include<string>
#include<algorithm>
using namespace std;
int main()
{
    int n;
    cin >> n;
    vector<int>m(n);
    for (int i = 0; i < n; i++)
    {
        int A, C, M, X0, N;
        cin >> A >> C >> M >> X0 >> N;
        int temp;
        for (int k = 0; k < N; k++)
        {
            temp = (A*X0 + C) % M;
            X0 = temp;
        }
        m[i] = temp;
    }
    for (int i = 0; i < n; i++)
        cout << m[i] << " ";
    system("pause");
    return 0;
}
