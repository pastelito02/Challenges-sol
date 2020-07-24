/*Dianaata*/
object Kata {

  def past(h: Int, m: Int, s: Int): Int =
    (3_600 * h + 60 * m + s) * 1_000
}
