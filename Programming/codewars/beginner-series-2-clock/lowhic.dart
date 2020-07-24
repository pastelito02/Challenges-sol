int past(int h, int m, int s) {
  return new Duration(hours: h, minutes: m, seconds: s).inMilliseconds;
}
