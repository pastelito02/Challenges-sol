//Author tinzendA
#include "stdafx.h"
#include <iostream>
using namespace std;

int _tmain(int argc, _TCHAR* argv[])
{
  const int arrSize =253;

  int counter[10]={};
  int nList[arrSize];
  for(int k=0;k<arrSize;k++)
  {
    cin>>nList[k];
  }

  for(int i=0;i<arrSize;i++)
  {
    counter[nList[i]-1]++;
  }
  cout<<"\n";

  for(int x=0;x<10;x++)
  {
    cout<<counter[x]<<" ";
  }
  cout<<endl;
  system("pause");
  return 0;
}
