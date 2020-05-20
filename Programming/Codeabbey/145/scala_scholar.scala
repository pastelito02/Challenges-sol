//Author scala_scholar
object Solution extends App {
    print((for (_ <- 1 to readLine().toInt) yield readLine().split(" ").map(_.toLong))
    .map{case Array(bas, exp, mod) =>
        val pws = (1 to 63).foldLeft(Array(bas))((a, _) => a :+ a.last * a.last % mod)
        (0 to 63).filter(i => (exp & 1L<<i) != 0).foldLeft(1L)(_ * pws(_) % mod)}
    .mkString(" "))
}