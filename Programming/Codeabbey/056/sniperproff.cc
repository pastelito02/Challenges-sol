//Author sniperproff
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <string>  
#include <math.h>
#include <vector>
using namespace std;
bool life[25][27];
int checknei(int x, int y)
{
    return life[x + 1][y] + life[x+1][y-1] + life[x][y-1] + life[x-1][y-1] + life[x-1][y] + life[x-1][y+1] + life[x][y+1] + life[x+1][y+1];
}
void main()
{
    char cur;
    int neigh[25][27];
    int steps, i, j, amount = 0;
    for (i = 0; i < 25; i++)
        for (j = 0; j < 27; j++)
            life[i][j] = false;
    setlocale(0, "");
    //------Ввод------
    ifstream fin;
    ofstream fout;
    fout.precision(15);
    cout.precision(15);
    fin.open("D:\\Misc\\IO\\Test\\in.txt");
    fout.open("D:\\Misc\\IO\\Test\\out.txt");
    for(i=0;i<5;i++)
        for (j = 0; j < 7; j++)
        {
            fin >> cur;
            if (cur == 'X')
            {
                life[i + 10][j + 10] = true;
                amount++;
            }
        }
    for (steps = 0; steps < 5; steps++)
    {
        for (i = 1; i < 24; i++)
            for (j = 1; j < 26; j++)
                neigh[i][j] = checknei(i, j);
        for (i = 1; i < 24; i++)
            for (j = 1; j < 26; j++)
            {
                if (life[i][j] != false)
                {
                    if (neigh[i][j] < 2 || neigh[i][j]>3)
                    {
                        life[i][j] = false;
                        amount--;
                    }
                }
                else if (neigh[i][j] == 3)
                {
                    life[i][j] = true;
                    amount++;
                }
            }
        fout << amount << " ";
    }
    fin.close();
    fout.close();
    system("pause");
}