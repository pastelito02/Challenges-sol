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

import java.text.DecimalFormat
import Helper0105.Point
import ArgumentHelper._
import scala.annotation.tailrec

object Solution extends BaseProblem {
  override def solve(lines: Iterator[String]): String = {
    val n = lines.next().toInt
    @tailrec
    def readPoints(i: Int = 0, result: List[Point] = List()): List[Point] =
      if (i == n) result.reverse
      else readPoints(i + 1, Point(lines.next()) :: result)
    val points = readPoints()

    formatter.format(polygonArea(points))
  }

  val formatter = new DecimalFormat("#.#######")

  def polygonArea(vertices: List[Point]): Double = {
    val pivot = vertices.head

    @tailrec
    def computeArea(points: List[Point], area: Double = 0): Double = points match {
      case p1 :: p2 :: rest => computeArea(points.tail, triangleArea(pivot, p1, p2) + area)
      case _ => area
    }

    computeArea(vertices.tail)
  }

  def triangleArea(p1: Point, p2: Point, p3: Point): Double = {
    val a = p1.distanceTo(p2)
    val b = p2.distanceTo(p3)
    val c = p3.distanceTo(p1)
    val s = (a + b + c) / 2
    math.sqrt(s * (s - a) * (s - b) * (s - c))
  }
}

object Helper0105 {
  case class Point(x: Int, y: Int) {
    def distanceTo(that: Point): Double = Point.distance(this, that)
  }

  object Point {
    def apply(raw: String): Point = {
      val (x, y) = raw.toPair(_.toInt)
      Point(x, y)
    }

    def distance(p1: Point, p2: Point): Double =
      math.sqrt(math.pow(p1.x - p2.x, 2) + math.pow(p1.y - p2.y, 2))
  }
}
