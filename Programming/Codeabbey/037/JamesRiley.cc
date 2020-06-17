//Author JamesRiley
#include <iostream>
#include <fstream>
#include <cmath>

int calculate_c(double p, double r, double l)
{
  r /= 100; //get percentage as a decimal.
  r /= 12; //get monthly interest.
  return std::ceil((p*r) / (1 - std::pow(1+r, -l)));
}

int main()
{
  int p, r, l;
  std::ifstream reader("mortgageCalculator_data.txt");
  reader >> p >> r >> l;
  std::cout << calculate_c(p, r, l) << std::endl;
  return 0;
}
