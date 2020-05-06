//Author rodnixzend
#include <iostream>
#include <vector>
#include <cmath>
#include <string>
using namespace std;
void printStocks(vector<string>&);
int main()
{
  int n;
  vector<string> stocks;
  double data, sum, mean, sdev, comm;
  double values[14];
  string stock;
  cin >> n;
  while (n--) {
    cin >> stock;
    sum = 0;
    for (int i = 0; i < 14; ++i) {
      cin >> data;
      values[i] = data;
      sum += data;
    }
    comm = sum*0.01;
    mean = sum / 14;
    sdev = 0;
    for (int j = 0; j < 14; ++j) {
      sdev += pow((values[j] - mean), 2.0);
    }
    sdev = sqrt(sdev/14)*4;
    if (sdev > comm) {
      stocks.push_back(stock);
    }
  }
  printStocks(stocks);
  cout << endl;
  return 0;
}
void printStocks(vector<string>& funcVec) {
  for (unsigned int k = 0; k < funcVec.size(); ++k) {
    cout << funcVec[k] << " ";
  }
}
