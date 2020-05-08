//Author ITGrusha
#include <bits/stdc++.h>

using namespace std;

int main()
{
  int n = 0;
  cin >> n;
  for (int i = 0; i < n; i++)
  {
    int h, m;
    char tmp;
    cin >> h >> tmp >> m;
    double mangle = 2.0 * M_PI * m / 60.0,
        hangle = 2.0 * M_PI * (h + m/60.0) / 12.0;
    cout << fixed << setprecision(8)
      << 10 + 6*sin(hangle) << ' ' << 10 + 6*cos(hangle) << ' '
      << 10 + 9*sin(mangle) << ' ' << 10 + 9*cos(mangle);
    if (i < n - 1)
      cout << ' ';
  }
}
