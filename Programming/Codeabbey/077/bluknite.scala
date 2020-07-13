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

trait MultiLineInputs[T] extends BaseProblem with IndividualInputs[T] {
  override def solve(lines: Iterator[String]): String = {
    val n = lines.next().toInt

    def readNLines(n: Int = n, result: List[T] = List()): List[T] =
      if (n == 0) result.reverse
      else readNLines(n - 1, convertStringToInput(lines.next()) :: result)

    val inputs: List[T] = readNLines()

    solveParsedInputs(n, inputs)
  }
}

import ArgumentHelper._
import java.text.DecimalFormat

object Solution extends MultiLineInputs[(LineSegment, Point)] {
  override def convertStringToInput(s: String): (LineSegment, Point) = {
    val List(x1, y1, x2, y2, xp, yp) = s.asList(_.toDouble)
    (LineSegment(Point(x1, y1), Point(x2, y2)), Point(xp, yp))
  }

  override def solveInput(input: (LineSegment, Point)): Any = {
    val (l, point) = input
    formatter.format(l.distanceTo(point))
  }

  val formatter = new DecimalFormat("#.###########")
}

case class Point(x: Double, y: Double) {
  def distanceTo(that: Point): Double = {
    math.sqrt(math.pow(this.x - that.x, 2) + math.pow(this.y - that.y, 2))
  }
}

case class LineSegment(p1: Point, p2: Point) {
  lazy val length: Double = p1.distanceTo(p2)
  lazy val xDiff = p2.x - p1.x
  lazy val yDiff = p2.y - p1.y

  def distanceTo(point: Point): Double = {
    val projection = pointProjection(point)
    val d1 = p1.distanceTo(projection)
    val d2 = p2.distanceTo(projection)
    if (math.abs(d1 + d2 - length) > 0.0000001) math.min(point.distanceTo(p1), point.distanceTo(p2))
    else point.distanceTo(projection)
  }

  private def pointProjection(point: Point): Point = {
    val y = (xDiff * (p1.y * xDiff - p1.x * yDiff) + yDiff * (point.x * xDiff + point.y * yDiff)) / math.pow(length, 2)
    val x = (y * xDiff - p1.y * xDiff + p1.x * yDiff) / yDiff
    Point(x, y)
  }
}