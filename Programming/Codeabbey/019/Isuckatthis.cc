#include <iostream>
#include <string>

using namespace std;

bool equalValues(const string line)
{
  int open = 0, close = 0;
  for (size_t i = 0; i < line.length(); i++)
  {
    if (line[i] == '(' || line[i] == '[' || line[i] == '{' || line[i] == '<')
    {
      open++;
    }

    else if (line[i] == ')' || line[i] == ']' || line[i] == '}' || line[i] == '>')
    {
      close++;
    }
  }
  return open == close;
}

bool legalValue(const string line, char lastvalue, char nextvalue)
{
  int place = 0;
  bool cont = 1;
  for (size_t i = 0; i < line.length(); i++)
  {
    place++;
    nextvalue = line[place];
    switch(lastvalue)
    {
    case '(':
      if (nextvalue == ']' || nextvalue == '>' || nextvalue == '}')
      {
        cont = false;
      }

      else if (nextvalue == ')')
      {
        lastvalue = nextvalue;
      }
      break;
    case '[':
      if (nextvalue == ')' || nextvalue == '>' || nextvalue == '}')
      {
        cont = false;
      }

      else if (nextvalue == ']')
      {
        lastvalue = nextvalue;
      }
      break;
    case '<':
      if (nextvalue == ']' || nextvalue == ')' || nextvalue == '}')
      {
        cont = false;
      }

      else if (nextvalue == '>')
      {
        lastvalue = nextvalue;
      }
      break;
    case '{':
      if (nextvalue == ']' || nextvalue == '>' || nextvalue == ')')
      {
        cont = false;
      }

      else if (nextvalue == '}')
      {
        lastvalue = nextvalue;
      }
      break;
    default:
      break;
    }

    switch(nextvalue)
    {
    case '(':
      lastvalue = nextvalue;
      break;
    case '[':
      lastvalue = nextvalue;
      break;
    case '<':
      lastvalue = nextvalue;
      break;
    case '{':
      lastvalue = nextvalue;
      break;
    default:
      break;
    }
  }
  return cont;
}

int main()
{
  int times;
  string line;
  cin >> times;
  cin.ignore();

  for (int i = 0; i < times; i++)
  {
    getline(cin, line);
    if (equalValues(line) && legalValue(line, line[0], ' '))
    {
      cout << "1 ";
    }

    else
    {
      cout << "0 ";
    }
  }
  return 0;
}
