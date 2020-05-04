//Author maximgulay
#include <iostream>
#include <fstream>

using namespace std;

class Problem43 {
private:
  ifstream inputFile;
  ofstream outputFile;
  int numberOfTestCases;
  double randomNumber;

public:
  Problem43() {
    inputFile.open("43ProblemIn.dat");
    outputFile.open("43ProblemOut.dat");
  }

  void solveProblem() {
    inputFile >> numberOfTestCases;

    for (int i = 0; i < numberOfTestCases; i++) {
      inputFile >> randomNumber;
      int diceNumber = static_cast<int>(randomNumber*6) + 1;
      outputFile << diceNumber << ' ';
    }
  }

  ~Problem43() {
    inputFile.close();
    outputFile.close();
    cout << "Задача 43 решена" << endl;
  }
};

int main() {
  Problem43 *problem43 = new Problem43;
  problem43->solveProblem();
  problem43->~Problem43();
}
