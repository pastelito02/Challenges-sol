/*Dianaata*/
object Kata {
  def expressionMatter(a: Int, b: Int, c: Int): Int = {
  val list = List(a+b+c,a*b*c,(a+b)*c,a*(b+c))
  list.max
  }
}
