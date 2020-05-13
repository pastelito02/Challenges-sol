//Author aplavrov
#include <bits/stdc++.h>

using namespace std;

#define IO ios_base::sync_with_stdio(0);cin.tie(0);

int main()
{
  IO;
  int n; cin >> n;
  for (int i = 0; i < n; ++i) {
    int m; cin >> m;
    int index = 2, a = 1, b = 1;
    if (1 % m == 0)
    cout << 1 << " ";
    else {
      while (b != 0) {
      int c = (a + b) % m;
      a = b;
      b = c;
      ++index;
      }
      cout << index << " ";
    }
  }
  cout << endl;

  return 0;
}
