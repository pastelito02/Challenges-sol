import 'dart:math';

int expressionMatter(int a, int b, int c) {
  return [
    a + b + c,
    a * b + c,
    a + b * c,
    a * b * c,
    (a + b) * c,
    a * (b + c),
  ].reduce(max);
}
