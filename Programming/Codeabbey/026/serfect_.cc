//Author serfect_
#include <iostream.h>
#include <stdio.h>
#include <iomanip.h>
//-------------------------------------------------------------------------
int gcd(int a, int b)
{ //алгоритм евклида, вычисляет НОД
   if (b == 0) return a;
   return gcd(b, a % b);
}
 //------------------------------------------------------------------------
int main ()
{ int Num=0;
  cout<<"Enter number"<<endl;
  cin>>Num;
  int **array = new int* [Num];
  for (int i=0; i < Num; i++)
     array[i]=new int [2];
  for (int i=0; i < Num; i++)
   { for (int j=0; j < 2; j++)
       cin>>array[i][j];
   }
  //------------------------
  int *result = new int [Num*2];
  //----------------------------
  int tmp=0;
  for (int i=0; i<Num; i++)
    { result[tmp]=gcd(array[i][0],array[i][1]);
      tmp++;
      result[tmp]=array[i][0]*array[i][1]/result[tmp-1];
      tmp++;
    }

  //------------------------------
  cout<<"Result:"<<endl;
  for (int i=0; i<2*Num; i++)
    { if (i==0)
        cout<<"(";
      else
       { if (i%2==0 && i!=0)
           cout<<") (";
         else cout<<" ";
       }
      cout<<result[i];
    }
   cout<<") "<<endl;
  //--------------------------
  for (int i=0; i < Num; i++)
      delete[]array[i];
  delete []result;
  system("pause");
  return 0;
}