//Author Alex Senchenko
object Solution extends App {
  //auxiliary
  def readLine: String = scala.io.StdIn.readLine

  //reading inputs
  val input: Array[Int] = readLine split " " map (_.toInt)
  val (loan, rate, time): (Int, Int, Int) = (input(0), input(1), input(2))

  //functions
  def mortgage(loan: Int, rate: Int, time: Int): Int = {
    val monthlyRate = rate / 1200.0
    def f(sum: Int, rate: Double, t: Int): Double = sum * rate / (1 - 1/Math.pow(1 + rate, t))
    val rough = f(loan, monthlyRate, time)
    rough.toInt + {if (rough.isWhole()) 0 else 1}
  }
  //calculating results
  val result = mortgage(loan, rate, time)

  //printing result
  val results: String = result.toString
  println(results)

}