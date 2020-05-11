//Author kleinar
#include<stdio.h>
#include<iostream>
#include<malloc.h>
#include<math.h>

using namespace std;

int main()
{
  int  N;
  double **mass, AB, BC, AC, p, Xa, Ya, Xb, Yb, Xc, Yc, result = 0;
  scanf("%d", &N);
  mass = (double**)malloc(N * sizeof(double*));
  for(int i = 0; i < N; i++)
  {
    mass[i] = (double*)malloc(N * sizeof(double));
    cin >> mass[i][0] >> mass[i][1];
  }
  Xa = mass[0][0];
  Ya = mass[0][1];
  for(int i = 1; i < N - 1; i++)
  {
    Xb = mass[i][0];
    Yb = mass[i][1];
    Xc = mass[i + 1][0];
    Yc = mass[i + 1][1];
    AB = sqrt((Xb - Xa)*(Xb - Xa) + (Yb - Ya)*(Yb - Ya));
    BC = sqrt((Xc - Xb)*(Xc - Xb) + (Yc - Yb)*(Yc - Yb));
    AC = sqrt((Xc - Xa)*(Xc - Xa) + (Yc - Ya)*(Yc - Ya));
    p = (AB + BC + AC)/2;
    result += sqrt(p*(p - AB)*(p - BC)*(p - AC));
  }
  printf("%lf ", result);
  return 0;
}
