//Author chwatavi
#include <iostream>
#include <sstream>
#include <string>
using namespace std;

int guess(int len, string guessed, bool &validity, string &clues, int nAttempt);
bool validGuess(int len, string guessed, string &clues, int nAttempt);
bool comply2Clue(int len, string guessed, string triedGuess, int correctDigits);
int commonDigits(string s1, string s2);

int main()
{
  int len = 4;

  int nAttempt;
  cin >> nAttempt;

  stringstream clues;

  for (int i = 0; i < nAttempt; i++)
  {
    int triedGuess, CorrectDigits;
    cin >> triedGuess >> CorrectDigits;
    clues << triedGuess << " " << CorrectDigits << " ";
  }

  bool initialValidity = true;
  string cluesStr = clues.str();

  cout << guess(len, "", initialValidity, cluesStr, nAttempt) << endl;
  return 0;
}

int commonDigits(string s1, string s2)
{
  int count = 0;

  for (int i = 0; i < s1.length(); i++)
  {
    if (s1[i] == s2[i])
      count++;
  }
  return count;
}

bool comply2Clue(int len, string guessed, string triedGuess, int correctDigits)
{
  int missingDigits = len - guessed.length();
  int m = commonDigits(guessed, triedGuess);
  if (m < correctDigits - missingDigits or m > correctDigits)
    return 0;
  else
    return 1;
}

bool validGuess(int len, string guessed, string &clues, int nAttempt)
{
  stringstream ss;
  ss << clues;
  for (int i = 0; i < nAttempt; i++)
  {
    string triedGuess;
    int correctDigits;
    ss >> triedGuess >> correctDigits;
    if (!comply2Clue(len, guessed, triedGuess, correctDigits))
      return 0;
  }
  return 1;
}

int guess(int len, string guessed, bool &validity, string &clues, int nAttempt)
{
  if (validGuess(len, guessed, clues, nAttempt))
  {
    if (guessed.length() == len)
    {
      stringstream ss;
      ss << guessed;
      int sol;
      ss >> sol;
      return sol;
    }
    else
    {
      for (int i = 0; i < 10; i++)
      {
        stringstream ss;
        ss << guessed << i;
        bool newValidity = 1;
        int newGuess = guess(len, ss.str(), newValidity, clues, nAttempt);
        if (newValidity)
          return newGuess;
      }
      validity = 0;
      return 0;
    }
  }
  else
  {
    validity = 0;
    return 0;
  }
}
