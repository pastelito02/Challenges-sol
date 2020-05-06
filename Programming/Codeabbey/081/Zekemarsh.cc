//Author Zekemarsh
#include <iostream>

int numberOfOnesInBinaryRepresentation(int);

int main()
{
  int num = 0;
  std::cin >> num;

  while (num > 0)
  {
      int current = 0;

    std::cin >> current;

    std::cout << numberOfOnesInBinaryRepresentation(current) << " ";

    --num;
  }
}

int numberOfOnesInBinaryRepresentation(int num)
{
  int oneCounter = num < 0 ? 1 : 0;
  int divisor = 1;

  for (int i = 0; i < 31; ++i)
  {
    if (num & divisor)
    {
      ++oneCounter;
    }
    divisor = divisor << 1;
  }

  return oneCounter;
}
