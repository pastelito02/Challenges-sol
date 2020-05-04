//Author erzett
#include <iostream>
#include <vector>

using namespace std;

int main()
{
  int loop = 0;

  cin >> loop;

  for (int i = 0; i < loop; ++i)
  {
    int number = 0;
    cin >> number;

    vector<int> digits;

    while (number != 0)
    {
      digits.push_back(number % 10);
      number /= 10;
    }

    int sum = 0;

    for (int j = 0; j < digits.size(); ++j)
    {
      sum += digits[j] * (digits.size() - j);
    }

    cout << sum << " ";
  }
}
