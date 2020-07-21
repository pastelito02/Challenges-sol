class Kata {
  public static function expressionMatter(a: Int, b: Int, c: Int): Int {
    return switch [a, b, c] {
      case [1, _, 1]: a + b + c;
      case [1, _, _]: (a + b) * c;
      case [_, 1, _] if (a < c): (a + b) * c;
      case [_, 1, _]: a * (b + c);
      case [_, _, 1]: a * (b + c);
      case _: a * b * c;
    }
  }
}
