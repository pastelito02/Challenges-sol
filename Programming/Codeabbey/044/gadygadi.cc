//Author gadygadi
#include <iostream>

using namespace std;

int main() {
  int numberOfPairs = 0;
  cin >> numberOfPairs;
  long firstNumber = 0;
  long secondNumber = 0;
  int sumOfDices = 0;
  int numberOfDistinctValues = 6;
  for (int i = 0; i < numberOfPairs; i ++) {
    cin >> firstNumber >> secondNumber;
    sumOfDices = ((firstNumber % numberOfDistinctValues) + 1) + ((secondNumber % numberOfDistinctValues) + 1);
    cout << sumOfDices << " ";
  }
}
