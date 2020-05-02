//Author Eugenia_F
#include <iostream>
#include <istream>
#include <cstdio>
#include <cstdlib>
#include <stdio.h>
#include <cstring>
#include <math.h>


using namespace std;

int main()
{
  setlocale(0, "");
  int n =0, a =0, b = 0, num =0, Sn =0, c =0;
  cout << "Введите данные:" << endl;
  cin>>n;
  int* Array = new int[n];
  for(int i =0; i < n*3; i++)
  {
    cin >> Array[i];
  }
  cout << "Сумма членов прогрессии: " << endl;
  for(int i = 0; i < n*3; i+=3)
  {
    a = Array[i];
    b = Array[i+1];
    num = Array[i+2];
    Sn = num*a + ((num*(num-1)/2)*b);
    cout << Sn << " ";
  }
  Sn =0;

  return 0;
}
