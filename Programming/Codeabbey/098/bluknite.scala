//Author bluknite
import scala.io.Source

trait BaseProblem {
  private val lines: Iterator[String] = Source.fromInputStream(System.in).getLines()

  def solve(lines: Iterator[String]): String

  def main(args: Array[String]) {
    val answer: String = solve(lines)
    println(answer)
  }
}

trait TypedInput[T] {
  def convertStringToInput(s: String): T
}

trait IndividualInputs[T] extends TypedInput[T] {
  def solveParsedInputs(n: Int, inputs: List[T]): String = {
    require(n == inputs.size, s"Expected $n inputs. Actual ${inputs.size} inputs.")
    solveInputs(inputs)
  }

  val resultSeparator: String = " "

  val filterOutBlanks: Boolean = false

  def solveInputs(inputs: List[T]): String = {
    val results: List[String] = inputs.map(solveInput).map(_.toString)

    if (filterOutBlanks) results.filterNot(_ == "").mkString(resultSeparator)
    else results.mkString(resultSeparator)
  }

  def solveInput(input: T): Any
}

object ArgumentHelper {
  implicit class SeqWrapper[T](seq: Seq[T]) {
    def toPair: (T, T) = (seq(0), seq(1))
    def toTriplet: (T, T, T) = (seq(0), seq(1), seq(2))
    def toQuartet: (T, T, T, T) = (seq(0), seq(1), seq(2), seq(3))
    def toQuintet: (T, T, T, T, T) = (seq(0), seq(1), seq(2), seq(3), seq(4))
  }

  implicit class StringWrapper(string: String) {
    def toTypedSeq[T](f: (String) => T): Seq[T] = string.split(" ").map(f)
    def toTokens: Seq[String] = toTypedSeq(s => s)
    def toPair[T](f: (String) => T): (T, T) = toTypedSeq(f).toPair
    def toTriplet[T](f: (String) => T): (T, T, T) = toTypedSeq(f).toTriplet
    def toQuartet[T](f: (String) => T): (T, T, T, T) = toTypedSeq(f).toQuartet
    def toQuintet[T](f: (String) => T): (T, T, T, T, T) = toTypedSeq(f).toQuintet
    def asList[T](f: (String) => T): List[T] = toTypedSeq(f).toList
    def asTokensList: List[String] = toTokens.toList
  }
}

object TupleHelper {
  implicit class PairWrapper[T](pair: (T, T)) {
    def map[U](f: (T) => U): (U, U) = (f(pair._1), f(pair._2))
  }

  implicit class TripletWrapper[T](triplet: (T, T, T)) {
    def map[U](f: (T) => U): (U, U, U) = (f(triplet._1), f(triplet._2), f(triplet._3))
  }
}

object Solution extends BaseProblem {
  override def solve(lines: Iterator[String]): String = {
    lines.next()
    def readInstructions(result: List[(Long, Long)]): List[(Long, Long)] = {
      val line = lines.next()
      if (line == "Dig here!") result.reverse
      else readInstructions(decodeInstructions(line) :: result)
    }

    val destination: Point = readInstructions(List())
      .map(polarToCartesian)
      .foldLeft(Point(0, 0))((result, p) => p.add(result))

    destination.toString
  }

  def decodeInstructions(instruction: String): (Long, Long) = {
    val pattern = "go ([0-9]+) feet by azimuth ([0-9]+)".r
    val pattern(feet, azimuth) = instruction
    (feet.toLong, azimuth.toLong)
  }

  import math._
  def polarToCartesian(r: Long, theta: Long): Point = {
    val angle = toRadians(theta) + Pi / 2
    val x = r * cos(angle)
    val y = r * sin (angle)
    Point(-x, y)
  }
  def polarToCartesian(polar: (Long, Long)): Point = polarToCartesian(polar._1, polar._2)

  case class Point(x: Double, y: Double) {
    def add(that: Point): Point = Point(this.x + that.x, this.y + that.y)

    override def toString: String = s"${round(x)} ${round(y)}"
  }
}