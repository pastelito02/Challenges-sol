//Author scala_scholar
object Solution extends App {
    print((for (_ <- 1 to readLine().toInt) yield readLine().split(" "))
    .map(v => (v(0).toInt - (if (v(2) == "i") 1 else 0)) % (v(1).toInt + 1)).mkString(" "))
}