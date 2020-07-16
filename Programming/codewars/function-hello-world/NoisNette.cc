/*NoisNette*/
#include <string>
#include <vector>
using namespace std;

vector<char> getDumbVector() {
  vector<char> dumbass;
  for (int i = 0; i < 12; i++) {
    switch(i) {
      case 0:
        dumbass.push_back('h');
        break;
      case 1:
        dumbass.push_back('e');
        break;
      case 2:
        dumbass.push_back('l');
        break;
      case 3:
        dumbass.push_back('l');
        break;
      case 4:
        dumbass.push_back('o');
        break;
      case 5:
        dumbass.push_back(' ');
        break;
      case 6:
        dumbass.push_back('w');
        break;
      case 7:
        dumbass.push_back('o');
        break;
      case 8:
        dumbass.push_back('r');
        break;
      case 9:
        dumbass.push_back('l');
        break;
      case 10:
        dumbass.push_back('d');
        break;
      case 11:
        dumbass.push_back('!');
        break;
    }
  }
  return dumbass;
}

string greet() {
  vector<char> anotherDumbass = getDumbVector();
  string shtring;
  for (int i = 0; i < anotherDumbass.size(); i++) {
    shtring.push_back(anotherDumbass[i]);
  }
  return shtring;
}
