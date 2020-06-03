//Author Anastasiiiiia
#include "pch.h"
#include <iostream>
#include <iomanip>
using namespace std;

struct Mass
{
    double X, Y, N, time;
    double Xk, Yk;
    int timei;
};

int main()
{
    const int size = 1000;
    int N, i = 0, del;
    Mass A[size];

    cin >> N;

    for (int i = 0; i < N; i++)
    {
        A[i].N = 0;
        A[i].X = 0;
        A[i].Y = 0;
        A[i].Xk = 0;
        A[i].Yk = 0;
    }

    for (int i = 0; i < N; i++)
    {
        cin >> A[i].X >> A[i].Y >> A[i].N;

        A[i].Xk = (A[i].Y * A[i].N) / (A[i].X + A[i].Y); // кол-во страниц, которое будет печатать 1-й принтер
        A[i].Yk = (A[i].X * A[i].N) / (A[i].X + A[i].Y);

        if (floor(A[i].Xk) * A[i].X < ceil(A[i].Yk) * A[i].Y)
        {
            A[i].time = ceil(A[i].Yk) * A[i].Y;
        }
        else (A[i].time = floor(A[i].Xk * A[i].X));

        if (floor(A[i].Yk) * A[i].Y > ceil(A[i].Xk) * A[i].X)

        {
            if (floor(A[i].Yk) * A[i].Y < A[i].time)
            {
                A[i].time = floor(A[i].Yk) * A[i].Y;
            }
        }
        else if (ceil(A[i].Xk) * A[i].X < A[i].time)
        {
            A[i].time = ceil(A[i].Xk) * A[i].X;
        }
    }

    for (int i = 0; i < N; i++)
    {
        A[i].timei = A[i].time;
        cout << A[i].timei << " ";
    }

}