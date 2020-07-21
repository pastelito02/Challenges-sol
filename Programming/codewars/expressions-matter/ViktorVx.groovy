/*ViktorVx*/
class Kata {
  static def expressionMatter(a, b, c) {
    [a*b*c, a*(b+c), (a+b)*c, a+b+c].max()
  }
}
