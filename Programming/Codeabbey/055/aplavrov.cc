//Author aplavrov
#include <bits/stdc++.h>

using namespace std;

int main()
{
  string s;
  set <string> all, pron;
    cin >> s;
while (s != "end") {
    if (all.count(s))
    pron.insert(s);
    else all.insert(s);
    cin >> s;
}
  
  for (auto elem : pron)
  cout << elem << " ";
  cout << endl;
  
  return 0;
}