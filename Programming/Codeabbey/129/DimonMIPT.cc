//Author DimonMIPT
#include <fstream>

using namespace std;

char base36[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

long long int CNK(int N, int K)
{
  if (!K) return 1;
  if (K == N) return 1;
  long long int C = 1;
  if (K&&(K != N))
  {
    for (int j = 1; j <= K; j++)
    {
      C *= (N - K + j);
      C /= j;
    }
  }
  return C;
}

int main()
{
  int amount, N, K, strIndex, numOfChar;
  char str[37];
  int charNums[36];
  long long int I, num, Cbuf;

  ifstream input("input.txt");
  input >> amount;

  ofstream output("output.txt");
  for (int i = 0; i < amount; i++)
  {
    input >> N >> K >> I;
    num = strIndex = numOfChar = 0;
    int n = N - 1, k = K - 1;

    while (1)
    {
      if (k < 0) break;
      Cbuf = CNK(n, k);
      if (num + Cbuf > I)
      {
        n--;
        k--;
        charNums[strIndex++] = numOfChar++;
      }
      else
      {
        num += Cbuf;
        n--;
        numOfChar++;
      }
    }
    if (strIndex < K - 1)
    {
      for (int j = strIndex; j < K; j++)
        charNums[j] = charNums[j - 1] + 1;
    }

    for (int j = 0; j < K; j++)
      str[j] = base36[charNums[j]];
    str[K] = 0;
    output << str << ' ';
  }

  input.close();
  output.close();
  return 0;
}
