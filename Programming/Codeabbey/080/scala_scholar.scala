//Author scala_scholar
object Solution extends App {
  print((1 to readLine().toInt).map(_ => readLine().split(" ").map(_.toDouble / 100))
  .map{case Array(pA, pB) => (100 * pA / (pA + pB * (1-pA))).round}.mkString(" "))
}
