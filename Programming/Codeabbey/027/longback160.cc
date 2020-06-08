//Author longback160
using namespace std;
#include <iostream>
#include <fstream>
#include<cmath>
ifstream in("input.txt");
ofstream out("output.txt");
int main()
{
    bool exit = true;
    int time, t = 0, count = 0,e = 0,d = 0;
    in >> time;
    int* a = new int[time];
    for (int i = 0; i < time; i++)
    {
        in >> a[i];
    }
    
    for (int i = 0; i < time; i++)
    {
        e++;
        count = 0;
        for (int j = 0; j < time-1; j++)
        {
            if (a[j] > a[j + 1])
            {
                t = a[j];
                a[j] = a[j + 1];
                a[j + 1] = t;
                count++;
                d++;
            }
        }
        if (count == 0)
        {
            break;
        }
    }
    out << e << " " << d;
    return 0;
}
