//Author scala_scholar
object Solution extends App {
  print((1 to 2).map(_ => readLine()).last.split(" ").map(_.toLong)
  .map(_ match {case mod => var (a, b, n) = (1L, 1L, 1L)
    while (a != 0) { n += 1; b += a; a = (b-a) % mod }
    n}).mkString(" "))
}
