//Author scala_scholar
object Solution extends App {
  print((for (_ <- 1 to readLine().toInt) yield readLine().split(" ").map(_.toDouble))
  .map(v => (v(0) * math.tan(math.toRadians(v(1) - 90))).round).mkString(" "))
}
