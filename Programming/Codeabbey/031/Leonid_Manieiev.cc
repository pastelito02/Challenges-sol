//Author Leonid_Manieiev
//Rotate String

#include <iostream>
#include <vector>
using namespace std;

int main()
{
    int N;
    cin >> N;
    int *numbers = new int[N];
    string *strs = new string[N];
    string *strsrez = new string[N];
    for(int i = 0; i < N; i++)
    {
        cin >> numbers[i];
        cin >> strs[i];
    }

    //for(int i = 0; i < N; i++)
        //if(numbers[i] >= 0)
            //strsrez[i] = (strs[i].begin() + numbers[i]), strs[i].end() +

    for(int i = 0; i < N; i++)
    {
        if(numbers[i] >= 0)
        {
            string b(strs[i].begin() + numbers[i], strs[i].end());
            string n(strs[i].begin(), strs[i].begin() + numbers[i]);
            cout << b << n << " ";
        }

        else
        {
            numbers[i] = -numbers[i];
            string b(strs[i].end() - numbers[i], strs[i].end());
            string n(strs[i].begin(), strs[i].end() - numbers[i]);
            cout << b << n << " ";
        }
    }


    return 0;
}
