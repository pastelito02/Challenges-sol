//Author karpulevich
#include <iostream>
using namespace std;


int main()
{
  int N;
  cin >> N;

  for(int i = 0; i < N; i++)
  {
    int tmp1, tmp2, tmp3;
    cin >> tmp1;
    cin >> tmp2;
    cin >> tmp3;

    cout.precision(9);
    cout << tmp2 * ((double)tmp1/(tmp2 + tmp3)) << " ";
  }

  return 0;
}
