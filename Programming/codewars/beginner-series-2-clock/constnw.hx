class Kata {
  public static function past(h: Int, m: Int, s: Int): Int {
    return ((h * 60 + m) * 60 + s) * 1000;
  }
}
