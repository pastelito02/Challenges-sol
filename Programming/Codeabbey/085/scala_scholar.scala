//Author scala_scholar
object Solution extends App {
    print((readLine().split(" ").map(_.toInt) match {
        case Array(st, da) => (1 to st).map(_ => readLine().split(" "))
        .map(v => (v(0), v(1).toInt, v(2).toInt))
        .map{case (s, x, y) => (s, math.atan2(y, x) + math.toRadians(da), math.hypot(x, y))}
        .map{case (s, t, r) => (s, math.rint(r * math.cos(t)), math.rint(r * math.sin(t)))}
    }).sortBy(z => z._3 + z._2 / 1000).map(_._1).mkString(" "))
}