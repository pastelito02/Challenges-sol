/*2ScoopsCoops*/
int past(int h, int m, int s) {

  //1second == 1000ms
  //1minute == 60s == 60000ms
  //1h == 60m === 3600s == 3600000ms

  const int oneSec = 1000;
  const int oneMin = 60000;
  const int oneHr = 3600000;

  return (s * oneSec) + (m * oneMin) + (h * oneHr);
}
