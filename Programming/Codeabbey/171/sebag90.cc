//Author sebag90
#include <iostream>
#include <sstream>
#include <cmath>
#include <string>

using namespace std;

int main(){
  int limit;
  cin >> limit;
  double pi = (atan(1)*4);
  stringstream results;
  for (int i=0; i<limit; i++){
    double d, sum;
    cin >> d >> sum;

    double h, g, a;
    g = sum - 90;
    a = 180 - 90 - g;
    h = d * ((sin(g* pi /180) / sin(a* pi /180)));
    results << round(h) << " ";
  }
  cout << results.str();
}
