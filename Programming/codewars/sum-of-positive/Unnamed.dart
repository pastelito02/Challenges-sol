import "dart:math";

int positiveSum(List<int> xs) {
  return xs.fold(0, (a, x) => a + max(x, 0));
}
